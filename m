Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4902C44E69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 23:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbfFMV02 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 17:26:28 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33314 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMV01 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 17:26:27 -0400
Received: by mail-pg1-f196.google.com with SMTP id k187so245711pga.0;
        Thu, 13 Jun 2019 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ShYV+EbWvX524xQNClO0SMbhJ4ngTe/5gGFiTlAJkmg=;
        b=Vvgq/Mm+V/fancK7+K7UPkFQ3psdXXhwC5JkAxICspMq7kY2gLgSdrsO+vCHAfVEbZ
         LapcMhukDXIRIy+jcLWIiHTGLXLaI8sIPFwoR+J9TEDF2mdylpWC9VHBXQMH1j0rL9C9
         JoA8REmTZ3rYc+pHIMkuZekMdCFIvJdMKN0ZMgI+eaxamgczlKLSb9RgkDlxGKhVW4pN
         72nfkRV6Y4Y1yuSLgaHcbGSLyZNByvEEPbC0LmpLUpu/t6ctjVnBATChoZXzrYuZDEyJ
         2lUZc0FLlW9PoyS6MlVZzmvIFgp+o6seHv7B3FNewu+GSndpT3LLXuY1QTVqkXYDTSqT
         g5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ShYV+EbWvX524xQNClO0SMbhJ4ngTe/5gGFiTlAJkmg=;
        b=djGnhoOo+KSsueA486n5bDSpPAmTjkYWLA03wF6dTCEPEVhCSf1TZqXwsf5pqZAsCG
         YyLazTh85eaJYoSlm4BegTQe/09ypG/EN9CITXssRo+4r3q5Dw5A7ymjby6ysQjKXqnZ
         R06iG40n7XDNnUMGNps5qMv98SP9AHASXJF9RZY9oO4GaXQKX1ANknYy39uNhmJCiClR
         HZXxbZ0zM2VcpbIx/DpHyCjzOm2aXise3XZQRSWGrdcveSjniQpPihXA8zJR0gg2LrYY
         dRBlwCo68rYQKxiU4eokjKXe97eaV2iYENwGfdMDegw2VQBMR8oYZ5p5CUQYDso2di10
         bWpA==
X-Gm-Message-State: APjAAAUH2d3SN1yxzXkAOzIRGKZEeBVIUHPtcUtPTuDi6HwrV5FpegWr
        7D1MTKi2kkO8S3J2q/aJPUc=
X-Google-Smtp-Source: APXvYqwju4nXonXbIFupVAkLecu7qM7X3yyfH3DuXuITvGeEeI6MG10718xej5U/1+y/ezG72SeSjQ==
X-Received: by 2002:a17:90a:ca11:: with SMTP id x17mr7624247pjt.107.1560461187181;
        Thu, 13 Jun 2019 14:26:27 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id t18sm758888pgm.69.2019.06.13.14.26.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 14:26:26 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v4 5/7] arm64: dts: msm8998-mtp: Add pm8005_s1 regulator
Date:   Thu, 13 Jun 2019 14:26:23 -0700
Message-Id: <20190613212623.31434-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
References: <20190613212436.6940-1-jeffrey.l.hugo@gmail.com>
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

