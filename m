Return-Path: <linux-arm-msm+bounces-106936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Pa1JBfVAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:09:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8250E9AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC5E130D4F4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 712893D16F5;
	Mon, 11 May 2026 13:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qb79K+31";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkicUPYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC0B2D739B
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504494; cv=none; b=Mq3ywKJuxAHiG9x31T11asacXO11V0mflbQF4MBGlfE4tC/S3ltp/7UgyuByBVsdNZOHHBih3pDis7Vrw83lrX1jZ5i4MSXg26/VgjEuvLe9QgWoyaVA42CL3za0lMKQIYHxj6vKVsCRCzrivIfjbPgdKxQbQDaIaop/HGYFOJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504494; c=relaxed/simple;
	bh=54SiiwIiDu5jCiPVBfargkA8Cq4AMd5thtK2yJft994=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mQr3PuJhMc0YOCuC0CSJvpGKoDkInlsCnvzCwMd1PJm2IDnRNtDCLpNtg7OWWzJQOiDtlTo4qnjkCrt5hBPxpE6Mi0E4bRGVoSuURe1mF1PfzlKBjNZqFBne5Jo5Ja7Ol/Ymbh8AiF2LpBtYt+LYer8D00vEIyZHNbOLVjxdO0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qb79K+31; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkicUPYN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A5tY1258540
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OJPIWHLYmtY
	h2vRJzlQwHbA8ExzYkFh40ePWlyvRs1s=; b=Qb79K+31KB/Tr2YfwFhERDvwKQy
	+Xe2jobb5rKhUwSc/HLzhGk24P8BCM/5gYt2rMI4/hT2b10QGJyuiOs1S6iYJ66y
	7k3+mfF1Re0TVSnPEoP8iLkpbVen3BNWr0S4FFGKEIno8rMsqFvLpDyKP593nGeZ
	XiJxCzofedJGRr2RFc33lBYPcMkTRfAxYjjmjdqTJctpXCIqo9qrEXzkjgmm81by
	cdriA6u6oqozBhBN2XlxEyP7XKO5vmbc3jirXqrwHCvGCR1rvZui6QLbCKFYpVzM
	u8N869kexHZfSzUdAtcwVsex5e6R9wEi9H/bktDN7cvmhUZbyRoV47oRbHQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag217k9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662eec51e0so2252251a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778504488; x=1779109288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJPIWHLYmtYh2vRJzlQwHbA8ExzYkFh40ePWlyvRs1s=;
        b=HkicUPYN6WTDYOVqsoH7Mz/e/jA2Y/30nN3CgTiERSRbAvG1UiUIChA+6uzTM3GR3w
         a2nrP2ttXdkNspa0PvrQzrYGHssTK+KutJdxf8AJaY9PxlTFPfayMgAaKvGHz0hyVrAu
         ptEhHF5D3eUuc+HQniFjqqR32IYWgD7fGWcgox10G6tFYXi7frcDaPUEnSgPI5th1Pkx
         OKVEANtMs35sH+n0EHf7gNymeKGKkbQGZp4PVSkwgqcvdmFqjx9wgTpUCEvICEItXh2R
         3WwIz93UwJ7iH+wz+LmapBU8+AL1BPS1RQUMO3kOzdNN0m1xJNY3DIdAVGU/3BjgCorf
         ovBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504488; x=1779109288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJPIWHLYmtYh2vRJzlQwHbA8ExzYkFh40ePWlyvRs1s=;
        b=SSdVnnCqRa8TgfRHHJWAiQ7cNn05rnNlRNZej8g6aE0SVtW5QpyJrdxNUtsCzKB/AW
         YaUwWdPmfep7QTH0LdCw2B2SuQhtjjC97mAKwJN8jnL3g+BHgG8uWJjnYNMnz5pOLcCZ
         +VvtIRC7Igw5w8VXCF5dXnJsRRTUnmJMuZ84vbJ7xkbmMNXsiVYn3ZZC8klg6fv9+SUu
         8te7EnrpYyW4LGevoTzf0PVUVA+4zQmwAos2wrEx9Xmn91StaihvvOmgQ/rPUDe3I290
         AUKNnFZqq4ULp45IreZDnJCrSMVDvpzXXeaxgZtYMH5DlvaoCZ4qu717QmaY73HDwUdE
         KPqw==
X-Gm-Message-State: AOJu0YyTUiZj4DuyGyb1KPPx7FpjvE38UTY6xeXuVJ5qYLgfJscc3Mug
	BekANqp+luBiljYovDdvFd+gJ2ql5IPpddDHmUkHSVozvsdqcLH5QuyD2OqeDuIf8heqQFDf0gt
	ql3LwPBUv8d7mZqvZNtMGhaPuwyU+BUBDJOTQIetErnvjuepQKzOdC8TuRvOM8/FeZwdD
X-Gm-Gg: Acq92OEqRj/ODTVAyGWNlDOFsIyOHsrOTXnOw+enBSo6pIcKHBzdY9NPwuW6MO4/xO9
	Ju97O7I3dpPSGhA9II2gW7Hhr9++B1e7PBHfoSkEzzTSCcqYbX4q4yqAsHmBKss4n+vKmQA81+R
	povoDd7wS1LpsYba+PKD+kdADw+lcpZn/Bjrdn57B6yt5dpgQ/Fr2c7dqtfZCxo/VOc5QBRBF2z
	+O+nrUuiHIS4XS+gP6E32HrKdHndIaHFD8fd1ULryH/tGMleSpDazKu9y927GZ6VDTeL5iVzlry
	hohsI23XAl0oqGR8fz/9XqEMf07jHIMuOjdWUoGmoVfTJPUODMAy9U91+rPSToVKMkQkurxn8Ug
	DmW36e9I1Kx6SLxNW3FZBi9obI8cqHMZ2
X-Received: by 2002:a17:903:22c9:b0:2ba:b5a3:187b with SMTP id d9443c01a7336-2bab5a31e16mr224167285ad.23.1778504487366;
        Mon, 11 May 2026 06:01:27 -0700 (PDT)
X-Received: by 2002:a17:903:22c9:b0:2ba:b5a3:187b with SMTP id d9443c01a7336-2bab5a31e16mr224166345ad.23.1778504486632;
        Mon, 11 May 2026 06:01:26 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40434sm107088755ad.29.2026.05.11.06.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:01:25 -0700 (PDT)
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
Subject: [PATCH v5 11/16] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Mon, 11 May 2026 05:59:24 -0700
Message-ID: <20260511130017.96867-12-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: qZkOANio1nvxkA_2DbUkPAGhHYikSgPM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NCBTYWx0ZWRfX0koCilByxBFA
 mhq08jkLuLMaI2FvAa+8GX24LuFrtFnwm7d990AcfCZtkc1CokzoTrYZME09lidKBnpdEQzsgy2
 A6PMxgGyPp8GEXENbYuQT8XOUEGP6MnAxbW4UlVTJV4O9hmHL92178Lw1XWYs5MHsC/QlfcT2GA
 6x7IKx/nWuv50uyPGC1j/IiyjuUkEARcQwfZgSQMmgWGp7dl9UhSR2MPHj2JcqBlI0LtvSjV1nF
 c+MnkG6JNeNgdWuVVHiCxBWpwSsdaAElgAUmzAH86uc2dYl0D0PPS1/XDQ6x6CZtKNsKMfkgjJo
 HTCBPIl7ySakLzKWcjDFHQEOoYbdYmlua33lJ8P2ebynstBLIXgL51u44+qBbQMPbR+JfhtnG7E
 w8EmFQ3UzLMtx0v4M/fmBQTtGw3mgyJmI9N3hl2JRKkCn70HlbdviB3H6c8fhkj4I7qoZOH8dqr
 i7/LnKXekqAV6l/93Aw==
X-Proofpoint-GUID: qZkOANio1nvxkA_2DbUkPAGhHYikSgPM
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01d328 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=oWecmCczN8450n14xlQA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110144
X-Rspamd-Queue-Id: 40F8250E9AF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106936-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


