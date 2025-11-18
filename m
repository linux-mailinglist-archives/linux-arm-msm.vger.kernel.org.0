Return-Path: <linux-arm-msm+bounces-82344-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5DC6A25A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:57:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 00B6C4F71EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9868235E544;
	Tue, 18 Nov 2025 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9T/R6X1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f6bv6AyM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230CB35E525
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763477509; cv=none; b=Von6xjY9Hsaoj3hCg7iS86pv3S+44yJiLQbUEd9bcd+YbdTyZTOT9ge2COLyFuxB3XRjlqzQWnont02mn/u/Y8SeytCaQyllINEjZkva7MlleQmesVWqyvULZSnpVG7Ukd7yhMtlaYKhhmqkGQJNVLX/vqVnKPGE4P9NFZIQvvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763477509; c=relaxed/simple;
	bh=sY/SEDXrsZr0BmS/LMw9TXkPSauhq7bXwHnS9koPDnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QOgUn3et7aIpRLyRE4WbubucKgKnurKZwGPUeZCavRLZ1tYuHUHQhYqaCoEFLNTRuLHa60ShaNTowMUVWAzGGSkN3XoC8uI9FnnzK7L3Mu7uT1lkR1il/6rRxfKoo2Aoyr3xdFnehXU/SOoncNhFaV/zAii5XWH040WbQ9FyGis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9T/R6X1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f6bv6AyM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rj5h2665108
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CIlNewz5huhSylfx9wKBYS8mfG6SbdE2jYpeBcLcGnc=; b=F9T/R6X1DM/FfEx2
	W6Q06lUe2eY/j3Kwv2bhNjtM7SpFU8nGLfav8dvxBDqvTRkmwgAczc7Y1vr6KA+6
	t30snWDxIYtLf1a2j2O/D1hjVP8bFp/frQxU/gnXlfJWWYrhsEa41WjprDQlr9nV
	4PUqHFkFmuepL5cD0tXw84B50kTiQuDWu5YKUlTMJhuy2Ko1doYvRgZn6wLwaNnH
	37iiNsLYX7ubSgLtSC3xFFd8gCzPbofF8HHZWw6jJ5jCKvnmxJ1bgcKF2Mj1IHgw
	nsJ/iwF3nXJymYESWanhK5jhqdw4IRrdBh0ArhHYMCPLl2ky9iQH0l2uKH1LN6fz
	zI+msw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk8s3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 14:51:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed74e6c468so77660831cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763477506; x=1764082306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIlNewz5huhSylfx9wKBYS8mfG6SbdE2jYpeBcLcGnc=;
        b=f6bv6AyMHU1HgL5xU2hovUp+UEcfrJ47yooef2DROPnJgiizMi9t9jY7vGtA5oZnSv
         0wrKNf3N9KWwn8dPgg7viTwA//jF3wnzdnJNV1mOC0G5trYlApUy/9lwwwuTM0oLe/hm
         BQ7FUNF8b6FltUwbWs1XEW0ZfoQFXQ/4S6QENtdSWXBCh7MaFMaDC6h8JDDze8cnavqA
         maZ3WQOgQID18JOB0ZzjWS827hBftSeun09rtknp/XBYDuvch9bMd8kjueicyHLnXaUx
         sK11kjPIrKFfC7kqCaglJEgy+mdB21skM11OEdoyKn1X+j1GmO+PVbfBIwTofsrcqK9Y
         AfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763477506; x=1764082306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CIlNewz5huhSylfx9wKBYS8mfG6SbdE2jYpeBcLcGnc=;
        b=jsqQ+A/FXMbBcwutUCriaRXcCvYRR+qEtCeXwPrcYOa4YuI2M9YalJqOXf3tSJYDPL
         UEQr6MEM+DHcqnMhFa83IJZM3oTSU2cxCeiiXhHPPtbqxdb/QMQiWnOV8ZFg+/YoIog5
         aBTxeLoeLRwRJg5RjOmY0llS1XNGqnefJdcjULUK5p5JL1EqZHczfEoWfuIJkr8CaST+
         mQMGx/RTu8rImGfXFcCowT+xtu+b8QECLlgB7/OKDXjLicwahYbcSdFwzgM4mbC9QmOK
         Ga1CHdSmONt3SMQ6eVonoDCPyu8hmaqcHD/SuhdJwUBx2y/QTPNh/Ko0i4EEWTrXHW3u
         YxeA==
X-Gm-Message-State: AOJu0Yzy2dy6ZcR8dZXmnTKb5DAp+jwmyNnHT3MsEm7qjxsAJyE4RbeK
	wwBPU1jsbLgs6/WpfHu42mR0whUcr4mp5cSWIiBApJfyQevYcVQycTV9ro50RvrHk8v6GZUnQu9
	DlFbCQnyg+uson2sy92NmZ1+XI4CT1KV04IqCB9xpEV7xM5l5pBQRa7wFL6Qo0Wcfsm1/
X-Gm-Gg: ASbGncuxlnrYtYcLeCzWdIy7nFciuYFiMCA6p2MvkLiVCelFF/loz6Lc3LysWnmPdwa
	8+D4k3wEGimwYdeDqdVLcAGc8iQA5n6Wc2Ol5CDoa98zVLgpS5zrvxTNJvlx3Y/7Z+UbMgILaEj
	4xz0GPJUtUtzrSPO/9ELAe5lJj5F9WQ6B304YvD4PPdUl27LySlOOcN17bE4Xlp1pApxOZZQaS0
	d40gX1YCRk/32PNLfrF33+FqKGHV3PIE1JMZZvCMKS6j1I0HzwbuINgeOuYyqZ3hS2D0E8CiSRU
	rwUybnse50yNKYV8RdOTEuzwiGmqLaIjemyg2zk2nww5luHg4Wysm0KHyQ3Sn1QHo2XH0hTwd6z
	Vp6oZ3LRYpTZoZNJpDng488KajbnAGnZhvW2gwuwIgoEk2VlhA9CKT32b7MQwle3nAlL8oEIHn+
	8aK4npOaoQPeWl
X-Received: by 2002:a05:622a:ce:b0:4c4:6b67:ccd7 with SMTP id d75a77b69052e-4edf2115889mr222028491cf.55.1763477506258;
        Tue, 18 Nov 2025 06:51:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVS8N8VHsVYiW0k7onzk7eNE1qizFWtu9jQliWalm//hreHBJzziNsUwpECi5l77abjRGbhw==
X-Received: by 2002:a05:622a:ce:b0:4c4:6b67:ccd7 with SMTP id d75a77b69052e-4edf2115889mr222027991cf.55.1763477505770;
        Tue, 18 Nov 2025 06:51:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595804056c9sm4078452e87.90.2025.11.18.06.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:51:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:51:40 +0200
Subject: [PATCH RESEND 1/2] drm/msm/dpu: simplify bg_alpha selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dpu-rework-alpha-v1-1-293d39402b59@oss.qualcomm.com>
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sY/SEDXrsZr0BmS/LMw9TXkPSauhq7bXwHnS9koPDnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpHIf88T0dnu/Bdnvg8CfTfhWTjN0pkQ597GtgI
 kD/IPt7miqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRyH/AAKCRCLPIo+Aiko
 1X9XCACVLoKFvOqIsZB5xZvyetFJqy2ocjHKYtlm9nXB1OARuPziEaFV6ilby7xmEmoiSOnR7bQ
 TkVIoeS4HB0cto8afZWvKu+1EDRW6kyOfayiXsnOya2Ocg50npHenJdrT9gyU1yeo6IxJgDOvo6
 7hD739r6BwDhq5YWWaFefsic1vtinbZWNRghG1GgZDBgZ1z8StmN3oOUQRI93tn7RPnrQqdbG+Z
 p20YN3+XTHZme3rpVoy/3TvLfY55TVUcpFPPOLptHWWzlCJQ5i8l2uaAgCxO/T6y5QCxXo9zTGE
 DACManN9BppwPJLbRFlQL1CS1eAJVPZ08+4IdGZGZZP+Fv2T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: 96OGc53x8cB_qOWuYjt2tEplfOlIV8yk
X-Proofpoint-GUID: 96OGc53x8cB_qOWuYjt2tEplfOlIV8yk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfX63XlIfNkK9Yc
 ucOg7uTfur6RrFdeuNAWN1dvv1mtuqmAGBhRn+qAChbLLjneywZZy52IruEWvr1sKI7Xy9FCXCF
 qElBKzN7rQznXZuLn8j3xobCzYp2XW2iixsTuGzGj+rmwYVXNIcG6VzoWCaE6a+Tac4ifuBCxBp
 SvHQ6Npi+B5SW+h4/TB6TClsyGUd+SASJH4aYkI9NqwDUUs9Pz+jbefo55CIVostPS9J+ezAtJF
 kVTEwrIda6+TOPd2fEBFpJWWq7/v35PC2yBB6+zdvbFoYQE1tzGEDG1/MCJv27GheBImfWtnY7c
 nExVmiWvOzXsaCsLYeY2uWNSZbjVPyBpPXF9wmoB52Xb5nd+KshEGQmlw8zt1lELBx0nWtO6J6G
 O8ecYY2XQJxwaAQnNiF+zCAGB6rA8w==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c8802 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ID75BBqnTVE1V_rUnp8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119

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
2.47.3


