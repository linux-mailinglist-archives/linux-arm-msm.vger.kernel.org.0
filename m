Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87E36C75AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 03:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229948AbjCXCZu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 22:25:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231300AbjCXCZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 22:25:46 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 757D5F940
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:42 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id c29so417351lfv.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 19:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679624742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaUGpAfwHHLuJ4cZEN8S8oeefubKLZIdqhiP6z3takA=;
        b=JdA/5z0y+gwwYc7DME+UvIPPdcOivs2Oh617/4YEIGSTNXffITV8Ekic0jwt6z5QTj
         znk0j8WQpP2HuTIJzZkvj+U+E/7YiGJp6zBS3SXFnRDgYh0y05VGILyA1TwHyUjOuq34
         WV9kwiroNCVXyxQk4OV8K7ACb8nabhwWPqpHynRvQZO3X5Id6V4a4jHpKsrSJ4UYMzTL
         x8gH3XARAutri3CXEQL0cPmWBU0lztdQhRpFq9ur9OhLv820/sIXcD8wA5+HQ2r0vJt5
         ZZVvJaQa2NtRDYDrTAP/+TQv9zsXhDnmO6yD4/amUMZfbQMMbjP7w8qUXEuUFEmG2MNO
         VDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679624742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EaUGpAfwHHLuJ4cZEN8S8oeefubKLZIdqhiP6z3takA=;
        b=efKMVvqIsRahGxUTqRtZ4LsqmBLwszIwdBWrMaKZumX7SwG39kLr3yJ0PfKf3UXSA1
         zZI8INlhUkVvQFJtWXjj/anyetrcAvovQTehNV6tIoezJAQBI1J84OG3Urs8e3Uf5tww
         ts/H6PpD+pDw1q1WAOJFvSPhqg2rtxLlRgUX7iquZNOevkb+MlGSqT6D8KFGQ3jr1KnS
         QlPL/W0uazlM6kuu9iULG+FzwK76Q2YM48QYzQ6Mr7dJ+QPUqoDJGotMF9RvwsX17Mpe
         Ady+t/tPBQFBp7lnJ+NE3B5QVc4A/jbC1mhKILpScrWuuyni4szcuDFYU+6fnDSG8wXz
         ERow==
X-Gm-Message-State: AAQBX9dtzHilpihdOPF2W/Em/lnGagKqUbD7DgkE2EKTFeifE61il0SJ
        89W7zoVp5TZFAdxEQnrmfzzJCw==
X-Google-Smtp-Source: AKy350YhPs586yx66kOSmXbx9XzEnUifSBWO54ENp173ylvtyHyy8jF9sxGYWjaVJzdzbmwbSxPijw==
X-Received: by 2002:ac2:5301:0:b0:4a4:68b8:c2e4 with SMTP id c1-20020ac25301000000b004a468b8c2e4mr205188lfh.59.1679624741972;
        Thu, 23 Mar 2023 19:25:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x4-20020a19f604000000b004db3aa3c542sm3162628lfe.47.2023.03.23.19.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 19:25:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 24/41] arm64: dts: qcom: sdm845: switch UFS QMP PHY to new style of bindings
Date:   Fri, 24 Mar 2023 05:24:57 +0300
Message-Id: <20230324022514.1800382-25-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
References: <20230324022514.1800382-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the UFS QMP PHY to use newer style of QMP PHY bindings (single
resource region, no per-PHY subnodes).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 062790ef7bc9..6eb82c5641cd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2559,7 +2559,7 @@ ufs_mem_hc: ufshc@1d84000 {
 			      <0 0x01d90000 0 0x8000>;
 			reg-names = "std", "ice";
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
-			phys = <&ufs_mem_phy_lanes>;
+			phys = <&ufs_mem_phy>;
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_PHY_GDSC>;
@@ -2605,10 +2605,8 @@ ufs_mem_hc: ufshc@1d84000 {
 
 		ufs_mem_phy: phy@1d87000 {
 			compatible = "qcom,sdm845-qmp-ufs-phy";
-			reg = <0 0x01d87000 0 0x18c>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			reg = <0 0x01d87000 0 0x1000>;
+
 			clock-names = "ref",
 				      "ref_aux";
 			clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
@@ -2618,14 +2616,7 @@ ufs_mem_phy: phy@1d87000 {
 			reset-names = "ufsphy";
 			status = "disabled";
 
-			ufs_mem_phy_lanes: phy@1d87400 {
-				reg = <0 0x01d87400 0 0x108>,
-				      <0 0x01d87600 0 0x1e0>,
-				      <0 0x01d87c00 0 0x1dc>,
-				      <0 0x01d87800 0 0x108>,
-				      <0 0x01d87a00 0 0x1e0>;
-				#phy-cells = <0>;
-			};
+			#phy-cells = <0>;
 		};
 
 		cryptobam: dma-controller@1dc4000 {
-- 
2.30.2

