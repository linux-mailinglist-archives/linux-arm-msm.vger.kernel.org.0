Return-Path: <linux-arm-msm+bounces-65790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F8B0B5D8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 14:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F23E1896D51
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:17:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEBB20C494;
	Sun, 20 Jul 2025 12:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MVvYvTWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5DF209F45
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753013817; cv=none; b=i/lDpR8UXmnuJSv8NBzYoLT9ghx4CXdtxOd99oi0WAoeumxIgM6V8kOKkkYm/iWiyg2hnGPCheEaOUR2hqep+RRMxrZsyhmCP4L9yY65kbvKncgsl4nkOD3MSrhVHvN/f3hYLoFNw+apFDQNTvUMY/OGWNuzdPgzWry8yAcMCj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753013817; c=relaxed/simple;
	bh=ji+f74TQTXhSJNywxVcexEvz4zhxi/UIu3IXlExTfoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d7hPg8no6np8xyObUy2+zrUG+z5ijhOV3bLwCtDB0sOsTW+2j6G5zbV1Mt8k5qglWngpXjYLYbDFthXx4PHcpLd06ceQYqT1yDKYEh/G3BgxK4Om5ZGGIW7WM/P+Ssq65FSpoMwgTip0Lr7v629tXo2Y0eADQHazVDwOfgEceuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MVvYvTWT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KBDAxU031469
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=; b=MVvYvTWT9/RfiFAT
	mRu0Jvbz2/SOQ/CrUd1Mu1oI0E+n2YTXKicJ2IkAFeIwuVOoaQdV19qqpE3sk6mT
	FrfaEr5UdLhTAlrdCpGFF8IyEUshtjAL0Vt9zkLgoq20I/TKv0FSNxN1OeZZxPpL
	pm6t8qP5RVtz9aYEZLSFMvqdiThbKTcrTaGvZl7rT0M3ZEPzdJbBtdN4qFzG9Guv
	m/yfhQHYi+Um0DquLTB2hQs23iOlvWFsOEfp0gIFv8Qsoa9YnBxmTrU/rDgbOcpi
	tSmpkvGSQGFYP4RGikOok6ahRlS35RMdK9VhaoLjzqR9fuxnfevXNBhQgx2I52TK
	/VtpMw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804n9t3ma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 12:16:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74d15d90cdbso3159858b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Jul 2025 05:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753013814; x=1753618614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RghYj3as/mFUON2I1wz5/fAj1x0bQSOJ2EkHGXZdsjY=;
        b=fWeYVs2gPNO/ynbqCmruhXc+H3sDgQR8Z7xEa3sxaNyWECtuh10oYHV6UD/uyZsEV+
         6uTXpRUejQPcX3RlhQy+lktEn5PtAU+daOOCEcoRa6PEpbJEmrfcc9g8a8LACiLf3x8k
         CBo17RuAKCQXuYZahtfG1AWZ3f+uO5bR5HnpqTy4x+3oCQQ4KjohpA53dzrhSMyYcbuZ
         HsrjeM3BVXoYkey954B9kDcqEYSV/Q1OaYONRx7Uz+Is/95nXjQp6KbKtmhkg9yktcbU
         GVqlU4rWU/eHpqc6kUU2u/RFBRg+cnshc2S29xQcPW9qgIYCopriMC/e7Z6tR4a5/dgs
         Wagw==
X-Gm-Message-State: AOJu0YyqCuazMR/AMIGCzCPPZ5aXzTqqymCu7ntsUSV9FUjm4tiP+2Fo
	dG5DLaTqG/p/Ohfi9R0bwrAWXi6n1XKUIDYJQpR9cnwsRX9Nie+/4nQxOFJFPFHTP79ifutJixL
	j2aei/CTIMg9UTUpcOLM4JpZVb+PLOfaFWIQhVY6t2PvL9O0mq7QkOvtNGMi9E+wzZXtwO3fRKx
	GS
X-Gm-Gg: ASbGncv8P0g4zcOW2GYAlChWVKErRwrfn32rsQv1nN6/76ICWxl2QShOEuwavx49SNq
	W7N91EO0cubMC2/OG6DMgqdNkSNng5pBXK/OhzIVWmIxN7KATs/DBADDqXJKFz8DXhAKO2xHdCM
	s8MHZn8y+vSdeOkGC9EU3NPWHeu8f+n+GpPhFdjs1Gg9Oc0393kmxgMZkpddB49gAbf9HJGEYdq
	fmETS9ZZ943hxo8/QZbPVkx65kBJHBt6NIMY8JcNNRaLTm0hxl/dzer1wKV81yeTHD/9X2makUt
	HGU7hWBESDlCmByQ5LSvfMmFNVjc2uUon9kFNujh7dFlxBxhjdiMmNk1nSgWewu9
X-Received: by 2002:a05:6a00:2e27:b0:748:3a1a:ba72 with SMTP id d2e1a72fcca58-7572427e405mr21973328b3a.20.1753013814139;
        Sun, 20 Jul 2025 05:16:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm+33dVG/fds/ip7b4Ih0P+9rPGCwWYA2APgeQY1skgsNIAhOHZiM8LTIZzxoKQic2JN+5Ew==
X-Received: by 2002:a05:6a00:2e27:b0:748:3a1a:ba72 with SMTP id d2e1a72fcca58-7572427e405mr21973302b3a.20.1753013813630;
        Sun, 20 Jul 2025 05:16:53 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 05:16:53 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:02 +0530
Subject: [PATCH 01/17] drm/msm: Update GMU register xml
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-1-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=2416;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ji+f74TQTXhSJNywxVcexEvz4zhxi/UIu3IXlExTfoA=;
 b=DzsW7cZ/8jSLmGH8hgbMy+4u7Cb41SK7Sn6nWDaSM7JFVA89fFUVKAqxE9i28wKmCfy1N64KW
 xs8lQx1uahLCy34eKdSSDxVvUFlIXiaM0Kf1ehSyEE7hj7qDtvNcXvD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: iXZg7kT41u7s7DIk18gQDIRFtuZ88Zoe
X-Proofpoint-ORIG-GUID: iXZg7kT41u7s7DIk18gQDIRFtuZ88Zoe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX+2WBzUXrmqMs
 RCPztDpDBujENidFSHteHorGScXeAIMr3CDiINJGb/QcN0k7/3auliZcCnDc3txDzVWyKPkhkKI
 XYRlMWrHF7g+pQxOgWoTNa3azM3cE8S2DGiH4MJFVOL0D3A9zccTEv6v1JdzRJhsEZYeYaB1ALK
 ntCYw3tbihOL4bamMomkdZj8gGqIobTPEUJC2xYpowWwbAu8yQgEyHtKBZV4uiWnU/ZZhPj3otl
 DFxEhNGoXOs9dFik+yl8pjVptC8Jq3uOLCJsXcBxSsHwEkwedsqcAhbj4OcG2/ybaaD5YPtNW/Y
 ZinoLGnqjLAob+Swq55mZ5iSyrZb1V9+5P4pskQ6JlULsInVuTkqYwBn079zInQUmB6yyhFrYSl
 0bdVAWNeWDh+ySw/qGB7iZuizxnKOYN2yIQi0Kj+YqHCaAn8d+8T5P9jnp3TVk9HH1OMPdS7
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687cde37 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=FORX3M3cBL6yUa9eRaQA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=890
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200117

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


