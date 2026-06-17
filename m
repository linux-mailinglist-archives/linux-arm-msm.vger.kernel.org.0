Return-Path: <linux-arm-msm+bounces-113635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vDneISCZMmpZ2gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:54:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2B7699E0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:54:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=CUFy+HxE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113635-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113635-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C046307A0EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F8FEEA8;
	Wed, 17 Jun 2026 12:53:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DC23F0ABC
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:53:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781700838; cv=none; b=NWU+QCL7yE9TwtKuQO2t4O0cNIh6ewnTsShZtGNwLsdXdtziSiwiAARWyN+3GLqOf4+G6bXoFt+1qs2qalhePUDslMZ/gQSkN+oSaaAWBGSM1i/X1ukh2wJZXjKFUql1yemDgBw+in9UbolPtSQGsUGF1QpJXUdDZH2C6iO+HQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781700838; c=relaxed/simple;
	bh=1k1hTWBhsvuz7qBhsq4vZOAjvZG2XYDxS5bQTpehXyM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UX2tKGp6/0UsqBoayBO6BoUMvRb8VrESTxYZb4h3YulntvZgMKBpwj13OzeE3DD75/hGVZAYdC/vWCmqTxzYP+ZZohp2VtXmB2SJQez7BfKtGG68FEnLXLMRhdoFJqo7qsvWFpU99en4iLYNw+YqASEmNSo1C7RJPhsYa+ZQSTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CUFy+HxE; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4626fdc829aso651648f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781700833; x=1782305633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4JC0EZmfK6Hn6Ifl52FIuxx8uHILRQi+SSQFmpPRZbY=;
        b=CUFy+HxEDDUmBfEcQ4L1yD8lc1ex8UDRU5HuXUo+LA/4SAUourGVzoK8w56Q2rpOr1
         bxPRZxq/1KQLkPBhDW0ReaE8pEfIdOw9E2pKpQqW5RWyGWpAwLjGjRGqNtPsNolV9T8Z
         1+iP8QPUQFyJHL/SJyM93poAX6DRBBPLMgIayu7NKp9pXvjIa5QBMPsP1HrWttxKgbKv
         Vgw4i4k0EEb58+Sx8alUdV7idAZyInpzTY4M0ck5zuBPupdVKQtRgANyBNIaGDsQAogo
         IOwnz10L9Wj+/xn3jcv6cyAEHjEhQtcM/jjD8zYkp5ZNJ3C/gy+enuz5zhi+5HEtnlAO
         dCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700833; x=1782305633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4JC0EZmfK6Hn6Ifl52FIuxx8uHILRQi+SSQFmpPRZbY=;
        b=j8E8A72WB1qCPfFlkR+r40j78M68xLJOZ+/RWiyKBqfkjjDPMLajsq4pTuYl+ILL/2
         9aYJ7mkwD5cehEyGxiqn3UThzG+ta8p5kHIc8iS5Ilwb7uBd4PgVnFfm7d86GkcvCiGs
         sgfmRjINsdOKK4JvEcwJI7tx/GLK55m1+48L7puglHsK9kKcJUvjL241eLe0QbNEO8Mb
         BlE/jDVnZ3TXd7gfr8BJBgXjiA/qbs2d+X+GX1pvPPXbEtTdUGvLgwzRNutIJCXneL6U
         hYdvwROGdh240rKlcL4axUM//B5CuFv0EIcpZH0iCWv+UzU0arKjCxsoB1ZGp7ZDi+bn
         Zqjg==
X-Gm-Message-State: AOJu0YzbaP8J4dB/WeY9sNUmBq5nxLO96ibi6ZS9ps8ohUfyVJQVzl9B
	XjqcVl14+P/QRHcfPr1YD2lW2b+pkAP39zHIYtUK0421omNtL9qbOM9LqdVMYFgrxiI=
X-Gm-Gg: AfdE7cnt+W5e/0paj+KFlyFov2GTTsPr85TYnICV+yrY0pUbbZaiL0ycB5DDWformqB
	DTWdxG2X6p7PclHcp9wfSSfsxL/FIpxHDnKGf4StsLk+45BmsR91I803LiRQuhOPKGZGwBprxZP
	NsnfzW6fnLOvGeI9nquDok5f8GCfuGqVdZPJ0W418i70wm03vCYTOnE5JCgvLISI8kyRTWsV7UG
	00w7J0lelYE3FXPm7LjwiHNw/vRAZ1a4ux1MyzwMQLLU5JNhh/YAcI9fyo4W2jE3fHh+k7qwgHH
	aIicLNKJvvgNEcbZevTp2Uif0PjPDIujZ6vRvo910mzEiqoYoyC0D2twYEdXb/j1MhU9NluleBe
	97Wrbb+JZ3DiaWKeMpnh20WeSt0A2JBomJSSTCDWNPHvtqWl8M/k52sEOJpzKoMOXkt8leV3GST
	ldUKO7qIiWQWcZKWrnTs3X3vCljeuSX9uUdw==
X-Received: by 2002:a05:6000:4b13:b0:462:e086:35f with SMTP id ffacd0b85a97d-462e08603dfmr3975391f8f.21.1781700833320;
        Wed, 17 Jun 2026 05:53:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-462236047c8sm9130562f8f.10.2026.06.17.05.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:53:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 17 Jun 2026 14:53:46 +0200
Subject: [PATCH v4 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-topic-sm8x50-adc5-gen3-v4-2-4af9251731f1@linaro.org>
References: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
In-Reply-To: <20260617-topic-sm8x50-adc5-gen3-v4-0-4af9251731f1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7181;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=1k1hTWBhsvuz7qBhsq4vZOAjvZG2XYDxS5bQTpehXyM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqMpjb7BHRyfXHvtPDO/mPujpqRZL8QKL5XpH2DoS1
 LIn2SjGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCajKY2wAKCRB33NvayMhJ0SwDD/
 0WkmsvvTMjmxK34WGEb5n92bR+lHe6JfMdXIN2qR56E4jDN8GSdcYDgQxk3BDKcDGMu5kaz1ibKMN0
 ZBiVHUiJ0X2cewVlaAEk0ez0eyVjcqnHndqOOy5+AjFQFrlmVVKlw0dMH06pMSnUt+fQem57KHH/Vi
 sHHl7QXxa0NlBF04aA728FzfRpZpo6KW2R6g6lKDg64yophi8mU0az4lIgj7eOni2VMfuihUP3jK/E
 BVYFahwnkzarK0/Y/Z3LVJWR7wmK8XsC1S7+eZBggRApxUwQEy3v+PfQCdQn8GuUqzR0VM95/4mosr
 r+gbty4p3Ic6dXTFx/UHC9ybjQj1B0TOjuI1nXLzCucV3AQEuOVGXGjB7X2x1203MA53Rfxn14ihNv
 xmDXnlqGTkKeflui4/WvYtS2N3kWchNObiqVTAMOvllKCdVficwdZgIeCBJ8fvJU9As766SXbqcZxq
 E58TsaJZXMXrb5lo4RnXCLCjzi6IYtiRnG9J5ZW23dWBfV7qpixSN9BvWLO7hlEnA/ZJT99lFoW9pX
 m15CRBfgk77tX7tB5qqdVchoj9YBmj8w4rqJfrsHYAvtrMaDb9NLd070e+Ba3lhU1Nm9aHWXwT3LmL
 MNV5ufkHuAX+YDva4gf1yCcpNsz4lXvAqMKmdxmQB7W2IDAlr7sN3r1Cz83A==
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
	TAGGED_FROM(0.00)[bounces-113635-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: DD2B7699E0B

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..9356b40a1850 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -205,6 +205,92 @@ platform {
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
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -997,27 +1083,218 @@ led@3 {
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


