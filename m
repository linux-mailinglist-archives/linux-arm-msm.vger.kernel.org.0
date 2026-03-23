Return-Path: <linux-arm-msm+bounces-99396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELIPC0GfwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:14:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF9742FD0F7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:14:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58D39301DBA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52143E3C74;
	Mon, 23 Mar 2026 20:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpH6XsGD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZyxwEz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CBE3E1CFB
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296831; cv=none; b=qES9JAgulxAK3F3GJ0EcYqklozy2fzf7RLjwvjFG5Ch1gI/08FQBcX/YX/VLkOCSdGjMrPxOrn/pPbT0Xz9RFwm22aQNZ9aOEMvBvLD69yrBsIynbvzBpuQ6ZkyPdolymBipMdafBFZKGlzl6lpLrkQHdceR8zFwDPXuNZ6Ftlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296831; c=relaxed/simple;
	bh=4D9q9C/KDNPPGKfghm5SOHAW/QvZXC4Fp7RMJpvJjag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TfKC8bS97E/jZVtHO3bY1PjlWiy4keB/VCi3W4f6i7mPQ9FiPiqUTnctVVd5YdMiR87y9sLKYdc0BN0GgfiWSTtvKS1IFFgiKVmeZUuhwHnfJJtJnPUtc8kg3wFJrJIBkUWN5F1EVD+lnIu1j0Shf6SARLKzffF+SHe31395eA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpH6XsGD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZyxwEz3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHr0JJ618735
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zf9OgMQW8kjaOJM6YV3ZDejW7RqNIctSZqIvD7mhJNg=; b=OpH6XsGDtibgAOR7
	WJf+yxZInuWfm0AxCIPK5gtZVLkpeHl71AgrpSZsJSwbx1ebeBo6VHtrpuxlSk2H
	vNd8VqM3yE7ryRjloLGw6w3hSHt4MM9h069+ltqozlhMq4wITUSPBGm51JcRlH/J
	MlTb1W1TEXyq9Sd5HFqDrquA75uuwjIIPH1J2PN8CXm3RoTnbEa1kA42GNNET1pM
	V+oCOXIPYsXvccn1bubFEtUbdn/bmS6I+igoSlqi/T3jEcv5kKtn3CbKWVEXGsf1
	5YYDbdtH7UBjFM3WPI136nI8/MG59CPbuN4HCYacntZCrnQ/T8Z1iWjxJBr8YejS
	TvvGGw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgjkhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82a855dc82aso3062886b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296828; x=1774901628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zf9OgMQW8kjaOJM6YV3ZDejW7RqNIctSZqIvD7mhJNg=;
        b=NZyxwEz3/QtCHgqmMseINKxqAMwqFtg+L9zSYap/oEuaAfxeWVpSbCwtma8RTGUpVk
         Ob1U5ony9L7oxwYztHu0Zrv55Ecr9+EalTBIMsLVqqTgx8ytYXvuVCBsmhUvhD8HVq14
         zulFGFAX0EO6wAKDuX8dECr0gQ7xuw/oJvC73sUyOgbhICpNX8IcvWEckz7nlyQlWG+Q
         5+l08LFYnwqLWy/QCODT1q7iaBCnwr213f4TUpVlUPMDsyj1mDgLRt65WyG5hsPhUJqj
         QgmF7ziwo9wvlxmNWrLdZ4tu8fxSWz1+ig6JVjZeuH9JFmqkZrj1ygfEL7PShZzQA0u9
         IWVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296828; x=1774901628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zf9OgMQW8kjaOJM6YV3ZDejW7RqNIctSZqIvD7mhJNg=;
        b=hWKKDgPEARL9fb10k/Jiasl8WgfuUVSxfuYXNm2wzoMsrD29RajKOGjK5vE3cJwBXD
         WoEeBn2MRxleo5APfOjzNuLVMugNQ5KkfouL3YY78ESaO+3PwyJbYKsvlfcgNf+jD82n
         Abe0aY2eJ/ov0yIkAN1d4V1fadMYKSzJquS/+szhC10W6dwOFa9znhan1Y91G+apOTQ6
         W57MLfR+hctbFAgF5ZWX1AAegiPy1JisIlz/CG2fJDavYIztEK/40QhdJhxnAXyrEWh+
         ugMfU1jWiKyEUiOdG+ScEZLITqi6Z2uFzJf1B2ne9JDpor3HnK9uWwzP0upzTkcs5T6i
         R5Rg==
X-Gm-Message-State: AOJu0YxcbshDKCvuPS28llSKIyB2VsLgWYSEK3guPDnYBSDpIhrpbzJU
	zm3YoArvUP3tGPxLI8DBp35aH8gXuhjhggBCDsnX9C4OYa/eeiWNKOW1f5HbdSRFNK6unakoO3c
	AJz/Tvv6293P/f7ZCYbVn1yuuquKHFS31mvDUOOpFqksPjNiJpwXmjR/XYjouy7CtvKAv
X-Gm-Gg: ATEYQzypqF7LbDWMl2Sq686AcIyU+llDxNvA5MpZ8q8Li07auBBSMkB3BdEqBL9Kr+L
	2D/lWPZSjvaOGxxEc7e+r0ZV62EPeqGGwT9diITvCDcF4L8MNBIyk6bBN/cMlZhRGri65Pj/vsn
	mydgMkssEP4H7vmza8GPQr8Cdlt7dt3FY1wFTAW3zm09S4QZPhtigU2lA0PhGyPjBgJ8408DZ2t
	tahVwKtfBdT5iO84utqSsU3wKCagG6NPTW7ohKN56dAIk2JTDeUwYxFa9fIsTknMmsqKUq/0MrC
	QLcnyJ5B4PjXumY++mfsz0z9gBzpQpy3bboDFLvR7rQvyLqUVVB2F3Z/p3MIUdoim2S0PFMLgXo
	UthsWHboeZa9rq2ErvhWyWz/Ominc5nFsuyNMarNOoh0eTQ==
X-Received: by 2002:a05:6a00:908e:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82a8c247e08mr10525707b3a.3.1774296828345;
        Mon, 23 Mar 2026 13:13:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:908e:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-82a8c247e08mr10525689b3a.3.1774296827835;
        Mon, 23 Mar 2026 13:13:47 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:47 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:24 +0530
Subject: [PATCH 12/16] drm/msm/a6xx: Add SKU detection support for X2-85
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-12-fc95b8d9c017@oss.qualcomm.com>
References: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
In-Reply-To: <20260324-a8xx-gpu-batch2-v1-0-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=8395;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=4D9q9C/KDNPPGKfghm5SOHAW/QvZXC4Fp7RMJpvJjag=;
 b=1xObmfn+e0DZqh5iORmJvf7AxvHH2VJWAdzdwD0fdLez9VuwcH4Eb16dXCUGwoFaamkuBDawz
 N5x4BdbWjegDXcBoLK1rf21/W8F+bXgpUncqcvk+cZHPwPEmWrVytvt
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: SivjrNyPUnuuqo9EPSf4uJLBA9NxJZ95
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfXw5cg+uDAQkpN
 FazdtNwItAwITNvfpSSVTejVNG5JN0JIGRPlOQOB7xdSc9UIrJaDGBLGQMZayv3V2E5o9oV86Za
 B6f8o519V/LF+smLkUJjDs1zMWelPUC1kizY058kDPFJdthWguMjXwBDHS58yzEy3XtqLjCgh6K
 II6QeLpbaCnYTdGz3mP+Q2Y3uhyjU7CALV7sTsAHDkcJpwQYyPIA4GUG5O7ffToEuUFPGJ2Vhx2
 aBUs9Dcyf/3we3kskOAySokB+0sbJe98KvbqNmxSt/koOoyH7OOjKSGUczrrPuL/1tdRGZ4XCmK
 gFtmhb3FBaCMQ0zcBZBZXhue+eRaWLbIUhKIUJnJhoieAhmm+gHAwo9Y09rQvxHFvgNXidMdCax
 ubdWS3xZAl2gPLdxYSQPEBQGOADpZ+9l07G3/sHwBT8TI/iHAQx10T++kPuugO8LcZX9eW/XiJD
 0//NAzY/DpKpR2Wgbig==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c19efd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Vdb0TAve2SCM4sGFxkMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: SivjrNyPUnuuqo9EPSf4uJLBA9NxJZ95
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99396-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF9742FD0F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno X2-85 series present in Glymur chipset supports a new mechanism
for SKU detection. A new CX_MISC register exposes the combined (or
final) speedbin value from both HW fuse register and the Soft Fuse
register.

Implement this new SKU detection along with a new quirk to identify the
GPUs that has SOFT SKU support. Also, enable this quirk for Adreno X2-85
and add its SKU table to the catalog.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  6 ++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  9 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 41 ++++++++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  5 ----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |  1 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  4 +++
 6 files changed, 53 insertions(+), 13 deletions(-)

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
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index f6b9792531a6..758bc7bd31f6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1902,7 +1902,8 @@ static const struct adreno_info a8xx_gpus[] = {
 		.gmem = 21 * SZ_1M,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
-			  ADRENO_QUIRK_HAS_HW_APRIV,
+			  ADRENO_QUIRK_HAS_HW_APRIV |
+			  ADRENO_QUIRK_SOFTFUSE,
 		.funcs = &a8xx_gpu_funcs,
 		.a6xx = &(const struct a6xx_info) {
 			.protect = &x285_protect,
@@ -1922,6 +1923,12 @@ static const struct adreno_info a8xx_gpus[] = {
 				{ /* sentinel */ },
 			},
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 388, 1 },
+			{ 357, 2 },
+			{ 284, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a01),
 		.family = ADRENO_8XX_GEN2,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cbc803d90673..0fe6d803e628 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2552,13 +2552,33 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
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
@@ -2592,11 +2612,13 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
 
@@ -2619,14 +2641,14 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
@@ -2634,15 +2656,20 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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
index 10d9e5f40640..826661cb7988 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1184,7 +1184,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	const char *gpu_name;
-	u32 speedbin;
 	int ret;
 
 	adreno_gpu->funcs = funcs;
@@ -1213,10 +1212,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
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


