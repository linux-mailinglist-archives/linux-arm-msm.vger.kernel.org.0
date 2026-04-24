Return-Path: <linux-arm-msm+bounces-104482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GerFrKI62lBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:13:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0880460A1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E241C301BEA3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D5593DDDB2;
	Fri, 24 Apr 2026 15:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L8hwhr6L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCbu6jnC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5926D3E0C76
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043542; cv=none; b=HDJ+sZWIWFpMbCggE78bhfulqzZPx6umguzQX+NJdbfElnwjwLjPbgL5+seZoGmFmQv97X1GwNpy7jRyUN9aXw3iK0i8w41+WYXSJHjKHvVzwO+z/BM/E+KrgkCQqiRcnhmyzaUenvVkoDgRhAGFiy/URsGRmm1/6x1zUN3j74U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043542; c=relaxed/simple;
	bh=UhGTl+fUgRdmXb/zs6mAnMmKieTngsW7QFo91Q5/D4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b0Qd9nGBgV+rDX+nJDX9MimVB/v38JlSeLf7/f5ZO5v+9MfBmpKWhlvqQ215UXwsP9Zjx2l2JCymclxOm+NZUR99qL3VnBEAqnm/kMoXFJrd1308NIYfZsLHdQ+YwgWiDyhAU1tf6tOoyTsgYXX+5MC7P2/n6CjDbigVs0btRSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L8hwhr6L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCbu6jnC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ODu0C51888545
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6gpiGKD6NOz
	XykXwNxb4bW/bNZG0eBfs5NrEf4+DquQ=; b=L8hwhr6LpCNIVlaWJwEeB/PkxcX
	zA6SD+xpM4BoQUanP5kBS2YwljfJ1l+/LcwUUI+cDhhfzNobEq2kLCA9t6sU0PkK
	u2MsbYhHZ25pZ47LrThPOY6ACfUdZIvPtJzJ47qpcQV2yJirFLZCNEdY4ajxxqH+
	H73RoH8MvLJYy3TctjpMMObA4cF3Wt0GZVl21F03qKBWkZjA81Qm1TaN76T1JDas
	/53SXYS9sLzQqU1qRsnGTDyD7k0yyvpuR1czw7YBRsMDyrXi+N7UtNuvUdWxvo9b
	pnCiM0xt94mhg1hjEWCCaTNqDCxQZySv0erHI3Q1VpH+d1+q0cnslk30mxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dw7px-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b242062308so145707905ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043538; x=1777648338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gpiGKD6NOzXykXwNxb4bW/bNZG0eBfs5NrEf4+DquQ=;
        b=WCbu6jnC/ponedzeTNNMj6QdTh6frarRKhgHCAp6D/D1GzvzvXtYwb60Dd+6Uvhv7H
         OGrXoKgr2iDXBznfxZtfx++alm0ZUXJa1lSNWjDkJ/PChsxjRJOovInkQaR02sQaZRim
         0WKTRLJR7cuPx0Nf0HGJb4oIHu4qrs2pvIbTA7zasdF073egsNZcp/2ddlv3qAqD5qET
         xavt7ereUF+2htkh1nnSnJc1zkG9UTy5XBnfBqLLLYUkfYOsoSbHcq+g4Sprl4zMVZao
         spWc378qqRlrmiVyRUMM0OQVEbj6GH8XF0ZMji29MZSGZz20hQRtfkRHV8tfr65EoQec
         Ff6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043538; x=1777648338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6gpiGKD6NOzXykXwNxb4bW/bNZG0eBfs5NrEf4+DquQ=;
        b=ZbXhpt3/VSgNok2XfPPYrjWBXqPauMKjIqZMO7nP0Ui7x8l92zIqMhGkLXEWddl8Xp
         beGiDu2wAlRd9da99Z8gwykYEtTsJRhIu9Ru93BGhUman9I7UQ29DKXVYXibtmxjlfSx
         ga0JZAQjx0gOKDN41eYXrbhpsEfNGBemtr/qNbSmna6wpD2U26cPSzDm3bEaCNkhz51k
         MFKNfQ0tRPacNQopng09skcsiya9175D8I1IDXez332O+ewzYddDTaloGs7iDHjWxAv/
         pk8A1bFyB3vusgSy24/zjWcxyB1w1pdaZ489WLTjNwki3R1F1G3xuwlRLwv+O+VpspNb
         YgEw==
X-Gm-Message-State: AOJu0YzdbCaWaI6MQm7ajuBRVJxVruRktSJ9zckh+rRLZCQ4tn8sv447
	zLdn/kaq+UxtUXjzgivzpd+e3HoJZ5osXaWlOzLO+urdxoJ+YqxylVSnTxARxXuQc9VvPdZgOko
	Ri8YCx339ql6rtJD7+ijVexemwZuUmPaCs6SaWcIznmPfpnZJfID0CEmAl6LUtmgUycYA
X-Gm-Gg: AeBDievEt2/fgzP3UdKLN9Pq98OKPsSBRMYQN8iHaWU2ZaQnSg74vyBV/SnPTsk1aZR
	IVwI1vwbYkSpeUKTVFrdpKGF76t24mXx8NN4flHjM2AqvQjIQVI93cldB5bkuEiUw1OXQ6Af/Wu
	Pxqx8CEgr6VvxMxw6tAUv9XLxNTddZl5a9QaNAn+78VFm7TgYct/ftMQzuZkc9ecfVqq7ddsZO6
	TM67nYI75R5OHciDD8Un3QxN+xVQql2LvFloNF+3qFzlcyYHjtf86KL6hkklrV3TZZrF7Y+FE5U
	+0fLmC7KtzXLuq7O0lTfVWVV3fqYcxo7/KkEAKv1qo7t0o+98X4ZfwGLp9PRhHVAhowqGsX4IsA
	JqFt17A9GkEV3cys4SGgrPt5IWmPfKsO7g4z9o0Ovisk=
X-Received: by 2002:a05:6a20:e211:b0:3a0:cc67:39e with SMTP id adf61e73a8af0-3a0cc672136mr28254928637.41.1777043537925;
        Fri, 24 Apr 2026 08:12:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:e211:b0:3a0:cc67:39e with SMTP id adf61e73a8af0-3a0cc672136mr28254868637.41.1777043537326;
        Fri, 24 Apr 2026 08:12:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f9db0esm17494595a12.10.2026.04.24.08.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:12:16 -0700 (PDT)
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
Subject: [PATCH v2 11/16] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Fri, 24 Apr 2026 08:10:46 -0700
Message-ID: <20260424151140.104093-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: jr32-JtJzauwuJbq3vjMppRWMibxXDEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX1CfsN0HW0Jj2
 YhLF7L1t5rUwz+6MHE0YNtejDD5gmKNuTiw7te2d3DjSDWtVQIBux+lwKLm4SGeWvWR9nxwE9LE
 SssXl1maEoBApCoizzNxBfTbzTI0U4QEfvfcnP4sOo0avIvsOBcxGdasFivEU/YExPGl/SF5hw7
 J98UqkUZOuU++xPzdZtXIzPSk9vl25aLfvqtMgeSh7m89LsTkclTIye/eJ5z96W2oYCFuhLseXw
 WXvEfbpEZilpjKgYv7M8kshAoPxZF4K6rqsMep97X5Qdy0lPgiutK4ibSJBCjLt4v/Iv1oU05TM
 C+pKWefwXwgSOKA//ZkVCQZUeidrXQvE3Lfq53ssNQEH4nJx0ZbCgszJBvLp8GjbTN4UUFomdsx
 enZmSHrFW1P+9NyLHnTe1w4wpy9xq89Ybh8xvm+Iji+6F5IMbSDKWp4gdMH2W2+fIFX6QKvG8Pj
 nDjrc3BLklXlbcHle3g==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb8853 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=oWecmCczN8450n14xlQA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: jr32-JtJzauwuJbq3vjMppRWMibxXDEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240147
X-Rspamd-Queue-Id: F0880460A1E
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-104482-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
index 415902f6e5d7..8b9dcca8e051 100644
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
2.53.0


