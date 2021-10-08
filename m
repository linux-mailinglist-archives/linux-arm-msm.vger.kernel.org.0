Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0C05426C70
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 16:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239526AbhJHOLm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 10:11:42 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:12564 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237929AbhJHOLm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 10:11:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633702186; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/8EcjMMg1fXDPDLBOc9wW9+H+ReFOyGTBHlYqRbS+uA=; b=PA7MAxrDiU2UyYIrm7x+NFSVJi3lbAmB9VARFphf38ZJmH9xeTpFbvHCw+pdRSdwa4gPqR4s
 486Wx742BTJShxhwqsyAzfPtXtoNE3fnaf45XXgaDohOnm8bZYJGk73bt4zFty/2nPMAvV6U
 JghwqieheuxEFcIsoFVCXahHmz4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6160512aff0285fb0a48a209 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Oct 2021 14:09:46
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38215C4361C; Fri,  8 Oct 2021 14:09:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hu-srivasam-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3EAD4C43618;
        Fri,  8 Oct 2021 14:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3EAD4C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        srinivas.kandagatla@linaro.org, rohitkr@codeaurora.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Venkata Prasad Potturu <potturu@codeaurora.org>
Subject: [PATCH v3 4/5] ASoC: codecs: tx-macro: Update tx default values
Date:   Fri,  8 Oct 2021 19:39:03 +0530
Message-Id: <1633702144-19017-5-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
References: <1633702144-19017-1-git-send-email-srivasam@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Update mic control register default values to hardware reset values
lpass sc7280.

Fixes: c39667ddcfc5 (ASoC: codecs: lpass-tx-macro: add support for lpass tx macro)

Signed-off-by: Venkata Prasad Potturu <potturu@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
 sound/soc/codecs/lpass-tx-macro.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index d472af1..6742405 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -272,7 +272,7 @@ struct tx_macro {
 
 static const DECLARE_TLV_DB_SCALE(digital_gain, -8400, 100, -8400);
 
-static const struct reg_default tx_defaults[] = {
+static struct reg_default tx_defaults[] = {
 	/* TX Macro */
 	{ CDC_TX_CLK_RST_CTRL_MCLK_CONTROL, 0x00 },
 	{ CDC_TX_CLK_RST_CTRL_FS_CNT_CONTROL, 0x00 },
@@ -1781,9 +1781,10 @@ static const struct snd_soc_component_driver tx_macro_component_drv = {
 static int tx_macro_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
 	struct tx_macro *tx;
 	void __iomem *base;
-	int ret;
+	int ret, reg;
 
 	tx = devm_kzalloc(dev, sizeof(*tx), GFP_KERNEL);
 	if (!tx)
@@ -1805,6 +1806,20 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	/* Update defaults for lpass sc7280 */
+	if (of_device_is_compatible(np, "qcom,sc7280-lpass-tx-macro")) {
+		for (reg = 0; reg < ARRAY_SIZE(tx_defaults); reg++) {
+			switch (tx_defaults[reg].reg) {
+			case CDC_TX_TOP_CSR_SWR_AMIC0_CTL:
+			case CDC_TX_TOP_CSR_SWR_AMIC1_CTL:
+				tx_defaults[reg].def = 0x0E;
+				break;
+			default:
+				break;
+			}
+		}
+	}
+
 	tx->regmap = devm_regmap_init_mmio(dev, base, &tx_regmap_config);
 
 	dev_set_drvdata(dev, tx);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

