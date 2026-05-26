Return-Path: <linux-arm-msm+bounces-109867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAoaCyW2FWrKYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:03:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D61BF5D83CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 17:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 58C473085C96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2BD8407CEE;
	Tue, 26 May 2026 14:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvnzSAmC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ULYY8Tgj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4D407567
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807258; cv=none; b=CatyVz2c6GHaUnwkNFXyxaBZPDfVLiCDMLGI3SGdNd8IJscq/L09zEWRt4jztPGN0y9LpVp6Wv+3gyaLa84mJX8/FumNL/OF2UZLaRl/S4lmVNxC90UVwrWgScgzAnq4fYTxXn68i1ulbmteUTUes2d0/09IUCtvN8LaDpgfVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807258; c=relaxed/simple;
	bh=kr1CO7sl7TPhLtjzqwjEONqTeXB0g9GRZzr+aOdE6l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jOu9aonzojUG6ZW5d5m/OIt2/Nb46RttaNlNoC16wzHZ975q1rkZpOrfnH8oNwRWd+tgt2Cwy1H4VFL19kuB/A/0rDwq5bLh6AW0qA18tIR0hK5wj6QcF81H6eJH13OCfOPIL4tg+dL1l7h9EbkWtetYfjn9XHh8jPN5OHjap50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvnzSAmC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ULYY8Tgj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QEI91Q1361088
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eGbs2wuIzx4
	oRW315cfu7taJ31oBbt57nbm+n+nx9q8=; b=ZvnzSAmCvS9f1iVT1P+Yu9uIfh4
	R/9ljsXmBH+9d5QcRlel38W6uDA+k7kPJKfJTR5gsOBMR6wv3cSG7x9NbnSahi2u
	Wb/1EaPlGppMBKkQYkU4kbzg7JOXsG4Pojr60M0NwrEYlI+DQev1X4a76rNzXXwN
	cObj7IKn+V1UWhhjc8xa0gHeps7Aqr4ojHq86cXZnRVrnY9GAr+q9dJ3qi4Bs1Wn
	DAfn4ieSuRuTKFu5zaGwFoSsPZ8Ge1SgcHxoXdK/bmp1RPdxF1UxFfjf/fOrTisq
	y3BFyqcfHWYqwbO2kdyqw6EEittXYIk6Wq8Uiyns7944epFy8QmUFdI9sug==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edd5ng55f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:54:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba115ab6bbso116555505ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779807254; x=1780412054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGbs2wuIzx4oRW315cfu7taJ31oBbt57nbm+n+nx9q8=;
        b=ULYY8Tgj/+LwMbZNNNn/nB8zGWF0m0ndXwGhN1E8SKdIeevCqMUGf20Wq7ZEjtoSrs
         pU7Uxe0DjiVq9KTDnxSBKtHSlROTwwHg4ehM+BrVDd782aFMLzDECyPGsbbzb78aOvhq
         usso2NTaKfAEu49XVRi+gOFahB2KlvKGtMJoh0tJDPYsYUILo8DULHnDcg1QAnv7TXh0
         Bii4Z34m6Tra5O0DIA3pd848XTWU0RqlfcqFwg74PI4mH5sHLFM+A+HQi5mauJW1cwu9
         MpnDajml0Q1n4oR/M3btlgWjdr6I53xSx0FdvkBbCotBM3JuZC9wVbkv9kc0GXNYHCtJ
         fgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807254; x=1780412054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eGbs2wuIzx4oRW315cfu7taJ31oBbt57nbm+n+nx9q8=;
        b=kWzp5Sn2mXJKJeLMu+xJysOFOFfhlOkn0UyBIpTxAZ9zMtYQcYjG5rxDuxOU4dlJ6P
         AGd7dhUpN8KQjAcuIV2ohTy63KHM/Az3dC7WV0HBJF0m9BbRdOouoafR4WFIDM/8PTgh
         N/QDT82Tet7RSKu5OK6e/cDMlzxEfela3BjvyHmfAI0B+FMj9LE6KdxVqt5k+wnUh8sZ
         Fi/34u2iyLlhwVmq+Dyns+70HVqH+V+Mu48zz7vPRipbetkym6Ec8xN98GxpxEl0tJLl
         caelt+eEbnkm2K2T+QawyG5cwkdsYgt8nOXjnL+35VzAMgrXCfEkQd76b90U/ZVEcOXf
         pY8g==
X-Gm-Message-State: AOJu0YydiO+1fhqkXnnN1cGkW8gm1FDmANyySTVxn+i4swWSVDSl21BF
	dSdivBP8AGpCIiEjA2bNIi4EkpUZCQtCHF5f+du482tNF3yYcufYu49BMRMevJtgFzX96n/ZbwL
	5JRup8W0ONe6me2BlMX5P8DVQUwqqCFPwDGAMCQG3mgPT1jnYbMKqaChxjQ61oqSrNh+L
X-Gm-Gg: Acq92OEHPHwPoDu2X5Y6zz57P/M715wlJ6heZZluRuPgraNScI5zD5qmrMv498x5qy/
	I2PCulWb7mlK9zRRuh2Ktw3AuwlQvpgzu1x3EDJ7vPA/Y/D4ALlNDN5N1fW52+IBlmU9l5FrhSm
	LdxM7+R5gP2EawHCIkuTLMhAxjO9kQKqOgpczBmyKpDf9y/t2Ad8q/jOKn/W/3gvUB+VjE24VJG
	Kd0c53WabvoEdMvYzVJ0cHexy0bPSGeObXunwA2RihxG7Qp4Y/aRpGG62gSjeGDkiIuiqgGh7T/
	7KhgKgyQvkwOJNXyKaEvxTY2Es+2KrlQsg+N+owTvR1H/zrqV484Pq1YCf4yf2XRSvnavwYdn98
	8CR3tT3TzJkWI5VpwvLuwohgX7I05PfOA
X-Received: by 2002:a17:903:1a70:b0:2ba:73c4:4a77 with SMTP id d9443c01a7336-2beb06bdce0mr214471115ad.9.1779807254328;
        Tue, 26 May 2026 07:54:14 -0700 (PDT)
X-Received: by 2002:a17:903:1a70:b0:2ba:73c4:4a77 with SMTP id d9443c01a7336-2beb06bdce0mr214470685ad.9.1779807253823;
        Tue, 26 May 2026 07:54:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695b83sm117891735ad.9.2026.05.26.07.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:54:13 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v10 09/16] drm/msm: Add per-context perfcntr state
Date: Tue, 26 May 2026 07:50:43 -0700
Message-ID: <20260526145137.160554-10-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-GUID: oIEEur9zlBZjv21OfvFUvvWR7ljmQDXo
X-Authority-Analysis: v=2.4 cv=TZ+mcxQh c=1 sm=1 tr=0 ts=6a15b417 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=OtV_UDYxk2hhjaRdRjwA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: oIEEur9zlBZjv21OfvFUvvWR7ljmQDXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNyBTYWx0ZWRfX82cQlbaDuQc1
 vslUW93rCNqA0a4Y8dIpGFwdLxXqYYl8xtm/O8QjUT5hcNPkJNWemqHLvCIdFkc98vDJbsQOnDK
 2+JVMr4R6g+q2QyUQt41pTWhen+ealkgY1Bu7CUEd+X4zGg9vBSiAuIIupnD9mnrMtcKAz8fzRg
 iYVu9rls3HozVUAu299eo8+gQPBGd71162Mj8IJJc4BxVjgO59CLLmOrP218xsYfHWok0zfeUBe
 fYwR/Rsc1DQBOLV/oJtHpdrzt8XCmwiOBqisbYBm6hCUbOeUxoXfSfwCuapUR7SMaZ3/Kzp7BDW
 WekkVVVAoHpip1fM9V3Yr9jIayG3P+p0m7vjL2Nl0wSVD11TUrXXy/MYnyMuPv6t9PZO7MqKw2U
 0N7Oal8pGzcV4+zQiVdV4xe3cxvaiwJ9fDsn6NSIROG4Ek7HSaF83JPbcmunx3FAQXOPKuJIAMo
 iIya2r6Gn8HC1BpYKvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260127
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109867-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D61BF5D83CA
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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
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
index 8b0d627b2779..d73f1ad9039d 100644
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


