Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18307DAD53
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Oct 2023 17:58:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjJ2Q6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Oct 2023 12:58:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjJ2Q6C (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Oct 2023 12:58:02 -0400
Received: from srv01.abscue.de (abscue.de [IPv6:2a03:4000:63:bf5:4817:8eff:feeb:8ac7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EBCC1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Oct 2023 09:57:54 -0700 (PDT)
Received: from srv01.abscue.de (localhost [127.0.0.1])
        by spamfilter.srv.local (Postfix) with ESMTP id 9F2C01C2591;
        Sun, 29 Oct 2023 17:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
Received: from fluffy-mammal.fritz.box (dslb-088-078-198-137.088.078.pools.vodafone-ip.de [88.78.198.137])
        by srv01.abscue.de (Postfix) with ESMTPSA id 524F61C2590;
        Sun, 29 Oct 2023 17:57:52 +0100 (CET)
From:   =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
To:     linux-arm-msm@vger.kernel.org
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Subject: [PATCH v2 2/4] ASoC: qcom: q6afe: provide fallback for digital codec clock
Date:   Sun, 29 Oct 2023 17:57:14 +0100
Message-Id: <20231029165716.69878-3-otto.pflueger@abscue.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231029165716.69878-1-otto.pflueger@abscue.de>
References: <20231029165716.69878-1-otto.pflueger@abscue.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When q6afe is used as a clock provider through q6afe-clocks.c, it uses
an interface for setting clocks that is not present in older firmware
versions. However, using Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
as the codec MCLK in the device tree can be useful on older platforms
too. Provide a fallback that sets this clock using the old method when
an old firmware version is detected.

MSM8916 did not need this because of a workaround that controls this
clock directly through the GCC driver, but newer SoCs do not have this
clock in their GCC drivers because it is meant to be controlled by the
DSP.

Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
---
 sound/soc/qcom/qdsp6/q6afe.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 91d39f6ad0bd..f14d3b366aa4 100644
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
-- 
2.39.2
