Return-Path: <linux-arm-msm+bounces-104498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDoBHEQy7GnEVQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 05:17:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F1464E25
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 05:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A55D2301DED1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Apr 2026 03:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944B82BEFEF;
	Sat, 25 Apr 2026 03:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRBP7m7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2opODCS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFFD1C3BF7
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 03:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777087041; cv=none; b=AdPCD11IXmRWw8P3FrHV7uXwur8VRe+GxySXHlKblP3tu0Gm8Yj411X0fbQ4fF15fYgWDRbCIpxL5UJRn0nNc02EjBADMgodQkMRxc84+ZQ619IPPnLjI8amo/D/6eQYOLzOe3Bi6UKcLw7E1v9EZSD/AF+0s0R54YrdeQsf6nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777087041; c=relaxed/simple;
	bh=F8kP+N/mUmZoO+Kd5edx3dpf+li6V5/c595X1BMnhdA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RSBsrQCTdhozIfBVezbREic/a6ladC0agaBUYbVCa8Wn3wPzv+JkPoa06eDksyv8qYloXffXyvEY2XmxnxuocaSAf+7ova7mO0Q4TK1epYziVqNxf3tA0TNMa2WomF+QupRCXNAjbdgGtYizPX+do7K8hmNV7Za4Hca9PqYJ1wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRBP7m7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2opODCS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OLpH2P4112976
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 03:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WjOsKxPNXR01lWn8xKRE2NC5FozI7LfnoLM
	SwToVJZI=; b=hRBP7m7nunZzTgO9ZeJVarX1J9XuQqZXCj85MnVIdv9GP5ZV/Et
	uygRXh8pjDcU8Xd76cy5LboS526/mV+zGz4QuYxZLeCDtb443cIKdvBSjeGTYa2c
	Zz1t/hPAwGgB0KtEbfahxwO8tdRv4ET40kz8ip1OAqLAnGs3Qhc08KGh3Q854cfZ
	DRaYu4/8HIh8UL7yVmOCQAYbOriILiuEPB+B9qZYVzc5zIkbLA3KlDQZsBQbz3bp
	sDHdqs+9oTi07i2YNLJu8YC0NfupG1giGiERKt/Ce7M7JC+faSCXYwEmb4XI9OWJ
	zZ4pzF5drUi0ioUaEBl5aIgAcTkyT2n5FoQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dr2nrmckk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 Apr 2026 03:17:19 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f543bae3cso4390958b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 20:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777087039; x=1777691839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjOsKxPNXR01lWn8xKRE2NC5FozI7LfnoLMSwToVJZI=;
        b=C2opODCS0O2H+muq37eU0Zc/u9FetvNt1Jily4ZHdTKDnTNTDyk1vmcIg65foI4yz+
         5OznRt2HMtcNXD7kzDMOB0JwElKUtpGsoGpqudLKIe1LxGVP7mnGUXVMNSBvpBAl8ipF
         rqFGwNwxxEuaQnipVmnFdii04OpboQitQOdUsD5Wclu5r6USzBDZ9DNM6V51+z+rb4vB
         kvNgrFZZT+T62pKuhGtkmeYsSKWQh1kDgif2l31haKRmqAnconeT4NS/ItC5bBsCECVE
         U/ZEayQODsJ0ZuTwhjLwvRkWA5qPqiHTV6F0W2+teoWtO71SYWW7fjiq1e9qoTTtR3mY
         WV+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777087039; x=1777691839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjOsKxPNXR01lWn8xKRE2NC5FozI7LfnoLMSwToVJZI=;
        b=VMZiQxnZWzfFFFTlUO0ambYUsTbh0sK3EwICRGCouz6kk1Cl04gURMUb/XGbttL2f1
         8AbJwFpZUStkT1QOfdKK8Btrp106loc6RsvPqvIDsumdkkjgOEs3lbFXihdc0m9bcSyq
         1SUSFzZS63apkpznc1rEtJUypgHZhsN45uY7JqG+lvzzt3NnyMhJaRiYop/w81f81Pi9
         Sobr/hO1Vo7vdhbCbeb4oeVsZwaLEuX889X+6wa3JgmpOzqYgzmonmNvGbV7c2UHcv3k
         DmdrCPOwoF+WgI6mqJ0my8eOI4rUltaqlqd1z4bAZwB2Cq275jeZugubycM99PX54SB8
         9WyQ==
X-Forwarded-Encrypted: i=1; AFNElJ+QigMZqFEQ1u+gp5DhI7FUFYkm6qQ9LEdNsDTjQOO/GmoERu2cPN1Tb7kMOZ6V3NX08U2iHNRwGlz421IZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yya8PdGok0wItuJwrQTeVJBXp1oDtmvFsZSLTUqeC4qrlMDThTz
	VwbBadmZdoQ6C3iJnXpIBGvRB5CcjI5mN3nWno7ynwsvTXvgsKt1/JdS994TtSULQBJWByBPCe6
	vaNngUeGCZvf57+ybaGiwuD2QS0JUAprv7707OTvRgyTKX5M6/1mbZptPAjbU9QRcbIKZkwIW88
	tu
X-Gm-Gg: AeBDietC/OEN48BqCrj085wvDlyN7Go8N4mZ8vpXqEEo7jESxDl8pMKYxgxtRyZHzi6
	Ua02KklAjb2QUNP8Bid5JTDg3RNoNLKQTN8IooOpcp7inFrDVDraYSLFvuM9xR7UrTj1Sbozo/4
	+QudgZ5D060dodct79hb2kVz6x5d8/5YuLSJzpjfpA9uHz1kTXeiQJnDg1G4F3wG0K/00cfiXWo
	GoXfZ0ACn54QgM8rwFXWTk6nW+CyctRPFN5g9r9TMqYBfp+X6oyNySvpemym0x3nnZEXHP0k316
	QlBkkQyPsJvbViCiwscXJg2XKBTffeGxW7IhctUlFhIh6PUV+zjgKFzVzIhlm181qFOdjBuqt4R
	V/PobbUecZpPX1BYpsM8/LWpDM5LTpBeIBX0QC9v1EuHPYogGzCE5
X-Received: by 2002:a05:6a00:984:b0:82f:2985:2094 with SMTP id d2e1a72fcca58-82f8b554ebemr28643343b3a.30.1777087038815;
        Fri, 24 Apr 2026 20:17:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:984:b0:82f:2985:2094 with SMTP id d2e1a72fcca58-82f8b554ebemr28643314b3a.30.1777087038264;
        Fri, 24 Apr 2026 20:17:18 -0700 (PDT)
Received: from zhangq-gv.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec23b19sm29189952b3a.59.2026.04.24.20.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 20:17:17 -0700 (PDT)
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qian Zhang <qian.zhang@oss.qualcomm.com>
Subject: [PATCH v0] arm64: dts: qcom: Add fixed regulators for WLAN supplies
Date: Sat, 25 Apr 2026 11:17:12 +0800
Message-Id: <20260425031712.3800662-1-qian.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDAzMCBTYWx0ZWRfX4eHXsWSRakBs
 XsMWf3JyLOfyefQKGFCywdAIfLgwoiqDuNsQryH1iPFV9rcF4tZc+q+CZOYusuz2N7+Lq+Q3YeB
 kTTWGAPHM0gcWFJtZOJJlM4HgtgaluapeqQeMrTancpUXeKgVJNKdvHcLdMzxx1qifHTQHaKtnJ
 7T6UavpGy0se736xVw76Eh/h7IMeUnLmkOOcqZ9hHxiQaq0sGbOHrsabahpfgse3uyBT+lwhyS2
 fuHlpjB0A0qSiE7ItNQ72aJf+VTr1nBUn/vanrWjDW4fvGkTmZRq1wYs+qJxRWzgEdb/kP0LNtA
 3zOifaMpmEMpd9GHPW1qyYgFoDGV8wdrGt0f1wJle7SzZhizZpFhWADp7tuJ0vWAMGBpo16xhkU
 69Jo0XOYBsQca/cjPPASiBDePioMvjFIEClbXFfWUNYy2Kq+66lbxZ72eEowEZw5WtyKQaAR3yL
 kQ/sS89hpK8vI9NgMAA==
X-Authority-Analysis: v=2.4 cv=UqpT8ewB c=1 sm=1 tr=0 ts=69ec323f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=OYB4W3EJkAgPSM3XL0QA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 9tgxfyqRucgIQe9K2MvN4Pc61Ei39-Mb
X-Proofpoint-GUID: 9tgxfyqRucgIQe9K2MvN4Pc61Ei39-Mb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250030
X-Rspamd-Queue-Id: D89F1464E25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104498-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Add GPIO-controlled fixed regulators providing WLAN 3.3V and 1.8V
power rails for the Arduino VENTUNO Q board. The regulators are
enabled at boot to support WLAN initialization.

Signed-off-by: Qian Zhang <qian.zhang@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..1a40ac5bb4bb 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -153,6 +153,27 @@ vreg_nvme: regulator-3p3-m2 {
 		enable-active-high;
 		startup-delay-us = <20000>;
 	};
+
+	wlan_reg_3v3: wlan-3v3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 54 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	wlan_reg_1v8: wlan-1v8-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan_1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&tlmm 56 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
 };
 
 &ethernet0 {
-- 
2.34.1


