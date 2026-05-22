Return-Path: <linux-arm-msm+bounces-109388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BWPCNmWEGqBZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:48:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 725155B8824
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A188E308DC7C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90C037CD21;
	Fri, 22 May 2026 17:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nhiv68V7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fJmIOgS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC2B379C40
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471308; cv=none; b=JKUVugi3X4tA4WZzNwdgMgcn8znTjjEmuHUjp5NMU1ek6y1ozqDWU+5guB2JaRFwluZ9JKoPaylQAj/3JDery0hitzB9b7bo60bvlRh7mLGuov6vbp5geoYTObkim7am4bBDtdJ8BeFvXwSSNvpRWnJqJUX1MucD59Z02rt1X2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471308; c=relaxed/simple;
	bh=b40BHbOfSg07/gxw3Tyz2UHI27x2OYYbIZG4BOlfw4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oPQNw9lWSLt0rDrdsvo6365zkHT/NymqfdMEeZcCDoq2BRzSmDWXGJ8pqbK15uN8Yp/1u5gSa3ixcB/zvWwpOy9tF61s+a9H0ivqh55ikqoTjOSzXH06diDKT91wTU6ZYhkNbIgbyLuhQ3c6d9Mm77RX1HZlsa/aP6i++QR1N0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nhiv68V7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fJmIOgS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MGanBw1733041
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OlrCc+t7CrC
	NbDyoSUL1NFgB6ARlkR4nNT8vRThHknA=; b=Nhiv68V7rCVQ3U8Ans1Lm6y562y
	EhvIb6H7KflZ+dkr60GemDETvYGH0/cK+plN3QqzLrmpZfh405aqjPBJVmQE4oyR
	6LmDw1M3k6Jcjmfd5Ur3xxdi7KwS8jDM0DF2n1w4EORYKnUnkqJCO8EEcYRILqU0
	lixsHnoaPOzjQNB0N07DdZcJdEy2G+BgjlwxqwCVR+YUTLCZaQbRb1bjQcI214xF
	oNzYEJvVblzxP1Ks8NxFKWuS2AggvOi8+aUxTuuDC6zxA3OwQ1i44SA72ZaExLKe
	kBYyjrkosNzGn8tcuY691bP6LIw1jr02jGx+msZh+7eaiFpUys1icd4tk3w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eattq8859-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:35:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc763c7256so170135445ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471304; x=1780076104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlrCc+t7CrCNbDyoSUL1NFgB6ARlkR4nNT8vRThHknA=;
        b=fJmIOgS0aW+xtPdxohUBA7X8W86cHqbcQeIx/j4UBBeWF7mT411WQfsU/V6FiRT6/J
         /LIM6HfpeaPWn6WQUI1JP0M6yO0FD/yVozmz7h8RXv5u2X3Y8NyQUjCPl7Bw8skyhNMU
         C+/PGKccPnsun1aZxyzmIb3SeN1JqY8olSxjQjFj2QW6gGV0Qr/qlR8CUAAcGNx5PM+C
         FwRnadC5vKpxY47clL/tuE7XWX0jKrFSQLQC3PsbgbwOkeevEfdFJCiJ9mVF5tEJB3Un
         40mCJhr5W4+PbZBNHqFzRE+URaRBWqOl5P7af/yRJ9MQMxZu7MhuH+3R6Y3eDF3whJO2
         CffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471304; x=1780076104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OlrCc+t7CrCNbDyoSUL1NFgB6ARlkR4nNT8vRThHknA=;
        b=qMTGhwyu3eESa/DQ5M+C3fJ2OM7pcrV26ij6dj85RdjuE1+wfPgxLqgDk2tEVUlOam
         gr3S1/n116XMV4j+eAdugNgRaQI3viZKPO52NIYbn3M01CW82myyYhkWQVMJ/L/Z9RV0
         zsPGJd80TdMzdoMcsabZYoYdYHAHUhIW2abKBXhzlq+eWqpp+GgOU0igI7OpuJqR81/F
         JaGOOCdQA/dGfkVANfqUOjhAFUwujZF37zfysWfr0kCuu3fK/otzyCL9K0PnCbsY6u1F
         7QtOmO4g2kzd92raJhk9f983SBM4SZ+2Siege/BjcuxNtCe/Ur/+a4P1J+lQ1Yotwb9p
         02Eg==
X-Gm-Message-State: AOJu0YzkDG55c/xedF/3xPJp+CtD+HYc4dY+oDD03M9oY7tSMzhHDkmV
	OslwVn0muZEwBxucmQPCXTIamx7pnHIcmH1riH/flceJLNYz2JlgIbNgLnnRHX6m9iIoT89AHNU
	9WaxUvOG4x8yq2/vr9aZF29ZQTc+FH3/nwZ4ZRQl2LpYKhRdxt+TRIhyjpDyLMzQE5KgW
X-Gm-Gg: Acq92OFS7wHC6hxioqLpy5nd9+K83EIR3eP7VgbpqLJK9TArzzh9EFJkzvIBCNXfKKp
	d2kDxuv91wyBuKuB3RDNqoriK3HNf/ALsmGe0mkc33FVWBxBBuw8tgNSr9LAR4JpE7x6ZzIye/6
	/F4SjJJHkk9HhhabyumVLMkqc2SkRGbYKpbyuqnY+W8jH7iQ+ZkI8kINYzgPwytEfWSY03rmBgk
	SZcCyWtlBTfA3Mxwiar+6HDpSiGCy1DG8QWuFhtzJEqCQ1173LxKlSo9KleKnkrBrtV1+K+5SPo
	pWdmrMlo60eCqUflO6Baghtyu/TT5mkPRpQ93QJDj4IMbXsMWqSkZn2xEij3WjZGZEh74VA3Fm4
	73zuskgNnLyNK0NS1qhArdP6b6yPZxIIb
X-Received: by 2002:a17:903:2f03:b0:2bd:eeb6:ff28 with SMTP id d9443c01a7336-2beb0672a53mr56265385ad.12.1779471303802;
        Fri, 22 May 2026 10:35:03 -0700 (PDT)
X-Received: by 2002:a17:903:2f03:b0:2bd:eeb6:ff28 with SMTP id d9443c01a7336-2beb0672a53mr56264985ad.12.1779471303286;
        Fri, 22 May 2026 10:35:03 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d750asm23344045ad.33.2026.05.22.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:35:02 -0700 (PDT)
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
Subject: [PATCH v9 15/16] drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
Date: Fri, 22 May 2026 10:33:01 -0700
Message-ID: <20260522173349.55491-16-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfXxkUtPosyw0fH
 JDIpbCG194VTOb4qv/quNjb6RqxEgwkzm8IQ5GXwSWCGI+gcLeN8t3AC/MPskuE7wB6K67xu8lo
 lP6TV9s6v2SvRNv0ovrjW0mc1YLDhcht2uYeBa4bEbynKZ4ggpS/Y66waYrlSFTRB1Ifh9YdBXr
 uFJP0sb0JddcPn2KHk857jnQjGKpBxly/shWh1r1P+1Pwgiuf7MTDGjeQzDEw2JQQvnqUpG9mMk
 vDQhle74o1WlawTr9lgJfaIkxVLl1XuZncv8bFDXuXpQq0VNV+Ug9cLenh5PtSbjtxkVJH5RAvS
 gBAjWi+/MtyUIlsfnP9NBSzJNGhKilNzKxsOlDZ09sblvvfUnQhVpL9yfgoMSsbDmmTXBopxAu6
 /W3Vt66WBOXUWcHYt4HmScNoEF+JjasKI7dlwP8d1QMQbGX0ACvxSO1o2aCIN6XxTYfrU+I3Evd
 8AybvUdUQG5Xs4puFDA==
X-Proofpoint-GUID: 6t2vlIW8rjs7bJyZJANMm7hMZAVhQP2P
X-Proofpoint-ORIG-GUID: 6t2vlIW8rjs7bJyZJANMm7hMZAVhQP2P
X-Authority-Analysis: v=2.4 cv=S/zpBosP c=1 sm=1 tr=0 ts=6a1093c8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=gjKahejJLxXXi_JFjLAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109388-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 725155B8824
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is needed so that SEL reg values are restored on exit from IFPC.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 84 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 +++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  1 +
 3 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e6c362c55dee..af524130d5c4 100644
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
 
@@ -2591,6 +2639,30 @@ a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
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
+
+		WARN_ON_ONCE(reglist > (uint32_t *)((uint8_t *)lock + PWRUP_REGLIST_SIZE));
+	}
+
 	a6xx_flush_yield(gpu, ring);
 
 	/* Check to see if we need to start preemption */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index d3f0b40787db..b72fb58bf223 100644
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
@@ -101,6 +103,13 @@ struct a6xx_gpu {
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


