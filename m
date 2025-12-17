Return-Path: <linux-arm-msm+bounces-85580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B40CC8E16
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D3A423064903
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFD634DB77;
	Wed, 17 Dec 2025 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mruSXSbQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ty3gaeqj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7763587C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989344; cv=none; b=YX45hIr7caASAZhxQ0q1L/iu6aKAHS6owzB8pqvxUhzjC1FEFfqZaMz/39OF6YjbVSJp3gMqTne0sbzoB8FuSlK+QZAiNNMts1uM4Ahatt+z6A3I8qYsf4a2kJkN8nGIYIwYLSiwKzdw4Wq1CAcPMpcvr237adRCTC0i6xxnN7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989344; c=relaxed/simple;
	bh=pM4mmlZ5nFXTHkk3VIa4nwnosLDFYYB1BLQ8kvsmvPY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XECHj3epS35bzqINjSjaCpMJRp/akaMjKE9AlRTHGgnS2YCFIYcFjwX36x+vcCq4hviZhwNA3dWzu38xGf3uKQQMRy7zP+50VoQg8GkUNbaCdLxBvmSlUmAJJHQwSJH8svEZktJ6lvribz1SUwM2vmKnVn2YlZuxe7G7av7vWfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mruSXSbQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ty3gaeqj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKnf23203827
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5iS/QfPo41o29sper4O46Z1M/HTU3Zvne2daPdF9aY=; b=mruSXSbQePG+IlNN
	r43ZXIIkPLTA1p1VpRfqOLD60HCN49saGGAntrn68cGCkJisAuGIjHBZKBV1D9iw
	n/3waPRPox20WztBWJ+1u5SMML5atr1PIbd+zowDxTVb8NDwI5CmG8DgWSggsNyv
	vPa4hZfejqgDxUMRARbd2i6ABSOAhdHg9fcfr4b0SXIuOnLBOteJkHh7BzI4eS1h
	El2yxiKJsHh8Bvrpu7A12VN6iXAsuoy9sfrVO640g1BgJNkcm3FA4g/MVKPM4QjE
	gRsSbbUKpW+uDpGsYSOQmhaU3IlwUG3qqq6GxzWbw0BJQ0sdpmQkJKkQpfLEW0I9
	2gUj6Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3j39jte6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:41 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso41709585ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989340; x=1766594140; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5iS/QfPo41o29sper4O46Z1M/HTU3Zvne2daPdF9aY=;
        b=Ty3gaeqjh2Az7ub/aMAp1TZrQ3lea/x3jSUpUDeXJcsOH7pJ+weHw6mUmpORiIpTH0
         TJ+z1eeMLsjsid1nYVMB3Vvja3DfMlWzA3vQC0ICsZ4ycDEocOcst6RFJBfL9QWHetXe
         NOV0Twvr+dnvL+U0PEMwjerfgruDCgTIoptxsw0tAGukqvtEmHzIcLWiqMVgz4dtEY5c
         aE3fRSOajCyejDp0EhNzZKAOnvHbhltUJ6UHq1GSXXryy10j5agW+ieJptRuQELjIBN5
         dyeR+8ZpZH5SKYt4v+YO6fhSkzcUdDuTylm6Gx9uPLZDcdgGehhAtDNArq3H7/IzWyzx
         tlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989340; x=1766594140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f5iS/QfPo41o29sper4O46Z1M/HTU3Zvne2daPdF9aY=;
        b=FsDpyvKQlRFq96mB+aVsf3yLJ4sl7IJUYb/P1IB4jXtIZrCt6wmivkwBkmOrpEEjsG
         DWl9cB/eYYFVUQGufHv0JDmDxQK10u5eH6/1FyVuSCGOEP2Jc/+NYsHety9SMcbdBgiO
         ES47svF9T2OKL1/WNSkb+mgsVFYXGH+sIupvcm8g3nnOY2cXgcRZB7rdc9YjSvMQbH7w
         IinKt5NVlau3mdyjre50gtWmukLGKEZGaBNLs7iw+XAr8AU77WOJ401F49zfBR/bicyL
         g9jDOTNMIZdPn5CpD80hA/87uWLMt3f/ApjIdIm5oxkPX1oaMDvvCKQRdsi3FhQB8czh
         ivuA==
X-Gm-Message-State: AOJu0YzW8WWgDlxTcZgQQQjMgHjms43JOeZA3MfUJexe1fP0X+U16+ag
	s1mho+3ilJobwVFv1yyoah5QlfJ43KOuZ64q6KuuAnGE/IxnF4XGZuJl/UgY4DZu6t+CdDqnbQ/
	hwyY4+JE/2wGWB7T9quUuZdh5B48d6azktzL0c4868zbuO2UB28JUSgYP8V51OwyjwAkw
X-Gm-Gg: AY/fxX5sB2m7v77GJheNInltQQS7P8cjZWoia9dsvcZalef1VtAYPt5V429VS1bqPnt
	R5fFcXp3yVweZYepukl+SCQ66uO+CO0hEK1ETRjUORUoArhaR31hh1U24o1QkrY5NVBEcFrh7hL
	jTxJPXBwDW3GDqJhKQNgCZA6xklD3fIDR9iJ4Sb9aUB2LNtK+BSiNyW/78kbpP7ebWtGaC2nUGm
	E0esKjgHGYsUsXhE8pgUIogeTpfE4qYj9+Dl+ov6oL9k+rKfe+fbyB2Q0Ajdad2hqdsEPfYrPez
	JHi7S1DBZBXYPqQMOrLMXmhLXaLrRSxjW5YX2eHNaj0e3t0aLA3snBg/4ELtOzhWCQMAYziRTyw
	B1LaURqOifh4WGRITU9d6Eu308wu8TXLQWy3Z
X-Received: by 2002:a17:902:e546:b0:298:efa:511f with SMTP id d9443c01a7336-29f24141337mr196993775ad.39.1765989340105;
        Wed, 17 Dec 2025 08:35:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEX+SdviMUWiyVuzsMz3Ld5ddaGjWVNejk86tyENDi0xG+nJsPKOiPr9ks+l6i9iU1J2qEoVw==
X-Received: by 2002:a17:902:e546:b0:298:efa:511f with SMTP id d9443c01a7336-29f24141337mr196993465ad.39.1765989339556;
        Wed, 17 Dec 2025 08:35:39 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:39 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:45 +0530
Subject: [PATCH v9 09/14] firmware: qcom_scm: Refactor
 qcom_scm_pas_init_image()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-9-ab7ac03e0ff1@oss.qualcomm.com>
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=3096;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=pM4mmlZ5nFXTHkk3VIa4nwnosLDFYYB1BLQ8kvsmvPY=;
 b=PkXc98LnM72sFveXgFVB9OLdTInURlN58d49dShyLcvhIT3GhUG4xOcFKM00/ZpsRnEOVKjv/
 9nIWdAqXn//Dj5qkmpo0bHLGHJhqh0cTvb8oRbyY1OXIOEZ1Z3Vn7oZ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX2c25/pGS90OQ
 yB9UT9P/k8MPtLrt9WowxcWz+0kV+KLmWUHyvzKhg958TUs8zvTVUP0LtH9AobSMxFeDB132fmG
 LcoO8L4jN9vJ7KtyBfBljW3XHKleSOwnfvxaGKJhN90Y4l9q+7vjWWd6K8J8SALpjbCXHWoqPyF
 Kz2FnWeC4HJ9udEsx4diuDf6gD33Nyuc6oLIVEdheBnlsOiKHtnWZKOYRXe165If7GJOxnQy4kI
 sFznEBzl5mKy6LHvU5r4X0maNws+hqbXOaNpivvhadmitMwpWO+xoCE9S2pFDX2W6PPm2vZO/Vv
 fvzQqvuyad4RwgdkxXjHcBrSTQ7cFtT6mMNKWcT5Lixfsh1ny6E0vgr+gsa/dz0auy7DYhqlIW/
 rNmQxc+eY+j1tCp+S2Pwe2WY2euNZA==
X-Proofpoint-ORIG-GUID: axDn78dASlMXmBxx10G-oExZ-B5xcCIz
X-Proofpoint-GUID: axDn78dASlMXmBxx10G-oExZ-B5xcCIz
X-Authority-Analysis: v=2.4 cv=ToXrRTXh c=1 sm=1 tr=0 ts=6942dbdd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=EGCBOWN0xxkO3F07DQYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

Refactor qcom_scm_pas_init_image() by moving the memory allocation,
copy, and free operations to a higher-level function, and isolate the
actual SMC call in a separate function. The main intention is to allow
flexibility for different allocators and to respect any constraints that
the allocator API may impose before invoking the actual SCM function.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 58 +++++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 25 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index d3783166fea1..bc3b8dc7d3e4 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -592,6 +592,37 @@ struct qcom_scm_pas_context *devm_qcom_scm_pas_context_alloc(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
+static int __qcom_scm_pas_init_image(u32 pas_id, dma_addr_t mdata_phys,
+				     struct qcom_scm_res *res)
+{
+	struct qcom_scm_desc desc = {
+		.svc = QCOM_SCM_SVC_PIL,
+		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
+		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
+		.args[0] = pas_id,
+		.owner = ARM_SMCCC_OWNER_SIP,
+	};
+	int ret;
+
+	ret = qcom_scm_clk_enable();
+	if (ret)
+		return ret;
+
+	ret = qcom_scm_bw_enable();
+	if (ret)
+		goto disable_clk;
+
+	desc.args[1] = mdata_phys;
+
+	ret = qcom_scm_call(__scm->dev, &desc, res);
+	qcom_scm_bw_disable();
+
+disable_clk:
+	qcom_scm_clk_disable();
+
+	return ret;
+}
+
 /**
  * qcom_scm_pas_init_image() - Initialize peripheral authentication service
  *			       state machine for a given peripheral, using the
@@ -612,17 +643,10 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 			    struct qcom_scm_pas_context *ctx)
 {
+	struct qcom_scm_res res;
 	dma_addr_t mdata_phys;
 	void *mdata_buf;
 	int ret;
-	struct qcom_scm_desc desc = {
-		.svc = QCOM_SCM_SVC_PIL,
-		.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE,
-		.arginfo = QCOM_SCM_ARGS(2, QCOM_SCM_VAL, QCOM_SCM_RW),
-		.args[0] = pas_id,
-		.owner = ARM_SMCCC_OWNER_SIP,
-	};
-	struct qcom_scm_res res;
 
 	/*
 	 * During the scm call memory protection will be enabled for the meta
@@ -643,23 +667,7 @@ int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t size,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = qcom_scm_clk_enable();
-	if (ret)
-		goto out;
-
-	ret = qcom_scm_bw_enable();
-	if (ret)
-		goto disable_clk;
-
-	desc.args[1] = mdata_phys;
-
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
-	qcom_scm_bw_disable();
-
-disable_clk:
-	qcom_scm_clk_disable();
-
-out:
+	ret = __qcom_scm_pas_init_image(pas_id, mdata_phys, &res);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(__scm->dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {

-- 
2.50.1


