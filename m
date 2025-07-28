Return-Path: <linux-arm-msm+bounces-66938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C192B14365
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 22:36:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B49014E3647
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 20:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 087BF27FB31;
	Mon, 28 Jul 2025 20:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gxT81nkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F56B27E04C
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753734869; cv=none; b=WWzg6/D53bqbJ7s3+ilx9CMbkmt5ukyhtFCbVXx/FYvDjLXmgm0kJbZdfBZU6FidjdPoTkSfe2Je/gvadFSSj584+cNZAuANdKon+ZQjEfEOTgVRh0ykCkmQu69ImEuBUYx/u2vlAABP0WSNQS3e/yj2oRVlp18wUX80Y9AU4r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753734869; c=relaxed/simple;
	bh=DkcFgrXlcxwrYVvJKTGLyt7PuaR841KGpI8Wprw//10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1nLc5J3QstHhiaTMHTna1kPdwyaDHaRQgGlC6XzxlMDm6DzgrdfueJyYMT07kLuLEkQtO3j15ij+kwJ9In6IQPHDtTs7lq1lOXGuyu+A7xB60UjmOxfH0Lb/9/oj5mNQxqUPQzf53aIcXXxbUV+O5QEOeD4ExetRw4BDLRzR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gxT81nkX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlLkr005055
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9HL2ElAARF0
	/fbev6G08+6TVwHe8Nc/ReEeD7pJWGHU=; b=gxT81nkXjsjgayio9XdonbnMeD7
	L2+voPgFoghEPofYHzvzSJ3hLfkheUpUwp6AJecqOkRU/RpXsAyZVmft8OLRHRnp
	OSDvwcAEzcHv/ElcJ3SY/f1Qbxxtxxa+xYZ4qM17D4MU5kHoyDqkRFBXqyE92xrg
	DENhi4NVNJJ8NBdEu/wuWBSRQKoO9FfrcFszkovsvso92EplmAaXrABkXkSeOgXn
	fWB0pahpyQocRVNF4ucOqG89ghmh/G9mxs8epGopELP7oQ97O6fGXcHyR6TM2+G8
	0SEehKRpk9xWcynZbgpAh4d1yU/CcuhsMleGjbACtCb06aQ1m8BJo5lihjA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytx07e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 20:34:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-313c3915345so7392390a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753734867; x=1754339667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HL2ElAARF0/fbev6G08+6TVwHe8Nc/ReEeD7pJWGHU=;
        b=vhz2M4rd9WT4gnZbVm6VQcRlTnA5CI/49bnyTRP2HxH0FQAHtnTVJcEcCrLl0arWKk
         MO+17elzO9r24eCx/cAwC4aMeqxRq8URoMYBjwaqgoEU3BuHHdap1Vv6ENIRcF5ck4iC
         RJT0Ml9z+z+R+ni8Rtqwo4FTu+tP4QWy9YHHe9Jd3HaDl1TmQh2KaZSbTFzisatKH+kU
         L6ZZRZWL/WqOG98ZKxluT7RCrKc8Uv0k6bma26rcy/nHSnImHdoTZjHH+og6ui85h9Tj
         yEb7TEsWe9CCriwLmve1f2iYq68tQPr8AR+ewpcyuk0HIFCte+8AJKMPuRbCMdSqNGPm
         H54A==
X-Gm-Message-State: AOJu0Yw0mAFtbXVRoghaqGkLASW0KrbS8qaRnKQV+yDmKATcTErkJvMG
	v+9zJTUT/9bPb6A+VSq9Kn9KyGuOECxwX+Ee0z8va0VTbV/gqITCCohb0O/S4ABi2AHyuljXd0q
	XuQo5Kcq8vPUxQH4s/NanLx4TFJ904IL44vy8CdmOL7pIIfaas0weJsbuTir+J/myQuaT
X-Gm-Gg: ASbGnctbWlYo9/e5sX/nAJXeraKd5NSXEVIEaHat+tRscDVlpMNPOuV6FBNzlMX2/z0
	OsdsiFHJB7z4xawyBNizKaFRpIrvJrPLnxirlCAqLYHkP1F/2zZkp3X3Cjca7oRA/Cfw1L/X6up
	opSAss8oVfjEjrqsfZIJXTx+L2Od9pkX9CUfutiSF0rnYjWsUbchgPDh/4PUz1oj4eHR7ukgK2x
	Nw7kPKeee8cnulW3fhrq+G/jhYGVYHITry2hRDrYjzB1lPiRXM8ymPXw5OFyU17+fOjvURzx/Lf
	rH/ajy+YHJW6dPbHl88oQxZSdy//RM8K/WBWgRBrgMGLPl2wnvg=
X-Received: by 2002:a17:90b:564f:b0:313:1e60:584d with SMTP id 98e67ed59e1d1-31e778582ffmr20598906a91.11.1753734866632;
        Mon, 28 Jul 2025 13:34:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEdJ9/dscUM4BqdHSg4PGTK5hxCSdAWWgSIKT1qLZOsCkP8tbWQs3GjcAPYzq2dmolO2Bt7g==
X-Received: by 2002:a17:90b:564f:b0:313:1e60:584d with SMTP id 98e67ed59e1d1-31e778582ffmr20598863a91.11.1753734866210;
        Mon, 28 Jul 2025 13:34:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e83545d23sm6505289a91.31.2025.07.28.13.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 13:34:25 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 6/7] drm/msm: Fix debugbus snapshot
Date: Mon, 28 Jul 2025 13:34:06 -0700
Message-ID: <20250728203412.22573-7-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 05apslP-Kp0s9FC4l68pkTZChOMTCjDa
X-Proofpoint-ORIG-GUID: 05apslP-Kp0s9FC4l68pkTZChOMTCjDa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX6eHJJLFir4kz
 vFgFw9SsxNOJ6gHJ9o3hLG7x1PrFEqpjhI/aaA2QABjwX44oDFHUFJgl6Tx8cVuTa+3TB7sbWjs
 QBW9rI/PX39raT2+HrrM92ysQuP5ZWjVhixPmwt91f6S839E0hbNFaHFd5k1dKsnJHbG//0AG4y
 r/kIMsO/BBIHhIHxe9AYXndIj5tcTDrnW6GkyKa6bGOs5jpU6QsmmNIjX9eAFi5qtjz3QkuRbU1
 83Xlgg9WwbO4hafUYVZDAV4/mzRmwP5U/xLG7zDom3MTtj1T2gwuQC5PNryj89rXS9bLBkzu4AV
 NZaSNliSznBvZmGhhuxGEH2PxrBrV/kUT1+JadsqpDs2XR7zqzxP4Cxx9dfGl9OwYjcDDZDDMHC
 FWhkB7TjQQ54/bbnyyUmTeknkvLtL574vbHr2ORcmdhEnV+QJvdyd0qAdjbrTfbGHn7tLAbE
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6887ded3 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Q8ed3UK4sgpFGPsrdooA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151

We weren't setting the # of captured debugbus blocks.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 33df12898902..4f0d8c0e6ac5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -430,8 +430,9 @@ static void a7xx_get_debugbus_blocks(struct msm_gpu *gpu,
 				a6xx_state, &a7xx_debugbus_blocks[gbif_debugbus_blocks[i]],
 				&a6xx_state->debugbus[i + debugbus_blocks_count]);
 		}
-	}
 
+		a6xx_state->nr_debugbus = total_debugbus_blocks;
+	}
 }
 
 static void a6xx_get_debugbus(struct msm_gpu *gpu,
-- 
2.50.1


