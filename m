Return-Path: <linux-arm-msm+bounces-100165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCoJFEXMxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:16:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF9733D71E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:16:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31733306BD15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 036151B4F09;
	Fri, 27 Mar 2026 00:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aO1xPDNk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VWP0XebC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0EA1B7910
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570493; cv=none; b=kpOTm1cCPvXRSXLEbrEeSGY5yp1LlvacmIKD6utyYv70xZjnhVwenNn4YN/Zn+kLEvciOzmQZlS8bf6Lr3Ee/pqfITpcLYkTRtZ0K2x2OhCwFnKCnV6ixwF/IViyqY95GDcgvGBGC6Bj8a059tnG1aJ2ogg183sURYEUgdDiY1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570493; c=relaxed/simple;
	bh=U5fwvqTvmhxC9U5Bv8tyvwyqOYj/HJbmdaC+3G7oXm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=npPPgZs3wL8jl/D2eFZ2H53QYiCOo1NH69e/bwwFzxJFa0SHuC5pt2RnDgAom3lqV5K/keVkAbKANO8Uw9aHg2cUVld0okHShbOoUxVDjVSy1LUXJjP9QZEd3BWL2DmiI+X/FpjHNlCOE7wZU7EZ38pnDHXrbTdhWlxiPxe0j28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aO1xPDNk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VWP0XebC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QI58WZ1476152
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lWzxoxI1BoNjbMnzfK+mLddqJ9V6D8F7yAlBnaGh3Lc=; b=aO1xPDNkqEbv4+vM
	02h63L2kgS3h1tjvBSVRbtD7qn3OdH2WjwSEEEBJ608Pgo9/XRcS8pdPmXL43jvm
	8thtjL/aTl2hdQuLc4RKsNM94mI/n2RJArTm1YCMVWHoaDJ8oF5dl/i2GkOwx03A
	lfzLr3dobEN1vstiE90Uhjz2rHCpeAGLcuNc9IZ0vZvvapYH9ONl/43gAxvQZZih
	Pm9srRRANWg1AKbIabkImDwqtKnpvtlz0HTVs5bSrmf0l0sIZzsahweE6kP142m2
	IcQ0ro17lOaz1L1rqUSxpVxFA8i/LcRcwGec7HNdEWCdM4YTPFwyVz9YZybuRhk4
	9qCalw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d59s410qx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:14:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35a0998a441so4673597a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570490; x=1775175290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWzxoxI1BoNjbMnzfK+mLddqJ9V6D8F7yAlBnaGh3Lc=;
        b=VWP0XebCqM+I42ULn+3RX9eiTVTy0c8m+AXP0O0vdaT7VGqNa/xgQZjesRDQuc2H7T
         q1aGDyIsxhckOMIN7pFQxjZLDvlgaTZoAwvYy83eX+r0N4V1mmj2q+9Rxf2FlJPVYGDl
         pkjZmG2MXGU0zTfXtwnqJfMixB2CNlRjwDUzlw23O9ECREEGpgS6ajMUUMG4IZXZdDKf
         335PqYu/WXtneyKfdeddMyuS6exnRQ/neeAjYepEHk5R+8LkFimm7FILWMu1R2bXPm27
         uKXf0f7zCCgBHIc2iY1UVmSX72k0+XbJkNlwOyOHZtxXkLwpo1sAc1bEy1DH/aFsBhjI
         KYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570490; x=1775175290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lWzxoxI1BoNjbMnzfK+mLddqJ9V6D8F7yAlBnaGh3Lc=;
        b=Sme2uSeyjGCt6QwUYePFAZaB8OUKP15I2G5FMKWKvQ0bMNftPLnD07FNeJly6PyTJ8
         jAyD4wdAmKspTuLXFMJ2KrqyRYaOKd4B1ZRLeuFrTpn1LMFyg68FQHFPXaM8G10r+2m3
         h2X6wOZwKojQufqQ3GLV08/FjbWGlnPuZZgqXPvJJONzkrxmzi3J0G6qAT1+HVaLrsR3
         2cixIQbx68gr3UjeCGDoubiHnhMoFGGhiXGddSMIudxuNuveg3jqt3Ns3tJRK9i5lLts
         T6vZVRQTa1/miOYmrq5qML/rvkwDPFHjei3qoHeIFcp2XATKfhSYTsOp/3+dIkEs076e
         b80A==
X-Gm-Message-State: AOJu0YznbLHLjydDXOQuPfJJveWw625E7oIWLiFBcLUIxgEV35rYQMU1
	G0UEjlTGOSK1HGPmzMjYSmBKkOIp8VmJc3j9dLBLC2v5sbUhtHJWmT+bOAIGGrdv64wuCC5fXZR
	dUwt7URMNetk7W5mFcjsc+NHDHRfp8UJWVFKnHPnhbW03Ayrx7zTMH+2IlP4QKQ0t1cIn6ZPU/j
	nw
X-Gm-Gg: ATEYQzx/lWH7XS2F0xWnMPvlq8AlYP+CZNYU76nlNjV6PPCpfsnVO4HuCVkgasPmvtu
	puxcjFz/dS33clnfqzTWtLA2Z2J6yAN07XYDwTNogUftnmYFHDLl+/qDjt8oB/mTYroxE+YgFGd
	TrYHzdh3qe4P2l0cgXgJXWLfpMInjRgHed7bmTefdtwPuPPduDcoc5PY6hP+KrrEQDnmqup5yj2
	B7VwoWYMK7OYV10yuFxtYqtz3skIRTt/4OkyPeUPRfYjdtdNwnB2ElKkeudJ83AhbVPFcBQDj/C
	mzuSCnPAKg/qQeT6cE/RIrFdYXMb178BueIEzNjP57Id4wducWv6VE2Zhh16KgWqO7AqRHRqFYk
	UtVjdtMYRunhQCbaFR5zmMUZKyT8nUN6B3diiqg4OAtq6ug==
X-Received: by 2002:a17:90a:e7ca:b0:35c:f82:fef2 with SMTP id 98e67ed59e1d1-35c3002fc51mr480850a91.14.1774570490288;
        Thu, 26 Mar 2026 17:14:50 -0700 (PDT)
X-Received: by 2002:a17:90a:e7ca:b0:35c:f82:fef2 with SMTP id 98e67ed59e1d1-35c3002fc51mr480825a91.14.1774570489808;
        Thu, 26 Mar 2026 17:14:49 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:14:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:43:52 +0530
Subject: [PATCH v2 03/17] drm/msm/a6xx: Switch to preemption safe AO
 counter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-3-2b53c38d2101@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=3298;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=U5fwvqTvmhxC9U5Bv8tyvwyqOYj/HJbmdaC+3G7oXm0=;
 b=Sidpep9VrsVhXmKIRsMrCsxM9lVnQeKh3M83V7ET7hyl3L6Q2czyJWoCujkX06x2zL3k4BeNV
 QV7C9ktpR7RDSzKmRcOThPkVNP7ivyR0mV4Yr6WSswrTkEwVdgqFi3C
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: yY0Ep6v94iLHlU2djAg7YjvvtV25vP6Z
X-Proofpoint-GUID: yY0Ep6v94iLHlU2djAg7YjvvtV25vP6Z
X-Authority-Analysis: v=2.4 cv=CoGys34D c=1 sm=1 tr=0 ts=69c5cbfb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=IjstctezsF06UAORExcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX02P0zX8G9/ld
 OE2ZxH1fuTZ5wWWDSri/JEpcTj8YvbmabzbNoNXktCVXA8RS+fX0tmvkn9pmSOT4z8JSqCpzHIk
 wSxvfzuHXWo4/YV9PtKSOTKBiDcZaHEzXOBGnAf8hHN5SFa0JSXT1Vri16LEtf0X5JRwVjBjvMF
 A9jfWK2K00OmYFf7X7+ZMYHAj3QdsLdgrnDiZ82/I/kb+9BeMbmdTHALM4+12vwT/KY+MJgDfCZ
 qLP1zVqEY/jyZgBEUpiyvsM4uCwe1D2NEsB72rXItqwqfYj+ORdVGdIHzFkRtK5Ac0DO9NIVJCE
 CObOqDORL0KibVjFa8pinDE1czvgz9vuUBFbkH6yvdT6VWxyyZl7XMSysri0WjGCnSNiTUBAuCd
 VA2oUZqiMak4Odx4D+9+YqVqmP138nrwxJAqdO6lMlog9lcVsxqHDk41JAA2WxdCoYXUxDaMVbM
 AoVfwzO9cm7Nbf5NLxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100165-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: ACF9733D71E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

CP_ALWAYS_ON_COUNTER is not save-restored during preemption, so it won't
provide accurate data about the 'submit' when preemption is enabled.
Switch to CP_ALWAYS_ON_CONTEXT which is preemption safe.

Fixes: e7ae83da4a28 ("drm/msm/a6xx: Implement preemption for a7xx targets")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 50bd7aa4e792..f8cb8b578661 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -347,7 +347,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	 * GPU registers so we need to add 0x1a800 to the register value on A630
 	 * to get the right value from PM4.
 	 */
-	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
+	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
 		rbmemptr_stats(ring, index, alwayson_start));
 
 	/* Invalidate CCU depth and color */
@@ -388,7 +388,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	get_stats_counter(ring, REG_A6XX_RBBM_PERFCTR_CP(0),
 		rbmemptr_stats(ring, index, cpcycles_end));
-	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_COUNTER,
+	get_stats_counter(ring, REG_A6XX_CP_ALWAYS_ON_CONTEXT,
 		rbmemptr_stats(ring, index, alwayson_end));
 
 	/* Write the fence to the scratch register */
@@ -457,7 +457,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct msm_ringbuffer *ring = submit->ring;
-	u32 rbbm_perfctr_cp0, cp_always_on_counter;
+	u32 rbbm_perfctr_cp0, cp_always_on_context;
 	unsigned int i, ibs = 0;
 
 	adreno_check_and_reenable_stall(adreno_gpu);
@@ -480,14 +480,14 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 
 	if (adreno_is_a8xx(adreno_gpu)) {
 		rbbm_perfctr_cp0 = REG_A8XX_RBBM_PERFCTR_CP(0);
-		cp_always_on_counter = REG_A8XX_CP_ALWAYS_ON_COUNTER;
+		cp_always_on_context = REG_A8XX_CP_ALWAYS_ON_CONTEXT;
 	} else {
 		rbbm_perfctr_cp0 = REG_A7XX_RBBM_PERFCTR_CP(0);
-		cp_always_on_counter = REG_A6XX_CP_ALWAYS_ON_COUNTER;
+		cp_always_on_context = REG_A6XX_CP_ALWAYS_ON_CONTEXT;
 	}
 
 	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_start));
-	get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_start));
+	get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_start));
 
 	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
 	OUT_RING(ring, CP_SET_THREAD_BOTH);
@@ -535,7 +535,7 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	}
 
 	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_end));
-	get_stats_counter(ring, cp_always_on_counter, rbmemptr_stats(ring, index, alwayson_end));
+	get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_end));
 
 	/* Write the fence to the scratch register */
 	if (adreno_is_a8xx(adreno_gpu)) {

-- 
2.51.0


