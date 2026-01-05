Return-Path: <linux-arm-msm+bounces-87444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10607CF3CA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C949309481F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:24:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB23733D6FD;
	Mon,  5 Jan 2026 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiGHyrck";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q6SXGtro"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE8933DED6
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619447; cv=none; b=sBMSaRC1lxcIaY2/LXu7dy5d2jZDAw7Gyd2VdhhpElOs14bBU9KJzLo3/XiOJKHa5npMsRUsEmuVjbbIDUsYecH6yadD42J3p/xZqdg2xbCcFcLruRsYxwt7LfoqVJacmtV8VmHO6U4+Teq2T9q04Rvn1EeHtfBRxOVMPatTLgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619447; c=relaxed/simple;
	bh=m+YAA/mlyrayWpYlu2DW6FhqLXxGfoQH2bEiKAJCyR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZjM52NNGoHawC/zolpUwG5I9B2xnJgsRvXY1omJbCKdRqrumSZs5DKJu8eiAF/ean7F2XlBF5Vyx1NmrpHgLHRORGqn0ikrMutB8AkVXPWDpqJM/3isTiIJEq5hZm0jNS28vSLIN3cVwlU5QrauSIFnKUrhJJKpf5+Yf5N7F78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiGHyrck; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q6SXGtro; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605850CW978589
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:24:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0h6ucEALCph7uDH9PI/I+8bZyfrAXR/0NCw42yTCYY=; b=YiGHyrcke/l66AhQ
	4z6AB1GbTK24Ays5qGJvBo2Zkx2tXllsMV6FNb+dn8XNnoVDFlD6q9rfpyICsfhI
	r/NdkFG9vpin7pcikIjAzRzScbL3gf4yb0AgtPbZ7yylm9zlPBt1wDvEaUOVTOEV
	Xwr9bDQE96GNJU5KXILVjWbsQoWKRBwiHVoCfZkYGqIZN8XQGge0MArAQXiw+VcO
	2X5wwevTl513q4MBRP6SK30AedZ0LjW1Zv//6ygj13312C0k3F9EafXdzQx41epj
	TbfxOFgNgL3z9z8HodYR98orAzDzA6ciShNIDw/kGgcAXYa2dCQk+wmsn0KKgrlO
	dapf8A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg9ftguyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:24:04 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b82c2c2ca2so26383915b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767619444; x=1768224244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X0h6ucEALCph7uDH9PI/I+8bZyfrAXR/0NCw42yTCYY=;
        b=Q6SXGtro0Efyci0XmMnraw/NdVR66P7l3setUzVAGSwCpdq+H0YBVgHVqcE9S0xxq0
         onVBiM9y5qdj5DN8JGJnXua5+2nf4s2Q9eJ2KmH3kxb90mOOEawYPjA2g4ZyER+praX+
         1VD7MWZu5WsGf2GhsByUYQO1cMZp2aUd7T0R2H9wxvMgVEbLfUlcI6pAI/VFEWHv4n/m
         aKqGLrZPSBvOTqxbS4fGKrBd/U1ovBvi+HFoW5sj/ymzCTuw6QiQ6kSy/YUmgD6CJ/6J
         jMGpst1INhZ7spjb2gnm0HBDJfL0hRR4CXvF71Hl1sy6EWqxT+ls4VzlQ0fHNTvWA8Ao
         eBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767619444; x=1768224244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X0h6ucEALCph7uDH9PI/I+8bZyfrAXR/0NCw42yTCYY=;
        b=TvG04Cz95CNMQNsL8oJhdMIuM+D1h6AFEmqhrjqoXTsajJyYsquvlH4gdQ7JOO0sqZ
         v4N3h+0Uh2AEc/9D984XLRVLp/oWh8iBcdlYT/FG2wbzmiCCfgjd1TB4H2j5xDv8nvr0
         qeBLG+nl0L8ZvuglvElLg/c0v53FxBsS57nYn64dy/91LC7ZzZeEeqwLP9UsF3mMLw1F
         fAG4yGvodPl3VOXQtlVTqr2WAKcNd03cV5buHR8IEHcv00XCqU0C/246uhzK0Q7rRntE
         KY/zhXqIDC0F1uN4eSKGm/C0dGK4th3TDVoh1jdoV3Eyrj9bwghpVSo5bHe+10TATkhK
         sOrg==
X-Gm-Message-State: AOJu0YyUU8gr46junTg5w0ZuKiUlNirwq0Whv0Du6xL8g7B3WdrHfnwu
	bnl9qjlipqYSs4wFdEJltnpANCTH4EkGbn1ZC3Vuxjcio8oQWpNamAlJraKALzWuKbXXkLWtx1R
	HEj/WbiFAyKds3lF6z+R48MDTmWP/FIT9SKZX0iQFc7Cq9tsa1CywXW+ljtzFWPeml0lX
X-Gm-Gg: AY/fxX65XiTEjSaxTmWMwI+1vO7i5cU88yWDP5RQ0rGfZKlFq1gVIbmDk0IMdLUcFxw
	dZcgZlJDtGCBDv/lWY30eVDV4N7HG4mT5xMkcLAnWe6wy2rvc0kkByV7wVenocMa9Uz/h9h2VJJ
	caS656YLquSCmNrmuGF9sk+lMOcl1emgjeWXh3JmoXD5ZL6KPcKjPcLlImL2T4WPg29V6VfDN8U
	HVYXIXeq4aH5F+VyEwUX3JODIZ1eBrtwRY8cy90z/DeSYs5XelmgbYxB6EFj6+GRxploxhRUgCh
	bbZ8D3XGNa4b5ToDPVvYzqGrgdqpp+b/xvRY/8J8uTa4UU6dkJ4cyVhywXmiQjcb++zAi08WE4F
	hk8sallEYKi9RUTugt7JOhcV6uPt95lWP2IVi
X-Received: by 2002:a05:6a00:e17:b0:7b9:ef46:ec70 with SMTP id d2e1a72fcca58-7ff65d7cdadmr40585494b3a.23.1767619443477;
        Mon, 05 Jan 2026 05:24:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgyuCBGFHPb5OCLOWNDiAiIe7lRrT0NppIzDPvEtIcDi6hUXdhDMAjeHScMUcfWBz1kzxqLg==
X-Received: by 2002:a05:6a00:e17:b0:7b9:ef46:ec70 with SMTP id d2e1a72fcca58-7ff65d7cdadmr40585456b3a.23.1767619442722;
        Mon, 05 Jan 2026 05:24:02 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b127b00sm48426542b3a.21.2026.01.05.05.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:24:02 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 18:53:00 +0530
Subject: [PATCH v10 12/14] remoteproc: pas: Extend parse_fw callback to
 fetch resources via SMC call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-kvmrprocv10-v10-12-022e96815380@oss.qualcomm.com>
References: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
In-Reply-To: <20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767619390; l=4556;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=m+YAA/mlyrayWpYlu2DW6FhqLXxGfoQH2bEiKAJCyR8=;
 b=MzmGh2T6Nx00u74BzgfyD5XBhQEncY2uP8O4v3wVTkmjs59o55xNazzdXVnqdm3WNBNyJaDF/
 lclaohDbYlgCM/ooIu9zryAvbluvENSn0L1rgrG5JFyt5VbxurunQNe
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: rg8Sbpc22UPQebHqVMryWW6pydnccVWx
X-Authority-Analysis: v=2.4 cv=GboaXAXL c=1 sm=1 tr=0 ts=695bbb74 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KMz1R6K7GWUeRkMKapkA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: rg8Sbpc22UPQebHqVMryWW6pydnccVWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNyBTYWx0ZWRfXz/kP0tsjksYw
 Pn5vniKAQ9oR4j9aEh2bdLAjx8yREQzR0+Xqn+UPnyo5TyUDR9vfQBoygvYk0p/J//AeoOscTcI
 jUfjfLcAVh+wQGjcIzlElM/8zb55fEHbfyHyQIqEQYW6FFmf6lHhZgPXPlx3P2qDIJat57LzhUG
 KFiJuhFuiIE1IM/pLNuKpiH65o+D7AeBCLoMzoY4QHX1RhQ0XMlk5pVnQwToGR5y33aTgnijSe5
 e//wjbvXT9uVFYqno4IC1uMlytFRCBGdXGNGeTCxbqFw5x/d+YAOyYD9eqNbUnmU7oDD8Q9rRu7
 GC/i3ozPCkaNjPRWFKvQVWMWYQnLKQmtF1lMLZFDovUhXAksXDOsrIbzUkT4XSAvL2dwKExJbeX
 4PUXo3Sy5k/kYEc7qAm7x3ZthKv+uGFrxUxT9U6pOcspeV7/kr8/SocTgHdTxSvJjJ1s568bI+r
 Srxv680QUwkFMGJFL1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050117

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
index f746d2f39a1d..e0c7bf94bfc6 100644
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
+	output_rt = qcom_scm_pas_get_rsc_table(pas->pas_ctx, table, table_sz, &output_rt_size);
+	ret = IS_ERR(output_rt) ? PTR_ERR(output_rt) : 0;
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


