Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AA6526E54B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 21:19:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgIQTRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 15:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728386AbgIQQSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 12:18:06 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24998C061222
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 09:11:02 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id v23so2555170ljd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2020 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P6sqT1MCRJpn+dChifhEoIiib836AHOxQX3UaUAwb3o=;
        b=t6hNR5V2NowTsaCVqAd/qC8MhGefJzZL57SmOnkwUYaU7obv+GAp5Q5eYprWW7Yr0d
         maEDhlQw7ZcEeFU2Cyx+DEmxAzQoKNzIFy3QANM/3OPzLa9h10ouqM+Nu3+AUfQwmDeJ
         cJee8btkNez7QBwv6Y/Mx37f+1hBn5/8udqVHCROkNqDNImDuYYWQwjuIciWXG9kacBb
         XwH5Tqq9EgO9nR3lEqrjllmOCzXaLdl1wDbBHo1Bkm8icgDbA9sd+bLZA1XWDU99NYr0
         faS3V1GI4+ncjxDQmETFAMIU0VpHgxlRLZaa7A9A9SKML83qw78MnI+VVG61HUMoo3MJ
         8xLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P6sqT1MCRJpn+dChifhEoIiib836AHOxQX3UaUAwb3o=;
        b=XOaYMhJUO4zz/oBMcjgK3g/UPJOededV+T3FwR707wOVCWJDDSXgfup0n1s+u1PE+M
         pqlU2lQ9iOVvDRvnWoIqOQm9IJhwpAxMG8ahYxg7v6tw07MC36prxEyWtkY81C+Tn+E+
         AIl8EZUNn3iMSUSmexIF4ZIMNJqdm0/8JQ21qfxaoBnm84WtJbX+trSTfaVXktnTRNm8
         LhlSqODnDBfojS5DbuDHdIxaPXMzWavaJd9LgTsJnjMctmJ7ilH/NybNqs2hcrKaTlOw
         e87uDGHcl5KreZ/stSzoVwgjgzJeaGvf0wpc2hexLvaAasi6ul4Ku8kOWT8fiVfPf4H/
         iEOQ==
X-Gm-Message-State: AOAM532tsJIsGfbFMdt5VSYU5qWGfAJk+G/g4ysCEAlWeazefjnjaFVX
        TJXo8ut7wHZ0L6ReQE6jGnuN+Qr9TMgrVA==
X-Google-Smtp-Source: ABdhPJxG4REh5MSJ1yWoS+Vry6GbEB1XBpTW8hU/cwUwIhOGZrj4CQdUHMTuvVeoi2OCON4lNZJj1w==
X-Received: by 2002:a2e:994a:: with SMTP id r10mr8082294ljj.102.1600359060138;
        Thu, 17 Sep 2020 09:11:00 -0700 (PDT)
Received: from eriador.lan ([188.162.64.171])
        by smtp.gmail.com with ESMTPSA id m20sm6141851ljp.132.2020.09.17.09.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2020 09:10:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] arm64: qcom: dts: sm8250: add iommu nodes to qup devices
Date:   Thu, 17 Sep 2020 19:10:56 +0300
Message-Id: <20200917161056.3156142-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add IOMMU nodes to QUP devices on SM8250. Without this the board will
reboot on when I2C DMA transfers are used.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 3170a612f65f..6d00cab1553d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -467,6 +467,7 @@ qupv3_id_2: geniqup@8c0000 {
 				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			iommus = <&apps_smmu 0x63 0x0>;
 			ranges;
 			status = "disabled";
 
@@ -673,6 +674,7 @@ qupv3_id_0: geniqup@9c0000 {
 				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			iommus = <&apps_smmu 0x5a3 0x0>;
 			ranges;
 			status = "disabled";
 
@@ -935,6 +937,7 @@ qupv3_id_1: geniqup@ac0000 {
 				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			iommus = <&apps_smmu 0x43 0x0>;
 			ranges;
 			status = "disabled";
 
-- 
2.28.0

