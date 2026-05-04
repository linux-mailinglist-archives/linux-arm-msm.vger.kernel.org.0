Return-Path: <linux-arm-msm+bounces-105803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCthKc7v+Gl93QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:13:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4896F4C30C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D63730BE45E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:08:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF773F0A9C;
	Mon,  4 May 2026 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wn3GBvrJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2B5GD8q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6224E3F0747
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921726; cv=none; b=HalhQ8pWEwFjaASpKYxuAfcA0auvIBQcbHYW7A9d8LcrlzmskxqLj1f7Xu/soaP74z8YI8jOYfrOjs0JCMdra3ebxI+IEH6QPUyKdhTv/v095hJ96wPC5H6Q/Z1JP1KRetWduzvo6vbkWq+A4ofE7bGjWYweCBlukAIBPUcsPUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921726; c=relaxed/simple;
	bh=54SiiwIiDu5jCiPVBfargkA8Cq4AMd5thtK2yJft994=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1ZwSW7zbNJX8Rmt3w0ehVA67qRzRAQdN4Qq8l06XTOSquI14vdV6Ue2Em9vLsKzJOjxaXsGBbWNtEBcNL8T1QnpYpLb2xhksh2Elsk6cwX2KMV1G7S/QRyfrEYu44CRmi+O4pLWVVLapylOY8qXJJBqcW2tGFjHPWdl8C/bSq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wn3GBvrJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2B5GD8q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644J16o5636014
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OJPIWHLYmtY
	h2vRJzlQwHbA8ExzYkFh40ePWlyvRs1s=; b=Wn3GBvrJzKSU9RwPkJUnX9CvYv4
	LBGfMEj28DgRQPt+MQRkcO+OOqdA3DPaDEjXUzI8yo5qKovmxudQVpJQRMUaDZvB
	Bizim9nhsSpEPWg64aad8u4Rwd5veR7kkBsQroiTO3qn803U3Y8A2GIZ3w1UGMdD
	rMgDbipMc5XoOVlE0H3oe70SpFt3F5aFghXpL+yhoNOEs53949ByDth7wG3LM3Gr
	Oh3EWai9ZxDLKRN1oUkZZzhM8OA+v/Q8uQjAcTG1u+HmBCbz7YjzYXy8x711REnk
	b5n556S0nOLVzavKLLKL+HNoTP15w8ZwoAApLP5Lw3tD9O/fQeBz1twf77Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx49t5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8234c06a10so66873a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921722; x=1778526522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJPIWHLYmtYh2vRJzlQwHbA8ExzYkFh40ePWlyvRs1s=;
        b=J2B5GD8qiUKX6vnEcUzPEDBEzjQvMLHFlo82/BM04H1hDhT6Ha2uJDAi2MjjiqxVGQ
         qPdU51sl0YftBpdkO+W/Y7EFPKS8c4xBE0g8MAo4EqIM3nZflOSstfS687zQVW3h/zKL
         HRKcyl/Jd9QdgoKeVy/5Qzz4C9ZBhQxmXnU9h8HBjFIOn8TGI6YG4Irm+ECz+/XjNLrM
         o/kThbslip4JgxSMEvOqM5kaAcOWUGT0NiOSMcL6E4wKdgLb6V8WNYfVbtSZbmxCqC0Q
         9yzvkjOJa9vN05OzJzu6lNr+DSfNOrNavHD6HPsWFqZ05zFg/DXQVyTpJu9sO5d8tskO
         GRjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921722; x=1778526522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJPIWHLYmtYh2vRJzlQwHbA8ExzYkFh40ePWlyvRs1s=;
        b=NNl1x8/wp4TjXPqgz4lr9w/mJoyRNoA7H6X6QVl/6frYeGmOe8PZu/7ajFC1GjKS1a
         v2KaIpT6LVSweomgjoeNLwi4U4VM0hzozsREWJiUqxYyrWrcs9TtRpzcweCZT7gHusIU
         ObPkNgcdrn9B5wathVlDnIUbHR2WLdc2+F1VPH6MQDJBgNA5NnOM1rWfwzZjZovXSN22
         Hdj1x5+aGKRnHkdJ6/H2k2t0DP/1SIUeYqD2g+hC9uL6gNzoPEVSs74a4XhT6Oi30bLf
         3keauNg6NXLPVu4qNFYi9Mwqh/BunJrPTMsKN65du7pU1+1Kx5e7sKdqbGDvWkFbjv9D
         QZ4g==
X-Gm-Message-State: AOJu0YxRuGFnJ+AyG4MlRAQo/J/9GJLg3unVpxU0HRiVcYgjQ2BT4bsn
	LSm4oyNmqOHuYw7u0+3mx4ahSEmADSX8mf348MOqiksn3Ii3riUjavjrDwulKWf6u78L0gIRFmd
	IBvow8ewjO75CmUsaE0CycuLldix+FoTqd5P8akrkma9BGIldP49yGv/98Jb1S6c21rr7
X-Gm-Gg: AeBDieuAGT4BFGCVXwkNJ4qiNJca2VCbKn/ptNeXRdTVDzxudasBDmtBu2IgmvlLZ65
	+7hsonwtOFxREwfjHI8XkFsJqdh+w7/4o1gylo+DAOmG0009pD8JltqjGQ/vmH7OZEwLI25Kyn3
	jnyWh+u4JUzwWjZjwhAvEPsc/Uzyds3ZCOXeVbOGUN9CgTJQHiAC4e0Xy5ZRj7JyqMVzVT9bASo
	jClP7x93ZBare1JyR0V5/aK5+wFpJYwoWhaHiImXyfnzuKZ6FuMDaHX/KWag6nOcbIx1XP30Wky
	yI1mEVUssXUJ/gxxKvkibPVQT3mWaj1O5KSRgTUfnGOxtkac2pLIcUBSWRDuhI1yKrmu+79UHYH
	xxfzb48On3/iq5ukOr9cLs3NVWUHBLY+UbhqhSd5aoRc=
X-Received: by 2002:a05:6a20:2589:b0:3a3:90d8:fd7f with SMTP id adf61e73a8af0-3a7f1ad4c45mr11338465637.8.1777921721571;
        Mon, 04 May 2026 12:08:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:2589:b0:3a3:90d8:fd7f with SMTP id adf61e73a8af0-3a7f1ad4c45mr11338418637.8.1777921720906;
        Mon, 04 May 2026 12:08:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbcaa477sm10418922a12.31.2026.05.04.12.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:40 -0700 (PDT)
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
Subject: [PATCH v3 11/16] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Mon,  4 May 2026 12:06:54 -0700
Message-ID: <20260504190751.61052-12-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfX4mxR854MevEG
 76vdGCxgFPCyIukrfmTiRckVtv3TgU2xYYZruCZLNUObiiEGLHQptmUDyGrUe6/4axDQKMTR3bg
 myUr4BPwYTvPUhjLGDlC9zhQKnWgJ3hTEVD8c/5M/4GJcI+cZAq1/eeNHhHjuZYjzgJjYsce0fv
 QokuW2zk8Pr69wX58JHnQ7e2qCglm4JEjiHIKUdWvPqw/VB/UTEsMIBZGvY4Mcvv9Fo2MnBjWYR
 K18HM16B6DuWYZeqZBaErMMVLQbOLBXTmoK0fw/l3AQaxDqG8ldeXkk0iM6LPmT+AszbJtas5xk
 OhPlpEATIm5kR5PmxFPhfgEaf90QfDhDWqhalYCPAoY2toEiWXqmtEWMxgiAcgncAU0ZSvIkdID
 pniPwJsn4abMiiU5j3/lkafaGW0WJoLx1HJYeIPGuoHurciCPxdUbPGzGyPbgjAGoZjOryVr+s0
 XoBwW/mTngsru6t+8hA==
X-Proofpoint-ORIG-GUID: TfMs64GVMn9q-zqRlJKI7Njk-9c5T-kG
X-Proofpoint-GUID: TfMs64GVMn9q-zqRlJKI7Njk-9c5T-kG
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8eeba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=oWecmCczN8450n14xlQA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040175
X-Rspamd-Queue-Id: 4896F4C30C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-105803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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


