Return-Path: <linux-arm-msm+bounces-81771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E90BC5B35D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CEB9B3BB132
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FA1286402;
	Fri, 14 Nov 2025 03:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPjHnWB5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T+pi8M5n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627F328489A
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091840; cv=none; b=rc0Xeelfsy8m1e/rRJVlP3TjrKQJd7586bIRAThSMQayFZK/y0ZkLCmYRoDvPnI4sN75A5151qNDUiRt5Vnv56yOjyqRhaaaYyA4NZgPZf1oG9QVg/hczO9Wq4E2zebclHCH4chwCFOAc5Wpv+S/koDN8ik5etoymLJdQbuI+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091840; c=relaxed/simple;
	bh=EfFodWq2fss0e83GymFoQFbaTtvN367Me3klIoPCb3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cESTQWQL56mLWUUK1eKTC8tDMPV8ySapzrZY/qslTJL6KvcWEwsu62lORZKl6J9pRV0DDKhy3jmuKKepFeaGkp9ISGpailjDPlUzKQ2+LfX/mygCirHhudeKg6Y1ys53Wh9xXcy6kk+dm1la34ksbkzXW35Sc6qxCVHW5wVYV1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPjHnWB5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T+pi8M5n; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMb3D31692449
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlkabq2QaGFzbiQeBWEWbS6GvKzbru/Mv43LmIPCIUY=; b=LPjHnWB5rzvubU3o
	79ljHc3h2Y7x/2D75aNsT865jnL/ugrwxn5pfVmvzmHbFSiZnkrDgnplGnvJ3p+y
	Mt9fCIBcPfY0ahZjdaEK8/1I2FjHEYfov/4neCKqOaZYzp4QBJC/SDjm7NefounP
	LLx7yGAoReFzuC3W8Zcf+XHHtM1Xh+Hr/eMAGvnuRbBTNiiwbCHP3moj4XS5tsUz
	NeC5tTpHwedRhGp2ySGGMdA0FekTKfVsKREWWKWrXHudtt5u4iMzwdET5EfKOwQp
	I3VMolu9/zViKNaCvK+tg1KfKS6oS6zzjleqYYKjmPykVlhq4vhN7L40xdf5FGxy
	QfZdhg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9g0pjh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:57 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8824292911cso74678146d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091837; x=1763696637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlkabq2QaGFzbiQeBWEWbS6GvKzbru/Mv43LmIPCIUY=;
        b=T+pi8M5nVP3Daiuw+R+17ivWoqO7sDKSObfqdMvSfIt1Oa0nWwnXSJwaBGnfMdD7ZC
         jGpxLrL3jQK5rjb2JGKYkO1bkl9eYnQ75eCfBJfgYJ03KYxQsnwPMsyCH5cJgRefIO0L
         UGneYJKb2VGL5j5HSsMxFI8NtabNXlcgFPnOt6cV+jlB9lxBKshUUB97Mpaz/t1Zi1//
         XNevYdKHTr5w+fG7YNzOhdM1tvyKA8WJ1i9DsZ2/qcX0+sksx+pu+sOfxMmUh1GPf8MY
         HZem8Ae+/X4U64Xc3NluQknQ9OAA6XdIItXuJ+jzeHHrCfxK/T42X65T2xI7KGXri5Ea
         uSIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091837; x=1763696637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mlkabq2QaGFzbiQeBWEWbS6GvKzbru/Mv43LmIPCIUY=;
        b=jsj6xopGPBOfyb9VgSJ6DsVHDvNciVdERGfE4diLlc3alHULvKMNEMRnzpOngmp4wf
         V6sxFxfS48B1SYOAnwZ0nF1u1pQerPEHd4+hkgLY3yIZoeV4wjfuc3u9ECzpGC4F7HyM
         Dp3yx1U31Tk+FSedPB51xhmdQpAij7EInHgiZU7YltiDFeNuZyYpRFQlVU1U2Ue19hLW
         fUE7rR8R6TYZJeW5cQJtOmjVYgjhT67+IpEFRF4KHkj5eY4ON9EVqd5zwH6I3HLIf+r6
         BpxBY2x3r80OsboMjRAb5wbBYQMBssxNM0GMoP720ok5SJt3uYr0x818T1n7FbhuaLEC
         RI8A==
X-Gm-Message-State: AOJu0YwGg4rH8dWeoV5YKScrM8AstAjGUKX3PBkD3uwnHn41QusG0dKg
	asGyGMGdHwVxidCRCsI9qDPULA2FnsrT1+5x6Ta7dk7tEXa51bG3RG8C06MQ0JLjqbslX+Z5bxT
	8yOZQ/gCODBsCLh5Z8ecI3bZoneAO58IygZ8SkORrMFy6jKtjXWYASm0sb91VzQ1sNcDC
X-Gm-Gg: ASbGncuOYy9ND0dSdMp4FByUG1s6nJRBP9EG7nI+Q4+jelR2hB+QC8++xqLErmMRy5/
	w67/ciWZ/EIKBMI4+yLi81WISNsTC5d/FR0DPgrhJUbhl+c4R6AxDSdF29fnySj8b1L7soB3F/t
	7MvnzgB7CiWfJEArhicPt6FOqc0gH4aDkZJTJ2nBg/7KJsOHO9M+r2nwg7HQm3wWcc3Q2oESQP5
	STbhGyDzEhyn4d/a6DHj0ivp6ilOl5HBjzLN5BO0C9yHpoZSCd6DIumYP/t3Mjhb6oJH3E+T5mj
	XLamtVVB9x1UgPywD7HW3uPynzb/EiLKPlkj0eWvKD1xC6jp0DwDzlbfLTqzG88Dh/AzvPxfBJ+
	DV16rVTw+1U35urSk1V+woq1yATKZuBmpz64rcKSU7yTJUqFDUpZHDyyXHUan8HphfO9/mvB6La
	+gsWiwp35DPQOX
X-Received: by 2002:ad4:5ce2:0:b0:788:82e0:3a9 with SMTP id 6a1803df08f44-88290f3fa13mr25626756d6.21.1763091836862;
        Thu, 13 Nov 2025 19:43:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHelPfmbqEPEaJV9rhK/zZRhzFOZC07eb56SvApfcmSy5Au+W5kiqFYSczUx0p26Bwj5dtUkg==
X-Received: by 2002:ad4:5ce2:0:b0:788:82e0:3a9 with SMTP id 6a1803df08f44-88290f3fa13mr25626556d6.21.1763091836400;
        Thu, 13 Nov 2025 19:43:56 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:43:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:35 +0200
Subject: [PATCH v3 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-8-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EfFodWq2fss0e83GymFoQFbaTtvN367Me3klIoPCb3Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVmVQ5P/YY6C98/98eRr+wqSpCN7yvITy5eM
 pNHSaY/hLuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1QVaB/93/BzR7UT472jfC8Bhav9semHxAtFdh6/6cz1OgwcifgEPOE7dJ9WAvPM+cfRFMBBTG/Y
 tZWaZzHXypJIb0gCAWoliy8cMLi34/tC8v5NekUtQBs5S9BST0VqPFuvvjjwzq+vPY3v1caiP4R
 J0BYXBuZXWQzpHAVdlvk63nmWgal25Q0j7Q6oEpj5knBdEaYZhBnWvJlIPEZbYzjyt1eDucqbWi
 W/67VwuQJLjM5M91cPlQjX09zzVKLR3H5R/mG5exVS9+g8S2rhknzD/w5TB4kCFqJQJ5dLqsGJq
 s5ltuJ8FtReii9Abdg786LREwo/wIRY+qxPQHLOxFkY5nFvM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qAbzT_NVWR1igUvczAVhd4tKzS0TTb2i
X-Proofpoint-ORIG-GUID: qAbzT_NVWR1igUvczAVhd4tKzS0TTb2i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX4PwVoyswYt2j
 UeueC1KaO82qoYk1OexuKYZVM16rTH2+S5aQBZKoNIT8LC6kzuOvez5oz0PaWj4mC/xe46hLV3i
 dV6npI3dD97H+NgA+Z9wTqNe5pI2eD3fIA+ZtNMr5C1IYsAPETTm+r/4SSyM2Vi4/oFSI90Xn3m
 4EUGujVP/k0ffb7Xi86lBkoW9WvKxonh2ENfHMQHxIOTu2drnVKwxcIPXetgCWqSgcZ9sRap7Pn
 At7BShVD0hC/2ZhSCwYfCLpXLOsgtSvBroAYuwb/LmJFg19F9QGNLK7pvNDAdXOLieAaOGXwpuR
 EAWD+C1FEyiN+PJTpqUolnmnRDY6gIbrM5tZbD0/BLOqVJ0odwa61wuc9PPh9IDWkTdcMzsNOuI
 N9wiENWw0zUXT96Crjj4AY/4DPwGgg==
X-Authority-Analysis: v=2.4 cv=IM8PywvG c=1 sm=1 tr=0 ts=6916a57d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iz29p33r4uX7jxN-whAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 5a1efbd99beeaf454f726e2824cb26d2bf31cf22..33da569eae5efebf39e91be1bf6c8b5c22bcac35 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
 #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \

-- 
2.47.3


