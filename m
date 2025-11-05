Return-Path: <linux-arm-msm+bounces-80477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B60C36FAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 18:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3186344F77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 17:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1779E338F39;
	Wed,  5 Nov 2025 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TvCFJefH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CFVx9Kew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C76632F74C
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 17:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762362725; cv=none; b=n+EcVaIHi94FFuOzkcHTqqykWw17dqSdsLcTEB1874novllGIyiFjrc7pqf7vcKAC2atFcRmip9dbV2YdXlQIZ0z0AZK0Mnc52NGMGVMkJ6pzpdnnnpiXt9kTfIXQS+MflacAL4sO3rsCkCqjzPaXnbETcvPaCvvExoAkpHheGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762362725; c=relaxed/simple;
	bh=UQno6js1laBBGRuM1136RGmbQMQqm5whXfqyW43PMB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pt/E1JbILEx9dYyWjkN/PPnfHfLhQszB4QRNbv0rsiUfPIXA2nXnNeoyQiDe6nvC6aHP3Xwd3D3i3eOCwILI6cGtG2Ns9H5TlfZ48XYn4R8BrjPR5iHrlDHHu7/GYgQJ7TfyGa2N6+4SIgCzzuwhyHYz+K1CeKn2vbji6kku5+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TvCFJefH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CFVx9Kew; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5DRFiJ3913967
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 17:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=; b=TvCFJefHSbB5LraM
	7j8yrZefkmefvf7qVaqzagyWMP54pHfGAxCBe4JUbqlvJTK1+kuWtowv0s0gYnvh
	Wpm2j1icNps2RVFLVX4M1tf79/PMnd7bgr9nhzE02+4ItIDcAJg8uw2j8vG+TZ6s
	sttKNU941dMkFLOur6DbgJWYfbGMBbVrGAoUkLDI+A1uHKoGRFom8DLZNgXDG2N7
	5GZAqs15h8cAs4OGQzCTqKzfkn8BLIPvZwo+Kro2ujkBMNkdmfavZhFPBGLBkAyR
	TePXVTNPNzHt0nUIvWAgeYRB0Vne+dokdNatnWB9w/hnWL3JW8kQgo+vvW4pZw48
	8mjVdQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7y37a3ga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 17:12:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-295395cedafso1185635ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762362719; x=1762967519; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
        b=CFVx9KewCmnKk2UpongnYVHUhzG+BXtiunCaNFcDsa7lnPmK8pWn2AQD2+GiuZ0K2Z
         /pXQQ1T1FIhG9ubFGL7Ilk4FcfoW3lD65octAKxFo3K8CDO1fSxrwTTotJRSH9Kk2WIN
         Bk9zNTLGaE7KroArwbbqiiZLVaMsIYF0QGwrEggNZ+xtVDJmvACV+tOSnXohJ2v/w3PP
         S3A1pjAWrDDbTpq/doIRQHKXvRMAAk0sQhBezEMqU1AJfw8fdYX1yNesrtITlu4PN1cc
         OM5JnNn9ELVp1VZsfVBaHIbhgOWUsW235s3f+Y5ZFREE7UKxxhe92+JyJOuV9NtykSR6
         kB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762362719; x=1762967519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=791ljE8ofv4KbxaCgLnX5+k9zZdbkdmJjeOWvmYtNeI=;
        b=t55Xr5NzdYMd7IkFLtEsKBUXGiOD1CHS1a1U176k5Ekid5zQ3pq5mqETZxZpRKsIl1
         u1Iwt1VJyzax6twfAc2R3bEw2Ha395rd+oeR944GQXwp4uDHxBLlQbmofH5k6tSrFYKD
         FuiQXtpQNSkCnq/i7+vDvh2dr3KNbF7AtxxbqczdgQBcexw4JOHbK4ZmoA2+N384/YhB
         nVOirgUooS6mvI31PTuy/nCHREPNQmWU4GIfKgyxge+lL+6W9f6hH5+w5SO0BiOspQ6f
         nNUdS75tHiCb7pWs0uHxXtxHvXrwFl9h/4i0gw3JsmGNsqIFTjSaGS0AMw0VbDHp5kFa
         iUow==
X-Forwarded-Encrypted: i=1; AJvYcCXkr8S6D4js98WoBW/F2EiTnoionvf25YBBgwuE483iXeIVgkEU/oAjRlvlDqniIG2oo9xPK4jfYXWpItBq@vger.kernel.org
X-Gm-Message-State: AOJu0YxMGWZO/80vruXgwuTq/nZi6Ip3lLX9pkBl9Ng39yqAzUo1Dmyy
	LQCH0HWIU95yYMQ4fz81udqAxPlfeW7J32Ksj0dgBlouKHuzooquJzQTgZ8J6+uf9Jkj785HK89
	JTvvV+ZNKxte8rlkyrmQOzkNUAtuJspYNFBzhl7lT+BQJmlQA1vllIg2nZ1Rq7V0TZ5Lj
X-Gm-Gg: ASbGncsY5OYCKW288v+XiJ4P6a+Vjn/yBMgaYl7KEeT8+1aQ9+J4tAd6cQdQQj5AjzQ
	8KlvamuhJ5onrTKEp9YJG2o4yrUYKZlP2tHFqw3cGXvdH4yGydH/noRwChiugcKo1a0BYqsap2n
	sevXfsvhNFjQBZke7AHk+XfUUGYEkiwanqwI4fjJhihAAE1BbtxK2xtf4Zl1pi2AOzBSE3j1a6H
	O3BhVe3wklalwwGLCnvwp+bTfXlW6D5Q4I87ejVO2ojZItSTa7YABntvb2YLb0bPvF0YAkyy5jN
	tUb/f2uS4YAhe5vZ0lorZUIcDEfyuRcTeKu1xCDcIOBFoYSVYfAMjz3Mzg/j8bwGrJROdGGBuvl
	0Zuy070QIWNDpRNh0JKdZUdA=
X-Received: by 2002:a17:903:944:b0:295:7f1d:b034 with SMTP id d9443c01a7336-2962ad82751mr47925045ad.4.1762362719268;
        Wed, 05 Nov 2025 09:11:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7vx6gRi3vnn4VoDJjmVj/WM+UJYf70Y+veIY5RUPDoORE/IhuQFEYI/vOAmVMsKNxs0eOpg==
X-Received: by 2002:a17:903:944:b0:295:7f1d:b034 with SMTP id d9443c01a7336-2962ad82751mr47924565ad.4.1762362718677;
        Wed, 05 Nov 2025 09:11:58 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29650c5e3c5sm813955ad.43.2025.11.05.09.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 09:11:58 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 05 Nov 2025 22:41:33 +0530
Subject: [PATCH v8 2/4] arm64: dts: qcom: lemans: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251105-a663-gpu-support-v8-2-62a7aaa551e3@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
In-Reply-To: <20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762362697; l=3334;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dv8fOd2JCzTjOzv1PtyfPnTYZUgbOREKQ5dEyRmj6Ig=;
 b=DoDXbN6jLUIZNAoa25vhI/IM9EWA9bQQ16qz3CoxDpGRSpqJRLyXqvCVt8BGN683j6Zo0Ghqo
 c2QpoSz2/+zD04sjTQ/uxjzaSXmnBTES5ddxYfRo/kZzIDgstrsfWot
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: TE2e-fYn_hM8d94MT5kKv4TGx-QGu9am
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfX1JS4ubPSHvGk
 XmZe9NP65jpX/Ew/Ud/y8qYxKWUe2Y5YcYKmQHFQ588y3JK+/nVKh4tJZawa/OIJXMJ5eCxLyFE
 hiy9oVDXXG0ZWPZmPK0eafyaTKlTE5KSEIi7I6aHy4M/sdmcGxtEKx+/2Om94RcOaU95Lzwc1to
 CPPv2CqibmFhlkx7czICRgm7HogvFaKYcct52xZFe26e3haHEgJjO36ELOJ9A7vWpw2TgjH8hD8
 uD8eRYHf/V46I8waXIh+OIbQWtU3q7pMnvX1Gn3AHRqqh13oU0yG/L+Jum7OUHCBvpkQsJ2X+vS
 0B0SZefoxs4gwU7j5xzk+KPN6LCWEdxm04yOQICtYtqESFozspplgCoHTx6ERg5BWEDmxTIugG0
 P4zSdOagpwual71Q90KXUj61wqc08w==
X-Proofpoint-ORIG-GUID: TE2e-fYn_hM8d94MT5kKv4TGx-QGu9am
X-Authority-Analysis: v=2.4 cv=Ev3fbCcA c=1 sm=1 tr=0 ts=690b8560 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=e3DMr3DmCBmV6l14PKUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050134

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
index 883f9e0ab45c98b9e128f3fa141d625431d89831..14d9f31e7086dd337c658cdb3989a4fd1c83092b 100644
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


