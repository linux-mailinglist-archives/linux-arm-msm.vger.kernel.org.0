Return-Path: <linux-arm-msm+bounces-106163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCjnKZd2+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3162D4DEB33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D0AD0301AB87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83CE4B8DFC;
	Wed,  6 May 2026 17:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a8Y82Mf7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ydo/cL3r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED74A33FC
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087538; cv=none; b=Cp1znJcTObl398UPhEgWPczAk9kmXZ6lWdiDoHWL978JkrSaCA48BaeSwQkX6ljQhDKBPpdqm7APsixSOiDdk5IRfk1LTdbMSUAssR08viPyIO9Rfx+1pJL+99G887iG3rm0quSi0s1jHRFOqgl2FB61XoYd367O2KVBPIRz6tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087538; c=relaxed/simple;
	bh=54SiiwIiDu5jCiPVBfargkA8Cq4AMd5thtK2yJft994=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5ttsHX6IFEbsWmQIDI2UdrY+LjhcnWeu78jh0htxi93xfjgt5Sc8/p+FM/BPk7/UVyomzRSM8IIwDRzJT0SEzcbsIverYU6gzBh9sGrTyC2IiGAkuFKXO5Rm0QIhfljRSMlaStJhWXWe07kOt94NW2MhbURzLKYYAS/COvHhi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a8Y82Mf7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ydo/cL3r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646GmX3m1953133
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OJPIWHLYmtY
	h2vRJzlQwHbA8ExzYkFh40ePWlyvRs1s=; b=a8Y82Mf7GdXaBGgPOsz/5d+9o0y
	Avtbc4RvcBqDN0+mUu5u1qJ3oFIpObEEqzGcJf7akRr2Nw05gUD5Vns6bO4mZGri
	ZZYa9geSMEYnhR7b5yKWjGttpOnQY1v+pxC16l3SaRRw+8TzAZkG34MnLh+HgEee
	u9a6WsGkENCN2Usqa4TADB18rgz6VCeIxM2SjMnjrWXoVWQ82/ok8HX+9NdEqvfm
	G8trLgHz/WLdfXtjoZDMzyASDL0o/s0jhJKVNhP6WWUkQ2Hz1l56Iwow7J4hPRS7
	Uvn5XUlMXIvVstJVzHrc+3FiRL9nkkf6s98xmRt1m50ln/fbZrN+uaxUUiw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e03jc1mke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:12:08 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b4530a90fdso113089845ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087528; x=1778692328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJPIWHLYmtYh2vRJzlQwHbA8ExzYkFh40ePWlyvRs1s=;
        b=Ydo/cL3rQqpQZ2ccNMnjfqtQ4Ll56p5I9/otOD42it/br4w8lpFK52fYTqtMDh5DtG
         nAg7uLSHZgdVDACfKazJLijiGA3pbNR7XIK3As5jIddAI5b6aju95MjujDuQVt4v1Cnz
         mpIrLckv2fjT9Bn3VmjkDfe5AoqgK1T1jzhvtaAiGpVhHXrO5/+TFUgQjHZ6FyMchlWI
         2rl4AhhizCSSty97HDlNAWpuuNtN6Bb6b8UQQQWBeLuzRQJKg9bIVK86Rziddvsxo1wK
         U2apNlk4Y9k5JoLHdVpgQefnTeu9NRhXgPGppH2gXXgon4PuznBD3wBOWTFhizua58kt
         tjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087528; x=1778692328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJPIWHLYmtYh2vRJzlQwHbA8ExzYkFh40ePWlyvRs1s=;
        b=pm3nP945VnMQmjkDInetBJB7avpYyQ/Y8eK/tpo3tcQgwUxsuI9Epd0YH47+hFYBXP
         mhbQ3cFl2j4wTryZeeK4gUDIk4RqfD/gzFH18iHZ1nWXVtZMHJmg9O+h2NPawEnDRfHZ
         ODaDa7poXGckX0uw/Qkh8kUn2FRsbV8jcT8ObLRAurYWFTtyrcK2u7Jj6bWJ8hPAXFIE
         OX7UEzciYwcsO/4xo3uOnNunX9G5/favfjCN4H/TJG5RZCgvr9Xdqwcm72ZJC5gOwh//
         Oe6xLk4/hT81a9pvWlou8kpQGJCieQ49jF5duhYqJWKZ2AVptN0PMt1z9K7oxBCLh9w8
         rfUQ==
X-Gm-Message-State: AOJu0YyLlMfHFORH8dhVnTUp4FPNRNqENYAmooHfgYJgOruDM7toR30H
	lxZHUyg/RoQW/bNoTCXC9UVroRENLsOk7kx85S5+vg8jnnnoy0j+tKJwkt7BeLth9y4kGw9F7G+
	/aT42VUbTpiFRvi9TKmbMZOsWI42iqC8uas1jRx1tBukWlfeP9LrrveIlyrqZsWfoOXat
X-Gm-Gg: AeBDievX6gI6qbcEgKVITzQF81ebVBuDc9uJtqWkiPXEJlcMqIg8ZXHsWHfbAjpYaBr
	2ccByYlbDzpGrKDB/lauVaBDwi9yZaLKDBiINuOZ/fzurO1V3OhR4d45RFTCN1PZRIlmCiOtCko
	exH4WVYdbqKrY5q1N5WLpmqeiLYQSMkimyiLXZWyinAU5Lc8bepFGwO9CuAQKNdQFGWo9pbSmtS
	w9lLCsP0zIn8G5SvHmGXh543UjP1ZdCKnk4vc0KudoaVMyjcQgWkAZW96NX3WKO15ZTnhwzHsXF
	XcHoptKTF81SyxF7KyXHI7kYVbaLMmr0pEndWRNLgq1NZc9DeJCWifj1TpNLIqZPJK5RFx3I6oo
	IQjQhFBSPqJHQxrfEDy1slKkEt7HmB4clo3WFnwGL6gI=
X-Received: by 2002:a17:903:1b10:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2ba7a20ce22mr42688465ad.28.1778087527874;
        Wed, 06 May 2026 10:12:07 -0700 (PDT)
X-Received: by 2002:a17:903:1b10:b0:2b0:bebb:1081 with SMTP id d9443c01a7336-2ba7a20ce22mr42687895ad.28.1778087527221;
        Wed, 06 May 2026 10:12:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7c033711sm32920865ad.33.2026.05.06.10.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:12:06 -0700 (PDT)
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
Subject: [PATCH v4 11/16] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Wed,  6 May 2026 10:10:35 -0700
Message-ID: <20260506171127.133572-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
References: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX4ZpeEyjbwJZd
 qaWvcOpBg2PHex7fKfiMTJoki4NiW4wgVF39T51FXg1a7AF6YO+ozc1Ue5kUwS3zyXNQ745TpBw
 EmwZvN40NTC6KZ/Y9RsKX8aSVj0WZymlG9DSjsZDwNi/9QFqz+6czXhC5inT+p96JtsPOuQlLRe
 RsDqC9b9gHdBkNyLOWH9jE568TGbPvF7Ir0wHs1HBgvBHw6vUkYhpn+DxTL33KbY1DDQt4h+aLU
 rmWkqqeZ0/cjpphQ6LPza558LWJ0nbl4tS4RmEPQ1dkqw8MAyHNKA+DVYBFykBoIDKSWePS8EfP
 W6cH1ZHt/Qjg1fmCT182Ef/d7cWfSF9G6BC7C6vl0cGghT226kNU9B+BA/ZBXfaAK3Ff+2G3wK5
 hDgxn0PKcY4784dztTxcRgU46c1alog/IZdPRN0iImcpa8/pruIFOqWW9TygIxk5ma4Wg+UFuvm
 F7SJYtiA/KrMbYGvWYA==
X-Proofpoint-ORIG-GUID: eEaUrT0lkTw1U5_RMpmBryg_6AdsnPuq
X-Proofpoint-GUID: eEaUrT0lkTw1U5_RMpmBryg_6AdsnPuq
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69fb7668 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=oWecmCczN8450n14xlQA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168
X-Rspamd-Queue-Id: 3162D4DEB33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support to configure counter SELect regs.  In some cases the reg
writes need to happen while the GPU is idle.  And for a7xx+, in some
cases SEL regs need to be configured from BV or BR aperture.  The
easiest way to deal with this is to configure from the RB.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 69 +++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_perfcntr.h    |  3 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h  |  2 +
 3 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 415902f6e5d7..30df9bfa9ef8 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2535,6 +2535,71 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
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
+		for (unsigned s = 0; s < ARRAY_SIZE(counter->slice_select_regs); s++) {
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
+	OUT_PKT7(ring, CP_MEM_WRITE, 3);
+	OUT_RING(ring, lower_32_bits(rbmemptr(ring, perfcntr_fence)));
+	OUT_RING(ring, upper_32_bits(rbmemptr(ring, perfcntr_fence)));
+	OUT_RING(ring, stream->sel_fence);
+
+	a6xx_flush_yield(gpu, ring);
+
+	/* Check to see if we need to start preemption */
+	if (adreno_is_a8xx(to_adreno_gpu(gpu)))
+		a8xx_preempt_trigger(gpu);
+	else
+		a6xx_preempt_trigger(gpu);
+}
+
 static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
 {
 	if (!info->speedbins)
@@ -2753,6 +2818,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
@@ -2786,6 +2852,7 @@ const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
 		.create_private_vm = a6xx_create_private_vm,
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
+		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_get_timestamp,
@@ -2822,6 +2889,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
 		.get_rptr = a6xx_get_rptr,
 		.progress = a6xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a6xx_gmu_get_timestamp,
@@ -2852,6 +2920,7 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
 		.get_rptr = a6xx_get_rptr,
 		.progress = a8xx_progress,
 		.sysprof_setup = a6xx_gmu_sysprof_setup,
+		.perfcntr_configure = a6xx_perfcntr_configure,
 	},
 	.init = a6xx_gpu_init,
 	.get_timestamp = a8xx_gmu_get_timestamp,
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index bfda19e01535..14506bc37d05 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -45,6 +45,9 @@ struct msm_perfcntr_stream {
 	/** @nr_groups: # of counter groups with enabled counters */
 	uint32_t nr_groups;
 
+	/** @sel_fence: Fence for SEL reg programming  */
+	uint32_t sel_fence;
+
 	/**
 	 * @group_idx: array of nr_groups
 	 *
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index d1e49f701c81..28ca8c9f7463 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -37,6 +37,8 @@ struct msm_rbmemptrs {
 	volatile struct msm_gpu_submit_stats stats[MSM_GPU_SUBMIT_STATS_COUNT];
 	volatile u64 ttbr0;
 	volatile u32 context_idr;
+
+	volatile u32 perfcntr_fence;
 };
 
 struct msm_cp_state {
-- 
2.54.0


