Return-Path: <linux-arm-msm+bounces-106933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ML/JFKfTAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:03:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF67750E82D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05B823026E98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5123E0C45;
	Mon, 11 May 2026 13:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jn1yekCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mk/tRsAB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894683DD50B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504485; cv=none; b=EaIuxy+oACn8Fli/txrMm9aE3eCs/eos4T4i+6svr/ehknvKml5MnGiZiANKsAjGc+UtmqRd4apLSj2SCxFG/vc3V9SPrcZuCemuFrzxekUYF0e5kNA9o1Qts5lsc17KvuDiY+EOnbDApCP+qRwEgSMhzgMNeea0FOifg83JcKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504485; c=relaxed/simple;
	bh=nf/AzQJzAwD5Wdqnd6VCCPR5ecVd2qygEvoiPvLJ7Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nu8/ivIti8MEkeAVGTsJV91w9GRo96NF0O7xmUw7aA9Wn2ZR/bzaYwM3eb2UQ+gQuEJxExr+EiVNAbPeD1R+K8K8aFvPZxEZ9sqYy2w/3n9dG37L/WrOdopMP8v+bphYHkrN/dZswnJi9ldSG9FKB1Ce34XBmYEFOxzI7ys5Clg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jn1yekCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mk/tRsAB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FH6n3332642
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZFtTLmOQAzj
	qHoC3Fafdx5s7yem/Cv9ClA1WpeTUDMw=; b=Jn1yekCpstrqz+ayP+8M7z8c/BS
	Q3Z5rFpJR+3tTpCkhmtleSEu3T1D08jVw6+3IDHyhMC0YZDzj11boH04xu2P1sbN
	D1UmonVNJ9kH2Gc4SaVRrsb63TMF7n1c9iQNGVydZj+hEwMT4l7GCPYxZEmlM5Jr
	rRAH9qTdIU/IhUKYzvuzvsDHtz7JJZu3r6jT9qYWaGUnkyc4aPVsE24taIF9D/SY
	Y8JZwcR5AECRi745OjV+XviR4YMzADuAeaH3W3auczopHXZZ9GGqJw0raX6XEf11
	/jzpUo2O2NQOhb1qeSh+zRfIAegJbgyuSaMLEcacAdJ/fU1Job7U5uNMnqQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgs7er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so1732292a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778504480; x=1779109280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFtTLmOQAzjqHoC3Fafdx5s7yem/Cv9ClA1WpeTUDMw=;
        b=Mk/tRsABj0HuiJF/odMJvlaf3x1ucBMIe3m3gwjFnbKnVr5sKL2Y9UQlSVvuHpUsKS
         x8imm/0tlZkv79bfY1RTqWkIdcOiIw18UgSVUcnyJUx5Yd/eY+nEkN+Z8qvF+UfXVILz
         l0rZzgXReJIobauUYfSuuuXkUZI6ixUjnMS/DC/bLSYaawJqmvnARJXOW2cmgyTHfAu7
         Ork4rheglf4OsDoFtuTfIlwMC5ByyshdMjqFH8krV8UuP2CcPJpiVicQ94ptJM7TPppH
         MO5QFVD8K2ab/159MI+GKccicB2Jeim372Y5P6ZMC/POilHDXCHrJDhoKb0PxBnXmZr/
         aSag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504480; x=1779109280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZFtTLmOQAzjqHoC3Fafdx5s7yem/Cv9ClA1WpeTUDMw=;
        b=GfENSRwoVIRpPFllrL3eV+OYxnZ/DlkGvVhkB4yjKmgcv86Q1/hKrzxN6OFfPFiwBw
         g6EoTeb0sqSejHavFoLZbzCbaF/GEMsb7vlBbB1Bs3SY+NO9ahmTYsHEO0UAq4on83ob
         ekpOsmvUPPuTH+Tt59/NSQbfrh8FBOn/8SglEZVqjCqiwKLUkL8Kq5iV0Dn9Ca1Ryjkc
         82ECDx05CbN0XPICj2JUwnYuqC641kS/rq+jAjvlWX0od//HNMQEWi9V/uI+m3km49ZA
         IsWEOnP9K6LN65ZxpNEShtyl455fdhse6a/wLfVW2TEW6cf35OAT5a1WaO+W87k0a8tH
         UlYA==
X-Gm-Message-State: AOJu0YzrqyjXvQ+VKivAiKR5FOuJYnaG2K9gLMFhremuC7iZ1kLIHQ0x
	J9eotn+g8DlGsOadGHQ+zYEPGdE3IvqFQwjGR4Lf7EtiSRb65hFlStE4Zk++wpU/Q97sQAePe2x
	zrhcvs7q+9LMpAyi9TbdCtbNvbXzE97NwiciLLEJPyztrSqfFYFf6sHMl3kAVOEyYUzq1
X-Gm-Gg: Acq92OH+KaaLeXqVOmG1I00Vv7c6Ydk6jRHh6ImWI0CA9tbD7W8a2yP9VmQCojokqKt
	zMDTE8YQcMMFnANMHBvoJEd9MUOoTIbp5MrsX/1cMCzgjeIXmzsiZOUQ2Eiu3qBsS9xc/NDP5TE
	cazhtW2bohjwrYZCx2bmzfSGEq1WBL9HqDbO83ukRlY886QihqTrAHE6lFT4hBR1IDxXVpXP65B
	W40NLBwhu6Ga3z5PFp160Eo2/J3HAF9pqXbTwAxnFhE+4XWt6U96TFtWjDr0Mi2w0/tPg2RUuSk
	ArLzyfm3pi97DYbFB6FbgnhU3bwA3gqv8uBJXv9p2s1sLrxwHBM4DqSMj3TrDj2ocuPn6L11owA
	8gyNUd8TEZi7Ub71ZSiYMKOedHldZIW2Q
X-Received: by 2002:a17:90b:3c0a:b0:367:b9ed:dec4 with SMTP id 98e67ed59e1d1-367d4a171c0mr10379134a91.27.1778504479508;
        Mon, 11 May 2026 06:01:19 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0a:b0:367:b9ed:dec4 with SMTP id 98e67ed59e1d1-367d4a171c0mr10379049a91.27.1778504478897;
        Mon, 11 May 2026 06:01:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625ee39sm8246435a91.4.2026.05.11.06.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:01:18 -0700 (PDT)
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
Subject: [PATCH v5 08/16] drm/msm/a6xx: Add yield & flush helper
Date: Mon, 11 May 2026 05:59:21 -0700
Message-ID: <20260511130017.96867-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a01d320 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=7a4_7rcHm0II5uOVc2AA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: D3qaAR6bwAuLAHdPlhV-aTq-Q3b-34l6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NCBTYWx0ZWRfX2QvEBtak25KQ
 wVVF+arJrqufYN6JvjRn8TGMGlw8QkqBXDzr5BLdpiRyKdZEQrZw1wYxP42w1/PFJUhxH0m923G
 v8K4nbXoHZwc6n6lLdByHmmPrCbFrp6WB5+D8P0K1VKmnR1JCm4XW/trtw3NYHCOSB9VTbXtKC4
 0hEvkw4IfTNQPjFX8bZoXyfH3wGHt+kFcA202LZinqBob9aEAecIDKUTqLYajuXvzGJv9TqPgny
 dd0913y80Ntf9k6vcNxYyI+ODJmZ3SF8LRwezMonUa2WAhcTlJePJPP0mXlMt0R5lMVO8q3XERN
 vm9GBUZFzCRaXSVUPsIcPCDiM3042YPvu0ZfX0p+shaUnsiusDbfv30/Ey4dyZT5WISbeoqE+6q
 KqEQCELfbjS5W0UZf4NkUrYH1XHdIqHNaUtmsxuxF90CRwsi0yDZS8yuAW1E1ttozalivxhpEA2
 JEEgQk1d1522VWdy5LQ==
X-Proofpoint-ORIG-GUID: D3qaAR6bwAuLAHdPlhV-aTq-Q3b-34l6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110144
X-Rspamd-Queue-Id: EF67750E82D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106933-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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
2.54.0


