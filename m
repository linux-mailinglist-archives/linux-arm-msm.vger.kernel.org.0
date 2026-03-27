Return-Path: <linux-arm-msm+bounces-100179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAnPCH7NxWm5BwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100179-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:21:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DAB33D850
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 01:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0F53312E836
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 00:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 326EF23D7D4;
	Fri, 27 Mar 2026 00:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S0UK5GHl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RX62IUo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8913A2550AF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570576; cv=none; b=QzPttXs+OV4iP5UkVRQLgYKh76Tn9Iiy1F/eQPHr0k5d8p3QE4BpUutLmfHciGU3J00qz1Vj42zbHauvqV8SaXGWCPocRXhud32xPsJHc+gtScrUYchW6tBo6y/ATGK/5b/x5/fgPojSpYZT8Yc7Brq6F4Q6RKQQbEumvVGjQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570576; c=relaxed/simple;
	bh=NUuL6+oGaUpA7JxKBFdWblIueRfnWDhrWCx2k8TSQ1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIvhe56ZGNyW0QnzXlcFVMB1o+baac0J6MulLagMQeHO+HCt5vSogTDFf7swExwysjQDMD2JlakVPsNQpuQvIvNt4s2Zo/6zUT2ESmtKeYX3RVeMqtUEkbdzaE2ubsAuwhe6qwXsW2lX63GmGzkNYBdl8BQy2Kdige7fK8Hi1nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S0UK5GHl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RX62IUo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QKY0Jw366433
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyJXWO4lhEbma/Pghwnm6vVrCQrIya2bkF7i5BoSU2o=; b=S0UK5GHl9NZxZySL
	ty2O6UilqLWQmuxjH9MFtXqQGpcawIWkHbW4pyvE0MAa8TUkkeoUWTkrfFe+6SSG
	v5mOy7K3I56qnIHIdUyWaNCK4JrKOJ5daD2gFDBrP3Y2CNxe5HkjKg+fvzrRjYh2
	S2JBShiy1SNFc9RLn1UiywQZzg6cTqqW+FFnI9AQHjs9nw3qvSTWUzG2ClW0aWsB
	/O1v44a8X7uSYh01qEckEj+JrZOoGRO4w7kkvIbnN4qSCr8r/mRKoct6lgUznNKP
	im4tXvZrluvtH+mL5kvg64vsPpAjzQQWX/LylmVuikAVjK9GPFVNp43GtQ4yH3By
	to6o+w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bxvght8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 00:16:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-354bc535546so1716919a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 17:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774570572; x=1775175372; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyJXWO4lhEbma/Pghwnm6vVrCQrIya2bkF7i5BoSU2o=;
        b=RX62IUo5XmRAw7dFPWkZIgiaAM47O1y2sBEL/9FuxOc7gpGLmzs84ZqLy7JTbdSuFZ
         7JjWEpiSf85Z3KOSL5+o4PNIs/MsjZiEfuuBsDE4BETviP0mGdzPvA8aFtieZtqERC3f
         9WQ719DgeyRLF2Pyl9mM51cuwlGUP7aXrVahOC7Ew0hvENwVaOQbTh30yC90k8DA9M7G
         xj+wPng5E7CpNv1OiAOB8oVzGBVFX9Mdms/48Ddqxzsw3eHirM7VnFGq4PdIikGxJSKi
         mdsDJjbkeXdmKSWFH7FJGCh6Ht3W5VWLf1gFJVy1fcNfqAwrCWJb27YgpGThYnCW24Lv
         sLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570572; x=1775175372;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyJXWO4lhEbma/Pghwnm6vVrCQrIya2bkF7i5BoSU2o=;
        b=cY55okQ2J2vhHUCJytR+8H9rn9/ajIPb5Mec3V9a6hd7ft7VnLUdwBSjfmMkoKnCda
         Mzf2tzB1ZUTAvMBcLh6V8YN8X4WSEymyNBli6ImIG8GBlLs2fIZtxKhDt3VmaKC+s5tz
         dYv5p4ynPAMcA0GJPu+7Bkoc77p43xcApqkhmhDo7gXV5yAe9ZMe7drMVFZJ69++UX2b
         vzKri3EnBHIgO9utpxefYGDKVKJImFfvDkroUp5Hp3itfDv1zTLfE7JfNzH9Ud5svmDN
         nFXmhlPL6iDX/iy3tQNQZttpRl1NJ9oE1ELZ7uQXtxc43y+xBgOTqoXdJY0Zqk77PEef
         qgrg==
X-Gm-Message-State: AOJu0Yw3wDeN2Ef/EK334dVrFsHW7DGsFJZu6sczhwVeFYt5vcPLAWEq
	njwRWS7nRg5TMRI5ZxNBOasO0audXHhsFct7N5WkYObrn02mvNETTPnP3pPYCVhFl4PNy49DwdV
	c4Gz+2Dgh7FBE3IGNC23fRVcKqhg9jZcoDR1s10GSSSx8eXxD7Zs+1nTI91PAkKMrAeh4gJP4vB
	UI
X-Gm-Gg: ATEYQzzo8ED2IvXg4BGwFVyjVaJpkunJl6A40/c/zNbPDrr4pm67JTME+ogwrI+HGUB
	/e738EyDA91H/I4eeS8SJO7MSTAeP1Fd9RBXVDABTg+f5Vi4Zp5kGOxELAjh6e02TEGNa/gnAmW
	z1fjX+RTRj8EpuHrEtJxT3/6b/SPbU1ZrMPyl7hXjySLwZJWm8eqGcy2lqc4M/NqZd8BPiBcmk+
	GokrYBDurfqN84Pm/hWXgsDfwRCftuqas8i9Bnb+AuYLgSpJKpTGYVB0iyRCqfjzAL4O39E12ua
	aB8Wik8opmD9qqr3ZVsEWEJR1d/83Ms1Z4YpZXkz1GeeI5d7AcVBOoI0h3G++ZUIb22YhEOSOCz
	FBa7QMNJYVZnirsM5WmwhiYeiNeqiBpeM3DlMwJps3OWqaw==
X-Received: by 2002:a17:90b:518e:b0:359:ff8a:ee55 with SMTP id 98e67ed59e1d1-35c30031e44mr436072a91.14.1774570572067;
        Thu, 26 Mar 2026 17:16:12 -0700 (PDT)
X-Received: by 2002:a17:90b:518e:b0:359:ff8a:ee55 with SMTP id 98e67ed59e1d1-35c30031e44mr436055a91.14.1774570571533;
        Thu, 26 Mar 2026 17:16:11 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2ec799eesm163155a91.10.2026.03.26.17.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:16:11 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 05:44:06 +0530
Subject: [PATCH v2 17/17] drm/msm/adreno: Expose a PARAM to check AQE
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-a8xx-gpu-batch2-v2-17-2b53c38d2101@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774570466; l=3635;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=NUuL6+oGaUpA7JxKBFdWblIueRfnWDhrWCx2k8TSQ1M=;
 b=gL86vG67Eo3KyDePP+ZoaqPuM8GFv2ybDnVVj4+uARpKwCegOJplUrSt6DKebEt4N6vN7Y5xQ
 5r/xxz8yOCCAW+32Da5RfazHjIwUJ7p0gTdvRMuuo8rcKQzIXfecxaL
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: epk5emGJTxhCzTNKklTLD53d_41vzCSc
X-Proofpoint-ORIG-GUID: epk5emGJTxhCzTNKklTLD53d_41vzCSc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDAwMCBTYWx0ZWRfX2trxEf4OJX+/
 h6Xo/X8RqkW1vUEAlO1xhGK4HqdMpBMbZmVr8aw1h+SBKwR59MPvzOtLP1XVHucr1HzROZbK7uj
 N0eJLgaDkVa1dNjXHFMHj/q+WHEO+faTTXhLjlq2WuRTDPOM4z54PIfvAFtotJzSSoHhTBHd9yP
 bC7gS50HBOrExa5zmu9HAnxxJ3S/sae8ZSPUmrvdT59S510iaINYEtr4BF7ZedOsNgg0CbD0oSq
 NbQ2wBeftPQhrnYXJiajO25YLPTuBWIImXFsIhKVlhtQaB07mMAagZ2c4tSWulrL9SshD1UqGiq
 GuGWAJKIVEb47omSjsxsw9zPd4rvqTWLDX7waNCm68B4bIsgBsvedJlDacfciKSLuaqodzbRulp
 FSL/qWDucZZgfG3cTK49MkBlKktdGnOiErjO0KfwdbxMn4zw8nP0rxG7dcAwr6/D2n1q/jjbJWH
 T/pbpivXbqFKM/UB/uA==
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=69c5cc4c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VDML5bnlI8VuwgTyKRQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270000
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100179-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 92DAB33D850
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

AQE (Applicaton Qrisc Engine) is required to support VK ray-pipeline. Two
conditions should be met to use this HW:
  1. AQE firmware should be loaded and programmed
  2. Preemption support

Expose a new MSM_PARAM to allow userspace to query its support.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 13 +++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 include/uapi/drm/msm_drm.h              |  1 +
 4 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 44ce02b412ca..4d2f6c4d86e3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2604,6 +2604,17 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 	return 0;
 }
 
+static bool a6xx_aqe_is_enabled(struct adreno_gpu *adreno_gpu)
+{
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+
+	/*
+	 * AQE uses preemption context record as scratch pad, so check if
+	 * preemption is enabled
+	 */
+	return (adreno_gpu->base.nr_rings > 1) && !!a6xx_gpu->aqe_bo;
+}
+
 static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -2802,6 +2813,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
 	.gx_is_on = a7xx_gmu_gx_is_on,
+	.aqe_is_enabled = a6xx_aqe_is_enabled,
 };
 
 const struct adreno_gpu_funcs a8xx_gpu_funcs = {
@@ -2830,4 +2842,5 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 	.bus_halt = a8xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a8xx_fault_handler,
 	.gx_is_on = a8xx_gmu_gx_is_on,
+	.aqe_is_enabled = a6xx_aqe_is_enabled,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f6c39aed50f2..78c348852b4b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -444,6 +444,10 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_HAS_PRR:
 		*value = adreno_smmu_has_prr(gpu);
 		return 0;
+	case MSM_PARAM_AQE:
+		*value = !!(adreno_gpu->funcs->aqe_is_enabled &&
+			    adreno_gpu->funcs->aqe_is_enabled(adreno_gpu));
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 044ed4d49aa7..c0ee544ce257 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -84,6 +84,7 @@ struct adreno_gpu_funcs {
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
 	bool (*gx_is_on)(struct adreno_gpu *adreno_gpu);
+	bool (*aqe_is_enabled)(struct adreno_gpu *adreno_gpu);
 };
 
 struct adreno_reglist {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 5c67294edc95..b99098792371 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -117,6 +117,7 @@ struct drm_msm_timespec {
  * ioctl will throw -EPIPE.
  */
 #define MSM_PARAM_EN_VM_BIND 0x16  /* WO, once */
+#define MSM_PARAM_AQE	     0x17  /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #

-- 
2.51.0


