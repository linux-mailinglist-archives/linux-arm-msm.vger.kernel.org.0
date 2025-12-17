Return-Path: <linux-arm-msm+bounces-85583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9231CC8DF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:52:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3160C3043AB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59291359706;
	Wed, 17 Dec 2025 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LeRcMR69";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tl2NmB2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD62C3590C6
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989355; cv=none; b=Qr0K4JmL3gV3qFIgMjlZ0AfbuPcgyGcgSEKgda0rV6VoBRS67wNhhPyHW3apXOVBiMx/jbYAtIRzEh4B9x7g7hTwbWJVolAC57aN4IHiNUtJ1cJZAH1OpzFYNVLb0UwlUArpN9pjXGVIQPrKWIblvqGetIpxsnNhw1nssWZRj7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989355; c=relaxed/simple;
	bh=qYuaoe5yZlmgj0Bqbs68hLea7hvaqBZAkEyE9xnmPwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0C8y6mciic8dZ3PIzuqKEtZ8J7FvLN6e9lMqIRDaG6LIDG7NAUqlIOQCGUaMmfhPgwh7nsijWwBpSEV3WN8vlNxyb23Go1PyhPFsVYekLlYKWLfHpqw2IHwtbhlDfkI4yVifneVxBEjC11+asH7PIvtU0XRGyMuoez2WuS5w44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LeRcMR69; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tl2NmB2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCL26S330845
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UvAnEUJpoxlkuq4/g/vjfhu/EQszMNOrrroegkLM09Y=; b=LeRcMR69RuQaAT9p
	imvRH6nlFTabwJHI3LhkizY3Xu5dOnYhcB0s2mRjdi03RBchhxsFPdsuw62yjxUg
	gEexRwnxOslHsfazap3OcejqqXwYSM4BtpilxMLiMIPqSmNsYIoTvW+Q2DhRI+tu
	tzjofFZPIzj99AoLNCn46DAdUbsPsSaZiUgMa3VdwNRlOTf+unpOWxo055VntdZ/
	r/+TKgfyeMZ0CdY9aGY5U3Bq/TAfMemwiK0wcopL7fciB8tfmKF2f0czKv3agiOY
	GimEhcngOxJwOqMueVkjSTDY21PiHJALjPGVq3OQtMSAsMov19o11NWuOUtVfvQB
	7e4WIg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e18v4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0d058fc56so53370905ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989352; x=1766594152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UvAnEUJpoxlkuq4/g/vjfhu/EQszMNOrrroegkLM09Y=;
        b=Tl2NmB2grNAQAopo629RsFxt201R6u/lb3irgENkCpK3D7lFCycO7kAmv6XYN7HnCR
         7YqMRIvAfJP98rgg2WMZk9k2oAVLvpkI7FUPBfMAj3E25tNZh6e6Rb3xdilvZ5KrN+Yc
         FGJJcyU757Nv31ZCK54l9dzb70Hcft6N63pDy7AnEpO3HcVyHujjyu0SKLTOoNrQz/Qu
         Sll9SurakKyzYpfNhtvk/sqgDXgrxqdEcuuliCLwGgBxoe4ir1x1zsUhP5X0KaAn7e5D
         0JLQYTUR8fnH2dBUphxg1I9c63xi8jxwOJudH6CmEjODYFJW7TYv1E94ENvZ75ntJFV8
         aAKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989352; x=1766594152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UvAnEUJpoxlkuq4/g/vjfhu/EQszMNOrrroegkLM09Y=;
        b=PXG5j9gD9CBX5CIuj+w87foDbgW3ZngNSTfYJkiRLKvfPKJ5PFX35YduOrW9TmWExk
         e0mx2qiOAWAoFnOdjUb7xF5uapfSyUXuaNA5lx/w7zzCFkMxY04n24u4AjNR0uqgQlMa
         LHZNayDEF34X0yOwq0XYBdWqvVWDbuG8kYhmakOBMXvxaGW/pmLuEICmvoExsuOhJbgr
         58sVkKcgk6mDTV76K9PWqHj4nv9X6WQkWg5+eiBMB1bx5yD/HvwdIB+Zu0rYPAChjd35
         J+CkTMRrN3BeZmyBpC+IUh0wLzntl5kUeud0Ic6qSaayVx/oCpHj9MehG9UJxOM6XqkT
         aALQ==
X-Gm-Message-State: AOJu0YzkoXWPFXPH1NGEX5Ve4Kop/AdVhSG8DkHuVhF8vml8twCa1gmv
	sSkmz0sT3lQtB9Lyl3DPWpdQ7hCDjj6/yZi8ZFw19KgQWLHzDYzmdSfrbTs4hSB59A0hK0RTvkt
	vdrhgkAJ0ysRr8f4L/+12odVM6zyk6aanjuSwBoDDxk4/Dfj6gyLN2PrprXKSNEN+kki2
X-Gm-Gg: AY/fxX5p+b+caTzOYTXSfpxsNIhEVNASo+PzaOWPSB8B7X/xu5wRjCgGwnEpnFMHIpk
	s0sn101HEBGjJ/1ZrDf9kgemSWgskM9M7qgccoBtg3BlfbpouH9F09V5e2Vef5fsgewamZ3AZtb
	63Nlxk3U+To7+LvsNSzR9xTxH0xVbC8WvhLREEZTp1BD64/X02vK7i9FQrs3aQOgjB9srU7CizA
	wQpw/xMqTt3hMuN9yedOcx3prwFFE4JlPHVztzXPtsT15vyYb3WDmr2BoJrNWsrHOL+g3xdFxBj
	k55dDQbssmFXxQsY9RKm1P7YfMH7Ynp2NYG5UObLGsE+Fvqu+fpWmh/GGGUeifVbAKLzCp8Avbj
	q1vDRE1iYqUbrMiNk61yvJOO9Pni2lqqPzlOp
X-Received: by 2002:a17:902:f68f:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-29f2b8a256fmr159984405ad.4.1765989352161;
        Wed, 17 Dec 2025 08:35:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbEQIOV0Z75PS6fp8HMNstrAnUoha1SBavGLgV2mvlvTEanQzsq6SMQStWX8B2Ob55H5y14w==
X-Received: by 2002:a17:902:f68f:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-29f2b8a256fmr159984035ad.4.1765989351502;
        Wed, 17 Dec 2025 08:35:51 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:51 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:48 +0530
Subject: [PATCH v9 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-12-ab7ac03e0ff1@oss.qualcomm.com>
References: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
In-Reply-To: <20251217-kvm_rproc_v9-v9-0-ab7ac03e0ff1@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=4517;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=qYuaoe5yZlmgj0Bqbs68hLea7hvaqBZAkEyE9xnmPwE=;
 b=w2iYpcGrgPsXPlh0Vs59+sqeE25cPEZgnkmEiucxeuLP6n3ygOGFsnS+qQwl++CgSsywsjp90
 AngiZjKfU6qDlrb7TvyfKzIgL/ZAk3NulAWQ34Lyn4iJogmJfwDbjI7
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX1NTN3A1svFNN
 QFGgbdw8L2GsMxMJffDUPmXOw+TsOcPUCj4/1jxKpAdgNkGKhGY58Br/uHxOVCcQ/ZzcJr0kRwp
 O+p4ell5iHNkE6n3vj8W8/zlCngLl8rOK/zgwbW9hhBNU2hVYZ9tcWn10G4xdSWV0FAptKXTjN+
 gRKatIR7XdwLkdmxkfn/+g+Sbg6+e7vYoIG+PdefUQvY9HunAndK1JsTWAEZKNjXOKziKv9Ddze
 DNfHD+Kx3nPs5HC3gvY+q9yq+DFCn5C2ogwyrsd+dacz9gw0O4B55M8wyB5h5E1DK7GRIAgF/yJ
 /CxSmduyeQmWBGVZrg/swOH01l49Xm+WalEqr21hP7vWJwIE6FNGmlg4UWOcSVtIVLx4SN2MLgr
 NltuHcs2joo3nVrL6/D+bsh4L30VpQ==
X-Proofpoint-GUID: 11LiFoKKjyqIbkOm3Ki8L9sjNtiWKxMN
X-Proofpoint-ORIG-GUID: 11LiFoKKjyqIbkOm3Ki8L9sjNtiWKxMN
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6942dbe9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KMz1R6K7GWUeRkMKapkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 59 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f746d2f39a1d..07754f3a4ef8 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -413,6 +413,61 @@ static void *qcom_pas_da_to_va(struct rproc *rproc, u64 da, size_t len, bool *is
 	return pas->mem_region + offset;
 }
 
+static int qcom_pas_parse_firmware(struct rproc *rproc, const struct firmware *fw)
+{
+	struct qcom_pas *pas = rproc->priv;
+	struct resource_table *table = NULL;
+	size_t output_rt_size;
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
+		return 0;
+
+	ret = rproc_elf_load_rsc_table(rproc, fw);
+	if (ret)
+		dev_dbg(&rproc->dev, "Failed to load resource table from firmware\n");
+
+	table = rproc->table_ptr;
+	table_sz = rproc->table_sz;
+
+	/*
+	 * The resources consumed by Qualcomm remote processors fall into two categories:
+	 * static (such as the memory carveouts for the rproc firmware) and dynamic (like
+	 * shared memory pools). Both are managed by a Qualcomm hypervisor (such as QHEE
+	 * or Gunyah), if one is present. Otherwise, a resource table must be retrieved
+	 * via an SCM call. That table will list all dynamic resources (if any) and possibly
+	 * the static ones. The static resources may also come from a resource table embedded
+	 * in the rproc firmware instead.
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
+		dev_err(pas->dev, "Error in getting resource table: %d\n", ret);
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
@@ -425,7 +480,7 @@ static const struct rproc_ops qcom_pas_ops = {
 	.start = qcom_pas_start,
 	.stop = qcom_pas_stop,
 	.da_to_va = qcom_pas_da_to_va,
-	.parse_fw = qcom_register_dump_segments,
+	.parse_fw = qcom_pas_parse_firmware,
 	.load = qcom_pas_load,
 	.panic = qcom_pas_panic,
 };
@@ -435,7 +490,7 @@ static const struct rproc_ops qcom_pas_minidump_ops = {
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


