Return-Path: <linux-arm-msm+bounces-105425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDS/AViq82kd5wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:15:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A10DC4A7559
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 923843062E77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:14:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29B547DD4C;
	Thu, 30 Apr 2026 19:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InKNgtBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sy39ABph"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4533B47DF9C
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576425; cv=none; b=HNE0iIR85yOLK3uelAqynlypG8GBDexkvsilO4+JKzglp8hu3UNwSGenIe7x9DjyKeSYuj1Fr5wEAOZCYMq6Sn35Wvyp9fHeabS5FL4Bxzqf7XlDXIP2gspB8wmZeqWcn0vbOoxE9WCbEHOYl5W1qqa7PcS+ukWp8tBvbY0cY6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576425; c=relaxed/simple;
	bh=5A056jzGoE97ciTmd15TMvzUAfqNBpsSYmrnZzYb3T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sH23LKP73Rw2excGQjpBLXtvBFgi80x+xIRaMzi9MErvQIAS9Nj6gupZmCnSsUB3dO3507SXdX/RjmeKdc7CYYt262IR+1H5yjGhVf/uUt7yeIuD2XV3EcQrjZJzO7xOmiXSA3dl41VhvET7MKcs8hke9IyBPb8OZzkQUKzYDzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InKNgtBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sy39ABph; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UI9fh81988252
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2EXjzs7S+kYLNtL9rHiPcEmgW9Hm+LLRRuA2nNHZe8=; b=InKNgtBwe0MTigdK
	3kZwGJUbV4toz2M/idSiiDOu9OaFrBB0OPYI6LzkpW8iYzHNKyygIuepMkhPOsoX
	6bBQ1i04XP0cQKJ3b+RuPiztIBU0DDZlunTZg048+MhW+6EQcclGt0pi6Xgycvke
	DGcO4O0DEMnE6I27H/Kl4Zex+8Iampy4orfyaOAJHTIMefvU82pcf8qtNrFzVDbn
	s8DzoxKwLU3U9uMtGNAMYEfFqfQdzlvo3EM8kboSFCb+/HZY2t6bIUjHhv94VV1G
	rvX6fB1ELuyS+jmHH9cP5tAY16XP7LPw3geg2j3zPrIGRsSwcVWKIIo6FMWsPg/O
	KinjTA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvc458aun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:43 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f74f0e3c6so852388b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576422; x=1778181222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B2EXjzs7S+kYLNtL9rHiPcEmgW9Hm+LLRRuA2nNHZe8=;
        b=Sy39ABphv0174ZYYYd/K++/w7N+zOYkZVYEY51BPKhwrc2pv/PAuwJX5lebf0nJF88
         iD8DLiT2upTsmcBehIlpLU/Y0nOCxXMQpFQpD5U+MgNjldUk8QwLD47vHm8wgpnYNWEQ
         lNyvbiccgBcRJ2Rq4SFoY4BTvGO7pGaXmuqrEbf4OHnePzkjDpNayV9oUNwd9UfRoZe0
         HathqCzmPclLFup2e7vbUJ/6Xlpn9DHR86zju5v8yDMeqsdHO52GhJNhk8EhYDsXMYKG
         kipi3kZ2nAr8+YI3Lcz8tMXqUXn9gFbKv4oJPlU2e7WThG2ZOEcLY4LLgkSH2/9NV/zd
         dxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576422; x=1778181222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B2EXjzs7S+kYLNtL9rHiPcEmgW9Hm+LLRRuA2nNHZe8=;
        b=YX0HQj5HRMc6hqJ6n/xNhpksaE6J42/C1WY+DcIAL0vV2UJEbmCJqc7zzG9KORQSh6
         ygWnzI8wrtuf8V35p8utZv9ILwpHQdbcdPXSXWwvn69dfUtXniIaXxt+IV4y5pavsEhf
         Fz6DNk2+hqTcYKx6HtyM7/OzA5vLFMr/55ORbCLkMKnX8HGAo5EI28hYI61gcIiDoZIJ
         zap16IakMo0bXtKadIYhhrgull6/ADOpandlNdZMdoUl3HtiEL44MysFWIlW3JNcBs3A
         kU5uE1ZOTxr7S/HaF6JDKGXaszhoxgeR5TPj+3S1yRfIy+4zWEgm8W8i6wLiOFFfVuY2
         8uMw==
X-Gm-Message-State: AOJu0YxjuH+oMUsDJAzLPITPin91MxvFIgKXdAXaA7vyBo19mrb+xKeb
	ffrZ5a4+6qrS+31PBWfriZErB9fFhN7bZbYYBHdcwTwYAU7misXAimrxKKVni7ba9zFcDjvSBNE
	l9taUdbklwVJLgJPorSOiBVOkASKyVGJ8TrpFQ2UgOC6wlM/EDVsXP44Yz28OBMwfnPIg
X-Gm-Gg: AeBDietwTi2aTTt/lpNPeyjVdirU4tSlLQayKBPJPyRpJ5D87XJtOCuLy79clcXGunQ
	MBmLzFnYzL7WvORJh6CVc/l6ffVfUeLoCs9g3Rs4WzTLxEQtCG5AZG0s2qHRD0YmsoOW6coLGWy
	gzdAfiO0baL6sBdnW8vHhC0euf+d1o6RlrSqm6uvoy2Qk8NquDSk0bbJxVXP38jLaTVYCGg4LPw
	jqIJNBzwiyq5ltZvQHw+uHeQ31ZKB5SyJ9V3U85fI8hRAJo5nWCF3DI6azyTAgQEAHedEFG66nJ
	mufW1/4PFNQtgF6hjC23Cjl/ENuy0BzvjVwDK2sfzT58GH+0swP6WJKZNX67QIwAvHWKE72Xbu+
	4tfIjcYHBeb8Qodic2cnFHPbjAOJT7r9Rbxk8dzKIaRP3c64jL1KVtHdMjkE=
X-Received: by 2002:a05:6a00:228e:b0:834:df57:9d67 with SMTP id d2e1a72fcca58-834fdc16541mr4811157b3a.32.1777576421823;
        Thu, 30 Apr 2026 12:13:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:228e:b0:834:df57:9d67 with SMTP id d2e1a72fcca58-834fdc16541mr4811102b3a.32.1777576421239;
        Thu, 30 Apr 2026 12:13:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:40 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag in PAS context
Date: Fri,  1 May 2026 00:42:53 +0530
Message-ID: <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX1yC3OaFGuwzg
 xjxHuFlQ39pK89OfErEi0XT7hnxUGjaycQWqfH+yf6+3NR9y5A9VEwpAVmfzM3q8NiXjRT1RBoS
 QFpBr8C11UyGcBFHa7pFPhGh1MkOzgb/uneKIK1GxheSHgey8M0o4OoHcyk/Wy4DbJrnrJN5RHa
 tmq0wnKLMLpCiVQ11zG+gtp4WA3/Go2sLRoAbwU78cyoZ4PNRQUXarEU7YURgyfdUhQi6IqHA0w
 h6vpzb2sE/dhWrjQa4If2+pgEW2RmfEiYfRBbFq1A4rdOzKCX9iCyCo0innUvbGGloiawLa7lKQ
 OIa80p0s6xikprAo5cKsGvfbj0FE11hZ++31qEHnl/85gaspTd5Jrr/DaqYtuY3rD3U9F30Xf3Z
 2YEca5CnhxMhZgwMhEuUpGpIGUNritSReT7Vc4gcqCWCFUJ5qyx2vZ0Xfhv1y/9/EU1jgFlpenP
 MK4TN4DoTg0Q4eCHy8A==
X-Authority-Analysis: v=2.4 cv=DP+/JSNb c=1 sm=1 tr=0 ts=69f3a9e7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=g7xFvzIaMl2GvowGQBkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: g0M_FxOFNCOBVEWNW7hwxqkmVdD4y9w5
X-Proofpoint-GUID: g0M_FxOFNCOBVEWNW7hwxqkmVdD4y9w5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300199
X-Rspamd-Queue-Id: A10DC4A7559
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105425-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The PAS image initialization path always retains the metadata buffer
when a valid qcom_scm_pas_context is provided, even if the caller does
not require it. This implicit behavior leads to unclear buffer ownership
and forces new users of qcom_mdt_pas_load() to manually release
metadata, which is error‑ prone and incorrect.

Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
retention explicit.  Metadata buffers are now freed by default and are
only preserved when this flag is set. qcom_q6v5_pas enables this during
probe for contexts that require retained metadata for subsequent PAS
operations, while existing callers continue to work unchanged.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 21 ++++++++++++++++++---
 drivers/remoteproc/qcom_q6v5_pas.c     |  2 ++
 include/linux/firmware/qcom/qcom_scm.h |  1 +
 3 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 9b06a69d3a6d..2cae35e7c583 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -651,7 +651,7 @@ static int qcom_scm_pas_prep_and_init_image(struct qcom_scm_pas_context *ctx,
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
 	ret = __qcom_scm_pas_init_image(ctx->pas_id, mdata_phys, &res);
-	if (ret < 0)
+	if (ret < 0 || !ctx->keep_mdt_buf)
 		qcom_tzmem_free(mdata_buf);
 	else
 		ctx->ptr = mdata_buf;
@@ -707,9 +707,24 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 	memcpy(mdata_buf, metadata, size);
 
 	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
-	if (ret < 0 || !ctx) {
+
+	/*
+	 * Some clients still pass the PAS context as NULL. Until all clients
+	 * switch to qcom_mdt_pas_load() and provide a valid PAS context, check
+	 * for NULL before dereferencing it.
+	 *
+	 * When a valid context is provided, metadata handling differs across
+	 * clients. For example, modem clients pass metadata to TrustZone that
+	 * must not be freed until the authentication and reset SMCs are
+	 * invoked, as the buffers remain locked until then.
+	 *
+	 * Other clients free their metadata immediately after the PAS_INIT
+	 * SMC call. Therefore, keep_mdt_buf should be set to true for modem
+	 * clients and false for others.
+	 */
+	if (ret < 0 || !ctx || !ctx->keep_mdt_buf) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
-	} else if (ctx) {
+	} else {
 		ctx->ptr = mdata_buf;
 		ctx->phys = mdata_phys;
 		ctx->size = size;
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 5be3070fd52b..7858e14c0bee 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -669,6 +669,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->pas_ctx);
 
 	pas->pas_ctx->use_tzmem = rproc->has_iommu;
+	pas->pas_ctx->keep_mdt_buf = true;
 	if (!pas->dtb_pas_id)
 		return 0;
 
@@ -688,6 +689,7 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 		return PTR_ERR(pas->dtb_pas_ctx);
 
 	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
+	pas->dtb_pas_ctx->keep_mdt_buf = true;
 
 	return 0;
 }
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 5747bd191bf1..6d8d3deb02e0 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -75,6 +75,7 @@ struct qcom_scm_pas_context {
 	dma_addr_t phys;
 	ssize_t size;
 	bool use_tzmem;
+	bool keep_mdt_buf;
 };
 
 struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
-- 
2.53.0


