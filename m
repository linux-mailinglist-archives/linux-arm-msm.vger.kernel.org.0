Return-Path: <linux-arm-msm+bounces-105423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9DoSIvmp82kd5wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:14:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5204A74EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 21:14:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 830A8300FED3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB02E47DD6F;
	Thu, 30 Apr 2026 19:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ebt6Fps2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxvT29CW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2A447DD7B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777576419; cv=none; b=esFZafCWqmkXP9p5bI8htlU3uoQH3/pfj103obGxIrSPEzexr6u2uvdBelvF4nDIbNaQS76Hkwc1Gwt4koA7yBI5ZGPgiFVsWGCCTvqCzov7Ot0it4x1sWNu1RUdaQE6OrRJiCULyNQSEm7y896p4wPg8ZJvurb8GXmLo2iEDsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777576419; c=relaxed/simple;
	bh=vQTOs5F5hbmMF5CdN3fXwEjeLVdnbugt9DYKaYFTxqI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mh9Psnn6UK8YteX4c+ol+f88mx+7dDXjkweEWcSb8Q2EgRfiMaDF3LmspUNpEGqLswuM/A+udGxFl/XUv6+mEHvfuNyOJti/Bz0oPQliFeQXS3lWEJb5mIsEx1RC44B790z5+fzX9JF4juWMT1M5Db0DXYwxsPc/JMpShZ0tGR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ebt6Fps2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxvT29CW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UFdYGY2099574
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yhsJwvkb8bA
	Oz7S0BxyR81fDBNUklAIpTUW63QuLPQw=; b=Ebt6Fps2U1vEAip0EC/SzZQpOmE
	duPvPxvN+rGEzagP5XDpGyAK2V/J6Ay/SUfGOWerxGSJxvMhlcsM5rlXuYVs+0dY
	CpJa0oBuBnoH4p8WQFcRanVyBEJm+cfyGbl92p4U02rQoL6eR82d7K5OJvB7cBBI
	LkBYAJByil79M19RYrS0KpJRI4VWgqGjFmkqaYHCPD9kE3nhTkuFxd0I9XIiU3Sm
	X0FdmozajTrR4qaGDpCn81SadiOIHKjzO5Y3bcbEz2J7WUEGbm9yO3OZ4BOnT6Xk
	zNEixzAPyRHb0oFb/+g5NYUYtCfqKmOS596nzKP0g+dG6Exe3694uj7l43Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duyr43xnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 19:13:36 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so901933b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 12:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777576416; x=1778181216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhsJwvkb8bAOz7S0BxyR81fDBNUklAIpTUW63QuLPQw=;
        b=FxvT29CWBIuPMo0XYYfsKnAnh22cnGdoFEH4NYNr57yz6X5y+ADtKKPL05XgIylQmg
         KmTl16N2Xbgo3J3U7cmnYUC5vsEtmnUg6S3je7sgfIgV22jh9r2hhv2dn7M+BR7ZvNJJ
         xPDpRA/MOPp3/XFQyWiLgHVbMpGmZDs0YVL8bEvhUI1iefsMqjP9jTEy2ujgXW8swVXN
         uTx8WKxwYWhEBDQSu+assvB1A1i8jhOarVrLjNpY9HjTsnT97TMxH0hYjhNpHSCw3pbM
         sKH4XHmfEHC5V4ciohdb8iIsQ/w8H3mpLibSZLmDrtS+TXy/YBZcTH/TlnUnIbDCHfSw
         Yskw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777576416; x=1778181216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yhsJwvkb8bAOz7S0BxyR81fDBNUklAIpTUW63QuLPQw=;
        b=R0DJT4+YkhwhrVMLtWkRnUkqoPKRHMKPQLHhaScQDxaOYc1Yj014U6sSbKjnEJ30wY
         1GocY7sAPN8jyzqf30LRh/1BALEEDKLXWY3Hdx8DEnT34qgypZbbIJZT85b6e0OaG4rj
         Z2gL/CeMTXa0c3g7oREYKPBAr0ZmlOvor4tKn6do6jk8cMCDPkxYHPO7NTcCdQONTaFN
         0PAU0BxobHMIJOgXqruAgSnEu90alaocN6cEG54rEdYX8WYikoghTLn0gYChP81jw+A9
         igLWY0hdOemNYs8eGoeporYFVKtVAO1CH28LC1PTfMtr8vZOxdUYW4b4C3IQlXgZdUE7
         M4lA==
X-Gm-Message-State: AOJu0Yz5fq5sAoVc8wBd7w8+UwX7zQAw5UB+KDpTd5OH0X/XW2znIE/9
	DbdHcN0gmLBtmNobw9RUUs1OQ7PvApa7sMdjgAUep/JYOkvUNvmx0Brd8uo+CWQn6MbvMrJTfTt
	NSFNu4J0UMotvGEKo9V4Y5c7hhus3HM2GTI1NADmubnK3KbXFrb2EjCI6Q3LVT1Uf+xbJ
X-Gm-Gg: AeBDieuDcOFLYKZ/b53eVnA8P57mSro+TiuI/GfMRYsuBbFohsJbDVi9g12RhpEQEnr
	RKS+naWld1y1aCFymwgw/mjar/PgqBdcYab6etTnTU5dSgHD6QjU1vAWld1/CE7TqnfkjKQNxsQ
	2FGD9ulrkV5JibV8/+vp/gL22GcVPTeEJAqiguzp3xt8+q8lzbQBy0IYKmXpubnrnGcZtzLYnp+
	U01StGAM8kbzE2zfj1OKDqbEDJqO0XKSJXRV8CrGqZSzYUwXqF022Gfl6rGiRY0kWQaDUO5bWgS
	0QGdDJpJacg262VJNpMPqNGcwQgcFcPIlFJ2fLx+YWRhAJO2XR2QR4BBq5j/okIBWgJWmvjEctd
	JOU9QlqoM0j/JkHQ61Rt5d4GLoMnxzzPAPgzSGNx8SRxhW4TA8Y90gqWmtfY=
X-Received: by 2002:a05:6a00:124d:b0:82f:832a:75cd with SMTP id d2e1a72fcca58-834fdc6e6bbmr5320083b3a.39.1777576415788;
        Thu, 30 Apr 2026 12:13:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:124d:b0:82f:832a:75cd with SMTP id d2e1a72fcca58-834fdc6e6bbmr5320043b3a.39.1777576415143;
        Thu, 30 Apr 2026 12:13:35 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm373640b3a.48.2026.04.30.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 12:13:34 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v4 4/6] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
Date: Fri,  1 May 2026 00:42:51 +0530
Message-ID: <20260430191253.4052025-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bJcm5v+Z c=1 sm=1 tr=0 ts=69f3a9e1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=7V2Ei1Jl35HJmCUZiroA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE5OSBTYWx0ZWRfX2gnQlru6Ojsx
 WatAiWDbfRIXc83cFQDYfoXvoPTJfP8dpBwbjBWi2GKhXlWLcyLDZSfjfVzuzzxfc7Znf5Qmes7
 BZ2HY5aomBE5PB1My5z91KSDbK2pqcprR9tl2KNhV1maAUY3NLnsf0IXDD0u2o2x6IIxT103VmY
 f6FuowJ8QhFe8TTicCQgVA/firSdqMeMv9VsVdXDPoN23emkYmEc9xpomHnVodLlSLnWtJOakeQ
 D4Q6r+CRmF3nk/I47fFz+xQ6a5HyLKok4Hb0S4CIy+paJr0vr86vy4Wq4Q0vQYqD9TLmO2gJXzE
 NJ4IFrDbq1L7sE7ZKMagkTLJY9rRQ1ZE0Hw2eXSmiknK5yKpKjAkRtMC+Z4G8pRBYTEiKZ81spe
 dn8ZIlS4rvMsP7DoJqHxnyegkDHaxng9acDwCWPudQv+wfMl8E/rqlZn0JXfi0U4NnlcgdBRsle
 Se1kL7fxnBWxXw4bxhA==
X-Proofpoint-GUID: aYhW9qKB9vFPKouy3un2pLu9dr-eiJuS
X-Proofpoint-ORIG-GUID: aYhW9qKB9vFPKouy3un2pLu9dr-eiJuS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300199
X-Rspamd-Queue-Id: 2B5204A74EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105423-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]

Qualcomm remoteproc drivers such as qcom_q6v5_mss, which do not use the
Peripheral Authentication Service (PAS), always map the MBA region before
use and unmap it once the usage is complete. This behavior was introduced
to avoid issues seen in the past where speculative accesses from the
application processor to the MBA region after it was assigned to the remote
Q6 led to an XPU violation. The issue was mitigated by unmapping the region
before handing control to the remote Q6.

Currently, most Qualcomm SoCs using the PAS driver run either with a
standalone QHEE or the Gunyah hypervisor. In these environments, the
hypervisor unmaps the Q6 memory from HLOS Stage-2 and remaps it into the
Q6 Stage-2 page table. As a result, speculative accesses from HLOS cannot
reach the region even if it remains mapped in HLOS Stage-1; therefore, XPU
violations cannot occur.

However, when the same SoC runs Linux at EL2, Linux itself must perform the
unmapping to avoid such issues. It is still correct to apply this mapping/
unmapping sequence even for SoCs that run under Gunyah, so this behavior
should not be conditional.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c  | 45 ++++++++++++++++++++---------
 drivers/soc/qcom/mdt_loader.c       | 18 +++++++++---
 include/linux/soc/qcom/mdt_loader.h |  4 +--
 3 files changed, 48 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a64fbf7225aa..6f9fe38fb1c4 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -141,6 +141,18 @@ static void qcom_pas_segment_dump(struct rproc *rproc,
 	memcpy_fromio(dest, pas->mem_region + total_offset, size);
 }
 
+static int qcom_pas_map_mem_region(struct qcom_pas *pas)
+{
+	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&pas->mem_phys, pas->mem_size);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
 static void qcom_pas_minidump(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -148,7 +160,12 @@ static void qcom_pas_minidump(struct rproc *rproc)
 	if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
 		return;
 
+	if (qcom_pas_map_mem_region(pas))
+		return;
+
 	qcom_minidump(rproc, pas->minidump_id, qcom_pas_segment_dump);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
 }
 
 static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
@@ -241,8 +258,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
-					&pas->dtb_mem_reloc);
+					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
 		if (ret) {
 			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 			release_firmware(pas->dtb_firmware);
@@ -316,7 +332,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
-				(__force void *)pas->mem_region, &pas->mem_reloc);
+				&pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
@@ -507,6 +523,18 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static void qcom_pas_coredump(struct rproc *rproc)
+{
+	struct qcom_pas *pas = rproc->priv;
+
+	if (qcom_pas_map_mem_region(pas))
+		return;
+
+	rproc_coredump(rproc);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -515,6 +543,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.coredump = qcom_pas_coredump,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -632,11 +661,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->mem_phys = pas->mem_reloc = res.start;
 	pas->mem_size = resource_size(&res);
-	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->mem_region)) {
-		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(pas->mem_region);
-	}
 
 	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
 						       pas->mem_phys, pas->mem_size);
@@ -655,11 +679,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->dtb_mem_phys = pas->dtb_mem_reloc = res.start;
 	pas->dtb_mem_size = resource_size(&res);
-	pas->dtb_mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->dtb_mem_region)) {
-		dev_err(pas->dev, "unable to map dtb memory region: %pR\n", &res);
-		return PTR_ERR(pas->dtb_mem_region);
-	}
 
 	pas->dtb_pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->dtb_pas_id,
 							   pas->dtb_mem_phys,
diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index c004d444d698..ed882dd43587 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -11,6 +11,7 @@
 #include <linux/device.h>
 #include <linux/elf.h>
 #include <linux/firmware.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/firmware/qcom/qcom_scm.h>
@@ -478,22 +479,31 @@ EXPORT_SYMBOL_GPL(qcom_mdt_load);
  * @ctx:        Pointer to the PAS (Peripheral Authentication Service) context
  * @fw:         Firmware object representing the .mdt file
  * @firmware:   Name of the firmware used to construct segment file names
- * @mem_region: Memory region allocated for loading the firmware
  * @reloc_base: Physical address adjusted after relocation
  *
  * Return: 0 on success or a negative error code on failure.
  */
 int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
-		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+		      const char *firmware, phys_addr_t *reloc_base)
 {
+	void __iomem *mem_region;
 	int ret;
 
 	ret = __qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys, ctx);
 	if (ret)
 		return ret;
 
-	return qcom_mdt_load_no_init(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
-				     ctx->mem_size, reloc_base);
+	mem_region = ioremap_wc(ctx->mem_phys, ctx->mem_size);
+	if (!mem_region) {
+		dev_err(ctx->dev, "unable to map memory region: %pa+%zx\n", &ctx->mem_phys,
+			ctx->mem_size);
+		return -ENOMEM;
+	}
+
+	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, (__force void *)mem_region,
+				    ctx->mem_phys, ctx->mem_size, reloc_base);
+	iounmap(mem_region);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
 
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 82372e0db0a1..7c551b98e182 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -21,7 +21,7 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t *reloc_base);
 
 int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
-		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+		      const char *firmware, phys_addr_t *reloc_base);
 
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
@@ -47,7 +47,7 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 
 static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
 				    const struct firmware *fw, const char *firmware,
-				    void *mem_region, phys_addr_t *reloc_base)
+				    phys_addr_t *reloc_base)
 {
 	return -ENODEV;
 }
-- 
2.53.0


