Return-Path: <linux-arm-msm+bounces-71730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80575B4164F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 788746812C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:21:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 169D42DAFCB;
	Wed,  3 Sep 2025 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oyOczDZP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7368C2DE70E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 07:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884048; cv=none; b=L2+wxyU9iGolRPHddkIrKE98KTHfrFBRLgnbC/FOOgxFmOLs9fT2KexrBdwKypXuUvCVeiZSQp9JEx44WS0fVULofXMt3Ovrk2x2jGg0gdkFGTuzWLMU7P9LifBwYBVRUXft3ZzV83cL12Noe/QjLU4uwJUhqmqcFGDoKQfCAkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884048; c=relaxed/simple;
	bh=jF9d575p0CJgp4rHhiLU1CfFzq2UthJSlEdkim4Fnnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT7Oj0mhzxCfgUR+sMj6aOnTXQ2KhqpXdyK5MBWLuM1El58cHTwQNHlk7wX2DgQpmVGvCGv/+/L50Q0bUo2hJP4J2Ds+R+L2+ZLEIlRvUaYO+R3l3hK180ZKoeP+D2fY3bmrsmAlbao9DjvSOfhP2+mmT0u6TlyHjIY8cCbKAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oyOczDZP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5832XpRh005780
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 07:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sNOAegK5RZAaDE+/8oSO0sUGuuiN9cbKJbWju8HXrOA=; b=oyOczDZPCkqMxGh+
	UXnPsciiheK5On/uHeMaIQqtvIipUcOg8L6Sekz2+RAs+yQWeDWyFzNvfvlNGGG7
	zy6RjX+jr4f1bqyoaCa9XWzhN9k7O/QnpV+qnL8B/TMjI5wMRmBH03i9fMJfaEbh
	6ex4n4wEP8AyCGnFvsJM1NV9FaHzeqnFIyBiDjAAs1WnbuvPRBRKn78sJ1NGDYbg
	nVE3XWmNVImh04qBPgbjrzhD6z3gUnlUeFd+OCE9Q7kp89hp46WX9YWPPyjVvsjK
	Ii3cOE5hDl9MymeTesisu2ta28w6c9Ja8RRvbYxMbhgyNXfG8g4nys/uZURuNPTN
	Cm28tw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urmjjj7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 07:20:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77237977e7aso3791471b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 00:20:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884044; x=1757488844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sNOAegK5RZAaDE+/8oSO0sUGuuiN9cbKJbWju8HXrOA=;
        b=DqJYXPQM28kkY2zY9vNs0m0fCLx495zxwf+kSvh7mZ3m41BrYkMLRwXYPWvQgHdVgN
         9q5uQpkq5B7IH3fuNPvl6573HB5DMcnLrqCm8hU/KWEKOIVefi2Wmc+CiFm0qgSxOCPl
         l18UdTHVoj9Q+NxMiufp4y2QimAhpCCk4305lHpaXZJRmRiGylTqR/XTAA5t5zzAbNBs
         do8bHG7uQdTkJW4WQlcFgzqbICMtz2U0mj9UGznuG6f/w1OShZjv9kqEyQ9ei0Upizaq
         4EsAGR8B1hwkaSCXcigxYXEtqRUD55YxloKAktAgtR4oZGkABxA1q2QHctLoZ4dZXCGc
         caTw==
X-Gm-Message-State: AOJu0Yx9Ielvz0b4ywV90akMPxZC9cgwQC/T7yGT/LIHJaouPrEoKDzL
	ldPDNWB5Dn7U27JHDN6S8p6ZCGpDjN9d9NoB+1FrdwNA8vpiM/k5OqR/3E1LqfM6RaOccv+ZBVC
	o2W709kQNKnUOEhmcBsB8ppGe12uq44/yrMgTmnA2kW8P/x0RvUVjj1b/zLX61O2lC8Gh
X-Gm-Gg: ASbGncssErF91lvGMiYxUTERSkykczlIhgE/PUCEgNW6q7X33AVHAsJD0+HoVIasT9y
	mF4WH6Aop62wzx+1h5wcSIAopmrDwMQCpxl6OsgwD/XM8O3+27Uabznassd23FClphfyX0xar2o
	2u4XuPj0Z8HS8wGBZV/jy8YwMb4/7L4wvGVGTk9Hh6tvBAw/8Uhmi94bxdubDWhDJYpJ86MpPyJ
	kF7Om8tTzHEb6HBPBU4oTv0qLm/2/qn7Z8JH2+n8h9EoyfL8sV5X0lyhQ9RnwgOVaErbqF7KRuN
	U5wJahfSpFg/Tm8cZlCxRdDzmvEXdJKPX2E2Kuc/8DMewIxXwi41u2cbzrlkYmh4
X-Received: by 2002:a05:6a00:390c:b0:770:fd32:f365 with SMTP id d2e1a72fcca58-7723e38a3e1mr17895781b3a.25.1756884043911;
        Wed, 03 Sep 2025 00:20:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRoQDPRGyxgvIYbUjcgck6/XvM9wRa3NDYhFbn7RxwJ/4HNb57QPKMIkyegrDJbK2DGorniQ==
X-Received: by 2002:a05:6a00:390c:b0:770:fd32:f365 with SMTP id d2e1a72fcca58-7723e38a3e1mr17895747b3a.25.1756884043467;
        Wed, 03 Sep 2025 00:20:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a2b78d7sm15816191b3a.30.2025.09.03.00.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 00:20:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 03 Sep 2025 12:49:56 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: qcs8300-ride: Enable Adreno 623
 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250903-a623-gpu-support-v5-5-5398585e2981@oss.qualcomm.com>
References: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
In-Reply-To: <20250903-a623-gpu-support-v5-0-5398585e2981@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756884002; l=881;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=0A3WcrkpO6FZwh7gc5vhciObZkq6tlMdmmT7IsLC38U=;
 b=rTUl43YD2qv7+1bHzFpljeux3g04J8jUOBYTxEXptNSUGXRIDHOIu5Pvke32lwwqsxjK05HpP
 ZTLwS2TsLC7DmB40MlfOM2R0Mf43RMtj1u4TbxTldl5q0PyVToGbx+m
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=OemYDgTY c=1 sm=1 tr=0 ts=68b7ec4d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=VSJZfRLmIhO-6U2h3l8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ygbqI3mbD_--Sfu1MJ8VyAo5qQCSu7m1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNCBTYWx0ZWRfX8e5Y+1Xxd2iy
 MvtOT5uOpmDxb2HviL81ExhxrN0SQiodap1LaMA5STcQ0HZV9rUDVATA2j1WQLi2MsKokHoUx0f
 0weC/OgCNrl6poZZzQpm4ydpGw60z51L8slMnQMSTd8nVAr/YTNVhYnGaKV6dyih/a+QZjz+X0K
 1HdA1ZsFTwjoc3wKCr6gmw0yuF1F/MK2Ndungc2yMN0XkmuFb8ehSELUBIhnDo+pXv5xQKTWr2z
 9S7VofU6zjBzW2XOyRE8yQ3vgcher5vs3oykWNL/gHpvdsdNnpirdRs47Zr4RGg3oRzDcL35K/c
 6CvaA+5CM52KzilG/7rIrCUKWB2ej8WpuGFaBug2arK2jOObxj5JPz2tzinccPPctD1MVf0Ddxy
 cBOlnupf
X-Proofpoint-ORIG-GUID: ygbqI3mbD_--Sfu1MJ8VyAo5qQCSu7m1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300024

From: Jie Zhang <quic_jiezh@quicinc.com>

Enable GPU for qcs8300-ride platform and provide path for zap
shader.

Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 8c166ead912c589c01d2bc7d13fa1b6892f6252b..c1f4993ee3bff54bba516a3b652e13f730b6353c 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -295,6 +295,14 @@ queue3 {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/qcs8300/a623_zap.mbn";
+};
+
 &pmm8650au_1_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio7";

-- 
2.50.1


