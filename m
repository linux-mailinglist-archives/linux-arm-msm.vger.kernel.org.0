Return-Path: <linux-arm-msm+bounces-106167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gB4pAb52+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:13:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B605C4DEB73
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F129D3001BC8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0604BC033;
	Wed,  6 May 2026 17:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsuQF20R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ROGyeCag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31BB4A3403
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087546; cv=none; b=q2S4kprEH22BT4CgcwKkw4DQxLlcvEZKFjPDbyqM06RlNixAeUlpNoxoVKG8wx+OumC2P2CGEBajw09KCETkPZ5hteG65wNmJnch0mvbpI+VZ9E3K8uIn6tf/Me+fIywDDM35F+R2ptZp6bVTBBtPsxpI6EB4UWFxPkFIOWN26Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087546; c=relaxed/simple;
	bh=JIluNArF7RsZIAKl+uhBs6aRuY1YSq+4uknvBZzZdVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2TsdVBxumLaoy100Gz5Dgn2cyU51+H0/wR3x6/uzyU7iy5NtimQ48A9HX9X+8Jc2nHtSwNDggHNxLxEC6/5XfGc64ZOhBpc+k3Blz7cZGIUYvOHvEpRUtnvOWUBgcPA+Ru7Lhq4P0SLpWE4NCvoiALNG58ChSA/8eSBi3iKfVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsuQF20R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ROGyeCag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646E9JNY1434850
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iF+9PJLiAYx
	Yvbd4GKOtHlCv+ra6BRd9wFisnl+IW1w=; b=BsuQF20RYpBmejCv4FViiG3OiNb
	fVtxZ38fX4XQwUCyIW7o5+8olCAmAhlcR25c+xRppXfJzeskpAhZHHGKl1T42106
	3G2qbPm2yDAKjazPi89TGupsNUklWioRTmDRsaFVwgeNhjG9qwMTSFcKaXAa7xGf
	dsg6uANM3W1kGUexRUNJVvL+Qmiid4VAyEx89mGvw4Wj17C9CiO5lPld37uR2RGY
	GBpUadhoxHfQXa3MadcXPRDKbAKPGf60b29AKPyO2xuJzh8qjoMbteIdr8QXX7mx
	+xD6FonKws58ApAs7IbxBoOyke0kCT7eRNr4hT1sWclsIM71bLERRFCReCg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyuqdueu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:12:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbb57764aso1315642a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087535; x=1778692335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iF+9PJLiAYxYvbd4GKOtHlCv+ra6BRd9wFisnl+IW1w=;
        b=ROGyeCagWWNA7txSHPTQQLIzissgtggqKQjSu84OLZ95zzZnuwzX2GQ9n8SE0xX4v0
         LojJIHvl/qVZ6ITdkhkG8YdnDnfjceUgOFopBVFcWbxKH5PUgLONzVQ4G3L0+3yK9QYn
         RflCsyFASQGfH0lv3tMtZ4SIpo+hgIrc78qq5x0+zK7KXiPRsm5KzJkGfeaO0y4mgFP6
         5WJw/Uwj2v9AwFmpdLBLeKRCXE2gdpUxTU6WC26u6Y2WH1JwMSvgr2BKyTG6Sxozkz9e
         gSzpx/A4O6HrYzNPr50parCzW0gEpoIdpL8iZrtrDLGkk7J0P67u0Sl1bDH5m2jMFsKI
         agwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087535; x=1778692335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iF+9PJLiAYxYvbd4GKOtHlCv+ra6BRd9wFisnl+IW1w=;
        b=mXZf+3mFVE1DON5qr563ELH2tORGxEEqilOxYf8dhviTi1GLglGSCvbYPjpywKFfDX
         /vRek2t0uNjVIUTWWB5XyxDpriMFWZ4/hBobRPVUyxV3xer3+VAuPlmadC9klHhyhphQ
         x7gZJJ86X03S0/G/WofpMeYvSSWiLT0X2viWH32OKsmfCTjEbXIPHOPVpjTbCM/795p4
         VkYehLDKptkvbBC8iZbq9oS7RPAwQ2tP0SIi1SBHJk0VQs0TX7jAMG3d/Z99vHex83pV
         FZ5hwBitZg4dKtiankwxL3Bmk4j+DLqSOhIuc3XhxHdVZhM9NmynK+CNJpsDiDeMC2tN
         ov5Q==
X-Gm-Message-State: AOJu0Yw2DvbzUWzwI1JPJfNuUjTfEiYvfTdlgffBJoKBkmkFJzMdyru8
	w+jBlaDHydEv4iReAs3iWe5WfIOA9hLijcg59p0godrMuXT1Vq1XwjHPbEwoAGJDOsRwlq3NFlr
	SfrkU1Ablg4LXb28vxk6uLMZdKXrf3o7JBkA1xMhqlkquktJWi0oVyDEh1wR6GF1TKF3W
X-Gm-Gg: AeBDiet85XocRYyjTkql/V3q/0ezt1wZ0TH5uc5BVrn6VPVKwJeWaT5IobyCN7K4Ko2
	UX3fdUyzIihiQ+Rz4eV/YTE6SkkpJJyfP7Yg6FkmJ1IMBrfeMGr7+RIhTSqTGg5SPsAkGo2Tweo
	dyeivBVnIjJ1jxD9mM2c3nKZtYHPhDDc/q7HwqqO9hZ0HpYqNkdl4SGVDgoj1st6vhvlXvdONKy
	Gl9dahghOo4176Tk0LOS1sTpese5Ws//HN+bfsLbmYR1F01LgoYLh1UJ9kng0cpt0b2jcKDYVvK
	dfB/pV0H43BNAB3isYVqb6THBx2OcCorzwonMzwP3eV0Cbjm9My+DA7jQKzr+IVhAKNCU9w+5eY
	leabnJ3yCuhjLFjl4QSGYB0X7OkyMao9kbNYQrVxawQQ=
X-Received: by 2002:a17:90b:1b4e:b0:35d:93c7:e386 with SMTP id 98e67ed59e1d1-3657224626amr8446169a91.4.1778087534550;
        Wed, 06 May 2026 10:12:14 -0700 (PDT)
X-Received: by 2002:a17:90b:1b4e:b0:35d:93c7:e386 with SMTP id 98e67ed59e1d1-3657224626amr8446137a91.4.1778087534011;
        Wed, 06 May 2026 10:12:14 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8242bb871dsm2698554a12.28.2026.05.06.10.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:12:13 -0700 (PDT)
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
Subject: [PATCH v4 15/16] drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
Date: Wed,  6 May 2026 10:10:39 -0700
Message-ID: <20260506171127.133572-16-robin.clark@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=W4sIkxWk c=1 sm=1 tr=0 ts=69fb766f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=gjKahejJLxXXi_JFjLAA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX73eSD84JIk8v
 zBEIct6v7EtyOleQf1XlF1/2C/DIQQ7G8m/YjXateKEFpGsD+6GgOcZ0ELoL3kdM6hQOCW8bbyH
 9s0k9mZUgwX4Y9ANw1hJMVe0yTeMONHIUd2L/ez/sad2PUYFubW1FoQyGhAJYHCCCEnOGybgLjq
 1uae05Ier1Sq64NKnN8zZuUZLZJyPUFbBhmwrYTPDr3aID6YHpQmEHA+kLJJLX4XiiTfLBt8WE6
 hfuhtCycs+YK4qxoNJjV5v4AaEXL+CcvovKzgk7ZwSlgF+mSGICByztDL/l4zO9FuvJwz4iHbw6
 cOXjSDbAQ7qe1/E+Nh48IFRXcpVEcybHibkRWb5XlDYoJFA8dk0FxqDev48xwjBzGU6YeGQXkcH
 OAaqsSxLQnxrd2x7G4tB2BVQXr0HpJujcnIVL6l42DDdgKB4ypeXv7bEumuih5SjbVxDfdvsloO
 hCpuSwUYAnKG6Lk3cwQ==
X-Proofpoint-ORIG-GUID: Cr1dBHcPSfEB6BzHKFK7jwe7Gvy4uAFi
X-Proofpoint-GUID: Cr1dBHcPSfEB6BzHKFK7jwe7Gvy4uAFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060168
X-Rspamd-Queue-Id: B605C4DEB73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106167-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

This is needed so that SEL reg values are restored on exit from IFPC.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 82 +++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 +++-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c |  1 +
 3 files changed, 87 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 61c6b0e781ce..47627e76adcf 100644
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
+		unsigned nr_regs = (reglist - reglist_sel_start) / 3;
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


