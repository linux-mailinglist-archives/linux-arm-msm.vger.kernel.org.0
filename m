Return-Path: <linux-arm-msm+bounces-112078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h5LCL53aJ2q43QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:19:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C0165E3FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:19:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cEGQVBro;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="LyO/UCY1";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112078-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112078-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E079C30B9259
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1AB3DDDA6;
	Tue,  9 Jun 2026 09:12:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A603F164A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:12:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996337; cv=none; b=uLNu7/f8ccvx9ORzSIy1GXtdLw8tkGAXp0FZT1JpCmH16pJBzuvlhi6QNy6iGxAu1+LNlWfPaknOT1cwvV5mLWUsbBkOJeXV4vtGQJ0s3jEL4qlgNrAlFH+DdyrqAXd0mpu3+CsunPG+L95wcSDD0W23O/cZCgaRCeo1VTVfcdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996337; c=relaxed/simple;
	bh=VnL/S3vPgmayRLFDfwITKnGQpEOa78OA1ybDeKmfK9s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hKEl+NMdJnuvpI4a02pu9g68j/mRhExFvP2AF5dBY3Y50UuAwufMDu+1x9hpmd5c13jqA1T3e1w2k1s3rPXhF+sUqywuQg6zj1OcDHdcCUwl0diLSL9MQkBkGN2oZnIJ+i1runYZI6hCvgaUOFRUprpDBwuAbNIK5uFTjwj8V2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cEGQVBro; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyO/UCY1; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65985YPt007036
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TlfhGqGgTKnIq2yjfl/V9swsRpNHZ9GFfY9
	HXAYAWbQ=; b=cEGQVBroHvmTXeBtJpyG3QcBJLbPeI+zJGlJ33GGmICLIzLBGoI
	H9zGtd3wkDevDPU/DNkyL+JwGzl/fIeVAS8OvtQVXqif5Gws05oT7E9/7V4bgX52
	rk4Xb2ZpsTFKPZL1+o4wMOSTFbYlS810fU7MnQ74cYbz72dkGSqDIwLMb9o6mAjp
	QcMGQjWMTHKRVO6F6dQ6AhLKCu7FZeqlJAD4mzcceUhFzIlXT4JsNKga/cR2rt6Z
	nVpOr5/x9B7Bu6r47tGJOMFR8pkQs5bVHuthEDCoqdaVRPmOFT6UcZW5k3XN8hI+
	PM4aJPcd4jpJ4gvlSiHXj5yAZkpTfjFFQqw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epf0sr92r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:12:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a236220so104988771cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780996335; x=1781601135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TlfhGqGgTKnIq2yjfl/V9swsRpNHZ9GFfY9HXAYAWbQ=;
        b=LyO/UCY1wpgDRA7e0Wx37M1VN9a0jshh+diQjR0zpFIBG5frlgpj6SRs+zYfXeysly
         +LgqZO0+KjFClBUvqQGxHEihS9j+Zunds6FpTcdV5yxgT9I1VnzD16J1Al5rvNfkzhof
         GqWcqXUNn0QatGxRk3dL4ptOuAOz0YdWwZzD/HrCCDxfQc8Fi7mNhWiemYtCPWK31RJS
         gIf47upH6elCU1TPvBChl9uf04XYNxS6k6fyUd7d9bTZ+zccejTlt6/bPpsBHVr5JUFl
         wKRcI4QQP3RC2WSA6GCnnKhgTTWzcPCtdMyZJHqUYMYw1zg+FiJZuJ723AeRNkIAKK+9
         V//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996335; x=1781601135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlfhGqGgTKnIq2yjfl/V9swsRpNHZ9GFfY9HXAYAWbQ=;
        b=FpzOLzA4ZZzf4tTRRxUleBKQgpGkmoaeDE1lW1ydduzwTZ5XDScd6vj08qP1sHfmAp
         UJL5P1zylELCP2pcXPBNcs15BpLMDdYmb7kxilATeKNZQtAsYljjLUnVyYO6L/JWUmgQ
         jW+zKhHRt0/GILfFqchHjsZKFnFNWMbLV9veYNK/xGW9Ce6CvuEH6PS4a7dE/lHZyF7W
         WdSgVickVwzyX7Hn8QEIhz5tPcqfDDR2qqo1dfTcLEQi0NiY2L7Mbi+O/iqvo8HgUhUD
         8IsNG+D8EvYgsqJ8J6esLZ4zyEhAq7J+rxH5mRZvTGA1Q7b5DnMzziB+BD1Kt9DFQTqr
         VNRw==
X-Gm-Message-State: AOJu0YzwqfaMdIEk/Fu5UZnKHrwqO4aFtDyMVy5SrWczgIWziRvS2/Yk
	MXFOEjsI7cbMmzbpvFJuCGB4hKdL0/rKg+Pta8JYPxbxzyqkWoUQDACB4nWLQ3ctievN7jOC9+F
	9ZRaISdTxsfNJudIYM/IiTpvueIQbkCj38q/QwUI2HObZc7V8u7z0HYztESDHTOKsY3Xz
X-Gm-Gg: Acq92OFN29cZLNpslyDNlm3ohtRSrPNbuGEPHQ7kV7SuGjxOxARoLZ+s33EmTvPXLa2
	aWO5sN5ks77IcZz5Jz2TZUKYI7IEXtFfEooSEYuZI88OEFtnYQUuSiAAp8apRcI/chikjPt4q+0
	PvDuWQvxbTun2D0KWoPlvy01S56baKv0peniTztMhrhXGvmFDoQN1Ky5KzILELimVl7GeXf3XmY
	EKt1VF08aLFiD/XMIEKi1WC9mNu2YSBNVyCtKOWiBPU7fsrBdI1ZnLedb+lZ5uVzW2s2WZrsxjW
	sNjMG4n+l5krcGvzS2UAKxK0mhxHNyORkHzew4RMRl1kMm+f/DsqvR5mg5jh9IQzG/E2u6XyY6Y
	QOGfHeHfdpPAitXOtXAt68w7vAC72eAhF8FG+upbSvgtq15NoSOr7oF1Y4I1+DhfFrI6s4jDV4e
	t7o1G103h+VAqpYQBzzX6dTOFKNx+Zd1/958/vc5hOUQuZZNMbsjSiwuXrTyqcn6ToO/m+NG2wS
	Fmc7sPt
X-Received: by 2002:a05:622a:410:b0:517:8011:3a4d with SMTP id d75a77b69052e-517ca550ceemr26387491cf.20.1780996334678;
        Tue, 09 Jun 2026 02:12:14 -0700 (PDT)
X-Received: by 2002:a05:622a:410:b0:517:8011:3a4d with SMTP id d75a77b69052e-517ca550ceemr26387061cf.20.1780996334103;
        Tue, 09 Jun 2026 02:12:14 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6912faea64dsm4502822a12.19.2026.06.09.02.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:12:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: monaco-arduino-monza: Add fan controller and thermal cooling
Date: Tue,  9 Jun 2026 11:12:06 +0200
Message-Id: <20260609091206.522331-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NCBTYWx0ZWRfX7cnN5Xrq0RAC
 B6//6sZkVypUdVofgZnIrOSGiDvWKNnLb6411u1dtpsOnj1znXope1Z2szhkhwbTremQ+D7z/M0
 9t5H28q56MHPOK3h9r4kEnRk5PQYra+LvpwCUs+mBrxSyqXs9WuvTWZDNTUd+yhH8UgCo9QQCu+
 K/E8nl2zTF7H5mJonTORnTzrIB6QojSE+5kx3aoQLWq5B68EMHLrw09YY7L4wdxpHxDDso46Kem
 55TbJNyB5W7A8BeBrO78ne/XutMj0oO+tEUu6np6V9OSXwSpDwXF2+EqHNyIdq64i/DfOoKQf+v
 dehUFNO1PG+WU1d4CB/7kDJJS/wAZ10NyUbuaZnL0dsx4pg9q3TzLBBPmMqxLXdGxaABFZ/gmze
 u5rG4dS3/IEjE1R8IhgVqvDiHC4YmjGbI5OKTtb/KjXAWYIjTPThUU9JDkdvA4QpuoP07FHNvjo
 dApP++KVFuMMyVGjcQQ==
X-Proofpoint-ORIG-GUID: Y05rQ9LsvgFAVsI7AWOg3MKet0OGy1Cj
X-Proofpoint-GUID: Y05rQ9LsvgFAVsI7AWOg3MKet0OGy1Cj
X-Authority-Analysis: v=2.4 cv=GeonWwXL c=1 sm=1 tr=0 ts=6a27d8ef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=CL9vroWOvsCo93LnfqYA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090084
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112078-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 28C0165E3FC

Enable the CCI1 bus and add support for the Microchip EMC2305 fan
controller on the Monaco Arduino Monza board. The controller is
virtually implemented by the onboard MCU.

Add a new active trip point to the cpuss0 thermal zone and
associate it with onboard fan cooling. The CPU subsystem sensor is
used as the thermal reference until support for a more appropriate
onboard/skin sensor becomes available (via spmi-adc5-gen3).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f..dae1c199adc5 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,26 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	fan_controller: fan-controller@2f {
+		compatible = "microchip,emc2305";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#pwm-cells = <3>;
+
+		fan: fan@0 {
+			reg = <0x0>;
+			pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
+			#cooling-cells = <2>;
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;
@@ -369,6 +390,27 @@ &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
+&thermal_zones {
+	cpuss-0-0-thermal {
+		polling-delay = <2000>;
+
+		trips {
+			cpuss0_active: cpuss-active {
+				temperature = <32000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+		};
+
+		cooling-maps {
+			map-active {
+				trip = <&cpuss0_active>;
+				cooling-device = <&fan 0 THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
 &tlmm {
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {
-- 
2.34.1


