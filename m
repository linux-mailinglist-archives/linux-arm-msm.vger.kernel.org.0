Return-Path: <linux-arm-msm+bounces-109875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHWnHu64FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:14:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEF65D8767
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DBCDA311316C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71296403E89;
	Tue, 26 May 2026 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="huMLx3Dv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M+S7nlzA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D8E40F8F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807271; cv=none; b=eUeXRWWeOwmJQednWnEaljDEIfMu3NhlqGLP2ILga2+HQnJlTiKMYqCopOHlaXNR6DLUkFZqM6ucQbPmIXCOwSP7jtyqE1z4QdXakMU57gaDdO6Bwnt39vOqNQ1z8yz2BbIpoXM8FuEXWE+PKlosiuVZNoabFz0iwJITywoGXho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807271; c=relaxed/simple;
	bh=hyrFkFzkzD+MUxTw7yo4GiZmyqLvABtBfs/PeL1NUYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b5ceCegPHBOECxAi/0BNMKCN1NSOhgpENJow11+NaWDoeLwh0SbTYwdEQx48fLuDkAHEOjnVKym9wwnLY46xc2xB2nhmG2Rww0aUt65daHbHoew3V+zy8sjchMz/VK3o0wANWuyhjqP+fex/e7/UDj2jb9IFd2AumMEG82vkd24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=huMLx3Dv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M+S7nlzA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QDi05p2528542
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wsfd0typLWI
	CJGnKJ2SYwAC6QidCQBdD4Z53MfilGF8=; b=huMLx3Dv/JfyKtd1s0iBRg7B9El
	ThDXQBfy3CQpvyDsTb49KVDFBlA7psdYfBaFbTp1NYCgFzjd3K/DVHZVRwe7CgnR
	NObX6Lh6Y1uINoGZF0SjTXc11OzKzHqv+UJ2ONe1TRLBSstifAGxLkKQJCuJd3aW
	udReUFGxDRJFhja8D7wYS2Rni84kcOhKKuo8Otl5Yy4vtn/tZ6YAHwbuCTbHJqVo
	r6freYCvgbUUs+jbnXZbgniQRQASvyaayXCjayxJEibo4j1OejRYuPcQdzqPL5Kp
	wgDw4/403UsgV8PNlPiY3PRuO5vFWA3qjawjK9U2hTCNrRqaifyxoksaBOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnrajm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36629e48023so10232932a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807267; x=1780412067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wsfd0typLWICJGnKJ2SYwAC6QidCQBdD4Z53MfilGF8=;
        b=M+S7nlzAcx9rbvMX9q32pzXQLQpL3fFXjrQsaHl/UYD+QDzddelq28TnZvPxEBtiTv
         UG79B/vdpW1x3skJV8NiRB98tMPpxzzuXiwlR37IBoN80VoCp7ICisZZeLxgd/CNWUXF
         sJ3TOJfUMiX4KRRRh8L9Kmz/5W/FzOsEjB5fs1CD2YTNqD3I4YlMwrq2X7x/bPV3j/zJ
         52OFqgvY25WgHbgyd7LNOuMaxehfJ7mAECzSBx4ylDhBUMd1i6+BNTmwsRVhb1V5nzn/
         T7jFoeKIvGTWFYrCpmlqbDnbRCJod85dKSj9ELuYqai0QDFymkR/wLO0FPHvqOI6bOny
         RwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807267; x=1780412067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wsfd0typLWICJGnKJ2SYwAC6QidCQBdD4Z53MfilGF8=;
        b=OrcdTdSJH1wfP5dgwR5yITZU9us5NEvQB7dOfaLABGRw4yukEPNCP0019vUE62Z6HR
         OaV8ZOK/gaDeUW0T+ZRBdXpN8pCUASWAfmQ9tz3EN63Ls66XbHXlhBMh3Ea8aP9jw5DY
         aC0n4PwETvBcvMaJc+qzBPRrQ8s7dEJnNhLTsqvo76udoPDQs40SFguo04uRgl8IuKTJ
         wH8KemjZNW0g5gQW0nvt7P1aYfc2v0uBprXaKcFUmVWKyeexPUUv30vVTe7VjmOQC64d
         JwfjI8Dr2FmkE2TwELnvkOwQrMPWN1lo5KLP8Bz7EgkNmNvBh8IYxAja8zelAUm5sRPq
         g7Aw==
X-Gm-Message-State: AOJu0Yw5jGyY8dZjRpWATGFXPSUs9ooeJLsOjZV5jhapxG/qt03hEyTB
	KtS8QV24G0+dAtK5qUeNXvn3zu2PIuCUBL6US9oHHdbb8g40MpKiug0wGjOKwcDH6l+5s3VXjN5
	nk7hubdHgWKdslUSRYF6QQoBHWSeFpJRsbhOb4TBSGewprpEShVRpH46raECAQ167Spme
X-Gm-Gg: Acq92OFiGaWjAdF426oijSgmyagjpQD5W3BW5N3EZnzG+eYNElYWTMUuz52BHAgPzBZ
	/ZWbirSZr5M/p/rrMKNpGMpku6kH227+gURd8RQvnLOkK3w7xaZp8o3LCm0gA5QQfWiYT9PTLQD
	wB+NsB/PyfdFcCycvj5yjg3ohfbEQi17uQ4unOtpezrYau8WLJRNbK0Yo0sfjbVamNjdqVUa1gZ
	Bq9iXeRRNC747yW3UlI5pYii6SgoPl0LVNA8fDQaSBBUuHS7Xk50X3Sze2vfPflAVKLf3EXQU1l
	KS9NtrrTxgTeeSPwJuuynerlWQAUCXBog7dXeFiySv6kFBgpoiMLSdYUUg228AouBlWkjyQ8y+7
	2GLFRwfDEwakGH4XZYP8h4HuHF+wG59JU
X-Received: by 2002:a17:90b:5208:b0:35d:a5cb:95c1 with SMTP id 98e67ed59e1d1-36a676287b9mr18465101a91.23.1779807267158;
        Tue, 26 May 2026 07:54:27 -0700 (PDT)
X-Received: by 2002:a17:90b:5208:b0:35d:a5cb:95c1 with SMTP id 98e67ed59e1d1-36a676287b9mr18465049a91.23.1779807266534;
        Tue, 26 May 2026 07:54:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b09698b0asm969355a91.3.2026.05.26.07.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:54:26 -0700 (PDT)
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
Subject: [PATCH v10 16/16] drm/msm/a6xx: Allow IFPC with perfcntr stream
Date: Tue, 26 May 2026 07:50:50 -0700
Message-ID: <20260526145137.160554-17-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
References: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9Pv0DsXOrBjb-Uvbld7YJocOpOovxH-k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfXznqgm9lUnO8/
 +GbR1dCkP1quG+utoSxbIkcOlw+SUqVupgltvLcA2cyBbzhdhRXcIT+L4jYV1z943SLrnPumwCp
 pUwrp+qP8NdK+YdCmjeP5SMlsMb3DrGt2hpj3b+eJfuQ/nGqCN2P1HRRqmb7U/2VbbwmMU0UoAC
 hx/DJ0u0RdASBr8FCZuols2dBzl0CVLkAgM3U/HEfM6DBHZohJKkfLWODsTiWpejT1zmkHjbcW2
 MtMn6g7e8VKVXBWsVoKkIxB/2VYC0KhaokYHftrWvmwHDKATKnJPGpsBVqWZeVy26+khqoxETvb
 Uo/9HZD5gkRnWNzZ5C+1MvH5R15Bnem7ZNfkT8GerxmMBR3FaqZhQuOtv6eKhm4o2htGpSX0blz
 yc8QA05/1tq1fSGXLf8KNRqZNxhfBhtyVn+ZBslb4ntwPEL7hUx2bNK+mq9zUDNIUB6WB3TsE8Q
 68YSY+UA3ZChQQZNbzw==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15b424 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=5obZvuzjGUYrwyXX1KsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 9Pv0DsXOrBjb-Uvbld7YJocOpOovxH-k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260127
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109875-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AEEF65D8767
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
index b72fb58bf223..f60a0801a62d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -281,7 +281,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
 int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 int a6xx_gmu_wrapper_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
 void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
-void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu);
+void a6xx_gmu_sysprof_setup(struct msm_gpu *gpu, bool force_on);
 
 void a6xx_preempt_init(struct msm_gpu *gpu);
 void a6xx_preempt_hw_init(struct msm_gpu *gpu);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 22cbafe75a07..3d8f1ea5335b 100644
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
index 0a6f8039f610..ce65b1160955 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.c
+++ b/drivers/gpu/drm/msm/msm_perfcntr.c
@@ -258,6 +258,10 @@ sample_worker(struct kthread_work *work)
 		return;
 	}
 
+	/* Inhibit IFPC while accessing registers: */
+	if (gpu->funcs->sysprof_setup)
+		gpu->funcs->sysprof_setup(gpu, true);
+
 	if (gpu->funcs->perfcntr_flush)
 		gpu->funcs->perfcntr_flush(gpu);
 
@@ -292,6 +296,10 @@ sample_worker(struct kthread_work *work)
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


