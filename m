Return-Path: <linux-arm-msm+bounces-25377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B299288D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 14:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F76B281FFC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 12:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C4814B06B;
	Fri,  5 Jul 2024 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="5OHvvjoQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354C014A616
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jul 2024 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720183217; cv=none; b=bMPdi8Pld0h/pvUt3KxIfb0+s4ZbZzx9Ngd7u52q9i7tY5dosuhVLTQpbF1cgdSBVTh33Xq9QMhd0tqNzdpeRjVRNAEBx0vSmGlRBubDwzrFOB0gB5fnygncLxdDJDa3Q6meFxGOQ/0ZiH8c92x+o+r+iHBkqwiCayUbITMpZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720183217; c=relaxed/simple;
	bh=Bx/r7C98r8y+Q01nth1t1QOQY/SzRCdAabao15b9jqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=priPQ/vOW7mxP/9MFu3jTe3rgsw/VSFxAQ0mdmppMQum/hz+Q/FoWwGTGMmYVO9hDMGPnfui6IY+T4sb4dodqPFL+fiR4ZwoJEQ+AP5xCpMmcFFUWklOtXQJbNY2dJqs2WdzawNp4hNGciDbbf4H91TqLnCfm/TXS1ySEb8lBlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=5OHvvjoQ; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77d85f7fa3so61795566b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jul 2024 05:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1720183214; x=1720788014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7B3X1HRJq5YzkKC2Hubg20so80avGRngimSnJNAkkXU=;
        b=5OHvvjoQdFgQlXx3FxCIW76glNs9Li9alEOxj0Ll+beW4BJQy5HxQk+6Y7SAolzAF3
         HdRXTO01BvXL58iVmDU4AnL4j+q4BF4qzMZWvzc0A2YZ0XszC5tk/8leYhpxnromS6dq
         M+TuzsJQE0KlW+kUwPxGb9Ip+pPWAnCdNvom0YOcrFIGFavWDvX5cLQ7xVCh1jRz1f3B
         PNov9zWeKT51i8HgPqzM7WSnVbAE68LlhiO1K2UI9Ahh27XNV+zWDf/y2bNZGz8dxfdV
         uWoiaVwZPPhpSPxM+rfx3Z/4rrGyjgg1cIfSSea1QUgmQg1Az6iLvdHdnKSQJCBEqbRz
         0Nvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720183214; x=1720788014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7B3X1HRJq5YzkKC2Hubg20so80avGRngimSnJNAkkXU=;
        b=CKUOpP7oXRqFWSULR4Ws1wrQD2x1wcprUzm/8ca+JJXlTEEs9MjTuxbjTQZRnPikLR
         cO3cilqj2O9B/z8K1FNE/rr4lR8iXU7ph9yayBs/l9WgITIMcQNMC22d+mD9xrXsgo8z
         B5ADuSxRXxxX/1mNWdXYbmyJPg4cGKENtL0KRBtql4ZIPUGGPxYhOwzwK96gDSBWHTCL
         /FNcBJjCWH69bHS//dDeRb9M8mNbBz2s581ZMKkVh+vDCXVugQeHY1bdV6cgtPgmOLKs
         yt/Gdb4laACZX0wbFGaR8d5NW4g0G7zkjRxrKwm9jkUHenBOqmN/eyV4FDg/mW1aYrMB
         vA6A==
X-Forwarded-Encrypted: i=1; AJvYcCURSSuZoaBM38DzfSHZFT6Kcbi0p99LKowvODH1ea4Pxc57vHjFWwyqr9oRkBSi5OWvIFG6NMtyNRF695/oWJYyD365hOBGJD2nT9xxEg==
X-Gm-Message-State: AOJu0Yx8ZnNThTxfYPuGvZcNU/yyuYMZmxkF8XfDzg4n60cgYuS0i/Vb
	WHLkilF3WuyKM0ghojzvmne4XhVNMYIiXXCRCKVNLSrc49fZlSh2jgw5BDFKslHNjv/ML8JpcjE
	L
X-Google-Smtp-Source: AGHT+IFCemR+7bPg60avplVhzqJqo0NQegzU1N1nBVsF47D67mlHLzCuqqmaa0eis18ZgO2OLiFzBw==
X-Received: by 2002:a17:906:f8d4:b0:a77:ba4d:a4ea with SMTP id a640c23a62f3a-a77bda09b81mr331173266b.23.1720183213560;
        Fri, 05 Jul 2024 05:40:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a77d0908f51sm40930666b.125.2024.07.05.05.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 05:40:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 05 Jul 2024 14:40:09 +0200
Subject: [PATCH v2 1/2] arm64: dts: qcom: sm7225-fairphone-fp4: Add PMK8003
 thermals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240705-fp4-thermals-v2-1-a4870a8d084f@fairphone.com>
References: <20240705-fp4-thermals-v2-0-a4870a8d084f@fairphone.com>
In-Reply-To: <20240705-fp4-thermals-v2-0-a4870a8d084f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

Configure the thermals for the XO_THERM thermistor connected to the
PMK8003 (which is called PMK8350 in software).

The ADC configuration for PMK8350_ADC7_AMUX_THM1_100K_PU has already
been added in the past.

The trip points can really only be considered as placeholders, more
configuration with cooling etc. can be added later.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 4e67bb80a026..e263010c348c 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -136,6 +136,18 @@ trip1 {
 				};
 			};
 		};
+
+		xo-thermal {
+			thermal-sensors = <&pmk8350_adc_tm 0>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
 	};
 };
 
@@ -712,6 +724,17 @@ &pm7250b_vbus {
 	status = "okay";
 };
 
+&pmk8350_adc_tm {
+	status = "okay";
+
+	xo-therm@0 {
+		reg = <0>;
+		io-channels = <&pmk8350_vadc PMK8350_ADC7_AMUX_THM1_100K_PU>;
+		qcom,hw-settle-time-us = <200>;
+		qcom,ratiometric;
+	};
+};
+
 &pmk8350_rtc {
 	status = "okay";
 };

-- 
2.45.2


