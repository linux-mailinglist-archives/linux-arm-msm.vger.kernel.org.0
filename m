Return-Path: <linux-arm-msm+bounces-86343-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE36CD94B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 13:36:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96A4E3072FA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 12:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEFB334C04;
	Tue, 23 Dec 2025 12:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TIXWaOby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j14AKuTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9731A30BBA3
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766493250; cv=none; b=UXRy9oes3h06RCHDWjaKFnqC/RdO3zjpUbpOqoYP1Qk+wqP54tOrMsondC6/JxcGJnFbR8JSlxoyB/k1pG/ZFaPN8vWVbamsvfX2B0RJPPTvOF4WP/uyUfJJp2GhJ49x9Z5XLgg1KdofkF6qOqku6N/SdTF7gua8ejBlPEPI5Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766493250; c=relaxed/simple;
	bh=rxI8y5oMiOdUIwfaS6AMKMcI2liAUjCfUWH0nx3mvRo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aMlOKFkwvHgw9SAv93MQffvT41RlSl9HEisAT2iMurrcBHfsXPpQrhhNmBi6GnNkmMGVIGfPCAjg7CO4z8qhZIlInWTn0jGm3q6mwcuOv84is5rt3WTiTdflpgJPT8JoJDgf/JWksjOjr+xZP8/EOC4CykO58LvjPlLIYu/4UVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TIXWaOby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j14AKuTf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNBRS34700995
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FL1ftbe5lm5
	j4ymoZCGPq7taoT2CIBDv4E1wyT+IMYo=; b=TIXWaObyLSkLHxdaxlbSyhWUjU1
	8Le1dsmx9tLs7JiMDsJkeApXnJrrJNYETc5bnAPZgFQg4rG7IlWbfpCYOf3zdMdl
	OZ3zh+/6mLSGW6UMWhut551O6vctcJ1/Wxa0Dc3KMZtsSTwdakTGFoN0yjyfoJDw
	ptTSCQ4pXKDRVNjcVV76NCQSeECRYj+1BuMNJeGd6X3E7nLg/Gx2C94MGDBNsk0i
	RqyrRP8CG1p5QhQHXYlyHL63Jm8BxkoLyUZZki5JfEtflWf2qh8C3+ffi+syNOh9
	5rcOeLb+T8P6HqBBPV+MJglJdni3K3CTjq5i5FaaGgrE8DvMeRDI50XO/ew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jr64a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 12:34:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c64cd48a8so11341826a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 04:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766493245; x=1767098045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL1ftbe5lm5j4ymoZCGPq7taoT2CIBDv4E1wyT+IMYo=;
        b=j14AKuTfnfJ/VBqGn+tJ/HIneSWivDpXK9YKnVL0QxeTSOAUvAeGdJ4dp/ryXeiMim
         /yR3ahR88PHh/I4dNqy7/9rC8oe++oQ8uFpoof6vAA+Ti6Uf0a5X1oANoHc6YXQDKJQm
         nGFw5IaprYxYOgXxdOXON5wqoU8Nt9x5nPg3er7G+AZyV1wVhFOGTWWzdhkcYUAbwi8x
         RFd5K1XodxMQgxSz5VU0x+/2rTKZH154x3bWvipV7R5dirFHcUATDQheIp72I91+uXyt
         6FufExnjO5h600Bv4+CtWrFVteoggrGOgwbwZO8RQYSZPLVUakNRj7POM+BYGHNsrxTh
         xR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766493245; x=1767098045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FL1ftbe5lm5j4ymoZCGPq7taoT2CIBDv4E1wyT+IMYo=;
        b=CTNbVRa4C8tzeaaNgZuhe573yX1hS+nUn19Huks1i5YrFCDAyRraj8LGJQ3OwgdcMi
         5/PQ+tWe2R/gMVZj4TSGk7eBahnyRJNc0JXi+TXon4CzA3VDBEjflr/04Zt+Gyh2k7Gg
         tiMzkiJqUH+g539jTjt7wZ6JQv3cT8aLUODSAzLATBq0zGo8OxCU3wNS40X6mNQdKw9y
         yDvT5o99EkrRyTjiqREzrj+18mSw35V7w5d5pEgIAGYLTd0S4kiiDwEhgB+kzMb/GWtZ
         l3HfFe9UKCS/oRVKnqknHKZ/mPMR1Pgqlf/cFb4NkVCYG+JdJ73DTzBCiHo+bENYtgdI
         LRjg==
X-Gm-Message-State: AOJu0YyklxZs8ArVLSY7gvE8I/SdEDinT12RyyjIktTHNmXKhfkIsYly
	BWuP8fnVJu8P8h/NtS/VAGPgKChPFp4zgbt8DIPwEyj4KOSBIbzJCzQTDOFRR/XXnAugL/AvSYi
	DQQBj1UDayHFBthGdcmDyrDEjiqhja1ke8Oa2fk6zdk2QDXh1U9mYgUxwnxVSrFTdnUf2
X-Gm-Gg: AY/fxX6Vpa9z18jwXpnr/0aHYGZ+lzceeeyaqhbZZbFkw+VpN8CSDsS5YG92tcRkJZ0
	WcOVF5lz+wduGeNLxLvuQEw+01zkZxj6M7Em17xBqhIddEzxdgqil90sfNuO+MIIDVIQpMDeKnc
	L0FkrvxglK26BNTMPcgACdmeFyAlaTzMnGkjQcHXQ/VC0LCVyfdrmnN266/hRCfK8o53BMQwheI
	mFvceHSqnOEg/y/z59Uuu62T2KZ1UZt/8896r7zzaQbSI6R3qlEp1g03PIWWD8FWRXYrNplEME1
	wVf3kO0AZpchM0VT6OFqDRyiKmw8Qe5H+A2APBrRjvLD0kZcwffB0oarvHY8E6646VQjlKaM6RQ
	m7LW7NE+1iPBm/NRB4ILM5xeZn0UJSfRlLMkPc8E=
X-Received: by 2002:a17:90b:2e0c:b0:341:8bda:d0ae with SMTP id 98e67ed59e1d1-34e921b7334mr11265900a91.20.1766493245299;
        Tue, 23 Dec 2025 04:34:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGmARe1g9yVPcICt7ISPS0bRJWnT08CSFmpz4Q5i5kQ5jE9ilydr9U3/9m7HZC1Ilbfjl2WhA==
X-Received: by 2002:a17:90b:2e0c:b0:341:8bda:d0ae with SMTP id 98e67ed59e1d1-34e921b7334mr11265883a91.20.1766493244832;
        Tue, 23 Dec 2025 04:34:04 -0800 (PST)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e921b39dfsm12936044a91.8.2025.12.23.04.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 04:34:04 -0800 (PST)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        konradybcio@kernel.org, amitk@kernel.org, mani@kernel.org,
        casey.connolly@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: [PATCH v1 7/8] arm64: dts: qcom: Enable cdsp qmi tmd devices for kodiak
Date: Tue, 23 Dec 2025 18:02:26 +0530
Message-Id: <20251223123227.1317244-8-gaurav.kohli@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
References: <20251223123227.1317244-1-gaurav.kohli@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDEwMiBTYWx0ZWRfX1slDO54aFrTB
 DNmGKr4HqqnoWU8PU/4g6aPw549fv9uEHpWw62rrECt53YnRP617OJPLS5M3VF4GA2S8XmcoJ8u
 wH7pLks2JteUjd1MiwIwV+1JyO4uKmpZYB9NL4aQ3LdyJL/FeIzA5CHBq3WdLUru/3OXhtOXhJS
 xL/HFyf6FeZYD6b/YEsSbmP3Em8UPuQ502+AUmGwgQDx/S9SqzggP/OSwp1Xy4p9w2Q3qU5iwaO
 vLhh16fG1MTDgp33KFdwssSDmdmcgIPsWu5ETWuHjeg3qTgdE5CO+HobT23JAJFaUpJBR3m+mQn
 yfXZVh7sFhRIeYYSaM2hHdd3AI9a59BPOrMlDQVwAbt+8Z/SYiuggAphtVumrHsV9dUS+nzdNPr
 sDcTdX3q9XkhYbLYDhVANAN/fNzCEHbZMGyh1pe34KVfSwo4dBXMnwGzdPGnm/bpZjImwbIUSzB
 KFPeoRzLW0QEDH7mJ7A==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694a8c3e cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=0nDfalMChL4Kl-YbaZgA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Ka94Hpu6CcJ7-9wQC-CrYb7wZXXT2Z3r
X-Proofpoint-ORIG-GUID: Ka94Hpu6CcJ7-9wQC-CrYb7wZXXT2Z3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230102

Enable cdsp cooling devices and cooling map bindings
for cdsp.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c2ccbb67f800..03c1cef910a9 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4780,6 +4780,14 @@ compute-cb@14 {
 					};
 				};
 			};
+
+			cooling {
+				compatible = "qcom,qmi-cooling-cdsp";
+					cdsp_sw: cdsp_sw {
+						label = "cdsp_sw";
+						#cooling-cells = <2>;
+					};
+			};
 		};
 
 		usb_1: usb@a600000 {
@@ -7587,12 +7595,26 @@ nspss0_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss0_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss0_crit: nspss0-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss0_alert1>;
+					cooling-device = <&cdsp_sw
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		nspss1-thermal {
@@ -7605,12 +7627,26 @@ nspss1_alert0: trip-point0 {
 					type = "hot";
 				};
 
+				nspss1_alert1: trip-point1 {
+					temperature = <100000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				nspss1_crit: nspss1-crit {
 					temperature = <110000>;
 					hysteresis = <0>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&nspss1_alert1>;
+					cooling-device = <&cdsp_sw
+							THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		video-thermal {
-- 
2.34.1


