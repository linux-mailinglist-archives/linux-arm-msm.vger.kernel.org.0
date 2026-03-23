Return-Path: <linux-arm-msm+bounces-99393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B0lLLmfwWmFUAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:16:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6C22FD15E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 21:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EC6030BCA2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 20:13:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C9E3DE452;
	Mon, 23 Mar 2026 20:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5JcowfY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YeBRDlFH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06C13E0C71
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296814; cv=none; b=IiuPcVJQErUV+ywOf7SUceC6cZ4JgtZNGgaR7I5vklRoR/aj2bWv0JkS0gaKswVdZYqlFP4oF8bqiqyel8UwN1sqasNQlc8+BJtpow7UlM/NPLErN19DhKApzzD7woA2cmxwsabdYd5fsu4nr3CAXUma5WxG1v3dTK9a8m5wtIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296814; c=relaxed/simple;
	bh=2QHtgMqo3TglD7zXCiFywppEZUI75kRalKuvSCgmedA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L03QDf+jUEgJIZErgrUVrK4f0Kpdqj249H59bRk5I52tlFVhFr3t0TxVqZvcAAh3UnvKtc5YQLJi1Ylj5xqqDEZ4mpST01V7LU+/QuRHaLRxyEN7IWL1o7apu1FZnfy5dgQw5H3/qC4+ZWRGnc8ZAB4xTqgggb6W9tpCgaFmLzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5JcowfY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YeBRDlFH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqiFD3934853
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i/EFVjmIq4o0XB7IqAunb20T4qbIQzoB4f8t5D0bKME=; b=R5JcowfYpShE6HKi
	ZZtR1afU1moPbs6WD1t9iUwFQRgLbARvEKpBPk/qiTNEqARgCK12/Z7u+nK4LRpq
	+YfE/PVdhkZ8X+lFKL4JJb18cSQL3la56GGS4TiS1bCl6L7oUKZoNt3AgrTJyzu/
	/jCCU5a+7x7AKKjKGGcR0D2gCcP88G/WeJzya8VOlSmFk3UWsNh/4pDsPaQUYsw4
	xkrg2sGcmZ8/S/wfiOUQrQn90C3B7kpFgEwXZD/iuILIL+C7yMjIr4XsPQdbmRSW
	cUfx1Lu3uWHCatPXwmMnPKzVnkq2mpFd28aWa9ydl5vSokCNPf4o5sF2U0gJ7NFw
	H6n7ew==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0h6k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:13:31 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82a6c70f1f8so3901049b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 13:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774296811; x=1774901611; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/EFVjmIq4o0XB7IqAunb20T4qbIQzoB4f8t5D0bKME=;
        b=YeBRDlFHw1/nYv+yV2qZRi3QuDeA8sP7XW6xrCtSmNhsCZ44U92MnKz/HP2Vhq+62v
         qFq/pQrzpK6siPRoWwaHbUGC89a5aFRUUfWwlmfg7RExJSZQkzxKRpUrHQklhZ3I95XO
         mZPipuMdKWHZ5Xw6kP4e8feq9mkODUn9yBDjaSqYvMbFW9F5INGXfyy9dT2ECTnIr4gx
         FhdiEQyFi6GXD3+RhGRQm90g3rIuXNptaH/LY4zZz1YH9VP9HuQwIszQxv1a5nn4UGvG
         gwRAxLnB0CJkOJYP16J2JYCdiNFuwzDhsIo5PptCiCmvni1jXYiCQ8BlZg29M06i9X+k
         2Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774296811; x=1774901611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/EFVjmIq4o0XB7IqAunb20T4qbIQzoB4f8t5D0bKME=;
        b=bofhxRqHBFo8qXjItni6YZ3dyHF7mgiycar1s449CkKMga8o9Cv3vukHVsxVSfOEQI
         P2MXvgqwLJaDAzvdlZYN55ePQk8ILO4cJ358dVARpAvBAnT0jg2yXHBeLCH+EGBrTbY8
         J4zPRWfWb31YnVa0lIyVomEVnGV8Gop3ukRsWP4ezW+N56bO1qZKquFDZnCw6eYU1SXr
         QWEearfb5LkSTzc9PS4XKxvEKLWFev0bT8RyzzSVtvbhu2+NXY25eCoXfX9h1ciEmwtG
         fMOKz4T2oLwCYZMLbihD16ZMe6jX/hL/FoOXZT9pxHlM4kc+eiKpdWRc5XUNoeGfYLJc
         qo+w==
X-Gm-Message-State: AOJu0YzMjTzUrkapFSgnAOqeoXlJhVDGWlIbYW2qzppLp61Cnb1Tw01o
	OCwHlz9RuszPcvy1GG29tZ3nLvzlw+vE60ArLAIfWcVfNDatP0jgP+wCDnE7jckeJEnenNDPvXl
	mtrhM6oToMOHCDeQKtuMppIKFMRGvOyqOsAaTrKp61CWsFbtBd42s5XvIrnqTFkO3U4Iy
X-Gm-Gg: ATEYQzynPqRtb9pq4j4j21Wfq5Whzg+ZBievdajSMJIA7E5QC3N3NuRGLwzXusya3pi
	TBLx1XjPj4rWeGZcQ8Rc561CvXpRGLcbF9/F+uA44EbTZtwgylPtLhOIFmamcPrm+pwjZ37NH2x
	vLkq1rGNNvvs0QKUYz9mPp+R96CRRqOf9CE/3857q4nBH/4fWLPRELmJTIkDYlQ/0aTV1HTuE5A
	jWnvbEjelYo4cqZ+tRGGmKi1VDRMZvfEEDz7/dsKNTD5iqobCFmSGk8dwyX5IaRadU+eGaXgiVb
	W7wiQwgWnh9FzUV+y4CwsFnP4g0gCrU6fxCBEkW9bycqCK4jeJ767gXbi0OJ15yGJRsuyy1vx+d
	znZ7wkEAtiF7/zRbdGTUYkhAcOr2y7gBWG0ymsI3Tv/QSYg==
X-Received: by 2002:a05:6a00:1707:b0:82a:8163:4bfe with SMTP id d2e1a72fcca58-82a8c38da93mr10575894b3a.60.1774296810406;
        Mon, 23 Mar 2026 13:13:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1707:b0:82a:8163:4bfe with SMTP id d2e1a72fcca58-82a8c38da93mr10575852b3a.60.1774296809650;
        Mon, 23 Mar 2026 13:13:29 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409d148sm9510738b3a.29.2026.03.23.13.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 13:13:29 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:42:21 +0530
Subject: [PATCH 09/16] drm/msm/adreno: Implement gx_is_on() for A8x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-a8xx-gpu-batch2-v1-9-fc95b8d9c017@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774296753; l=6497;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=2QHtgMqo3TglD7zXCiFywppEZUI75kRalKuvSCgmedA=;
 b=hquaopb4yfbmflNYOXExPzWdFx7cZL5F60eeWJy+fD6AopfspxA3QntDU/q/URSv5NPSWGMeF
 unE3v63PjiyDlPBks60CG219KYKk5i9OBmXmHMwdsjkpfZ3BiPXeHgD
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c19eeb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wYauUFJWvglRPmXws0gA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE0OSBTYWx0ZWRfXzZBzPct+wx1D
 id264McZg1ECSkNcDNLsqTPCSWFA3kbFSYadG/0cvkmLDhNexkvQT5ZKs9oTg9ljukHv81i6Izz
 ZE65l+vG663GlpNKW7lUiXN9LekmlAMkYxI+P5E4wPwXT1tfdnq3IlQIoqjcHLMc7oxUh2SaHvL
 soLVfuL9OM8A+QEMbz/1TmqgwnesOi8B3xl+w1ak707uVohg1gnP27qqWR68R498c+GWpnNmdnL
 hbFI20UV3ivMzJTcvjSMvgo4OAWnc9Ok5bCwcGqBGZB1g/3TpJZ4DWdRKy+elZaTkocK9cSAZMa
 pR2svBM+Goun+ctPIC48xSttc4pb9Uhw0kvzNalR9C457vO565eHULIGRUhfNtmYqgnsOJjB9kB
 49DtMg9YgZOpEC2ELA/gg/gcTnV+ZDA53luhwtOil3+cbXPperXpKv2xMkeT/4Th6aLh4qXUXdF
 xLnRD5joEqGEmdCcOnw==
X-Proofpoint-GUID: x-8mG4BExQNftEreoVMQTksaMg3w1SK4
X-Proofpoint-ORIG-GUID: x-8mG4BExQNftEreoVMQTksaMg3w1SK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
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
	TAGGED_FROM(0.00)[bounces-99393-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 2E6C22FD15E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A8x has a diverged enough for a separate implementation of gx_is_on()
check. Add that and move them to the adreno func table.

Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c       | 25 +++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h       |  4 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  6 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  4 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h     |  1 +
 5 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 6d511dc54e43..cd6609bb66fe 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -91,10 +91,10 @@ bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu)
 }
 
 /* Check to see if the GX rail is still powered */
-bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
+bool a6xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu)
 {
-	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
-	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 val;
 
 	/* This can be called from gpu state code so make sure GMU is valid */
@@ -117,6 +117,23 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
 		A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
 }
 
+bool a8xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu)
+{
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
+	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
+	u32 val;
+
+	/* This can be called from gpu state code so make sure GMU is valid */
+	if (!gmu->initialized)
+		return false;
+
+	val = gmu_read(gmu, REG_A8XX_GMU_PWR_CLK_STATUS);
+
+	return !(val &
+		(A8XX_GMU_PWR_CLK_STATUS_GX_HM_GDSC_POWER_OFF |
+		 A8XX_GMU_PWR_CLK_STATUS_GX_HM_CLK_OFF));
+}
+
 void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
 		       bool suspended)
 {
@@ -240,7 +257,7 @@ static bool a6xx_gmu_check_idle_level(struct a6xx_gmu *gmu)
 
 	if (val == local) {
 		if (gmu->idle_level != GMU_IDLE_STATE_IFPC ||
-			!a6xx_gmu_gx_is_on(gmu))
+			!adreno_gpu->funcs->gx_is_on(adreno_gpu))
 			return true;
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index dd0614b19aac..9a5464fa6a07 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -10,6 +10,7 @@
 #include <linux/notifier.h>
 #include <linux/soc/qcom/qcom_aoss.h>
 #include "msm_drv.h"
+#include "adreno_gpu.h"
 #include "a6xx_hfi.h"
 
 struct a6xx_gmu_bo {
@@ -231,7 +232,8 @@ void a6xx_hfi_stop(struct a6xx_gmu *gmu);
 int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
 int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, u32 perf_index, u32 bw_index);
 
-bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
+bool a6xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu);
+bool a8xx_gmu_gx_is_on(struct adreno_gpu *adreno_gpu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
 void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
 int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 897522778fd4..cdecd91094c6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1641,7 +1641,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	adreno_dump_info(gpu);
 
-	if (a6xx_gmu_gx_is_on(&a6xx_gpu->gmu)) {
+	if (adreno_gpu->funcs->gx_is_on(adreno_gpu)) {
 		/* Sometimes crashstate capture is skipped, so SQE should be halted here again */
 		gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
@@ -2768,6 +2768,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
+	.gx_is_on = a6xx_gmu_gx_is_on,
 };
 
 const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
@@ -2800,6 +2801,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 	.get_timestamp = a6xx_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
+	.gx_is_on = a6xx_gmu_gx_is_on,
 };
 
 const struct adreno_gpu_funcs a7xx_gpu_funcs = {
@@ -2834,6 +2836,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.bus_halt = a6xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a6xx_fault_handler,
+	.gx_is_on = a6xx_gmu_gx_is_on,
 };
 
 const struct adreno_gpu_funcs a8xx_gpu_funcs = {
@@ -2861,4 +2864,5 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 	.get_timestamp = a8xx_gmu_get_timestamp,
 	.bus_halt = a8xx_bus_clear_pending_transactions,
 	.mmu_fault_handler = a8xx_fault_handler,
+	.gx_is_on = a8xx_gmu_gx_is_on,
 };
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 018c164ad980..c0b9661131e8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1251,7 +1251,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gpucc_reg,
 			&a6xx_state->gmu_registers[2], false);
 
-	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
+	if (!adreno_gpu->funcs->gx_is_on(adreno_gpu))
 		return;
 
 	/* Set the fence to ALLOW mode so we can access the registers */
@@ -1608,7 +1608,7 @@ struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu)
 	}
 
 	/* If GX isn't on the rest of the data isn't going to be accessible */
-	if (!a6xx_gmu_gx_is_on(&a6xx_gpu->gmu))
+	if (!adreno_gpu->funcs->gx_is_on(adreno_gpu))
 		return &a6xx_state->base;
 
 	/* Halt SQE first */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c08725ed54c4..29097e6b4253 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -82,6 +82,7 @@ struct adreno_gpu_funcs {
 	u64 (*get_timestamp)(struct msm_gpu *gpu);
 	void (*bus_halt)(struct adreno_gpu *adreno_gpu, bool gx_off);
 	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
+	bool (*gx_is_on)(struct adreno_gpu *adreno_gpu);
 };
 
 struct adreno_reglist {

-- 
2.51.0


