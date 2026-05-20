Return-Path: <linux-arm-msm+bounces-108843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCy3LCrhDWod4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:28:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D5B591F93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 18:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E46A3022B8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:26:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 725B636F901;
	Wed, 20 May 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uq5Updeg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YL7VHVZ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601C53BA237
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294336; cv=none; b=I84ca1h60Hc6eSXjjuJRocG9uagtlCvvzjhVnJ5ZLdJNXKgD6dC83O7D1caqUWFy9/8ID0gjoYQimM/Z45MVN8ktX1CK0KCZgtImm84Q8HfMG9RgD7E/Mwos7FJlnIK8kuK8AKVKvRIx6Rzl6E0x5O17l63niRV1NbyiZNkDidw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294336; c=relaxed/simple;
	bh=PkYlRSO+4GwvY9gWtu6YygmtEO/xzsMNSk3exUbtg6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4cfN1I8isXAqo9MKFXoVaOGMeIVrIDj6T+tYXhRUbibDRwIBs+2kvFhaGKkRt7PiQMLPfYfFTIunGBvYRS92Pmj6cvWYIAl50nYdygMSkgrUVuNSjyiUatYMhcEBgEjuMYTCo8mwpyMav91/Rcp4rhem5i8Kngt1eX8xPOZLLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uq5Updeg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YL7VHVZ/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KEFbIr963824
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=haIOTU+oqzF
	6UOOcaNNvH3Tb0Jkuoae2P6GBfreAHDE=; b=Uq5UpdegcJAADhzOglpaWbi6Vxi
	iDsNJqvYO06wpxExMvMDPsa5aGx3O6uillApvrr46Qo7cJwhWFnHBxldYgFYNgKJ
	yj0m3tPmrqPPxJIJmnHwD86QUw1I70ow3OUxbZdCnc+08DqnX97W1I4BEi1B3Jqx
	E7rO1BfdTnoE5nWkWBrcIWwaZlTi6uJguSKRaD+Y6d8wpfJdwjly6q1mRw6ovzzA
	IoLWJxsMHat+HwzOWhFbgAy95yFe4OBW7XzhnzrCm8MuMXalKZb363wCLoN0Sau/
	5mFSoIWnreXcEdnQssEBo3W2DwAXp5YUNscBzIC933dyOkHscEd1iuMVrUQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ejh0jqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8292a9605aso2482150a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294332; x=1779899132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haIOTU+oqzF6UOOcaNNvH3Tb0Jkuoae2P6GBfreAHDE=;
        b=YL7VHVZ/4N2GuXo0BcXZ8XW62TdDT1+QJR1ujqtgU71T9ANriTcYV+XPiAAtxoneJ5
         Lc07TIf3rDH6CdbkaFJ8+83WA7w4gGGcQWXE3JtIgc9RCewp0m6JJ7dLK1e3E8mHcQHV
         g+8VSC6Kv4w6mBkYyA8NIKnIYrG5q7/d0zBIFBF3cRcKV1DTRYGFQy7dr2t9u8BgXQVC
         AZMlmWJs6DvY3bFDYWufet7BVkCk630Tbb1w88JaUQB0aoqNFwNsdeJJjhxq9N294Cdt
         B58Xkp7B7bropajSkkiwi6fHi8FsVVuYy5c+6L3fkc+LElowPVgUb3NrNxEmr7/+K9Nc
         pGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294332; x=1779899132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=haIOTU+oqzF6UOOcaNNvH3Tb0Jkuoae2P6GBfreAHDE=;
        b=EXMkvdQ54FKq/lzxMQY3y5Y4JVrBhYVk1BkCEjEp3uaHfe/gXv5viyGg9+WGcjWIf/
         E+pcvqCEuU0JlNG2ZkHxc7Ec21ncT2VBBg4GhIOEt+y0rz7HPRFrg9jrmE9UzRjeeIIA
         bzgroZlQjUazGuMLJ8SVHUr8RlGjrHSVnMT1yCssAOSVUsL0ORWOLVNeUkO4htrAqa1D
         0AuHPWwcQw/EUg6Bbb7aMfGo53s+eUBdHsIlVtmWqAMxe0dVZxkMvxx0RbzEgeiwC7IW
         vFxMNx7u55OMGdSIDYx6t5t2B4UpYotU3IokPwNwDBEyYdX0PavBJ7+5Zy2Uy7b1P8z3
         fVgw==
X-Gm-Message-State: AOJu0YzfIlq6CfRwEFtbemDqzrmeGY3UBcQP/7g6GNRpcuBzG/H12EiP
	f79WzlGLF6lH/IqptP1u9V3l4e4XmeMwzhVQ9Kl9LTVXYtT5JKuXk1HqF6FcEDcQ5k0oFh9s2UR
	NWWSqAI8JWZBiqU5FcLVDzZ+A369dhAb5DTswcyyaUZVmrBypZvJXVefKY7/dThsvCwph
X-Gm-Gg: Acq92OHQhifKqos8omNXM5T6F7v0173VjomvP07OWlZAfjv3PqCvOnOJ+CHkQIaKf8k
	rH8KanO65TmJYsaI4lwwo3ApoGoXoNrC9h3bh1AbZE/6kCLU0jVLA9V6s1nCSxCmX/wynxG983i
	g4NLfPvVUFmEJLtcqz8nQy5jOx3ZY59Ihna2jSWP6EtxbQJrFTCBYIzTsWE4k31cnwYFOZNRFFC
	JKCbaiKqTKU/Lvma5vkIExD35PD2f0DXNrUKjvBNx9m4lq1bHZoF3Ozh25CPwyLF8ZVJnBPoBz0
	Nhh2oSQ78LTn39Hk4KI6WN2h+YZ+eJQsVVU37UqPamf/tDRYGZzs41CmYZNINvYg3OEDwVGhAj4
	ppCzc2uUTyS/l2FDMzdvhrRrooDDSBTDc
X-Received: by 2002:a05:6a20:6a03:b0:3a2:bd1d:d684 with SMTP id adf61e73a8af0-3b22ebd373cmr25978996637.33.1779294331790;
        Wed, 20 May 2026 09:25:31 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a03:b0:3a2:bd1d:d684 with SMTP id adf61e73a8af0-3b22ebd373cmr25978928637.33.1779294331141;
        Wed, 20 May 2026 09:25:31 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb06875bsm19781102a12.3.2026.05.20.09.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:30 -0700 (PDT)
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
Subject: [PATCH v8 08/16] drm/msm/a6xx: Add yield & flush helper
Date: Wed, 20 May 2026 09:23:55 -0700
Message-ID: <20260520162454.18391-9-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=QptuG1yd c=1 sm=1 tr=0 ts=6a0de07d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=7a4_7rcHm0II5uOVc2AA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfX8+xgW1llB4Lx
 XlivJsTZCAQCePSyJVXGj6py2pIf03osVXcY+6d9dbqxRNS5DyxMdFqnwNf+bSCYF2LEY/oLa/j
 rmuMWDxX88iuXodUlL9dXjgJPeCnISIazqgVI+fer5qRsdPN1qQDlCJojQdHWpaQWjfZ/DUvSae
 Sd0rWBj2rxL2Nzf+EY35Q8K6Wo9z2touYHv0whGQ1ll6/NgCkgKXt1/nQ1O9oAtm+jChzPQnmxV
 /Z6g8MgY5DV+v8ejvVrV/U/Z7taZGwNoRrKWv43geoh4eB7yR0ZCljJ2VdfHdE0XTz6yamZugi3
 HH4KuqNVJRJ/koizBpb1TtWh4R9iV2tudbr6iiEGLsrOolCf89DnRqz0bZChs5cFvKeVHiipK3t
 OymksCU48hnlNgMwbQRSx8N05DZUR1auEyzlH0u2NxVaGrTl71+MMIStwFLN7nDZ3iUZKVJTw4I
 1OvhCOYw+bQJcj49I8A==
X-Proofpoint-GUID: aCLNsZPHTN3aneG8Dqbgj3i3mCPaX7Jl
X-Proofpoint-ORIG-GUID: aCLNsZPHTN3aneG8Dqbgj3i3mCPaX7Jl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200159
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-108843-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76D5B591F93
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


