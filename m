Return-Path: <linux-arm-msm+bounces-81773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E0133C5B380
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 762B34EC92B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E049527FD68;
	Fri, 14 Nov 2025 03:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxuxtLGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dF/mEm37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468A228CF77
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091845; cv=none; b=S6/mbN4nmAg7GIg9NROaqnbcm/g+L0ohwpSM/lyH1LbYYHLdyFVr1InmNGjH44iq6lYmWxUpHny5/dJLnfrW8pZg3SsHOPM3kowQfjCiUvB66GUyisisO1vDR4MiO5iqwFvN0NVT1RiS2/E2PyWzEe4V17JWgAOMwwo2NblL6jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091845; c=relaxed/simple;
	bh=CUZnMGZ8RYJTt+WDP6vzq+7HIixspEzZIdAITsMQctE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GrJBEr1HoMafImAAQtGlvL7qyDaaFzYQdhH4vdFd+gNzvhRe/Yk7Zz1dGhyTGdZ836NeJUXWh5IAGXkQnZwl9yzyMX1V5/wX60BLWn3LE59GJ0gb+jDQATzlnvKexnyWnRpmtkFBrL092kQeRuOYhZTxiKATRzw/UQglEPbnmUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxuxtLGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dF/mEm37; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMarLK1582950
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:44:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oegeyUk2VB2WSErWFmG7bcNFN7Y+V1Lbw5x1rVxCZHk=; b=UxuxtLGs26D0loYP
	xFC51oq4YvZKUe3E0FG9gEhczDfmadfPIIIMEHnolwcZTEIgkyYEoCFVEGZzTl8W
	TnahatBjLMVoUjjacJ7Ne1Q16riTlfuoJS0W7yD2MAi+I7k6/mQMkRM1fCQmxXTG
	tR888lqR4fp8rw5ByuITFTm78ujlZG87b7G7QJBnAp92FFqN5UsqzO+eZPVJNc7e
	Y/HWVSW1FjNWIjbG8q7NltKOJwbnLKLngsBTxQumXmkAa1bVeVg0el/7+TM4AoG2
	f1sq6PrUi0QOjrPqnVHkvKBxbzvGj8wcCdlb+Z2ppWgBl9ED78kfitNLdVZcXOhg
	yAW7iw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9frpxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:44:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4edaf78da2bso33844061cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091843; x=1763696643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oegeyUk2VB2WSErWFmG7bcNFN7Y+V1Lbw5x1rVxCZHk=;
        b=dF/mEm37KO2kpWzg5SAc55DOUv8FTLz4+ZY7Y5T4GFqKAti8Z+57vPInNW95OI4fga
         jJzGc3vDOGPed9veXk4qvk/1BMH7RnT2crobxyKIh8DMu6JDTnqorfGlzwPvhIOg4YlB
         ZQ+9ocsJlLh9putETs2fZNieJqgtrs+cU4QpeQNDVbtJr2wpbUpeoqheZOkg7xP9kXyZ
         L86krLDxj5oBzsEB2OkBwJ0UOMtjlmo0IsjlGEep/II1KXfOYTKTEJA86q46QK+w/UTO
         LucYpjNjZPQety7bfCk07Uppwoffa9OnFRUI4m3QHg1NMOBcKuqRy7RpKeW5VrqEcXwz
         fNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091843; x=1763696643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oegeyUk2VB2WSErWFmG7bcNFN7Y+V1Lbw5x1rVxCZHk=;
        b=W2Dk4cz8TuH9YylT8AOvmh/vX3V6r1ni/zALVsnAX1cgRJAt4LbelYVzt7DpKZTH8s
         KfIdByYRtU1Xco4dUFpmPMB+a9Gh5u99Lgd7PCfwjkhIRkP5p4rSHNOUZzJVhA/3fIXW
         S4k9Rl38QqOsqmWvESaTO5A1kb0wv/Dzqx10DnmeYvkJMCR1lSYLWSKfG+SBgIcFLI6u
         LV0u+yVKwoHfAUL9HMSxjLnCv9PELVIExCdOZUoqQdhaM6PFhJrSbrMhsa2X2yWP1uxR
         PX7UZqrEV9qEhkpPaOFjHnvHwofTx5piPZUzSr05MkmXr0raCSmFH94oGmxeL1DAC5BZ
         7ZUQ==
X-Gm-Message-State: AOJu0Yz/7dhbQtQgkdyJqO2I5BM5mRKPFmDX2nRXXzihnpRQW20E3UUm
	+cvINbJvfy4nSwfwEYifOAkO1mP7fGsgP5R1TKlgBH30KtTkqLyO4MM289aHy5074CddhdBk+wK
	jsNXgljbDkAcZ10agRSOQPOEPrS8/tVS7OvvnCJoG6Kl9rHGx5CnOm+mZjDrezOa9WgUi
X-Gm-Gg: ASbGnctypgjUfMpOaA+bYNdM4vMTMYSHVFUnJwTilaPfdIqn8hl05mn2JnMOt2Rkxzx
	awp7ENev4ElEUZUlgadzSFMqg4e8x5ca6wJkKJDdxl7t0F2ehVXdKyuFrLxhBvW0P8ajFbqgxK+
	k3lf4/3I2B/Eq2sFJ6ZQ5MxSneWjcz9R1gBj1yXPF7Xebl5zqd2QGPbK2gsEKDZFInHlJvyc5OM
	y1dOl1fUDaHMG4dJI6KEs+gYgyi9Z76aIL2VsL+LMVnII/8xmJXQimO8WbCzewhUm4/Jf2q/0hN
	tngGAlYsHaCdC9Z/t//zVref17LaWtmWDP1rWoCOFHAhi2gmeq9515QtZjsNb0UYY4cXnLKEIQe
	+6MgC3mHq+A9OTvZOKAVd8Wf88QgI3QnGm0OHCswBoK2KxpFpfBpwOFe4qWWXK4+mQE6V0oYTbZ
	kENiMMQe5SsQ/T
X-Received: by 2002:a05:622a:1107:b0:4ec:f7de:f5eb with SMTP id d75a77b69052e-4edf20a2ebbmr30359111cf.33.1763091842629;
        Thu, 13 Nov 2025 19:44:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwydlmQi1HPZeW9fs89fnDZmZJmv/lIH/DUJMDvbdfrN/VzzbRgQ82VgzBNNBnbV3LjthPnA==
X-Received: by 2002:a05:622a:1107:b0:4ec:f7de:f5eb with SMTP id d75a77b69052e-4edf20a2ebbmr30358901cf.33.1763091842180;
        Thu, 13 Nov 2025 19:44:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:44:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:37 +0200
Subject: [PATCH v3 10/12] drm/msm/dpu: drop redundant num_planes assignment
 in _dpu_format_populate_plane_sizes*()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-10-cae312379d49@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3061;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CUZnMGZ8RYJTt+WDP6vzq+7HIixspEzZIdAITsMQctE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVmLUBiiK4k/HpfCjqq+rN3BmuJFOagv8Vzb
 AnJXQgpTkuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1YGrB/9Q0ll2wZj4R2ZP8LlcQLJoMrBOppkRGZ/8oJu7nB33LXE+Otq08nz/vR6tMvGbFs+reAH
 QYxZs6eTuovNzE4eYvnHZvWfUyfc0u/6FICnaTjizUqV7zQacSnxAGJodqyrj2gcs+3UQw85v0f
 YBGKp1YbQj8q+foGmsrmc0PaEiixLnkt7R/PjTwqpxHyQwWpRrf1ZvNN5FXoXpk6K6DJ5CGV5rL
 Wuji7zWsPlE1QSPPXyBa5Kocp5YgfIz1MZVrzAV8Jus9RgxIy2N5ljXo07BCP7kxntWnI4xD9/R
 M3QXTqd9/8SQlZqi8Yr4FVKVs09/trdRZaXipr9GBs9dC5KD
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=6916a583 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VIt9t0sQHfAwVTtMwRsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: iZqfTy7UogrXhHfKAmmibSuMvNzP8ZsL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfXwItaZNZRbPzn
 60jEEZU1HTCp6k9LB35geOymLrtR0iSF+uYRwvFlu2xm1HPxx6ovn4GNO+p66IKubEbKg+45C4t
 BwINpPWD5NJBNmeRt5pC1+3oCS+ijFMaZTIINasWxqtZ/vn7cEFUEZTiyOm/Il6V4T/ljhkKCUw
 s8Pq/M0A0tgvIHd93EnxQPSGgwbAf9/ySQytIp9s6fEUBfGq5eF5TLXf10erBETfR2c4+yuFCsU
 qaWtF1CU6ZnVJjsyIAHuTCehwmF9Wp0GjIHah2P3Lhrl+5W0r0W0oOmy4MBaMT/cLPpieAdKwBx
 aOHDeX67OZAonsNnWU2JJY6OJ26kCHrhePvIqmD1JErIhk5hQWDksTLCDZicW+x1YFEO/N0ww98
 Vc4eOtY7muMCGYVz5ErkOQf5oWVVaQ==
X-Proofpoint-ORIG-GUID: iZqfTy7UogrXhHfKAmmibSuMvNzP8ZsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

Drop redundant layout->num_planes assignments, using the value assigned
from the formats table. RGB UBWC formats need special handling: they use
two planes (per the format table), but the uAPI defines plane[1] as
empty.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index b950bc827a36c231bcd4a9374e58cde6b41230bf..191d1f2a0cef7ed69342eceb35df0c3e99a0c373 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -110,7 +110,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		uint32_t y_meta_scanlines = 0;
 		uint32_t uv_meta_scanlines = 0;
 
-		layout->num_planes = 2;
 		layout->plane_pitch[0] = VENUS_Y_STRIDE(color, fb->width);
 		y_sclines = VENUS_Y_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -124,7 +123,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
 		layout->plane_pitch[2] = VENUS_Y_META_STRIDE(color, fb->width);
 		y_meta_scanlines = VENUS_Y_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -138,8 +136,6 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 	} else {
 		uint32_t rgb_scanlines, rgb_meta_scanlines;
 
-		layout->num_planes = 1;
-
 		layout->plane_pitch[0] = VENUS_RGB_STRIDE(color, fb->width);
 		rgb_scanlines = VENUS_RGB_SCANLINES(color, fb->height);
 		layout->plane_size[0] = MSM_MEDIA_ALIGN(layout->plane_pitch[0] *
@@ -148,7 +144,9 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 		if (!meta)
 			return 0;
 
-		layout->num_planes += 2;
+		/* uAPI leaves plane[1] empty and plane[2] as meta */
+		layout->num_planes += 1;
+
 		layout->plane_pitch[2] = VENUS_RGB_META_STRIDE(color, fb->width);
 		rgb_meta_scanlines = VENUS_RGB_META_SCANLINES(color, fb->height);
 		layout->plane_size[2] = MSM_MEDIA_ALIGN(layout->plane_pitch[2] *
@@ -167,7 +165,6 @@ static int _dpu_format_populate_plane_sizes_linear(
 
 	/* Due to memset above, only need to set planes of interest */
 	if (fmt->fetch_type == MDP_PLANE_INTERLEAVED) {
-		layout->num_planes = 1;
 		layout->plane_size[0] = fb->width * fb->height * fmt->bpp;
 		layout->plane_pitch[0] = fb->width * fmt->bpp;
 	} else {
@@ -194,12 +191,10 @@ static int _dpu_format_populate_plane_sizes_linear(
 				(fb->height / v_subsample);
 
 		if (fmt->fetch_type == MDP_PLANE_PSEUDO_PLANAR) {
-			layout->num_planes = 2;
 			layout->plane_size[1] *= 2;
 			layout->plane_pitch[1] *= 2;
 		} else {
 			/* planar */
-			layout->num_planes = 3;
 			layout->plane_size[2] = layout->plane_size[1];
 			layout->plane_pitch[2] = layout->plane_pitch[1];
 		}

-- 
2.47.3


