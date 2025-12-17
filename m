Return-Path: <linux-arm-msm+bounces-85454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA205CC6C75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 923DE300662B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 09:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FE1271A7B;
	Wed, 17 Dec 2025 09:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQDlllc7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i6xiRKc4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF1026059D
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963280; cv=none; b=OYLLhBWKgSh6w2sypoJeU3vHqDWeaFvR2NN3hUSS6mglpnqhIqbn0pfGWnqDl5qsSex8oXu0BVKn8m4V7gt+FrRsyCLEFCM7pL83tya3L4Qdb+7kkiZQ+9KG5lHXqi/ibQ4fdxR/B52UOi5ejllzOcQRCtpCs2QWYlsyZY48FXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963280; c=relaxed/simple;
	bh=XSuClwRayRsPm364J5ARd4Az8F0HRWhbtWrsxuhfxAI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gONBn176sVpw9GrkcDYpEugds+edSZXlu7hMMWKuLmz9GeA+/Ty2BuPr+SXtuFRIO+qW1+s/IaFnGI3SBRYd9Xr058IUSOsqHzwPfkwx2+U2maiGloUr4pmcvvtdTI0vcc9bDp3nvpKpVuglVZUSdIldZ/6gxAAqKK2QV9zskRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQDlllc7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i6xiRKc4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH86I8Y1945948
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SmVxjF2e2ISy3DoG/9CXi0Q4fSro0OOdsVb
	DHNIiz/k=; b=UQDlllc7uDXmEEqRjDuN36BX1UwxUN2Do0mm+F6Dio4SO6EVLUA
	LnaPde9kY1jD93TmEL4tMMSrkmcyEwotvqDOr9IZwx2k2e69vZz8iaDekLeL+n/W
	aesTnyb9vquDdoGV6CUF0XznXm4dpf8m3De9geS5Prw5HjygEl35/dnKC/S+DKAY
	+v9o/Hp/EAklwFfpsV3ompUWIDbOAzc/Sko0KIB0+8kM5RB+RFKbzsLmZkFMt0d5
	rmoiAbOu/pWYHG5VMtke+MbIi0ZRmv5pu5h0uwI4JVMUWOFLjzGZMFCtUTWsK22O
	jH2b3Fq7risbetWibC32GcGu0ncNgndpTzw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3rqa88am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 09:21:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8824d5b11easo106567546d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 01:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765963277; x=1766568077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SmVxjF2e2ISy3DoG/9CXi0Q4fSro0OOdsVbDHNIiz/k=;
        b=i6xiRKc45+l4IABEGRXeWELB+063/32pT6pdx2bdT/QoWRdmp6YyQJkxhV6tbroqYj
         5rQwes9mv+vad1INxzr5Asc+Xr8ixSask3UMPxym0dZrfqh7x6psAqFKPgJOS1glPNN5
         mSnhHYo1Rhp0PDhnndsbT/ZN/NVbWG5ZDOJetIREmcPbylhj0x3A4uOw/fo2Y1H1Xozx
         cNaGlTGfWT7gZl8IbGQNCew3bTcVG6yozNTNkgzdEYRqXOzjTInTl04wqim4jSiTQqWc
         tRR45ab+Z8WgVcKdvsFfv3nWB84WDS7VVrN+wzzrA/gj7m5wt8JQ5ZQ9dEnm76YsQwf/
         IwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765963277; x=1766568077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmVxjF2e2ISy3DoG/9CXi0Q4fSro0OOdsVbDHNIiz/k=;
        b=jeU9J5ZRYi+rD/V2+NMi1FQb9itJnlbymJeREglzUGfxidEye7PQO1AzpRaYcobuZT
         OFdQlZgzO5HBMsroPwvp+mcBIajZ4UzM97KFauwG0bHu7KeIdWnWaJS7bzSsIUHOAU3j
         jNinFOM6xkVFttmbYtqRcTdLxmlEFwnFljlGL1Qx3VIjw6aBNSCElSsObIAbF+J9mHnf
         rdUZyfbZuRJxjZIpGTY/ZCAvIEN6tHSNIIsNx9iGhEoGDR35KchE7IW6sURaaZ2DHcfF
         c6EemwzWtHEymWsfndNZjzg+psqZPLJ1S3iSDkaIkdvmXxtVTfVzab05myU/A+5Pfnyb
         DYsA==
X-Gm-Message-State: AOJu0Yyovy5OkEEQvpbi+gMqIVy2/yFJlZdK1GC9MJfKjXa+Xwj2/1ea
	gGhkyUXnZFfLQqx9CeI4GfRZ688/VM9dpeqkPigDmgs3e9TyfBS/5NnH47KPgFFytPZavCOkAt0
	VPqJAoryRs0m1LEYyXj+6IqZDAPBZGBUgw4JFHlH0MWuxPy7b2Ybx8s/onMtZpJdKZgiq
X-Gm-Gg: AY/fxX7n13tcfvjMyWXslLowHbqzyEwdIx/EltX/3etq3iDj49tAfdbMyR/VTJRXszd
	FYWl9L8TKP3LXfYvK9qxKrTeeC/MM7elH8xR0FJgtsVwyNflEhnd9YI1YBu9rX1FxozJ65kqGkj
	cnCTRfG8iASxsBghjuukq9zuIhml8uP3osQTxt5bUFWdpSelOdtRjRSYDR9C2LUmuElFUFB2znQ
	XR7iwL4seE4zGJM5ihrjgWrp/AcmkByumpaEHb40aLCNY9mPAdsCD6JumUWcJFYl9KlxKk5tS/U
	IuLAUk++LlKrL2V7I40rA7pAcFb1D4dQjboizifhcDM0UzAMmrflPTuZPBfdRyriwEGYrx3rGRG
	nWRGEVcKE7/XYwdHW7qBeeqipL9tbJbGv6sWBBtLVjaEZGazUDUa5inLol8ahXh2hK+o=
X-Received: by 2002:a05:6214:2b94:b0:882:4a63:63a7 with SMTP id 6a1803df08f44-8887e46c293mr210990806d6.60.1765963277540;
        Wed, 17 Dec 2025 01:21:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEQqwjMvRNnyh3YfUNBt5Fi+2fdDD6v8MRDALZ++P0XQfjx5m6HxqvKxjsiX3vTeWEOOp28A==
X-Received: by 2002:a05:6214:2b94:b0:882:4a63:63a7 with SMTP id 6a1803df08f44-8887e46c293mr210990626d6.60.1765963277110;
        Wed, 17 Dec 2025 01:21:17 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-889a85eaaddsm100863146d6.38.2025.12.17.01.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 01:21:16 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: talos: Add PMU support
Date: Wed, 17 Dec 2025 17:20:57 +0800
Message-Id: <20251217092057.462-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: yB_2w8wqih8Mrr74tC89I20-PEQ7kelQ
X-Authority-Analysis: v=2.4 cv=ALq93nRn c=1 sm=1 tr=0 ts=6942760e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=V9vH8NbuffPfa8XiTLAA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA3NCBTYWx0ZWRfX8Me8+eySHv8l
 gEJCZE6Ibs6SmBHHXP4jVe9Okldh9jfHKo1kQaBhRVvNSHMeB8sQdLbtmTao8jxsL7BCN7UJDtG
 fJxj87R+BRT1yT2xUQC6560HtFwZ7DO7GtAvDr0Gc80Bu+6wq6m9AwXtYcXpAkIk8t4AdDKmsgX
 E4EXfiXOZqMw0qCsIXwyc9LHQY7j0XthI8Aw1CxqV8JKIp1DOX3Gy1AWjQSKptQavcsynEXwr1C
 J+yx6AdsMEEeM40unDEnbmMRg6WMZv3kTUm0YBURw8QxGY1ZoJeFIZiFInq0+WYyGLhp5pDdK2m
 BtpnDp7EEphtRzrgLWCt0vKt8gWFrprzZOgLCXhSC1o5QtVVgD6Eyt2PophID65u7O4+Lop/oAk
 Higy0aZZTR7IEqXQdI6WVUULAxLeCg==
X-Proofpoint-GUID: yB_2w8wqih8Mrr74tC89I20-PEQ7kelQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170074

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add the PMU node for talos platforms.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 95d26e313622..3ba1e3c1d1d7 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -555,6 +555,16 @@ opp-128000000 {
 		};
 	};
 
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-a76 {
+		compatible = "arm,cortex-a76-pmu";
+		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
-- 
2.34.1


