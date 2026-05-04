Return-Path: <linux-arm-msm+bounces-105804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMGxGtfv+Gl93QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:13:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BE74C30D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8DC6E30C76FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1E63F0AAC;
	Mon,  4 May 2026 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VS92g3on";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KTTi5yIb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD3C3EF670
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921727; cv=none; b=A6eacFAx2bHFA+jX3P0rrNiL7plZRN9GNbpEQ4cj04WJ0ddO5IByoI944Fs8BRidhvXbUTWCQE2j3tBOfCtP8LAWxaUDLC9M+3ZAY5irriLwqgg4ZId/tt/1IFGnRK/8AyQOQxQLbSkdMM05fQeWzFlTqfr2R1wcKHUsgRCRWkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921727; c=relaxed/simple;
	bh=CjOeIMd7KHhgBlYgalqgDMr3CrElSHV/LHeYqaaaD9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hjl7rBBX0HrKZ+vqyn/RGF/yz8B0xpFE9DVGqoLHND+qSf8jRQfPPl61R8/c0EkK8pJsOL4EnTsJ0E0It71Wf7dSf4+bdbIMVEWlg98zTt5t0oMcXL2ZxzjdTBxbxbOuk2nM2Hwpf7FW2d7oB76PgGGI7SXred+LXqRpSZltVBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VS92g3on; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KTTi5yIb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644IJWEw4128668
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zVhhihIWGcW
	DVKhVXioxlxo4w1o6vj94DNJvO2XJTbI=; b=VS92g3onfef2nfVAYVBljos5ZSe
	X+uND9pTg4qVUdPXXP9ZQaKQzZgKdEhoj0IYG1kWx5JcW2KKdnV3DoLU3oJnIDo+
	D54RY+hvxrrfe3kc8dwVTigLN/oQ/LFloR/kyqFqgnMZrwIHVPPy/kIsgJuql0fc
	4QaErOamzKIaV47WQndRnZIOoWL/yKUBw9/+t4OrTXFZ+jYe6vClypzFKvBgt9MF
	yz8mfx3fPZaL3k6oTpy1WVyuGRgnUJfxA3IFoFe3sPw/bBJp+BoswdkGklgz0jdY
	zYPw6T6R2LIolDSh9Yv1clC8M1WR5PMBbur9alzShPFaBbzCgW4FWAesY2w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw1x25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso5813978a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921723; x=1778526523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zVhhihIWGcWDVKhVXioxlxo4w1o6vj94DNJvO2XJTbI=;
        b=KTTi5yIbLHwbsd9KYjmsF+tPyxumj7dIsVEVPehbFIIybF+T/iRZW7u/J5idxNid09
         HZDjMqhFt6BPYD9TWkFoElPapaI+qVILd5FXPaxbTgdRNlhfu00N3+pIlnncLjXXmFp/
         A39EjcKcC/+GkJE9I3zLLW4D9amDm0UsCXsq142Fe8lf+NRYhHGg45HadvLnYRactb3o
         Tg6QUSY9QS6fe644UIW4Iu8jZLHX+xFDBpaY4SRjzY5OzVL+6Qvf8gvaIMOxouFBS0Xn
         wk2aHT/LGZxmC3ej2Fj8rJTTJoOS1xS8XChiPqmxMlGwhJ4wG+qtXOP+kv5UwOTuXntP
         bFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921723; x=1778526523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zVhhihIWGcWDVKhVXioxlxo4w1o6vj94DNJvO2XJTbI=;
        b=XnUfYcnMaCW/BYC0AkAyNNAacTgKFQne4AvuIFVyr/CZkVcJdv3a89zU64NwuQSkTX
         0vRN45AcyoIq9FBhKwdoOy0wWDgr0HQF4LHM77yw8GqY6cKpXh5HNbE6/kzikFuUXaoE
         a4DSJ4rOSnhUGLZKgRhhfwF2WRkge7N1uxw6AmS4E8zg2IqGhsmg7FNdecFe4qME3bOK
         brWNBl8pq/Xv/EHxQelNE690oAH7STvbbOFRkppUhO22gCo241zDIxFX1CRknNsRsNfS
         /zWNk6Ls533byE72vTtjAJR+H8BRCqzB6cd+jN5IXkU9odVZJ24m65vQi/FSIm0ygPEH
         Fuxw==
X-Gm-Message-State: AOJu0YwsbTlOygQEmIW28jjdYNzXSY482eAwThDGlWVxQ7iX7iXEcu2g
	RfNNjI+r8rzbBYtO6yFTrIKtFTmG9fm4Gi54XnIqRLc/+42Rl5wNw1m+7mH7ouBSLWXlmpsUVmS
	hQQpIuyfSIDz8DENPoDt9mTRJkjVDAFSBKfc4e2e7pN3JU9a2cV++V6AHzFW0vV/ubbJU
X-Gm-Gg: AeBDiesPdvBHveH/MxrXIYHTvqt/vXLuy3OOyfjQIc+I0WgRmRtxPCadNTdMl+crpUG
	M020/jLZWLREQgVGT9U6MUva4Wx5WpEf/bUVbmnk+xDDm6Fi6hV+ycj3L0WhlOhBba/mV8w986V
	bwZKZgeI1H1zZ/M0cvXoDitUsQsIryJjWoJj/Q36D0+VP0wgYht3loB6c6LU+8xZoW6gHW+S15g
	CxzCB7IwUDtQAqTmlpguZZjRSI1W7qSUKu/uPbnUMe2PDzUpJvE1VSZ1B2JORQIA6eYagvYR2zn
	fkdWlMS1EJNAOMo7MT1Env2ZpMkH8og7ZEkinN6NRomTc7Qtyw8p7bMkXViRRpX+68IAR4YmfBu
	Pb4zdYee5+HDjpO5CRQHmiusseAhuAKEPl6fEKoBsEW0=
X-Received: by 2002:a17:90a:d005:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-365724c1a6emr559026a91.8.1777921723110;
        Mon, 04 May 2026 12:08:43 -0700 (PDT)
X-Received: by 2002:a17:90a:d005:b0:35f:c1cc:fee0 with SMTP id 98e67ed59e1d1-365724c1a6emr558997a91.8.1777921722572;
        Mon, 04 May 2026 12:08:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364ec00ad4dsm15850171a91.11.2026.05.04.12.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:42 -0700 (PDT)
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
Subject: [PATCH v3 12/16] drm/msm/a8xx: Add perfcntr flush sequence
Date: Mon,  4 May 2026 12:06:55 -0700
Message-ID: <20260504190751.61052-13-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
References: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f8eebc cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=W-43u8CF5Pkpiqpb4b0A:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: cuK7Z9_Ng9ZhoM75ibYA6hTtfKJqW-l9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfXxyuBzqW865XD
 T1iodcRKqmHH8ky0U7jZY5aYNdoeg4Gsug+4C/lj//JjtgzvqAwOfiDJS+aZa9+2OAznsXcvoZk
 hOaVsaNvoYezUBXFJC8ME7DF+Si4h1zVNaQUQdtCiOhI1hZCcem3VH//bz9qER0dNM6uz3W3xCL
 65/bSSV43ePgWmv6lgd2gl5iAsRPnx0TtrnjmKo0ACi9K6vNJkkN1HitrvWrujYywXjUve7X/ty
 BDryGchQfEXScmVzZDHepEMy9XKzqaOoBi+ncJ2opy2/WbPkPppQBHAoUiyewp3LDeBFDK8JWfl
 lkwtR8rOE31alCcNqX8ayRZ8rWE1CF32cjmc7ug3ZpzZJ02YhBySPm0n5XxpO52f91GeOxjiS4y
 o3JKKQYvkEEuzyuc7C/H+lhQQXwriQcyvr6Cc1JZUVbVodFa4mxUp6PS2qSUidA3DHeZaXk7eA+
 bd1b6JeXKrrEvlALTnQ==
X-Proofpoint-ORIG-GUID: cuK7Z9_Ng9ZhoM75ibYA6hTtfKJqW-l9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040175
X-Rspamd-Queue-Id: C7BE74C30D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-105804-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
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


