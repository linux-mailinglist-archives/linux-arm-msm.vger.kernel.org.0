Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B2C33826C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 01:33:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231473AbhCLAch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 19:32:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbhCLAcU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 19:32:20 -0500
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE09C061762
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 16:32:19 -0800 (PST)
Received: by mail-oo1-xc2e.google.com with SMTP id j20-20020a4ad6d40000b02901b66fe8acd6so1132064oot.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 16:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vpiFAbc6Uj1QpQm54fJTeQbUXCAmAi96NAe0y5IDSWo=;
        b=aejdvpsEyC/BPed7zecl+iL1hN5CAvgm1psnCqNP9GrIMZ8BMVzDvgFU+w8FXYOX64
         NUg3GDnYBpih6KQ6Ijk6GRZQWDYuy4vs9ZYWsEEs+CnkW3n/2j6HInmSz38XOA/kiGTX
         8Qm0xAX8BLjm5iIzhWV3+VDLuofhsPaAs0JpFiQp1SQZ4CetJflbTwFdvPMivmhRU4Wz
         Z+mu5XpyN1jVwjdySmLHUxgzu4mbiAGPQQfY46Mm5vcoHYUBva1C7Cx71CO3FsC+Lxhi
         X88EWICica45qO9eMI92t6h7QV7ujca1Z5WaTB02yrGXXiGvmT3nPEoa68dHO3ysqowX
         SOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vpiFAbc6Uj1QpQm54fJTeQbUXCAmAi96NAe0y5IDSWo=;
        b=TOlIqHSvySAU/qJQs/QXmByEW4ARB6drXupN1kSSLkW7HTgUAzcdqqIX71SejN7yCL
         mVtuS85ns5MV0gQHAnr6ZFiTqDuMs1KEYWjLghb0TbT6O6WmG12dvijZgqDvtQY1z3V8
         sCbgF4IpVFry6WB7D6OfXL7hKYn/o6AXBnPe1O4MNLO1cJthfmMs01z8MxlaF1Vj7ftj
         3UcG8b+3Q2ZQQDdHSzbNkpwvrCKr0htVBg0bOHowVVbjlmh7X8QwndDOCMhvvU0IA+5k
         fWHLZlbG4DNAUWoaMoakcgqKgZ7g4uLw7nLS4qbM7k6Z0YycWvulAd/I055hrX+iTT3K
         v8jA==
X-Gm-Message-State: AOAM532MusnJlxL5ox8AFGu7cCLof9Dw/9KyGy2YMr5Z6pDcX6RdiFVI
        JpOWwinNOYMrtLHi76h9J8vhLA==
X-Google-Smtp-Source: ABdhPJwV3C0wPBRrcozaVMxaPYrDPhOxXN9oLRcsCz24V/4Of+nC2WLxrO3w9bi8byr52Gwhj+9UZA==
X-Received: by 2002:a4a:e1e4:: with SMTP id u4mr1229682ood.41.1615509139396;
        Thu, 11 Mar 2021 16:32:19 -0800 (PST)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l190sm670835oig.39.2021.03.11.16.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 16:32:19 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org,
        linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: qcom: msm8916: Enable modem and WiFi
Date:   Thu, 11 Mar 2021 16:33:18 -0800
Message-Id: <20210312003318.3273536-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
References: <20210312003318.3273536-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the modem and WiFi subsystems and specify msm8916 specific
firmware path for these and the WCNSS control service.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi     |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 6aef0c2e4f0a..448e3561ef63 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -305,6 +305,12 @@ &mdss {
 	status = "okay";
 };
 
+&mpss {
+	status = "okay";
+
+	firmware-name = "qcom/msm8916/mba.mbn", "qcom/msm8916/modem.mbn";
+};
+
 &pm8916_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
@@ -312,6 +318,8 @@ &pm8916_resin {
 
 &pronto {
 	status = "okay";
+
+	firmware-name = "qcom/msm8916/wcnss.mbn";
 };
 
 &sdhc_1 {
@@ -394,6 +402,10 @@ &wcd_codec {
 	qcom,mbhc-vthreshold-high = <75 150 237 450 500>;
 };
 
+&wcnss_ctrl {
+	firmware-name = "qcom/msm8916/WCNSS_qcom_wlan_nv.bin";
+};
+
 /* Enable CoreSight */
 &cti0 { status = "okay"; };
 &cti1 { status = "okay"; };
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 5353da521974..1118836c15dd 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1738,7 +1738,7 @@ smd-edge {
 
 				label = "pronto";
 
-				wcnss {
+				wcnss_ctrl: wcnss {
 					compatible = "qcom,wcnss";
 					qcom,smd-channels = "WCNSS_CTRL";
 
-- 
2.29.2

