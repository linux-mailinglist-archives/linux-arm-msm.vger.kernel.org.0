Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128106A1AF3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 12:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjBXLBU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 06:01:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjBXLAY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 06:00:24 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF68628F4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 03:00:02 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id i3so5915834plg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Feb 2023 03:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iy/081Gnr6V+cD2T3z4UyrGlDr2ZO96fWTmGEselzPk=;
        b=omzwojmBfXLBwxx4m/2TDvoMwMKtFdapI6Cq/+qHa+SFyKZbOknaqo92wLMxB7CSB1
         6EpzY0PP6Cf8SrNlU+kNAVv+huuFoTRF6xgxnT6Ac4NgsqaKsVyWpov8o2cJjw0CJKy1
         LVXXDY2QcSTlOjhmRx+TBomTcxcw+DNlCn2krY1ACefjvd7dtY7QJC06IR+hGu94glFD
         SlckOCApaR6D6BBYs6A4jAvYylEiBRnig3pxU4JbKdEyWg2Dr5EUjBfS3V4ULT0NSQIG
         kcnvoyHNrCoQymPVst8Pb68g7r4y1szcLGmPf2ovZ0BXaOXSww2QGeZtMlHMtRDEjjUQ
         9/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iy/081Gnr6V+cD2T3z4UyrGlDr2ZO96fWTmGEselzPk=;
        b=QVk8W5gWSkGhwAp4hd/GUhgMQUEun9NAKYDoihMk+M6etb83Y94kfuM2p72n7RxJbr
         OkRnQTiDdu+2qiFc9mbpp/Z++h1slt35Nv7ZJ/q740LLwI2zJzN7p++CO3SJDx0Xy7HC
         PLCAbO1OiwzTnc7Kto2yfalIKsAZKXoJeDUsWBF8vbgEdoLyDMGlY7uOIen/9ugIayg4
         3RZwWvoiApHmuQimrrkDz8bP0Vwo8XVScIZkEwV4yeCYiltRwZxIHUTL93CJKh5j+hyT
         VYuW+ZDcjZozoKFKm35wqkh3F4cs1dqIQYIbk7vMroGWG3NEwzUj1wHF2u3DrVROllrH
         wpJg==
X-Gm-Message-State: AO0yUKVgDR/IZce2NPOyyyP77BrQLNuQSoXbbn2ua1xU8mf7gCpzz6SA
        Cb5iNf46aLYslu4hj3x+5hs3
X-Google-Smtp-Source: AK7set8CvCsU4TU+GLe0XMihMpYoLb9sQ6/0LE28lYdVX7+x0QvO0XegHlZ+ZofKIi5yIiueZMEh4Q==
X-Received: by 2002:a17:90b:1bc3:b0:237:8338:ef4c with SMTP id oa3-20020a17090b1bc300b002378338ef4cmr3152906pjb.9.1677236401754;
        Fri, 24 Feb 2023 03:00:01 -0800 (PST)
Received: from localhost.localdomain ([117.217.187.3])
        by smtp.gmail.com with ESMTPSA id gd5-20020a17090b0fc500b00233cde36909sm1263853pjb.21.2023.02.24.02.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 03:00:01 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, lpieralisi@kernel.org, robh@kernel.org,
        kw@linux.com, krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org
Cc:     konrad.dybcio@linaro.org, bhelgaas@google.com, kishon@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 10/13] ARM: dts: qcom: sdx55-t55: Move "status" property down
Date:   Fri, 24 Feb 2023 16:29:03 +0530
Message-Id: <20230224105906.16540-11-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224105906.16540-1-manivannan.sadhasivam@linaro.org>
References: <20230224105906.16540-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To align with rest of the devicetree files, let's move the "status"
property down

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55-t55.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom-sdx55-t55.dts
index 6339af791b0b..67e366700105 100644
--- a/arch/arm/boot/dts/qcom-sdx55-t55.dts
+++ b/arch/arm/boot/dts/qcom-sdx55-t55.dts
@@ -237,9 +237,9 @@ &blsp1_uart3 {
 };
 
 &ipa {
-	status = "okay";
-
 	memory-region = <&ipa_fw_mem>;
+
+	status = "okay";
 };
 
 &pcie_phy {
@@ -278,8 +278,9 @@ nand@0 {
 };
 
 &remoteproc_mpss {
-	status = "okay";
 	memory-region = <&mpss_adsp_mem>;
+
+	status = "okay";
 };
 
 &tlmm {
@@ -308,16 +309,18 @@ wake-pins {
 };
 
 &usb_hsphy {
-	status = "okay";
 	vdda-pll-supply = <&vreg_l4e_bb_0p875>;
 	vdda33-supply = <&vreg_l10e_3p1>;
 	vdda18-supply = <&vreg_l5e_bb_1p7>;
+
+	status = "okay";
 };
 
 &usb_qmpphy {
-	status = "okay";
 	vdda-phy-supply = <&vreg_l4e_bb_0p875>;
 	vdda-pll-supply = <&vreg_l1e_bb_1p2>;
+
+	status = "okay";
 };
 
 &usb {
-- 
2.25.1

