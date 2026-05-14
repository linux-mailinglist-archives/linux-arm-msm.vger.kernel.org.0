Return-Path: <linux-arm-msm+bounces-107617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIOZIsnUBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:57:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA80A542A60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DAF16308D75A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDB93FF8A1;
	Thu, 14 May 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ly+hBnf4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="azEpis2l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6533C1403
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766873; cv=none; b=gwyscJR+hnxvs4UZmMsNt+VOOQNNcIJ8GTdNKM041GyXrroOa7AMa/mOn1S3MxXP3tO/PKUytzJAscTd+fgIssSt1GbSluq2gBgyL1v8p1R1IAbmjJKaYV871I0BjxNysfsLNnWQx/KRbgQXgloCkVitKXySRuh5G4/Xh/ZYstg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766873; c=relaxed/simple;
	bh=SUAMjZQYP9AOePOsiJrF8dJnyR56nPusuhXcE6GMh44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfuF5hss9QIqGbiU+qGCtO6P2epWBDRS8bDsgccvsLbMjQDj/Ro5Iie/4UpgS0xRwmHphW3sgfvGn+LB6ucmUyn2iNAW8UnBUMQrNcEUNKxN8ZkgZJTva18fGJ0fuX7fvYnDfoRDKBu7U93Ra2ugAoHsJ5qg6hzx1NM26gqO8Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ly+hBnf4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=azEpis2l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBejjK2238625
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t3fkEBTd8c7
	M226NlRdLECqyLGtXW1CncR7GLKvMNdQ=; b=Ly+hBnf40YrIKMaD5B+wj/bJsUf
	6KzBDm39uQft+bc0Z8k/9w1WvaUuY1eFGFKZUocdP1h55ZoJLe5h2fgVH7RtAZcc
	M3b4+q0Qa9kjjmkkxevdRpGihQ04E7idgQbzXwV5VRB1N71PoYuB1D1BGr4o5rqS
	k9IwjGcsT66Sx4WRrxL9kYpY0OeNj86qRNVys1TJ6HAjHVoRvrc3UhZ1MfHgtWei
	XOEEG71If9J6/fSwHUDiueeOV2t7vIhpdFYf5fzrEb18z2cxaYOKYfEFMGHl8v9T
	PmXyQnNqXf/lWu/TGuxaNOiEr3NwB/5+K+Ep23XxiS0Jy00ZNRdXw42mmsw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e566bj10h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8386367b23cso6308169b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766869; x=1779371669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3fkEBTd8c7M226NlRdLECqyLGtXW1CncR7GLKvMNdQ=;
        b=azEpis2lMlbgN+LrYPOQRYk8Hhkq/oZ11MKsdK7jM/3t1bcmz5x5qOQjxDwVi7eNIM
         bVfZXKSoZg5pubegvr5DIZtwKMsHtPU/03kDYXCu0rhU7XMkO2DzLD6Z0dBEOhqE7yn6
         NOx3V51hDNjtpgFimlgz6nDECsigSWDh2uht5XGwtoxy0vaOIpBHF+LsmVyJJvvJ97Bn
         p9vOEzPsVpNIuMPS3qnQq6jBifo92oKzRigq/Q/3QnwiZZE/yB2FikU6SdV5p3EktZsl
         qnKWCJm53d1HLoTvUr20EODmDvrsnnpp3KjKEmibtuRYlnNNaP1tMEu0/wuliMQHDfKF
         BDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766869; x=1779371669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3fkEBTd8c7M226NlRdLECqyLGtXW1CncR7GLKvMNdQ=;
        b=HoAAx4ypdLryekPsszKFGZyYXMcL/D46PLyyCbCLQje7DTNooi9KLIUfEuqr9Cy989
         6KNwgeXYaFkXAcq8zGNrv3d3vMsZelQ90aD2UiC2btTdrE6npINzmFmYk6yu0bwo4zmB
         EaErwYLy5WiAglSVIyiPBf5awBn8/d0YQvNx8GYjbF9RlH02YvZmA1zPy+Yp8CqJ63bJ
         cPqChNAPlTwEQ+OflmMhIGGO/CJki7wzvA5RNj8lkolUd6qKTbKFeVJyb4WNHoDPUxVo
         I1/gFb8r5YjVW1RyhG+S3RP3ZOJZTHShS0kE9ddIRAe3471YOrBuAAqlOUJa3+ROVcPK
         ZFbg==
X-Gm-Message-State: AOJu0Yxh/WO8BMMb0F/nJzP5KRel7+DgHlQ4gHzH2foSGlYPWP+PQeXX
	IJyfjW7v3cNIM2BlOHAM/t9YCEuAlIUx9xKimmqqRGi57edVUDe2eim0Ow/XO8LLgSFk7WsfOgo
	Efky0vw/CowjgkceVxb43YDoC40tFXPakSu1mw7D9L/vRMg83UyHaWSXfPPqjN+t9gZx6
X-Gm-Gg: Acq92OH9EGQGZKAMv2Ue7nDFP6ffwE+YvYTOqM2Y6AvxjWkAcHVsdVNL/de3gG1Trif
	ABIfm6EuZPhih7gZLMe+SkZZlWyvuxd0jb7np1z6d6HaIvSaOgWV9hoRZVYc/5yfaVkkwfKiuT3
	zDEGnq+nIrbgLVazkw2+ML1Kgai89uQyh0H9NlAi+xTPEro3SQEHyMrzGtkta8+MNjzTXlrRcE9
	Gtk3DM+BTaUrNZc1Y0xAPifJ7hkNhYpRbLBe235uAX1w8xki4YRI1iBtgExrTlalfmFPYMnM89G
	5KKSAJoYWeWhp6yQLTnK/uQ/Q7QQDREdMuYxqvx+HuS7wO5NB4pxowSq9YnftNh2tUyJXVkDqRR
	1v36Nrd+xfm0T0p0rrNc9wSWo/4SEqBRz
X-Received: by 2002:a05:6a00:8088:b0:838:20b7:40ed with SMTP id d2e1a72fcca58-83f042bdaebmr8212901b3a.42.1778766868476;
        Thu, 14 May 2026 06:54:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:8088:b0:838:20b7:40ed with SMTP id d2e1a72fcca58-83f042bdaebmr8212852b3a.42.1778766867873;
        Thu, 14 May 2026 06:54:27 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19664220sm2638819b3a.4.2026.05.14.06.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:27 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 08/16] drm/msm/a6xx: Add yield & flush helper
Date: Thu, 14 May 2026 06:39:56 -0700
Message-ID: <20260514134052.361771-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
References: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: iVKKrt_G9aXKq8mSFoj-71aFjg4OEXd4
X-Authority-Analysis: v=2.4 cv=WsMb99fv c=1 sm=1 tr=0 ts=6a05d415 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=7a4_7rcHm0II5uOVc2AA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXxbOb+h7o/Svk
 1T9FfuFNh0kCawIuodChdPLSKiZykNtkwfqKADy5hf6MTcXQ6YX/Ur6UCU4T76o3vXrHO0yS/vi
 PWsi7XpqD/b1gzdb55OXGt0M1TFZcZkQhhGXi6RLm0IJLcquZKEB6iOFjUhAvhAiHrEIl1u/Gmb
 5DgWTxvo08bdT06XpWnx11R/r3BzS2mdA6aITv6tBmfPbPqRAlL467+gFUeXFC4+RRuy8U4no7V
 4theQRAhinbX7dxdHUXyFAq62I5WSRRFnuwwhCMymi09qqez4dRjKMfWzp4yICw9DiimGq1lqOG
 TtXxU235zY0E0s3ivmRMSKcZmM3vQe5v9b7Poy4u73XvwSTdui4VteE8gMka0Z9xzlHfASyqiYP
 Qrqe2/RmEvhZVP5ouMLvGkilh/ugeWQUdcpEQ4JYmrVmeUYuQJ7fjd6n5N12aVJxVGMNY2ims/E
 5MhfvkDfz9N0snmLobw==
X-Proofpoint-GUID: iVKKrt_G9aXKq8mSFoj-71aFjg4OEXd4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140
X-Rspamd-Queue-Id: EA80A542A60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107617-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

It's a common pattern, needing to insert a yield packet before flushing
the rb.  And we'll need this once again for configuring perfcntr SEL
regs.  So add a helper.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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


