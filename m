Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B25C643809
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732619AbfFMPDI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:03:08 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43032 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732498AbfFMOYM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 10:24:12 -0400
Received: by mail-pl1-f196.google.com with SMTP id cl9so8205938plb.10;
        Thu, 13 Jun 2019 07:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ShYV+EbWvX524xQNClO0SMbhJ4ngTe/5gGFiTlAJkmg=;
        b=L1zNZZk9uMjuMfXNTSlUkZLkI4YcBtVUgCXj9hNNFBBO5tfwafldrgpL1+GdF1ujeD
         d9iAlOezuQq5XlEVLpnCTQC7dsBRXMIhBpFDacXWwTI2Bp3bHt5dC1XPklAh44Ds/Wsa
         sDfFX1FOpMDyUQD59L3a0g8XH6lnUN3IsUx+akVDpc1SKCwm+73ro6bncVAvf4rb4zPC
         aDjmQhBLeUCHxtzDsBWvjfWlSkILEfkJtJSDxn/YloUvHJhgJ0u1PqY+yGZ0ES3rtl4V
         NOqSHEvJfawVZbKVCtBzrOhknWqLqmPFRdDVqWlMwUZXDiAQQEWoenYFLspxTOU7b9bi
         kYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ShYV+EbWvX524xQNClO0SMbhJ4ngTe/5gGFiTlAJkmg=;
        b=L9jTX2/zgVbCCVEPJWIOxyQ9CHUTIl4PvUNqVNPCw/ziA1bM/EkUklYDyL4d13vQcn
         Z7c+NQzfDS4MZL5olHC326VN2FPnSejcoXD+PjNT3kO9mN2SbXbe0wAvETSPf8jHeinv
         aVgrrmFd7g9aEPeMDtW8hxkjhKUDDaEmklvjanO4c5dzrza6qXYGK2PwUD054AJiRqVY
         dcoiq4VQnyph2wA4E/ZuFendtEgD0ApPRjLzMVyFEwUd+yTDcaiTplGK93YP/3kGPkY/
         OYFrx6dGOdA48/MSGdz1Ju2n1PY3X0ojMD3oaOB9vEYf4E6tOeybV88WHRmEZR+6n1OY
         UvGA==
X-Gm-Message-State: APjAAAWPxjvJZWqlIpLMBCO3yw64K/u6edppgUsNdF68UT9ZGgPRV7ru
        MNCJpD125KYCHg5WD16CaWc=
X-Google-Smtp-Source: APXvYqyIC9SaMPkK+UjPu4uYAUDvU9/yCbqojmu6htfcvpr8hV+Dh/XvTVUqLf+IcX4cDaB1EaLDvw==
X-Received: by 2002:a17:902:ab90:: with SMTP id f16mr86452820plr.262.1560435851439;
        Thu, 13 Jun 2019 07:24:11 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id k12sm3128069pfa.159.2019.06.13.07.24.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 07:24:10 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v3 5/7] arm64: dts: msm8998-mtp: Add pm8005_s1 regulator
Date:   Thu, 13 Jun 2019 07:24:04 -0700
Message-Id: <20190613142404.8934-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
References: <20190613142157.8674-1-jeffrey.l.hugo@gmail.com>
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

