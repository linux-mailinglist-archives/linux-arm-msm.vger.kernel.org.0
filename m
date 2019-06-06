Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C658537CB8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2019 20:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfFFSwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jun 2019 14:52:30 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:38370 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbfFFSw3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jun 2019 14:52:29 -0400
Received: by mail-pl1-f194.google.com with SMTP id f97so1279320plb.5;
        Thu, 06 Jun 2019 11:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ShYV+EbWvX524xQNClO0SMbhJ4ngTe/5gGFiTlAJkmg=;
        b=nf1Vgu5nL4tLoizqDxbhb3lSAkF7+BQSN8P3rCgdFMiMozj7zIgNZFuExpn2BwEuJg
         Jm8B5wndn617akK85HdovJPPR85poikWLHkpMF2AwuxvpwXN71Uy6fJ2kVVwr+HMpPVS
         bCQBJQOWaXrpKo/mCuoJAJqgU9y5twDOsVzKl57fw2dJfQRg6766632s8jdCgNGBnSIA
         DUL+6Z8kYja5TLQtDNh5l3PybMeyuqRS8Kiv4K19H/YnRI5JluI6upg+L5Qwyenkj1KL
         8ng1EucC4B0QuPX8H50H6AF7yYQdgblWzaXvq/LpYTq50b7p5aSDlCp9TRFy4/+5mfeE
         cWqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ShYV+EbWvX524xQNClO0SMbhJ4ngTe/5gGFiTlAJkmg=;
        b=BCD/CqsevsC5ZsNL0kLRGifFiH9oY37qKqa7YYH3YLv/+1tCf8DMQLAbhLdz234Zy0
         Cgu8g5R7+AEH6eWemyvbI+PU7WBHmz4FA44iipxaNN0KhLK6E/SOIKfJdnpxY4iPS8Ki
         T0RHuupAKuU20toYQtIjaGwb+hh/wzoN8mFKTNm403xN47g30o9Br08u6UX/QpAzfAxU
         LiO1nrGkzuTK5MI7v5YpeKFZwPZT/v1srJ3XW617S+aocG3iZ6Qf/7vjbw6JCYIR5BRd
         S+x5NPvfVETwMeIPMZ1NFAJt19pDzUr4s4JuLxhkfvcCFxyYB9OPOuRALQrnLmR5g/Kr
         BZsA==
X-Gm-Message-State: APjAAAVoLp3Uou+Wm4ydX/su8pdslbr75/p3g3ts7DKUh5MCwZelf3mi
        sfIMrhCzKk1yBcHfiqHV0/E=
X-Google-Smtp-Source: APXvYqyx0gdIdFdS/4/9VKqby1kiCqBbScwjiyBC/xfoXyefv5AaVKvHb4INBDbKvonQF2wCBMlJUw==
X-Received: by 2002:a17:902:3064:: with SMTP id u91mr52245703plb.244.1559847149252;
        Thu, 06 Jun 2019 11:52:29 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d10sm6175332pgh.43.2019.06.06.11.52.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 11:52:28 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jorge.ramirez-ortiz@linaro.org,
        niklas.cassel@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v2 5/7] arm64: dts: msm8998-mtp: Add pm8005_s1 regulator
Date:   Thu,  6 Jun 2019 11:51:03 -0700
Message-Id: <20190606185103.39788-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
References: <20190606184842.39484-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pm8005_s1 is VDD_GFX, and needs to be on to enable the GPU.
This should be hooked up to the GPU CPR, but we don't have support for that
yet, so until then, just turn on the regulator and keep it on so that we
can focus on basic GPU bringup.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index f09f3e03f708..108667ce4f31 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -27,6 +27,23 @@
 	status = "okay";
 };
 
+&pm8005_lsid1 {
+	pm8005-regulators {
+		compatible = "qcom,pm8005-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+
+		pm8005_s1: s1 { /* VDD_GFX supply */
+			regulator-min-microvolt = <524000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-enable-ramp-delay = <500>;
+
+			/* hack until we rig up the gpu consumer */
+			regulator-always-on;
+		};
+	};
+};
+
 &qusb2phy {
 	status = "okay";
 
-- 
2.17.1

