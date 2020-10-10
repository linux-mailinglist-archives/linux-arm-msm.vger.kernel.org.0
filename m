Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A709628A336
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Oct 2020 01:07:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731363AbgJJW5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 18:57:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730226AbgJJTvA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 15:51:00 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997B3C05BD0C
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2020 06:21:29 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id c21so12264421ljn.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2020 06:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=349Z8Ph6yBAK5DaqmkrRihB7AaoK9dncfuWSdIi4YRA=;
        b=F6pwG5xnwIS2QRHcjIpgatjyzbXe4KUuVV0utR/5y7biA4Pg/xCxPzKaonJ0F/tDZk
         6zvlZtNtI19TOBnaiTwwDlmuDI589fU4fzfz9gUJpyl4KAhsjz43dHRUubg+SeP9iyjR
         I87bvyQk2sInBw0+bF/4wQy4KTLNQqXwmEQ7z3Q7ajwiS9ChHR/6g1y7Iy4gqkql2Fcf
         79hD36EYvSuB8kH40qmuTluW8tV/lGGxP9IX+t40cYQ7C3jmlOPV/uF6Nqzaoj9jCjCT
         d3ATFgdW+rxg7QRePdpC4pBZwlvhN1uYUWJkX2UsOs+PJjzpNhbNod5TZsfkeQWreG7+
         s7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=349Z8Ph6yBAK5DaqmkrRihB7AaoK9dncfuWSdIi4YRA=;
        b=Pp9WdqflIf4JdU8WH+mR2iATw302RsNjBHG3BS5dBeGHaeVPuZEPrmETLrouR6g9Ux
         Qg0qStenKxX5+IF0Ohba6El6S5FkaiXf43bG4W1R8utguy40XFvTqsqSYlDWGpiTnv2I
         U3JEs/qq6biNRSi5CgveYLbfds5IE4sAiRtXI6l9DrkNuDUjO7tczc1+94pHweqMEZZ8
         FDjoxNyujm7spWd3z4rPxieUqaK9TQlcR3uOTljhBNnwROdvyOHwQnNQdU/7MAKUV/B7
         Q7EhTbfw1hpWyOm6Nh29ped5Zbg+CAv/hdeGFyQ3w+hlWj8CZzd6nzJDVy3Y/vvKM7+I
         5Miw==
X-Gm-Message-State: AOAM532LQbIs0Um+/bCybg2i03WxwrDGKuobhpzdu1mCqvXAaf2RRtQX
        V2cOm8QlKh5W2Iby+qHsIkTeVa8HT0WUiUJk
X-Google-Smtp-Source: ABdhPJyhBv0jXoNwaSokzC1b16EMQTYa6HtFHj51sUOzxt1RTcFU5A0ZId0v2CReeT82NhjfCn86oA==
X-Received: by 2002:a2e:8059:: with SMTP id p25mr6484726ljg.291.1602336087853;
        Sat, 10 Oct 2020 06:21:27 -0700 (PDT)
Received: from eriador.lan ([188.162.65.231])
        by smtp.gmail.com with ESMTPSA id k21sm2322685ljb.43.2020.10.10.06.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2020 06:21:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: sm8250: add iommus entry to QUP nodes
Date:   Sat, 10 Oct 2020 16:21:25 +0300
Message-Id: <20201010132125.416064-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable IOMMUs configuration for QUP nodes to stop SM8250 boards from
rebooting when using I2C DMA transfers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 889d11725c5d..ec6cfaaaa971 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -468,6 +468,7 @@ qupv3_id_2: geniqup@8c0000 {
 				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			iommus = <&apps_smmu 0x63 0x0>;
 			ranges;
 			status = "disabled";
 
@@ -674,6 +675,7 @@ qupv3_id_0: geniqup@9c0000 {
 				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			iommus = <&apps_smmu 0x5a3 0x0>;
 			ranges;
 			status = "disabled";
 
@@ -936,6 +938,7 @@ qupv3_id_1: geniqup@ac0000 {
 				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
 			#address-cells = <2>;
 			#size-cells = <2>;
+			iommus = <&apps_smmu 0x43 0x0>;
 			ranges;
 			status = "disabled";
 
-- 
2.28.0

