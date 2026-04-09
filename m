Return-Path: <linux-arm-msm+bounces-102460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACvcKtZt12myNggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102460-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:13:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8863C84BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 11:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 182743016D05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 09:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A20C03B3898;
	Thu,  9 Apr 2026 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GUoNeo26";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RrVg+MuC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59E83ACA45
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 09:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775725945; cv=none; b=p9FDYVW9ZyWtGzTqUuD/nes9Jb6Rgldil4pVHlkGQxCDTt7p9392RCbit9UUzf94xMv4cQmbIx5X97J5lfbdfDxFYmgismAaNCWzChJkX2v069xQEeLYfSef523LeRxYyBD8rv68AAEhqf7ChHbUc/HGn43/01v/kQhYXDle9hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775725945; c=relaxed/simple;
	bh=q9/fYu8BYIGHoPGtxljJvApKq9NqD3RL6mPsxNxAA7k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKaddlMgJjyVV4WRuT/T/oquNrqjE8ITTF1s4icsU68HS8p5rY2Oa8CFBs293yq9QpXrdCqR21pMAOpn+2Gl0AvF90By7El0wXLYw86u6q3bYcqHFTqS6joUxDoRPOD5cnSdQy7KReac/9iWH6/vmEnZY6a2mtL6HwGfw93p4es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GUoNeo26; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RrVg+MuC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6392ux6t2247256
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 09:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EVlCs/0BPHJ
	8JYcUe83wCYzdryGllNEPIB8XsVnkkd8=; b=GUoNeo26g9aLpOcgqIul8XSRG53
	z4z6o5OV56EEmjBQlpONHj3QrhKbG9NmUfMdClNWy8xS9jh8GirfDQfiSsVh2D3h
	7YZA0RghqY22WZom4zoo8lVfKLxS+bGHyaL9VOKTGXI2WF8+cpdZxqFXJEtuhugJ
	OkzEYhMNAtwGbGlxQpIu9YenzCnR/3SGOtOZgHKtMnsf020imy+VtfBQo1KYrXxD
	RDWcM1a53sdi5yDWeTtaAsvVH2naIK8Gok355Gqk+Wx4AMg00pNM/5AzoKXG2mVS
	DFr/IlymYKNpOrZxz35YMUzQJYHM1dCTPr/Z4W1PwCRbgI8CT7eBF2ueWag==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4de3s6s7vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 09:12:16 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so2192411eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 02:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775725936; x=1776330736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVlCs/0BPHJ8JYcUe83wCYzdryGllNEPIB8XsVnkkd8=;
        b=RrVg+MuCqDGopk0St/kp6YkOSg1GA4xjRjMJcufbJDSsNafl4QAJcNICs+8FbfPxKS
         LdLxS7C7Z1sxYfqXQNUJZtnufz7PCv9DmD1WPq7c8e48IIw2ey6uEgw4BfwCxnXd/Wg4
         BjYHGYpIyMzOeJtmr+VfWx57k7vSkNFB+jNM7fnnOrAGD1STBD8FRsEcFXKOjimmMO88
         pKCXORQkO8EXbdSOnrzESRUk/OU3A0WBMe7iBzTmH63RchpBDHbQ+ZId6hLhCQk1yPRn
         nRTOL3WFq/gq/BWIlQGiBqZ3rKbUH1Vn4vI0L3YFmYCMQ97in6LH5A1XjvRBeJbF0CYu
         6GjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725936; x=1776330736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EVlCs/0BPHJ8JYcUe83wCYzdryGllNEPIB8XsVnkkd8=;
        b=HxCxoasWRcDNSkYq/qIatvEeTunx+bw6uJW+PPQYsGBObZfV3YeOCev47idk0fxbFs
         VwF+NY0DYenZqcglfldvWcjNfmyrri9zEf4eURFSzpLxh11EPp8TCzTqCsriY2EpqYWG
         mL+IAvjEq66H1TAp6FV+XGgdQOXT0ggd/QEJlLaeAQP67AYOiAEy/oWerjYhs0ocYvgD
         VL5niZqtr6Hns/wTJIgOPfg9/g0CcPtKXC6HnZlwFTQBHjux6I+fgiy9Jl0Uz+j2sPO1
         pQrp05zVjJjOM3jyxEcJR2zv266KKo3+GY9gRoz60myfjaqh9lhaQMxdV6XO0t73XNNs
         iTNg==
X-Forwarded-Encrypted: i=1; AJvYcCWLzzZ7L4jmORkPEe07WZeYATVzHqwn4rbwlbNQAvhFqpNub85k3Aelh/fhN9RmvdJM8sUjlMNnYoE1XNsQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwBt2A9vONXkSUNOEqvE/NQJTq5B5Ek6iHgYATUAyQez+c17F
	JdVvhVzSpPDLn5Q66J3SQiZGTKSBzpXHZWr/N2fqavVcjz8fjy/HL5j/BRoYGdxIFwqouOoEf2N
	CHSUJaqzGPKIAJhravbHozokHqYUAgeh86zxxlsF40oY2tnFEL90qBx2FZ57uXpNORQmL
X-Gm-Gg: AeBDiet/kDM5T+DZ3nrYstAHUlKvMVTY7QkNO3PtroyyNtqljdln79mcEvIdl9NE5pR
	zOdlq51DECrxrxHcsqJOC3vG7/LvXiwjalfkltz+QXOZybdKVC7h0pgWR32U4ZOJwVJgOTYra9P
	oNx77Xn1fo1n3TKQdAuNYz0QWIArYnAqPfrm8Jv69PSCxQHs6ADIMO3qPdIwPRe7Lxj/ZokaW4X
	MRN4ZQ1As5RNL9G+DFwelEZBdmiM/n4+S1IRKtob6iiMH9RyPsKfnsdYjRvf2JRdVxpGe7EvCqa
	xI3C/zOeLFMjJWncxvCsAf3EzGcm7feYrQcJ7Qz0eCnqvVNJk0o8PCwz3tJbPSNXYyUM6ypHhTP
	/dUlI1C3PHCAdKlWO6RKzjloq03Ap239B6kE56h2limzwkNcUx8MA4BQhpaiATsO4gGZE77qi28
	BrMAAmyQ==
X-Received: by 2002:a05:693c:2b02:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-2cbfc764f10mr14797991eec.29.1775725936092;
        Thu, 09 Apr 2026 02:12:16 -0700 (PDT)
X-Received: by 2002:a05:693c:2b02:b0:2c5:50fe:c795 with SMTP id 5a478bee46e88-2cbfc764f10mr14797957eec.29.1775725935464;
        Thu, 09 Apr 2026 02:12:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df8942sm31265060eec.2.2026.04.09.02.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 8/8] arm64: dts: qcom: sa8255p: Enable sa8255p-ride board support
Date: Thu,  9 Apr 2026 17:11:00 +0800
Message-ID: <20260409091100.474358-9-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
References: <20260409091100.474358-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: omR3Uc8huaX0fU3Pgt3OE-Q-qMlieJf8
X-Proofpoint-GUID: omR3Uc8huaX0fU3Pgt3OE-Q-qMlieJf8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDA4MSBTYWx0ZWRfX+1dF30sYdgSG
 026U4J7pH793knIEeJJtbUJuZruVBma0rwQJbsTaJ2HSMysElnXWmyXHW6GL7ItNSS3xHw4bDTg
 RxKPi7NWO6AOb3XXV6XHxtlcAMOEUZyKDFMpc6yJUXACJIBpERW5pM9tcatEJDJb7S9NyTvVqSd
 jHdhvpeqL0BZQBxkc4Eoca4WR4Z5l2SpJsHK+5ygb0Ci1K91h+XbJSxMogTQmWODGf6WlpfM/QY
 VbOMDxRdkN6f6YNX+qiRrSDUFZHTyYp8EwqGk5mUDORhVBxQUZSJYfkhhrgztfxOYNBEtEE3ENk
 lj/2zJiUaEjqdSCTPnLQISqROuahY5uZux3KOz0bF5vunYk44Nr2/HxeZVHqyR/bUofvw1qjhGW
 cJ0TpkE5y/yEn1VVapDYYRKyt6enp4gozZO5XzCIQqPqCmvBkMry0TMJhjq5m7gsWEx14dfxUi8
 xwtfQIpGtJBxOxeBaLA==
X-Authority-Analysis: v=2.4 cv=TZemcxQh c=1 sm=1 tr=0 ts=69d76d70 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=MNDMu2h6GyehcEZcpm4A:9 a=PxkB5W3o20Ba91AHUih5:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_02,2026-04-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090081
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102460-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,quicinc.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3E8863C84BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Nikunj Kela <quic_nkela@quicinc.com>

Add initial device tree support for the SA8255P Ride board. Enable UFS
storage, UART10 as the serial console, PCIe EP interfaces, thermal zones
for PMM8654AU sensors, and SCMI protocol nodes.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile         |   1 +
 arch/arm64/boot/dts/qcom/sa8255p-ride.dts | 222 ++++++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8255p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d69e5f3132c4..722532f4e82f 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -201,6 +201,7 @@ qrb5165-rb5-vision-mezzanine-dtbs	:= qrb5165-rb5.dtb qrb5165-rb5-vision-mezzanin
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qru1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sa8255p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
diff --git a/arch/arm64/boot/dts/qcom/sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
new file mode 100644
index 000000000000..9b83ccf32664
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8255p-ride.dts
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "lemans-sa8255p.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8255P Ride";
+	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
+
+	aliases {
+		serial0 = &uart10;
+		serial1 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	thermal-zones {
+		pmm8654au_0_thermal: pm8255-0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 0>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_1_thermal: pm8255-1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 1>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_2_thermal: pm8255-2-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 2>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_3_thermal: pm8255-3-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 3>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&gpll0_board_clk {
+	clock-frequency = <300000000>;
+};
+
+&pcie0_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
+		    &pcie0_ep_wake_default>;
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+};
+
+&pcie1_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_ep_clkreq_default &pcie1_ep_perst_default
+		    &pcie1_ep_wake_default>;
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi4 {
+	status = "okay";
+};
+
+&scmi5 {
+	status = "okay";
+};
+
+&scmi6 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart10 {
+	status = "okay";
+};
+
+&tlmm {
+	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
+		pins = "gpio1";
+		function = "pcie0_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie0_ep_perst_default: pcie0-ep-perst-default-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
+	pcie0_ep_wake_default: pcie0-ep-wake-default-state {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_clkreq_default: pcie1-ep-clkreq-default-state {
+		pins = "gpio3";
+		function = "pcie1_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_perst_default: pcie1-ep-perst-default-state {
+		pins = "gpio4";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	pcie1_ep_wake_default: pcie1-ep-wake-default-state {
+		pins = "gpio5";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
-- 
2.43.0


