Return-Path: <linux-arm-msm+bounces-108847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENfgNynrDWrM4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:11:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E18B45930A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 19:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EAEAC3164C1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77703EFD34;
	Wed, 20 May 2026 16:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTxzk9qq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbtpUHJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F252D3EA976
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779294342; cv=none; b=FCF2i+gxWysw5uf8ZIkakM8MV3DycuTyU8YTCG43/I1qcekZ/x6ZQTPvVgaIsAythwo+/0SioTLhMJNKmgxj0LGxJmINLGwYLdRyAWjjQp8+0hCkPleKsdyuTCS0Epm/xi4treVpD/3JCcVL+ErB2WE2tqZJbbIL8FllE4lV1o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779294342; c=relaxed/simple;
	bh=cH/vi4c8e9fDOBqvI7+SV2PjOZw924CqDzv5Ovri42Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQfOC8JNgaf+LvYgdmT6MTWiQbvy1TwW7wG8bmunKViXQgHEyoNQlAC08pWV1sKoGXckW3WXQzVWGV05+faORp1ST4SWv+PTwBoUE6mvlouy2+rT4Q3JdzFApy9OXS4LF4k8LVxjBNqHJI23OK+D4Tpjk9hmB/NPD2+HavVaX4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTxzk9qq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbtpUHJW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDXY3h1797760
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7DkVqoNUSYo
	eBkjLEkY9jVmN2ecujeJJRqwKEcFSezk=; b=cTxzk9qqcG+7BD9/CV8IhQvL2ZO
	YsBk6kO5WaWL9nLM/u794tne+6pnDP7wiMccahdctA2osKu6Zs7loGUAA9kc0+Xr
	/ylByqskCICznLXv7Fxg2ThfZDG3vBx6I2PuGZign0A55yNbkXDjisN7/aOv9dKF
	/PoDP6SIfscM7rEG7tzU2RrVVPympGS3wU3+RpeZ+oQp9Q/eTf71sys6a5971lV0
	n3QNAC68QxupOEf3Mwq1FIpe4wz5LO5us+gQ0beRZGNf0gJnDGdeD+GVxNmx6/zr
	zqF2FOrFOf/31XZU+C+EoQu++ywYeKEMUWe+LlIR3xUyl4nhLq6VVQOVsSQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu0qev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 16:25:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso8962538a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779294338; x=1779899138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DkVqoNUSYoeBkjLEkY9jVmN2ecujeJJRqwKEcFSezk=;
        b=kbtpUHJWIpJk6GcFLS09HReYCMmcS2Ruy7gXz+wTFdQN57uQO64mIhH8tmVLOyAs2A
         6wKzpOGGYboBZtqPF+EAqXEGthiKUGlWb0+wW/SiXmsOQraNEKX2zJ/9KINoBr40nQTk
         Qmwyhb0HxSwevt8Qczfsm+jz+eQ0/zjcOSkkLJSigpZsEszZzzazlAVSCc7dlKaaly46
         XF227NaejRb35IXUcGUk5KzVMD5X8IaEh5wgSMrtslTW/4Rv4mO9o425fyQfYnHsINlP
         HcGIEoMo37lTJsRC9hiLzRvHscBV5ejD9EwU/XTDsaaTNmeeql8GZPrO+X3oZc2sSl5T
         7Wkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779294338; x=1779899138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DkVqoNUSYoeBkjLEkY9jVmN2ecujeJJRqwKEcFSezk=;
        b=bPDtoEctP+B1IcmpJVW+5WutzJw1iBMBneJxzmNW4b2hS1DUoU4D+RUD9YBithiqFn
         vSqBZ5mQx84/csc7wroGB1GlkhZ+84IyZDMzxFTLSC+yBN892d0OUbmrKSuyjGXV29G+
         3fSc6He+FrRLMyD/370RKK1kt8smextlcfBqqWFzfruw4vQvoyFuVkxacaYmvDK5G7tx
         OUg/QU7kRFgM12VHA33EFmxpIerJA1SJC4E+Nm6jtOWe8kH6Klq6h07vpWXfAPflmhwm
         Jd14JJjlOfmE8mHas11PUwTWPyQo156kIwXT5rkL//W/SoRCRFOJZziT6NZxSCqPkkwr
         Syxg==
X-Gm-Message-State: AOJu0Yw0kycV+Zr3Iv9cwgZUdj08JU1OI1YHiiKyvLIV8YWxpfSw0MBC
	KrGjNQKrRKYjVbyhbDRjtEmVkNDCT6dZupkrzbcqy8iPdUrXGvtkyl0E3UjTe7+dG9ZXx/qGuN5
	fwIvKcBR4OlHSpUiiQl1kpRhLUGvOeBi+FzhRC8I8LyRJYEIkqtYn3LrNDZPbv3DyBVOL
X-Gm-Gg: Acq92OGabU6x7it1sFi7HDG4izGLWIItnkqpMZN7DxF6rTgaxHapw/0SUkS12oLjivo
	MNGJnjQdKpGN91u3zTlrd88CuX9Pzse9TUW37oKmKjj1jUc7XSh2N75+usfdw+apucUdMjMepmP
	j5KlUzwrGZz6wLe72yBtfQJIgxls0Qzg4JbbL8ZoRavDxqThfV0Bt7vZHw1vNaQ3RUaDaypR641
	CtbGU0AKSrOZFvboNS6x7Ls5bDeC62JNC81wkjXHx4GDmv0GzASgfQJ4JgDd00MrNYQC9ZeWL0p
	mtWSU+7PwxsnZBCHu0upiE8p+OIQbyTOJEm5/6em0sCZuqdSk538i3USW68y+roWGKMzX9I7JQG
	5OXz7OAeOPWMqTXgEgm8K2saIOrghXktzSKwNxanRYa0=
X-Received: by 2002:a17:90b:350a:b0:369:a74b:28c5 with SMTP id 98e67ed59e1d1-369e930bb1cmr10202231a91.19.1779294338247;
        Wed, 20 May 2026 09:25:38 -0700 (PDT)
X-Received: by 2002:a17:90b:350a:b0:369:a74b:28c5 with SMTP id 98e67ed59e1d1-369e930bb1cmr10202183a91.19.1779294337493;
        Wed, 20 May 2026 09:25:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a3c83f226sm145920a91.0.2026.05.20.09.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:25:37 -0700 (PDT)
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
Subject: [PATCH v8 11/16] drm/msm/a6xx+: Add support to configure perfcntrs
Date: Wed, 20 May 2026 09:23:58 -0700
Message-ID: <20260520162454.18391-12-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
References: <20260520162454.18391-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE1OSBTYWx0ZWRfXy1py2GNAwsJR
 rHNr3vrnM/EJ5L5tzw5HasizhKyiXMgta4pL2F9wuRM5+Q6BjzYQ5WkNPZuzH7nDZ92QZ3p/ART
 K5jV3mCIKi1qER6Ixiht4WPx2aIN+Z4UFau9hKVBC7Rcls0/W20zgHqDsrZi7xAkb+TnLTSWFye
 OiaWAWK+167renuKHuU+iRnzHjBlnOvAJDEyL1TxfUzxvrlhBz7nM6IRCBxZkpX86hQWuaDSHAd
 HLUCuOOZPwnquOEIcuCOjlqO/miP2AT2Fl3sYuZ0BL9v+7009YNKmI9Ut2X4+Ziwk5xm5nn/BkR
 nloPyVfNZr29tmEIM5S+r1c9WwXRngt1UcvG/bQil+3NcEchzki1OFT5y6V+WSGbDfCYDsCUPsL
 5Z98CBRAUw5lAA1u9Yb+DjkCdQKxp/SpnbeAo0t0iF5d0cXEZGyxSWOT7SnGn1M9OoneXYim54P
 DmB+ANJ7jr43vZr1c+Q==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0de083 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=F-OJb-hlSlUoWALVX24A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Y5x45f2jCSKrs4VSeskygMOP-LDLABEH
X-Proofpoint-ORIG-GUID: Y5x45f2jCSKrs4VSeskygMOP-LDLABEH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200159
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
	TAGGED_FROM(0.00)[bounces-108847-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E18B45930A5
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


