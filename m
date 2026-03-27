Return-Path: <linux-arm-msm+bounces-100174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KeUzDL7MxWndBwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D90CC33D7BF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53FF130834BC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA8BA23BF9F;
	Fri, 27 Mar 2026 00:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KY+M11OI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VsgrcHbr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5611323A98D
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570545; cv=none; b=Oo5MvanEpquE7JybInDTkG21BqnEq4yOUzKigBlEhQ+grJb4fanHq1ke+TK3ilkL8ZqP2wiXsfeiq3RH/CP4C3PCmqwk/j15kbf0/IBrMdqpODfrvbN/ZbtnzL9TD69TfofA+Dx8G+sJilLmtTfJ5+CJPjQ9cufJQsIHBIZOkOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570545; c=relaxed/simple;
	bh=+byEdmpRPut/PppCg/aeg2HI1gNcH4PGDt6qcxhJrzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHKQoTInViJm7DGxjfsBmE1WLdzzakzP61lIoxCmgGcg0qZ4yK0WJZCoYDdtdqQcXJcwfzuIcEecK1p59HigM12ibrO9ppHBCDS8HaY/JtrPtlPh52+0FknjYdVHS73Ci7Jp0zrav/vMflq7k3iEo2GoVQOjkn0uSJyzKrbeUS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KY+M11OI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VsgrcHbr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9ijX1658476
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pIYR/acfG7U5dTM7mTwrZ8aXBXi6BQOiTcL9VweGvrs=; b=KY+M11OIQlwlYEsb
	O6g65O3kFAdDjFlh88nv4u1bM9P2VvtPm50DskQWtFGGlDhtuP/nZh4kO4po18th
	3dnGwq9U22JSorJF32el+AFrqaH8QpaorD9ZWnERR1vzqEhJU0Z6y7df5psD0QS3
	N2XRpV2iL10Q5+VbmqxcbxiCMvnUB6tr/CgufL4cJP0MOEYpmkJKxXYdqYDIMeuf
	d/pP2WAeXXGhiL11m1mRRuzlrtX1yyHBJ5ejIH/zidJbQ6YNKs/kA6nilxEumzze
	dxZTHrr+Dw48muv3D9kVNk2YRvkckJuXRbhws5EJb38XdnXdbIdvE09LfEaBS5oo
	j/PFEg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4w1qc0th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:15:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-359812e4fefso2329741a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570543; x=1775175343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIYR/acfG7U5dTM7mTwrZ8aXBXi6BQOiTcL9VweGvrs=;
        b=VsgrcHbr7X7/H8U6pXvW/0wrqxj/U8IBNiDD5yhlnxOMih7TEmLrF7vY4h5c9KwcvU
         ypGe+Ic1PmEIWPUWAkhm0MLv0E327NIqwAoMtRpfSCvpfn2m51vNnLQU1NYGQuFfIG3t
         WV8DuGiiZE6e8x2pCqeOiU65DnSea8gWJlwm522CDNxPlndGdUbdIeI2q20tkTQ671ut
         4JIW3e51miyjwBX09hwzOcgpRSts9e5w3vnQ8Fdzvwrb6bg/bqh0d3iAPjBLVWg0b8ZC
         uIcb7Tooh4MoH1QmDv1Di9HT2zalirgbyEQNmFk1WeoicxK5IXn1fZUiyEpI97GgO8PV
         0I1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570543; x=1775175343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pIYR/acfG7U5dTM7mTwrZ8aXBXi6BQOiTcL9VweGvrs=;
        b=ds9tDQ2zh8thtRYvJBwcOgS2N/9SArXOozP//7lGZ/faxs6BzkkdCHzGHTo+SRboeO
         wTJZFPKYP1tZZ8dG5GpEo12ego1rQWVO52i+heUU5ckX7MFaFY1ctFGzUqAXWPNmoMQm
         BL/HoWwX0nNh0tH2LANZ10ayIvtHqqSXzlYOicKl21fbly7Ph01IktzSz1tBH5ZE5kWO
         NsN1BKY1SuZQwM/emDF6eLFj5mKadxm/lB9Tj/U0HrePK8RgxmHDgDrhkrND/C6ZtBQb
         9jd5T+nSU1/sPZaGEhWQyHzEnLd2cXh8Oj9RYHYh3Qmz7SR44A2Fy1An2yfrkktb7X60
         owCQ==
X-Gm-Message-State: AOJu0Yx3l39IN3JBcCKcm6D78zGvkvuRan+yFieYrJ9tERY2XnwZ9+T5
	2W+f1xID9Kq2c3CnvbMwW0t7yUoapEfmbI/pV/g5TAJq1NpmYs/NiJoViO4YeZLFia4XuZ8Uq3e
	lISCPLcRtdF8KAeTXXUKEa8bXvumhi7YJF++YFhLYEDLdptOQl5MwzkcS7oetz15jcXub
X-Gm-Gg: ATEYQzxqa1WETK4Ir6u9kKMrJsu8ekNcax9agE1MtxoUNMuHZtmJXrh+VXLIaYpV6xw
	qV7iyQ/gvdVuzsB1NHZD+xY2CTBSMtWGdHV9SW5u4EFKKBKAiTD50CzFM7nmGX+1hfKMH+PCV+n
	0dq4Vl4Byd5m+3LKvs3pwMnuqLY5kVPrQUUadAuKGP3Ap3FBYt9XLcBfOtFqDvUTpK+qMsVti8h
	93Og5THgyIh3xGptE9XIU/4sRptZL0Q+utH1KhsIuMu2nVOivQc/nDVVh9dSXoMjdDpo3yNSXjD
	5sRihRqDEzgWFfC6B7ZI6BVh3OmdKv9S7lSN6C37N5B/OlAaliWVvYRaPxGRXCn2l5hLeCKU2Vf
	C8t5sdTtE0q1kkgmV0cseg8i553iZf0hHjc/3wDVZ/DJpjg==
X-Received: by 2002:a17:90a:d44d:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-35c30bc9833mr236947a91.5.1774570542730;
        Thu, 26 Mar 2026 17:15:42 -0700 (PDT)
X-Received: by 2002:a17:90a:d44d:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-35c30bc9833mr236920a91.5.1774570542200;
        Thu, 26 Mar 2026 17:15:42 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:15:41 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:44:01 +0530
Subject: [PATCH v2 12/17] drm/msm/a6xx: Add soft fuse detection support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-12-2b53c38d2101@oss.qualcomm.com>
References: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
In-Reply-To: <20260327-a8xx-gpu-batch2-v2-0-2b53c38d2101@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=7554;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=+byEdmpRPut/PppCg/aeg2HI1gNcH4PGDt6qcxhJrzs=;
 b=aaBMAs7lXVQf+5hQZSxyLVIMSWwSqvKuFZtydEx1bngukkKFVgksJW8GZye4hB9JUAF0lopT0
 y+hHj3VQVvlASB5rK/3Eepnf4CTTaLYn2tZoewRMFbTC0gAxrbk1mDS
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: 7HKgRTxG9W9ElYy87jFoBr7xdcZbN2sU
X-Authority-Analysis: v=2.4 cv=HvV72kTS c=1 sm=1 tr=0 ts=69c5cc2f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=V3uGv-Aa6LsVx7MfQ8cA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfXx75ahD6pVPgg
 3bV1wlUhCw3ryZfe+RjWXv+lDWZCRaXjgIZsBIYPxXw0nayrYHvSaq6fmh1NqcPNJq4UsoCsF1s
 iWfRLxa8bdtUK90W+Pmyhd2UG2HJY3FVButf/PmaQ6lRYSS+4rbSVla6z7kYh4GsaDjkqGeQFau
 RvXZq5vvhs7Xpbd2fEN9wpQTQNnwvda+AU7asIQb907re4VWMpkaMP3fdrO4z8xy9gOmCuXp4V2
 yFUnK29W3IlywtV9EbwCJUaM5jtquqzh7w6hBr3xLstGCsZ9qngTC9CyBNaGv7K/7gHvlkBdOGc
 H3DClIEAXBsG5sU8aupfEYldV4E3aLgWVIIGulWFcygXRv+mKNgolcNu3+GFZ0+cS5W4+Ferypx
 P394OXu1O6hO3ZXj5DyBw1TLjMdqScxbnO5EE1C4uf8rhpcj7iz2IWdjMdtk3ppnP4UUuV9aO1A
 zoMhhPfuFKqCpCQBwog==
X-Proofpoint-GUID: 7HKgRTxG9W9ElYy87jFoBr7xdcZbN2sU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100174-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D90CC33D7BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Recent chipsets like Glymur supports a new mechanism for SKU detection.
A new CX_MISC register exposes the combined (or final) speedbin value
from both HW fuse register and the Soft Fuse register. Implement this new
SKU detection along with a new quirk to identify the GPUs that has soft
fuse support.

There is a side effect of this patch on A4x and older series. The
speedbin field in the MSM_PARAM_CHIPID will be 0 instead of 0xffff. This
should be okay as Mesa correctly handles it. Speedbin was not even a
thing when those GPUs' support were added.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 41 ++++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  5 ----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  1 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  4 +++
 5 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 79a441e91fa1..d7ed3225f635 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1731,6 +1731,7 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	unsigned int nr_rings;
+	u32 speedbin;
 	int ret;
 
 	a5xx_gpu = kzalloc(sizeof(*a5xx_gpu), GFP_KERNEL);
@@ -1757,6 +1758,11 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
+	/* Set the speedbin value that is passed to userspace */
+	if (adreno_read_speedbin(&pdev->dev, &speedbin) || !speedbin)
+		speedbin = 0xffff;
+	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
+
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
 				  a5xx_fault_handler);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5cddfc03828f..fb9662b946d0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2546,13 +2546,33 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
 	return UINT_MAX;
 }
 
-static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *info)
+static int a6xx_read_speedbin(struct device *dev, struct a6xx_gpu *a6xx_gpu,
+		const struct adreno_info *info, u32 *speedbin)
+{
+	int ret;
+
+	/* Use speedbin fuse if present. Otherwise, fallback to softfuse */
+	ret = adreno_read_speedbin(dev, speedbin);
+	if (ret != -ENOENT)
+		return ret;
+
+	if (info->quirks & ADRENO_QUIRK_SOFTFUSE) {
+		*speedbin = a6xx_llc_read(a6xx_gpu, REG_A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS);
+		*speedbin = A8XX_CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS_FINALFREQLIMIT(*speedbin);
+		return 0;
+	}
+
+	return -ENOENT;
+}
+
+static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
+		const struct adreno_info *info)
 {
 	u32 supp_hw;
 	u32 speedbin;
 	int ret;
 
-	ret = adreno_read_speedbin(dev, &speedbin);
+	ret = a6xx_read_speedbin(dev, a6xx_gpu, info, &speedbin);
 	/*
 	 * -ENOENT means that the platform doesn't support speedbin which is
 	 * fine
@@ -2586,11 +2606,13 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
+	const struct adreno_info *info = config->info;
 	struct device_node *node;
 	struct a6xx_gpu *a6xx_gpu;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
 	extern int enable_preemption;
+	u32 speedbin;
 	bool is_a7xx;
 	int ret, nr_rings = 1;
 
@@ -2613,14 +2635,14 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->gmu_is_wrapper = of_device_is_compatible(node, "qcom,adreno-gmu-wrapper");
 
 	adreno_gpu->base.hw_apriv =
-		!!(config->info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
+		!!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
 
 	/* gpu->info only gets assigned in adreno_gpu_init(). A8x is included intentionally */
-	is_a7xx = config->info->family >= ADRENO_7XX_GEN1;
+	is_a7xx = info->family >= ADRENO_7XX_GEN1;
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
+	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info);
 	if (ret) {
 		a6xx_llc_slices_destroy(a6xx_gpu);
 		kfree(a6xx_gpu);
@@ -2628,15 +2650,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	}
 
 	if ((enable_preemption == 1) || (enable_preemption == -1 &&
-	    (config->info->quirks & ADRENO_QUIRK_PREEMPTION)))
+	    (info->quirks & ADRENO_QUIRK_PREEMPTION)))
 		nr_rings = 4;
 
-	ret = adreno_gpu_init(dev, pdev, adreno_gpu, config->info->funcs, nr_rings);
+	ret = adreno_gpu_init(dev, pdev, adreno_gpu, info->funcs, nr_rings);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
 	}
 
+	/* Set the speedbin value that is passed to userspace */
+	if (a6xx_read_speedbin(&pdev->dev, a6xx_gpu, info, &speedbin) || !speedbin)
+		speedbin = 0xffff;
+	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
+
 	/*
 	 * For now only clamp to idle freq for devices where this is known not
 	 * to cause power supply issues:
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 8475802fdde2..f6c39aed50f2 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1185,7 +1185,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	const char *gpu_name;
-	u32 speedbin;
 	int ret;
 
 	adreno_gpu->funcs = funcs;
@@ -1214,10 +1213,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 			devm_pm_opp_set_clkname(dev, "core");
 	}
 
-	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
-		speedbin = 0xffff;
-	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
-
 	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
 			ADRENO_CHIPID_ARGS(config->chip_id));
 	if (!gpu_name)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 29097e6b4253..044ed4d49aa7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -63,6 +63,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
 #define ADRENO_QUIRK_4GB_VA			BIT(6)
 #define ADRENO_QUIRK_IFPC			BIT(7)
+#define ADRENO_QUIRK_SOFTFUSE			BIT(8)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 3941e7510754..2309870f5031 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -5016,6 +5016,10 @@ by a particular renderpass/blit.
 		<bitfield pos="1" name="LPAC" type="boolean"/>
 		<bitfield pos="2" name="RAYTRACING" type="boolean"/>
 	</reg32>
+	<reg32 offset="0x0405" name="CX_MISC_SW_FUSE_FREQ_LIMIT_STATUS" variants="A8XX-">
+		<bitfield high="8" low="0" name="FINALFREQLIMIT"/>
+		<bitfield pos="24" name="SOFTSKUDISABLED" type="boolean"/>
+	</reg32>
 </domain>
 
 </database>

-- 
2.51.0


