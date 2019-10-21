Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2FB4DE9B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 12:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728327AbfJUKgQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 06:36:16 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44429 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728323AbfJUKgP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 06:36:15 -0400
Received: by mail-pg1-f196.google.com with SMTP id e10so7540838pgd.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2019 03:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=2IiRgiTM6F9vxDGGzT2NtAOpx6JcpVZXk6Y75BALIx4=;
        b=BjSuOJtK3drQAP8E7EwmzkokCuHGKPJ357gj1CcflWKavwzbuGvGoPsEavjboOpPSn
         t79OVYbPbAK2TUQ/bbC3InUym6paGm7OZbppRpSb0VzwnLrRkmeoHlX9IN8DtUlpYWU9
         Gm3NOAYISoPAFq1TSYaZXr3bjGcnKEgn3UR11mlwYpB9ptJ0QTh2D7iQFOgu5A0IVwp2
         vx6q4T/uhXGj9YOwwe5fj3GhV/pt8gViBuzzG0rNT/fJIWhdLBu7251pq0X8/Bor1nG3
         RexJMFNN6rxZOoQGNr9x5uc2BXJ3Hv9Ezt68ET2UqG9gXXHd0ChHK2+QPf4rv+cEYAWv
         6Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=2IiRgiTM6F9vxDGGzT2NtAOpx6JcpVZXk6Y75BALIx4=;
        b=pGr4kQaDrckkFUNLAm6iiSUNsa457ZmoEdFv5jpu+M1aQ8Wdc+iotmHgu/3C5oys/k
         YjTO5QAghwGFBhZFy+v+Tzgn5mtR9alCSyKySh76BDrAVb0la2MDk161Lf25s6IaqfL3
         vQ7BNoC6vIL2K1JgmFesH6xactlEieQw/Q2eCAoggUkFIuiBNrH0p8qDJAY6LosW0xBQ
         Lvtnq216eGi1tqfMGuPxURah/dQ56rstyoTPmffKvUno27gKDsyhEWoRGV0MSVt1rQg3
         nLgJEoqsGzAtYn+ywj+Cg4U08MtKJdYtkFWlK28MF0KM2YLGX64bMym2ldlvI326ZzrM
         c90w==
X-Gm-Message-State: APjAAAXiIzcG2XCro3VT8E2siOfgQRSgL4eqHQMx6mSq6+1kBczQuHbj
        VAbQYjNrZc5Oz3LS6Y8WbpM/Jg==
X-Google-Smtp-Source: APXvYqw1fEzQjhS+g3UEeDIGHuYnFx7WoBGPaKuPP90vouHu1+lQZ3qQaJbJvcyEOagIJpn0waN5kw==
X-Received: by 2002:a63:f743:: with SMTP id f3mr25362784pgk.410.1571654174769;
        Mon, 21 Oct 2019 03:36:14 -0700 (PDT)
Received: from localhost ([49.248.62.222])
        by smtp.gmail.com with ESMTPSA id v9sm14754293pfe.109.2019.10.21.03.36.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:36:14 -0700 (PDT)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, edubezval@gmail.com, agross@kernel.org,
        masneyb@onstation.org, swboyd@chromium.org, julia.lawall@lip6.fr,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v6 09/15] arm64: dts: msm8996: thermal: Add interrupt support
Date:   Mon, 21 Oct 2019 16:05:28 +0530
Message-Id: <b42e18096b81abaaabe1822e75f1882781467c71.1571652874.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1571652874.git.amit.kucheria@linaro.org>
References: <cover.1571652874.git.amit.kucheria@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register upper-lower interrupts for each of the two tsens controllers.

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 87f4d9c1b0d4c..4ca2e7b44559c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -591,6 +591,8 @@
 			reg = <0x4a9000 0x1000>, /* TM */
 			      <0x4a8000 0x1000>; /* SROT */
 			#qcom,sensors = <13>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -599,6 +601,8 @@
 			reg = <0x4ad000 0x1000>, /* TM */
 			      <0x4ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
+			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "uplow";
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.17.1

