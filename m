Return-Path: <linux-arm-msm+bounces-106166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBh0FZN2+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0184DEB24
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 64C49300AB34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936C04A1382;
	Wed,  6 May 2026 17:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLE1UR0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INh2dUWQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27004A33FF
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087542; cv=none; b=nJcdlf91N5/lM2YGGuh9PfIGe4ymdeaJX3gZkzsx2WxvJ7m1GIbLO10yaMGAw+y0kBSBOTjtnT13j6W+Gy6hhksWDBgB2KhWcVPMLG13/gau5he7zYtxNX3lsH4qFc7/sWf2ZOB+UtpbuiLQAiSy6qmbOnRsGfDGNT0eDfIzhBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087542; c=relaxed/simple;
	bh=CjOeIMd7KHhgBlYgalqgDMr3CrElSHV/LHeYqaaaD9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dh4t1LCv2AVebSPXmUfBVSPsiramewjvfXrOCBdXOj17gTN6wh6wuLgUOiUFSUsX12wXHnGg2GBXvJiFiEZiaR2ctNALen4Oo6KGOKjk3nPcZFa7VvmvAYFgvLAyzSXiLwQZTGtF5WiNaVDfCHqbH3cKbzeDboo63GMKwINlIx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLE1UR0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INh2dUWQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646DK6U2529408
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zVhhihIWGcW
	DVKhVXioxlxo4w1o6vj94DNJvO2XJTbI=; b=XLE1UR0U1ox71RUTqMrXdR/MhJg
	MZKzPeWb2r+lC0pPE4ZqOq88oZnQLzqp6s9N3H/2P3tT20cyBeMNmpx/Zo3BoZi4
	1pDscUvTDAvXyvH1oGdFT6q4HgTVjYjJyqyU+RDWRcy3RFrB5yb5R/k3O2trb9mB
	4KKzMbOQonKFRZa2RF/rETtnG/hgFhjWfVsAOQ7nGOvTn2Z4zcZJGYD+TEKPUh9b
	I5UfYvfyJBA2lGYt86QDxdLa7bXpmE50w+bpEsikcWKG2cWmr633WrM7P3w5Y0mE
	Mj3PrxTqwii/pip22vyUOvl1HrJnym8QWgbc4r46vTi4Xp1XTwlzA4Jymdg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e015xac37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:12:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2d83e7461so121986435ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087529; x=1778692329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVhhihIWGcWDVKhVXioxlxo4w1o6vj94DNJvO2XJTbI=;
        b=INh2dUWQVixGkW/5ARXv9REKyrTUzm8LDwpYrHr3jT891v/KMFGtgDd0abKghOVYDT
         eF95Y/RcRJe3+DjJ/bj4H2B0x1/E2bBBnfDTvTVXGwW4607NK7OSxPeG5z79sJ9oFR8L
         /bEvTd8gpLd86+QIsQ26jaJhNUM4a/goJOkwnCc4Gz6748M3FBhCwexc3fHzFMMMQXfk
         s+T/XPR5fRXfHsGkAGL2Sip3NZ4UGDfLJKNK1K94tNcSoiBEZkPrb1PNfYvvQ5Plqpe9
         VZQCp8bZuH7OddvTLAdR7UoIG15jgJ2lPG4pVXnGYezcmtsJ6tVUx5WrSDsFafEY3SP7
         Nmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087529; x=1778692329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zVhhihIWGcWDVKhVXioxlxo4w1o6vj94DNJvO2XJTbI=;
        b=SQmsg6xT7jaHi+PL5d0q85CFqYMLtHE4m9RJgkhG6aqssI2lEjKfyFmY2VAyVe1eXU
         zDc+EymEs2YuXoWRoyj0g33H9+EETlpbv+zv+bNtCx1Sav6YTEY0PJ3eeWn3Y6E+BMh7
         +CRHHGc0I8gHO9lqye+s3MdjRUeYCw+iL8KI/2IbBfMTJxnnGuJEyXTVbPYJ0hcVO4aa
         g8wFdRoQOGm6tAgw9dUiTT7CMRIr/UCmaB7/7J6CeEhBF9AjflIMowaWJup+r7+Ms9y1
         0Rml9NkBRK5hJlTK5nkAfdYANGWTpgBcbWahV7pDrHnePnAXtTRvXcgpeKkGdWAw+k6S
         +BiA==
X-Gm-Message-State: AOJu0Yw06W1JbiacUsEFxccQTWPHvl/MRiHCRQiTLvXxyefdNUPCzUvs
	jrteXU5jDHb7FDTF/0EIRVTrWhb4KzeGlsWqoxtAbdtNI2xvfC2hJWmuG8F/+nXyQ5fEjtrtbhQ
	Dq4AFvKNT1TsHkpipqrMM1/VPSM46X8iDWHkJNlpcqoWnONVhfp9eabMZof701/URGoO8
X-Gm-Gg: AeBDiesOYh02RA04rxP5BskjYcf+sL2BbkFsTTk+DTb3x2mJw2ah9AY+78EdpzdIN3x
	LJ1SUwVefoXu4f3W1zCqVY6QRIvzzVyAMuoJIcBJc5GSsSMCejYGaRXjNWvhJDzJZPg2ybDOwtC
	RHJoZSfJI+ARa1EPNQOLM/YfU0dCkEjIAWb3BGuURpwBavOmKUqj9u3CzrbSTDQrm5yVviv0xil
	pgynNYpxuYbi1VmNlf/P+GwOGz2rgZvBQDrM6+pxEvh1lYJ5NU0HFZgKxf3hGSH9epq1Mrd/ZFM
	j637591lyDqIsi+iBzJS4kpRPoElqEAi7HK2Z+4+0shBG4BzS3raSQZtDqkW9oxaSIvGd038hln
	LP1FW7eIHKZaLlXtnmfmWZ/I0oBXcBOwT2wy+4H3a2eI=
X-Received: by 2002:a17:903:4304:b0:2b2:6b58:9317 with SMTP id d9443c01a7336-2ba799d6c69mr27041845ad.39.1778087529517;
        Wed, 06 May 2026 10:12:09 -0700 (PDT)
X-Received: by 2002:a17:903:4304:b0:2b2:6b58:9317 with SMTP id d9443c01a7336-2ba799d6c69mr27041615ad.39.1778087528813;
        Wed, 06 May 2026 10:12:08 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7ca105desm32185495ad.55.2026.05.06.10.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:12:08 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 12/16] drm/msm/a8xx: Add perfcntr flush sequence
Date: Wed,  6 May 2026 10:10:36 -0700
Message-ID: <20260506171127.133572-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
References: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Os1/DS/t c=1 sm=1 tr=0 ts=69fb766a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=W-43u8CF5Pkpiqpb4b0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: SUhPqNWeLHNadBH9RlZVDWoGGtZcMm8e
X-Proofpoint-ORIG-GUID: SUhPqNWeLHNadBH9RlZVDWoGGtZcMm8e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX0lAR5DNhuDqA
 FTXdiRjh8pzyHvmfEzyOn/zkhnbSTq9alYLU7BSjf0sAocMUwNbEHl+4tiF2WhLwhE5jrP3qpyQ
 GUhYOqk7OgSOfFLFyKL0MiGqlzcciATkRhVdOc6uYyhNZ7zFNRIFJUDJbEqcXE1UCyzbswwyI8Q
 wAq+PWtkQT8qOlLDTQ2s7oF8jFAKSaacHIPqrNQHRh3NE0I4K+gLsHqQoA6ULPhGQGUN2tGZZE2
 6KJyWJwF/FA/33QiXR+tdkbAiOpopj7fY2fGeajPCFomksedqtzal2gOSVxzPl4jKm/YcEXA2Jt
 2lbbYKBn6GgKt1Ki2Z6WMCMSyvZ5g3/f2LD7Oi0UWjKIU5QKlv0FigX7aVfXCRUr7yfJ9It5ap/
 6ijfSpwePFU2dcGlc+FtvnWn1eAahxI65jTJZezBY/PQZ2M6MH/o+9LjDzv0K/Ab27k7s2iZSp/
 U4BBTsDj4gpIPwlfysw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168
X-Rspamd-Queue-Id: EA0184DEB24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106166-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

With the slice architecture, we need to flush the slice and unslice
counters to perf RAM before reading counters.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  1 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 20 ++++++++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 30df9bfa9ef8..a329d20033d7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2921,6 +2921,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.progress = a8xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
 		.perfcntr_configure = a6xx_perfcntr_configure,
+		.perfcntr_flush = a8xx_perfcntr_flush,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a8xx_gmu_get_timestamp,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 99c3e55f5ca8..3491a24a9320 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -334,5 +334,6 @@ void a8xx_preempt_hw_init(struct msm_gpu *gpu);
 void a8xx_preempt_trigger(struct msm_gpu *gpu);
 void a8xx_preempt_irq(struct msm_gpu *gpu);
 bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+void a8xx_perfcntr_flush(struct msm_gpu *gpu);
 void a8xx_recover(struct msm_gpu *gpu);
 #endif /* __A6XX_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 124d315b2469..6c040f718176 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -1345,3 +1345,23 @@ bool a8xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	return true;
 }
+
+void a8xx_perfcntr_flush(struct msm_gpu *gpu)
+{
+	u32 val;
+
+	/*
+	 * Flush delta counters (both perf counters and pipe stats) present in
+	 * RBBM_S and RBBM_US to perf RAM logic to get the latest data.
+	 */
+	gpu_write(gpu, REG_A8XX_RBBM_PERFCTR_FLUSH_HOST_CMD, BIT(0));
+	gpu_write(gpu, REG_A8XX_RBBM_SLICE_PERFCTR_FLUSH_HOST_CMD, BIT(0));
+
+	/* Ensure all writes are posted before polling status register */
+	wmb();
+
+	if (gpu_poll_timeout(gpu, REG_A8XX_RBBM_PERFCTR_FLUSH_HOST_STATUS, val,
+			     val & BIT(0), 100, 100 * 1000)) {
+		dev_err(&gpu->pdev->dev, "Perfcounter flush timed out: status=0x%08x\n", val);
+	}
+}
-- 
2.54.0


