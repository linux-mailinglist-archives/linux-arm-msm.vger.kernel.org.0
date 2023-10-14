Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E957C95BB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Oct 2023 19:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbjJNR26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Oct 2023 13:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbjJNR25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Oct 2023 13:28:57 -0400
Received: from srv01.abscue.de (abscue.de [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39A6DE
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Oct 2023 10:28:53 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id EEDF61C072A;
        Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-088-078-204-065.088.078.pools.vodafone-ip.de [88.78.204.65])
        by srv01.abscue.de (Postfix) with ESMTPSA id 935741C072B;
        Sat, 14 Oct 2023 19:28:51 +0200 (CEST)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH 2/3] ASoC: qcom: q6afe: check ADSP version when setting clocks
Date:   Sat, 14 Oct 2023 19:26:23 +0200
Message-Id: <20231014172624.75301-3-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231014172624.75301-1-otto.pflueger@abscue.de>
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two APIs for setting clocks: the old one that uses
AFE_PARAM_ID_INT_DIGITAL_CDC_CLK_CONFIG and AFE_PARAM_ID_LPAIF_CLK_CONFIG,
and the new one which uses AFE_PARAM_ID_CLOCK_SET.

ADSP firmware version 2.6 only provides the old API, while newer
firmware versions only provide the new API.

Implement LPAIF_BIT_CLK and LPAIF_DIG_CLK for both APIs so that users
don't have to care about the firmware version. Also fall back to
setting AFE_PARAM_ID_INT_DIGITAL_CDC_CLK_CONFIG in q6afe_set_lpass_clock
when setting the new Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
clock is requested to allow specifying it in the device tree on older
platforms too.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 sound/soc/qcom/qdsp6/q6afe.c | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 91d39f6ad0bd..87bdf741e5f6 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -1111,6 +1111,32 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
 	struct q6afe *afe = dev_get_drvdata(dev->parent);
 	struct afe_clk_set cset = {0,};
 
+	/*
+	 * v2 clocks specified in the device tree may not be supported by the
+	 * firmware. If this is the digital codec core clock, fall back to the
+	 * old method for setting it.
+	 */
+	if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7) {
+		struct q6afe_port *port;
+		struct afe_digital_clk_cfg dcfg = {0,};
+		int ret;
+
+		if (clk_id != Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE)
+			return -EINVAL;
+
+		port = q6afe_port_get_from_id(dev, PRIMARY_MI2S_RX);
+		if (IS_ERR(port))
+			return PTR_ERR(port);
+
+		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
+		dcfg.clk_val = freq;
+		dcfg.clk_root = 5;
+		ret = q6afe_set_digital_codec_core_clock(port, &dcfg);
+
+		q6afe_port_put(port);
+		return ret;
+	}
+
 	cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
 	cset.clk_id = clk_id;
 	cset.clk_freq_in_hz = freq;
@@ -1124,6 +1150,41 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
 }
 EXPORT_SYMBOL_GPL(q6afe_set_lpass_clock);
 
+static int q6afe_get_v2_bit_clk_id(struct q6afe_port *port)
+{
+	switch (port->id) {
+	case AFE_PORT_ID_PRIMARY_MI2S_RX:
+	case AFE_PORT_ID_PRIMARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
+	case AFE_PORT_ID_SECONDARY_MI2S_RX:
+	case AFE_PORT_ID_SECONDARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
+	case AFE_PORT_ID_TERTIARY_MI2S_RX:
+	case AFE_PORT_ID_TERTIARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+	case AFE_PORT_ID_QUATERNARY_MI2S_RX:
+	case AFE_PORT_ID_QUATERNARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
+	case AFE_PORT_ID_QUINARY_MI2S_RX:
+	case AFE_PORT_ID_QUINARY_MI2S_TX:
+		return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
+
+	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_PRIMARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_PRI_TDM_IBIT;
+	case AFE_PORT_ID_SECONDARY_TDM_RX ... AFE_PORT_ID_SECONDARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_SEC_TDM_IBIT;
+	case AFE_PORT_ID_TERTIARY_TDM_RX ... AFE_PORT_ID_TERTIARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_TER_TDM_IBIT;
+	case AFE_PORT_ID_QUATERNARY_TDM_RX ... AFE_PORT_ID_QUATERNARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT;
+	case AFE_PORT_ID_QUINARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
+		return Q6AFE_LPASS_CLK_ID_QUIN_TDM_IBIT;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 			  int clk_src, int clk_root,
 			  unsigned int freq, int dir)
@@ -1133,6 +1194,26 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
 	struct afe_digital_clk_cfg dcfg = {0,};
 	int ret;
 
+	if (q6core_get_adsp_version() >= Q6_ADSP_VERSION_2_7) {
+		/* Always use the new clock API on newer platforms. */
+		switch (clk_id) {
+		case LPAIF_DIG_CLK:
+			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
+			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
+			clk_id = Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE;
+			break;
+		case LPAIF_BIT_CLK:
+			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
+			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
+			clk_id = q6afe_get_v2_bit_clk_id(port);
+			if (clk_id < 0)
+				return clk_id;
+			break;
+		default:
+			break;
+		}
+	}
+
 	switch (clk_id) {
 	case LPAIF_DIG_CLK:
 		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
-- 
2.39.2
