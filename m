Return-Path: <linux-arm-msm+bounces-99400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4JZ3DJ+gwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:20:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7E92FD1E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD27430E26D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 569E33E4C62;
	Mon, 23 Mar 2026 20:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKowUVY5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kotSCHnT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE55C3E51CE
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296854; cv=none; b=t4l0YV21f9oEi0qMhNyA+29hDLA4e7dgxYxWFBaLNlIinoErGdj3AMZFiJ4cYZ6YYOI1JMrujpKs3IlrU/skofLWBa9ZwBBAixNkrc0WcZpcH4W1vzz9iSxoEBpGHsI9t0dqlBbpl9CxWPLWL/3w3ts+mPOhcwp1N5T6sthu854=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296854; c=relaxed/simple;
	bh=OALDtSgWAoUx/EoQ1+hF76+gqkywPVTt4BGA/lmsR7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h3DUYKhvuPM9I+efBoSgipD2sDonenNaxmeJ7KZ7CMwBfNLJXJTy9mZUgpCh0g3K6nmI0bOrU+Ad0v1CEOiigWrjEfg4S9F3EmyhPMcmJxxAd68aWo+yyTICZBoV2s483wuW7f8er+y3ASq3opziRrpGhM4rd4nzcpViieM2L4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKowUVY5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kotSCHnT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqhjn3171033
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CGj71twJ5ZzNNZi9iu7gqpb92KAhwgkcEKsZ1QXTiMw=; b=dKowUVY5LJ5uf1JD
	bo/duJJ02zO4z658gX+PdzgFzXswOv/PBrSAS90rkrJlnpNSk9IJr+m6QcjQtXIJ
	3prq2NzzX4fb4SY7/Ofl1Zi8kI+uZLgJfcqNnMlkNW2E2mvTTSzYQUUnyeCTTrm8
	xE1vd9CtsuFZTlJP9Q0gZGK8nny9zkV4KIrf2BOzHs/bZpMuJrHXMvCmWLetvIr7
	AInRMj/AhTRLiU5wSmv6OEdsCOEabI8slm0OSjiddz0fAv6d9VT5eOOOz+KEzbOA
	4pkANv7qj4uFhhSHIYzvE2F/BGwds3anmSrWWCFbPD3lNsh4+mwgAABI73CIP4Km
	+Xy5Yw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r21k1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:14:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c7398e393a6so1265043a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296851; x=1774901651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CGj71twJ5ZzNNZi9iu7gqpb92KAhwgkcEKsZ1QXTiMw=;
        b=kotSCHnTbR+X5cwLf0WbmiYlwkLzMLrCEjeZ+U9APqcg+W76EVvcL2nBp6vcgyLZlx
         xeM3rsZIKjQ/PFH1O2zjOMho7XpvPm26Z6dQi9oAPwuuUPtSUBTyGDEgKMoXQ8dYFbsK
         25GYYsL3C3eoOKPUtf5zyYqmSSVOSRBMx5ukryyb69nAqJKh0eJRBI3gzS7iN1LbhfXc
         7kKXxql5CCTGqtvi00gTkImVMVl1GdqlOZwOB5ZjdsKNLuAtLrBKmXXS4xuNQDoiqKsR
         18E8YAWTs3YFZwTwR7i866n18lm5QhLjCRpgMNRgb0P98uiydSAx822oainC8mqDDxsy
         rKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296851; x=1774901651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CGj71twJ5ZzNNZi9iu7gqpb92KAhwgkcEKsZ1QXTiMw=;
        b=gMknn1VOpNS14p2VpAWrY1iDtX9avhL2AsEr6X6ylJ+273zMLsHMqK6YJ76j2Bidse
         ZOPqm4I8+VxkJeRL/g8n2MVgNT2hooVyI2wiZS6UmVg0oyBh/uyD+fvEdhNHsfVDSmif
         G1a4alIVXDWJGax8/ay5c1qMsPgvGTUMip29pHe56cThCxJe4mrlCpJBi5DbUTdNY4C+
         KvkBaMxf/DlT1HzU0pfvZvRAaj/StijxC+LxXZbwwoHLPj+Lrb6ljaaWCUvdNz9cDOlG
         V1/BT70Wc8Ca/gIVQliN0Z5Jbo92KYiwEt2yPL6Y3stnF7h5Xd4UQWi5gOJYufsCf4rD
         yDVg==
X-Gm-Message-State: AOJu0Yy9KfPQuEvy03VJrURkHZb2n6o8t0M+7/MNG8rKI4n14LxyweJ9
	kk1mQuSuS7qfTk0PMD5Qv1IdJDaMFlEysZPtl4BCDZop+pQ5jorSaGI2jl7uFeDdTdccZtbdgTq
	ErdZFt6zQeZPjr923zl1tB1Um1DHlHb2v6L2Ya3nbNfPd7kJmC+FAwPVHCpho+miif7dS
X-Gm-Gg: ATEYQzxC5HNlgkLAJuwcgTarv9QUQdhyrEyvM7CycC2gNZl5ZJLrTfoSYtbtqmdmfyv
	i8VMjVyxHKvnTLRkXT6MBtq9hkBOm7s27aQm21nvgW7UHw9uwKFdo3Hm+wI/AqnkwGONwBZ3eFh
	eTTt7S3N+vGJ71J+x4oDXskMGC5y+fP3v1Vf5Ma1Eq8MdmrHiCwcagRqHg2E7yj8IRnqfo+8xS3
	XFQrPobKV4Iam2XE+2UFZHEUbfuJnZKxajUJYPnVQkLvfE0H/y5wrX84Jt7mzw0JZD7iO3RakAZ
	hdJio+G0m0Is+uTuPIAIVEiITsbv0RgJwt5IDmmdItxFr9A5R4rLLwdOd1dCi9qg++DjUiWn/Aw
	hT1UoejQSKstZ0F0XgH4vElUkuxhwSLlwkxSsz+Wl3XoR8A==
X-Received: by 2002:a05:6a21:6d99:b0:395:7fb:9362 with SMTP id adf61e73a8af0-39bcea16744mr12834175637.19.1774296850998;
        Mon, 23 Mar 2026 13:14:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d99:b0:395:7fb:9362 with SMTP id adf61e73a8af0-39bcea16744mr12834139637.19.1774296850493;
        Mon, 23 Mar 2026 13:14:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:14:10 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:28 +0530
Subject: [PATCH 16/16] drm/msm/adreno: Expose a PARAM to check AQE support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-16-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=3641;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OALDtSgWAoUx/EoQ1+hF76+gqkywPVTt4BGA/lmsR7A=;
 b=0U/dxL1yL6aQatKBLmc7nPkUYTffkVUmMgtW1qBahyOb239m7K436lkQdHzJI2lNLj8kbRpdK
 t0Tp+PB1ZxYBf3Q8mB5wv+jUSHLjlETidORFunZfMQSFnyjxEHRepxA
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c19f14 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VDML5bnlI8VuwgTyKRQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: cQnOl1654R3RUInCk2G6zRHUvYmMT888
X-Proofpoint-ORIG-GUID: cQnOl1654R3RUInCk2G6zRHUvYmMT888
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfXwTs58Ht6PIWh
 4Ikf0crSSHwVCEPB+iwBii4/+4Dww5CmT/Err1UnrVnyYjmcYDayrOuDkoWwIN63UdDMO5LT8Jf
 42GcUUuVAOKeqJBk3oODdSftdHvnjkyEvPbSGOmdIZgwSPeYz3wjOXUnpOc5mLhw5yqvPFk6IZh
 rErYj3B7MX+b5IRkvEOtJnT3zeEi9rLkPuTEl0iM24hQ6bbLqWgOzqc0FGqMGGrc5m4ztO/huZZ
 cuYnBPA9LIbc48vfomeGoJp56Abw6yKispk1TgqqN2jo6FuxC7ztuQwlK7vEWTDkCTPM7xYrv7R
 MOHstT4Q0UV1U/Q/W/e5hXHJKc4HfcOieMFdLi0R4EqmwAKHWfOQBp/3GuxYi8omTXxuMo4PMC0
 I7z0gBrlq6EWFoDDFSPcfe0TrhHO3UXG2WLWCKbBMCBRiSzep1wQywUN7mDnhujW4oGMSxHmCKi
 fmgoFi0uVy8t8y4tQ9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99400-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 9D7E92FD1E7
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
index df739fd744ab..224b2f7cc8d3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2610,6 +2610,17 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
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
@@ -2808,6 +2819,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
 	.gx_is_on = a6xx_gmu_gx_is_on,
+	.aqe_is_enabled = a6xx_aqe_is_enabled,
 };
 
 const struct adreno_gpu_funcs a8xx_gpu_funcs = {
@@ -2836,4 +2848,5 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 	.bus_halt = a8xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a8xx_fault_handler,
 	.gx_is_on = a8xx_gmu_gx_is_on,
+	.aqe_is_enabled = a6xx_aqe_is_enabled,
 };
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 826661cb7988..f7289a9ee0bb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -443,6 +443,10 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
 	case MSM_PARAM_HAS_PRR:
 		*value = adreno_smmu_has_prr(gpu);
 		return 0;
+	case MSM_PARAM_AQE:
+		*value =  (adreno_gpu->funcs->aqe_is_enabled &&
+			   adreno_gpu->funcs->aqe_is_enabled(adreno_gpu)) ? 1 : 0;
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


