Return-Path: <linux-arm-msm+bounces-86963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 432D1CE9AE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 13:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7947303C82E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:34:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58DF82D73B4;
	Tue, 30 Dec 2025 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/0WLklH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PKXRVSoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919922EB87B
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767098060; cv=none; b=CzoU5lSaJl3fO663JA4mD4tB6uqCkMlqYKrTlonalSyFS2NtD+9PL7dbvc/9l0j6MDtYq/oGspq+L4miw0njMrOqrOQ2DK/attVId2S6NSLCPIrA+fAxBYlhRil8kcPIT/XyPVJNZqPL3p6JtWuiSCT7Wwa1f4iFWpynw+h83QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767098060; c=relaxed/simple;
	bh=tSwo1ZqKaEoz7SmOgNF0mRV8fRrJ2r5Of7PaM6Tdz/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwcyuvhnVXDfaH15i2XGBetOpcr31c54FNOW4PthrJsdQmwhpO7Ipy/HC1k8Nq158llktc+RB7tPhUbKnhuJG15+TkWNPA0SEP4hQKHUk5fAomDaJvPtWQ31kD2poDCUxe8tcgD17kufO1tXeUeUAPydOysULrBk4wzpEdkqpgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/0WLklH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PKXRVSoy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU54G1k3539728
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9i+TijLF64GEMoWt7XWC3BovVWIVdUBTCj/UJkqJaDM=; b=Z/0WLklH9cggt3si
	vrC7rTuGkk/uDe+KtSp/E11Q5zNxWmkZLZGaofhKXaOOCmf0Lqt6vl6oSq4Mh5hJ
	mMqP8H4gIWglpm29+VQwUcKBFWIlaysUbn1lS/+EUo7g0m93K/sFHzCUD39+S3uZ
	i+CL6GtsSeeaexF8iDtykzpe39dv0eMI4Vde5H+O/+OFH+9YG994nnNc6n7gONiY
	GhNp6SN5VValtNM1A2+MGdFC2ccleLrN+w0LygQ4pdVrF/Uq+V3he1hQBMm2eK7Z
	YUd9HGHRjFs3bT9k1lqmioArVPLRaqPBP3rbTtfTatwdh2y3R+KDlhjLZvZtFeU4
	NTv1AQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88yh04m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 12:34:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1450189eso90350585ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767098057; x=1767702857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9i+TijLF64GEMoWt7XWC3BovVWIVdUBTCj/UJkqJaDM=;
        b=PKXRVSoyXB03YGrJ2BzRhGTGMo86E4dVHidZIEock5T6FtVXQ1H60ia5WhtKsJsHiN
         UWNEfts8DDytHIi0o4F3kBySNIwakC3NZW9kjyNLaTx37g9AjgRhvPepP0AaQqZxaVVs
         2NoqfjWkGNTkpHjZvpjM1fSsMr2/hWvQu35eKmf1X4tw2rH/xqGj6piaYWh1C7xXP+mk
         tJlcqkNJjfTGdHMLGGUoSHNOKSq9ckAhnAj0PbDlEEYLG/55KAO4OJX9IfX2JYJpQgOq
         m5VCg76RRJBHZrJjoxGlE/KusV1VJr6IfK0FAi+W2ZG8kfO6agpAES87UEtKdUMp/cN4
         b+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767098057; x=1767702857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9i+TijLF64GEMoWt7XWC3BovVWIVdUBTCj/UJkqJaDM=;
        b=euny7eIZJtpXDijI0KGDXfKLlodtYgSoBPVX509ZAFIFjRrP59V81+R8ZHCAWVMdAo
         x5mA8fekG4+78nKy140RHmXLhyehhgdx/pOEa0zPBkMP58SizG/0HYOjElwNrtZ1KVkJ
         Zxt4K0nIie4xoIV7BQ5ryagNKgB+xdoIGW+3j4iAMS1hP/aV2buLZQ9ad9BMrpROXZPc
         yt3/uHXKnJvmcFtsVUv6rZcVYwGV3M5sDc2JyO/OZmkdxWIY8XjgNx7ccNlobYh9R0QO
         8JTeI+yh5LV6td2/Wpz7rIhpGhMXfu4uixt+IFolGBxQrmzqnbla85w+uC/jKyLTEw8q
         iClQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTOaGw5CjesEnePy7fSF6FIAMptAvMgRfK/EYM9wdFyK6Q/4LeEgrmv87X1NolOZO43pOro718/jVyFH+Q@vger.kernel.org
X-Gm-Message-State: AOJu0YygV3kwm2V03xp9zvKcqxJBRfnO0VI8mKSUusLcDSiJR9MWNaJC
	A8FwdYWvulahV/pK61Yxd7x3wsLg93AtlUtVrbtyOB8PR/XOQSTEWmfe3gzwGDT3+6vvkAlJ+X+
	EdDZmwV0uUutME4J7B+ViFPI49oPxtjdr27hUe7qK2RSxZqfHjN1qOrIHu4YBteh6x9O8
X-Gm-Gg: AY/fxX786I57rwKuwMcthgBIvl0QLxCT8YYh5ctoXGkFQCPilJSd85G5tshIbjuYSTM
	sAhyXSEJb8PKQnqHOIfCZ9IkYXMeAD//L8wmuNa/T6MUPhcMgxzZq0IPqyDX8bDwquDhmGpTrtn
	XIKdnfTreqL/B2xMbj9OT83a3FjZJkXiJrRzpAGTQnUQOFddvX2iibvaDwZxUq06Yjui+Ms3AUO
	um+JdsjBj2EjhHxHd9oKTd3NmB0Ql5TxJuyMjokDRMgr0GNOzbBOmrJ8vNTY2h4pl0S31kyBP6a
	kV22rVw42/YCwldhv6/5UaSmEySSboPtPNilX9y/aa+bCNasRkN7dpFQlKQGMqfdqKfarc1L7/u
	N9H3SpvXdRzyMgEwRShv6x+Gm0cCvOuaTYg==
X-Received: by 2002:a17:902:e78c:b0:2a0:d0ae:454d with SMTP id d9443c01a7336-2a2cab4335fmr319392715ad.22.1767098056808;
        Tue, 30 Dec 2025 04:34:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrM2UN+Y82XZkc5nOEFcYcN7ZxH4Wg15L+v1/oOBV4Zj9+VYylBC8tim4oYjHqa5s0NoqK2g==
X-Received: by 2002:a17:902:e78c:b0:2a0:d0ae:454d with SMTP id d9443c01a7336-2a2cab4335fmr319392295ad.22.1767098056227;
        Tue, 30 Dec 2025 04:34:16 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6a803sm295748695ad.6.2025.12.30.04.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 04:34:15 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 18:03:26 +0530
Subject: [PATCH v9 2/4] arm64: dts: qcom: lemans: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-a663-gpu-support-v9-2-186722e25387@oss.qualcomm.com>
References: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
In-Reply-To: <20251230-a663-gpu-support-v9-0-186722e25387@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767098036; l=3278;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=R4OHgwavFPBUUNXN7fDYr29JC1Dp27qpcc3H4svA8eM=;
 b=rXIv0lmEqito8LRolKjl5lPh3fvR5MOxO6iWW3xgZegxyqP1j8VZUPAN7yadA3+i7iPVlZ53U
 M+woS+mud/9Cdyqk2jojKbe16jBamxSZyYr0Dpw+BNx4Wt2vgJJay41
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6953c6c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e3DMr3DmCBmV6l14PKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: accFOmp0LsUYEu0M7FSWiUJMS7PPKqud
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDExMyBTYWx0ZWRfX12yDFZ4YMTUO
 axiD9kQc1bkGIvC7UXVS+KZpTmE8elxsZtpZqRy/rCzAKrOKmjs6DmoGOc0kAZ/gdM1JV8d43Xr
 3W0yGsVCgwWhP3cVHXERDu0RRI10Ptq9lZg53+cFrgv8Zr0oT1D7e5VjPuwF7yp3WX8GAPz+UaZ
 Jl6fZAUMA+l5BVNnxJK+eRySwkRMue0bU4VhiZHb2bv7FSxnSh7rqhVp65MYyrmE3lxal52rsG3
 h6Jx37eB/+XyrFPooCsM6+cmtLZHjvollXwmfFdcIfII2jh/pAwYHBwtj54NrQJUw3N1vk3OuuJ
 qzRrGVvgPVZQ64hAhinQ0ycFT+wmFhiqtUen1/sKD+oxKDEdK+ZLt4zbVwGGqWyiBx1rsSmkgrY
 pJk9HL4M5wO2zkFvfAL4D9mHsG9AtTW7DlLBKG9ErRuuN6rvsHxnNTa10SVceEMAw/tmYRWm+ax
 irpevw2yqyk7lvoviIg==
X-Proofpoint-GUID: accFOmp0LsUYEu0M7FSWiUJMS7PPKqud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300113

From: Gaurav Kohli <quic_gkohli@quicinc.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 105°C.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 55 ++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 883f9e0ab45c..14d9f31e7086 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -21,6 +21,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -7514,8 +7515,15 @@ gpuss-0-thermal {
 
 			thermal-sensors = <&tsens0 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss0_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7534,8 +7542,15 @@ gpuss-1-thermal {
 
 			thermal-sensors = <&tsens0 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss1_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7554,8 +7569,15 @@ gpuss-2-thermal {
 
 			thermal-sensors = <&tsens0 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss2_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7744,8 +7766,15 @@ gpuss-3-thermal {
 
 			thermal-sensors = <&tsens1 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss3_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7764,8 +7793,15 @@ gpuss-4-thermal {
 
 			thermal-sensors = <&tsens1 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss4_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss4_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";
@@ -7784,8 +7820,15 @@ gpuss-5-thermal {
 
 			thermal-sensors = <&tsens1 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss5_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
+				gpuss5_alert0: trip-point0 {
 					temperature = <105000>;
 					hysteresis = <5000>;
 					type = "passive";

-- 
2.51.0


