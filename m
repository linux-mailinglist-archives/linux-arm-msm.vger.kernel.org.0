Return-Path: <linux-arm-msm+bounces-115904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eJEqKno7Rmq+MQsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:20:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B72C6F5CD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 12:20:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=G8gu3O0i;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115904-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115904-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6D7C0312B716
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72DBC48A2BA;
	Thu,  2 Jul 2026 09:48:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7023D47F2CA
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:48:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985724; cv=none; b=Sa0IlBqa8V8uxRtZnqjBZu3Z8mUbZXxYpmcdSh1NRQ5BojeMJE+UNjBlQScF89zVx3NAO4oi86PZpqmXRFzHZX5NREi9wZ9Se8NYwQo5nAE3BHwbxAJ0TUQzT3Ac6Xb3GseUSW81uGRcqINLoqjpWD9aSkgyjeD9pISH8HHZxSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985724; c=relaxed/simple;
	bh=sTCOiDdPouMd9Hp7hUc7Jv8w7io+JLjHMvadYa9Zp6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyNmjmveTtd3c/5qC+R3VULjEgfEqB1lhV3bcoY3iQ4958WIHdLgJnk2gVVhE9pCTDBxK7EY4OQ6w+v63pKr1mYR4BGvufAvaGws+6hj2qjjZDr36cX06NThaZXXSBAlEKl7yeWwB/scWXS7N0plhw3SoPzo+CliM1uSkmMxTpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G8gu3O0i; arc=none smtp.client-ip=209.85.221.43
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4629051c946so276124f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782985719; x=1783590519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nRgzSQb2zmB8pWFIxx6qvYL4vygtV3dELTMaCNk1AN0=;
        b=G8gu3O0iptI/ZuwhmZr2F/OyA9LjZNuNyQ9PGPx6m9LxDLcJlFUQwUyg06o0zVdvsD
         aIxhBtnwq2fP6nxRwZuSH2u+ciAkmNPgiA0hYpLhUwLfEwG67VSKHl6nQGM4y9n0IU5S
         xzkhqh6B99nSDatoF0tkjo18se1gY9Ch1+hKWQ/t5+q682+D/m7y20XbaEF6B37Ik7V6
         pNv74X91F/j7nREFIntBIx+4eMBxqyy67Ty+sBRO5YManhGzT5vXCI01Dh5rYuUrRZ5M
         h1mzBOGiSqkg7BZes1Lo5ADLeZnJ90R7S/R32H8z9PLdV+0ULfWO56IhaapMF2j9PkyC
         FSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985719; x=1783590519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nRgzSQb2zmB8pWFIxx6qvYL4vygtV3dELTMaCNk1AN0=;
        b=gAusQW3qij0mgeNitpF1cUNZSM5jHJsIJaCtQxWA3G9E1d45c3l4amDyVZpeQysbTP
         yEypwj96NCG7gI3xAoANPWog+Nt4UUeuXMmBsgDE487s2CC/5eKg7lyLcaG8g2/RfY8D
         /lpwOr2moQGNUNaN7994jDxVdUGY5UYCbiQqydgrnEhysgIct/i9mxjaX2zWR9Ggo7gl
         AJHFPs4Iuv2QcnqGQpmEEBhhV3CTmGD453ifUTalp6+WMExsiQ3pCcyF5F90PRkpisqk
         WP7Hyvw+7Lsf8BU4WihgkYrSxandH7DOz7f8LrYoQznqbNqGcD9zX8EaAnTfFC1cQE73
         T+5A==
X-Gm-Message-State: AOJu0Yz0hfKbgw/scpJif0r7wqpm/qlWF0GF1Q7OgsMMhZzdS4JCjfjG
	By575y0MM5hOVcHPVgxowlC/k4mMVi0cQOvfPDVN0/MorPC3RxdLKxGQfZMzHcxIguSORbNf9U0
	1DFCv
X-Gm-Gg: AfdE7ck1qPoBIa3mudDpoDGkKv85ul5xc2KB6g3S3izCgq0kTpx1NpVAjla/Dpy9Kka
	b/IMsfWMAU1KQWn7+IpVU6tVNSwwBGF8mVYfi0lNUbfidEVoiErj47qgCIB/QX+kxNbMU6SXWT+
	bgfUJEhgVBNz+yMfL/s3iujtdsuLogbw7nM24WDR4c+JgE5jITFh4859ia4Dx5sU3D553rZwBL7
	/mm8H5oSRqjy5nMm543gwIUnEkG+ads0urXTwMN/SnzVh8Ouv3fUKND7qfyh0BDUM0FB6A+Qa4g
	qLx18efeNhmcZywre6fzlAqf5d2Fm9B9WBj4fuTzDRN+86OkjZz3YFm/ctcjSHMbKKrHdqNZ66O
	zFRZL0m9IxN7u0KwjGT6+1bPiHmKXk2lS8QFW97im7+vVxM5C8+Y/pROf5gfEUdWlFoTGX+Fk9N
	fVbVvgXHd9QG3cWNb9WUuJIhPXCJCbV+Tdii3fUViT86bm
X-Received: by 2002:a05:6000:4612:b0:474:bbbb:bf17 with SMTP id ffacd0b85a97d-47740c35ff3mr7614587f8f.0.1782985718630;
        Thu, 02 Jul 2026 02:48:38 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4a09sm7656816f8f.13.2026.07.02.02.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:48:38 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 02 Jul 2026 11:48:32 +0200
Subject: [PATCH v5 2/5] arm64: dts: qcom: sm8550-qrd: add SPMI ADC channels
 and thermal nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-topic-sm8x50-adc5-gen3-v5-2-8169953634ad@linaro.org>
References: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
In-Reply-To: <20260702-topic-sm8x50-adc5-gen3-v5-0-8169953634ad@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7160;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sTCOiDdPouMd9Hp7hUc7Jv8w7io+JLjHMvadYa9Zp6Y=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqRjPyPHzcfdTz+rg7t+uEQtpgQVQKLNTTwY+x6a2f
 3bgsX/+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCakYz8gAKCRB33NvayMhJ0V6QEA
 CjN8q8EhuqpB7Gpfzlj1eeyJAv33wqDbTuynkV20JfzVW4b8PB6sGNY55NlJ0p2GZjzUIlapMK14at
 mQZEQwxMSRaaTDRB2n9LjauNX99S6uRnE+R7B6ZYOJIeKdjvS3W0os1I+gnhsuaCBrsyxMUNOJqTwe
 MXb/F7sM3YEgpV2OX1UnAQoug0axbkMKJnHfDINWyjf32pOJ0dQHoi/Z7Bt70ZgthyEly3hLyXLlM1
 1XER/WcTJFxOOC/jRTtnlalz+86E087X9T2sZCq1XcFfDLK3q7poxKwBNpKT6Kdv4cDBKIwbf+h7NJ
 19shOVQCDXYnr5Yvq4zMTyqF6OVoj+1zybK1gUc/ryzze5F8v1Ok7Ik+0gyUfTeJT6fVfJ9KzWGdYP
 MTnQj8YjQFB9DBYmUN5FZeL37WA3VAF//1MaLOVhsDYeqMgpWjtNNBhiYts5RQt8Xdot84pHdcy6I+
 j0IZd6Rrp5lsF0KVTjGR40ac4a4OJhwbDKKAPQ8ZIhmLNeaNckt2p327oB5N8M8UNS6y3VFWg8gydj
 agEVZyKLzCX5/+fNJC9zb457mqrjKAA+VT+ucMlc0+I/wvVZL8rBlk8qzezQM+ytaHljUe+GC4sUnZ
 0J6wJsLV/WCTRY9b25jnp93RqMSR6yHnWmYqzF1xk5+O3LCeIZ28mV/Cy6Ng==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115904-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B72C6F5CD3

Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
other PMICS on the system.

The thermal nodes are sorted by the sensor channel to be
coherent with the system thermal nodes ordering.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 277 ++++++++++++++++++++++++++++++++
 1 file changed, 277 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 2fb2e0be5e4c..6812e45d65e7 100644
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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
+				trip-point0 {
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


