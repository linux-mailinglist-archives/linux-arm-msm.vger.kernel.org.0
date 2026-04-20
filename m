Return-Path: <linux-arm-msm+bounces-103851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qA09DYeo5mnTzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3307F434A83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 15CB9300B8F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 590A73D092A;
	Mon, 20 Apr 2026 22:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyOAyhUB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RjAc8PPI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA93CFF7D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776724050; cv=none; b=QZKDvwcQ18jqEDa7beXERqqHQqf04MZgBD2xjVnX/+FRofPdQf+rEG/NdKuwwLOWUkk+J7DVxLCa7548i+EiYRV9DaO+1MOFmBnMo4FKMmAgx8uvA9lv2s2rM0pFtOkuAXDaMJqad9pTqU6ZUZs9isgJuF4W6t/8BE5e5rUc3oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776724050; c=relaxed/simple;
	bh=OU61gQcrvFhBpxR2VKmPdnQYmEtAs3K5eYLJAXFzXTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLbJExHSbwD81ibqqC5Kb7t0cEaZ8xUILjzwakAUSGVj3F+v/1/kV7o5Km0MjYuK4F2ZKKpx3wWDm+EMbXnaHd80LYz24CgsCRDWEyFyMICqFO9tHqYa2c7fR+t9WCL2k5+qsBQw93vG1Pkx8kthXYTeP1GthdnEKPSf0y5SG9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hyOAyhUB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RjAc8PPI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFLpYr2755805
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2/Y0xU0H+zu
	dioSG94bHnT6saitjlexOXZQ/Yt0BEtY=; b=hyOAyhUB2I5hIXIWDBpOrfwKeVM
	3eZSwH7LZTTUJR5YGyr287ZCBRCKK1NuP5As0WbHvs2BcBEDANOnDeZG2Kpnz0ug
	QPPiR2dLeqceTK9JyfsU2PwnHJabvC65w7Sw0nMc9YSe0p7ysVbHapPpSemvAKjg
	7L8yWedjpEBUKrBkCF4WkD+GHqiLBZdGSl6iXAtJE9ZI03wDlLEY3XijPlB3SsiY
	6N8LXJ0rcjLEwe6cRgh8j3S7eeocmy2DFRSaRjWh2OuFdmzXe1J6mR2a6dlE1qDC
	/4zzGpVtHFWKWz6kdSDguKTrB8J0ROXlYAKTC/dUO/fBZgoG8ujlN8nL8PQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xjrud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b242062308so65225275ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776724046; x=1777328846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/Y0xU0H+zudioSG94bHnT6saitjlexOXZQ/Yt0BEtY=;
        b=RjAc8PPIir1RjepbDEe5lHKlZGGCi9lOwYv8CK/ddooYlr1J78zo51cxmLUw/QH+hT
         YI9VG26S+NCfSTp+ay3UCkHlcRaJY6OLuK8g3hjgDLcQ+h9FUQ9Z4tIbEwjzwUQMrY7P
         bcAzfwjtfhs2ubFJB4BPj9c2Q7P1+caIASpQWZG2Q+MF93OlVyrqSnrJQQoFL7Dl7Wyy
         D+j2g4P2XpUcUl2NRddnaoB2xTJ5sx7FUhpNtEHj6ho+lw3eGJxcS7y+eA8a7eTlcbyd
         lftiMmZu2ayCrdh7PtFy5CMdG8/V2G9DRGeIzuQ2KSmQDn0i4mrpIkrcR/DaHpAOPlyi
         qN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776724046; x=1777328846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/Y0xU0H+zudioSG94bHnT6saitjlexOXZQ/Yt0BEtY=;
        b=UR8m8aLdJWK6q7j0eYjskGuw8KVx24p+/NYowOiNsBjjUkzPRpvAtiulhd0QHpa4LL
         7tfLpYXI1yKMx7DvIeT0Com1nA4YF4XZ77r5FieYpFhZPypAio46zKZt7TqAhRhC0uT4
         OEgjbk/M0pxmjjOSLlKyRnkxIB2cgTcWp6kvUSECO13ChrtBtBYiG4khIkc+QVOdewXR
         izW6Sq7+w6ktqjyzhy0Ki/5e891GIvvGMiKAmkH7RlbkQVISOvzCecwxtiqF58ToqzgO
         hzpESVBaiskgc42egp4rQFeAkwtLP44JM+UvuczxbR6+VXxcgfn1Vka4vNI4FfVjqFNg
         b+IQ==
X-Gm-Message-State: AOJu0YzWcwEZ+aMuphVbsU2xTdK6Fj0dFgT5P6NHikcfq+qNIw+btKUo
	LZC+Vik/r9KJrxxt+TTpU1UJB56gQFZsPwKJt/JHgk5hyWzIb5hQeZYpQ8uW8yPCccnJwvsbLAZ
	siT78e4dawXZnL30EdRxqZiK0id6FF+SVeHlRvbjsrRaBWhn+AmL8x85Q2GJyB7/5K/gJ
X-Gm-Gg: AeBDiev9KBk5B4CEnDBT+VSRu1jf8UCKc0vsDf5Y+IZNQgJaxSHPUnXl5xCKzFswRKV
	SzGhYh3fCpAls2XlA1b2YECP+KagBgAdhCf3f3GCnktM6uDQO4U78ZoPTuVS5zmV62wPB9S2odM
	MfrQqxZBe8K1TE7o0Ye5SGPpN2e0tgbZkLil2k9Y580zvVeoeE6KFImrkbXF+Aq93uhG/l6cYMq
	X/FWGDlewH8a1Z+qjx32injutrLjuZkbdZ3Rcqge+0K9M2TBl9D4ZrbI9W9dnLAwUp/IH78AKOP
	GqiLmqDCSOQeQ2NIBU18mMv+PmMb99ZBTEYMbVg+sof0+Y8sQdSwcvQRUBQph6wUgtt7bvM6XM9
	o0br4pAWXm9ImVKChO8WIiheb23tn28qhkmegmjXbKgQ=
X-Received: by 2002:a17:902:7c09:b0:2b2:81aa:f6ba with SMTP id d9443c01a7336-2b5f9f4e801mr119262575ad.26.1776724046030;
        Mon, 20 Apr 2026 15:27:26 -0700 (PDT)
X-Received: by 2002:a17:902:7c09:b0:2b2:81aa:f6ba with SMTP id d9443c01a7336-2b5f9f4e801mr119262375ad.26.1776724045505;
        Mon, 20 Apr 2026 15:27:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff39csm115725225ad.4.2026.04.20.15.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:27:24 -0700 (PDT)
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
Subject: [PATCH 11/13] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Mon, 20 Apr 2026 15:25:33 -0700
Message-ID: <20260420222621.417276-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIyMCBTYWx0ZWRfX63j3qOfxNGfz
 FO3G9cNomyV/RICmOijWaPsOVCsg9FS1afbJplxAbguyHztvh7VCpGxlIELqpqBwpAS0U9yw93t
 MYq5RAFVT2GGb+Lo0A4pm9BlDVsQbnN3nws+qnSrFjCwOxR4SH68YqLcIsGAQVMslZX9VBwxMWm
 n76BnsLftiIFwK2sXFSzcwXsodAXMNSfqFFi+/snCBxgPxhJapQ4DqZTzv+DhPIwUi4CdLh3dbT
 W5Fb8COus4Kgv4ZHg4NZdDErloYS5GikjZUZY5u8ca+hIQLInk2gkDM0s/BZ6RscXhAkMsfkaVE
 34uLL5R1D6DFfdnOy3HqZtrthoTGBw3gXhX8/53mUxXUV1ujZX9HKkBiTlPQ5KyBnFJWsC9fKLw
 clZNHhdyLSowgY29f9OIxigpCK1RLCx+KypT2DetJ3F6g1HxaAMrhM5Pr3Y8OByNjTupP0EJVrr
 PXBhLIzDyY7gUaBUdBA==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e6a84e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=cYDoD9QTrnOhnChb1ZIA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5uoxFww_qzhBqCx-iS04jyyECmu-4HH7
X-Proofpoint-GUID: 5uoxFww_qzhBqCx-iS04jyyECmu-4HH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200220
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103851-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3307F434A83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support to configure counter SELect regs.  In some cases the reg
writes need to happen while the GPU is idle.  And for a7xx+, in some
cases SEL regs need to be configured from BV or BR aperture.  The
easiest way to deal with this is to configure from the RB.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 66 +++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 415902f6e5d7..0149eba403e4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2535,6 +2535,68 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static void
+a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
+			const struct msm_perfcntr_stream *stream)
+{
+	enum adreno_pipe pipe = PIPE_NONE;
+
+	for (unsigned i = 0; i < stream->nr_groups; i++) {
+		unsigned group_idx = msm_perfcntr_group_idx(stream, i);
+		unsigned base = msm_perfcntr_counter_base(stream, group_idx);
+
+		const struct msm_perfcntr_group *group =
+			&gpu->perfcntr_groups[group_idx];
+
+		struct msm_perfcntr_group_state *group_state =
+			gpu->perfcntrs->groups[group_idx];
+
+		if (group->pipe != pipe) {
+			pipe = group->pipe;
+
+			OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+
+			if (pipe == PIPE_BR) {
+				OUT_RING(ring, CP_SET_THREAD_BR);
+			} else if (pipe == PIPE_BV) {
+				OUT_RING(ring, CP_SET_THREAD_BV);
+			} else {
+				OUT_RING(ring, CP_SET_THREAD_BOTH);
+			}
+		}
+
+		const struct msm_perfcntr_counter *counter = &group->counters[base];
+		unsigned nr = group_state->allocated_counters;
+		OUT_PKT4(ring, counter->select_reg, nr);
+		for (unsigned c = 0; c < nr; c++)
+			OUT_RING(ring, group_state->countables[c]);
+
+		for (unsigned s = 0; i < ARRAY_SIZE(counter->slice_select_regs); s++) {
+			if (!counter->slice_select_regs[s])
+				break;
+
+			OUT_PKT4(ring, counter->slice_select_regs[s], nr);
+			for (unsigned c = 0; c < nr; c++)
+				OUT_RING(ring, group_state->countables[c]);
+		}
+	}
+
+	if (pipe != PIPE_NONE) {
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_SET_THREAD_BOTH);
+	}
+
+	a6xx_flush_yield(gpu, ring);
+
+	/* Check to see if we need to start preemption */
+	if (adreno_is_a8xx(to_adreno_gpu(gpu)))
+		a8xx_preempt_trigger(gpu);
+	else
+		a6xx_preempt_trigger(gpu);
+
+	a6xx_idle(gpu, ring);
+}
+
 static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
 {
 	if (!info->speedbins)
@@ -2753,6 +2815,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
@@ -2786,6 +2849,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
+		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
@@ -2822,6 +2886,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
@@ -2852,6 +2917,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.get_rptr = a6xx_get_rptr,
 		.progress = a8xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a8xx_gmu_get_timestamp,
-- 
2.53.0


