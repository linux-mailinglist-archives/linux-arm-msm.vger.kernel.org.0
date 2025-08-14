Return-Path: <linux-arm-msm+bounces-69164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 880FAB26057
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00A45163FA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE482E7F3A;
	Thu, 14 Aug 2025 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pxJTJZ2q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566E32F60AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755162241; cv=none; b=Xs/8mMipbZrpNmtrTuLyVh8K9QZydaX9EXQcFqvc4i65g1nJYV31JvSwjGsD7LD5JnfH04PIlx2gi/7lhwcdnz9MpI5eq7rn2ckSEH4lOTBAU4uh0YZcZmUTz5dy2Nj76R0TcD08KJb2zY6UCJ9J+/FVCpOLtS4vLxEgD2iEKxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755162241; c=relaxed/simple;
	bh=iMJRmARhSb1qXSk4SUYiXVNL3suv0fUyow+jfxnnJDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RfQMfhDdX54r/ickhRXki9aliRfK6sFaEEGqxZEEZW4T5tCV4D+cY73lFixXAKNMuK3eva7DITj7kjhqbq/gieg89uF1frVEvPtrwdpHaNnDGfBuKtPYbNx1y+DECkTDYQoENBlWFJsD/jfp5WZ19Mp5QafvFP/VqfdE/MUH+t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pxJTJZ2q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DMPZcN011072
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IwbNIn2nq6yZlb6xLIzEou48MqgT0iaVMEMsW/WzzXw=; b=pxJTJZ2qCq+VpQnQ
	iquiYT8KXL0uf9XG3NeWQQdsOHwTXimb+tuVX/VfqobrD2ZSpbCdxCXULJPUu7Br
	/U9ihwNNEs5rcwtmFxseEBOFDhuY1tahvRE3VHY6fLy62PyzED5pbQY5/hVeKj/k
	Yt6qhw2zs0k3o6BP+LEEc8TqZUOzyKVQRyqmUa3i0ELOsy4fkisOfTlBCbdGl8Mh
	DGkbXh0g/bXxj6rJ2kulr1dEfhtavgrO9Lgmr8E6lKyD7YPH7CvFLB9D1cEUxLlG
	2hAgs6iGxDx73cGAPx/68yiYADVqG8VdbmdmTNBIMyzT7tCIIb74S5THN0ulVUPQ
	LooJQA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbj7hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 09:03:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109be41a1so29810141cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 02:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755162238; x=1755767038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwbNIn2nq6yZlb6xLIzEou48MqgT0iaVMEMsW/WzzXw=;
        b=GgdaoPvVkbhPC2s8YCB0nC5jO6lmwnhWpXihgAzW1MEOqmgHu2n/c4QTRrxgIVhZS7
         tJMLxlJb+5zLVl4Lm+EE5eLAumZrFzMq+AHdW1/xvxobMXH8FwLqiqYc6GF+oLHx9oP6
         RyMNlqw+3QObjHfLFcg016Fx9GveADikOG0LPOJ34JaL22bWdRA7dlBQc7tTZidI5zRs
         qO0jBkspzfc4ILrXb+bCYF4iqY33DuI1b3V4VrCkHYL60keNpR4rfHMjPGK4Yt+HkA3X
         UOmPq4CAoE+mb7XKVD/aTvHKPuvHUqe0Jc/zYSUPm5YJxk+Uxaf4dI/ONn6s6lIprcJx
         bpXw==
X-Gm-Message-State: AOJu0YwMNVoP+LvFI1WO+9zU9/cj6ifJeQWlE/Q0kQJLgM0J9viIrVc1
	zUWjIKn7Z4kLZwIbEZRq7J/Jv4gtq0cDlVsCRvs3e+3EftZ0eM8NaMY8Qxv3Gbs8Z0pUPRgtOg1
	KNWHpJeQJpX906K+BujI0I/T6nvOhLUG+GTT38Idl4TG7wSm3uG7ww5alClTnx3obmpxp
X-Gm-Gg: ASbGncsCV5jfygKfkqjdCDA/Z4fdALY+Vh0nctLsA10Fj7KyAjcmhoqHTK1riqCR0M7
	+tNLmRYWwKYBAIS+BBT74kYvD3B2f2ZbqFWWSvEUvzllckH0lhtNZnjNT4ZSsm9QTVqkuBBaGy7
	MDDllAVCayQ9+ip4w5Oy6rZ40SnGaHE54LOOqQ7z3CjtHC+Uf2TsRE28oY59/XsM6+ze3FN8aP/
	8RlwPZxWGJaVSfxJ0f6SBdNI39AB+xd5HWAE8gEktI1MBRprdhS8mNOGGC6mJtppWnjNCHmP2NY
	z3xCnogIgeQCLVe5dlJQkP+OTEFXwo3gLAb+y50T+PLXS0uODhxw+ebX+xnKEV4g70i1EV6T4Oo
	IGnCWGw9kATZhkyUvrRoG8zsPr7BckWt+ynGH5TqUTebO0cSNvd+b
X-Received: by 2002:a05:622a:8e:b0:4af:f25d:e2b0 with SMTP id d75a77b69052e-4b10a9cc07cmr27540561cf.8.1755162237845;
        Thu, 14 Aug 2025 02:03:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5ndUZeYqkNWDQoj2EKZFvT82uY0VC8Cv2swBSR7P9JT3fLWisPRgnABIUullFaurpyb7ihg==
X-Received: by 2002:a05:622a:8e:b0:4af:f25d:e2b0 with SMTP id d75a77b69052e-4b10a9cc07cmr27540041cf.8.1755162237374;
        Thu, 14 Aug 2025 02:03:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-333f8cec11asm1720061fa.23.2025.08.14.02.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 02:03:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 14 Aug 2025 12:03:52 +0300
Subject: [PATCH 1/2] drm/msm/dpu: simplify bg_alpha selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-dpu-rework-alpha-v1-1-b4baa4ffa8fe@oss.qualcomm.com>
References: <20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com>
In-Reply-To: <20250814-dpu-rework-alpha-v1-0-b4baa4ffa8fe@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=iMJRmARhSb1qXSk4SUYiXVNL3suv0fUyow+jfxnnJDQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBonaZ5C08EvEWaNICCToRqfci+V/llxHEZsK7d6
 VHKUWQyiSWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ2meQAKCRCLPIo+Aiko
 1aECCACyvWUX7kkfk8qmbd/L2OFNGcQOvCZ5c/p3qwoUvB2bm1hsP8Ggmq3+xYl6tpyuNmTjgSx
 xLpBlujHfcCypZG5gRrjLcoCwaiy5ixvxUvUweo/kZ3eHHgIXQUPglVwY4oHBqgCWl4AEf1XT9L
 v/00spXJh6cfVYBhs+txtWUk5P1DIUNcccPAqcn8wskRcEYrzBpfQA6XZe5LAqN7Bhi/HeYhqfA
 /kmU5irHbeOX+C4Sq+nBdwZIxdqCD6ZRKpF42JPYXfN9tOb2wxJySN9FWeg0wHHqd/dRChrtXap
 waRolPzQ5Lxh21Hfzx7eg8hC+iSHSIxAR+xBGBwAMSWrSTjT
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689da67f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ID75BBqnTVE1V_rUnp8A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX+l5b6pdB9o3I
 BzxDx29TtaCIRssSeK+ROfxK8oM0qdhpoEbjoTH8gJxjWcfPfOjlfe84t8YtqOqadEGnDzKIU4K
 Sd7tYzmNgs16M49r80WgERlQmWZMBhfcdippGY5CugSlF7OOfRO2vJon7YURSbcEhWSMWslaesR
 5bESzs+D26LL8AO3lmIX6DHH/Irnu/6tle9A2sVjmbMjIJBgcONIkS1QME8nAW/ZR+IRyD6Ccpr
 y39EVzKiq6yCKMgN1aZp1vsZz2ThKoG5X4G0Q+WxpFLeP2Kgbcs88ki/2RMGO5MPnLyd+5I3bmS
 ZLZW+cOnVAozCMgxgw5FUA2kkLuHuVPQmCoGbmlrW+KyU4otiTQePs5ZWihb76a+Myr2zf6ejW1
 ZZ/p+HyB
X-Proofpoint-ORIG-GUID: JfLhm6FnpAxAwx1HeTCaHMSli_8DruSS
X-Proofpoint-GUID: JfLhm6FnpAxAwx1HeTCaHMSli_8DruSS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

In order to be more obvious in fg_alpha / bg_alpha handling during the
blending programming drop the default setting for background alpha value
and set it explicitly in all cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4b545448d74657aafc96e9042c7756654b4f0e7..651159e8731194d75b52c05158bfd1c9bad8b10c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -335,13 +335,13 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		max_alpha = 0x3ff;
 		fg_alpha = pstate->base.alpha >> 6;
 	}
-	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
 	    !format->alpha_enable) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
+		bg_alpha = max_alpha - fg_alpha;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
@@ -350,6 +350,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	} else {
@@ -363,6 +364,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 				    DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	}

-- 
2.47.2


