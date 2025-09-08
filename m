Return-Path: <linux-arm-msm+bounces-72651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E80B49A38
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:41:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97A11898AB0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C0529BDB3;
	Mon,  8 Sep 2025 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WZ5ZIn3l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6322C11E7
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757360436; cv=none; b=WkaYCUUmUbm4hpiwpheX/AwTyL49l7O/y/PHXffAWL0qs9V7MUA1srsvRwtgb1tkazwTYdkjDAorKIeZ6aFma2VZVa9w/3544/8UexmtID2snwxyb29kldCwaiVincuiOz9dHphR/vKHzTrIO2Jva3iu+ux0+oJCnUIS9/p1S6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757360436; c=relaxed/simple;
	bh=f/liO0+ury+XRtstpVnQGmG1kTpZBd7a+7fYa4BE+Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eN8llQdt6L9Xhsi8z5tKKj5aIhh9gw7u5DF60CyD0VOZ9dwDTo6OQptIGakyToKafkoKnP4tnwLNnZ8oHNNu+jYjvYX8PtnYrRPn6HQ6aN2D/HVp4JVdls0kAvUtOZud3AjhtqgQta0LxKZh4XWtTLEIt+dtOaGWj2ham2Py7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WZ5ZIn3l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588GrOHX014127
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:40:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TlQf7uI+N5nmhJzmx3D5G93mBC+iv1av/YTKYfSZVQM=; b=WZ5ZIn3l5GTRI9uN
	ru4PA799A8l8dxZvAf6oVvuJrlr0mF4YeSedHAdOSgE5gGgb2t8lFH+o11Sw6SxO
	f5X3HHY80+d/MvbjwRTWZKoWhzx5a2PVYKYrqi79+UcPFEtc+uY1CUssNvs2zqH2
	/swvDNFNxlI9OGjZBzMRpMlKmA1betwVyS7n8+9DQVzc4RZ9zzJVvJjxgQOjlQb+
	wrZQV9OSpOWWIJxMeRBdgieG/UDcEQeHOiBwVw8RQkzITOSSrAacraWgLrgxMAgn
	U984+3Bvax6nj78P8YqVgagZ+1C/Pc1YNDNp5JzsN4joe6/JjYuaBqz3N9ykvrx8
	J6dwiA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws5wbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:40:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24b2b347073so63197065ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757360433; x=1757965233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TlQf7uI+N5nmhJzmx3D5G93mBC+iv1av/YTKYfSZVQM=;
        b=vMs3o6bj4ujbfoe9JDzU+T6wc1gt6vnW2adhnBPpkaBiFnwtm4tW8SfjpzVlRFxq9m
         aylVj6lDlfJNHNzp0wo5sWc85lUIiqT2hYW7NeudVqvp2nd7hw5cI+GxtE0XuqCc9osT
         1v7GjsGAm//a0AwGoiEl5Zoc05zOrNRS64/5YjzAlSG+TMCmkC6olXgxigBwT4gTPUIx
         pkFx2K/Nipa76p9UHb2wRClJr4KN3kO3JyiiYTDzCvH64vVPeRTzfG29srnCHhNRaO6I
         4440hP2qEg8lbqOlgyt6ao4Cegv4/W9SVMC4jR9qbeScuOPMOcjFMYAGj1MPUntzfFyG
         c9pw==
X-Forwarded-Encrypted: i=1; AJvYcCVsVuBRCQAgrfaAC2XWOGAlK1r4ZxjR83MEzpuSMNh+iZ3aLoEbwWnKHNT7/cayFcHYlQySeZnKfzDtGbPY@vger.kernel.org
X-Gm-Message-State: AOJu0YxVa5gX7i0wGuqlwq40WtpWVxkIp8bzmCb919WRjrhiUEoe2osV
	y/SPUyBKewDgeq6V9Jd4LlSblzC0y7TjU5d9IlDgrtao7/fhlwYkA7vdJCb5T7rF+x9Zn8JgYiC
	wXLJ8mhthn7JD/Rk27EBySslM1om26YBbUlpf26zpSoeldcC1t8BzotIfSgpv2qqhrMy/
X-Gm-Gg: ASbGnctiO1aM/FA9ys90sDuDq8VE7xKvCg+Pva4cILbMzlX5m3ML83BlyDLw/TW5/yt
	/24GqmSB+jGrzqggiD7NEg9okQkgVfH67xBuTnGjX8EHm5PlfAd/bG/GmkivpGpi0lXJZ1rgyl8
	e3QEFkQYBWsE4G0GZ+/WgphJmtJFDDoLgPZ2Mo72SltetpBYUNHTeKBGQK2ARB4dNwdKNwHwQaQ
	N3ZklB/B2jhgJXY4v4Cfr9hx10crxKVj4QbPT91MKqttdxJ/1dbY9GInM5RyLTCWzh8vVCmMTqZ
	DVXpTeADhIGW4RNlNbGjhIFvSnBlNXJHuVRCvQLdsRUoEFTNeummxhP7QSKM5tSU
X-Received: by 2002:a17:902:ef51:b0:24c:cc2c:9da9 with SMTP id d9443c01a7336-2516ded4545mr113956355ad.14.1757360433132;
        Mon, 08 Sep 2025 12:40:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+UOrd5zxwYCwQsqJjJ1KQY0ewjFqba/O118Yvv6S2o17AqrHtZbIPybHZDLljRo4tPn0ZKw==
X-Received: by 2002:a17:902:ef51:b0:24c:cc2c:9da9 with SMTP id d9443c01a7336-2516ded4545mr113956015ad.14.1757360432585;
        Mon, 08 Sep 2025 12:40:32 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:40:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:39 +0530
Subject: [PATCH v5 4/6] arm64: dts: qcom: lemans: Add GPU cooling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250909-a663-gpu-support-v5-4-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=3278;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qegwpgAioEKEmVS8TSb9ZldColVWRJ+OCeiisZIO6Sc=;
 b=p+OrZ+BgX/ZDX3ycIm3MeYIOuBHQM2L/9alIYx1TLY+d+MHtpshlnTtJD4Nd5Spr2wpLI8w7/
 Fuu13Rket90Bcc7CtGMI/OAv8wScHAI90zbX4vviDIkuuDuHdOkJCs5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: meBOT_FBY9XWe6BDImdvplxFSeax38z3
X-Proofpoint-GUID: meBOT_FBY9XWe6BDImdvplxFSeax38z3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX9+uae8Aw5gri
 bgfj0mJXwL2puNciPAfSnZJ2OU7vK5Sw3lWeV02ORSYZ4AdTBbZPempK/GJuvcN0vbnksFei244
 ct2ijknTukuwVci6EAFsiQTlZmhCttKCthdT+v+gWClrQgFdDlOheLjTdoo3mtGw1jfpa7xR8Tx
 6XC/Qkq+W/jLV9J2fNPR/2pfMPIWrPR3PUYBw1q2H8ASBbLjKB7Srphj4aXnSDY+/xaBprsCboh
 gWzUtSbeKO8pnQMb7c3JjdUH5ckPhg03FSKFC/eX7e4yQF74SzRGZk7ep6kxzznx6itx0mhuskD
 +B4aH1t1TXDcsMAz+cY0Z3EVO/vUGFcnp5Pdbrz32Ls0jcIUG0TMN1CtT8e3pf78NQvxz3KM09T
 //Jq+Zra
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68bf3132 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=WQ4zR0kUUHxS2nCRhxYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

From: Gaurav Kohli <quic_gkohli@quicinc.com>

Unlike the CPU, the GPU does not throttle its speed automatically when it
reaches high temperatures.

Set up GPU cooling by throttling the GPU speed
when reaching 105°C.

Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 55 ++++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 52c2533383920fdf34dc1eba11e5ec01209f4e8a..cc64ff9aa8dd1f2b610548e5a5f5192bd4feba7e 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -6824,8 +6825,15 @@ gpuss-0-thermal {
 
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
@@ -6844,8 +6852,15 @@ gpuss-1-thermal {
 
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
@@ -6864,8 +6879,15 @@ gpuss-2-thermal {
 
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
@@ -7054,8 +7076,15 @@ gpuss-3-thermal {
 
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
@@ -7074,8 +7103,15 @@ gpuss-4-thermal {
 
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
@@ -7094,8 +7130,15 @@ gpuss-5-thermal {
 
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
2.50.1


