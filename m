Return-Path: <linux-arm-msm+bounces-62524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D434AE8DAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 21:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 027146A0422
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 19:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ADE62DECCF;
	Wed, 25 Jun 2025 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxcAs3V3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3252E92D0
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877921; cv=none; b=Ns74pLjHNkEGVJu9pPyEI0di7VbYEkq0QGmwyVEY5WEL37NjTIcR1IJo60g3yoWlTyDXts8na1dzVDi2HdUefAu8H44c0V3zbIvnycepHpUbQOESEHQt03AeWFKLhOZ4yDi5MHJbtua0M11hciPOcq8e++yP/dWD2Oe2hNXisz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877921; c=relaxed/simple;
	bh=CbdUzDS0r5evR14HE2y2m9T+o2DmOJlOXmMaAhyMoOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RoPLDZyVukOOUIWm+ktuGI2nhwCfMAFIM/cJGKlwOsM6Fe2vbGwU+QBWwnFH5IMjExFmKu+iq7BbKdxsXE/G5CFHlGNRr3DLfs6FmNGX+L60qTP2XntYp1ML5oYIwQdPEUGhsx2ca1Wanh1+ALQcq2IwTTVR5J2OvIgQs5lZv80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxcAs3V3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBrJPF021010
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vb+Q3ccg7Qa
	sQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=; b=YxcAs3V37MUahOJdP9dLUX55cMg
	cqYGsTQjIXFnqtQlXpSrZ6ie0xBmdMx775N8mW4MSO/1RYljObLQ7j4eZ5S3tthJ
	AXfbezOb3OhLaPNzAFbWXlsnL1EV7l96LmfxJnSGyeRHmr3W2Vyuo3OTFPGfC3A3
	KDpMfS9zJhlAxVg5lPvJfLRua0GxYpoeoeZa2dkI+nF6pYs5N7Q2+Oha3qJ3gSDO
	LGVA5u4VfvWxwCpmJwiCcYRDFasUxbRc/p7bv08Sv73+PTHT0N+dynyhLVbgCV7w
	ofNYL1Pf5Ezxc/b+oZWgbdVV4tNi8fn0+4CxsQ7mIqYiGdBnKn+G/7GuyEQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwy7r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 18:58:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-747dd44048cso212327b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 11:58:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750877917; x=1751482717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vb+Q3ccg7QasQsi7gj8/5KoBXUBkdYd/cEtWLqH67ms=;
        b=cV4BMYGk7L4z2bi0cGFiicF9rdxiSTkNusE24iHwg6r3OvrLLECujr0ZY6mQJn8omh
         ImEN4OkxSf6uaLwA22Z+UaYC1sxbrwed8LAL3eDXLyhgEF21i9LHG+a7AOvjM9ftc2SD
         yABsrLz04Ve8LryD7vPZlzbCSfR1rP0PpyZZBeSWMaLJGeXEZ5CpoYHrzqxoDNAwLZ38
         igX4iAhXh15hD+wQYKX22b0GoeBEOadNOcM3g21REpVPZdeeoN/Dy1xJFBLABCXOwvkf
         a/KrC5zwB+SP2ajmvVksHoSFs0wdJO95RkShugOusOX8m0dCeuGgjkf68EhOUOtDr8dN
         4utw==
X-Gm-Message-State: AOJu0Yyy+9zkhzFCmtd+9i+uCJbCU0OcgBck/l0BJ3iDYNtfFIHD5lcP
	lsBP+2/AbbPf4r6DqIlzxEJg3J8TqmixTWGOdBiQQVfOBOGzi380BWjgeds3ASv9nHN6ff1zfyI
	atoR59nkD31rfyPdTKaUejjcXyqW1L1hEUS21iF6RndniNnSQ42nHxnKmNL6+e7MTvpNu
X-Gm-Gg: ASbGncuba2kZOe6nAH2HGV/3IbD0dZbUE1GPndgnobAE2ypPWmWnfZWAOJkewv/eAkh
	74wk4Iw3a7WIZds8fFkjeDa38R2P5I1L9y7mm9zEIQkzf0x0PNEog5hvi0/P0Zc2dv7p4LHq3vR
	ayfaMU0OkT4KmkOJruN9bO1127f/g2Kmt1rAHD6UMLXnCFgP22K/G20ZriGTr45pXRfs9HOEJJ8
	6uUvKIiPBh0kjt3EmlGBaIx7h1iemHXpkM5hpoHW+SCyq7j8bHYKV0lB4ug8eSRe77ygvM+d8sQ
	Ay/peYfRuOL0vUyPvNoHizOi9rmOKcSS
X-Received: by 2002:a05:6a00:2da4:b0:748:fb2c:6b95 with SMTP id d2e1a72fcca58-74ad4599964mr6768248b3a.18.1750877916847;
        Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2R3fCh2w1CdRYNs6SzElJV5q80FOXlY69V8dHuPmzMI0PHAMaTPozp1q9qVR8kIBjZ/CByg==
X-Received: by 2002:a05:6a00:2da4:b0:748:fb2c:6b95 with SMTP id d2e1a72fcca58-74ad4599964mr6768216b3a.18.1750877916423;
        Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b31f11ac8eesm13442633a12.34.2025.06.25.11.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 11:58:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v7 12/42] drm/msm: Refcount framebuffer pins
Date: Wed, 25 Jun 2025 11:47:05 -0700
Message-ID: <20250625184918.124608-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
References: <20250625184918.124608-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: iniVpD72XOS8W8MW7-3sJnb5D5qF49mi
X-Proofpoint-ORIG-GUID: iniVpD72XOS8W8MW7-3sJnb5D5qF49mi
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685c46de cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=MhmIxDhvR8qEtQvFyXAA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MyBTYWx0ZWRfXy0FJ6DnDxRUW
 3/o/Pg8ytn47nb9Fm6n8fpaH1pw5elRQ0N8LYrfNcaZUlPtCnjUBcn4n27Ta8+q7y1LHZdKFicc
 xzzI3MwH2huAbj5JCRaIl7UyH5HP8aWv/hMuHksBPCT8PeXZ38Jmrit+JvOerkJujJ4ZfirwMIn
 TV3oNVYkuSHc5PAniR6WmVBYWCTyPe8gqiVo56+x7Wz1zncygEnTstwXhqA3x3lgam5ik2Se33G
 Dpz2hBZIZb6Z8DJ4FxWhwMDM+q/SHdRqu4a58kBktCDpGArb/ZCUtBUM51HQ8EGsBrdztAiPjYR
 M0ddgxxPreNDgogxHhGMQFRNPdMjLIT6orgifZhtLpDw3G7ibIMHev/Q4UZ6Gft//VCAR0d1Bhx
 qdANRg+10T6GzalKArJZUP0vk+g7f40NDHeGmxyy6TGv2jvg1KaxO03VNyBWSC84mLyzdcF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250143

We were already keeping a refcount of # of prepares (pins), to clear the
iova array.  Use that to avoid unpinning the iova until the last cleanup
(unpin).  This way, when msm_gem_unpin_iova() actually tears down the
mapping, we won't have problems if the fb is being scanned out on
another display (for example).

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_fb.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 8a3b88130f4d..3b17d83f6673 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -85,7 +85,8 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb, bool needs_dirtyfb)
 	if (needs_dirtyfb)
 		refcount_inc(&msm_fb->dirtyfb);
 
-	atomic_inc(&msm_fb->prepare_count);
+	if (atomic_inc_return(&msm_fb->prepare_count) > 1)
+		return 0;
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], vm, &msm_fb->iova[i]);
@@ -108,11 +109,13 @@ void msm_framebuffer_cleanup(struct drm_framebuffer *fb, bool needed_dirtyfb)
 	if (needed_dirtyfb)
 		refcount_dec(&msm_fb->dirtyfb);
 
+	if (atomic_dec_return(&msm_fb->prepare_count))
+		return;
+
+	memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
+
 	for (i = 0; i < n; i++)
 		msm_gem_unpin_iova(fb->obj[i], vm);
-
-	if (!atomic_dec_return(&msm_fb->prepare_count))
-		memset(msm_fb->iova, 0, sizeof(msm_fb->iova));
 }
 
 uint32_t msm_framebuffer_iova(struct drm_framebuffer *fb, int plane)
-- 
2.49.0


