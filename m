Return-Path: <linux-arm-msm+bounces-112990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oLl9Dm8QLWrFaQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:10:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCA167E142
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 10:10:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=NmPTxTMH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eX6gRyvW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112990-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112990-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6328D304C750
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 08:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131503C1991;
	Sat, 13 Jun 2026 08:10:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461583C3425
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781338213; cv=none; b=JXPmjLg1dlUX9kZ4BoleNSEuD3EGbIJL9PZQRWkY6TwBNeBjVrGWlkslKGyAQOqxhlwfq9Y3UHvhYbaEbjFWh+uEhuwf2hsPI5RaPNFShOc6smXKhQw0anmAoo0m9UdcZ93mWZNQ/ROmbZ/X3Cu/mPoJ87tFU9TTsx81iYPFdBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781338213; c=relaxed/simple;
	bh=rQ8xuB4J+WXT2wvFnJ5kvLB9bFovc7E+6VjB6kWfPUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SSV6miGO9T1bzKGD+gthbCKjpW1yS/Ghl2pJlXwmPnfND5CH3etHjzpHk/oocjMLSsKkz5KIbs1hZ6hpLezEg3hGhWSDFlZxNg9owHSlXkuhBN3W9OE3vsVmKBW6uTH2L71DO3yexbe0SMKI7P/Ml6hbRX4HEpWhVvfjtC+VSb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NmPTxTMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eX6gRyvW; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65D6ei6V1764245
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tGh4DFUhGKlawy7UJhBeqNvVy0VePIVrbJI4z+eLSH4=; b=NmPTxTMHh3X8alD6
	KODam319DwAzJ+cR457IyyoUnlimdZZB/rQD6ZwjsoFbZ3PYc1kjI8A3coT5AKcm
	vVHMJpEUpIPBO1u7yQSKNW+MBoAlunV+cnQJmis18O41rHxJOYSVcThT0oekIfHK
	HsEdWX0edn1cu260y90dlTUMruMGsbBU0pjLB2ZeTX/cfH/6G4WK0AcouUzyDLme
	KxF73nPWQ57fQBJKvbxPXFrv92YjWJCVK7V0AbdOXDh/mJ7jkj/1VL/pkwZt3eQM
	xVWN0NSTVYSIaNnoQD7c0mOuDpZaj51m4v6Tt7sFFXVN4dV1KF0BSU4uQRyS5t6q
	AMlA4w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4es0cggd6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 08:10:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85a2f1d1e5so894149a12.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Jun 2026 01:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781338209; x=1781943009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tGh4DFUhGKlawy7UJhBeqNvVy0VePIVrbJI4z+eLSH4=;
        b=eX6gRyvWHpDownEQdflrcbupFf+VBJ3r2Grpjjo6LxSCuWV0tFhwe9pFwSsaL/jUvC
         HKhrgRuiNeGpfDjsHRm29SRJIeLoRoGklsJsmlhNqyMTnM0B0lxDlub2+MA5x+w9iPIs
         20tn0WGp2ccj/psD/UrBeyHvD1hm04He6PLh6fLX1AA5b7L7YDtYzOlGcwhK/BeayXlI
         6ox0/ne0G+evkVAw8pwqQU9/DOOI76xGqsBhewTyjague7Oqvuy/shSYIB7c4FINsqWM
         SxwNu/l//tDL3SpjBNa529Hg051DwFjDjrAzCLngkvFGkuruuLibgXLzw5buxlLGuzvf
         TOhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781338209; x=1781943009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tGh4DFUhGKlawy7UJhBeqNvVy0VePIVrbJI4z+eLSH4=;
        b=gRsyir2lHhL3XYFQ/ht3dFJI7XzdGuFdjXJW+WQPzUWZ2ChPv9gCGCmt5/AKQbHzgZ
         uIrVnwAARmPXPeCD6jVNukyTZ+VlkYJb5Prhq/wHJY96Ju9aRmT/kNL+eZ+gjXU8BfKy
         2MV0ORllmt3fkGlMFzMSg5towCSDX29xmpufMcHFljDuP061cWg9qUXGoafLfFiKXqxT
         3QMKKUWJIhdmCgq+kVfoqvAvwzkd9k7/gtrz/OuXGskgOEGf7MvKF7a8kaVqrAZ5u/hI
         ERR4/gBup4Pv4PzprEk2m3R0k8IVEp5plLX8H4bSETUzhFkEQiKUetAos6ZV6sbEQcc0
         JCOw==
X-Gm-Message-State: AOJu0YwbichrOoT6KgHtoJ50unJN4KKMyb4xQXMfJ21r8t4WpjHtIkIc
	cvIeRg713NroTk4iRglicrk483dabnWu10oXEqG1DJZzTQKCQSq4meuwyWh0rLQcft9uAFwJZDM
	YCdgi9P637LSX1ZTVFBRV++eh0SDesP/nLMrbE8dOaslmrLGa6ZDs2ekPHCIkoaxVSwFO
X-Gm-Gg: Acq92OFm1VqqqUiEzBkSs8W71Bf1t0rMVofbPae5Q5gV3V8VGSxYLoq615NSzyAtkba
	NGfjxLIaEl6wRp1m8oad1oarLSyZ7ki8bArG7h6PUm80sCFK6bpz6JMdlnlPq4m67PGgD/8i2rF
	++4jyy6WKXjhMtnlmQdAUMpbWvWc/msZbJLOom2CSgkPx4RsiPN7QIGnS66CMHyY8zMN7+rTW/6
	NN5kHoz8hqoHbjU6OdURiKMuosgICw5vsUUCvHb9KcrENPXW2U9NQZY2BbBUHvk92AjifKKPAUY
	vW/t9SrwIw1qC417GzNXJwm0Yj+tQ8UUUfyVic6kSOxaJsosP+Aw8uvHSGgEfPPuK8qGsoorwdm
	lU2zc1+vnijG0KBHh9rmcHjQKmiZ9H7Az8lLu4btR
X-Received: by 2002:a05:6a00:1306:b0:843:472b:dba9 with SMTP id d2e1a72fcca58-8434d10739cmr6482603b3a.45.1781338208810;
        Sat, 13 Jun 2026 01:10:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1306:b0:843:472b:dba9 with SMTP id d2e1a72fcca58-8434d10739cmr6482585b3a.45.1781338208360;
        Sat, 13 Jun 2026 01:10:08 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9dc5esm3926647b3a.10.2026.06.13.01.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 01:10:07 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sat, 13 Jun 2026 13:39:23 +0530
Subject: [PATCH 3/4] arm64: dts: qcom: Add PMIC thermal support for Shikra
 CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-shikra_adc_support-v1-3-57d5e6c7f47d@oss.qualcomm.com>
References: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
In-Reply-To: <20260613-shikra_adc_support-v1-0-57d5e6c7f47d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781338189; l=5414;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=rQ8xuB4J+WXT2wvFnJ5kvLB9bFovc7E+6VjB6kWfPUo=;
 b=gqXIOm78flkk7c+DAvGdgGQd2ic3p/zYUEkHP4CIr99djlDKIrjEqzgYBtzh+8fWVIsRaO95f
 bb2lAFtRmzGCobtx+4rLDoLEdAPAjVBjY83rqBgqcXx6Bk8BqHPq+Hq
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: j-VcVkDQq_PF5AGYXycWVmy9s1xefqoH
X-Authority-Analysis: v=2.4 cv=NPLlPU6g c=1 sm=1 tr=0 ts=6a2d1061 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2i55RyfvCxH4uMM4-2wA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: j-VcVkDQq_PF5AGYXycWVmy9s1xefqoH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfXwoFbOgi/fm+o
 EEdAzwrtjp9nF1bofgSC2KFPoYmpWgDFFttDaYZoyzuYgWjVECM7xUx9VMQ+vy/IwPL/qsK29j4
 RLHloNr69shVLMEYhNzHUeFWX2ZqH0o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEzMDA4MSBTYWx0ZWRfX+kiH25ebkBLU
 ghujwjBi4muYHXWOgHxn1ADZpWAbkjwJjOKtuetZ9/CT7THoKGd0SmpiWjkzaUSLVZyhI632QrI
 ZZsy3OiDlP3/uq+Jjm0z+997SKHf+yskcspA7tL2zDWVlmFUgkpEdTpSrYQ322rK0aTOExMqCNo
 q+FFGqyLoOXjSoeo5yaDLZbijpnenbqocwFeNNwyvtxCplpvXsQovfgqAAEoe2FvI4s2jZDkm+6
 uFYscRSKgFXL9vrd2RioEU8RPtbUbfOXq3fXNwAHsb4cml0Z2Ron1DvwLPH82mEvO8z+yAUiMDC
 s8AJFfx6LcJyEggk6JdjOn/9NNfvhFeBpJ16igwM12GH1uQSP09vmbCGNYHszzYkd0FJTLDnYsf
 r8JyXijxtkXijQ125kRn5xy9k2+psCkQDqWFm26E3NXMvOTo2zhhuI6s1hiqQn2CPH0Svwi87wG
 QWptGoXm1wWWK2RHrlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-13_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606130081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112990-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CBCA167E142

Add ADC channels for system thermistors, used for thermal mitigation.
Add ADC thermal bridge nodes for pa/quiet/msm thermistors. Enable temperature
alarm nodes for PM4125 and PM8005. Add thermal zones for temp-alarm devices
and system thermistors exposed as thermal bridge nodes.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 184 +++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..c6c09d773abe 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/iio/qcom,spmi-vadc.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 
 #include "shikra.dtsi"
@@ -27,9 +28,184 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	pm4125_msm_therm_bridge: pm4125-msm-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pm4125_pa_therm_bridge: pm4125-pa-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM1_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	pm4125_quiet_therm_bridge: pm4125-quiet-therm-bridge {
+		compatible = "generic-adc-thermal";
+		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
+		io-channel-names = "sensor-channel";
+		#thermal-sensor-cells = <0>;
+	};
+
+	thermal-zones {
+		pm4125-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_tz>;
+
+			trips {
+				pm4125_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm4125_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+
+				pm4125_trip2: trip2 {
+					temperature = <155000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pm8005-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm8005_tz>;
+
+			trips {
+				pm8005_trip0: trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip1: trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				pm8005_trip2: trip2 {
+					temperature = <145000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+			};
+		};
+
+		sys-1-thermal {
+			polling-delay-passive = <2000>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_pa_therm_bridge>;
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
+		sys-2-thermal {
+			polling-delay-passive = <2000>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_quiet_therm_bridge>;
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
+		sys-3-thermal {
+			polling-delay-passive = <2000>;
+			polling-delay = <0>;
+			thermal-sensors = <&pm4125_msm_therm_bridge>;
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
+};
+
+&pm4125_adc {
+	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	channel@4d {
+		reg = <ADC5_AMUX_THM1_100K_PU>;
+		label = "pa_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4e {
+		reg = <ADC5_AMUX_THM2_100K_PU>;
+		label = "quiet_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@4f {
+		reg = <ADC5_AMUX_THM3_100K_PU>;
+		label = "msm_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@54 {
+		reg = <ADC5_GPIO3_100K_PU>;
+		label = "chgr_skin";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
+
+	channel@55 {
+		reg = <ADC5_GPIO4_100K_PU>;
+		label = "gnss_therm";
+		qcom,ratiometric;
+		qcom,hw-settle-time = <200>;
+		qcom,pre-scaling = <1 1>;
+	};
 };
 
 &pm4125_gpios {
+	pm4125_adc_gpio5_default: pm4125-adc-gpio5-state {
+		pins = "gpio5";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
+	pm4125_adc_gpio6_default: pm4125-adc-gpio6-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-high-impedance;
+	};
+
 	vol_up_n: vol-up-n-state {
 		pins = "gpio9";
 		function = PMIC_GPIO_FUNC_NORMAL;
@@ -45,10 +221,18 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_tz {
+	status = "okay";
+};
+
 &pm8005_regulators {
 	status = "disabled";
 };
 
+&pm8005_tz {
+	status = "okay";
+};
+
 &rpm_requests {
 	regulators {
 		compatible = "qcom,rpm-pm2250-regulators";

-- 
2.43.0


