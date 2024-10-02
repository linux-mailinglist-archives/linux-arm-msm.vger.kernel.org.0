Return-Path: <linux-arm-msm+bounces-32938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D8098D3EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 15:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2F3C282DC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9281D015B;
	Wed,  2 Oct 2024 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="K0R8jUkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A63C1CFEBA
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Oct 2024 13:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874080; cv=none; b=cgewc5rcRW3EP4Lieyvkm77ii6KvIpJ5oPLXBrnUVW0d/dfWFHhmkbZ4TuQGCDyt4BTEfGEFZzKLVS2nk1yApVSu/ZUryKKn/o9arcFvj1hcJk/E3zJPSkLKYxPXqpC9X7EJnvOBQ7gJW2C/fQymROsDicPAmb7SbNZLsQ6xs58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874080; c=relaxed/simple;
	bh=/QjBpFhrmOmeosOfMvwUIo9FLzUE5bPMhQOQRRCZooA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tq+88k1HykXXrezveZ8+G169mtRRi/IqJxlF1RWYPXySQa9QeUGcn1e/C/S/zyL8R41VOd3H+birkbPtBan6B0L/EstIjziyJg6Wbr96zMdi8/xTNCw1/aA2ej0ibIAzH5SgEqb5mB81eUmaNxZXcqzGRBrQjZEmYQYxgw5vp6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=K0R8jUkH; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8d51a7d6f5so865048966b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Oct 2024 06:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1727874077; x=1728478877; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AfeSV38OUG/voE55ht69C1F8xZYfSNo6VwhwAM32tmQ=;
        b=K0R8jUkH/SGNVJB3F8HQs8hFd2Acrirde0quIyznaFmpnYO0bCc1RvaIoq7eWcntLN
         TkugBvUsrITZAkxODy6fUep90ZUUN7ErazG6e71LWCl+AJo6UcpPca+XG6jHuiFh6ZVE
         k/inlChdbWDKccxejX7bYIUJhpqhP9aDdBQWZ3wA21mUmhTSzvAg1D+TmArp6tQnVU9z
         0uSv6E4d3U/nStSlKiK+H1c0r3Jd3MZ/sbFIic7+iqj84nww3wwsO5kC5sD1lYumvm18
         tknYSi2gni1SKL/2nK1x2n3rqbj4wB4TxSgzIj/94NYkUhKnJxU80VGny312YZU3h/aA
         40ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874077; x=1728478877;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AfeSV38OUG/voE55ht69C1F8xZYfSNo6VwhwAM32tmQ=;
        b=CKAbOLYKvxgDWkjrp+GnehpXVmlItlATMwurZpKmHuGlmT6NErT/8thX7zGsJ16qr5
         HGPV5+TiGFwteLsD7u4Z0l7UDwZOckBlvYZsElA9AgU3n52x2bzrKaR4QkdUgBxmWoPL
         zWVFliXOICUzseSVy+cw45VBhW5jrNUD5b68NEjkBQW2PS8dabifMh7eSAUMvnKaMoDj
         XW96b3WoZjbSvhMGbweuG4ExaDgMlO3oCJZvsRwsA0sguxIDDTThoUwovOtO81zb1Oqj
         zibX7oURNjb+SjuQEfspQKBx63+gogmaAz3A0bVD9VPVWoaQbZODIuPkqbkyoRy3UPj9
         dn8A==
X-Forwarded-Encrypted: i=1; AJvYcCURIwR+dp/NVLDmca8WD7xDjybG5UPSCc7JLep+FttJsrr9EvSCSvHX9Oq8+51n0fIqmyTjZDfvBf8V3fNc@vger.kernel.org
X-Gm-Message-State: AOJu0YzXz9rK6BL29XheTiLxawLO2/15kdEjTCUhftr+aD7udFe7OU80
	8+IG9CW6m6oY+atqFQ/CAoOdDZVJWMglP1qSncFu7dLna8VJNQhFydJPCDw3CAs=
X-Google-Smtp-Source: AGHT+IHnLf5BxP1P9Lq0X9YhhYqy/NPKZjxOdHrUt5VdcidWqmpwK6Barp9kyk3Sbg1cB4oSHDkArg==
X-Received: by 2002:a17:907:360c:b0:a86:6d39:cbfd with SMTP id a640c23a62f3a-a98f839b81cmr277425866b.57.1727874077242;
        Wed, 02 Oct 2024 06:01:17 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c299e5bbsm866069766b.215.2024.10.02.06.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:01:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 02 Oct 2024 15:01:08 +0200
Subject: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add thermistor
 for UFS/RAM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241002-fp5-ufs-therm-v1-1-1d2d8c1f08b5@fairphone.com>
X-B4-Tracking: v=1; b=H4sIABNE/WYC/x3MMQqAMAxA0atIZgNNqIJeRRzEpppBLa2KIL27x
 fEN/7+QJKok6KsXotya9NgLqK5gXqd9EVRXDGzYkjGMPjR4+YTnKnFD46m1nWscE0NpQhSvz/8
 bxpw/xDQVgV8AAAA=
X-Change-ID: 20241002-fp5-ufs-therm-0f1649d5d212
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Configure the ADC and thermal zone for the thermistor next to the
UFS+RAM chip which is connected to GPIO_12 of PM7250B. It is used to
measure the temperature of that area of the PCB.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 8ab30c01712e0b7c0cc1b403e0fe01650315b9e2..fdc62f1b1c5a398abaa71818fdf2858fdc445d28 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -207,6 +207,20 @@ active-config0 {
 			};
 		};
 
+		mem-thermal {
+			polling-delay-passive = <0>;
+
+			thermal-sensors = <&pm7250b_adc_tm 2>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+
 		pm8008-thermal {
 			polling-delay-passive = <100>;
 			thermal-sensors = <&pm8008>;
@@ -679,6 +693,9 @@ &ipa {
 };
 
 &pm7250b_adc {
+	pinctrl-0 = <&pm7250b_adc_default>;
+	pinctrl-names = "default";
+
 	channel@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;
 		qcom,ratiometric;
@@ -694,6 +711,14 @@ channel@4f {
 		qcom,pre-scaling = <1 1>;
 		label = "conn_therm";
 	};
+
+	channel@53 {
+		reg = <ADC5_GPIO2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		label = "mem_therm";
+	};
 };
 
 &pm7250b_adc_tm {
@@ -712,6 +737,21 @@ conn-therm@1 {
 		qcom,ratiometric;
 		qcom,hw-settle-time-us = <200>;
 	};
+
+	mem-therm@2 {
+		reg = <2>;
+		io-channels = <&pm7250b_adc ADC5_GPIO2_100K_PU>;
+		qcom,ratiometric;
+		qcom,hw-settle-time-us = <200>;
+	};
+};
+
+&pm7250b_gpios {
+	pm7250b_adc_default: adc-default-state {
+		pins = "gpio12";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
 };
 
 &pm7325_gpios {

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241002-fp5-ufs-therm-0f1649d5d212

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


