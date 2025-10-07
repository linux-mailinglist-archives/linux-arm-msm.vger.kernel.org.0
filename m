Return-Path: <linux-arm-msm+bounces-76243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D139BC2285
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:50:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A08219A515F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 741442E92D1;
	Tue,  7 Oct 2025 16:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfJbtc7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EE12E8DF4
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855774; cv=none; b=Ryj5jELqJGw5YRReYDfuc5iA81A3JKxWs0c9x0OD6HrTn24Uz49EQ7Slk1tAmP62+rmj3KpfqTp1drKLlhBM+F7Vk6UGKmr6nQat89ggLD1V3TGQVlTuOcEV6az3zX4fOsQjjG1VwS9XQnoQO67GnQXWbWz/pLIwNAptlP4oAA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855774; c=relaxed/simple;
	bh=5ySg3oqdhTBFKhYF19nJktUPZz2jX4cWgK5IfIezTP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JAexX7acvM18ghEzVknak0VUD4doyDSwZTEaSmMkGxC+xDQtBjBTVPgizXiGvgLaFXrQmJs1bRbnQHtc9OyoRukJVgV74ZipZGyjRh/4+q70fbrC1xDZJ8SFSogLehK5TGxldS/T4rg40TjbBrmO1yyfI4/BhZrHY+VIaiSBr4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SfJbtc7L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ETNeh022615
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qdsdQmoQzXdnVBOtp02PaRgYLFkPY2o3v41AlXFLZR8=; b=SfJbtc7Ljo0j9IXj
	WDHpgM5a7S/9carLBFAm/rdBLcwCky/CXcz8bSmZ61y9UFsQHZ7416nB3+I95ayE
	gFXmyPrTXGudDupDBqZxPpnMvJL1gG0ouJCc8RtRBlN5+MPrZltH0XEqXewLbTE9
	ui45G+NwVdIl8d9XNwMvWc6sFjosxkDy91K/8L0/PLjnct7qiHfKSs/bsWx3tYMC
	ZYXxBTi/rWfLeDwLC2I7gvMLim08YTCE1/+aMZtSQ3XZjJEzKbsJzQLLJSuA+hbK
	DF42Ls9yIa8Odeb4hDbShOYf/V6mnXuvzLdXLl24XeJ9YgEnnWIsutkteqGbkGfB
	vorUSw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu7y70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:49:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2698b5fbe5bso77346955ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855770; x=1760460570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qdsdQmoQzXdnVBOtp02PaRgYLFkPY2o3v41AlXFLZR8=;
        b=WfSayrizVW5dngH+RGMNVkTYPq5ipD+AEMKf4b5J8UvZPLw8HfeZ+24LNdL21xQErb
         rjIQjGfgm8g8FOr9BZhp+ok4WmYR6olHZHO3zxiWsjQYJoHUROs8FHXEl2sHtWZEuKnt
         e6Zp24rQA6s0UnUEvXDql30BS+g7wCHsvJYuS5DIt508fEDBOr/09Vh7DmMChPTTelBH
         IsxTg/shdVQJmdT4TFqhqe1yvrtJzI2Vus8oQJZOr8CTkxu+uLAmq8IHXMW5W6+KYS2b
         BPDf7E1rm2NKUnvEKQ6PFpCpXQkEUXs5jHw3mQbfuY02Qe7PTtIUGKbFzlrePJNCi+j9
         m4lA==
X-Gm-Message-State: AOJu0Yz6eUwplvtFcncSNEPjr3GhFZjZNSdgqbigUSYD0c3Kzxoxlztk
	CWpmF88BEcvFLWfcDbNsyQwr+zta93IXEQrQ6hFtDnT1bnCnUVTKXcpFj5eWfbwngPGyuD55T6m
	jfdWsXtkau6hCCa10W+1zIf62fnMOqLh3aoOM0kX9EogdVSK3xBA+/cjLbfDkzEnPyLtf
X-Gm-Gg: ASbGnctU0yZRMyGLTZKgg5EXUeCEzgBkBsWU2D62E+DAnPxsY54Zu0C1Qh+IIhuuZdZ
	F9pbDj/U0TV3iR+fy8UASbqhEXfS4AJvwAtPcoOIOg4VtdSlkfGrJsLaRZSkrJcRH2CIk6phCmZ
	HP0dxzL+pFxoX6TGiWhOwR7Vu8Yuzb8LHqFrlKvd2n4fZaaVoajJFs4Qxr3vSh5VKbBBsA2ouJ3
	XyHWBJdh2hAiG52tckoe513y62iTPBTiNeTDhaqsRbj4HI8shggF24bQJKVR5jclrNWEIVwZVTY
	SK9NC2P22CYTD70vNgUvyW55mZoJas7edMOJAeg0n6N+/llfpE4xCD3JD2I1D63nyv6EqWdk
X-Received: by 2002:a17:903:1a23:b0:271:479d:3de3 with SMTP id d9443c01a7336-290272152eamr6280095ad.12.1759855770337;
        Tue, 07 Oct 2025 09:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVotSHakAVyij7LAvIdycipiWzTF0uipwSGfGoro8jW/NvSSXvJ3fMuHUryk7LKXY/WOybJw==
X-Received: by 2002:a17:903:1a23:b0:271:479d:3de3 with SMTP id d9443c01a7336-290272152eamr6279705ad.12.1759855769818;
        Tue, 07 Oct 2025 09:49:29 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:29 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:49 +0530
Subject: [PATCH v4 04/12] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855751; l=3541;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=5ySg3oqdhTBFKhYF19nJktUPZz2jX4cWgK5IfIezTP4=;
 b=dranwIFmcuDiq+3Qde4Iv70b2uPlZfq+4LBNMZ6WAwX9GPmAAUFsITTiomvc+Du/xD5GeuOak
 qLYnyxHXFi7CC6chA4+Pn+wBq5i/NGIIlKGy3Nxattu4kcAUucLKP7z
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-ORIG-GUID: QOyDL0_BfzMQAotlxX4jEnCnwFq9rIZI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX65sf7hLjw57q
 Q3oD+MwwzQzMs9yLP9BbzCkuSUPftAvqrzcJbsL8J2/gTQkyq+ZeeHSj/MhqIssJT89Vb1e7PuV
 Stw1rQ0saftQfEPNukq3ykE6lZcrDnnwsRmLVS3KulrDuPQFETfqlkIYuYWv3FM0iXgAx76dmvV
 naaRuku/U23pTQVn5+qXD8Qq+/32jc4+gcuET2r4tOBY5L4L0ZzE906fXsdouOEeUVRsci/gBLu
 e8U7SvHO5rLK6VRTyrxKfLKMmlgLjpZOv997wsKx8V0bGxPhaivsIwzsSMnbvPKZ8RIaowe49l7
 /PwlF/OVGi9zU69Zs9lLVChiOvcezY4kOZEuV2p6CfQhVXgfBKbvTcd+QopzC/4YwVzJJvdLFbJ
 Imfi9zif3p18ST/2J4xcj47LBXofQg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e5449b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=fdpGjgpQmjpGYtS5oBMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QOyDL0_BfzMQAotlxX4jEnCnwFq9rIZI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

Add a PAS context-aware qcom_mdt_pas_load() function for remote
processor drivers, which can use the context pointer returned from
qcom_scm_pas_ctx_init() to perform metadata verification and memory
setup via SMC calls.

The qcom_mdt_pas_load() and qcom_mdt_load() functions are almost
similar. Clients using the PAS context-based data structure can adopt
qcom_mdt_pas_load(), and in the future, all users of qcom_mdt_load()
could be migrated to use qcom_mdt_pas_load() instead.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/soc/qcom/mdt_loader.c       | 29 +++++++++++++++++++++++++++++
 include/linux/soc/qcom/mdt_loader.h | 11 +++++++++++
 2 files changed, 40 insertions(+)

diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
index a5c80d4fcc36..31855836b251 100644
--- a/drivers/soc/qcom/mdt_loader.c
+++ b/drivers/soc/qcom/mdt_loader.c
@@ -486,5 +486,34 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 }
 EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
 
+/**
+ * qcom_mdt_pas_load() - load the firmware which header is loaded as fw
+ *
+ * Client should initialize the PAS context with qcom_scm_pas_context_init()
+ * before calling this function.
+ *
+ * @ctx:	PAS context pointer
+ * @fw:		firmware object for the mdt file
+ * @firmware:	name of the firmware, for construction of segment file names
+ * @mem_region:	allocated memory region to load firmware into
+ * @reloc_base:	adjusted physical address after relocation
+ *
+ * Returns 0 on success, negative errno otherwise.
+ */
+int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base)
+{
+	int ret;
+
+	ret = qcom_mdt_pas_init(ctx->dev, fw, firmware, ctx->pas_id, ctx->mem_phys,
+				ctx->metadata);
+	if (ret)
+		return ret;
+
+	return __qcom_mdt_load(ctx->dev, fw, firmware, mem_region, ctx->mem_phys,
+			       ctx->mem_size, reloc_base);
+}
+EXPORT_SYMBOL_GPL(qcom_mdt_pas_load);
+
 MODULE_DESCRIPTION("Firmware parser for Qualcomm MDT format");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/soc/qcom/mdt_loader.h b/include/linux/soc/qcom/mdt_loader.h
index 8ea8230579a2..2832e0717729 100644
--- a/include/linux/soc/qcom/mdt_loader.h
+++ b/include/linux/soc/qcom/mdt_loader.h
@@ -11,6 +11,7 @@
 struct device;
 struct firmware;
 struct qcom_scm_pas_metadata;
+struct qcom_scm_pas_context;
 
 #if IS_ENABLED(CONFIG_QCOM_MDT_LOADER)
 
@@ -23,6 +24,9 @@ int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 		  phys_addr_t mem_phys, size_t mem_size,
 		  phys_addr_t *reloc_base);
 
+int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx, const struct firmware *fw,
+		      const char *firmware, void *mem_region, phys_addr_t *reloc_base);
+
 int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
 			  const char *fw_name, void *mem_region,
 			  phys_addr_t mem_phys, size_t mem_size,
@@ -52,6 +56,13 @@ static inline int qcom_mdt_load(struct device *dev, const struct firmware *fw,
 	return -ENODEV;
 }
 
+static inline int qcom_mdt_pas_load(struct qcom_scm_pas_context *ctx,
+				    const struct firmware *fw, const char *firmware,
+				    void *mem_region, phys_addr_t *reloc_base)
+{
+	return -ENODEV;
+}
+
 static inline int qcom_mdt_load_no_init(struct device *dev,
 					const struct firmware *fw,
 					const char *fw_name, void *mem_region,

-- 
2.50.1


