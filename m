Return-Path: <linux-arm-msm+bounces-109384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC23FJOXEGqdaAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:51:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 542065B88DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 19:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFBC63064DE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 17:35:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D328372B41;
	Fri, 22 May 2026 17:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GonL8aot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jmcEZnXQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963CB370D7C
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779471300; cv=none; b=Yk2SZscMrn7q0IvJxzm0ZbZ7/cDvHT7B4VkaYftyfnHAIrs/KYy9LNRfXdcaL90Pqmz8tsJ8j8fvoO67GSPYRwXyHuTkityHVhZL+DqkUr0bC3vKAiMb49wKy9dtm15+sJDGWtvc/3bUnElyXDjWcMKt/XZpD+Xj9GHYDvfnUdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779471300; c=relaxed/simple;
	bh=cH/vi4c8e9fDOBqvI7+SV2PjOZw924CqDzv5Ovri42Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QkG9yRAFXjAyTsg2ZwoYhvX5BhVdeT4fuPGNUyo0ZXjyFFmgGMN6FhplMNdrhmOZBCYP82pk5izz656ofgDXy52Xkda1nQCPy0deSJJkwHLeBCzdTdRVydDsQbfmpWa8Nq0WAvW7+SRoxNQ/6ut63lMjwyGH4Ec80rq1lzdgJNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GonL8aot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jmcEZnXQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MG0dBY3476988
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7DkVqoNUSYo
	eBkjLEkY9jVmN2ecujeJJRqwKEcFSezk=; b=GonL8aotiu22+EUFgM42vZ2GtwE
	IAaBnUG3JiROkT3W51up7M7JratwBqsl4uUQ3MkUXbqQx30m0RAIvUylfqLHe4vH
	TXEIP1cIuTWLBy48Qw1KvvT6AUMm8GwK81T4tCWvvt5488VxWLaTmpfmC1q5fO8x
	oZvKEZHvU4RkpZtcmAVJWhNZsd4L1++fIrWef+aLBvo2oxBCzs71nsdhVF+fHyDR
	LbWCnIDrnBbTkic/COLjAW3dBkU+P/xZkDO9O4vPLgC9aGI72oZXE3tBm5k+zi0T
	ayZARX1UCCkQ6EI73JKbo1Sgty2AO29uIe12b9DCZtjZMVub2WTiIP3rCSA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eat9r8bjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 17:34:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so7230164a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779471297; x=1780076097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DkVqoNUSYoeBkjLEkY9jVmN2ecujeJJRqwKEcFSezk=;
        b=jmcEZnXQheRoBbip+C9BhpJtwiSpkeqVBhneNoneIiBpZ/3oiVF6B4Qb6gWGseXN4S
         Hg70i2edHq2Tlr5ehrGXHjIH39MX4iI5xNtKQZVwA/iDAzWYZS6Bw0bVNye012g5VOBL
         ThtsFaqgcVrxi1GdvdC7Q1j1E1G4Q1r+6NfC02DePnBg2rQRMKjV2/ELWvrNvM7JT+kn
         cmt5Z58z1ms++T9YmnyfV5QcJfshb3JAJjo6k1iHatDggkh3B4ObYXw9q8NZbDSjeVaX
         De5NkjEgf9X1/0rKek61myTLqTVHxfTA1eWlLX0OSQA20eb7egSDy0OGFH+k6xjIjtpW
         pdDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779471297; x=1780076097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DkVqoNUSYoeBkjLEkY9jVmN2ecujeJJRqwKEcFSezk=;
        b=GPmJeA5xvoNHnef9GNBk0e3WDjpp7vSyycmC12cp4ECoBTGYvw+AXOkfsbTfwLdEyt
         P6h9H+sNXEBi3S5p4jKmThWk9y40ix9YBD81ZTI+AAl6iTGC7iZws4wMGgqNCDIjGp91
         7Hd4Q1MjB39zOY6mV6/p46qS5eyEVAoCXfEukgZvP+Ne+XAdWSngo1jyZU2/ckKyhDEk
         K4DywTEuGLzul0SaLGAsd8BBrWh1b4rtlV163Shcl1KDywbhynGy5f5zLzixhwpok6EQ
         2F7CtYo5P0TvqdDzaXmPRPzmG4chKbVFw7DssbQn8/v1AXTK58JBMDocrvjj/sZAQ1DR
         oXXw==
X-Gm-Message-State: AOJu0YyfJlKFCpY+ik1D/VWFB0XrMd80bJTOu0LuS1MM3q8AyHzYAroK
	Wt6hqO8msxyjybBWnStYMhwBrxN+NAbK+JwBeC5k8t4Dr7n2LxkCqilmzJGfChTrqG2tCtVn6tK
	1ZnlypAxDHJLT0mC8NtfpxAJnCeD+NlYAKFvn1iw6BNRorwpYayIn4nlOlhVJcmF5QHZU
X-Gm-Gg: Acq92OEhQIN0MZ41AazqiX9XX0dZ9kvjgtf8HzhPVNy2Dbg0br2LDIz158N4ilDprk8
	7uQB1Veod9cjSxxK3I8Ngxzf2KLgovGii93f3c7Lh1KN/o2iHT1FjeLHqD8IX516pE+t0WOYp/U
	lXlBWCl1Vk5BZM8q7dGhpD+j3xzgGjP6DbaVjaYoaOZnik34jyczaHsW+VNokuXHtANFU1rFeAV
	6CEmU0Uxq6B3yh9h2H/bMbTxyp7Px+XFSZvfmidgS7R2wIbNwlV1mzBElU1bIx5Cmjom8E0kknm
	6WaeocSeHwOHvnMWB4QBYmKDRFY23iD7fx7tc+LDie6AlFPDG9K6fyxz+dqwZRBMYyKjbjd9qLT
	HcVkcZhj1vwgVnkOweAcsPWQX65fzq/+q
X-Received: by 2002:a17:90b:5208:b0:35d:a5cb:95c1 with SMTP id 98e67ed59e1d1-36a676287b9mr4361125a91.23.1779471297043;
        Fri, 22 May 2026 10:34:57 -0700 (PDT)
X-Received: by 2002:a17:90b:5208:b0:35d:a5cb:95c1 with SMTP id 98e67ed59e1d1-36a676287b9mr4361108a91.23.1779471296574;
        Fri, 22 May 2026 10:34:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a721c7b92sm2318481a91.12.2026.05.22.10.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 10:34:56 -0700 (PDT)
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
Subject: [PATCH v9 11/16] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Fri, 22 May 2026 10:32:57 -0700
Message-ID: <20260522173349.55491-12-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=dt/rzVg4 c=1 sm=1 tr=0 ts=6a1093c1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=F-OJb-hlSlUoWALVX24A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: JonHliVcdGUhcO1apghxkrQN8peABJ53
X-Proofpoint-GUID: JonHliVcdGUhcO1apghxkrQN8peABJ53
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE3NSBTYWx0ZWRfXy8FMKLe35H/t
 WIE5KeNffOLyDoOkZ+NsRVAs7Ys8zRxK7BztIvADcjatVmiSFf88SRvAn6/Pb6WsC2nkqfHMcC3
 GFqJb7VI2VPxQRRay7MV3TMwEuZIuyf9EZ5ZnlY9RT8tuhIi4jmL0AU8guQlzJe2ZBdeyPUcDNq
 aSJjlSEubZ/jz+7Lv6MHAaOKWQqQJnYJOKEVh6cQJZNepYjpwPrOZiWgMFaWFP04/HWFtMpQSB/
 EH/OJT3bJ4UTa32xDJjCalGYB4OhkDAaGddYzK9tm5dD0DMVdSEPnAyU1tnZKUIIfEqEt3KaVCH
 onTjNK2vocDsBGz+k6y709NrvVf7vcpUcWmxw+QbYAMcdFFLQ1Uzuno/AXNCjosYNWSWRXry67b
 enVcfB+8iRQBshH2/YaS86N6YO8VWS6eRwSYVLLpLekVbZmLsLsywpgYvq8G6kWUBAr8cOIxHr6
 T7hzPscMsgCzb99L/aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-109384-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 542065B88DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support to configure counter SELect regs.  In some cases the reg
writes need to happen while the GPU is idle.  And for a7xx+, in some
cases SEL regs need to be configured from BV or BR aperture.  The
easiest way to deal with this is to configure from the RB.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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


