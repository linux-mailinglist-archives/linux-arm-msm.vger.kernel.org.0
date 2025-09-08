Return-Path: <linux-arm-msm+bounces-72512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD455B48716
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72BE83B2C72
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F9A21ABBB;
	Mon,  8 Sep 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DL/KVD5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D838D2EB5AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320050; cv=none; b=ACcpo0t1c3g33bv1o+oqLFtWHH4GkWUCyJxfbUrRYJRI7wund3g6mpuN5SuN+EW0++SZMbDjn/k/zDr1saSM9qKyEMTksZvJMactxpT1dD9SFYiiKh5XGe65heMF3RCtfGY0bFJpYsUXGrVbhSyaaffspQH8beDCP6HvPmqmvdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320050; c=relaxed/simple;
	bh=ji+f74TQTXhSJNywxVcexEvz4zhxi/UIu3IXlExTfoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rgmP/1PLRBfEu0Be8DXB6uHTokpZlgwc7HSqjfPSpwxUOeXKPbf8LPpg6twqDqB6vG66SVJhpCPjAOyxtOEqEgWZN2EWzqoL+rqGZy4RNtlzDY+/hx632mh6pxkN7T6f/92apw1uDXGEkR7utWyxQuvPbL18QsXgM/EPgERn+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DL/KVD5S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587LuMpA029406
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=; b=DL/KVD5SICPxQjay
	eFeelu87pJEtE6WyPpe/TbrQuhFmqAbxXEanWRa/HYkLRTbZY7bI0FXBkaVzQdIE
	XPtj0wNfimWN/yIk+vkgzff6kxC5Q2xAjGeY3SYxZzOodUwVAwhXSkVelgDuvbQ3
	UhV3NAlaukznrCuXfrc5FQ5GUFVW9h2EU6MAC0Wpl+rQI6wcPOb1nAghI/hmaUpS
	qeHVDlYITnLeChBHx3g30JBfcuAsa1o3z5mORSAhs/h+kz+hcuVUOFgIsdNudpHb
	/opQeMcoZhQ39scN412unwnlClsCTwR9L/vToA1RvX+TJ/4DY9R4tMPiPKgHh68v
	WFRR0Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490by8uw2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:27:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77243618babso4097619b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320046; x=1757924846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=;
        b=q8B2NbSMqqU5MmmN3Fue2dGASjLBds3o76APgIouSj7js9Dqpx8K89MBpRNOsEGCs+
         dw62K4tjvRFE7Ijvzc+gKxj0wMJq61HOmKt2wMRnP6MJjiRLnWOo7RcNJXojBRO6kF9v
         LZ5Icve4mZk51c18LulHRm560i1up/Kp9HSA8Vy86KhEehOx0gRnINC+xcM1Mg+Lgubg
         N+1s7LAXILKd5iv6DxtdxXzATIxpIHO9gB0RUGtF30K5KRusjj7PJazWjsiWIXAKb0Gt
         /zhd79nYBZwumc66+crtNvBDw5v3Q43C9/Xw8fbkB4ZpNVMTgW3D35lECxcyWUtP8gOp
         Qtkw==
X-Gm-Message-State: AOJu0YwRj195ZPqhwtVnA/EbIDGd8CZVP1AZQjhTe0v2wpr4oF7HB2dn
	iFuEN8kNDDWNdmIwnYX9k3FhxABToUkYhaDy12EduaGm1xlN7VJi0cbZNqSQ1UvW6jwuJLhm3qH
	ESGeWKziDblGvMfxqZ5mbJ0EHUwG6ohE2jkMfT7y0dS/xUfaQ5EQbj/SA8ZB4f/HpDMta
X-Gm-Gg: ASbGncvyceYYU5u99uCm2H9Sg8iFqjpFqiXT1hUOi1GrvTqGQnEBvO2r9zpGqG05wEI
	h1ISmzKTEt+H0EPW2dpbzN/tqc8PV5FqSBmwzWlG00oSp2Qm+wUK7DQgmmzO3Vg28x5aRCR03+i
	9v1qSjp/bGAwlosU5CqZ8gBLU15USG8axb2mxHHMn1P4oJ5c2n4n+kyItyHohFZKlfAk7VRYqnQ
	l9TCHLu6Nuv4al5+jMXjuI4eaoqS8nCKDDkK8wWpxSERLFXJ/fYhmbIF3jakPgRNm2/CFsX9/ap
	rQk1ZZ2jkMZ5BMi75/VZGSCwAsaFSVc1cjtJ8OhVoC2p2QyqhMP8JSuM5i/laEsr
X-Received: by 2002:a05:6a00:1996:b0:76e:885a:c338 with SMTP id d2e1a72fcca58-7742de69de2mr8431455b3a.30.1757320046250;
        Mon, 08 Sep 2025 01:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx1RcsKkYV36SjKV6SXfFHKm2oYnM/mkT0SUBQ3saOJZigojpOYtZEoUOvIGnympk/b5UAYA==
X-Received: by 2002:a05:6a00:1996:b0:76e:885a:c338 with SMTP id d2e1a72fcca58-7742de69de2mr8431408b3a.30.1757320045741;
        Mon, 08 Sep 2025 01:27:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:27:25 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:54 +0530
Subject: [PATCH v2 01/16] drm/msm: Update GMU register xml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-1-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2416;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ji+f74TQTXhSJNywxVcexEvz4zhxi/UIu3IXlExTfoA=;
 b=bIRH6FXgHyR7N5ev4ctKZhftLdIKx0rpAmxgC6FNREj2Ax/ZvRvRsRJ3P1WOqGT3PxAMxB+2i
 sTYaqLCBQxkCyNiUTjyCpWkLVGXVXmHRSBynKixHcZVw3pr5Q4iSj6O
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yv8PR5YX c=1 sm=1 tr=0 ts=68be936f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=FORX3M3cBL6yUa9eRaQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: gr--kNOjE7YFGSdf5xu0YoHpxI4kk_N5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX1+O9mfb7z4vd
 MGiDWPxaZu9CctnMOh4RnKhG/4UAFnPONa/7zLnR6G98xF5LcwVGLTpCFamit+nh5c2LyM5bZPP
 o7QLke1syGbaW0MyDgQ+4D4uw/lPtZXAjdqPIN3G/EnhYQPGmYX9os9bto5GuPCKjZS1OFCDIcI
 CMDipihsAqewhxn0QcW2+CfowdnYCAZGa304JQ2koR2UgXRjU5ZK9N1PgAGMhyTjPonfmbHEmjl
 T/m7jEMyeGXRUrBVi7k0Yq+toi5VN/qVhH5at1XrbNuKpRES8QG7I9497yQlfS+7iXgTwYvgdlm
 ZKJWF8p9HgbwwW2QhikDhWbbtP86EFKNqe9tbmLORrA3FQdwYvoWjS+fWX9wKXRQsXRNtMDfBnb
 y16r7shC
X-Proofpoint-ORIG-GUID: gr--kNOjE7YFGSdf5xu0YoHpxI4kk_N5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Update GMU register xml with additional definitions for a7x family.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
index 3d2cc339b8f19c8d24b2c9144569b2364afc5ebc..b15a242d974d6b42133171c8484d3b0413f2d3a4 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
@@ -99,6 +99,10 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="6" type="boolean"/>
 		<bitfield name="GX_HM_CLK_OFF" pos="7" type="boolean"/>
 	</reg32>
+	<reg32 offset="0x50d0" name="GMU_SPTPRAC_PWR_CLK_STATUS" variants="A7XX">
+		<bitfield name="GX_HM_GDSC_POWER_OFF" pos="0" type="boolean"/>
+		<bitfield name="GX_HM_CLK_OFF" pos="1" type="boolean"/>
+	</reg32>
 	<reg32 offset="0x50e4" name="GMU_GPU_NAP_CTRL">
 		<bitfield name="HW_NAP_ENABLE" pos="0"/>
 		<bitfield name="SID" low="4" high="8"/>
@@ -127,6 +131,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x5088" name="GMU_ALWAYS_ON_COUNTER_L"/>
 	<reg32 offset="0x5089" name="GMU_ALWAYS_ON_COUNTER_H"/>
 	<reg32 offset="0x50c3" name="GMU_GMU_PWR_COL_KEEPALIVE"/>
+	<reg32 offset="0x50c4" name="GMU_PWR_COL_PREEMPT_KEEPALIVE"/>
 	<reg32 offset="0x5180" name="GMU_HFI_CTRL_STATUS"/>
 	<reg32 offset="0x5181" name="GMU_HFI_VERSION_INFO"/>
 	<reg32 offset="0x5182" name="GMU_HFI_SFR_ADDR"/>
@@ -228,6 +233,12 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x03ee" name="RSCC_TCS1_DRV0_STATUS"/>
 	<reg32 offset="0x0496" name="RSCC_TCS2_DRV0_STATUS"/>
 	<reg32 offset="0x053e" name="RSCC_TCS3_DRV0_STATUS"/>
+	<reg32 offset="0x05e6" name="RSCC_TCS4_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x068e" name="RSCC_TCS5_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0736" name="RSCC_TCS6_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x07de" name="RSCC_TCS7_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x0886" name="RSCC_TCS8_DRV0_STATUS" variants="A7XX"/>
+	<reg32 offset="0x092e" name="RSCC_TCS9_DRV0_STATUS" variants="A7XX"/>
 </domain>
 
 </database>

-- 
2.50.1


