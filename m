Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9D9A67CD25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 15:00:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231694AbjAZOAL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 09:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231777AbjAZN7s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 08:59:48 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBED6A712
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:28 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id q5so1901940wrv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 05:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTaA87QpYj0Hccvxw80KUesxovjmXPfEg7HwgSeaScQ=;
        b=URsaELjRqEhjOAT1FJa/ev1zxpWeAFF8XGv+QH2Omde1U5u3d4vXDMCQcOkl3afX1S
         +y838hu79IPBHSYzd8oYvhppnGfnE40U5d3ly7HE/ujSO5A+JTEzly80QOprh5mcODhx
         ms6IDzjP/bdYGZEycOQlgWBekeYLx967USblvU3nwWtpOLb6b6Yt+yeFKV5J12GQk2Gh
         BJjXL+nn9zeIyx1saHxgXAdhQdglTqx/AGsgj5KDa5I4lnpFqcjH7EOzJrfgO3fd1/01
         5UlFEQgAQCKtib8VBFHmXoRSybzdA9TcMtzgbBq6qpuBysi8btKaV8eruVwAJroMzZWt
         FdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTaA87QpYj0Hccvxw80KUesxovjmXPfEg7HwgSeaScQ=;
        b=x37bP6pxA9VwRLaa4vhrOQ5v+s0R4+XsOuWWVcTBkPLQ5fWob+g1xIwQWCe3MxR2Tg
         8yNZe5lwUSkm5V2ScdiO5chNr/XE+AN2EibSUf6r+NN7YnOpFBsUv6BY0987dQBSck9R
         4q9WYZF0fTZ8e9c1pClIGew/N14ibQ8cDasTjmFD7RgGINz1/krjAXgUeMPN4rxKz2q2
         YtQIAJMeQTxbhNbETEMFCuKEjCzYNC073fBGTzhG7qK4a2DfiHRav8aKJEFIQ4r06YvT
         zlP6kIu/GKScWPVD+0fXpQ9a1SaKCAARdJIYRuilKY3yCZS3UEaAixw/3SzoPTwChhqI
         6DdA==
X-Gm-Message-State: AO0yUKUZlQp2ufSHr/mkxJGgK06dyMOkD+OSdCKeoJ8SFG8DvMfXMSZc
        K019ID3UmRwmc+5bxJx3Thaw4w==
X-Google-Smtp-Source: AK7set8Am1+9D/pcuex9EPBOMEbVgzlQMxAh1INAQnKRH5D6aDJJdlB99zj7mjez3xtFhiDUQIOVtQ==
X-Received: by 2002:a05:6000:1b0a:b0:2bf:c968:d181 with SMTP id f10-20020a0560001b0a00b002bfc968d181mr1440833wrz.27.1674741560387;
        Thu, 26 Jan 2023 05:59:20 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id l15-20020a5d6d8f000000b002bfb37497a8sm1594067wrs.31.2023.01.26.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 05:59:19 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "vkoul@kernel.org" <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-phy@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [RFC v2 5/7] phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater
Date:   Thu, 26 Jan 2023 15:59:07 +0200
Message-Id: <20230126135909.1624890-6-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230126135909.1624890-1-abel.vesa@linaro.org>
References: <20230126135909.1624890-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Neil Armstrong <neil.armstrong@linaro.org>

For USB 2.0 compliance, eUSB2 needs a repeater. The PHY needs to
initialize and reset it. So add repeater support

Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
index 23ec162cc3bd..dd53880d5b0e 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
@@ -128,6 +128,8 @@ struct qcom_snps_eusb2_hsphy {
 	struct regulator_bulk_data vregs[EUSB2_NUM_VREGS];
 
 	enum phy_mode mode;
+
+	struct phy *repeater;
 };
 
 static int qcom_snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
@@ -136,7 +138,7 @@ static int qcom_snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int
 
 	phy->mode = mode;
 
-	return 0;
+	return phy_set_mode_ext(phy->repeater, mode, submode);
 }
 
 static void qcom_snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
@@ -235,6 +237,11 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	if (ret)
 		return ret;
 
+	ret = phy_init(phy->repeater);
+	if (ret)
+		dev_err(&p->dev, "repeater init failed. %d\n", ret);
+		goto disable_vreg;
+
 	ret = clk_prepare_enable(phy->ref_clk);
 	if (ret) {
 		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
@@ -342,6 +349,8 @@ static int qcom_snps_eusb2_hsphy_exit(struct phy *p)
 
 	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
 
+	phy_exit(phy->repeater);
+
 	return 0;
 }
 
@@ -386,6 +395,12 @@ static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "failed to get regulator supplies\n");
+
+	phy->repeater = devm_phy_get(dev, "eusb2-repeater");
+	if (IS_ERR(phy->repeater))
+		return dev_err_probe(dev, PTR_ERR(phy->repeater),
+				     "failed to get repeater\n");
+
 	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_eusb2_hsphy_ops);
 	if (IS_ERR(generic_phy)) {
 		dev_err(dev, "failed to create phy %d\n", ret);
-- 
2.34.1

