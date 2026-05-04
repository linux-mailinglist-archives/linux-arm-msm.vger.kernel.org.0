Return-Path: <linux-arm-msm+bounces-105807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBD/Ifrx+GnJ3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:22:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D114C32C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:22:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E4E3302D96D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:09:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AB43F2107;
	Mon,  4 May 2026 19:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPs2TjY/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzOvo92G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278763F1675
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921733; cv=none; b=PtqFrqKYJQy4mg2L/co2SGLnltEwg7FsxM/uUFcOa3cT+W1xHNiWwhTX967YkR0Bm/hY3tDMqW++dNiZggRgFS64brHsafFv1iEzSrh/wJYsKVHUDYMS+2lDiQxaDPOCtj29vPxUjtZQOP8/8PKvonqx5VCOjN9BNkTDJLEyT68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921733; c=relaxed/simple;
	bh=1HQi4O2c4EvJaQqUsnouhyUbcMf1PdNlzd3mEV28J8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nAa2YtMqrafDIhCkFBN47PryTbEbMy7KzmaBpokmlqiBaisJp3KQn46ms8+9xPoTh9AE242ZqfcpcI4YYI/eLO3oN8Ra7w+6gu0gqAzGBOYY7oQMi7qYvc5eeBDdX+ak7nVTc5g+FZsYKWhGEsSzx2zlI6SrNzxCF3ONtYLrJRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPs2TjY/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzOvo92G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644J21Hk636790
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Z8lEzDrgE0f
	TV0/Bl+mAwrGTsTYAYegTQN4ZDI/6vu0=; b=aPs2TjY/rYPJTdi3pXmVJ1ePfa/
	ANxYbErzlam8vmYB0u70GwkggRL3L7M4RB3dKhaFcEY4yLlPumtEHgcwNtdFbsDi
	UnTD7SGSLrmmDlq608+aoOdTa8UNkpMXIS7GU6FnV7NX9EAAG/nmzxCDWvz9Z91g
	8k0cvd9O3nwPeHQB8EOunM/6vjv00JPVjfyYdOP7r6kkXEY4qhaSTTGTf6ZDKix8
	OHitn/XV2xDNMOec8r/vQhEa8gDAYHms4eSFdU5d2NNLqCJ0GGc9FK5PZDTRXZFl
	Kx1fpXzoDfpr7Fftcha/hl1K0BK0FvYDRjt69HsFfjdzRcEoSS076VROWBA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsx49t6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:50 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2eba42b8dso42754565ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921729; x=1778526529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8lEzDrgE0fTV0/Bl+mAwrGTsTYAYegTQN4ZDI/6vu0=;
        b=MzOvo92GoOhBkRG+NTxB41MQxsQy6ryaLlhVTwxnoeaklnSQ32CbB9oBGpwAWxPdKi
         QkkeDDeJiqtBzCTegWdjv3bGu8zYdPnk+B5L7q4Rte7xNLkY0Db786Ry56cV269yb4pF
         bJZZDFXOOSuRu6RHYGVZaH2sluz4nehG2e8ojXD8TzAVCS5L9zhszjIDhMwLUoPd/mQ9
         yhkwZh5uo3DKMaabh0+ZwUs3XDPTEs8qjOYv1d/Ok/Lfj1t60eg4jjGJ/4kXSONsd9fk
         TS25xiZIB4hIbXcPjiUWixAnQUN4bpgAFF1wu/+LN0dF6XyzLz/AgQvqHkyMx4Fqb6O8
         p5vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921729; x=1778526529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z8lEzDrgE0fTV0/Bl+mAwrGTsTYAYegTQN4ZDI/6vu0=;
        b=kfEBcjKZwp/m4JHJPRrCzlft4mq8+eIqHgM+bg9O92RcbUU7qSUqzwGdibmXNIyhCx
         Pq+s/G0h+0g+5tXSV3vfhWoqXNnq7Io8kiNtS0Y8kzS3WV5V6cSban7Ez65leJJriJnW
         StLUDZiJxUty0+xQzC/yKTXqZmqYn/nN9Z7OnqGKrc/xVeoa6cr+p9LVl75FO5H4QgZS
         NcOLGEXO+H2PUxl+sUHy+kdrFZ3jG8I0a/ml8LkEpXVb2MgvKfoVjoUUnH129kXzua/E
         4cvOio9CMd1dV/BB1sc3lmhLHNeefhsOQzZD9pCJlsp0AQBiN1xUNjmlvb0H0nXncVhJ
         dPGg==
X-Gm-Message-State: AOJu0Yy13tHahqwnC0VIVt/pO0qKKXTx4E3tZaKocpdcXPw95zdjV4zo
	+FqbD+l80W72iRCSdxbKDWauRjFmD7zY1QRRb89fu1FFaqGFgXFmhoyERiL/1priiy8Fg3Anc1E
	ozVxgKzBPTntfx/S37zmFyfZYbui8rdWF1n8+6OYafsIl47YOJOW79ku4gs5u0lGWs6O6
X-Gm-Gg: AeBDievIMWLLMNarRsVDRK4IFBsHw2QFxMx3Yh5QakXU5wqVwQ6dPUqNiQHC432QUsI
	vouZAjli02JIAtCIEkRt8KgGUeE7ZbrZrcuIWSmsWMGpulGsOrOz3cup9Qvw1AkFSH5kyI+VWXg
	MBE54ImBM7/VX7cBKKACqnBF/XZXQwinLi5Oz5kW9p6VjVofxJSo933JPsFmObifWnQnSb2hEAi
	WiUcUONWorrmFKD8eX3f1W2K543nOtM7DFF8j6H4oM/aZcLGpg1JvXY5PLXhygxr6DWmG3I1QrA
	I55Ws3LOa/wXasZgmjX5jCeZKinv+EEKojU8VhitR3rspv0eqUCU0cqvpt274iFcQWS7vU5j3cK
	714GBlcca+Y2v69HOsNqofcPblm3i5WRwMcZvib5SDu0=
X-Received: by 2002:a17:90b:2f03:b0:35e:30bc:804d with SMTP id 98e67ed59e1d1-3650cdffb46mr10418219a91.15.1777921728683;
        Mon, 04 May 2026 12:08:48 -0700 (PDT)
X-Received: by 2002:a17:90b:2f03:b0:35e:30bc:804d with SMTP id 98e67ed59e1d1-3650cdffb46mr10418188a91.15.1777921728018;
        Mon, 04 May 2026 12:08:48 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36576332a4dsm88877a91.13.2026.05.04.12.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:47 -0700 (PDT)
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
Subject: [PATCH v3 15/16] drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
Date: Mon,  4 May 2026 12:06:58 -0700
Message-ID: <20260504190751.61052-16-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfX2KzlSP4IY+e2
 bRmIw2cWFmGA3oR2YrV1vgX+8CU3PhJGbwacain39DElsEjxHp2APCsVVcP/hce4tStyLc5aQgu
 JxbeiJb8P834wJAa//MPgAj72u9Tk+NilCVcpbYMOFFt0pMXyFvuttejOnKGOomlL8Az4Dgengn
 RP0cms/a479pQaaysm+QvOncHuVi1x2Alszkiv/zRKJDhvRclIzXHh3GggvbgNr1cSz+G2pHCxA
 D6oPtEpZXgH2h5rCahbdwwLXVh6xvLbMB3wpTmPxWCbU6q1j2NtycFSx0SVN5itxMXTCmH/zi44
 hpM71lWbrG5fOCKXarlRl6VR88qI2Yv5e0vrXUZviZj4h5VRKiu2SIjj6QyonxqvJIJp5j9HtB+
 AcqNmWCTlJH577jNnvArKrf0Hr6GMZAFTOUJmpuJY2rwQ084pT8ycepTLFVbkJ9k1kUDm96nvUF
 f1R7kZcFOnGHET/SOug==
X-Proofpoint-ORIG-GUID: 2lR30llJTbZarGVYWLa47gyehTSkwYrX
X-Proofpoint-GUID: 2lR30llJTbZarGVYWLa47gyehTSkwYrX
X-Authority-Analysis: v=2.4 cv=LdIMLDfi c=1 sm=1 tr=0 ts=69f8eec2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=gjKahejJLxXXi_JFjLAA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040175
X-Rspamd-Queue-Id: E5D114C32C5
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
	TAGGED_FROM(0.00)[bounces-105807-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

This is needed so that SEL reg values are restored on exit from IFPC.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 +++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  1 +
 3 files changed, 87 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 61c6b0e781ce..e047ed550347 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -946,6 +946,7 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 			  A7XX_CP_APERTURE_CNTL_HOST_PIPE(PIPE_NONE));
 	}
 	lock->dynamic_list_len = dyn_pwrup_reglist_count;
+	a6xx_gpu->dynamic_sel_reglist_offset = dyn_pwrup_reglist_count;
 }
 
 static int a7xx_preempt_start(struct msm_gpu *gpu)
@@ -2535,11 +2536,60 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
+static void
+perfcntr_select(struct msm_ringbuffer *ring, enum adreno_pipe pipe,
+		uint32_t regidx, uint32_t *countables, uint32_t nr,
+		uint32_t **reglist)
+{
+	OUT_PKT4(ring, regidx, nr);
+	for (unsigned i = 0; i < nr; i++)
+		OUT_RING(ring, countables[i]);
+
+	if (!*reglist)
+		return;
+
+	for (unsigned i = 0; i < nr; i++) {
+		/*
+		 * Bitfield is in same position on a7xx, but only 2 bits..
+		 * which is sufficient for NONE/BR/BV:
+		 */
+		*(*reglist)++ = A8XX_CP_APERTURE_CNTL_HOST_PIPEID(pipe);
+		*(*reglist)++ = regidx + i;
+		*(*reglist)++ = countables[i];
+	}
+}
+
 static void
 a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 			const struct msm_perfcntr_stream *stream)
 {
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	enum adreno_pipe pipe = PIPE_NONE;
+	uint32_t *reglist = NULL;
+	uint32_t *reglist_sel_start;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		WARN_ON(!a6xx_gpu->pwrup_reglist_emitted);
+
+		struct cpu_gpu_lock *lock = a6xx_gpu->pwrup_reglist_ptr;
+		int off = (2 * lock->ifpc_list_len) +
+			  (2 * lock->preemption_list_len) +
+			  (3 * a6xx_gpu->dynamic_sel_reglist_offset);
+
+		reglist = (uint32_t *)&lock->regs[0];
+		reglist += off;
+		reglist_sel_start = reglist;
+
+		/* Clear any previously configured SEL reg entries: */
+		lock->dynamic_list_len = a6xx_gpu->dynamic_sel_reglist_offset;
+
+		/*
+		 * Ensure CP sees the dynamic_list_len update before we
+		 * start modifying the SEL entries:
+		 */
+		wmb();
+	}
 
 	for (unsigned i = 0; i < stream->nr_groups; i++) {
 		unsigned group_idx = msm_perfcntr_group_idx(stream, i);
@@ -2567,17 +2617,15 @@ a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 
 		const struct msm_perfcntr_counter *counter = &group->counters[base];
 		unsigned nr = group_state->allocated_counters;
-		OUT_PKT4(ring, counter->select_reg, nr);
-		for (unsigned c = 0; c < nr; c++)
-			OUT_RING(ring, group_state->countables[c]);
+		perfcntr_select(ring, pipe, counter->select_reg,
+				group_state->countables, nr, &reglist);
 
 		for (unsigned s = 0; s < ARRAY_SIZE(counter->slice_select_regs); s++) {
 			if (!counter->slice_select_regs[s])
 				break;
 
-			OUT_PKT4(ring, counter->slice_select_regs[s], nr);
-			for (unsigned c = 0; c < nr; c++)
-				OUT_RING(ring, group_state->countables[c]);
+			perfcntr_select(ring, pipe, counter->slice_select_regs[s],
+					group_state->countables, nr, &reglist);
 		}
 	}
 
@@ -2591,6 +2639,28 @@ a6xx_perfcntr_configure(struct msm_gpu *gpu, struct msm_ringbuffer *ring,
 	OUT_RING(ring, upper_32_bits(rbmemptr(ring, perfcntr_fence)));
 	OUT_RING(ring, stream->sel_fence);
 
+	/*
+	 * Update the pwrup reglist size before flushing.  Kgsl does a shared-
+	 * memory spinlock dance with SQE to avoid racing with IFPC exit.  But
+	 * we can skip that since the ringbuffer programming will be executed
+	 * by SQE after dynamic reglist size is updated.  So even if we lose
+	 * the race, the register programming in the rb will overwrite/correct
+	 * the SEL regs restored by SQE on IFPC exit, before sampling begins.
+	 */
+	if (reglist) {
+		struct cpu_gpu_lock *lock = a6xx_gpu->pwrup_reglist_ptr;
+		unsigned nr_regs = (reglist_sel_start - reglist) / 3;
+
+		/*
+		 * Ensure CP sees updates to the pwrup_reglist before it
+		 * sees the new (increased) length:
+		 */
+		wmb();
+
+		/* Update dynamic reglist len to include new SEL reg programming: */
+		lock->dynamic_list_len = a6xx_gpu->dynamic_sel_reglist_offset + nr_regs;
+	}
+
 	a6xx_flush_yield(gpu, ring);
 
 	/* Check to see if we need to start preemption */
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 3491a24a9320..f3cc9478b079 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -21,17 +21,19 @@ struct cpu_gpu_lock {
 	uint32_t cpu_req;
 	uint32_t turn;
 	union {
+		/* a6xx: */
 		struct {
 			uint16_t list_length;
 			uint16_t list_offset;
 		};
+		/* a7xx+: */
 		struct {
 			uint8_t ifpc_list_len;
 			uint8_t preemption_list_len;
 			uint16_t dynamic_list_len;
 		};
 	};
-	uint64_t regs[62];
+	uint64_t regs[];
 };
 
 /**
@@ -100,6 +102,13 @@ struct a6xx_gpu {
 	uint64_t pwrup_reglist_iova;
 	bool pwrup_reglist_emitted;
 
+	/*
+	 * Offset of start of SEL regs appended to pwrup_reglist.  This
+	 * is equal to lock->dynamic_list_len if no SEL regs are appended
+	 * to the end of the dynamic reglist.
+	 */
+	uint16_t dynamic_sel_reglist_offset;
+
 	bool has_whereami;
 
 	void __iomem *llc_mmio;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 6c040f718176..2ce7c6ac4521 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -468,6 +468,7 @@ static void a8xx_patch_pwrup_reglist(struct msm_gpu *gpu)
 	}
 
 	lock->dynamic_list_len = dyn_pwrup_reglist_count;
+	a6xx_gpu->dynamic_sel_reglist_offset = dyn_pwrup_reglist_count;
 
 done:
 	a8xx_aperture_clear(gpu);
-- 
2.54.0


