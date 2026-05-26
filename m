Return-Path: <linux-arm-msm+bounces-109865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIxSHBy9FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:32:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4F95D8CBB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE83A31AF6F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A43406297;
	Tue, 26 May 2026 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KSWXJ4sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eN7qjLK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EE2400E0D
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807256; cv=none; b=gUdGFokABays4aKNd2k5G+xChy/h9bfAtRRcWGMN7JFW2H7LATgInS97tHh9I3dUuaxzWu0qM5Wi6xcTLAO0qxdpu4/3UvW5pZ7tCMPtVRa0tXLiiiWKO4zOIs22Zhg2Bgeom0Wc3GcN5nkHDVDhFz8WgELN4W0iO4RwLcRjhH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807256; c=relaxed/simple;
	bh=PkYlRSO+4GwvY9gWtu6YygmtEO/xzsMNSk3exUbtg6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIBXrhr/OeFbwMvmWiUd6vMYADt/r3oQUq78dR15HZT+4PxceivZ6oRlqhl+dku7pNBOc6RDOgJoJwgwT9Hu0hmkclRpdqJP4SuG9X8sQQaLSdnM6aRRbErDxRRiTtfqdvFrtAfneoHC4rBAxD7l2S7TWl2feMeBf+jPCOchwcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KSWXJ4sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eN7qjLK8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QD40Su3693580
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=haIOTU+oqzF
	6UOOcaNNvH3Tb0Jkuoae2P6GBfreAHDE=; b=KSWXJ4snS0k7eaYIpdVP6XB5phT
	q+3aGXOfv0IH4DtmD30TJ5nmcmXLsKp+DAzdIJgKQX7a89a27Pm9QvVyNCSEceo7
	mIpknnpjPYPat+mfvhhCrBGcIKDYeQ00Ho+M8kBMrGmC7VE7oxW0dEOSp1MLvJRk
	MbH9GNBQhH7qs9Llgu544ffOQXr9zyxQZ2ZSabYXCBAYVKWj/62sHU6CXG27MCQI
	8ZJT4T8xkjV7qabkDYHL0ajjsodLcv7FJHtxTyD5+NRfazSUn6pbpQWC0ukEEXH/
	09CZm3JqR7IDQ2bagyFa+CUCaJNy3dxVwKWPTBOSLt6fYVHnxn6nJsrniyg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2ygjyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:13 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2be9e0905a9so69633005ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807253; x=1780412053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haIOTU+oqzF6UOOcaNNvH3Tb0Jkuoae2P6GBfreAHDE=;
        b=eN7qjLK8kV4U4mfqmI0crlz4I+K7BMq2f0BN9GvsoAg2p44RuHWgSDrMvsbskQZPb8
         gKa0zvOef8AaLq9/Ydv+psQjn3625j0OzojNsiuxv98NgooPKzDNhB35xejDzFb6bv7k
         ji2AxZH2ObSpKSR6+TA8TXvvPm8h9iwBTSwu6MNP3kj+z3gEjfAQ50+P5vtEvaLs5K93
         OLCETBbip1myllQP2cMdEYOO6fyqrCEzbCBspTToydgqG22SMNPoKqlalMJuwz1uBw1f
         1UuUEnZ9heXwBiFPH72ssqjdHWKZfFz/cCxu5SmsZXFcK1oOWNRRYGKakC/q9+3v9iao
         s+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807253; x=1780412053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=haIOTU+oqzF6UOOcaNNvH3Tb0Jkuoae2P6GBfreAHDE=;
        b=Vss0PkCRfO7mY2uuw6Nycmb8hyAfwJEETkQwE9Q2jiN/b/X0BwAOCMALZDpdErJbph
         NZ3ka2Gig6dfma4l5CgapT15JPzObPomgKkCtCrnYbVpZ9nij27rFJOAu34/Bs4lGInR
         2lCofEuzqNY2k2MeIgPdDEm1yBM7cJJdqSWtyua7CPDKKallrZ2xNQSRKy50WTfPH5Kc
         XrLKqkMGy47sIEDChmDlu4KjA8fv6hLx/BoWFF1yUHdw42eUJnzZGvbIgdVC8vwzuPAD
         d2J3gp1qLaTd6H1ksORNhO14tWfn4U/7fZ5lQuYlo1nEZPwDUWlv1IRu9lgR6Eb7vjWv
         97Bw==
X-Gm-Message-State: AOJu0Ywh/ZYGDN3ZMxBYbUzq8Slas+jDldaESuRkHFjQ8Ifjfn01RL7M
	yZFuhY7yXMLJdHGzSrhAUmzMjouZBiIm03BR68EyeAmLfh8HtVDLzgIXMhRin1ZGWvcaggHNZKg
	Die7hymdpa9QnDhemBRCx9yhfiK7HvA3QiwSadGX+J9XMGGxUZjOCFweTUSagy2BxUEsI
X-Gm-Gg: Acq92OH7tiUvCtWFBUoufJKBarSqwh23d8ag8GHUC3eNBB0xpdLUkVOy99PGIk3iGMr
	t1XvxmJBuKb8SjSvxLEWCZ1+rIeQJfogGGd/tQZcXUBLQ03+Cg6fC/xZA8aJzdWAfadYUASD7ne
	aaGGtjJsiRZSgAvBDjBNvBRp446agj1tam7N2H6H0fv9OlbNfB7z44/tg0fR6sau0lFTC+4S8JH
	g4mFGgM/apv0Ft+MsuHX6RIoZFT0IHcixftV2uafUhByr0IjTEI0X6Pg56s4pyU7b+/fsqLVlCq
	XP1PtCNTwfhs6Fkw5I3+V8DyRLj8AUngqg8HbltQxmRlf5WFYyVA2YCbZ59oAGdXITdZZH30fjt
	iqKvRy6l/SsbmsgnNlf8DpDBIaAjGVcoS
X-Received: by 2002:a17:902:db07:b0:2b4:5b82:a8e3 with SMTP id d9443c01a7336-2beb0631a36mr211003495ad.24.1779807252884;
        Tue, 26 May 2026 07:54:12 -0700 (PDT)
X-Received: by 2002:a17:902:db07:b0:2b4:5b82:a8e3 with SMTP id d9443c01a7336-2beb0631a36mr211003055ad.24.1779807252363;
        Tue, 26 May 2026 07:54:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695c92sm129205235ad.7.2026.05.26.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:54:12 -0700 (PDT)
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
Subject: [PATCH v10 08/16] drm/msm/a6xx: Add yield & flush helper
Date: Tue, 26 May 2026 07:50:42 -0700
Message-ID: <20260526145137.160554-9-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: BWd9KjEwGEOb-qQw6BjO1tDOf60esiGt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfXxj1tP/1LGmqq
 zf/QbajxBWn/oVvSc5jGZ3Vn3/XQAaT21gVdPqZ0+1jZ5aYnHoRLbnise8AkqdldRzlyC25Phya
 ciAPKbpveQ04sTCAgUL5fUJ3NvyX4Q0I5vZ543HoZ+OmNJmp1/bYhDCoKs+ccKJu2hD0BXo4Lww
 b9CaNt4Vtc+jC3xtYLtGGum0FV3hhJr6rxzkewtZ8jFTC1yvZSxf6qSjRJSfEocYQTLC9L/R8HB
 ggUVzjfE2sX+gO7UvZJ+BVi8ZcM6klNf48jTkWTDdVcVUqnKBV7IBIPRJxrP4WDq1rLRsnjBCK9
 I+8tBd6r8kNS87DUApCeMxjSZjorvINNpVE0K5PNXZ1gnXHvx3KDbsf5mZmL2suVadjQoFxjGAJ
 lc612pgFGfKuDzRJq1A9iPCcSDfPG1uddrI67W1dBPilNyPkzjSYBJSeingUvnhMlcWtVh4HYN9
 6be/cu4aF3RO8al53sQ==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15b415 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=7a4_7rcHm0II5uOVc2AA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: BWd9KjEwGEOb-qQw6BjO1tDOf60esiGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260127
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109865-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EA4F95D8CBB
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


