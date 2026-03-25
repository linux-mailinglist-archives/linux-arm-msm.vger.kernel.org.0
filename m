Return-Path: <linux-arm-msm+bounces-99938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHt1Ft00xGkAxQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:17:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEFD32B1DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:17:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4190A311C8F4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0353C32470E;
	Wed, 25 Mar 2026 19:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tf04pAlI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OObF0pAa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCCE350A35
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 19:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466001; cv=none; b=ZPd45jpxbXCNP9N7kuTpvgRymPhH5VxYUSGqZMptVUSiqsYnLLhj0ZSwCySeu9CGMQ7fMoo6qTMWU+PbQZYGsi7xFjTLv76sBcPflPPaaSZv2qXdvbeUt5C3YalK1t/ggCdH87hmXLhGwytcip923G97XkNFU/YKQr0m/LYdfF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466001; c=relaxed/simple;
	bh=JuW09jaLv43h6WkzRWhWfuWSNmoTe2++rTIaF6Qpk84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsSVvfmgRPz23Ieot5XEC0NrLbxdDs7Qr4oux1FDCYCg/+zV+htaoc/xl0XxYE/AMCGcG+s1L+Bz4EcB4VWufJ+nyvHjLPDWyBQYxGj+3Ib61/5JkNJZwspH0NwLUndgLUtBYX/HivpM2mbXsA8tJrdFNsFrpRiePRXgKGbso7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tf04pAlI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OObF0pAa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH5rf1554659
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 19:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=L+D7Q3NsycO
	SbfPPL0GRxbVBpYFPZc9f/EDs+I5ad30=; b=Tf04pAlIBp75im9QuAsTxSSQzbd
	RCJsiqkGH7EZNvcEzo+j5D7chO2dvtQYsFwLFA+Or04UbjcbVzAcExuZs2ocapBa
	EiMl9nQTFtHcOnRWJz9va1KW3nOxcChfOySSsrZIP9oQTHJT5d5RXNptX4nCyzJl
	5pJB0WxV+oVMPOq2eDUoyYkn/3ieuWIqVpzs8PXkpzLLbOa7YqZ7MhlfNhpGsUA8
	e2R/kFZDMPFMmyfKKuKI0+9z4m6KiFZmaXIHjjpZW+hEAXsmyxkchcegrZnM3MzF
	qtwL3uigb8cc7nXGFPTSdj/S/fP/iCowb34uyrfqsOH6IMkdEeojPWbhyOA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4gj79bjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 19:13:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35b8f351debso383349a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774465999; x=1775070799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+D7Q3NsycOSbfPPL0GRxbVBpYFPZc9f/EDs+I5ad30=;
        b=OObF0pAaWmeupe+QX4PlQ9msfigwUQK68LRjkhuYy10QghNoC/xDXl826AK1BysLLR
         UibvP7cwPb5twnZpN+CBSKu/78wiDHQ0Czb112TBv3AZ4/tA0bd9tCBvd6xDDDOghD1J
         gyZ7+2C/jGoqD73qoU8V+h1nOsoLIVuw4N8xf2SGwRx4i+pLcmvVAc1/LqWjBxwsW2z9
         uqZtniPeKpMkqW2RLoSYBcgi+F2F13x4M0hsdJGZvVJL6sZdYrjjmDpXVB6djuoE7SSC
         b+uVC+N8Yyx7BgUrYPf9HIW+NdczEbhTvsc0f+CTfJN1eFzRCc17TCrzv678AcZ+gV+X
         JIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774465999; x=1775070799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+D7Q3NsycOSbfPPL0GRxbVBpYFPZc9f/EDs+I5ad30=;
        b=mK996nJK/s+c5gTH81lFNjqliZ4AeuKYns7H4XPNRrrt7BZwuAC015VhM7nYwMpDPv
         0AFgc3IYLS/9QZnGeq1jIhgPr8ed3fMtrhlucGhH5dB20GeucckJ3V/CdV+MqHHml+DI
         UUN+2YKuJ4VGcWAdVAxnYv7sAzX+wD8EQn3TcC48qS0rJ1OO2WIm/xOzVJBuyTOOqry5
         f76ANhgfemqK421DiHCL4iK6cT0uBkVNc2WGdqS2EFWiTOc+cmT7TWDq20y6i+U7CbvL
         6JoBViX/GZqzWYhDC3AgCl5hJgCo1NLtvMoNH/o4UCfGAW4BI5xmICQ1q2b6Zxjoedul
         EpMw==
X-Gm-Message-State: AOJu0Yz3C6z5PsEEGmlXxKP5mof3tckiCMdVD4fCFPBBdhrEE8iVzD3Q
	/lm3SK4JpBi53TqGDsaZ+pz9lv2httwwQiYb2g3MFnt3JaxuqOLa6dW9feGXPILReEd1RDkNhOq
	qGcSj5uXoMLL+8IajGwDLndLm0/lemf/xW4qzq9ca1eCjdcuHl6SwhnuXJxnxw8DUvRRFejTzE0
	E4
X-Gm-Gg: ATEYQzwwxEL+fzKkN0VyS6T369pvd6h74frZmHSuSZokAeRZpIHLA6CbJY3QU8OUyui
	26ZBB/eUGB/xZQbUU6rVA4YvJpyZ5j6WvHzRkYKehslQQqP1qmdinFlnEJfpSBvvNjhZ04bb32b
	ZSMKJ0v867sC7wNR9qAkFeBI0gdHAa6Gdj1XnIEJcBqMVzNY+672t0MQgrrTDKODVytS0vX2Qdm
	wmO4Du+22l49bSTmfJOaq2VoIn4EkIVHNGfD0O17WbhAqlv1VPsgi+CGVHz/gowVPcI71c/8tXj
	qGvkt49RKA4bb573gyfADkMoXwGlSM7fnG/1JGoSqEClt9Th8HGDwJvIcqBRL4RxrydOWEJQwYf
	L5kFE0PfrCCSmhaoI8cjgfup9RfYGuVvMUc8WlJ4lpL1KpeoL
X-Received: by 2002:a17:90b:3a05:b0:35b:e4f8:55ab with SMTP id 98e67ed59e1d1-35c0dce9bd4mr4589556a91.6.1774465998588;
        Wed, 25 Mar 2026 12:13:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3a05:b0:35b:e4f8:55ab with SMTP id 98e67ed59e1d1-35c0dce9bd4mr4589520a91.6.1774465997967;
        Wed, 25 Mar 2026 12:13:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1dd36ef9sm76379a91.4.2026.03.25.12.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:13:17 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
Date: Thu, 26 Mar 2026 00:43:00 +0530
Message-ID: <20260325191301.164579-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M9hA6iws c=1 sm=1 tr=0 ts=69c433cf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pGcaN23jOmXheONn8IMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0MCBTYWx0ZWRfXwatU5NR7G3B2
 sS0bz2ZSrav/pEqChtuwfbUietNIbZYiRK883zE/FtfPzT5THUALmOCt5F/ll0Ngvu6kWEkq7MD
 Lc6BTMC56rC581G1lKl0IUDcK1q7x735y1AKoOuF9MYQWVxSOT7o4Vz3T4X10x0ozhX7cFFIiSn
 kbXTzhK8m+NQ16BqC8CqlHKlHahMNjKRkwM9jc0FqLhpoppnkwZcLpjH95h08lNC3foNWx28DMq
 FOpBV0VAJG71cOU8FfS20jSlSHhm/iOz6c5nmkftxDlxvde8Iiwwfh0umNw9JGXIAh0Ud6y7+uC
 BnsEon3jeIPNcTtoLE48AtgJ3jMmQAvFKbNsZNKjRA7iK2zJKldJnQA0xio3CVToXOnRRKQDpYv
 yOXDgNXaB+ahQx85J00qqz/t/Affx6BSYBFAwiTq1bqYNytcCmvZ4EK8yZcybnkGLrxUzi45/FF
 uvQl93u6tdGrQUMB8ew==
X-Proofpoint-GUID: y-mUtX_BbMOsAf2UTr89Bxsf-6j6tUKz
X-Proofpoint-ORIG-GUID: y-mUtX_BbMOsAf2UTr89Bxsf-6j6tUKz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250140
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99938-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1BEFD32B1DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v2: https://lore.kernel.org/lkml/20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com/
 - Moved map/unmap to pas_load function and further to coredump/minidump function.

 drivers/remoteproc/qcom_q6v5_pas.c  | 40 ++++++++++++++++++++---------
 drivers/soc/qcom/mdt_loader.c       | 18 ++++++++++---
 include/linux/soc/qcom/mdt_loader.h |  4 +--
 3 files changed, 44 insertions(+), 18 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3bde37ac510c..c8c143fea1b4 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -148,7 +148,16 @@ static void qcom_pas_minidump(struct rproc *rproc)
 	if (rproc->dump_conf == RPROC_COREDUMP_DISABLED)
 		return;
 
+	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&pas->mem_phys, pas->mem_size);
+		return;
+	}
+
 	qcom_minidump(rproc, pas->minidump_id, qcom_pas_segment_dump);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
 }
 
 static int qcom_pas_pds_enable(struct qcom_pas *pas, struct device **pds,
@@ -241,7 +250,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, pas->dtb_mem_region,
+					pas->dtb_firmware_name,
 					&pas->dtb_mem_reloc);
 		if (ret)
 			goto release_dtb_metadata;
@@ -321,7 +330,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
-				pas->mem_region, &pas->mem_reloc);
+				&pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
@@ -512,6 +521,22 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
 	return qcom_q6v5_panic(&pas->q6v5);
 }
 
+static void qcom_pas_coredump(struct rproc *rproc)
+{
+	struct qcom_pas *pas = rproc->priv;
+
+	pas->mem_region = ioremap_wc(pas->mem_phys, pas->mem_size);
+	if (!pas->mem_region) {
+		dev_err(pas->dev, "unable to map memory region: %pa+%zx\n",
+			&pas->mem_phys, pas->mem_size);
+		return;
+	}
+
+	rproc_coredump(rproc);
+	iounmap(pas->mem_region);
+	pas->mem_region = NULL;
+}
+
 static const struct rproc_ops qcom_pas_ops = {
 	.unprepare = qcom_pas_unprepare,
 	.start = qcom_pas_start,
@@ -520,6 +545,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.coredump = qcom_pas_coredump,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -637,11 +663,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->mem_phys = pas->mem_reloc = res.start;
 	pas->mem_size = resource_size(&res);
-	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->mem_region)) {
-		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(pas->mem_region);
-	}
 
 	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
 						       pas->mem_phys, pas->mem_size);
@@ -660,11 +681,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
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
index c004d444d698..33f3543f8e55 100644
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
+	void *mem_region;
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
+		return -EINVAL;
+	}
+
+	ret = qcom_mdt_load_no_init(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
+				    ctx->mem_size, reloc_base);
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


