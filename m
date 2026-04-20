Return-Path: <linux-arm-msm+bounces-103847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP/TOoKo5mnTzQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8318E434A73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4485B301A765
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D4063D16E8;
	Mon, 20 Apr 2026 22:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y8iu8RNi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHY97e90"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336FB3D090F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776724045; cv=none; b=NceYO89KJWmwZ7WXYp71xUHcRxexuEedlHnDsM6ZY3f9T0fh2M4sx69peQqGF1pyazEhnWW63sQ3KOWPPVsmN72eaCDY4gzLtbir9hB1M9M8FmF7164dJquv2X7KbDjZlp7FZY445VfKmDM1rauEKnye3fYRl6covfTeLN6sdlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776724045; c=relaxed/simple;
	bh=GTsc+Gea7L7m+oOc0J4MF2tG1SB0z3Yx/SORFqsRYX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBpHiMJgHRLYTqiqmMJuc1fhvEdOgP2Az94vZqRtnz4JWkB1jfjPkb9Z2DyqLwA7Bnou6r3+rk0fp5fSQDJ/Nb9jxnMAckGfdcNg47OR2fouiHcTHJZW7/GBOc+3zS3LLgbkgorPpWlEzZRx07REAYprpFb7fO6y3G3bx02ML88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y8iu8RNi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHY97e90; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KFVu7Z2755827
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rq5x4mE8HI2
	hklAgPtBhAPSqh8qT0+8dU3DbvHigNyY=; b=Y8iu8RNia5hjN3o+tguSqlie9fn
	lxP93xQ3Mnv9577Rte3501C9klN42eBZphXPzfHDKoM9zpRQTTNTPrUUrW6EtPaA
	61+xffS42RIr35ElWfNKk8gY0pGF4dZmSJXfMDc7Z+nbh0+fJrUnN3Hx+deCyTBD
	VulGwZX/3/7YhbnxIOjsQJ+rQfVGX2pHrO+apa+Z3gCLoJxYaZwlBuQrl/HAOhzC
	GtHvuHy1nBf6Sq8z7XLaRrVyo8tEur1FK3WqmLH3x7bkcROabXJ+vBOcHw+pdLpz
	hM3w+xOMtqEet8rrf5D6YQRJjg6w15VnplrWpkpk+RmTg8brJup1D2+k7Nw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnh7xjru3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f780a13c9so2678178b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776724042; x=1777328842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rq5x4mE8HI2hklAgPtBhAPSqh8qT0+8dU3DbvHigNyY=;
        b=eHY97e90DXqrH+cD3w9n40yeEJzHgL+xLu54YfHWmYHBaRQ8ySXqBtip1rwW0czC2Q
         O/rGctDnWe1dAroo0rVcH3XtjzpBH/DrggsPOfJKVIIXDWMdycitZqT+6tfz3PJZICTY
         Co0cdOuk6U1aqJIfi6Z9LaFJ0ntOrAyh0tDjK6ahcAiSll+QtuvSajMMnTkfW+7Cyg2R
         capFiZYho7mhU3M8BlgKCGvXOxqCV5OBGOra5GSALM6r9BxLNRnd1ujHektTLmvQJfQh
         tPaWQRw4d+vV09GTWRJj+69aAlitxKIsOCZDFrW7V5GOuP20litr0Q/Q+OhPH7Kt+R+T
         nMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776724042; x=1777328842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rq5x4mE8HI2hklAgPtBhAPSqh8qT0+8dU3DbvHigNyY=;
        b=jQl0qxB+SPhcS4PlQFy4+J22jgmvIIFEZWzvsZnDuUSHETHcxyQNAD69z03xVN5qCx
         x45zu3IJkWTVoA1dsngr18n+OMrBkorWGUJJTTgVUq3KOCkXXSsECzYWqzFW6bIBiGqL
         a2Vvb+fBPEsGxPE5gjF2MjCI7yq/79FC8Qs5muGgx7x0AHdCNotsLbw0hVzyOyfSry0P
         x7qgz3f0sf93CgwgRnbUXdKf9ESvYbZeU9sKL68Vpe3IQmEIAFjegMOlbcmFUvBWUtAj
         yddqV5vV0ZlcvTMhVtMUHF97Wn6PphaNMhu4R8JO9XOUtk1Wj3cc2ucNJxfGtWnpe1n7
         zJmg==
X-Gm-Message-State: AOJu0YwltD2fQpcg02JIWoYrttVmdaeTb1dLjdLMcUfidvsunxDixf29
	hdkuFAQo7zD+jDojHT5gxwoth5BaCa4GsMAeX3TxdJw5X9lOmWfi/HDwn6kAEQv3PiqxXNbxxvN
	9zY7bf8tbC3PnkZjDPAR2Fwe9Fmkt2C510yQwPhayPJpkGFyVG0s9yVtYyx0cy43EKsW+
X-Gm-Gg: AeBDiesM3Vvx/n7emtA7w0YUEll1rRLf8F8lE/fqFkEC86kAM9K0UP1fh3Hjz2wS3c/
	jmP34mXdcaKHYGnygFfliD2OP65Px9cwmWeiAL0qKHcSPKVxbTs+16dYZfVKm2iyxs4nGpN6PSc
	qJuyf6sxXccDigJ9K8qPhx/DF2ff/FDuWviYvFdYy6mcEKUOee7eMsdcMnbIuJw/yqCE6CxY5k5
	0VFvaRsd7QTxyL0ivcsfSpOhvmDq5KUGsz92z4uvC7PPClkFJweQ0GkQp2tPaXEqpJXKjMmpjtJ
	x11ov0QH8Je+MeDgLp6v1bgqa58zIjwFlK37biV1MEuDRBSgwiQPLqLwYkLHV2ZO+6dYFbyew9f
	cMM0KWzVaavx2a3TX4uDhiAXHkUYHlz17LOb/yiX/kwk=
X-Received: by 2002:a05:6a00:a16:b0:82f:6640:7221 with SMTP id d2e1a72fcca58-82f8b50774cmr11467182b3a.22.1776724041743;
        Mon, 20 Apr 2026 15:27:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:a16:b0:82f:6640:7221 with SMTP id d2e1a72fcca58-82f8b50774cmr11467152b3a.22.1776724041240;
        Mon, 20 Apr 2026 15:27:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec06cbfsm13746470b3a.58.2026.04.20.15.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:27:20 -0700 (PDT)
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
Subject: [PATCH 09/13] drm/msm: Add per-context perfcntr state
Date: Mon, 20 Apr 2026 15:25:31 -0700
Message-ID: <20260420222621.417276-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIyMCBTYWx0ZWRfXyphuH2QNn0Bd
 lPcVlzpgdHNRXfzIFa7dFANkFaYto7AkXQof3R2upES1S/SHaOF4rlsTYyi2Z8UVyCCEVLENzHj
 JHImCdKEi4ojGj2M28JINk8AUgz4ZNPqZKCy1qOj3J3mRueKHmETQWu4R1NW10vP7HKuBMKYImA
 Bo38BD2h5qSG/WMmFR0686bvwOiT3Wyq+I2+jlc5g2p++itonx+xn47LJPalz4yQRVUY8kMlt3M
 1r3ARwhUIsYffybtLT+2sqyHMkBCihSeEh7YDvBR1md24o+cif+5vcjPo9mS9wprKX8loUn/KGH
 vk6ufByHfzegTlc0LW9+kp+6V0TxoX+qFqEZJEJ/6jJIqLRptdJYN/7qa9tK8arWGWnZ/Khg7kH
 MT6QGRmVr94cbrnwlldgcoaDTMR98VVzwNizI771zUNtwxfI0ldBxiUl/6dNEV+eMpd4ztiyEw1
 GVxk02alJF8rNMiTgnw==
X-Authority-Analysis: v=2.4 cv=BPmDalQG c=1 sm=1 tr=0 ts=69e6a84a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=OtV_UDYxk2hhjaRdRjwA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: fGhp-P3Yy8ptzt3aAmzpk6zAj_0TAbjq
X-Proofpoint-GUID: fGhp-P3Yy8ptzt3aAmzpk6zAj_0TAbjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200220
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103847-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8318E434A73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
collection, and per-context counter reservation for local (ie. within
a single GEM_SUBMIT ioctl) counter collection.

Any number of contexts can reserve the same counters, but we will need
to ensure that counters reserved for local counter collection do not
conflict with counters used for global counter collection.

So add tracking for per-context local counter reservations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gpu.h         |  5 +++++
 drivers/gpu/drm/msm/msm_perfcntr.h    | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  1 +
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 9e5c753437c2..19484774f369 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -434,6 +434,11 @@ struct msm_context {
 	 * this context.
 	 */
 	atomic64_t ctx_mem;
+
+	/**
+	 * @perfcntrs: Per-context reserved perfcntrs state
+	 */
+	struct msm_perfcntr_context_state *perfctx;
 };
 
 struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx);
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
index 64a5d29feba1..aa932df16cf1 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -35,6 +35,24 @@ struct msm_perfcntr_group {
    const struct msm_perfcntr_counter *counters;
 };
 
+/**
+ * struct msm_perfcntr_context_state - per-msm_context counter state
+ *
+ * A given counter can either be unused, reserved for global counter
+ * collection exclusively, or reserved for local per-context counter
+ * collection inclusively.  Multiple contexts can reserve the same
+ * counter, since SEL reg programming and counter begin/end sampling
+ * happen locally (within a single GEM_SUBMIT ioctl).
+ */
+struct msm_perfcntr_context_state {
+	/**
+	 * @reserved_counters:
+	 *
+	 * The number of reserved counters indexed by perfcntr group.
+	 */
+	unsigned reserved_counters[];
+};
+
 extern const struct msm_perfcntr_group a6xx_perfcntr_groups[];
 extern const unsigned a6xx_num_perfcntr_groups;
 
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 2598d674a99d..a58fe41602c6 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -66,6 +66,7 @@ void __msm_context_destroy(struct kref *kref)
 	drm_gpuvm_put(ctx->vm);
 	kfree(ctx->comm);
 	kfree(ctx->cmdline);
+	kfree(ctx->perfctx);
 	kfree(ctx);
 }
 
-- 
2.53.0


