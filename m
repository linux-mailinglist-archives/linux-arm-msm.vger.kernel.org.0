Return-Path: <linux-arm-msm+bounces-104763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IdpCbiP72nRCwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:32:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE04766FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1BA831E8FA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 16:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF88A35E950;
	Mon, 27 Apr 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sBnZLave"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB54B351C02
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306518; cv=none; b=jObrPvC5tRk9AzmAHI7kFGP9aNmloD9vwVSipaMkgfZZAaIaCYpfkSA2HF3CDjbQm0KNpu12jbwE8VtbBaqQE8KfXMV6GWbAZMyOJLSoflma96UNKV6FzalzBuzvSMhgqqD2E1iEyOygJKmm8KUpGsuG3aT+UL05lHizMFyy5n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306518; c=relaxed/simple;
	bh=gh+gyyibXVgmz6oKLPN+g/HIIFQnoruH6nJZZLk/vMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I5ltQJhFcyITVk5p/GJnDAKOiWY1DDl92Ir/pUG+5wnZEmmzxRKC+1UbB+RWYYFSQko7N8FDD0xSifiDhqwAlcvNeIwILMri+Tg5IIUZ42FKNwmQZ9SiPqeuOw8zpklyG58acf+7k+nT5UoepU+waNf8GkFV6eXifHT1ir7sN+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sBnZLave; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so129662875e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 09:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777306514; x=1777911314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7nHYFe9E6eacQa3hEJLzgoVLJqj03Ug6IiFcdL3B3E=;
        b=sBnZLaverHYKfmio8i569WoYqqoQkndadL0CZgbd4E3tcbdo4EHeJlsRE88zVaJUjr
         drn5ZU0ubv89e+Yt9PTSx75f48641ee/UGIfl+s8hfsetios+Tktl6gdyjcZf9RoQlWm
         dkxlRxq3Cf8PocylFTxC87wC2gltcrFxX2h63mW0dP9j0vKyGucM+MOg1xJJte/a93mf
         cAr8NhypiTseBHMyiaEmnCY8eymsh1cFDKF9eJSjT6qeGGZTNJCLMzQWdsixSQfdQMPb
         j7DnTDVXvwklP5EhVgxGyvwh/IjktTUDHQCAk0G/bAhmxUwfSSwdyiC6liLyunaN9Iti
         NiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777306514; x=1777911314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P7nHYFe9E6eacQa3hEJLzgoVLJqj03Ug6IiFcdL3B3E=;
        b=U/hGvNUyN5gK2y0tHn2wsfZw2zz/LlV0N9rDPSvnXoMXqECxc/J2GP4d0Gn+hzgPBC
         5tAboiGFVMt/tovv1kvEFlsSdab/SBY7qKBNIbxbyK7UrMLBlQLZjPKnQpV8MXJMRq0o
         KqG6o0NJfChAuGMDHLvtBOp5mBqJayK43PIj6NmS/tqBf6zQnfL4YtTJlpEy7cDkMbLP
         nhlN9acmX4i1ykm4LPzsw9csVCnfVWGdeIxx/ZPds3zkNDUGAWuvG75cVByoDnP8ljjZ
         G+vlEIOi8FMSH7VJPy6EZPkMf6E6W7X64RGJS8beM+eKgWi6gMhzvzNgB61aNxEugvx2
         RQVQ==
X-Gm-Message-State: AOJu0YzCzqX3TglozCW1dgYbdvyU1XZ75iZSRjDGYracKlvn3pHvGUDa
	VB27GenQTwpsKtdGSnxhp2q2+yyYd/VQxgmdVtAX9hClHu1xnpQ6RCPx2wMRl6QziOU=
X-Gm-Gg: AeBDieswzejkfzZvF0njyLvB8uZV+K6GDkvN0rsR8ylc8Waebzq8TjznKZKsZg/31TQ
	PIILV0WnriLKmWA5AwTVmOmyXSe/bb7ELlD9wrcNaxIospwhgbRi7bcGgKkU8nQbHqpyT+25Dfl
	9cRYOlr/6VPwFjdvD55o2+USvK909zYOlfglaQI5ulj7pJvqOVA2sPXXg1rIgutQa98CyJExdY0
	pjY630GVLbROQKBf0/ueMGTtdWWsgLLF/rU0eXiVEXZP6KCFl2x35yTtnB1VA7KaJV/QepX5XsV
	mOcBpMXOwawm+hM4KYe4uRdQK0DMg4knvZgkOMPQTci24t9IXLsB2SlZCwHJb3eQaWCFfsArHQw
	3MuYS04LPjr4whA7ALr1COYbfEk7v0+9zqt6XDFuusoYz9bUK2gR3154YuXN5K/VyI/WugavtIK
	7bLzKTDFl+zaTbvOIr5WGMZ80F+F0QOgfMsQLRaOzzaITwZdfelM9IikE=
X-Received: by 2002:a05:600c:5303:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48a76f773d3mr512715e9.19.1777306513974;
        Mon, 27 Apr 2026 09:15:13 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5aa3ae83sm831407275e9.12.2026.04.27.09.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 09:15:13 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 27 Apr 2026 18:15:07 +0200
Subject: [PATCH RFC 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-topic-sm8x50-adc5-gen3-v1-3-8a70f7b90a75@linaro.org>
References: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
In-Reply-To: <20260427-topic-sm8x50-adc5-gen3-v1-0-8a70f7b90a75@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7619;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=gh+gyyibXVgmz6oKLPN+g/HIIFQnoruH6nJZZLk/vMI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp74uM5g9t+edRbUSyWS5F7vCV9zBCRSr35K4ZR4HY
 8qfnN7eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCae+LjAAKCRB33NvayMhJ0b/CD/
 0T0V+Yh0cpUBgyBZJCcqPLAYoO9+O+6NLkUXxzoR+/BjUyaaRsAuhGvqiLFbnFLjaONoDq8p0T0obI
 q+Bv3cTmnj73u+Y/cZs7wa48ofSN953/AWLZT4O3PDN+kodXkZXwmW2uAh/u16oF97nOXnQyxCCidC
 nwk2NfoHJO+OJnx1rh5SVE2I+3UZd8Kec7rBSVcN5sF9MGRbyz3kI4gXjoP2DVUHAmHo6w11cVPgMc
 AUkw0srTCIG8KchK74Ho/3jBXGmYxvVPUdid8uEFlA8sjXho5+5VUYRaEF51g/brSi3zbZGbmQAwt2
 xt99r1jpurlyohRTSUXBdRrcApLOt9AT+vCqWfXAH/9oMppeSn9gps5XgiWwogBt2GKcYHGyHh8F6s
 6yj1OKIQ8W5B17RhIG2iqeWdIKk0MP1wqYSzOobPFgMIcd2ybGhdOQX3rtMzrURCKXfHN87yub0siq
 cRxj7QCWnD9el5wGYp89WwRsxpcZRyUDh/FXVVU0rAuvB6ZXUfVjxD8UoKMjUhdma/u2iqXsA9+CRU
 tpkyOJ8s0ZgCz0Kr1PrvLEqmufsqOsJQ8J+SRf5AbuoeUikzmSKrUGob1AxlVM2xUutR0nkk+oEpSR
 941HoMRr++THykgnacapMeADKdh1Jun4BsyeJp5BgZCGuAwL6typthyS/b6A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Queue-Id: 76AE04766FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104763-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 279 ++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..8405cb9e0d6d 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -17,6 +17,9 @@
 #include "pmk8550.dtsi"
 #include "pmr735d_a.dtsi"
 #include "pmr735d_b.dtsi"
+#include "qcom,pm8550-adc5-gen3.h"
+#include "qcom,pm8550b-adc5-gen3.h"
+#include "qcom,pm8550vx-adc5-gen3.h"
 
 / {
 	model = "Qualcomm Technologies, Inc. SM8550 QRD";
@@ -205,6 +208,92 @@ platform {
 		};
 	};
 
+	thermal-zones {
+		skin-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(1)>;
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
+		cam-flash-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM2_100K_PU(1)>;
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
+		wlan-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM3_100K_PU(1)>;
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
+		pa-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM4_100K_PU(1)>;
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
+		rear-tof-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM5_100K_PU(1)>;
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
+		usb-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(7)>;
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
+		wls-thermal {
+			thermal-sensors = <&pmk8550_vadc PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
+
+			trips {
+				active-config0 {
+					temperature = <125000>;
+					hysteresis = <1000>;
+					type = "passive";
+				};
+			};
+		};
+	};
+
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -997,27 +1086,217 @@ led@3 {
 	};
 };
 
+&pm8550_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550_ADC5_GEN3_DIE_TEMP(1)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550b_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550b_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550B_ADC5_GEN3_DIE_TEMP(7)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
 
+&pm8550vs_c_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VS_ADC5_GEN3_DIE_TEMP(2)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_d {
 	status = "okay";
 };
 
+&pm8550vs_d_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VS_ADC5_GEN3_DIE_TEMP(3)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_e {
 	status = "okay";
 };
 
+&pm8550vs_e_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VS_ADC5_GEN3_DIE_TEMP(4)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_g {
 	status = "okay";
 };
 
+&pm8550vs_g_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VS_ADC5_GEN3_DIE_TEMP(6)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550ve_temp_alarm {
+	io-channels = <&pmk8550_vadc PM8550VE_ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+	io-channel-names = "thermal";
+};
+
+&pmk8550_vadc {
+	/* PM8550 Channel nodes */
+	channel@100 {
+		reg = <PM8550_ADC5_GEN3_REF_GND(1)>;
+		label = "pm8550_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@101 {
+		reg = <PM8550_ADC5_GEN3_1P25VREF(1)>;
+		label = "pm8550_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@103 {
+		reg = <PM8550_ADC5_GEN3_DIE_TEMP(1)>;
+		label = "pm8550_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@18e {
+		reg = <PM8550_ADC5_GEN3_VPH_PWR(1)>;
+		label = "pm8550_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	channel@144 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(1)>;
+		label = "pm8550_msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM2_100K_PU(1)>;
+		label = "pm8550_cam_flash_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM3_100K_PU(1)>;
+		label = "pm8550_wlan_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM4_100K_PU(1)>;
+		label = "pm8550_pa_therm_1";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		reg = <PM8550_ADC5_GEN3_AMUX_THM5_100K_PU(1)>;
+		label = "pm8550_rear_tof_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	/* PM8550VS_C Channel nodes */
+	channel@203 {
+		reg = <PM8550VS_ADC5_GEN3_DIE_TEMP(2)>;
+		label = "pm8550vs_c_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_D Channel nodes */
+	channel@303 {
+		reg = <PM8550VS_ADC5_GEN3_DIE_TEMP(3)>;
+		label = "pm8550vs_d_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_E Channel nodes */
+	channel@403 {
+		reg = <PM8550VS_ADC5_GEN3_DIE_TEMP(4)>;
+		label = "pm8550vs_e_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VE Channel nodes */
+	channel@503 {
+		reg = <PM8550VE_ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+		label = "pm8550ve_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_G Channel nodes */
+	channel@603 {
+		reg = <PM8550VS_ADC5_GEN3_DIE_TEMP(6)>;
+		label = "pm8550vs_g_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550B Channel nodes */
+	channel@700 {
+		reg = <PM8550B_ADC5_GEN3_REF_GND(7)>;
+		label = "pm8550b_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@701 {
+		reg = <PM8550B_ADC5_GEN3_1P25VREF(7)>;
+		label = "pm8550b_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@703 {
+		reg = <PM8550B_ADC5_GEN3_DIE_TEMP(7)>;
+		label = "pm8550b_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@78e {
+		reg = <PM8550B_ADC5_GEN3_VPH_PWR(7)>;
+		label = "pm8550b_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	channel@78f {
+		reg = <PM8550B_ADC5_GEN3_VBAT_SNS_QBG(7)>;
+		label = "pm8550b_vbat_sns_qbg";
+		qcom,pre-scaling = <1 6>;
+	};
+
+	channel@747 {
+		reg = <PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(7)>;
+		label = "pm8550b_usb_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@749 {
+		reg = <PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
+		label = "pm8550b_wls_therm";
+		qcom,ratiometric;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.34.1


