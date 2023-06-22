Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB4573A913
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 21:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjFVTl0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 15:41:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbjFVTl0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 15:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB841BE1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687462839;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uDPZNxjzH+jHNZJo2QpSpUM+1Ny6iijvGtMks4f3Nq8=;
        b=XLwAfcxffZUxgTbYCUfvhBomouBMjOHFzzI0TfcVXAeb1J01hWedTHWXeGD0ZGBxTvbjlJ
        WOD1SJB9znMQuCFMygfYj42Cni9APLLxrj1CXXq9zmzXkLM0CUcV25fAEQj8LIKC5GRnqn
        LqnbtP06fuCIIx614He9NTmRTdpXOcE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-t6yrfDy8Ne673tv7ViHN1A-1; Thu, 22 Jun 2023 15:40:38 -0400
X-MC-Unique: t6yrfDy8Ne673tv7ViHN1A-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-62ff7d8de12so81467086d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 12:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687462837; x=1690054837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDPZNxjzH+jHNZJo2QpSpUM+1Ny6iijvGtMks4f3Nq8=;
        b=aX/swIZ4AsHhnI6eC1jP//EyiAkkLRJISL4VJKcxBRXBZ8wyMTjfdluSlnOzNwla8Z
         hjGIybaswDIuCoIPxQoXR22hiy6x57oPzHkAPU372QXEE9SXy6FtbCfsaFPaJR5QrUIW
         YTbVwxGJ5k6AHxE4XwFT056OF81YLVtwlXSFUSuLm12zh1RWfOtCpe7bHs8DUXtBatbC
         8WTM/9TwcNQkf7U8SMbqTdGxUri325W8MGIN3LR12bnWVHfcbF6C+s/yuG7xgRRmG3L4
         N6AGra8ICI7rID+Q0iwHQVHaGyquayWWPxPrfZggzS9/Kv1/bftontPcOJHgMFMsKC4k
         K5Ww==
X-Gm-Message-State: AC+VfDzk3A3TUZjApiIspeiirW/jNRgZEc8rzMCDtba6OQBsYQgSTA1F
        b7GP1MH0zIEiM+fe8I4LDyzMTwbc7FZ41lOlGMIB7KkaPKIquk+Lw3jwhgs1j7Kcg61y4zBcjH9
        nY04QoDcZJq7PpO6UA0iZcRaD5Q==
X-Received: by 2002:ad4:4eea:0:b0:632:28ab:87ef with SMTP id dv10-20020ad44eea000000b0063228ab87efmr2462859qvb.9.1687462837640;
        Thu, 22 Jun 2023 12:40:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ48ljbTVVqciyrTAaT63ohXJ00bzYVr2e5hnlxltW2yKLyktmAlcIfQrs9LDlnWNwknhydvkg==
X-Received: by 2002:ad4:4eea:0:b0:632:28ab:87ef with SMTP id dv10-20020ad44eea000000b0063228ab87efmr2462833qvb.9.1687462837364;
        Thu, 22 Jun 2023 12:40:37 -0700 (PDT)
Received: from fedora.redhat.com ([107.171.218.122])
        by smtp.gmail.com with ESMTPSA id jo30-20020a056214501e00b006301819be40sm4174183qvb.49.2023.06.22.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 12:40:36 -0700 (PDT)
From:   Adrien Thierry <athierry@redhat.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     Adrien Thierry <athierry@redhat.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v3 1/3] phy: qcom-snps-femto-v2: properly enable ref clock
Date:   Thu, 22 Jun 2023 15:40:18 -0400
Message-Id: <20230622194021.80892-2-athierry@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622194021.80892-1-athierry@redhat.com>
References: <20230622194021.80892-1-athierry@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver is not enabling the ref clock, which thus gets disabled by
the clk_disable_unused initcall. This leads to the dwc3 controller
failing to initialize if probed after clk_disable_unused is called, for
instance when the driver is built as a module.

To fix this, switch to the clk_bulk API to handle both cfg_ahb and ref
clocks at the proper places.

Note that the cfg_ahb clock is currently not used by any device tree
instantiation of the PHY. Work needs to be done separately to fix this.

Link: https://lore.kernel.org/linux-arm-msm/ZEqvy+khHeTkC2hf@fedora/
Fixes: 51e8114f80d0 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 67 ++++++++++++++-----
 1 file changed, 49 insertions(+), 18 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 6c237f3cc66d..ce1d2f8b568a 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -110,11 +110,13 @@ struct phy_override_seq {
 /**
  * struct qcom_snps_hsphy - snps hs phy attributes
  *
+ * @dev: device structure
+ *
  * @phy: generic phy
  * @base: iomapped memory space for snps hs phy
  *
- * @cfg_ahb_clk: AHB2PHY interface clock
- * @ref_clk: phy reference clock
+ * @num_clks: number of clocks
+ * @clks: array of clocks
  * @phy_reset: phy reset control
  * @vregs: regulator supplies bulk data
  * @phy_initialized: if PHY has been initialized correctly
@@ -122,11 +124,13 @@ struct phy_override_seq {
  * @update_seq_cfg: tuning parameters for phy init
  */
 struct qcom_snps_hsphy {
+	struct device *dev;
+
 	struct phy *phy;
 	void __iomem *base;
 
-	struct clk *cfg_ahb_clk;
-	struct clk *ref_clk;
+	int num_clks;
+	struct clk_bulk_data *clks;
 	struct reset_control *phy_reset;
 	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
 
@@ -135,6 +139,32 @@ struct qcom_snps_hsphy {
 	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
 };
 
+static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
+{
+	struct device *dev = hsphy->dev;
+
+	hsphy->num_clks = 2;
+	hsphy->clks = devm_kcalloc(dev, hsphy->num_clks, sizeof(*hsphy->clks), GFP_KERNEL);
+	if (!hsphy->clks)
+		return -ENOMEM;
+
+	/*
+	 * HACK: For cfg_ahb clock, use devm_clk_get_optional() because currently no device
+	 * tree instantiation of the PHY is using the clock. This needs to be fixed in order
+	 * for this code to be able to use devm_clk_bulk_get().
+	 */
+	hsphy->clks[0].id = "cfg_ahb";
+	hsphy->clks[0].clk = devm_clk_get_optional(dev, "cfg_ahb");
+
+	hsphy->clks[1].id = "ref";
+	hsphy->clks[1].clk = devm_clk_get(dev, "ref");
+	if (IS_ERR(hsphy->clks[1].clk))
+		return dev_err_probe(dev, PTR_ERR(hsphy->clks[1].clk),
+				     "failed to get ref clk\n");
+
+	return 0;
+}
+
 static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
 						u32 mask, u32 val)
 {
@@ -165,7 +195,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 					   0, USB2_AUTO_RESUME);
 	}
 
-	clk_disable_unprepare(hsphy->cfg_ahb_clk);
+	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
 	return 0;
 }
 
@@ -175,9 +205,9 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
 
 	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
 
-	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
+	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
 	if (ret) {
-		dev_err(&hsphy->phy->dev, "failed to enable cfg ahb clock\n");
+		dev_err(&hsphy->phy->dev, "failed to enable clocks\n");
 		return ret;
 	}
 
@@ -374,16 +404,16 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
+	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
 	if (ret) {
-		dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
+		dev_err(&phy->dev, "failed to enable clocks, %d\n", ret);
 		goto poweroff_phy;
 	}
 
 	ret = reset_control_assert(hsphy->phy_reset);
 	if (ret) {
 		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ahb_clk;
+		goto disable_clks;
 	}
 
 	usleep_range(100, 150);
@@ -391,7 +421,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 	ret = reset_control_deassert(hsphy->phy_reset);
 	if (ret) {
 		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ahb_clk;
+		goto disable_clks;
 	}
 
 	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
@@ -448,8 +478,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 
 	return 0;
 
-disable_ahb_clk:
-	clk_disable_unprepare(hsphy->cfg_ahb_clk);
+disable_clks:
+	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
 poweroff_phy:
 	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 
@@ -461,7 +491,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
 
 	reset_control_assert(hsphy->phy_reset);
-	clk_disable_unprepare(hsphy->cfg_ahb_clk);
+	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
 	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	hsphy->phy_initialized = false;
 
@@ -554,14 +584,15 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
 	if (!hsphy)
 		return -ENOMEM;
 
+	hsphy->dev = dev;
+
 	hsphy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(hsphy->base))
 		return PTR_ERR(hsphy->base);
 
-	hsphy->ref_clk = devm_clk_get(dev, "ref");
-	if (IS_ERR(hsphy->ref_clk))
-		return dev_err_probe(dev, PTR_ERR(hsphy->ref_clk),
-				     "failed to get ref clk\n");
+	ret = qcom_snps_hsphy_clk_init(hsphy);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
 
 	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 	if (IS_ERR(hsphy->phy_reset)) {
-- 
2.40.1

