Return-Path: <linux-arm-msm+bounces-108274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFyoFH1kC2qUHAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:11:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DF7572B40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9B953076B0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAED395266;
	Mon, 18 May 2026 19:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTD9TNRx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gKTlhrRL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF0E391844
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131302; cv=none; b=LVgprdRO/j3AzoZW/J18vVh/cVaiI4mDkNltbYU/8vNMSOa3M7SfIL7UpG8ZJt44gmKkn/8LKsSb/aPuQhxIvvlmwPFJdRFRCCDZyaouAxu38l8t88slp4PuBLbJNxFSxKSYowfCBkIFd87vJ8T91Iiv04IALTHsH8QBTW7X/M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131302; c=relaxed/simple;
	bh=SUAMjZQYP9AOePOsiJrF8dJnyR56nPusuhXcE6GMh44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NxthxPgyi7LKpxBLeWZIHpBHM7XSmgm9UHhaxS2LL+dnQoY4Dqh7Ljns1UwH//mVs3jroOFF9AHpgdfelw3+qrGkrPdXJtQqm9QIlps1YybmCx6pIv9MonqZInJxxq0bkBgP1tEey8SnQHumZInxNCFvtaBg7OhqCxl2sQkwPd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTD9TNRx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gKTlhrRL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IHKiYT2685229
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t3fkEBTd8c7
	M226NlRdLECqyLGtXW1CncR7GLKvMNdQ=; b=XTD9TNRxVBVOToW76jWGXBN1paC
	9Tsq8HvWlIIGOKqoO9jRgXCZpgSVSLuIYjflJnE9J4Te6nWiH+lG8BS9QEY8sM3O
	z6n3w6o81DucGXn6H9SgpG7xrkvkMuwbNiDnYrVz2DsEpeY6iC13uK+nevgBDReS
	fjA/M14X7uolSgD82lhMpKrlHAL+9ZyFKhPm7e7GUNJcZ3cMutWjmwU+08MWFUc4
	qsi4G4fHSOut7cGGdokOvFcmrJoQ7hkJQRAeQ9v6IzFkmHMmiflLicqaCm1NLooO
	qXRg+FaOL5mzVn421cMBn6FvVbT5bUO3PHYY5aNTUL94R3P/+olbvvpsNBA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7vrbuamb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so2352950a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131299; x=1779736099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3fkEBTd8c7M226NlRdLECqyLGtXW1CncR7GLKvMNdQ=;
        b=gKTlhrRLe/iVLtR5W4GCSwOVdidqcL92Mk8ZGoWYMyjFuPrDmSMqc1D/bdqSBAnviV
         AeS5oDF+kXuTkQXn+MsD2l21Xlr+ArVRv4/ThL+itiDt5Djpj8KXoevn4YXiY1XO/cIC
         0ICRs8bBjbOln503le+nHRAkulhgTBEBACNjvWuvyI0itpdt35tXyldynsRH9kNBgxiV
         BRjKhLtBLfE3L/AKJjbvsEgpX39sKyxrmEnfHUetzn/fSbXpYYXiXkf25iHW/ssQ5fVP
         NQvWg8f4ujiss2QzjgLnU1uKJj7pypd31y/C7b4JYMpmWTnYk2KqZE4p8Ln7+2e0xgzy
         AfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131299; x=1779736099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t3fkEBTd8c7M226NlRdLECqyLGtXW1CncR7GLKvMNdQ=;
        b=geETPKfP7Y+bVoZq1YM3F0ZwMEUc3kUKzZ0lCaYuVZv797LgaYFMaD8AlNDjFd8GwY
         s9D8mEXErRFsO7LzJteeQRGyRXK6wl2vpkNBBmP/MbR3TVygU0cIZDK8IR+vDDv/2yfR
         yWgERqfgnBzLQ4IR5QDLvbM2DilaZceNQCFS3d9zItXlg5lRMXRFGDf4ZHumDeuuN3XS
         9uh0JwnTcyIMfbiMydLdZcwpEqKz0kG42ngyUEqObm9zXxgsPn4DYfXtMXKHoVMcXNR7
         4CtgDszYr1TOXP73irzqjGsYj1QlgPU9/LOZLCL9NcSgmQmWXHprE9GwA2TJ79vCsCss
         UdNg==
X-Gm-Message-State: AOJu0YwY5kLjJQ+AWC31O0QdittOdJevbM35K7QIyYzkCI3RwjdEN+Dp
	oaDZJB/3/8D0rkhI7Fj0gDSrxOSTxvsHH7IfDfDJywiloXMIuZLrCKrDPsRmhxtpOPTI134qKMT
	GzJDyQ9wCqpEfg9tVof5IBJdGz/6Y2BqFhno+BI5yGfGqYCWNrSZk8xiU+kllzSKUoyVB
X-Gm-Gg: Acq92OHvNI1HTqhO42N7LlUHw5MpHx/ttcNVhIcMuCG+dRFhHqktjmE88hv63Fi9pUH
	Rqt5rS5I3U4Oh54oYFhrCsam2ADdRJYVEeurKt8tWObKYIDGwX7EL5fmCTTktFx3fTvmNtTpwD6
	5RUzl1MOMJOA7uenPm3ePVekbXZ7V0QnEuwb4UXlcxH9riRz/Lz16aU9u+NrJUuh9YWl3vl0o18
	nbC/NFYcjd/AUsMFhSXX09uv+v2TM4/wVepSVo4mKJEkjRZPqQ9jEgGXIRNgmiJ4fC2ro7kbufD
	cBbvltRYoNlx+41Mx/7/I6w7jw/UfmrhhHoTFjWYBQ3hS8rKbqbPMvnT/0t4GRxf8Qn3uvTpQkF
	ZfE0C9kp2o590VOZBmcumkVHfnEdZqMg6
X-Received: by 2002:a05:6a21:6d9a:b0:398:aea8:a9c0 with SMTP id adf61e73a8af0-3b22eb9e9admr18155070637.19.1779131298621;
        Mon, 18 May 2026 12:08:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d9a:b0:398:aea8:a9c0 with SMTP id adf61e73a8af0-3b22eb9e9admr18155030637.19.1779131298119;
        Mon, 18 May 2026 12:08:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82da93df0dsm7667139a12.19.2026.05.18.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:17 -0700 (PDT)
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
Subject: [PATCH v7 08/16] drm/msm/a6xx: Add yield & flush helper
Date: Mon, 18 May 2026 12:06:35 -0700
Message-ID: <20260518190735.16236-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9S1hKFAXGHPvcwNxk70ah5-9Idw1scvO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OCBTYWx0ZWRfXxSTqElastfV1
 VvOK/hwzfwzeobnHp+gxETp2ZLPb8i105gRjl8qaUEnDIMsOXlDZlkZz/Sc2/XNED6Gcyb0fvuO
 m6zAgNpF1AkIp5NjUhRIEvWyHY0Ymynd7whh0/qIY0ra5KZsSC/N8iAjnc7g4SPF3Ehkgp/TehF
 5iL4c5rbz/KeOI7Eb63J3HiBokS3S4vvRd3USrhq8sUA8V232EF3SVZHDdXjHZVbiO04AsjUdww
 7gnPzJ7eq6WU72IeP/FitkifZm6hUfbkVCXcdMyLFx9Ed01OHg3WpRYx+bAgfCQRmQRbzqhn0D2
 5Rt87z4mkBnj2rrfQjVEOecoMcRluRKHsAz8Wga5vdfnM1W4pQRVnSh/7NA40T+a8C4wBzfowhc
 orcV2W2j5puLVd7DLqlmBhEmJ1lMmElS0vTHi1jwWQTYwy6Ias/Tt0Bs4hO6t1s96emJLAQ8ibv
 5iGtrndAYTaRchIt1vg==
X-Authority-Analysis: v=2.4 cv=KZ3idwYD c=1 sm=1 tr=0 ts=6a0b63a3 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=7a4_7rcHm0II5uOVc2AA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 9S1hKFAXGHPvcwNxk70ah5-9Idw1scvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180188
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108274-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 00DF7572B40
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


