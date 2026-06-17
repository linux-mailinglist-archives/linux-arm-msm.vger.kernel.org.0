Return-Path: <linux-arm-msm+bounces-113636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id e3+cCimZMmpc2gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:55:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E7E699E15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:55:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=jmKTrhqa;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113636-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113636-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03DB33094C90
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3477311946;
	Wed, 17 Jun 2026 12:53:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3643F9268
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:53:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700839; cv=none; b=lHSw7JOsAhI8LrPyY1pUk+9tnEwkJwz5Pzq+VPz5+ZkKVCnkb4UcZBNEdKHFbw0ZZubTWs5TOdN6DUi9wubePib9PL7ZHSjKgP1qXtOnyQ4LYdxO8X60wSsDWHHUyIj/hJFjH5DxMGahTazrHJ7rfu3K4bxwTxV2NGfelewX5y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700839; c=relaxed/simple;
	bh=eKVA40zvNTnz2Uo8qfzsM6JC+f9Jz/GL+8yFunA9mRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XBOxXSEhsYAFR+wh7Of2R7zcsxOk7JY4CJVdWLkZ3r7YX7WRV/W8VEp20PmXQK39LWZ6/yn3dZ5mkt5sbBpvLSxnUj6pKovGEEFGSgSFXFatM7/94VycvKBD6dMx0SyDoslqnQvcK09KB388PPITsiT3H+1UcIigjKrMLdypVR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jmKTrhqa; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-460166910e6so3112033f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700835; x=1782305635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/cmlLxSwWl8MO6GOSzERJUakH1AulLYsReRHOwXA/jA=;
        b=jmKTrhqawcDnpwYXAt8Y23qwFMHx42Aq/E0JHdGiJ3QPn1MiEPr0Bvnc3mfMYLesso
         i3MSyvj4tWJciKPcT0U81FbBZqpD4fLLXyNJdnL2hu/MPwyWdqHiiuiiT3TMz4ZyYAEg
         9LYG4VitUSOpvk7wmGnH/tIwMkbyFlR44lQtJYdK7Tehb7FcD6mRvwS2nOkROYgJSG3u
         8W28eE6lYep/ZhHp2ip6vGsm8Bkhqx3DW+IMtUt1Ius+COZ3GJ8cY2dMVF2A0JETNMsy
         693k33++iUcC7I5C1W3vvMa1yPV/GBw+XdxbCm4bo/PytATAT9yiOp5yBK8xkTivI3G6
         2NOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700835; x=1782305635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/cmlLxSwWl8MO6GOSzERJUakH1AulLYsReRHOwXA/jA=;
        b=fTIKPhcJJrjADYOk3UyEQes226HForb+VzbwtP2cSPSTJF5BovXT1ipgj/sqykvSEo
         FaWg37YpFZzIQZVQAQX/T/qEZu/y3F5xROnrXbvKJD3nKO97bHU931nCBEX/DfAlwRIg
         AalXLS4EKQUCP8YZFsZumHUSOnLEGs7tfHbktfMhoMCbjYsKFAKvYVtM/5CRwAwFJ+K+
         QCzqo7mSM2Jriho5as+XCsYiO3JyyM6JvokUm/7M0q8d/R9/YO0I/L9DZBYnGVgxwfO2
         CGQd3AudUr1KaFMeRdDcHVBX9b5sTUAm6MMzCaLU12kSV223ekbeLMlLWgEIzq0Ftw/L
         YUuA==
X-Gm-Message-State: AOJu0Yz8hVJMV0tBL5XXjsjj7Y7B3Ey19e8c5PMkB3ufnTwedcDwZO8j
	xbHk5DqnucWd9AMPRoqPxQinnhwAqn6FXvnpCYc37ZUapvFOD0msaSzxdSfHvdhqecphRzQO30m
	AJxHQ
X-Gm-Gg: AfdE7cl9tvB5Pcb4U9BPPJ+0xG5spIJLmz32c+KvRSwym3WhyvstWE0gFN8+dr0T6mz
	GptMaOTTH9oqScxLADTGsEvl8IOOSlSexNDM6uoLWs5Gw7qcCa8kSvbpPRw+BBqyogY7p7t+Fe+
	bqanOOID8mXWY4uwncyKwEiJDSJgzlEUEu7jXCf7NzCkrNyu1PHRQwMBXVOiBpOiQrHuYOiSjX0
	SWqXPpOz6Wskpp/dlH4p8r0t/bgekE3pIyR6UHiKEEvgURHQXK4yJDcveF37aeYOseBDDW+43V2
	nHAhUjp/gnBBjNQW4ejdfyjw8a1LO6e96s/ELX7QEFXa/3t+fhscbEKqcbLLT6Ux+Gad3ZJkU6w
	EaErqi+eOzdqpmgHioZaQxtdwXOEzmdQySDo+Uf22T+cJ7f9rUEdSNjE9iALTPCb4ltHs9OCofE
	Y+Q8lmo3SbmBw9VUkmQ7+rQgUd69/WthyRHA==
X-Received: by 2002:a05:6000:43c6:20b0:452:75ca:3fab with SMTP id ffacd0b85a97d-4623955b609mr5441908f8f.38.1781700834871;
        Wed, 17 Jun 2026 05:53:54 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 17 Jun 2026 14:53:47 +0200
Subject: [PATCH v4 3/5] arm64: dts: qcom: sm8550-hdk: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-3-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7139;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=eKVA40zvNTnz2Uo8qfzsM6JC+f9Jz/GL+8yFunA9mRo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjb+D8IpVgXqP8M7eDR+LJNcqFx+CR0grv3wVMG
 qzc0g/mJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY2wAKCRB33NvayMhJ0egoEA
 DKQDDwklmV1808pb1ms/C7FrTRNJBf7F8ZmwMnzOFmlngQws3ykfXsBbtVDZ6c7yuJwVykXYWNDeXN
 ZfVOu+lmd1qh/c41VS4IYoK3IvBHSFUkq9iKgYt4Oz474W/sJTmhBV18uIWs4DQVdNwuoMcxgJZChr
 JssKd9L8ZLDoiVqRIVRLeXX/p0K3PDhOL6XytK2PJVz6eIbgNjmjqjrbvyg+37cTBOHqv27z2m6EQu
 KyMXfS2xhElfctRdI0e72UgetKfqUtd1B2DRYwlzYcC3RAV0QWJ/dFZ0E/lmfdvGCk2AUH5iMPDnls
 RkP60aK8KEaK2kEGLxf6s+dKofAL6hPL4tAkynyurgoiGiZ77bmBg5opi52d0e9YUhxaa48TITA+SF
 A8R1WyfmK0vwmGZJUVIuSRZZJTeV+l19129F8IxjYd4Co33f7FW7ehx4dzXR7fw9b4NnGrZQNVI3XI
 zriaN8/7G3rcqn2PBtCx0/S1cfgBvHUyxucGSzRWPEumlnY9QZ8nUBwYQ+9ot2Raz6QmNsZVFdGZH+
 egRdjpmEJcfoit4RG73dOAhZFOH8xil4Zh6PJpVOWVmpYZhOZ60/aJqLSizv9YglJ3WS68JX8BdoGg
 Btd9y5I86W5+t9NPpPTiKekIFeQs220OsdoXe/W28gL0FZvGSpTcifKij8PA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113636-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neil.armstrong@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89E7E699E15

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..f19419f63e36 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -280,6 +280,92 @@ platform {
 		};
 	};
 
+	thermal-zones {
+		skin-thermal {
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(7)>;
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
+			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX6_THM_100K_PU(7)>;
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
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -1102,27 +1188,218 @@ led@3 {
 	};
 };
 
+&pm8550_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(1)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550b_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_1p8>;
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&pm8550b_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(7)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
 
+&pm8550vs_c_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(2)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_d {
 	status = "okay";
 };
 
+&pm8550vs_d_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(3)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_e {
 	status = "okay";
 };
 
+&pm8550vs_e_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(4)>;
+	io-channel-names = "thermal";
+};
+
 &pm8550vs_g {
 	status = "okay";
 };
 
+&pm8550vs_g_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(6)>;
+	io-channel-names = "thermal";
+};
+
+&pm8550ve_temp_alarm {
+	io-channels = <&pmk8550_vadc ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+	io-channel-names = "thermal";
+};
+
+&pmk8550_vadc {
+	/* PM8550 Channel nodes */
+	channel@100 {
+		reg = <ADC5_GEN3_REF_GND(1)>;
+		label = "pm8550_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@101 {
+		reg = <ADC5_GEN3_1P25VREF(1)>;
+		label = "pm8550_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@103 {
+		reg = <ADC5_GEN3_DIE_TEMP(1)>;
+		label = "pm8550_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@144 {
+		reg = <ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
+		label = "pm8550_msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@145 {
+		reg = <ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
+		label = "pm8550_cam_flash_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@146 {
+		reg = <ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
+		label = "pm8550_wlan_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@147 {
+		reg = <ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
+		label = "pm8550_pa_therm_1";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@148 {
+		reg = <ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		label = "pm8550_rear_tof_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@18e {
+		reg = <ADC5_GEN3_VPH_PWR(1)>;
+		label = "pm8550_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	/* PM8550VS_C Channel nodes */
+	channel@203 {
+		reg = <ADC5_GEN3_DIE_TEMP(2)>;
+		label = "pm8550vs_c_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_D Channel nodes */
+	channel@303 {
+		reg = <ADC5_GEN3_DIE_TEMP(3)>;
+		label = "pm8550vs_d_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_E Channel nodes */
+	channel@403 {
+		reg = <ADC5_GEN3_DIE_TEMP(4)>;
+		label = "pm8550vs_e_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VE Channel nodes */
+	channel@503 {
+		reg = <ADC5_GEN3_DIE_TEMP(PMK8550VE_SID)>;
+		label = "pm8550ve_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550VS_G Channel nodes */
+	channel@603 {
+		reg = <ADC5_GEN3_DIE_TEMP(6)>;
+		label = "pm8550vs_g_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	/* PM8550B Channel nodes */
+	channel@700 {
+		reg = <ADC5_GEN3_REF_GND(7)>;
+		label = "pm8550b_offset_ref";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@701 {
+		reg = <ADC5_GEN3_1P25VREF(7)>;
+		label = "pm8550b_vref_1p25";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@703 {
+		reg = <ADC5_GEN3_DIE_TEMP(7)>;
+		label = "pm8550b_die_temp";
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@747 {
+		reg = <ADC5_GEN3_AMUX4_THM_100K_PU(7)>;
+		label = "pm8550b_usb_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@749 {
+		reg = <ADC5_GEN3_AMUX6_THM_100K_PU(7)>;
+		label = "pm8550b_wls_therm";
+		qcom,ratiometric;
+		/* use the default settle time */
+		qcom,pre-scaling = <1 1>;
+		qcom,adc-tm;
+	};
+
+	channel@78e {
+		reg = <ADC5_GEN3_VPH_PWR(7)>;
+		label = "pm8550b_vph_pwr";
+		qcom,pre-scaling = <1 3>;
+	};
+
+	channel@78f {
+		reg = <ADC5_GEN3_VBAT_SNS_QBG(7)>;
+		label = "pm8550b_vbat_sns_qbg";
+		qcom,pre-scaling = <1 6>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };

-- 
2.34.1


