Return-Path: <linux-arm-msm+bounces-87082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C55E9CEB99D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 09:48:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FE3E3067652
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 08:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E515314D05;
	Wed, 31 Dec 2025 08:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpvdTr3q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIrF+YrN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB08312806
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170796; cv=none; b=iGn2DlVvwYmH8ukD5Do7B0TfbkO6mIvx7lSPVuqK5CpYcHBSRWoxU45etQspskEjFbuvsWIZvlzhuLmyX7kq0OCqLp4ZhQj5peaZU5docza43SchA0BkQ8xj+WsCCpNYFHgMLF3UcyQTX5PPL09jojddWlDeh3k+LNb9+bPrQk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170796; c=relaxed/simple;
	bh=nHgD42pr14gVoKxIaue0YTaT0yOvk47dDNaz3KqAIEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G2JNEevz/hOcBXsaXaiSuSgM2PDykXJTDWZ6fkD6UQVy4FEjO4bhzIWVemiQLFvJnnY5Ac1woKxMIn/CSLFrLcG+LRTIgloC/aS+GVPQm3PS7BVP5hWdt+M72QM3xM+++2KFoOAbEg7Qn0O+ThqsmDiLXN8jSjmENtSel+5R9z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpvdTr3q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIrF+YrN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUNkevG3138113
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCIWG0KUEjnWmPrpuMaL3sNQkAcSUVNdZBgNTm0O2wI=; b=OpvdTr3qUCqh2V8k
	3qliVfYr0sY5XftmFHsNrw0GnjXba/H5YimbsX2AiugnrGnZYdgFWrtoAev/IRNK
	pzi+HwhjQbKb7EXQPuTlTaI/GYzfrU33hvAtEcdHLzthhqf64y2waTcS6QQq20nH
	Oi8O7t/JR8WcOpVX4FSoCA0q509wcIye1GhAFqxnhGicu+xVf381Uva4wPX/Q8WJ
	Z2t5DVwC+4eBjycGodUcaA6KTXlAQOaT0iKIEM73am/48s7x4A37EzaddHohPy34
	NDHrCDaSry1DXSK7KmCZ/2U5Q2v+fyLm1JU4M9Ql8OflMEWiI5gd9oyMlCK8+k95
	xc8AZQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc8ky33ef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 08:46:33 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso11809238b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 00:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767170793; x=1767775593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCIWG0KUEjnWmPrpuMaL3sNQkAcSUVNdZBgNTm0O2wI=;
        b=SIrF+YrNx4LT7EdsVHOiz6qPJT8OvUAPOr2lPtRDM1iUVITam2ZzpuR1JMZwUYW2jp
         wNP6vpu8ksbFLogmL7tJq/Wgy5g2roZhwwsuyXin6m9/n+0LLl5eR5YNZWYKJeRZRKvY
         Jl3Say0A4UspdWjkZUeGujFqvNUpX3vvXK48yjW02zTapZufXcLYBKtD0dfIVlrQ7Mfr
         nKhh3biuJO4AFlRYmTs6IB1ir+f5iJ33xM4h6y1vtIAqdG9z+1FIE8wN3pvDP1Ec3kKI
         +aztGjvhU8SVzcfoI6htJrUyORCFewsM6Jnx53TOhl8PUmxuuufeTnHtljArc+d2yB2V
         4/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170793; x=1767775593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KCIWG0KUEjnWmPrpuMaL3sNQkAcSUVNdZBgNTm0O2wI=;
        b=mB0VcpJebUjic9nbAT3VFCD8dCjfUAmslcLdUhcKp9dFOjQot+nkY3s4KS4Y3cw1fM
         E3K3qIGXChMpaiSzNkUELNE95Bv/76R1pIWi19n30l9jl5czr7lIY4sMXW/2TBbdFXu8
         YdWUaUvvEZ1Hj9N2C5f/jScg0E/EowfBsS8inGVl0ctj3HMWTT7ahlbVZjJd7QuiNp1U
         Cqp2O8sdg3WejHj7dV64AKnVi2/l4pAQdvADTlx2mnHH7EgZWLskJ0bnNElpgKv+HTQg
         UDBVxg1EWAyc90KQu7TjTqt21xKAOCpD59RtEInzNAAnTv/oFqF0+Nhd/wOfKzQUFDLu
         dIPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLdA24ThAUZij15qTWBlP9EW4uoXE+xqKXjQTdwOiD605Mq2OArT8ajk7HYksKm96vTZ30gIwSx9LI5qPN@vger.kernel.org
X-Gm-Message-State: AOJu0YyxrQ3coMlG58/8vW7Md2D0VgUupDpx12xvXo3AIRchgDcAgda1
	uXzmzyShczEg7GdmjtsnmlIlQgjlX+ufeaTSeKkGRlNjUfJn4TSSZhpnxJXfE6fVbF7jLkQAw1f
	OlLcn6VOpjOlNC3Yks/NYcH7oBF+kiSNOm9o+nliOoDFVsU3P+1qiC8KJNDm6c4MITAlY
X-Gm-Gg: AY/fxX7QEc4mFLvy5QQYBunCVh/ADozrB4yXk4+9Gyf/eCKf3C24ZRhEPUuGfGUq2Zl
	Jey56glqWCb51ElzTSnRl+97fRqvbfGL6zj3AWkt8KxzevWj6Bqc7mNMas63ghKhj7WBFDwd7+m
	C79u+8iFsmfZI3gYMynlbDIET7pgIVMFi2vyFpY+lGn5O2OpoytVcjGNuhRdY9LttOFevNbonL6
	neD7gNeqTifqAlJTfDinVXvYh74eJ4KRFTbBOgPGc93tL0kcjpwe3RnDskfLsQCkuPqc40H5iEZ
	V9FlCEfrMMRs8GsQeBjJCO005X1fgty0k7lK6QZPzs5VejPY8pxinG0bjRTE8TMz1AoVUFdP/mC
	ugRiRbMkwasau6LOXszRJ2TJH+ghnYcpk+A==
X-Received: by 2002:a05:6a21:6d97:b0:341:84ee:7597 with SMTP id adf61e73a8af0-376a96b90b4mr33055702637.47.1767170793005;
        Wed, 31 Dec 2025 00:46:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHMKoZ4CfyxJ8JIdhC4hUb2vHcOoZVD8S+TG7KXsGGWw4yvF8CMwCaZiAcCC+f2CXKE2gP0xg==
X-Received: by 2002:a05:6a21:6d97:b0:341:84ee:7597 with SMTP id adf61e73a8af0-376a96b90b4mr33055678637.47.1767170792541;
        Wed, 31 Dec 2025 00:46:32 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7a018eb5sm31356070a12.16.2025.12.31.00.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 00:46:32 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 14:15:28 +0530
Subject: [PATCH v6 7/8] arm64: dts: qcom: talos: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251231-qcs615-spin-2-v6-7-da87debf6883@oss.qualcomm.com>
References: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
In-Reply-To: <20251231-qcs615-spin-2-v6-0-da87debf6883@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767170740; l=1446;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=phfATdzc4XCdePUMQ41nf1i9Bjnn7pmYfcvybrB3at4=;
 b=Iip2N1zjGZ0jTLyDFYONcGwTZ5iMCyBqGJ7+MURetCbbu+cayFOE97CPHzgF1SaSSsr+7R9nc
 FtHmtzyOjdsBmVz+y2m7zEKkKR9FhkQld+mVaSTRLfgDQofF4UTj8J3
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NSBTYWx0ZWRfX5EuGwFJhTEek
 rkHVDpdrsNuLKHj5agcSM7/834kJiloUHFzcF6S2joRinRocWcklZOJeYG/H7QvFy/7jC2WKUBT
 uiG4d2pssYEKSjd5+F4D6VbYFc4AVhaVJ5ktwba6JjivJ46dHqr8FSqrDLK9/sPYtvVkYG17jew
 c9fyGjti/DGkaIoW20gZXLxBDg0goK4bEHHHXFHjUkNIj0eTwIgFnFFYFYlfec1eED7g7KFa/2q
 KxBRckrfDk/hdZ4Yp9zLZo3DnMMTdSt11UXodXNVzl3JDrSapX/NhzTUwzGBmSf6RQynZR4rN8K
 aOcAexwW7/uRNu4RxCNsH+Ipo2OV5t1iFZ7FhToPHnNWZBXPWHdF5yTS1IiG2cVkgOqGluJC/5N
 Ig43FN0me8LRZLZBtF/jbFvYhUQA9M98KptzTayLSmPhYTTByAyEbMCChOGp51Egcy9VksKDugl
 aqleNCGT8ADtC2U1JAA==
X-Proofpoint-ORIG-GUID: vyi6y3JjAfoWPLAtITyNrIHh5dhYrb5i
X-Authority-Analysis: v=2.4 cv=BuuQAIX5 c=1 sm=1 tr=0 ts=6954e2e9 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=doS3iEISOceegCkkCwMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: vyi6y3JjAfoWPLAtITyNrIHh5dhYrb5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512310075

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed when it reaches 105°C.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 6880630e6735..606f5e234e4a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -18,6 +18,7 @@
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -4844,12 +4845,25 @@ gpu-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
+				gpu_alert0: trip-point0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpu-critical {
 					temperature = <115000>;
 					hysteresis = <1000>;
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpu_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		q6-hvx-thermal {

-- 
2.51.0


