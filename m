Return-Path: <linux-arm-msm+bounces-109380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LNYMgqWEGqBZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109380-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:44:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C525B8784
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E9A7300EF5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634B036A350;
	Fri, 22 May 2026 17:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o0WE89Y0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFJrWHZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A98136729C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471295; cv=none; b=R1ga5hh0+mQWRIyMt+gC5BjLrwCVDF7cnE5HF5csVtgk0WFE5PoLKbljVhrm2Bu3kMWTv50ElC0faEPzY1exgakd0/JxwefHa7K0W0s32Qja0Vty+M2T6nU1YFQMxIwsyaOezz9SsAy5k/X5VCaN/rNeJhB3q6M5yAJB27TtH7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471295; c=relaxed/simple;
	bh=PkYlRSO+4GwvY9gWtu6YygmtEO/xzsMNSk3exUbtg6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ixbjOwBifDMIEKnu61D0bzFR2rAc0MxeCA7p4S3TAgnUfGSq0Zryf2dbFPgCA6vJ9QOWN3RjXk9Sy3vmzzmKJPl4gT19Zoa0ja0QVC4NSywKXlOk8zUePbAA4OTONUKvucKMA6b/pJjGNkJwAErSNhPJploDTAWmZuwTzymVs6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o0WE89Y0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFJrWHZW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MHJtGH1800725
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=haIOTU+oqzF
	6UOOcaNNvH3Tb0Jkuoae2P6GBfreAHDE=; b=o0WE89Y0N4cXWwG9+egXbmEMtfz
	5cnR4nzOmy0nwcHrqQIz62kAV8JCIZGZq4kfoDVReFhzR5G8M+Px0H3zAcQK90ps
	OYOgaOfR39c9ZDf5rQZhiA5Hsc4+1gdyIH42ZXkVVVaz58DmjhqIzNqvTPP9maFT
	JN6VucUKtBjaf5MnsfhnPSPszW2/tmGhx8K3nnz3lW9eLyurX6L8+M6swG2hcTC2
	nD7lbXg9v5YPBUJ3xkbmKBBxzS/F4jR9sjrP6wQ3seSqgRFokEgQhOLVESUBXiAm
	/xpkAmtYQ0ZbgCslJAqOMPERJZPcWrKdMLZpsQbhRHNdDhMjzkJ/yOjLInw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean9g1q6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3663cbff31cso18106670a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471291; x=1780076091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haIOTU+oqzF6UOOcaNNvH3Tb0Jkuoae2P6GBfreAHDE=;
        b=EFJrWHZW8vnc+6A9w+egr1hFtthpJTFoHm2cHq7jnK4hb7KduAd1DtYtdyaqNxGPsW
         /uCKRzRs4cG+ah72qSlZzoLpDQR2ddNmXL16lVU91gHuUCoL3UZ4uymnEH4MJA2jdf1f
         1m5U5JA72uoLAOSAXK0xPKKyUZjoQI05B+O1RndWq60ZzOL4SBYWMHXdmlcMVdaen7lN
         JSdJ7M3eDqf1MV6/5i+PBg9BhDF76TYL+8hajCAry5CYo/wPAjNTBZEdA6hJtL9nIaGM
         pknK+2gf6ui1N7D6pHnzS/euC6nXz426WDNwqu/pMGWHtWB9j9UJWcrqLgLRIvE2ue68
         UmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471291; x=1780076091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=haIOTU+oqzF6UOOcaNNvH3Tb0Jkuoae2P6GBfreAHDE=;
        b=cjLZyCncTJvNoEOLwizUW2IJV3Gd+PMSCJzyFyL7+S8MinNA6iwdw4t2U7ky/4x9BA
         Qnpper993F3A0UzZ9TG3pSdzKwvPcdlSiC4r1bRSkP93Tzh5t6Sfwt2WOKu9NJLiz8m1
         DIUoNErfGrJKtMy4O1+gOWAEt55LbJWeb/o3FV+IcOZEIAR5egP6g1miqHZWWh58tpYj
         OPkG5YetBgHmIsUuRh7/tW0nOz9KPslOvWzBdD+eXxQZDa6pnNTLY4eAtnQ4nJrNImfo
         umi0Hdv8etAr3bfnYinvYk+jY90lFI60WG6h577pJ9jYKAxSz+0Tn4dV1LpqhNmWI1A5
         Gv7g==
X-Gm-Message-State: AOJu0YwjdPeEmg9OFdNzBrARVDdEEe5+jT3zO2+3aD1m/rFrOdu6Fgly
	lMfnBZIWuxN2xLj2Lfwo4zyVPv2n53C83hcROT/9nKWfoqMMKM83sCWIne7zrzglJz73Q+JcsQI
	JSkN1lj6S1ZNN8FiQFGcEkR7Xw1fitG1vylwFmRYL8iogI1Gpn8+tFExmbHRrWvo/przF
X-Gm-Gg: Acq92OFqUFF0LZ0IwKepB9Z2Nnq0uDJiBSo1l+DLAMKdlZFHgScYMgTuzlc5afBHDr2
	uz1brDDnEgSxFYZ7m7AjDLpZDW9uT5AX3oGKSntBCaLp9NwHeEpr/czeqKqNvKPdE8BXS5RG1D1
	1L9imhJJSJPVO3R7IuofKizSyU6SUKfwsEVJCXfEMuHOqYek/J2AwXGrS88EVurJgZM36wDkVRK
	NebLPYy2sOJvpHTd8wED8DIXYzFT0ZKX+PQR91jLi5Pw86EM4XV/1I/l3F178ygHDu4HcioZfvo
	0wziAnbBP5/iwEhAtY4EpQ8cx5njjq5E333CmIGtTCr8wUbSQCam27MHrcLiEaf2unysRRfUUeW
	8qcEfiJTO2/P9Jdro0rzZC/saOOIZxiVRYFXNIeZk2qM=
X-Received: by 2002:a17:90b:1b07:b0:369:69f8:ad6b with SMTP id 98e67ed59e1d1-36a674bb035mr4847399a91.0.1779471290745;
        Fri, 22 May 2026 10:34:50 -0700 (PDT)
X-Received: by 2002:a17:90b:1b07:b0:369:69f8:ad6b with SMTP id 98e67ed59e1d1-36a674bb035mr4847370a91.0.1779471290306;
        Fri, 22 May 2026 10:34:50 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7263179bsm2495948a91.1.2026.05.22.10.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:34:49 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 08/16] drm/msm/a6xx: Add yield & flush helper
Date: Fri, 22 May 2026 10:32:54 -0700
Message-ID: <20260522173349.55491-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
References: <20260522173349.55491-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _d6ETOX6UPHFZD-oZMC_7LaJPF0KZ8Vg
X-Authority-Analysis: v=2.4 cv=B/qJFutM c=1 sm=1 tr=0 ts=6a1093bb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=7a4_7rcHm0II5uOVc2AA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: _d6ETOX6UPHFZD-oZMC_7LaJPF0KZ8Vg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfX3ii0E2ztzY6a
 kfTgbWyeLsBrq5RBErNzohFxAu8QjrFyPZWgh2Otxw2WIeMu/6fCpvO8bvzU/r34gabkYQC49hy
 +SmyBSLUMBwhCnCKT4C7d82Kv6o/HkF5mPSft2EQJtH8d/cJ2NJ6HfCZcqxw4C8AjiwlEuy+m4S
 W3nyXG43c2g4SsTRFsu25xiT2XQT88hE8Xjo29BN8sSLaOp4ziuZbbO0ve/FTVgIVIrMv6MVdKG
 4bNtuFwM8z6hbg7faD3PoEXk1KtWhNTnWkckwcJkp9/6yPJ8Arvl5dzqRxmJIY4rMTBzRJDVZHR
 glQ6hYcuCLW/zeI/jx2CVCB2TZDBOM4/kvhwEHfpoeIeRIYJIXeffLdaRyoQtYFkqB/RHW2I2ok
 aqagy4nQiJkjXb9YbsB7oik3bywH9p6X1DKZ/1yYqfYCMobAw+GrdxHz9QafkSMiXPmmBGEYXN5
 keNcaBXDfrnIybX+krA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109380-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.985];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 26C525B8784
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It's a common pattern, needing to insert a yield packet before flushing
the rb.  And we'll need this once again for configuring perfcntr SEL
regs.  So add a helper.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 55 +++++++++++++--------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 10 +----
 3 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 71f54ab5425d..415902f6e5d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -189,6 +189,30 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	spin_unlock_irqrestore(&ring->preempt_lock, flags);
 }
 
+void
+a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+{
+	/* If preemption is enabled */
+	if (gpu->nr_rings > 1) {
+		/* Yield the floor on command completion */
+		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
+
+		/*
+		 * If dword[2:1] are non zero, they specify an address for
+		 * the CP to write the value of dword[3] to on preemption
+		 * complete. Write 0 to skip the write
+		 */
+		OUT_RING(ring, 0x00);
+		OUT_RING(ring, 0x00);
+		/* Data value - not used if the address above is 0 */
+		OUT_RING(ring, 0x01);
+		/* generate interrupt on preemption completion */
+		OUT_RING(ring, 0x00);
+	}
+
+	a6xx_flush(gpu, ring);
+}
+
 static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
 		u64 iova)
 {
@@ -597,28 +621,9 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
 	OUT_PKT7(ring, CP_SET_MARKER, 1);
 	OUT_RING(ring, 0x100); /* IFPC enable */
 
-	/* If preemption is enabled */
-	if (gpu->nr_rings > 1) {
-		/* Yield the floor on command completion */
-		OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
-
-		/*
-		 * If dword[2:1] are non zero, they specify an address for
-		 * the CP to write the value of dword[3] to on preemption
-		 * complete. Write 0 to skip the write
-		 */
-		OUT_RING(ring, 0x00);
-		OUT_RING(ring, 0x00);
-		/* Data value - not used if the address above is 0 */
-		OUT_RING(ring, 0x01);
-		/* generate interrupt on preemption completion */
-		OUT_RING(ring, 0x00);
-	}
-
-
 	trace_msm_gpu_submit_flush(submit, adreno_gpu->funcs->get_timestamp(gpu));
 
-	a6xx_flush(gpu, ring);
+	a6xx_flush_yield(gpu, ring);
 
 	/* Check to see if we need to start preemption */
 	if (adreno_is_a8xx(adreno_gpu))
@@ -958,15 +963,7 @@ static int a7xx_preempt_start(struct msm_gpu *gpu)
 
 	a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
 
-	/* Yield the floor on command completion */
-	OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	/* Generate interrupt on preemption completion */
-	OUT_RING(ring, 0x00);
-
-	a6xx_flush(gpu, ring);
+	a6xx_flush_yield(gpu, ring);
 
 	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index eb431e5e00b1..99c3e55f5ca8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -317,6 +317,7 @@ void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_
 void a6xx_gpu_sw_reset(struct msm_gpu *gpu, bool assert);
 int a6xx_fenced_write(struct a6xx_gpu *gpu, u32 offset, u64 value, u32 mask, bool is_64b);
 void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
 int a6xx_zap_shader_init(struct msm_gpu *gpu);
 
 void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index e022c9a162a4..124d315b2469 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -488,15 +488,7 @@ static int a8xx_preempt_start(struct msm_gpu *gpu)
 
 	a6xx_emit_set_pseudo_reg(ring, a6xx_gpu, NULL);
 
-	/* Yield the floor on command completion */
-	OUT_PKT7(ring, CP_CONTEXT_SWITCH_YIELD, 4);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	OUT_RING(ring, 0x00);
-	/* Generate interrupt on preemption completion */
-	OUT_RING(ring, 0x00);
-
-	a6xx_flush(gpu, ring);
+	a6xx_flush_yield(gpu, ring);
 
 	return a8xx_idle(gpu, ring) ? 0 : -EINVAL;
 }
-- 
2.54.0


