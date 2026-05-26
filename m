Return-Path: <linux-arm-msm+bounces-109869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPqXEtK6FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:22:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC355D89B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E905C30E343A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CC240960F;
	Tue, 26 May 2026 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZxZbiWzK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cZ/Zwi+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42318407CDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807262; cv=none; b=Sw3weUV386kcxxNk2WPVMlgYyhbtC1wEWAzqYcIjOi3iN+/xYCVknKzzX32ERVgRNqJbax66nkKMDmJSg7NGEYbdFhbrPEU/Ro9pWEl0gQ78bX9i8U9/TVB2cuTUoHR9KpyFcGheSfzX7qJ6so8+/aXkpJbGmsLfBGUQd8YU4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807262; c=relaxed/simple;
	bh=BEOdvFJGApyse4ngSE7qbbCIbyfI9jqR4JKqhPHX3sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnQBAVOz4BWJ6x4H2GvQtnxSqtk6PU/N5s4ceQil2a3rrb335t9GQGNVT9LaK2hom1UNtop2wCTByjAI6gxdGOQszTQypmHYqDaNwivVtuOkOnoU7xalEKP3Y+sRla6RbSKzJALqMcMNs0xUx9h5ZkXBu1GF80KDxFCjE/ZftLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZxZbiWzK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cZ/Zwi+A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QD41ka3693595
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0di5UIbflTB
	I141kxS5NLO0kr0e+AulUYsw1NrtDCDA=; b=ZxZbiWzKQiqWv5HDTCzDGSqxc+a
	A3rBL9R7kXpQ00Ap3cJ8UzniGLPoblm6n9EDJApT4o6IkDjVsvFWmKT5TX4raHQR
	iKYo+jUMsoZ6EUqrKeK7jSM95UIkaMtIjs1eRijxLhLm5qYuPsM4NS4b52zPVXO+
	j6tUg21GuK8YYFdC8f7Tsul9HPHJKOuWoOxonK0e2LAn5nT2at799rksGwE4VCOa
	a5tNZAWHQncBhwaLPBynqxu4og+G9DW89UXwfqtiFSfV5kIoWxqWnnPKzvLW8rfg
	Vfqsylk3JSYuYZz+O+f2fMe2mE80RQV+odU+pEEbW+pcLeyJgxuzaLPdgJg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2ygjyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:19 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2baf7748d0aso107676815ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807259; x=1780412059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0di5UIbflTBI141kxS5NLO0kr0e+AulUYsw1NrtDCDA=;
        b=cZ/Zwi+AUzVF1PF6XSsuoXGTJu7TDXH0c+FJZUxH4/Q9PRwIOpLr4QKdUqkeJjtOaE
         G5ykynoUU05fem+x8RRIqBUaFNVX99/PppyuRz8nEfADKyMR4IzF1SN7sJLUn6BW7Bjl
         qV3Y2lU5zuzC3eoXaNb+mMBgpMXWKCLTu91BI5vjmlYhSRj6lFbikm83PPCTwTbkZg3q
         pqNQ93LDUkFhxZN0Buchvv+M2p9kDtXF3bqkjy6Zrpzvx4sHkITqTeTW2d934wBmjZIu
         ZdSztfS27DJLc1laKfPjBCGxqgrvFMQVjTGqwhbfy/c3TxdCStWIq/q7/oZufX6BSN5I
         FD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807259; x=1780412059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0di5UIbflTBI141kxS5NLO0kr0e+AulUYsw1NrtDCDA=;
        b=ZKqFwzFkRpgxgVBpUpStFxV71HCcE6M9Om7W190KU91nTwJjTUtI9VRuCzn0NK3eCP
         3IYdE5gRmedPWU1j1o9L3YIgRklutRyUmvmxp4gDjBcNcmFVPf6ydlbkVMWlP9NA9MD+
         kxYEPr1WCl0mb4nubDJ0RcYIKmogxBSExdJLrrBTl0OhYiC8gQnC2lt7JAgYZVJkOtRr
         D+qWdjwDHy+HIrd9IU3Tf3LNwL39P0VMQKKbJqP1Ou6uJYq6LsIudkO9q2zW6u479zL5
         iRxKfYlu1NxYOtbotWXK995u5CO6Q5IrkERPQi9qJCDEaDQ6rsniM4M259AaVW2T9pXB
         nUjw==
X-Gm-Message-State: AOJu0Yxfbmot11TJO7NXWLhQK+kauGEW0Dc47giMGMWALas0mCXWMPFC
	6Rm/wJTKd88Xi2cfefVCDxkozq4U7wrsd9W4xJ05VwQDST48lQ+71Hs2w/OPPkR7at0J368wAe0
	p0HCvbQX3Ninw6R+qLB3zImktEYd9anGay5HeO10ivy+Ae0jkhjgny0X0f3N6m8pCSO03
X-Gm-Gg: Acq92OGqqHKZ2pc/GwvH+RgZKGuJrPmxBeNEO5HMuFwQ/Gnn7+4KuHDof0P3hUyHuCE
	Mzv5AKnjcpOohVzS7OsCbGwN5wdDWLcy/VI46Qv8lu4kh3ntkM+ruXewo3FRn2P5/RKEEQmtJ81
	YbeGAfrwXsKUz+otoIhU92F20+dy/rrb8KqJWCQOcRJR1eP5PHY3n8fhBSb0pEPF5gbMFe7xDh9
	lMWi5vZMUPLjfWVvAsWKG05KtdYNG7tjEfLvDxPEba588tPMH47+ePZY/r7UGVeHzXl3URiKr2N
	31zwT4W55SrCyo9ehqSRXDch9JayXdpMs9vYFIaD6OmvHXyyJ64Phh8vjsVq0+/HcYwAM6ahV6T
	iG5iCDsEe8NlERw8T3xFHS5gKN6HT7ArC
X-Received: by 2002:a17:902:d50c:b0:2bd:105c:91cb with SMTP id d9443c01a7336-2beb059e13fmr218616025ad.15.1779807258652;
        Tue, 26 May 2026 07:54:18 -0700 (PDT)
X-Received: by 2002:a17:902:d50c:b0:2bd:105c:91cb with SMTP id d9443c01a7336-2beb059e13fmr218615685ad.15.1779807258102;
        Tue, 26 May 2026 07:54:18 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm167225565ad.83.2026.05.26.07.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:54:17 -0700 (PDT)
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
Subject: [PATCH v10 11/16] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Tue, 26 May 2026 07:50:45 -0700
Message-ID: <20260526145137.160554-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
References: <20260526145137.160554-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g3Xp0cylShlcxbqFoDSlOMjHjKpdGF6L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfXyAe1QOBXW15K
 oO1Muhgjkw13F10UG222UE4FnWTghV2XMq3orWKLJ50etMf5P/UVs8DAO6IoIBohk+PvLStuavI
 HiSA0peSbot853dMrSesqUHZ26XQ4oRYEuEoIT2FCI6nhbCLe3JWVU70Waeboed2jhaIwWm3jX5
 uU25EYmBeqTTYXlAqpHJvLHhqu8lFQYnfrF7y+fbC+Y3VX/xt9swGgk9SpeDwE92q6POaqLHahT
 I8KA3moXZQ3gh6QO+ucRXVSPD6M69eBjyfnJgisc2h4ubJCDxJU4b1tBZJCnqnWJA+IK9coyNbV
 xXDWVLc9iM7oL/GgaP2f5+5KG7D1xHfz0KMaoDrMrm+yBM6GtktHUz7DKJ+Ln0HOAUa9TBLyMPD
 Q6gsaAYhh/fbxhWT3m3ocH8HnDUbNILMtw22Qs2VS6fqQ1CyGX8YicWJ7EQUobLI9lORGr7vndo
 4DSpLurnGFm4aF64xNQ==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15b41b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=F-OJb-hlSlUoWALVX24A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: g3Xp0cylShlcxbqFoDSlOMjHjKpdGF6L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260127
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-109869-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.984];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CC355D89B2
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
index b5a00ab7362b..2ceedec5296b 100644
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


