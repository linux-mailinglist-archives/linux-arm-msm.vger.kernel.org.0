Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 779B91442F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2020 18:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729121AbgAURSI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 12:18:08 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40239 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728829AbgAURSI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 12:18:08 -0500
Received: by mail-pj1-f66.google.com with SMTP id bg7so1864240pjb.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jan 2020 09:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iSn6IN20MoxHzB1lD/ErRIjslXyhsYmChtFm+zIPC88=;
        b=diXBgKOh4Idku6RcLKqFkHKtFMXMGeaBB7DPqqf3iq4/C8gd2kBGtYCXEYTwIG03om
         cygQ5c/bRvNU4uT9uWW1Q12fHjoW5O+M2unn4TeDYZEkhnISBxAy+0lmOXZPiMDwXSkw
         aRgF4GJ4tCD6g9lPO/X9Ed0wFetF18IPGVOQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iSn6IN20MoxHzB1lD/ErRIjslXyhsYmChtFm+zIPC88=;
        b=qq7L6Iyf+PUSJ8u34Uh/U2fUtg6o2F0+36yeY7y4a7HS06uOUGezvVAR1Rr+augYHq
         aBypEKDTYSxZGPovCXwUa2WNRMkU5MUuuPA2fJVpdF2DtLex2lEz72+wljayp6Ek2kj5
         WwH3yDNm+GMZH0iRRkTdCU5wuwDkG686VKdyO3K+tx6tqv4pvgnIizDVcyYEqu8kprgT
         XwpNGOpybURE+UtD9cb2h4A6aQ9XPk6jj1sXsTZDUoLY4MXv+tYm53HSmsLD/A56tNBo
         mJ09OZaZJOwtSrOVZRU3stObe4S8uckjbRuN+J3+QfT+AFpK4X1cWXjfJuwPe5AhUfmA
         ufuQ==
X-Gm-Message-State: APjAAAWs8GsIwu3o9j9lnEJCgFqgtykSm64JFwzm0aXEy+DKqNomL7Hb
        hnTXvuYRtIjdB12YbKRO50SR0Q==
X-Google-Smtp-Source: APXvYqyJTuPxJLESIg2AAVO+0Qu5kY6kIoqlJxipUD6b6CiCisvbmld+Jtvzj9GY+rYdMIBu198z3g==
X-Received: by 2002:a17:902:8d83:: with SMTP id v3mr6607027plo.282.1579627087560;
        Tue, 21 Jan 2020 09:18:07 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id j8sm27044pjb.4.2020.01.21.09.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 09:18:07 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: Disable pwrkey on Cheza
Date:   Tue, 21 Jan 2020 09:18:06 -0800
Message-Id: <20200121171806.9933-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We don't use the power key from the PMIC on Cheza. Disable this node so
that we don't probe the driver for this device.

Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 arch/arm64/boot/dts/qcom/pm8998.dtsi       | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
index dc2ce23cde05..67283d60e2ac 100644
--- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
@@ -45,7 +45,7 @@ pm8998_pon: pon@800 {
 			mode-bootloader = <0x2>;
 			mode-recovery = <0x1>;
 
-			pwrkey {
+			pm8998_pwrkey: pwrkey {
 				compatible = "qcom,pm8941-pwrkey";
 				interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
 				debounce = <15625>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 7b53b3c7ffe6..a8e9f639a2bb 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -626,6 +626,10 @@ &mdss_mdp {
 	status = "okay";
 };
 
+&pm8998_pwrkey {
+	status = "disabled";
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
Sent by a computer, using git, on the internet

