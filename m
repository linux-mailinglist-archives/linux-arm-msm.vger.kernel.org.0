Return-Path: <linux-arm-msm+bounces-114207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n2oCEX16Omqx9wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:22:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 663326B709F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:22:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=hN+2ckoR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=MhuYyVTs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114207-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114207-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7780D30A4BE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AFF13D5C1E;
	Tue, 23 Jun 2026 12:21:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2592B26F2BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217283; cv=none; b=UhWGlXnJa/+qmkhjmRRxShGQC70CTGceii9HeQrmeZ0SpBTIJcnVYMzpqNZsQSwbxcpFwLMV73KeelgXgucLvzPVYmfQnhiOHu83yRJFF10RKlwDhv0GOoi7E4f+Jz95XzfcQyVMEfGA8Nt9l0Q06roZ5lrDktaev/ui/b7o1ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217283; c=relaxed/simple;
	bh=0a6sGTnW/ivApoSTTdCDBkct/L9ipegiSq3EoaQIfLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q1beQasGgyi+LPOkUFtd4aHkxXPDLSie9Mh2JoHqciFvh4k1/fGRnc0p5tTMMJlrC4JJdObGx/jLN4i3S01AEKMZvd1uGGgQqUf1G6PbF5P3Ioogw8fp2ePS2GVyoDGKNJW5prp1MkN9wU+RHAVvwE7eCRVYjI+Xzq+Fp4Pd9kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hN+2ckoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhuYyVTs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYtPQ113975
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o9QcSJ5f45T
	1iVf+TdgPgzAQzuE+vW43HSQ7Okp/gZ8=; b=hN+2ckoRJn2Kj2ng85HOhbwW+Nz
	N9o5FvUgYGk8RJSpx3jDan7nvRF2hkJ4cmM1q2B3X74EbQK4mL7teRb4lPVCYQV2
	nm3iVtAirug4ZGRodY3fqPcuMWkt1QrKLdbhddPs4ApqdvbZ/bHEvyDyGTkepyay
	FMyWOQZtLMP2cnp/mvUEf9EPRO+kpmziENzl55970PvxtVwlN8kiIhQuI2wm/3Bw
	lwa9+ayuJXWvc12K7Lc/z8YM+tsFQ7fZ7s/GxV0t5JQCU9g4BGFWW+EZsPR54ggQ
	vcluBN4dKGwWq2CE5FSfEZywmB+LzK/wdaiDNvigU107RCAeL4kHjhJ9qnQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvsdu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:21:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423efbfb61so4084436b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217280; x=1782822080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9QcSJ5f45T1iVf+TdgPgzAQzuE+vW43HSQ7Okp/gZ8=;
        b=MhuYyVTshg95Sx7qcU5hBzbHrHXYRh8jL+JC3uXmCslXOtPei0/Rn9CG9QGYnoSE1g
         r7eVmWGRnpmbq851NT7a3fSvbiw9VcVVM/b/jZyL/zGcEIYz12Rla7Bv5KV0jyCQi1YL
         q79EF1yd//3v3cNfacN9WRwxXtT2Ewn6Rd8XwH9ja/WSgs//Mwxqj1jQlFpW8n1AMhES
         LbF51P56dNjzXfSaF1fBJhcv9zPQPeofQgOCe8P6qK3uzUGrfUYB/LdSRTKe2IayRQ/K
         ZF0FYrhRDzmURDudo0hDj2K8gL+7MCd7NO965e2dzzUner6UUD5yHRIHWWlhHRDmfHJk
         8ozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217280; x=1782822080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o9QcSJ5f45T1iVf+TdgPgzAQzuE+vW43HSQ7Okp/gZ8=;
        b=Q5C/bNFBuUhHH30CF+Lnw8ITYb65UKagvoK2/kqvyHa0Ev/ciW8UuhKm/rYqNASjUA
         Q8YuwERA5pqn0rt3g81vWD/425qVc9YbN+jqVKXxSTeddm4hg/qbAy+uoVCJn+2q0foM
         9SOiR/LUdBAC2aydWsILuDtynhV7JzHeCGhUd5iFLBd+Wif6RBptj0RA0QGByLsn6XxN
         XfaiIBbhDFn5eXL3owzKbiIoJurs0SZmMLmA6/6+9ECzsnhGjlpalncwhMGGQGBJOVeY
         rb9bpAl1QMyWIObjDh/bNqQQ+Dl32g6LqyPr3nrE0/4QkQv3ET7PnSo+r/udSkMh3bcm
         Z8aQ==
X-Forwarded-Encrypted: i=1; AFNElJ/eJfZcI91mE1/puDBuFtLVqNpe/+SpBeh6uJ86bklBsJaPRR2MeB0W2bC7Kwhh5YtvLa6FKx+GKSnMMmeG@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6zgfThFdIFpRuJ/vj+QNbXLDxZ2EiUuv+MN5cVMPcwth5GUAV
	QaOnG6lmci9QlfJIqhFhivtNahGg9QWkeb7bIjGE4MxH9HsuhQiU7uz2cd9LDj/HxDcY/HO4low
	RWGVurGvr0E8LIrnGruny2s18UmTWxhrNGpqc/DuXjFa7P8J4wyd19j8AHtMiGHpFyTG4
X-Gm-Gg: AfdE7cnTq+sHG5T42HxYqGLH8DNF6WTvzC7MmsBZSGyVCSTvUEw08sx7nNLNQEKr1m4
	UNqYW5gLMIyAQChRVHiwaE6esWzu18L6KbPtV9NFqWdDksr7iknNgrDhaUhtR9IuqkndSlm7u7q
	qK7/WwL+2vNvAJ6Tras4g3ewsITH45YjJKQook+HaWcdi/Wq3B1G8KcMvQvHeZMip1IbPhlmKPc
	NKk+J+Uczhl64oHJXFbjL7dCgwmUj0OnwHRpFE5ALhCWiegGra5DeZoCi5UTjcjmDIufnGUdXdS
	Lv2UPZb3lQgyYl7db9tq4FeVBeg5fQnfISi8opy4cA/KTOJP/XABKhOrmQOtO0yZX0V26NnYAz+
	M/pLH/HCDAkd9MWSBJ2jrZmP00nYrlI6HDGBxzg==
X-Received: by 2002:a05:6a00:2e8f:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-845970aff20mr2692022b3a.19.1782217280060;
        Tue, 23 Jun 2026 05:21:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e8f:b0:842:5634:3c1d with SMTP id d2e1a72fcca58-845970aff20mr2691983b3a.19.1782217279518;
        Tue, 23 Jun 2026 05:21:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e74646sm10171856b3a.29.2026.06.23.05.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:21:19 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 6/8] iommu/qcom: Add NULL ctx check in TLB invalidation paths
Date: Tue, 23 Jun 2026 17:50:32 +0530
Message-ID: <20260623122034.1166295-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
References: <20260623122034.1166295-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a7a41 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9AnWiAp10G-6W0uwed0A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX5FGWFR63wWKP
 0nOpFPNGlxkv6c81odkSCFmF9fTOeeqyBQBHAI2WgCGaAj0P5ez9BDqYhg12oZXIHtOqT+D7XTo
 9HjBrqj+WhKGUZL5rRTzwnHracNkrow=
X-Proofpoint-ORIG-GUID: G41RvsZ2M8Fv2BKkUofHD5Y8neQD7Mv4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXynrrGxt/SV5I
 zu8lX5INJ40LwcMk0CFwqNXBVj1uQpFXdizbwBvmzx8oaDi0ftVwFZwwXR32cYFaAQ3t0J7WfXH
 50UdCnkEXNA3vAkAIMP6vnIsSbRcJUwWFqs9ALod3EiH1S5hR+7fRTq+K8GmyKRCkVkkdBUjj21
 LmdDkjBxRLkJo4RWr7a3mmf2/Vpfa1+bBKh8y+y8F3knkkGsdlTWPFnUSyAAg0mPPGYH+otJIyN
 nRBjmEXZpUOvDF/sxtJSNPIz/2ULTZPs5se7Ril9kA74a5htzMitV220Z2/iNuPvcsg8Q9kjCyw
 2TUydu/h3cMTxV+lSyGCMORLu3KgeJUWRt5PFhfeD2QjZqbI+xTxXGMnZS48GwGBp8cE3oTz6MZ
 iGEFc1qMtUgmuxYQVEeAnAUtqXCzV+OEqy0i/ydXZuRnJAJgZbIia3NEOSJ7425JJGJKnBUIHKy
 OpNNiOYJrosON/95zRA==
X-Proofpoint-GUID: G41RvsZ2M8Fv2BKkUofHD5Y8neQD7Mv4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114207-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:joro@8bytes.org,m:robin.murphy@arm.com,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:mukesh.ojha@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 663326B709F

to_ctx() returns qcom_iommu->ctxs[asid], which can be NULL if the
corresponding context bank failed to probe or was already removed.
qcom_iommu_tlb_sync(), qcom_iommu_tlb_inv_context(), and
qcom_iommu_tlb_inv_range_nosync() all dereference the returned pointer
directly, risking a NULL pointer dereference.

Add WARN_ON(!ctx) guards with continue so TLB operations skip
broken context banks without crashing.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 40fb0408dc07..51b60b296bb8 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -121,6 +121,9 @@ static void qcom_iommu_tlb_sync(void *cookie)
 		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 		unsigned int val, ret;
 
+		if (WARN_ON(!ctx))
+			continue;
+
 		iommu_writel(ctx, ARM_SMMU_CB_TLBSYNC, 0);
 
 		ret = readl_poll_timeout(ctx->base + ARM_SMMU_CB_TLBSTATUS, val,
@@ -138,6 +141,10 @@ static void qcom_iommu_tlb_inv_context(void *cookie)
 
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
+
+		if (WARN_ON(!ctx))
+			continue;
+
 		iommu_writel(ctx, ARM_SMMU_CB_S1_TLBIASID, ctx->asid);
 	}
 
@@ -157,6 +164,9 @@ static void qcom_iommu_tlb_inv_range_nosync(unsigned long iova, size_t size,
 		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 		size_t s = size;
 
+		if (WARN_ON(!ctx))
+			continue;
+
 		iova = (iova >> 12) << 12;
 		iova |= ctx->asid;
 		do {
-- 
2.53.0


