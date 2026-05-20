Return-Path: <linux-arm-msm+bounces-108852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNs2Et/hDWop4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:31:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EFD59207D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E267B306BD09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB973F4DC1;
	Wed, 20 May 2026 16:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K6fyIZQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuqGX6kp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DD63F4124
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294350; cv=none; b=ce8l372WZc05lMJyd9kle7ETuHrBsvS0l1J4VIuaJV5xRF5muM6VasImT5kEaU2Ad6CLCRraXmCsIyDtqRZVyaOxoT7hguzNVdF97NeUGwMGWFYJvabSVSKKJMGKekivWIj+1B4MTrdg2yWKflN4QS0TqMrNbR8Sr0mxvhPfewM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294350; c=relaxed/simple;
	bh=9lDWiZT/eHTNZhIK/UJqCefbeN4CEfYGMd8YYIt07+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rAnLTGvvJyMGEK45PtrRQkeTukAdVQ3Z/7vo9hSuuVVty4BKbhW83ODnoJtvOdAdkkSOZDpH7d9D2CwPwv0LiQa7KW496Ze5jlg+jBskKMBO+n/vXsIk59RLMFfHyEv+AglKbGyAELwOejgXiV0WwFFz6eq8x0Pet7gOqLRV23c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K6fyIZQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuqGX6kp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KF8Jww748568
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yZLNbGmv9aQ
	+0juIl0AWS3cctse1A5Ppe502SPgUtuc=; b=K6fyIZQ59J76PXtESrdfPWV3XF0
	biSDX3DuyH7qMW9fJDc2U9bWkvc9XIc5UgvPzd6L1ecNZyxf5W3AxjxuxxOT5+Lo
	5Dk9HSSDjm3HRcLjO9U2LMZHYTLayQMI0fKKyT0QGgvcGScupPO2UeCQeIQaPa3M
	SSVzq4VZBk5jyrgLrq1FXeHv3MsniO0uzQt/Cu//dhfAa5MUHIZJ4lVbKZwPH0Rg
	9aIv1tvTI5/q9QxqVWKSIRjZUvgB1LR2FmITvORZOoFY7jnzkevRAt6DZugUcuHR
	2UNTpjsEkfgj5c9iAl+rOF1YIORjEEbIc9nUGEiyteLpx+sq8c2uAo5DPwg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6gasq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7748d0aso48773895ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294347; x=1779899147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZLNbGmv9aQ+0juIl0AWS3cctse1A5Ppe502SPgUtuc=;
        b=TuqGX6kpON1ItGUd3dkDzlQorxtjdgRxy3xkMOgVfROvFUlLn9w1/nRhoSnspTHwvf
         buQFmKRKowUZHt5+ikQKT+aCKq+ozkhGkv1VAKuOqldLkP5kqMYwINl655+0zS9gnIKm
         4x56ZMA/2GcGgTlFUY/Uz8DOC7qLlmpAgwMIDip6RI3xnO0fx66rLkc7UzfiZ6Fq+lIh
         vYOPR/oAH6BNBKsiWwynZaIeBRSmSuntYI0Bh1u8dUrAFSAmpgW+SiEeJyYJgSjOCegL
         8CCu4IjPIl5TPY+bJO5GqBaGjRP+7Q+/IJWrc0l1Irkd9HZUPOZx1eEGR1hocpJyqFlB
         JnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294347; x=1779899147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yZLNbGmv9aQ+0juIl0AWS3cctse1A5Ppe502SPgUtuc=;
        b=qI/Yesnnd+aG3OhSBNpLVtyZ0yzMP3cZjLNb16MdKFrOVIqwi7a3dVxmbb/WFbMlo0
         9thmNRTs6NcqSRjcOpp7SHSiFkTq0yYB7mgUtOz+q1onBcBioLohOyG1PULA5mc6gF59
         vRbZaSve3X0B35qShIWz+7eQRiBGD9qSAknSU/Tj166ecweLFddNmjY1vnRQuOKXwDuY
         LDqooKlOtMvw3Y9hUCGgx7oCFJMuhXa+bqTN3l4FSIdhV6bIrQqntr+RRbapITiRyMNn
         CJP7VyDjIBFGo3r08L3BR6IeSlS+S6DP9pWxFNuBFxlho76gSQCI4KZ9zBa9gSnbNKaZ
         jfow==
X-Gm-Message-State: AOJu0YyUKxmJmSnxKgdHdwKwdmTjqLDefneCBxQQ6bhYAj6arJGelid5
	picUd1B+K949loYCuKQIFKhixQnKkF4s2wwc3Pke8GY01RQZ8Pu2BhgJmv1L/7d0vPfwsu83OUf
	VznXizCqYXHuQVO3rdS12wyPqqLqo5/tmuAXUDGLEY3SGsPWK2WEUtw/AdMO4MzZu3dur
X-Gm-Gg: Acq92OENO2D9qX7oM01EBvAtznEmde2P405Uu2wFieYw4/yhx26R/EoPvs5aVdcwd/r
	JsPH15X0cSSvKSrF+orEkJppE+QhYx0VA1OLxeojCp23jaKRwY/BqHA6BWULrCsD2kYo1XK0goU
	66HgQujn2CpSp7Q9zvgFWUAPFN4v6hO65foeS7l9R6lRRc/ttDEJn0uO50Qp1T1+eaW7RDWEWTt
	VBInua76FjJn2dIzcwve7I6gMl4RM674DZDDvlQIKOmOpypVZPj/blMV9SunN2i7YMOsDsleG2/
	/hMvvY2PCxaEj6ItiWpjFHmP/NgsbKh1DhPbT/xupxPyU4I1awKLXOEJA4EFyAc0gRtPd21WISV
	jiyhaJPDGKjaJOYR9vA4aetTHQUt14PNT
X-Received: by 2002:a17:903:2ec5:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2bd9061d6bbmr254826035ad.34.1779294347166;
        Wed, 20 May 2026 09:25:47 -0700 (PDT)
X-Received: by 2002:a17:903:2ec5:b0:2bd:9061:d544 with SMTP id d9443c01a7336-2bd9061d6bbmr254825715ad.34.1779294346670;
        Wed, 20 May 2026 09:25:46 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c26355csm226190895ad.35.2026.05.20.09.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:46 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 16/16] drm/msm/a6xx: Allow IFPC with perfcntr stream
Date: Wed, 20 May 2026 09:24:03 -0700
Message-ID: <20260520162454.18391-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
References: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0de08b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=5obZvuzjGUYrwyXX1KsA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: CpnuptUbq0TOi1YmaVskiMBWbHb2oojI
X-Proofpoint-GUID: CpnuptUbq0TOi1YmaVskiMBWbHb2oojI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfXwMKEwxi9Kvmk
 ymqRGpEoAfOUt/hSUn6butRYd++uLO2GGDi+1DtgvIG7xxcfBETNM1ZIxVUMGjdJcRyun8AYb8i
 /jNqckAG7VEtmbEatECx4uIb1dTQJKYTUudEjMYyDTnUGTtznu5kPKkYIPhxQwqv8KCUjl2Rq6Z
 rTfRAE3320quREMk2D2TeRiOG7KU59knCfaV5a44dBMouEfjS6jabOpyKkZlhrs8Pjk9ZzT79vD
 W8gvoqJd3AiexM4dDtq+3O0YdYT/MrtXZ2syGlOeU4E4kAQDZcMRVe9O8MT2LIi0sfB5E+xXyfC
 3hF6dwbTlsFmF79BMGlKn/NJ3/RjL5ZY40evvqUwiHQvUy0Y4WWOcuE6IEiT69gDo7D2A3xWco0
 tlRxzz8P4vJjrOCWcFxl9AvHyi2VZl/TvHwbkwWN+iFDQmmf/iLTZNV20Ood/N1wZ4CxI+gfqtm
 48Ph886AcCkeH9sXGqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200159
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-108852-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E8EFD59207D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that the dynamic pwrup reglist has SEL reg values to restore
appended, so that SEL regs are restored on IFPC exit, we can stop
completely disabling IFPC while global counter sampling is active.

To accomplish this, we re-use sysprof_setup() with a force_on param
to inhibit IFPC specifically while the counter regs are being read,
while leaving IFPC enabled the rest of the time.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h         | 10 ++--------
 drivers/gpu/drm/msm/msm_perfcntr.c    |  8 ++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  2 +-
 5 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index aba08fb76249..0a7d49a2c877 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -2034,9 +2034,9 @@ static int a6xx_gmu_get_irq(struct a6xx_gmu *gmu, struct platform_device *pdev,
 	return irq;
 }
 
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu)
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on)
 {
-	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu);
+	bool sysprof = msm_gpu_sysprof_no_ifpc(gpu) || force_on;
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index f3cc9478b079..eecc71843bed 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -280,7 +280,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu);
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index cb74b7606987..e3b5fab6f68f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -93,7 +93,7 @@ struct msm_gpu_funcs {
 	 * for cmdstream that is buffered in this FIFO upstream of the CP fw.
 	 */
 	bool (*progress)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
-	void (*sysprof_setup)(struct msm_gpu *gpu);
+	void (*sysprof_setup)(struct msm_gpu *gpu, bool force_on);
 
 	/* Configure perfcntr SELect regs: */
 	void (*perfcntr_configure)(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
@@ -378,13 +378,7 @@ msm_gpu_sysprof_no_perfcntr_zap(struct msm_gpu *gpu)
 static inline bool
 msm_gpu_sysprof_no_ifpc(struct msm_gpu *gpu)
 {
-	/*
-	 * For now, this is the same condition as disabling perfcntr clears
-	 * on context switch.  But once kernel perfcntr IFPC support is in
-	 * place, we will only need to disable IFPC for legacy userspace
-	 * setting SYSPROF param.
-	 */
-	return msm_gpu_sysprof_no_perfcntr_zap(gpu);
+	return refcount_read(&gpu->sysprof_active) > 1;
 }
 
 /*
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.c b/drivers/gpu/drm/msm/msm_perfcntr.c
index 85ee784e3851..b29f4664db87 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -256,6 +256,10 @@ sample_worker(struct kthread_work *work)
 		return;
 	}
 
+	/* Inhibit IFPC while accessing registers: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, true);
+
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
 
@@ -290,6 +294,10 @@ sample_worker(struct kthread_work *work)
 		}
 	}
 
+	/* Re-enable IFPC: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, false);
+
 	smp_store_release(&stream->fifo.head, head);
 	wake_up_all(&stream->poll_wq);
 }
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index a58fe41602c6..1a5a77b28016 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -42,7 +42,7 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 
 	/* Some gpu families require additional setup for sysprof */
 	if (gpu->funcs->sysprof_setup)
-		gpu->funcs->sysprof_setup(gpu);
+		gpu->funcs->sysprof_setup(gpu, false);
 
 	ctx->sysprof = sysprof;
 
-- 
2.54.0


