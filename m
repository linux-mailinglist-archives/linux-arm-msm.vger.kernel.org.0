Return-Path: <linux-arm-msm+bounces-107618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJqaM+fUBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:57:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41AE0542A84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D614C30945DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:55:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F27440148F;
	Thu, 14 May 2026 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RalYZEG2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agCE08gO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243463FA5C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766874; cv=none; b=gBfRHg2egMAnD7/kH7uKA4G9BTVEqFXeOR6KufYTmuzDz04m+/kBCzoyIMoGqCJMlWBb31Pa/5qDCXQb0dnW44Q8+09p9sbhPFrNniszPbWHoqOCmUimVAcYbrN5eUU/4hJl/qoJTNHs+T8zoy0XRfCrIcImFRHvTh8FnFx4YxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766874; c=relaxed/simple;
	bh=KLqRNWMiv1tFIGsviuSyaJygsw/Xhbs5/vugY6rjZSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d1BrydwPVbMs60d3obBGZMOflNUzP4uljxRXc/CmN+YjG+KFU0Lu2U+0FsztWeN+Ain7gy1jzR3FCQWL9lha1lf27x/KHCTiZIb9+j4H2M6712QcQYY261tAivRrI3wiWoYsn+2keFsHg+lsm8fuSFSwEz6n1FLWPQSgi4rfBDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RalYZEG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agCE08gO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBecE81718027
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tpSYknoSjgu
	xLp2PhcNLzFD+hJIyTtn62dCNb7J3rZw=; b=RalYZEG2911GXWtZbTlXU6jzXRs
	l/jppPX9UF0nTeLvSgLDbRpapxeQqwDTBheiR4AvtHmQZd//sYhIx0vNTuIMudVv
	p+PGX0qChFg5kL4W+5XWs5mufQnMcSwjj8XOEAlJAFK/MtPFoswJ3pDlrLX3UKJS
	35lZB1MeLxy7+32mWqFuciKqaY9jyVTJuZW2jYm5tlku5hZiyZSnlYlN2kNmIfud
	BvMlJ/6BrJ7eeCcMrvfSxNyiMm2tlkz90SggOOvVTKocQgdaPr7H25lbPt3mGL5v
	vXQtklkprHu6nx54Shhpz+rANFII2Yl2GBD4hRWMsEmDsmdofLIvFweFLrw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hr46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-837d0d71c61so4825577b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766871; x=1779371671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpSYknoSjguxLp2PhcNLzFD+hJIyTtn62dCNb7J3rZw=;
        b=agCE08gOOIV6kez/ntAgUG/ZUK7IaWwN1VmdcOnklySRln5UbCfLThlu0Y1qYJAw2N
         vWQgD30dRBIIupjVeYUYm23IBqxTEgxrTSUL3L5RQIye3gfF2T0IrQM+9RUzUd6k5Gw5
         tZ76y/9YoSjNGIA0lmu0I4MyLy0BPwP1Jh0vBfqaEn9GQiMCmm+/sPrZ+5eB30tDUii4
         w5BL5r+q/0KaXdla3i+tAQ06C3Y5rnr70GuXf4cih7v9xHwgG/xyJ/+tTtDDOda1pQbN
         9yVQLdjq2VLqWmHm93tGCzGuRsFeT2KqjpvGRJSecFoO84oQREpFUgt0R/9jLbp1OM/6
         R44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766871; x=1779371671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tpSYknoSjguxLp2PhcNLzFD+hJIyTtn62dCNb7J3rZw=;
        b=ehscyJi8gCMSAa1AUBbjwn79+jnbPxu+vmK3ojyRD8HCbV7IRPk5Scmo9JIzPWTd7I
         H7/8HcIWq5rlDjysLur5At9nKSfV/Up+xSUMsk1JMCZ8tuIOaEyJgYIr3AHGE9JSN6Vf
         yrgVI8u10Z4JeIUu/aC95SCF5f2sX/+f3tamhnwL4lslKbNI5cbskk0PWD9prvw+QJD0
         yeS8bFqkwRyphOIdtyhD8K4+9a4EpLCfhBOxCq272tmLAS7+YiyZjK/aUCFxuXohhIOP
         e+V5staBA0I2i2OWj2HYmkf07V85pSu272JrRpxYvHFqBFB6xr5zWdUR/Dig0VtU0TPS
         r8xQ==
X-Gm-Message-State: AOJu0YyUW7Iae50KcRfzTSuuyBLXJUZMNeKpD2ns6eS4IKTXDCb4fNvv
	o0RP5vEHdihJ2/b6CgfOqq8Dbr5OS03zWfsiLR4Jyr8vJj9XA88F4snUCf4ImV2ibcup8TPseJc
	nlB/9q6fea+zeRJ+fn3JZEiCxI/5UT2khDTZdQg5d1lOC0Xya2ZKmF5hBfsp309rTcx/T
X-Gm-Gg: Acq92OGB3rxqVwjLbeQVDAmo137ImKuvijhXPWKfSWa6xIzDXIAOJMV4fHp6QIQXKDD
	U3N0TtaHXCQRfjb4bSUkrIsNJ0F286f5MKd5AADs50QBtVl2Zj+KIAwkG4NFojfUzqmdslR0AiI
	kNX01EoFiU8mQ9AeKEZvtO22XBV/4tcgGXrLPfKipboMtdimb1pBmmb7SGy4CNSdtdhAVNuJaK2
	nNWMH5gw3t57jSknGjmPnSVgq0ciGK1pugGPiKkZhZtU8CCnRuCrPJy+zV6dz710HGM0Mr8qGUW
	UrlCS7FsJFl6Ho6ykEthD7ePqy2kxBqzOUxuT8q6h0ThCeesmAvyRYK41pkBne7Jc/LXVpxZ8+v
	oxV6faQvBbMywdl75C0aZ7X+rAxm6/96E
X-Received: by 2002:a05:6a00:1acb:b0:83e:e03a:f926 with SMTP id d2e1a72fcca58-83f03e910e2mr7999703b3a.9.1778766870644;
        Thu, 14 May 2026 06:54:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:1acb:b0:83e:e03a:f926 with SMTP id d2e1a72fcca58-83f03e910e2mr7999647b3a.9.1778766870087;
        Thu, 14 May 2026 06:54:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c78844sm2721847b3a.47.2026.05.14.06.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:29 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v6 09/16] drm/msm: Add per-context perfcntr state
Date: Thu, 14 May 2026 06:39:57 -0700
Message-ID: <20260514134052.361771-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tpvsrcoW9erqgShEgAELI41CzzPcMZMr
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05d417 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=OtV_UDYxk2hhjaRdRjwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: tpvsrcoW9erqgShEgAELI41CzzPcMZMr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfXyeUjt4Zd1WPh
 G+oCLvtHtDRRvmY2DDzrQw5wCcmDY8fB6uhCPW/u6nsBCiDyiJASDjKcbhI9El6Vi1NK8hVVgTH
 clVCJzuI1NneYTCYlrm+9rMrxVzBIELsl+ypJiK7ERIh+O3oIq4lYbOirVqm6JZIwhy5vO33ARJ
 222FdZvIU1dVZUc2LWohVPYsB7oQC1q30UscjuXgHeVcH1r4WE7+42b9bVttZw/69dLCOmTTYZo
 9KuT1aBcj5kvIOI804vbGq/8n2vrJnYC1gvHzPkTp7IfUf5n0q/IfZq/WQsv8Bbc0t146fALfT9
 AKOasmJOhhgVzVaTrkYU9cageh1Zp3i1gY2pN7+vj3xAUiokz2qDGSf4Nvt/Yr15NBPmmHeDr7O
 U6t7VGc5aeeVZ01BgbvtWE7+qFb4dsEVSRlEspPxa7tjOMEFYqNsaFj347WWzMBZu+PSyMhxMFK
 ryz/KiP191w+i6kk7YQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140140
X-Rspamd-Queue-Id: 41AE0542A84
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107618-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The upcoming PERFCNTR_CONFIG ioctl will allow for both global counter
collection, and per-context counter reservation for local (ie. within
a single GEM_SUBMIT ioctl) counter collection.

Any number of contexts can reserve the same counters, but we will need
to ensure that counters reserved for local counter collection do not
conflict with counters used for global counter collection.

So add tracking for per-context local counter reservations.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/msm_gpu.h         |  5 +++++
 drivers/gpu/drm/msm/msm_perfcntr.h    | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_submitqueue.c |  1 +
 3 files changed, 27 insertions(+)

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
index 64a5d29feba1..7f0654182496 100644
--- a/drivers/gpu/drm/msm/msm_perfcntr.h
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -35,6 +35,27 @@ struct msm_perfcntr_group {
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
+	/** @dummy: Some compilers dislike structs with only a flex array */
+	unsigned dummy;
+
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
2.54.0


