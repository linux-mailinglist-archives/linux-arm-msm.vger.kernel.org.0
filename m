Return-Path: <linux-arm-msm+bounces-104478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOXAIp+I62lBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104478-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:13:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 09292460A06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C74430429B7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:12:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B12346AF8;
	Fri, 24 Apr 2026 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+fP8P0P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DvT41CSX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2672C21EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043534; cv=none; b=RrKUjr+Z6HaGfKi5ATdaWrZv0Dv2NDGHwgDplNWtjiEt3w3u1Vsh0pAnRb0rowNi2MVohLBwt+PPiUIl8O2bNAG7ZDDFYoEPF5g2A4H+YKuoTGqMXuQKF8GdCtMoWap2S697yW/8IpeRdIfrSb1uigehkyrNaPCKQ/sD/ZNil64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043534; c=relaxed/simple;
	bh=bzzQ4aYxL3tMOEhcG6/I3PaERyeEXMJI+pElefAVGOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtDkZLvStE+QSEaL2sksYAcnOEB7C2ACKHtrVQzb5HVRap7Pre4WVLxEeyNrUBqk7utCw08RWXIav8E4Lk6ic73jGnM+jU03K9F+o4e0LNyO7Lag9cR3V/CPSB8KzvANPXN5HmAVbbrdZWPbBUKuqM2VFX8woSaw+oAxV1goEOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+fP8P0P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DvT41CSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O8vEpu2710318
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2tbDv2EIvIT
	EuQGnte4mfjJJTKVcwabfjQz6jqcfywA=; b=H+fP8P0PCGkZ4VKvQsiyXXH6pAI
	PWMDUQg3mPbCCkxLd61NwCxbx4AHOx2blz5ZOWB7nZL9kmcNzjLJ1EtXk7wxL3hN
	c/pVYbREtelpiif/vSuyvc3hWu29jtW+ji7JwmWvceHTyqU8FTm5+ygj7yBbSh0/
	UVbYsYHNZ7ydvndsRtR/rNTzkHF/u/jzhya32hZK+B943SZGE3ogTLILjQnq1FSx
	DvOcyGccc5XrbE3qGDieMdBjBijYPnefESJko51p7N/OVaO/6ZJQkZxsbTiwaahx
	aMNdJqJzTchKpF8kvO7pesYac8whsR7WwLFLkxy9QnxUBwnfVL1GENTaZ3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqqu9vr8s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3594620fe97so17314540a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043531; x=1777648331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tbDv2EIvITEuQGnte4mfjJJTKVcwabfjQz6jqcfywA=;
        b=DvT41CSX7HY3LAPlTV9qqyd7Rh4DbOXwTlriBiYTCaV5gLlo2NdeBAcY9LM9OgCVKc
         +L2KaAH8SuQbST4r109xweeOB77KUNOT5OR6Sg4Gi4cC8nUNsJr38RbsWTSna4v4dwmz
         v/Acn8qAqRnjAm86hA9j5C+KzsyfL0yJMpf1nCqqCp7rXUWB8pUqncjrpV0yvZXgCS5N
         5CEGo7e3JvCBkdpdAkg+PY7GHSYsKAu5phCLIZO+JtHuZ2nPfeIFsWo4OOntQcMpwRhz
         rMd7uopo27mfMfmdkO+wOBSMof5WUitrolmavydogX7SJsuFtDPDCSlTubXMHIpDOJeL
         QoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043531; x=1777648331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tbDv2EIvITEuQGnte4mfjJJTKVcwabfjQz6jqcfywA=;
        b=gORVhbZMdsJW3G0vLzA9qLmrtUwKw9A6K6nH09ujYl0mHGTHn6zLyB+VAEZ58g6P3R
         qFSHgpUaoWR9S2Jv3SAs9ncCJXsSq15YWj1F2uhI84t8zgbA0jQ0P5bvA54vAWkTQMbl
         nKOIJ5VncMLn74vEijnmV3atTx5DzoGqvjBI2cW1QSR1QiPTI12GYAdWW0xPI+MjoYv3
         OFHv5Msbo4U+fadrA3VwxVeGZjwCglszQAgXF1DEUa80VbWTndnndRSzeKa9RfZLU+Q3
         X24b5J3PVlqkPXPdJilx4JsHdtThwQ3X+lTjsjHg5s5GQfr0+mYBcG4zT1S6sxKsAfqd
         O+tg==
X-Gm-Message-State: AOJu0YwHPbl32qN1bWIzV9EBMGq3/tYGdlsKe/aue/8KpJiUcaQc4q6u
	HQVEtqwcyJl/5YWANxFQ7P8tPyUvlItuIx29tRTA9zmYQR+9gEdrKO0AblS+JtWOf7gNr7sLcks
	6E03B7M2Z91yBk0aSb/Xyt6WSWJslnblAjBDAh6NnkKUvRyKhs3jTnDOqd9mQv/oFYmbA
X-Gm-Gg: AeBDiessR7YzHp+rrMTtVQ4hKnm7928PdJFIWt4VkUtWTuhjUbqZpmCAdksesQ24V8/
	MRA+U2/ormS9+7q0jzFXhCE1rC9xopAaH5IxlzP/SZn9rAp8kn6ZlT4Ca9oAFpsrofyiJRNmnBc
	zumWFyh9RuQKBfsJK4OU+up4xMxOMC3m93rgS/BRajSV9rfzv3XAWRnyIgTjDR9a015gPWe4hcR
	LV1ArhFq/YtmjrlOqRiizWMEOCqLqu5YxLrq++7cJ8AZr8P0ibKdOwvGYw9WZy3VQYMRU7YL6WQ
	4M7YELzS9Jmqv+A6J7kBeG4wHX8hbADGCvJAq2FnFY+hlM2oadyqiqjCsWe9vASF9hVWxHrer7W
	rRc33zLVuFDwARHjaLx9/1C574iRt+p7Qc/o9ZtWltcI=
X-Received: by 2002:a17:90b:1fc4:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-36140490bf8mr36783567a91.21.1777043530255;
        Fri, 24 Apr 2026 08:12:10 -0700 (PDT)
X-Received: by 2002:a17:90b:1fc4:b0:359:8de8:1229 with SMTP id 98e67ed59e1d1-36140490bf8mr36783527a91.21.1777043529584;
        Fri, 24 Apr 2026 08:12:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab20c4fsm285138165ad.59.2026.04.24.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:12:08 -0700 (PDT)
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
Subject: [PATCH v2 08/16] drm/msm/a6xx: Add yield & flush helper
Date: Fri, 24 Apr 2026 08:10:43 -0700
Message-ID: <20260424151140.104093-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HTWRFleMHTfrhEF0A9avkx1ouNIPkY5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfXwyQTTCi2/Qic
 AOr/T2MAwWQ9ODTqR+PaSzs6sRI/iCcoHYr+29qqrmJFU6a//b6Wlsp95dzmjDjwOBNOvUzREE8
 K007jmtnnSM6o4GQcKzuHDew5D54wuK0b1GT12khQ3cDBzOGcBAW4jQoG15/ymt2iB957j+M4W4
 N9WiQ/1dxLge5ZAxlg6IXZZYs/rxonGynzNUiPvyK1mvC1ugm+enAWsz+uOYcktoreDgZOQ0FFd
 B/D3EyNgtd1uArip06wdbKNIaQHAegYmc7RsO832H0C+KnMQAYl4r7QB5/7qEsBCRxljz6HKJwT
 w3ic02kq+qBTgv333ZaDhMgJrfdS5VNwjWt4wWUIo6uqpqIcM0+e4G3y1SV1OWCtz4Dnv99XwmR
 7GmHniOmPr6okqgdVrvOmqptSieYTc8ra9U8d8Cz7iq4HOx7VTV69IMRlw+EgJ4hWHZ2MZTuY7n
 mDy/twI+UZfSeq3tXlg==
X-Proofpoint-ORIG-GUID: HTWRFleMHTfrhEF0A9avkx1ouNIPkY5L
X-Authority-Analysis: v=2.4 cv=QJNYgALL c=1 sm=1 tr=0 ts=69eb884b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=7a4_7rcHm0II5uOVc2AA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604240147
X-Rspamd-Queue-Id: 09292460A06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-104478-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

It's a common pattern, needing to insert a yield packet before flushing
the rb.  And we'll need this once again for configuring perfcntr SEL
regs.  So add a helper.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
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
2.53.0


