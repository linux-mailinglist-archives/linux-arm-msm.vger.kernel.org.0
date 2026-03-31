Return-Path: <linux-arm-msm+bounces-101132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGnFJ7IczGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:12:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF00370696
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DEFA63072D28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86B33A4508;
	Tue, 31 Mar 2026 19:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h31wKqA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AlOQFTr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CCD3A542F
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984357; cv=none; b=XojfXIEMHPB2GS0Gj4l9+iMDyAqdNuWTMdXEo6MOOov0c8JNJBNcu5u8Hul6rWvF7sGz4jvXZr04YfSxtyh2H+ihwURhZGmmtoxtSpLn3f3D78QKnwnksvlT+ce/Lw1Raw6vBIhGaILg+gTz2aJqDKTTPvTNmsbLnEvxVlO+vI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984357; c=relaxed/simple;
	bh=CfWvFcY0a0QaSEJZz0QjNG+5MUryLpJm/WsxCG8scXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkGLs4F/3KAH63bTjVOjthKYoq6dwf13RdfsklGO2U5TG57it0jdgL8slzZw7RkV8raFQ6w4UQnIpQwDBhcwQeW1HhcRH7LB2JqzZBcFqnsvAysCcuUPIU2Xq33XLbwVXw8hZGlhT+PpIqllKa1aAQPkAgVT9TU06szIee5fRLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h31wKqA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AlOQFTr+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VIGuv63081376
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FluWzygXOBW
	xoaRlB1Fiz1Y50rkfwJfEXPlqlyJSfsY=; b=h31wKqA53I6gEFhU+PPkKKZUAZ4
	vBig+1Plf9F0H502WqL3oIMSL8FMoBIQ8GTAuEuzFC+yhEd5FvabV8n1/WMzYI5Y
	EztsReMRhP47yrRJkk70MTv7fEoINAOzsfjfMlizKmxacbDUM+nwLwlofd/980PM
	SVkkWtwDFesXaKyAEIzj1xTlmgnghNQscDX8s+qEQRAcHlizyNf9nrggtdhE+BYu
	xSBaWEg8CI5JFKwvowaYgv7kmuTCeND0BPFcfQtqj6FTbdqSABr6VnBqzqajDghT
	J2IXnq1qojPm6bURbIvpnWE9rc0pWEYuSnYEJvRnxKF/loC9mp8sMGn0wDA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8kdkr6gu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:12:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so31737435ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774984355; x=1775589155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FluWzygXOBWxoaRlB1Fiz1Y50rkfwJfEXPlqlyJSfsY=;
        b=AlOQFTr+32fGXFcyZZdUlAOVpguUKJowvl3ZnoRcI4iLRhJie8LDK1sKhONb+Pek9T
         8K55rPJll/pyedTWfCaya052vKyk6fPDOM2lNndprSJnyX9p+vXkAtZQPko2mPwdNhG9
         bjCgQdJnfkRALms7VDfYDsGfEglbnqcnaoxdox9n1CqEy8dsslUWK9RH4Rh9pyYUSwqw
         twKS6urodFpBLnvqPrmWD6mandToT9oUM3TGEh6FAYsMf8Hx88F9Nr4rnYddcBHAYi3k
         SvEi5xyPRKc6efYV+quStCEXTt0OAAE86Y0G83Wr+RnQ0dKvkE953rAB1fE7xhztJo2B
         YQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774984355; x=1775589155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FluWzygXOBWxoaRlB1Fiz1Y50rkfwJfEXPlqlyJSfsY=;
        b=ftBU9/y7FB8zoirgka15KmsV57jNISHjlyq7vqOgaPIlThJRDeX0Y2pxs52sdSBOsK
         BlIqTRsFOGWaJumDhUsPu+Ud4jxe0wvW7mANv0wL6QWhj80j4leqx/67vGviG/p2NffJ
         3Td9C+dcVSZFy4ayArsSEF2gehGZYrgiEqAVtkFxj2Hgc+ZFnXyUHwzjtnwcvMwOVPD/
         QTbSg0uF4iU1ep5Qe04XPTYdC5s2hNeY1CeoTCLKNHkIM13e/WydX2SaZfSkIRTcPpLI
         5aCbJN3m7s/6hz0UbPV4nYlyCG3f/m5FNO5AxKDJKFXyU6eKkvQHyE+Ro9Yhgf7a5a3c
         nBEA==
X-Gm-Message-State: AOJu0YyxVtM8qGg39n08gzndJYB4Irj83lpkT9jHYOgQe5AQXsefgaCd
	ImmdivahndbFI8ku5TLhfPx7uL+8MH//BsuuJegcrYePQl7KO16Jq0RxHEURVh986FdLcg2oFtB
	Pvs5kF2qTsbkNhtFnBYYbhphFq40QR3Nlvo52A62Sk1sJwUmwX9ti5pxeF+Z3Va7l+IbF
X-Gm-Gg: ATEYQzx8Naf6cUTaC6javDIBp/mvPO/RszKMSgLCjyLbph696AP8HhRk6FGcyuBGyLD
	ND1LOTGHVnzx7YCTYfCAI71kI4VkHUngWD/ZxQ9nCDo8dKHf337NhTzEsHA32l0mKYWVUYt9mOk
	HL/4dt/fCvLzPdwBZsNs0uEsFJVBc16M1qBtoAmR9aff7l030J7O1l/ffjyoDiDaxHY7cteHk4E
	+AFoYKf4VgImGbCVzFVN7Fh4L3o40UT0ZfvNVMSOxXfCcmkpUOaZ+eCAvfDh94B6K1NFGWRQpqw
	j+8ylv1GJkNtlljxmhNWMOep8LTmj7IXs4P56E/80TnelPjeBzZonyuWDMZsFztIKxXIPg96vkO
	fGTGBg3MIrmpJ19tG3eHxROABVR5RLPRWEH9rJVVLA9B+sizv
X-Received: by 2002:a17:903:1b24:b0:2ae:aa16:acfb with SMTP id d9443c01a7336-2b269ac0e94mr3920575ad.22.1774984354399;
        Tue, 31 Mar 2026 12:12:34 -0700 (PDT)
X-Received: by 2002:a17:903:1b24:b0:2ae:aa16:acfb with SMTP id d9443c01a7336-2b269ac0e94mr3920135ad.22.1774984353791;
        Tue, 31 Mar 2026 12:12:33 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24265aafbsm152784535ad.19.2026.03.31.12.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:12:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v3 4/5] remoteproc: qcom: pas: Map/unmap subsystem region before auth_and_reset
Date: Wed,  1 Apr 2026 00:42:09 +0530
Message-ID: <20260331191210.2019758-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
References: <20260331191210.2019758-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE4NCBTYWx0ZWRfX9jOdRfj74QwA
 aJu65SsHIA09IWFNDvBY0Uvyiz8cVWtFoFeYiMNuzGk290eJI3vgITbvUfBIhhU1dWlqyiyfzTa
 w50fKEjrnAsTsPDXQz2vArgM4WaXrOONTOl94OPGRF4oAiMtbw+o0gvx5XLdPNNvM+T9X5IYbsO
 El9HumpP5Nk6ExeA6xwiCr0++Of4+JOJxZfxMZ5ILENzbADkwCKOdlz5JBvU+gHncVtKqnr61Fq
 sN+Eftnhs+p3Qt9K5c8SlDCRtKgXbN28ae1LQz5l2xa5SBweamqwSeezyeZGUopIon/FGmAhtep
 54AlJ+6BH6d7G8nSynRqDASpuie+/k+nH2niWRN7bQmv+afB6+EZGCg5+l69OAQVB8sgBBwgCCZ
 dvGFf4+khynxLzVH3S0k8pJRovCOSZjl8xtwiXiE1Y9xxU5FJDnYjD7IFddBf04MbdkR+x30nTA
 sl2KDI9IottuhXUwn4A==
X-Proofpoint-GUID: AvYHQwaRUmhHBrsZ4qhNF2wlqePotuga
X-Authority-Analysis: v=2.4 cv=YsQChoYX c=1 sm=1 tr=0 ts=69cc1ca3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=4aT82il_tmYRb662WK4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: AvYHQwaRUmhHBrsZ4qhNF2wlqePotuga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_04,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310184
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101132-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1AF00370696
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
Changes in v3: https://lore.kernel.org/lkml/20260325191301.164579-2-mukesh.ojha@oss.qualcomm.com/
 - Took care of sparse warning.

Changes in v2: https://lore.kernel.org/lkml/20260310135205.2497789-2-mukesh.ojha@oss.qualcomm.com/
 - Moved map/unmap to pas_load function and further to coredump/minidump function.

 drivers/remoteproc/qcom_q6v5_pas.c  | 41 ++++++++++++++++++++---------
 drivers/soc/qcom/mdt_loader.c       | 18 ++++++++++---
 include/linux/soc/qcom/mdt_loader.h |  4 +--
 3 files changed, 44 insertions(+), 19 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 4768e5b5e350..53780efa8be8 100644
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
@@ -241,8 +250,7 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
-					pas->dtb_firmware_name, (__force void *)pas->dtb_mem_region,
-					&pas->dtb_mem_reloc);
+					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
 		if (ret) {
 			qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
 			goto release_dtb_metadata;
@@ -320,7 +328,7 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	ret = qcom_mdt_pas_load(pas->pas_ctx, pas->firmware, rproc->firmware,
-				(__force void *)pas->mem_region, &pas->mem_reloc);
+				&pas->mem_reloc);
 	if (ret)
 		goto release_pas_metadata;
 
@@ -511,6 +519,22 @@ static unsigned long qcom_pas_panic(struct rproc *rproc)
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
@@ -519,6 +543,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
+	.coredump = qcom_pas_coredump,
 };
 
 static const struct rproc_ops qcom_pas_minidump_ops = {
@@ -636,11 +661,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
 	pas->mem_phys = pas->mem_reloc = res.start;
 	pas->mem_size = resource_size(&res);
-	pas->mem_region = devm_ioremap_resource_wc(pas->dev, &res);
-	if (IS_ERR(pas->mem_region)) {
-		dev_err(pas->dev, "unable to map memory region: %pR\n", &res);
-		return PTR_ERR(pas->mem_region);
-	}
 
 	pas->pas_ctx = devm_qcom_scm_pas_context_alloc(pas->dev, pas->pas_id,
 						       pas->mem_phys, pas->mem_size);
@@ -659,11 +679,6 @@ static int qcom_pas_alloc_memory_region(struct qcom_pas *pas)
 
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
index c004d444d698..675c17109ad9 100644
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
+		return -EINVAL;
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


