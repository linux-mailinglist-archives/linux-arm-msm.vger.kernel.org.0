Return-Path: <linux-arm-msm+bounces-99387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SA75N02fwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:15:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 640292FD0FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:15:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A41E3087465
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:13:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1077A3E0C75;
	Mon, 23 Mar 2026 20:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqloMYI1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DRjKffqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940F13E1222
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296779; cv=none; b=felwXyvUzS3MiaXJzR15F6IhPbCg3+QLeQIyhheg/Bx+3bR63on37ol8lhLJo0LSEVdapJug8+AZrNz7PJ5AzwvBbdCVF+L83EInAJabkDr/AA4W+tf/cYHG193ykMtW3gzlMasFReTrgiMi2x4zu1x+hZq0zuwT9LXVRKLJKaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296779; c=relaxed/simple;
	bh=XU6DfLSnpNWPI66IC/TzgoZVKRNGuruB43NJyqi08Jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mAGLGAArlSEnjaeFSOk29ntpWiIVd83oH+/gmoaut3CcRv+7JL/5c09qW1OMDHeRRi94y8/OIT0d2rfzuVbk2oY2NG87CnmPDBovRBaOhfUYXUruh/Rtdg1tmjU/WSVLFqWMJzKXUCTukS1Gv/6O59yd+/jCyrdJGRI/I3uIo/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqloMYI1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DRjKffqL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqWF02831804
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S55qtoUgugfr63dVcnC+GLJkI8uxi0KX+Hru5AmHH7Y=; b=dqloMYI11CXMm/0S
	keI+hcXWw6XO5qsNaLbzc2snqk79Ajsz1CFDNCPAheowchArt6sr25ayJhV+iAV+
	LZjC52g802mjn+iLMROT9Yd2mCPbQE+XqPDBHpZwdChmqXNUwIzGSwGH0Z8VeNGk
	G5O7Tyr5ry5el3TH9+b1/gtOKjxpSNb6P9/eRPm4JsT1ElSALZc+QBkXIiJg8oTg
	WP8VtX16wCtAlsnYPYs+Pc3giSy97oMKDLkMLRqpgzWdHKycN0HiiWCehktVCUme
	/XzEVVa0lMlpv1UsfHLfXTefIoJHviuQxWcMEBt51jZh5Y1VgyFmsPDUwfXD2otE
	yYqyHw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d364jsgk1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:12:56 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-829b8bb5211so12175324b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296776; x=1774901576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S55qtoUgugfr63dVcnC+GLJkI8uxi0KX+Hru5AmHH7Y=;
        b=DRjKffqLRyRoaw5xaQiYMt9yobhcuEcXj4O0I7XGpv5+r7RsKQwITHwi3o5/MoOkpp
         N53VeO0zLasDuRGjAiW02RDYoVKuBaerbTtn+ri8fYl8h0c2uOoNhm5TlaEWZw74nCt/
         g7E4QZO1JbR0LsvtdsBZJncJGP9aA6B+WpQL180sBDXZHQbQIlKiElaYD8iqZLnoxNHx
         04XBSID1wqN5+aAHKkcpTiYqWi4IW45JVoTiSUM9pfDCaUSLIYnQDOhmghPKrCRQkHAJ
         dVQzqOQDDr+1SYATsZ1vGaEwif8HI75R7tTcYRD8Wk4ZllyjAFT7oZTlCE0tjIwzfOYT
         GbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296776; x=1774901576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S55qtoUgugfr63dVcnC+GLJkI8uxi0KX+Hru5AmHH7Y=;
        b=GfEqQSUSFJdP3KcJw5Dag27ffofAOe2QpU/fU/hDIlBlKkyEYpyqP/mxueg8TTgYOn
         JHx9gqHz6kzZqCpXy+KnUaPGu9s5r2vbAEitCzmHtd+bEWUDgdMEZ0ZHSeKeZbFqN7Kb
         dk+jt8So+p3W0Ht/CErFeyNld9O3l/LZuYrkuGB6KbLui9GjhGMpRSMCeXu41wh4EVFl
         CBkC2Ki8Ljz6b+TIuAqfrLPOM4U8Q5k5F73m0VUB7EUeKNfJm1ZhGHTjr8oNuHbq4PlL
         DGnWtqYadaPKWQdon0RCo7CAGdpakHT6Z/rCYLRekHPM10ezUBcd5lmOggQ/OrKGc6Nb
         7s2w==
X-Gm-Message-State: AOJu0Yzxnq8DY/pi3MRIsQ55/FXlK/0bMpifIdxLHPDY/sUR8vJ2AhX2
	t9HkX5nREM8GHgKU6CTzzhqBvM4caf8+HmzP51fjWYUNNavvI9WT9+NuyT2xWK5N7Yq++w0uTrA
	t11c8S5aitOLV9WxvGcOMgLeFcnNtdWbJJHoCEIEZ/SFU9ilbVK/rNnx4c8/zYP0lNpsx
X-Gm-Gg: ATEYQzzI9tVVPj2VCtQPA/hyjueuDWTGMlW3xeAD5TX9ovolfWzcbVvA43+o2OOmMR5
	tjgddyIyyZOqpICqjbhdngydyvD6iWbBHFwvS1Tcf1w0vzPgxqZfYXZ3H0KzqY6sB9Mc+3hdVOZ
	Z2aqUmZuFX+TJE6vpChLOQVja4dCsaTF/xs0G0+y+cd/vkfnKcnNrvBvOAEI1YLxLES3iedgSOl
	14RSfS8XiwkLecv7aJ/V66OuEOh8yP0fok+wIk1IhEGXqGFLY6KlDI80DNeP6vRUusp4qKDMmMI
	gSrcXxh/qmkZrXg1ViZxMX+63QUytIiNEoxhsDin5/r/JrTZaJbBbGxuKCPMJwoKsjkY+eRy9b8
	WU+wlO6FK9wsouOfaikB6Fo3dCNQo7JMtANd3EP0uXVODZg==
X-Received: by 2002:a05:6a00:2d29:b0:82c:28de:fa26 with SMTP id d2e1a72fcca58-82c28defcd5mr8681514b3a.36.1774296776029;
        Mon, 23 Mar 2026 13:12:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d29:b0:82c:28de:fa26 with SMTP id d2e1a72fcca58-82c28defcd5mr8681498b3a.36.1774296775570;
        Mon, 23 Mar 2026 13:12:55 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:12:55 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:15 +0530
Subject: [PATCH 03/16] drm/msm/a6xx: Correct OOB usage
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-3-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=2386;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=XU6DfLSnpNWPI66IC/TzgoZVKRNGuruB43NJyqi08Jc=;
 b=0yD/TiCNdFIRXTp7VQT0deosP8kmu4wjice+6AJyGdMDp+3xpyU04YHALqF5QI8cnEA1H0j2C
 hsAba0mO96sD8vFFQv6elOzXlZTlcraC0mQZMsFn00dq6NPbflBufv8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Qf5s1W0SH7gCRQ29heedflmL-a7I9VEe
X-Proofpoint-ORIG-GUID: Qf5s1W0SH7gCRQ29heedflmL-a7I9VEe
X-Authority-Analysis: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=69c19ec8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=pGJFX0Yo-_9-baE-uFMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfX4hhMCpDsxH6P
 9/vic6n+1VMZmST2GiHL+ZG/xIj7ZfAqMnwlN6rpJLylLpbxQj/B4SgvIi6jIcpn70J9Wpohh8c
 7T/sexfEKjfCbyKtYquE10h5s4JUDBGsBkC3p+Vf3Efr6PFSmheS0siVzVqBuRGfIpuiFknGNLE
 2KlwjfJrwpxFtv0OYRbQGM4b/xSWN1aItcaXZ80fry/k7QAFglGRbMewSLIOvxJOPZvZkYt0whV
 bblxfIxJ1p9xF+okYnVO4oulb9F2Y5eX9CydjT2Srw004k/+lHKw+ZVpk9rj29IOpdmg0w7A1fe
 uEa5ivkltIakO/xHD5sxPiH2T1T7672YdGEvan+EQHHsmmJVPMdbZ5y905rBM9rDMt+AU36IKWt
 dIWQfxuJWYmzL90vGM8+YT1dGntUCSXfoNyGFAj488TrRdcsK34+sZzRN5jJSpvIloMCDEWV0t8
 q0rr0CaQj6hRDP4QHxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230149
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99387-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 640292FD0FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During the GMU resume sequence, using another OOB other than OOB_GPU may
confuse the internal state of GMU firmware. To align more strictly with
the downstream sequence, move the sysprof related OOB setup after the
OOB_GPU is cleared.

Fixes: 62cd0fa6990b ("drm/msm/adreno: Disable IFPC when sysprof is active")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 -----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 ++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 ++++++
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9662201cd2e9..690d3e53e273 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1236,11 +1236,6 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	/* Set the GPU to the current freq */
 	a6xx_gmu_set_initial_freq(gpu, gmu);
 
-	if (refcount_read(&gpu->sysprof_active) > 1) {
-		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
-		if (!ret)
-			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
-	}
 out:
 	/* On failure, shut down the GMU to leave it in a good state */
 	if (ret) {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 93bf2c40bfb9..897522778fd4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1603,6 +1603,12 @@ static int hw_init(struct msm_gpu *gpu)
 		a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_BOOT_SLUMBER);
 	}
 
+	if (!ret && (refcount_read(&gpu->sysprof_active) > 1)) {
+		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+		if (!ret)
+			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
+	}
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 987c99097d40..d414f24ddbd9 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -711,6 +711,12 @@ static int hw_init(struct msm_gpu *gpu)
 	 */
 	a6xx_gmu_clear_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
 
+	if (!ret && (refcount_read(&gpu->sysprof_active) > 1)) {
+		ret = a6xx_gmu_set_oob(gmu, GMU_OOB_PERFCOUNTER_SET);
+		if (!ret)
+			set_bit(GMU_STATUS_OOB_PERF_SET, &gmu->status);
+	}
+
 	return ret;
 }
 

-- 
2.51.0


