Return-Path: <linux-arm-msm+bounces-107622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ESTDH3UBWpUbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:56:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B958B542A0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3F6D3302E3AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDDEF40B6D8;
	Thu, 14 May 2026 13:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqbXjaWf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gTOhkfBZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D103FFAAE
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766879; cv=none; b=ETo9Gvf8YgSrUG+cKux3WaH73goPbj3wjk+iibYyJE+1SjO+B/v9pNFqcSO8AFsvRe/FAfRe+pKsgN5UT0ySB6a6rgAavEuVF5MZHePFIGstgNDumJrA3V+ZEif5B1N4qnrl5gsqG4+YHgYknLHQ2f5dabjo8QRZ/MZr4PDHQuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766879; c=relaxed/simple;
	bh=6KGYZWLyS2FjrVAien+Mi5u9NQS/vFb5P8qdni4ohb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dovOLkvwExdtU/I+wIxCQkQMlT9zvK1SUvgRU/42oxwA/hZtEL+ccMJwdsWoC5hSx9kAGqDw4vu1+jxj0J4uLrg2g+VPcccVXNrCKO5jdGrRIVDyWDU0awgBEeaLbQxgOGWT5JIPCYdF9mBnQ69PVdsUC/nKafXwZDj0nBQx+Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CqbXjaWf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gTOhkfBZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBePcs1717719
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ntrYj/Ki13u
	4Ie8f2izhqt5WotaMwwL8t/FAwrisOvU=; b=CqbXjaWfVH7ccfrdW/KNfNnEyqq
	IQelHsCaIZrxNENvrjK8T1LI+y/MvKLZ9hlPFvOAypBZydJZo8RBr9YCa6JH/fCv
	09WX4qByDbkHbmK2RRPbUydms3NFLH9mzKXyoclBASluTmqqB6gya0XI1BJ7eOAN
	QRp7V0viOJv3Ncc+lW+u2p44mN0XMGeY3Ko7a4z5ZAEJIs8fF4LU6i7+HTmFiFRj
	183a6Ulxa2izGxsjjbCIVdK9Q6uaODlJVgt5qBpQHhQHTPGjmTs5oNIPbalG8gHo
	NWHMILKoYlasob7zrBvYlrWUSrw+PLJHXySG0JpFta7xKdFPw80AGqaxNUQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hr4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8292a9605aso2573606a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766875; x=1779371675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntrYj/Ki13u4Ie8f2izhqt5WotaMwwL8t/FAwrisOvU=;
        b=gTOhkfBZQZhFOOuexYIsTBIjkuU65tOIyXJbLVcj4ml+AoMNKwJpVJy8GJNCIBuk1b
         N37f9fLU7h7PqDV1sFSZvDnSbJHHUhNxy/+yj1u75ZeR7uEWV9ucs1px0gp254mVqXo/
         lmTTgfqFjI88iQf4xympszqIRkIVkTV9nJSKbKYLhMlpy0+9doMmoG9+Dk2lwR8HTC76
         Uzglsefz9XRVaIIrHSlXXNBZf3m8QUGOlhUb/XfyGrCjDAxdhcn1RB4BkbF+sE1HwtWi
         Lr+wfLTBxb5Xkx92d8xnwfCTCyP7d67KKV5och4fpEPlPu2R0QQey1mhgtbpYDNm5zIR
         U1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766875; x=1779371675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntrYj/Ki13u4Ie8f2izhqt5WotaMwwL8t/FAwrisOvU=;
        b=i3qMg9W5ghAto+yKjhEc/Sr1+pDgo1ByA0juSTlSpF3iIZJvOzVQAX+Fe7q7pVJJ1W
         rF6vOSTEmRK1mokt24bnR2sWhF1a50tfvxrEAXrB4VOQ/rdokFPeSmtf9HQz/iLVkQQo
         F9CShvg6KqyFLIS4WfdK4qVWZvErNxFa1HFSpYXVPYg5Q0743j7L+2sUVz7Ad6YYCNLR
         INZLnnuTBCo4RLqQPuVsYgbAM9Uphg/iO08pJMn0H7ZtU6QCjx9hri5k9HWM4LAEm2zi
         8pFnRRUp9yhGtTs191iynJ0t5uGorGz/S1dX5c5jBAeYl5DSMEyczDJL5pAAX/FEwMJS
         ETGw==
X-Gm-Message-State: AOJu0YxsSo/Epe4BK/W0bgkTQFRqYvmYAQEhc3Zpj+lN1clT3dfWeiWr
	KjSBiTjHN6Ipo4x87H0+r4TMrMQoUe5JLR9NAAxzLUCRbBNlrh8Nt2spOSI6sO7GyQbM3ROr2Or
	7ftWCUaASvoR1Nl3NE9lxWU608eVcd5vZNSkrdfo0pt0PUckBDHqBn1medgz4moAOvWE5
X-Gm-Gg: Acq92OFZCqmAlnfxruXD6MnxE0Wfc2UzVWFr+czArZojU3odCJ3zcBVs5hDbiCog0Mx
	lFwQubg4LO22c+/dpWR+Agsl9LPUuk36laIu75WNlyyl/8D8qMqHebmfNFAl22jo3rCKNKVadsf
	7PhVJfDARivkFCKoF4SBGwglWHwruhnyr6NWmQ/TxWZLjAjoRcGy0rDzAFYfLob3WKXEHeBl+zt
	Uk9A9UmDI7yOsaqfCpINhF5yc0Gcg7d/pDA+DCJB/6uFFwlNlaks2qwqdmklyK64/jX5Co597Nc
	8CZObiRKjGBoYBeCbxgiJCI7wpRu6ykIPAIlIjWJZ9PmEiVS6GjeyZBIdfcB5m5wpRBzeF4Z9LC
	pk4J0R+ZIlAOOWqD1CxeLoGG7uMdEtFZUrQYIW32OQWg=
X-Received: by 2002:a05:6a00:929a:b0:82d:29f:d003 with SMTP id d2e1a72fcca58-83f0578088bmr8503847b3a.12.1778766875456;
        Thu, 14 May 2026 06:54:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:929a:b0:82d:29f:d003 with SMTP id d2e1a72fcca58-83f0578088bmr8503791b3a.12.1778766874847;
        Thu, 14 May 2026 06:54:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196818efsm3793780b3a.16.2026.05.14.06.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 11/16] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Thu, 14 May 2026 06:39:59 -0700
Message-ID: <20260514134052.361771-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
References: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R51UvJJcNuCwRTLDpeH1fYeY9AINbn-J
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05d41c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=F-OJb-hlSlUoWALVX24A:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: R51UvJJcNuCwRTLDpeH1fYeY9AINbn-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXzdQQRwFEnIDg
 syBaBSveyk2C9xwBYo8SOTaFHHvPAIwh/pdCGazWPIwVQpzbZzSJwnGAhc/U31Gmo1yjIoN1qqL
 ZMrivYic4xf5BcoMJnKff0vUI1f853kOxhIsT7JG4mv4NQ8PXv/Q9D6R77D6pFCEaLLHS6I+kfN
 qoELR1ZOL5QfxfgnK0PxU3U3IsIW65TTYhn8tn1q8f2i5thwQyZyaD25V8yx+alME0Ri1EtCj22
 3dlvYV3mo3oogKWKOq6ZF6eB/DFAEaiQTH7Y58C9riOBg0YHfHy6BVIhiqxQWtuj773KSNfsPNF
 WbK1+we45YW+svHeZ1NgDz068bS5JoAR/oBmHWwFRktx66U6+YkfPladVHtA5Cc7g9b6nDtsCKH
 C9u0bawc53C2Or5/LkYubNwrMPwzLbv+CsRFhngyI6Q7tLs/SnQlYODNEmjHDe0wM5RVX4695DN
 Eh3SnkfFTMthXt/i1EA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140140
X-Rspamd-Queue-Id: B958B542A0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107622-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support to configure counter SELect regs.  In some cases the reg
writes need to happen while the GPU is idle.  And for a7xx+, in some
cases SEL regs need to be configured from BV or BR aperture.  The
easiest way to deal with this is to configure from the RB.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
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


