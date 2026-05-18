Return-Path: <linux-arm-msm+bounces-108278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNNQLjdkC2rwGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:10:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FB572AE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 69DBF303C479
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3668F3988FF;
	Mon, 18 May 2026 19:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ljy6+IO+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPk3oNyP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8041E397695
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131308; cv=none; b=doAD8tZVWw4JvK8EDpyUFQk6DlgQtlHc6qKoelXBtEz/WanOUdPhjviXqbG4/bnNQKRC557pxe7B7JnS4iL5FWpiizXLr/PGhS6WsKsnlslLOUZvYOkm0HQL8MPvhEM/uJzcDXgRYqg5HyQYmt91i7zyZD7VYF+IFTZz2tnclbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131308; c=relaxed/simple;
	bh=6KGYZWLyS2FjrVAien+Mi5u9NQS/vFb5P8qdni4ohb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEdc5kWeD0AaV+h4oRqqMqsJvMyLHST7o19P47hj2qcnOhjNE1ner4/DKIt5iRwFtth6Q2VsOaeA9m+wminEqyCjAycQxU6pSso3CAtxhvTeY9xv6YvUYwlZKgSN9EtyyK+dR9LqaP+4rqRSYcR7Qtcx+2UrPl82lEncRhM0MmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ljy6+IO+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPk3oNyP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IE0MR92188792
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ntrYj/Ki13u
	4Ie8f2izhqt5WotaMwwL8t/FAwrisOvU=; b=Ljy6+IO+ksuesFXgBTvrYAAc1oK
	jwSdF38/rXwSOSzybuflx6Mda95Y0Cp2IItVcpxZPLjrBrD+qQe7vJtbFWA3pQGl
	8qey8EBfLGEUkNOvoSNgiagUrCq0cYsyIkBCxbbkfh10h4E+GofTu4wcLK0AOrlR
	O130C5kYKUjVxmr9RyP4GhhyTJzQvEOe6xRIFZlGoIRMdWS4tVuzxF+ScyLwZ7TR
	NafoNlAsFQppY+Ke03qju/W6M6fOkcJt81dr92aWGG48q3AvfWkEGhmPzgTawH47
	0NkTXw81ZuhbPxvYiRQk5L8CrWkNok4OjSNzAKVbjNrPQgv4Novus7QpE1w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xkujrap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:08:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82fa366fb79so3671789b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131305; x=1779736105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntrYj/Ki13u4Ie8f2izhqt5WotaMwwL8t/FAwrisOvU=;
        b=TPk3oNyPe7KUBcSg+zZZIoXyRjvh86QqFZdMbVwaPgoH5jJ0VKJjmdEs8uuWYQh9J/
         w1A/IN/8gyKp4F2mNqTRmsxVsll1+TWXy6aBccUqgOmV61+j8XqQ9MifxX76Sul/Oy0n
         RJhBFobJSsr1oAWqjjp60dkGSQzW/MaeZb4lC8WI/Syf8cxPJWhrd2c8aCNw/nX4jfQs
         vHawW7yhpKk29EbPkviFCIMg+ZeJul6FDFUdatGmh+BakMs4u0SRNBLxi7XVtJCncKQU
         niZ9E8ASPaIfBGJGPbh0OL/f4HYCuLo7fpm9ybz5z5+LNOtco6M3QRxz92o31dlTxpsW
         hxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131305; x=1779736105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntrYj/Ki13u4Ie8f2izhqt5WotaMwwL8t/FAwrisOvU=;
        b=JlWZZWHT4v/kxK2GvYCOzfjHOD354rBbzQ5iTJiKZQfxEka7cllnqSxpppsjaQkNyi
         gREK+LJJr0/U11afqKxihL6AklFqvEUyrFocySAqB+IBsrO3FFYZG/agiXNWKygdCL56
         j0O/s/3B0rs9SOljaDtHvSxmB8f5Ty1YH9oqO8Cckff42xNjhyq+fWXHc0UzdN6miiaM
         txwqFt+yOX7hjejC+Je1j1JJBiuFHYGxm5ojrYNhgVKlxacuJuTRypBJO0EMrdkqMQAK
         /ZC1oM3hhyN+7DXACcM2iHQS/FBNR10c5HHiaO1GUoFeo21nCSemCFBUwU9GRMa3kqes
         irHA==
X-Gm-Message-State: AOJu0Yzi69SZLQ69EwPkdEEJ9Rr4ESGgrb7N3bdJgwPCKOkRJxvofSK/
	5JERgyogpTBXtrbO+GWAJ5PvRkXZNeYLHRtDYZV2th89HsicaZY5EOIMuwh7b4eKah3iAbK/UbF
	SdynlxC75UMckZrSlk/xy8bxadYCMNSctxfsb+QwGqJqyb4t/tg28bD6K3wDLsrFkja6w
X-Gm-Gg: Acq92OFuVURaznzuie+65yooYdO7Zn4MVIO3Q/srUCMjSWTQzGH4q1nBg/PqR3Tg83p
	ImKbdk7lmcU62AvErcKMYt3lI1uacqnXSGTbdgUKge5yiYR8xpnHcDEFLyyWBWWbsnyrUM2shsh
	CRk3BpesTGeBqnu6HyorUqAfuHvoubbca7shfqVSnWHdHaeQL25hMLfmP4gIM8MbwQVdGSJJRoX
	siFIuzq1JyTQJLY6q6PN5k8YspiSfoW3nefto0KOBJ6OnVVYrazfFwrR/J+CtgbP7cG456rsGwo
	lrqkBJmIzJlBVN8D8GnHCwU9tah5+JI7NHx9Pd4e72X3MjKPmJfLoU2Mt7Qih1NvtRG2MHqqKjI
	O8wxlxUtZ+fpVm2a9occ95YC72jzDlGsG
X-Received: by 2002:a05:6a00:400a:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83f33d96b70mr16429641b3a.30.1779131304572;
        Mon, 18 May 2026 12:08:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:400a:b0:835:cc47:6fe7 with SMTP id d2e1a72fcca58-83f33d96b70mr16429622b3a.30.1779131304131;
        Mon, 18 May 2026 12:08:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f197815cesm18696721b3a.24.2026.05.18.12.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:08:23 -0700 (PDT)
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
Subject: [PATCH v7 11/16] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Mon, 18 May 2026 12:06:38 -0700
Message-ID: <20260518190735.16236-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
References: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OSBTYWx0ZWRfX68P9X1rN6Uzw
 DO/P9nQU1K09OqBKk/H9i/8PYZDru+zm3sMcGAmhiyIHhm8c+CpOcwoUeRFEO1vR1SLkArZbx6X
 sex8KD3QPQEgqXKSYHXb4CERVjup5jk0zFxKGrjybYNDwxGvKPdJgUc4oHdmBaS3hs1SMgqpB08
 sAiBvzbami8YKTROhEDMS8+oNnLlAwQq9lFDTQF1xDbA4HGWSZb2vtv6rM3ZFQO2PNNRHgv6Mh1
 laNpoAAxuqQo/5SSRUOB42pWU4LevmAL21qVsm3tX26hV5Z8pcHA5s2bzUWXx+oyGRWvkwNpN8C
 fEZZ1zOtaiH+GtxMZU4pVkHsc+PpOw5PU5HoJUBukwb9QcvyBRjgTERmdxP9y5fTLsyfJYwydis
 o1OosfeViupnRwrXQNrpn2mmWo6uFbYDKa904OilHznzeZv+29LuAOJOByct3pVyuyGtrtLBSDX
 8GcVnCluYLZ+jnXWJJg==
X-Proofpoint-GUID: nJmhFQ9qGv7di67EYJ_Pq6n-LbXhKIIH
X-Proofpoint-ORIG-GUID: nJmhFQ9qGv7di67EYJ_Pq6n-LbXhKIIH
X-Authority-Analysis: v=2.4 cv=FsY1OWrq c=1 sm=1 tr=0 ts=6a0b63a9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=F-OJb-hlSlUoWALVX24A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180189
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108278-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 583FB572AE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


