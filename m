Return-Path: <linux-arm-msm+bounces-74304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8097B8CFB8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 21:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80E867E233D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 19:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D905B24BD04;
	Sat, 20 Sep 2025 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nE5OP1iC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03BF25D536
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758397349; cv=none; b=LVkKp6un7Cik904+07WhVrjAU7Nt2fwEqjrW+5mJ3eGUo9eahDE2utldGduAa5rzawPRRN7LKiCnlcvz5/85LVeYbmzVyrMbTjQXgUZQZmnm4kFDA7veaXAQ0hUTVwdNwXi7p+bDAXIu+SG8Ox94wL2m5gsC1wB4wBANGhkpBus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758397349; c=relaxed/simple;
	bh=HaQL7SzoKQ+uCuoNDRBd4ngS117LQfzY4lgUkCMm2i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r27gZyzaNpSqVTaKsEfVxTsbXNAEWkgpYKX7ar37qEbEqVA+h65QFBAQJpQYUbrjs0QigdjjjQ8uAAKYzq5jcEGK8wOlkvt3YXQaxWxGhSrm7Npk4dU44liPCGKvFj0hY0+hARi73x30N97YIHqtOg4+SbBkaZRr2cWM/3x6e+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nE5OP1iC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58KJX5DQ001216
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJLhCmWC5V5JvS2iP0Cc2gMwfOUtpus24rN2cUz0R8k=; b=nE5OP1iCoD2LLmGc
	7SAAp/+fASY9jYtCTRP7/HHMmv5Y6kMZDbV+iDXW8AQh4eZhrmxkCcGu7RHp6JVf
	z3sFsLcSqdqKh4ljwB1AeVr8au9BxmzEtRcHMN6fqM+c7YPFSA23kPLLP5ZoMdsw
	hCVOY358XrXo2OqFu4SZF/rN5CgXPLq4diujMe/NSyfi8WPL3broz+C6h0Lv1l6a
	Txd1UtkUl12S3KRSGHYqqT4whjbAxAPRdeYOmP1SxVN+5mpLCpZsz+Zu3ftmTmoX
	PWL0bt+3nAGtxj26aFZzgf2lORK5luGia5vTt6I9b4aKDkxQhQEzshmCHU3rUVtl
	zD5yBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499nj8s2ht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 19:42:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77dff701fb8so1895694b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 12:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758397346; x=1759002146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJLhCmWC5V5JvS2iP0Cc2gMwfOUtpus24rN2cUz0R8k=;
        b=kxPuPxIZssZMXUSiRPHmS/LGrJcYvOksBsR8QT988nfDOwUpF4TijaNioFq1weUu37
         21AYY7yfAHlLfSSM4wIYvnqufBCSKF0eyFuweXHenNB1NyKyVwkU//QqxAYGVEZnx8XA
         keNgy8AoDDoRinBjtPz0Rh/AcuazW1mTcUb62ibf0xwvBgIqd+xRwL6odDhmncBACkRp
         Bgdu86kr5+VHP3kBhB8Z13zwfC7MB8UIyRNv0/X0VckidBKaQrn7LGswR3iRTqgOgtmk
         ggT9AapVV0kJCDDbglyW6vMMvjFmvFB6pLRLZPB7XFyS5pajsoe89/yKpFBFWR1KAHfT
         KTbw==
X-Gm-Message-State: AOJu0YwU+CW+5I39J/89Nuni8DEjKld3Nj296bn0mbppGNMVmpuPwMNi
	+XQLz+mfTAGzc3wkNkXCWGSNntgIelMj256Jvx5X7CQFwU0fgIAexHYF2CT3t8gI8iT8+dfDjx4
	1zeK0dScDcxUvh5Vib4a7stZi4lkcGyC07M1SV8WcvKNGNN8za919n/ZJcbtaczbNXgiu
X-Gm-Gg: ASbGnctGyfxj2ZmOb27t5UzMGt3b+1GRSJlqcoRdsiNaPEk6R7PateXr9JaXWIm+zne
	3CwgxhaN2OQg5V8aVHnyzyahPk9+1A1LPXRY+r59jW/2NNJbALPW0yq2yfg+7pWHxn9IJWhEdPG
	tsialwLcDbwub/peW018bNI3zA/GpzFr81YuhGUZMnE5BNrLV+VLF8CMVgV+lAf9r2zSoyn+4X7
	zL8kZZmj7qlaQiAbIp0I1kKL28yNRgE3KQY7fwI2H+A5LRRhzwti1+fqY+DKvEsvBJgx8ACQqfP
	y3gHlh99S3GDzReMc75fkgY9vIVDlnP3SyGpvR128h/R3V5pPImbVigSJw77qcCEAc8=
X-Received: by 2002:a05:6a00:9299:b0:77a:2eb:a456 with SMTP id d2e1a72fcca58-77e4d129a4bmr8654938b3a.10.1758397346320;
        Sat, 20 Sep 2025 12:42:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhW02y4cKqYgaAhLIk153K10CuK8W8rj1tVqHucpPt914fFE5q/61YjV9uWqc3fx+xZcgvfw==
X-Received: by 2002:a05:6a00:9299:b0:77a:2eb:a456 with SMTP id d2e1a72fcca58-77e4d129a4bmr8654913b3a.10.1758397345890;
        Sat, 20 Sep 2025 12:42:25 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f2c8aa554sm143767b3a.34.2025.09.20.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 12:42:25 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Sun, 21 Sep 2025 01:11:09 +0530
Subject: [PATCH v3 11/12] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250921-kvm_rproc_pas-v3-11-458f09647920@oss.qualcomm.com>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
In-Reply-To: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758397299; l=5727;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=HaQL7SzoKQ+uCuoNDRBd4ngS117LQfzY4lgUkCMm2i0=;
 b=axOMnTfAmjJadjnx+kWYfL4yus2rYoK6z65CPwn+Av/JHIsGKtR9O2/5sspB9ZUuwkPuQe8Ov
 EhUcTo8nEJhCAmNrwnuVQiZlrlQInhieCKkbhlQVMaN+NE3dXGusmvZ
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=dZ6A3WXe c=1 sm=1 tr=0 ts=68cf03a3 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=aSAcVJyT6VmtggMVTjAA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: GgzTYd3uAnFpd0O_u04SptHvit8m-HQJ
X-Proofpoint-GUID: GgzTYd3uAnFpd0O_u04SptHvit8m-HQJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDA0MyBTYWx0ZWRfX4WHhaUyURhop
 qcrkoW8C8oxOQ/DfZ20OU2WaK1+TJVWat/U2uLMCEqPuUWUoQSy6qxecX+cYLw84+0YB1mgxcs/
 jpST0JNyhR60qHxdtNbhLGiHgtOyLx1vnJKY99/bpdzljjoCq5O+Nzue+fFtuZ/7PNkEPJ//gZ1
 B0RrPGmvSk2c/lDMXK5ADbj2Q5vsowNLjzFR4wLY+CrnHjLJNMvNR7ZNgfYLcRpqyDXYGfCnW+s
 ofZR+lNVMqDpC3mvmeuMxiRyVEJsVjB+c3rH5OQOXSmUpkCZv7EU0ouCKAVbiNyKxsjLzRT1y4x
 p0nLAVlSxjA1vwXXZkGlOSA8PZPmFDuhJq+wnPYcH3hihx66Dou4lUyVTqzC9EUOYERDxvtY5LG
 0mfynkDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509200043

Most Qualcomm platforms feature a proprietary hypervisor (such as Gunyah
or QHEE), which typically handles IOMMU configuration. This includes
mapping memory regions and device memory resources for remote processors
by intercepting qcom_scm_pas_auth_and_reset() calls. These mappings are
later removed during teardown. Additionally, SHM bridge setup is
required to enable memory protection for both remoteproc metadata and
its memory regions. When the aforementioned hypervisor is absent, the
operating system must perform these configurations instead.

When Linux runs as the hypervisor (at EL2) on a SoC, it will have its
own device tree overlay file that specifies the firmware stream ID now
managed by Linux for a particular remote processor. If the iommus
property is specified in the remoteproc device tree node, it indicates
that IOMMU configuration must be handled by Linux. In this case, the
has_iommu flag is set for the remote processor, which ensures that the
resource table, carveouts, and SHM bridge are properly configured before
memory is passed to TrustZone for authentication. Otherwise, the
has_iommu flag remains unset, which indicates default behavior.

Enables Secure PAS support for remote processors when IOMMU configuration
is managed by Linux.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 61 ++++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 9a0c0e8f5506..ca5a214162eb 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/firmware.h>
 #include <linux/interrupt.h>
+#include <linux/iommu.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -251,6 +252,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 	return ret;
 }
 
+static void qcom_pas_unmap_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
+{
+	if (rproc->has_iommu)
+		iommu_unmap(rproc->domain, mem_phys, size);
+}
+
+static int qcom_pas_map_carveout(struct rproc *rproc, phys_addr_t mem_phys, size_t size)
+{
+	int ret = 0;
+
+	if (rproc->has_iommu)
+		ret = iommu_map(rproc->domain, mem_phys, mem_phys, size,
+				IOMMU_READ | IOMMU_WRITE, GFP_KERNEL);
+	return ret;
+}
+
 static int qcom_pas_start(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -285,11 +302,15 @@ static int qcom_pas_start(struct rproc *rproc)
 	}
 
 	if (pas->dtb_pas_id) {
-		ret = qcom_scm_pas_auth_and_reset(pas->dtb_pas_id);
+		ret = qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
+		if (ret)
+			goto disable_px_supply;
+
+		ret = qcom_scm_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
 		if (ret) {
 			dev_err(pas->dev,
 				"failed to authenticate dtb image and release reset\n");
-			goto disable_px_supply;
+			goto unmap_dtb_carveout;
 		}
 	}
 
@@ -300,18 +321,22 @@ static int qcom_pas_start(struct rproc *rproc)
 
 	qcom_pil_info_store(pas->info_name, pas->mem_phys, pas->mem_size);
 
-	ret = qcom_scm_pas_auth_and_reset(pas->pas_id);
+	ret = qcom_pas_map_carveout(rproc, pas->mem_phys, pas->mem_size);
+	if (ret)
+		goto release_pas_metadata;
+
+	ret = qcom_scm_pas_prepare_and_auth_reset(pas->pas_ctx);
 	if (ret) {
 		dev_err(pas->dev,
 			"failed to authenticate image and release reset\n");
-		goto release_pas_metadata;
+		goto unmap_carveout;
 	}
 
 	ret = qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
 	if (ret == -ETIMEDOUT) {
 		dev_err(pas->dev, "start timed out\n");
 		qcom_scm_pas_shutdown(pas->pas_id);
-		goto release_pas_metadata;
+		goto unmap_carveout;
 	}
 
 	qcom_scm_pas_metadata_release(pas->pas_ctx);
@@ -323,10 +348,16 @@ static int qcom_pas_start(struct rproc *rproc)
 
 	return 0;
 
+unmap_carveout:
+	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
 release_pas_metadata:
 	qcom_scm_pas_metadata_release(pas->pas_ctx);
 	if (pas->dtb_pas_id)
 		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
+
+unmap_dtb_carveout:
+	if (pas->dtb_pas_id)
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 disable_px_supply:
 	if (pas->px_supply)
 		regulator_disable(pas->px_supply);
@@ -382,8 +413,12 @@ static int qcom_pas_stop(struct rproc *rproc)
 		ret = qcom_scm_pas_shutdown(pas->dtb_pas_id);
 		if (ret)
 			dev_err(pas->dev, "failed to shutdown dtb: %d\n", ret);
+
+		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
 	}
 
+	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
+
 	handover = qcom_q6v5_unprepare(&pas->q6v5);
 	if (handover)
 		qcom_pas_handover(&pas->q6v5);
@@ -753,6 +788,20 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	if (of_property_present(pdev->dev.of_node, "iommus")) {
+		struct of_phandle_args args;
+
+		ret = of_parse_phandle_with_args(pdev->dev.of_node, "iommus",
+						 "#iommu-cells", 0, &args);
+		if (ret < 0)
+			return ret;
+
+		rproc->has_iommu = true;
+		of_node_put(args.np);
+	} else {
+		rproc->has_iommu = false;
+	}
+
 	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
@@ -830,6 +879,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto destroy_pas_ctx;
 	}
 
+	pas->pas_ctx->has_iommu = rproc->has_iommu;
+	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto destroy_dtb_pas_ctx;

-- 
2.50.1


