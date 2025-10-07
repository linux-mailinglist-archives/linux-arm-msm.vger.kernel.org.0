Return-Path: <linux-arm-msm+bounces-76248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4845BC22C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:51:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0227619A55ED
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 638E32EA754;
	Tue,  7 Oct 2025 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvGrNIO4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9771E2EA73D
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855796; cv=none; b=IqajzrwOFgk/gaw61j2w2j8XX1Bp5ooYjjCBpfWyDt+bPv6KezeWbP/ADGlHs37kUOxak6A1ivEkMnLrX0PLvZ1BaXCD+zBzGHIhPITiO+gunre2dcHC1zIs5iepU0vMoOS9S8BuA8iwB+wLaPo+vxKlsjv8IIUi1T/0CjHrA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855796; c=relaxed/simple;
	bh=z1QANoF5R7XjUfSd6H1T6pJE0Sh7B2+LMNkBRlo24CU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAzU4XxdmcpvyGgluvDVsIHA1CiBJ+PhJA9pWDO+qLDUk8J/k/zWEwRsBdH+qCzlexTfMW+ikD+hMY1GYTFv9uKc2nkt1dWECh7RU1/P3+AbKadnvN+RC+fZN68AvvNPoYSifROtum85dL9tOQeZFotwcDsQbXFmJhhofhdGeQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvGrNIO4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET8SD007126
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TaLai26LIfDvmmGlyEsDFdePOfnLzruH3EdS7qMRxcg=; b=MvGrNIO447XQc8ee
	5xU2eigkt/BO4IwmbYNijb0O/NWzJJPl80l0S8KpNP0+ShI/eq4U/FXhtDl4zMS/
	6e9meMrjQ8+7TrQqZGUZK+8Tbh7m6SWFBDbPbfjT9jBwF6NBTKwZubGFuai7cyqb
	bQ7lj6sq7CeGIG37m6exyLem9BJexxo7ceuJdvsqXcEEP/p39GzMEf86jVlsHyNQ
	MR9B6Q0rC7cqtxgcCIRi3VbE+54Ry/ZtKR4DqcWDdN7RZT5wo+CpQd27YR+LOCIA
	UBmxwe73SydPVE9RQ+IOVFyT5eCHSp53CCfKM9+/qpbNunkWHbmJb9aE67JxbFoW
	T1cCvw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7qtv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:49:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2699ed6d43dso64227585ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855793; x=1760460593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TaLai26LIfDvmmGlyEsDFdePOfnLzruH3EdS7qMRxcg=;
        b=anBxXo4twEwsPm2ke/z6HA03tar9XN1qeU5MCL7QxbqyDokNVECnT8t0xcVsxEKSTs
         vH3W3tTa5gMg85v00GeVQ2aYcaoG3SbKUZWzY6HnGFQqGck9wakXlGZY3AgQyUZ/35jX
         FEQgJRYEbFLaouanoEkdyrCgDsENfUQHfq02MpOR7Vta7aoNwvL4HABoKbwmEaPyqOUT
         WHRtn6lKuGGZqagbJqOnwYYob5tRhVCGBevRXK4UO+RLa8mUsobtDZDBoUVJzSwXehL5
         Fzr2xsl/ip/xFRVGiF51UuWX7f9Jf5tdb3fU6kmalO+8BK3Y04FrJcxWa0GSDGXflFfM
         ft2A==
X-Gm-Message-State: AOJu0YytZ30MY4cBbhIwsAlGCNd5kUcKaxKPUFV7QDzVIuI7gRGxFJN1
	l127R9uk8cKcqlqcrjVVG2nQgyQR6PJlK7uL+LIJtR4mBgNBLYZmzEB60+wX5ASir0nmfZd9We5
	AZVU25CMFOxGMoODv9wgHHoHFzb7Lz2K6Txzwz5LZ5udQtnBSsb6PAXq4YIZu1Bh0rLnF
X-Gm-Gg: ASbGncuSZqMQra82g2yPq1F6GcDDI+rT0U/sRpVegtVydN0TsYMEOpNwSUw49FHJj6i
	WEdLEFEo32kG56gsjh/xNvrLihC3G0dxuq2+DBzRyq7+DLlFuLNzYGiOc+6xqC86k0XYv9tJZAp
	8EYWFGKC/AN077k1BOnUKdZDokiwHXtpN9eLxr88LHfdTJjnozR7y0xGVtVKGCxHkIqzQ3IOQE+
	XaM3PLihzHNb3q6EuzMyw+0Nr2Gsa/TfHRuiu4boEZ/t7mpCKsdNcLxSRPWroeviyKBmjOUYWOZ
	wPbYkqq/DJ9SdyotE6zHXTELg9mP67Ckz/IzoKa9fbjMzVqMwdgvAfL++E3ytfUEBeBC9W6g
X-Received: by 2002:a17:903:fa6:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-290273748e4mr5773205ad.14.1759855792494;
        Tue, 07 Oct 2025 09:49:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8TDfVd+6wKCu0QMGvlQmp8DxYDliBXJBLtj0ipRiCfpZtBbh1EWFROLGdmlDrkThvRevybg==
X-Received: by 2002:a17:903:fa6:b0:27e:ea82:5ce8 with SMTP id d9443c01a7336-290273748e4mr5772775ad.14.1759855791791;
        Tue, 07 Oct 2025 09:49:51 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:51 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:55 +0530
Subject: [PATCH v4 10/12] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-10-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=4661;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=z1QANoF5R7XjUfSd6H1T6pJE0Sh7B2+LMNkBRlo24CU=;
 b=1gI4rCJyvUWYmOCWI4RG2FEdbbUbSzgmpvJ3M26s9x4RPeuELNYZscH/BwFu7TPAM80/lxxZU
 k/88Q3DY3RECzrs7mqi66xAlVCx7+2icbpB0qpHb4Rc1Xo54un2KO5O
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX0PjKvPP/YYpH
 rjzfSbpzHY3ABPXZIE8eP+ijOuVJ272SS6JUdzx8bv8q2e0lgO1k/9AfIMT7N4mkP30rSH7K5xX
 WC0o6lcGRkvUyxK981kY+gnx6Kb8nlkviOohLL5pL/+VOw+q1FO/bQYgnw9RkOvBprncCl6orko
 GH6LKK+VcFiJpM2XnmdsPrRWJozk+Vmu9CVa6WkOjltEfQ/puvE6MkdE0n8sUXEBCJL3H17FIk5
 UT7ojHtsPAC2gTD1Vodof30ixGgkVTp0PagM+wdYLenYxSmkfZki+aRFEW++G1BDRu8LPn2L7Yy
 nIOk6vwE+4A4Dv6DK4Xqdi6odxLYs+5aoVloE06mRWouteoZHuPI7rReBGAf4e6qVSZLxQexJuY
 UMAbH1tSiZ+Zak8dp3us/vR/ioFUPQ==
X-Proofpoint-ORIG-GUID: ydPszYdXZeAzm10MCzGxdxECJXeX7MAc
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e544b1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=KMz1R6K7GWUeRkMKapkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: ydPszYdXZeAzm10MCzGxdxECJXeX7MAc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

Qualcomm remote processor may rely on static and dynamic resources for
it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
or older QHEE hypervisor, all the resources whether it is static or
dynamic, is managed by the hypervisor. Dynamic resources if it is
present for a remote processor will always be coming from secure world
via SMC call while static resources may be present in remote processor
firmware binary or it may be coming from SMC call along with dynamic
resources.

Remoteproc already has method like rproc_elf_load_rsc_table() to check
firmware binary has resources or not and if it is not having then we
pass NULL and zero as input resource table and its size argument
respectively to qcom_scm_pas_get_rsc_table() and while it has resource
present then it should pass the present resources to Trustzone(TZ) so that
it could authenticate the present resources and append dynamic resource
to return in output_rt argument along with authenticated resources.

Extend parse_fw callback to include SMC call to get resources from
Trustzone and to leverage resource table parsing and mapping and
unmapping code from the remoteproc framework.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 60 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 46a23fdefd48..ed7bd931dfd5 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -34,6 +34,7 @@
 #define QCOM_PAS_DECRYPT_SHUTDOWN_DELAY_MS	100
 
 #define MAX_ASSIGN_COUNT 3
+#define MAX_RSCTABLE_SIZE	SZ_16K
 
 struct qcom_pas_data {
 	int crash_reason_smem;
@@ -412,6 +413,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	return pas->mem_region + offset;
 }
 
+static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
+{
+	size_t output_rt_size = MAX_RSCTABLE_SIZE;
+	struct qcom_pas *pas = rproc->priv;
+	struct resource_table *table = NULL;
+	void *output_rt;
+	size_t table_sz;
+	int ret;
+
+	ret = qcom_register_dump_segments(rproc, fw);
+	if (ret) {
+		dev_err(pas->dev, "Error in registering dump segments\n");
+		return ret;
+	}
+
+	if (!rproc->has_iommu)
+		return ret;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret)
+		dev_info(&rproc->dev, "Error in loading resource table from firmware\n");
+
+	table = rproc->table_ptr;
+	table_sz = rproc->table_sz;
+
+	/*
+	 * Qualcomm remote processor may rely on static and dynamic resources for
+	 * it to be functional. For most of the Qualcomm SoCs, when run with Gunyah
+	 * or older QHEE hypervisor, all the resources whether it is static or dynamic,
+	 * is managed by present hypervisor. Dynamic resources if it is present for
+	 * a remote processor will always be coming from secure world via SMC call
+	 * while static resources may be present in remote processor firmware binary
+	 * or it may be coming from SMC call along with dynamic resources.
+	 *
+	 * Here, we call rproc_elf_load_rsc_table() to check firmware binary has resources
+	 * or not and if it is not having then we pass NULL and zero as input resource
+	 * table pointer and size respectively to the argument of qcom_scm_pas_get_rsc_table()
+	 * and this is even true for Qualcomm remote processor who does follow remoteproc
+	 * framework.
+	 */
+	ret = qcom_scm_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt,
+					 &output_rt_size);
+	if (ret) {
+		dev_err(pas->dev, "error %d getting resource_table\n", ret);
+		return ret;
+	}
+
+	kfree(rproc->cached_table);
+	rproc->cached_table = output_rt;
+	rproc->table_ptr = rproc->cached_table;
+	rproc->table_sz = output_rt_size;
+
+	return ret;
+}
+
 static unsigned long qcom_pas_panic(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -424,7 +480,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 };
@@ -434,7 +490,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 	.coredump = qcom_pas_minidump,

-- 
2.50.1


