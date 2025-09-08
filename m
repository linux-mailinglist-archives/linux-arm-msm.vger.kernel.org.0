Return-Path: <linux-arm-msm+bounces-72516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A5B48714
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 10:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8A3F7A1862
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 08:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093872EDD62;
	Mon,  8 Sep 2025 08:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g7fO4S1h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9532ECE95
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 08:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757320067; cv=none; b=QjmRLqTO1uRs+kxF4V5sd06hEfSTAJWyvRJxQwq3s+k+NwwmJRsndbeNWX1uItwX1TYNBtBn7viMBn5jtfCvbcRM9CadOxD9/aLNWaRYyHix767srN5uFiYbuY4FVjZFaB5UDAiHHVzgUAJHsgnZBPpeyIj3Pl5ISbCIb59tIm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757320067; c=relaxed/simple;
	bh=eXZ2rYau8RPQwm/75uAgTgpHfByWoOV2COXky3jbRmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mvimzDAN8BT6FSAy3UKr+EX7K//TA2nzkKrEiuqFw4ykPXVdfY8vtJ3owNV1r6C4q0BZaH9mhQdffG6+7II6lg3bjbuqGq2NiavI19JxgFsvubPS4VhB8UbJ4QWyt/wv4pW7sS2jO1kG68oKk2VhfjUZ2Rve/zRz3sghxotqeks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g7fO4S1h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MP5fC028233
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 08:27:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJb7ofyHe4b7qn3VxGuLfEoQ37LPPZSsF0k+bZB0okM=; b=g7fO4S1hBkoOAA61
	u/VNyRsQ+q3qPIKQ9YGMPgfYs3KC98+PnA/MEvt51RYedctiZFW7k8Ntpa4C2Apd
	1IL5iRt4CJOlWuIjVNcFT8piCobIMtAp2eNY7AwGcOSQeUezdzoiuPgmOy9UAOVE
	aEB9hnJs75pOeTVKIy1FpHxDomzio9DKxDd1v7AZM7Ko/ymnWaRP66eS/2+KaAYY
	TqwLZrUOyCojwrJZFxXRahVE828sHB6//I5Az8tWGnB7/VPqAMEuf2HCHAGoqn0S
	tZ/OCaC3xJ8nf42lxlIZno9+aDGL1gqQCiDK2NExPdw9WToxL29AwYIo5ZuGHQ+x
	mxWJBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490c9j3ve1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 08:27:45 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77243618babso4098011b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 01:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757320064; x=1757924864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJb7ofyHe4b7qn3VxGuLfEoQ37LPPZSsF0k+bZB0okM=;
        b=Mou0sZ+31t09DB4vPrQxURUqYk9Ua995nPeaWS2UZ9CbUERF2BIuxfVK+2uAgGprVS
         pQdnaYqdwfGgQ7GHDSl8yAtUZcSqyS8UGf+PxF5U2txDeFDNcPEsBVZlmmUtKEXn4rar
         sTrYI0IbgqdyoknOFTCIflrL3VPcGKqyaISbMBUyXzqmJFkvCJSWGG6zxWqwREM22A05
         nFGeTnVO0+5BqTG3KOkbqx56LqPd9NVN7U5hjMjXfvbeyE7U241JDpNW8saFAV4QtSNw
         qN8vxRzzgP5yqY7JzhA+vDWxNX0Bn7t0oJZRsnkObkR0ia6QDJ/L3DHGr2+t+Au7ArPb
         fCcQ==
X-Gm-Message-State: AOJu0Yyas7NUcFE/fW4Td0NMkJUWUtdOdH10wyu/gBJTChKLPNU1aQuK
	v64/FUEMg50GgUThn+U+QpfR1Kc30ukdUGPIHzkOkIuSlJnxZwOEo8o2gkcqOt+R5ZVW1JOy7Pt
	yE5JQskau3JkRRNuewronaCEow3fpciBbb/72Ik8AAxBvINjriFmVph/YJpEjs0UK/Xxy
X-Gm-Gg: ASbGncv0q/ET54Zs6mbDczhFn70PGBxSk8rHVtv3XcBlkRt1JHP1dvCONO18Mo30tI8
	ZpqbdMHFeHdKk3ezj9l2ouWCALSd3bNyxRBvHYnbmjZtFz0qQptC/V6uWqRxO7ubw8jRTCpyF5e
	VvZshGVLClo0K96YR2sKrqFrhWBAsVqE2yahQ8XYp0pg1Lmb4bsVXhJ/Yqzcr8mraXuG5VsHm7a
	EPHxIQAkfOlODWNJPx4f+lk2GeulpSQuO3YW4x7s4uwcRdAjhYcDJn+8ZcZBnTmTItWZ/dlynI1
	Jxd/T5VROgO/Ap44eRagd6+7TOpxvGYJ6SowAbOeA34z2+5RJYL/PuicY0Xah13d
X-Received: by 2002:a05:6a00:3d48:b0:772:3ea3:3218 with SMTP id d2e1a72fcca58-7742de3a755mr9297807b3a.23.1757320064001;
        Mon, 08 Sep 2025 01:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8rtHApLprXs89baTrw5Y+tS4lxiZmePj06K6HadPj3deSzqDHtXN7z5VuOueh7Ev+7QbiFw==
X-Received: by 2002:a05:6a00:3d48:b0:772:3ea3:3218 with SMTP id d2e1a72fcca58-7742de3a755mr9297781b3a.23.1757320063559;
        Mon, 08 Sep 2025 01:27:43 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 01:27:43 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:56:58 +0530
Subject: [PATCH v2 05/16] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-5-631b1080bf91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=2096;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=eXZ2rYau8RPQwm/75uAgTgpHfByWoOV2COXky3jbRmY=;
 b=8HEhpCUzuc7S9PJ7OQWqGbaucUWSpnfKaq9mOpMAJZ+dBfBnPhV4cF5kih6qpWasIOrwuw529
 VCWQyPoBSz2B0HDuxtCDQME4mh+8rpe3QODxD5ntDtT0ROeO3BBTMUJ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyMiBTYWx0ZWRfX/uttVxlmlfPv
 Z1CbGFrf2hrMqKYWQotCU+YTIMGQQVkZIW0X0f6l8EvW7AaVxgrVBunnhwtOAA0LyIJvMaqX76y
 RARtYVIEHV2XR9MD2N3nY2GZoJ/3nXcb4LO0/np2+kXUr8dT2eod1WQa68n6VbZ4tlR2PZx7OpB
 thqZhisq3g6Dc0RdCepKnuFvAw2f4qwgnyJ0x1KH/ifyEPTrHLBzWMktn7B/DmzsyeA/FLfeVdW
 SXf7uWyENzRi4+LmwyE+W050CrjPAJUleIfbzrCKjQTBdrHSaPRJJxZPNYCoTXU+Gr49+viSmLj
 OZgWEKAqdRJGJ7iixVVuQEKhUW6UfewqEysvJSrDB16VszErWwO1J3S3CnWaCY26Y4cPP4ZfWp4
 +tLrfkJn
X-Proofpoint-ORIG-GUID: 5Wxyah_J0Ae2FxfeB0cG-X6-Q1spRF2C
X-Authority-Analysis: v=2.4 cv=PpOTbxM3 c=1 sm=1 tr=0 ts=68be9381 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=B0W9oA28b3er_avpQGoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 5Wxyah_J0Ae2FxfeB0cG-X6-Q1spRF2C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060022

A minor refactor to combine the subroutines for legacy a6xx GMUs under
a single check. This helps to avoid an unnecessary check and return
early from the subroutine for majority of a6xx gpus.

Also, document an intermediate unknown low power state which is not
exposed by the GMU firmware.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 3 +++
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index ba593ccfe3c6a2f3a2ea0db3a1435d0668ed7bf2..18f5fc2c28e33d81ccc248216cc018300c81eb77 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -412,7 +412,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	if (!gmu->legacy)
+	WARN_ON(!gmu->legacy);
+
+	/* Nothing to do if GMU does the power management */
+	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
 		return 0;
 
 	gmu_write(gmu, REG_A6XX_GMU_GX_SPTPRAC_POWER_CONTROL, 0x778000);
@@ -936,10 +939,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		ret = a6xx_gmu_gfx_rail_on(gmu);
 		if (ret)
 			return ret;
-	}
 
-	/* Enable SPTP_PC if the CPU is responsible for it */
-	if (gmu->idle_level < GMU_IDLE_STATE_SPTP) {
 		ret = a6xx_sptprac_enable(gmu);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 069a8c9474e8beb4ebe84d1609a8d38b44314125..9494bbed9a1ff86b19acec139d7ab27697d7ec8a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -50,6 +50,9 @@ struct a6xx_bcm {
 /* The GMU does not do any idle state management */
 #define GMU_IDLE_STATE_ACTIVE 0
 
+/* Unknown power state. Not exposed by the firmware. For documentation purpose only */
+#define GMU_IDLE_STATE_RESERVED 1
+
 /* The GMU manages SPTP power collapse */
 #define GMU_IDLE_STATE_SPTP 2
 

-- 
2.50.1


