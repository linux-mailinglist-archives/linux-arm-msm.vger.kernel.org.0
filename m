Return-Path: <linux-arm-msm+bounces-108851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JnsOG3qDWrM4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:07:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B4F592F4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:07:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BAEB233CD64F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A173F1AD1;
	Wed, 20 May 2026 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMfwhwjR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjEylkrp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422693F23C5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294349; cv=none; b=uRmwjNxGY1c6abw+GJvJN36AzVTGHdOFxOY5dbTia/qFGtI2WrdKop3v1EfFNUzCd44IRtGM39xyZtJ/lYSJWahwp1Da9QL1+TvCVpzx6nlqQI5bYA4UkYD6Ara578Ybu02zgg1IV+c85vqBMfd5QwhWourOnSQrj2ViYhgFxJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294349; c=relaxed/simple;
	bh=tWIhJ8B+5EdOwL5hDRI/KDJJpq6VqXfLT36CQrcR/bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N0jw0hmhZ4xaVE/DPjKjo7BeADVuVQmslbOEROA12/qk90dllGPC4X0khJor8lCfuwlc0itpaKzEOXh5+G0pMJNi3pYsMCpBQnZH+eMH5nMxRyaNOh/uIFPAdZ7ZtAK+yDJm3DemPmkcCFU4n8OUEeNjAL1qCSCta5krgyDay3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMfwhwjR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjEylkrp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KE2Oef826612
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eQpOa6u5peh
	EXhgKaP9zGHIawzycu5fhkque6ul5cd8=; b=cMfwhwjRkFIzTCngjoAnymda0Gr
	sAoBfkm0HJbsaUbondGJvFfKNb4isg5rDuy57U2KtaliDP4XkvorUYj7fdQERptA
	mRgRaXdgBqa43cUS6OxjciKaPJucXPC1x7YeNjULOkpRvflVM6A9x2Pf3k1snUR1
	OqTh3Y4XDIfGrptAxiD697Rqm4QyhtAg3LY5RoDVAvQIxzwHFDX7709vO9Hu8Ngv
	ti5eC2IUIcSC9sgTF4gXmVCPO1NJiLXBn0Sr2eqx1ucvCsquZANL9j5UkqglYyPV
	5+CbTN2fSYs3pM4ySDv9VZN95M5oIRw2n3c7ItSXEMoJydODKTGEFa7astg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ecagmjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-368b01f8adeso7111590a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294346; x=1779899146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQpOa6u5pehEXhgKaP9zGHIawzycu5fhkque6ul5cd8=;
        b=NjEylkrpXZLO9JanIIN5IjWBWBRjTrVbK9Ox4j1If0SWF/aLlocBWUwp60b+Gd8J4t
         J+QRd4mQ3i3fC+eCp0LRwkwAOjIqLQ2bZrrOAAVol59DoFHNN54T78+TZpxdtMvCdhkR
         njsA+nPcQeE2KzZbnmaGe8akgSMKVHf9645bC6zWL8TQ/ZrybSuo2WKQc3tHplrL7Yec
         5pRY1eQBd48Fa1OqsnM2j5R564UULDyvsyMz3g0Z07gAct1lmlULzEP+lCpbOvPcab1g
         oqFvaTRBg7zGcLZjA/Ovcig2fH4Q3ilBcuHSx87zRvrZnMtb3j5OnJwhvwK3sP+5jVrw
         KoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294346; x=1779899146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eQpOa6u5pehEXhgKaP9zGHIawzycu5fhkque6ul5cd8=;
        b=M5QWQL2ACVFkn4rib6NsDD6K8NUES/ffgv8TLHTzOedUc1p++NFZI7Ki/8F78T8Hyk
         1iHlMdSH5aYyT8imgwuMHyp5vHuOJgUbCkFbHMjyuR0N2SYpxiHf1IYBYAEQPCojaGgr
         P39w2pp4Q4aonpf/FlQcV93tl4sVRQ+8Cxr9jgtI62W+gtwx3RtE60iVZ1QSxeRpbIFx
         v8MtSCIJLSzgg9LeeY+WKZ1HAbHj6R+tkn9Ge1IfpSYxppwmb0h/U50z1LxLmezmuRWJ
         ccwRmNTE4cksNQaBsajI/FS5NpRX7IOSy1wyn9D2v33qBm4GgqLPGb9WC8N3BjZKIGj+
         dXbQ==
X-Gm-Message-State: AOJu0Yx6HOAFbOZntIzztaP78UJF/LbSIoFUUCo43tlT8hZ53DhHPE6y
	z3BwHw0sBJsmjJd810mkqOqDJAw8Up5PStNrAK8t770tSrsN3sJaCr8Y3s58J7kk6jrM3zSwpQs
	wDNVKBKss96da7tZtXnVRkx73+1NOFLL/M/oxK34CJTyhHfV7vIuUqUt5e50WsdC0zZm9
X-Gm-Gg: Acq92OF+L0oju076ClY2OVIcwg06maUjGY9DIOuHrVNUIE03FkwgsyIjuhDfqLxPcZT
	HnUr0SVriV9WoRnVakmAnyM5t63C7g2fPcGOv+P1GwYvyAtdoMs1UPOtpX3J61aGgvsEn6dQi8K
	EVYA0nOtMDRY5AeZ6Bu120BFoELp5g2Gh3FQaLz7+3L2WumSs6PhlDVZ5+WMBAKPhwxy5F7RNoo
	uGP6v2at4FVhFWNScFQMEc3+CNUDaoJD2GZkYDsBYLEwiZ+gKaE6BhrcdNSA0L897CnH6oq7Sv9
	z255wusGorLzogTh3/1Ts+GmlqwXy3znCwx8nHHB10Xsumuk3dLW4nKabx7Gm2LPwIcrql/2lc6
	6CY552rWJxor+FvicB3EqK336/HiwL98czsr5Tvfw9LY=
X-Received: by 2002:a17:90b:56cf:b0:369:a74b:28cc with SMTP id 98e67ed59e1d1-369a75a769dmr17241202a91.18.1779294345488;
        Wed, 20 May 2026 09:25:45 -0700 (PDT)
X-Received: by 2002:a17:90b:56cf:b0:369:a74b:28cc with SMTP id 98e67ed59e1d1-369a75a769dmr17241183a91.18.1779294345021;
        Wed, 20 May 2026 09:25:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369703bcc91sm7801065a91.3.2026.05.20.09.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:44 -0700 (PDT)
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
Subject: [PATCH v8 15/16] drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
Date: Wed, 20 May 2026 09:24:02 -0700
Message-ID: <20260520162454.18391-16-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: Re8ofOMwitrTvUZmK39PZYezkypS4YKE
X-Authority-Analysis: v=2.4 cv=WqMb99fv c=1 sm=1 tr=0 ts=6a0de08a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=gjKahejJLxXXi_JFjLAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfX+6gFJ6MSjMwh
 cePOsu4D9eFq3rL/TFPzC1FZ9mhM1/yqC5Tl+4wAFU1G86dOVu6Tra4mcqDoWsU2PSWYyA/7I9X
 vChkRmopBFFCDs4Q5qeG46Als79O6qtNPh6r9ewGPTMyWl7+p770kbhMNHBNNgo8jlw59vRQQVE
 u5If58gKSCYPDjO07Wbo0Myn0L3uFT3SxbX9nZ0Qm0HxlY6r0rWPZYBnz7Ng1bEra0dHfv4Mw1a
 1IMnCYHy19zknTApJXtC+0G6GVh9tD6+IpCGNVYnFOSTnaH1vzbAhlZqmK/63OhXEy65UP9GBB4
 aeKLU9qNiYl54tXns2qL/j/Br72cHYRkuL4zJSCdOMVoZEZdBEEgizI+w1RoWGD0qboh5kyE1S8
 ZT/17wagKoP3dXvln77ZOSasR1bKaXvjdD30b8WepWRmCP668vJxfDI80ERhrM5W4JMWiCOx/NM
 uMIQqvAlscX6XTmR4ig==
X-Proofpoint-ORIG-GUID: Re8ofOMwitrTvUZmK39PZYezkypS4YKE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200159
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
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108851-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64B4F592F4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is needed so that SEL reg values are restored on exit from IFPC.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 +++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  1 +
 3 files changed, 87 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 61c6b0e781ce..c697a4bdf203 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -946,6 +946,7 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(PIPE_NONE));
 	}
 	lock->dynamic_list_len = dyn_pwrup_reglist_count;
+	a6xx_gpu->dynamic_sel_reglist_offset = dyn_pwrup_reglist_count;
 }
 
 static int a7xx_preempt_start(struct msm_gpu *gpu)
@@ -2535,11 +2536,60 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static void
+perfcntr_select(struct msm_ringbuffer *ring, enum adreno_pipe pipe,
+		uint32_t regidx, uint32_t *countables, uint32_t nr,
+		uint32_t **reglist)
+{
+	OUT_PKT4(ring, regidx, nr);
+	for (unsigned i = 0; i < nr; i++)
+		OUT_RING(ring, countables[i]);
+
+	if (!*reglist)
+		return;
+
+	for (unsigned i = 0; i < nr; i++) {
+		/*
+		 * Bitfield is in same position on a7xx, but only 2 bits..
+		 * which is sufficient for NONE/BR/BV:
+		 */
+		*(*reglist)++ = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe);
+		*(*reglist)++ = regidx + i;
+		*(*reglist)++ = countables[i];
+	}
+}
+
 static void
 a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 			const struct msm_perfcntr_stream *stream)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	enum adreno_pipe pipe = PIPE_NONE;
+	uint32_t *reglist = NULL;
+	uint32_t *reglist_sel_start;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		WARN_ON(!a6xx_gpu->pwrup_reglist_emitted);
+
+		struct cpu_gpu_lock *lock = a6xx_gpu->pwrup_reglist_ptr;
+		int off = (2 * lock->ifpc_list_len) +
+			  (2 * lock->preemption_list_len) +
+			  (3 * a6xx_gpu->dynamic_sel_reglist_offset);
+
+		reglist = (uint32_t *)&lock->regs[0];
+		reglist += off;
+		reglist_sel_start = reglist;
+
+		/* Clear any previously configured SEL reg entries: */
+		lock->dynamic_list_len = a6xx_gpu->dynamic_sel_reglist_offset;
+
+		/*
+		 * Ensure CP sees the dynamic_list_len update before we
+		 * start modifying the SEL entries:
+		 */
+		dma_wmb();
+	}
 
 	for (unsigned i = 0; i < stream->nr_groups; i++) {
 		unsigned group_idx = msm_perfcntr_group_idx(stream, i);
@@ -2567,17 +2617,15 @@ a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 		const struct msm_perfcntr_counter *counter = &group->counters[base];
 		unsigned nr = group_state->allocated_counters;
-		OUT_PKT4(ring, counter->select_reg, nr);
-		for (unsigned c = 0; c < nr; c++)
-			OUT_RING(ring, group_state->countables[c]);
+		perfcntr_select(ring, pipe, counter->select_reg,
+				group_state->countables, nr, &reglist);
 
 		for (unsigned s = 0; s < ARRAY_SIZE(counter->slice_select_regs); s++) {
 			if (!counter->slice_select_regs[s])
 				break;
 
-			OUT_PKT4(ring, counter->slice_select_regs[s], nr);
-			for (unsigned c = 0; c < nr; c++)
-				OUT_RING(ring, group_state->countables[c]);
+			perfcntr_select(ring, pipe, counter->slice_select_regs[s],
+					group_state->countables, nr, &reglist);
 		}
 	}
 
@@ -2591,6 +2639,28 @@ a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, perfcntr_fence)));
 	OUT_RING(ring, stream->sel_fence);
 
+	/*
+	 * Update the pwrup reglist size before flushing.  Kgsl does a shared-
+	 * memory spinlock dance with SQE to avoid racing with IFPC exit.  But
+	 * we can skip that since the ringbuffer programming will be executed
+	 * by SQE after dynamic reglist size is updated.  So even if we lose
+	 * the race, the register programming in the rb will overwrite/correct
+	 * the SEL regs restored by SQE on IFPC exit, before sampling begins.
+	 */
+	if (reglist) {
+		struct cpu_gpu_lock *lock = a6xx_gpu->pwrup_reglist_ptr;
+		unsigned nr_regs = (reglist - reglist_sel_start) / 3;
+
+		/*
+		 * Ensure CP sees updates to the pwrup_reglist before it
+		 * sees the new (increased) length:
+		 */
+		dma_wmb();
+
+		/* Update dynamic reglist len to include new SEL reg programming: */
+		lock->dynamic_list_len = a6xx_gpu->dynamic_sel_reglist_offset + nr_regs;
+	}
+
 	a6xx_flush_yield(gpu, ring);
 
 	/* Check to see if we need to start preemption */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 3491a24a9320..f3cc9478b079 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -21,17 +21,19 @@ struct cpu_gpu_lock {
 	uint32_t cpu_req;
 	uint32_t turn;
 	union {
+		/* a6xx: */
 		struct {
 			uint16_t list_length;
 			uint16_t list_offset;
 		};
+		/* a7xx+: */
 		struct {
 			uint8_t ifpc_list_len;
 			uint8_t preemption_list_len;
 			uint16_t dynamic_list_len;
 		};
 	};
-	uint64_t regs[62];
+	uint64_t regs[];
 };
 
 /**
@@ -100,6 +102,13 @@ struct a6xx_gpu {
 	uint64_t pwrup_reglist_iova;
 	bool pwrup_reglist_emitted;
 
+	/*
+	 * Offset of start of SEL regs appended to pwrup_reglist.  This
+	 * is equal to lock->dynamic_list_len if no SEL regs are appended
+	 * to the end of the dynamic reglist.
+	 */
+	uint16_t dynamic_sel_reglist_offset;
+
 	bool has_whereami;
 
 	void __iomem *llc_mmio;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 6c040f718176..2ce7c6ac4521 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -468,6 +468,7 @@ static void a8xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	}
 
 	lock->dynamic_list_len = dyn_pwrup_reglist_count;
+	a6xx_gpu->dynamic_sel_reglist_offset = dyn_pwrup_reglist_count;
 
 done:
 	a8xx_aperture_clear(gpu);
-- 
2.54.0


