Return-Path: <linux-arm-msm+bounces-81592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C6C56EB3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 11:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 775F034BE11
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEF733A02D;
	Thu, 13 Nov 2025 10:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hh0nZRQ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c9RFsmme"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041A13321C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763030220; cv=none; b=dkRYBvYIzaA0fE4uiL9NUlLzxd5QiMBX5iEtHq0F5KRHgdOWWzue/4gRtHgNUszhqNCxHyIdK7ZQM7CVOHqKx5+iwkcQUo715EaViSxmQjMZi8000k7eRIXQ+TS4oiIntwyh8HFtvW+/ZvUQvy2F+huh/4Y7AIO6TJ0vAKkwvEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763030220; c=relaxed/simple;
	bh=OnBXexvPOA9/+OrKQYQZ0RkoCnUmiqQ/pRYhrYePNl0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5/x68N4DMoS8dxuwdn1c5mNLco0tPMoQujCI9IPXNsDR8OUcwWPyZCsta+9EpdnmwMzc+HhHBB+dLVmfydm0x+DjRjyy9lvhVwwZzU0cSsTTEeO8PN7T4h9g/l874wOiNDcpJ9V02k6xVD39cd+6i3c6PtQJ1KPb75Y8KsZJ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hh0nZRQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c9RFsmme; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD65vPj3564112
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dhiOZd1ozJ6FUJM7vSxZzhvThMcfA2U8BRuEp1Tt30A=; b=hh0nZRQ9ijxfbqvc
	kh23lwbw1oTmiwjU+I86zSSNnoV4KX0Y87ZF30Dp8Axr/GC5j04ARclAq2qwRrqG
	mO3d+QAgWQzS3h6KAdLoR194ZU1LayYnDzAaiuZNbxvnIicTtaWeSV9dwYFbRqyi
	SkVuvm92ymoTjw3WedQZMM1P6CxiexOVTldXaShr00fMMWUS5/FwD//Zl3u33GKw
	rjC6vroJbyQhYh6Yq+ibQ5GkfhdfndKyh7FcfL3Jmv3dAll6KRyewxuQTTJQdYrG
	ctKr4AP1Yw43Lf7RQZxQ5vy4208B6p11/iA+5YjrYIjW9dOL83QL5Eyg0kcTDJv1
	UStPfA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9rvgtun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 10:36:58 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78117fbda6eso633449b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 02:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763030217; x=1763635017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhiOZd1ozJ6FUJM7vSxZzhvThMcfA2U8BRuEp1Tt30A=;
        b=c9RFsmmeA5Ys+WxCaMUjPY34dy6TilH/DqOSo5K2N9jJtbQB7nenwEGRFLD2J/r8jG
         ncub4rB9hshj7KO8d5DNHjpt87XqPT9+1m9KpQKFZmuAklTWYq28saHZ6XwA2kmGRPOY
         CE34lMz4soMsnOYSagZzDXF09Dqpl4og5sEAmvzswKLrSNfmdG0mO5t4c0E0nlo54ahC
         9IFBIhrIG7AxaIgw8Mo3Pl72OdY1h0Uf0997ne+beyeJm57OZnsJfH704xX4rCIRX9e4
         4UO15/yo/MwMZZ41ApsQwildkHYDeoMDbpnNBJ9ZuHho384+leEySxysejWQ9lMynXO2
         oRQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763030217; x=1763635017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dhiOZd1ozJ6FUJM7vSxZzhvThMcfA2U8BRuEp1Tt30A=;
        b=mOgeouy6PO8gHbM5NCtvh0VrJ+BH8F0gaAOPi9iNr13CXzYQYsLi9zgLEKIC8jz8YN
         gjWmd5pZnOpw1v9Nbx70dDRsqHr0T/vxaArttYuy6cSOoBNT6m/HG+fKoiObJ6lk5+7G
         4SXtLp9HLLBEDTRvEhLbD8X1iJiB4UJJfs2Gcx4EcSR377duo8R61IIm33DJrmI/xVhW
         jCjz7lGuOzpPg74U29JJ5ujVHtcIi1VJhELWNmwZdytV7NNQYluMqfxRU9hEe+lWTETW
         N1nWx307doV3B0ZcgekIl8gP13sjltdKIxPr/dQuaxHElcz98uhiE1JE6l0p/lEycT+X
         yJ+g==
X-Gm-Message-State: AOJu0YxJNakKTGkOmaaOJJsASheFZ8o2crLLeAuojHm0LFs6jTq3TWvH
	39wXRZ0M0TVPCawDeKaLsdt6lMyW0dQq7PKXsY33IQis28oDr33ix3+Af98v5KFu3gTV0qPAdPD
	MWuwIfvNZaGY9T2ju01Ix/Rt31q8RbbIxb9uFqMNfWv9U1PAVXg5iBmwgKAeoBmFh+gvy
X-Gm-Gg: ASbGncsnndA83mWTsJsxwD57UX2J5PCTmrhYG5q+sQdf27DmxIo7Rz1eWq3dmDwz0jm
	uI25LBeDX53iStthWfBAstGw01uQkw8MIqSzOYBOm+5kauldIYHwdXenIC5T/Rq8loKxRnzBYFD
	fCtFy8L0japRPpzxp6GeZ8EJb5FDsSxz3Tv6nXwhbF8zG0l9akbCrDiLuF0qTZWQ+FlYTSYPX/Z
	WtL562v/zzrc2NBS4p6UjhhcR/EznqJ6qrSiMCT9ilNiR5pYC0BIC9uLeAtNw1Nnr0PWtbe7NZP
	E7481YpTJJl56Vk1jf2aW2IuLleWQby8KwUrD5WMu8XJhTgbrnHbEMC1RKBPEbcpo/QT6YDmYiJ
	8PcE4ZP/rtE95MTeqzdfbMk2kTg==
X-Received: by 2002:a05:6a00:1910:b0:7aa:93d5:820f with SMTP id d2e1a72fcca58-7b7a57a44c6mr6459142b3a.30.1763030217290;
        Thu, 13 Nov 2025 02:36:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUAOm8aOdE4IINS06BTfK2WnfNkoItVCuEiKrMNLRKofTX0+fs82r4Qw/JrI3wR9t6cwE2xw==
X-Received: by 2002:a05:6a00:1910:b0:7aa:93d5:820f with SMTP id d2e1a72fcca58-7b7a57a44c6mr6459115b3a.30.1763030216696;
        Thu, 13 Nov 2025 02:36:56 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d2d16sm1886922b3a.22.2025.11.13.02.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 02:36:56 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 16:06:03 +0530
Subject: [PATCH v7 13/14] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-kvm-rproc-v7-v7-13-df4910b7c20a@oss.qualcomm.com>
References: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
In-Reply-To: <20251113-kvm-rproc-v7-v7-0-df4910b7c20a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763030164; l=5426;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=OnBXexvPOA9/+OrKQYQZ0RkoCnUmiqQ/pRYhrYePNl0=;
 b=skfkthgGZNrdR6wIDPAQJnF1RNpybS2/03La+smAiLORXtHwPVqlUxL9r97FO6gKXonE6Jax4
 ULW5HtArPMnDgiBV5GuwtqP7GxIKy9OfCMhchTiOg+1TVqr+HhlrRXI
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=XrX3+FF9 c=1 sm=1 tr=0 ts=6915b4ca cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=58pnfTnN0ARRJNaB1lkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: oyQHUsdILAFuaxChIcJU11vl4fR4nomx
X-Proofpoint-GUID: oyQHUsdILAFuaxChIcJU11vl4fR4nomx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA3OCBTYWx0ZWRfX4FStAOW87Vds
 KLtUcSE1O98EKwgGpcEMCGHzWC4+o85rmRnphA5++CMnmjzoBumaBpeKh1jthujAI/+jPBMSBqw
 4bbEdt351pK/M/ZIclTYZhZpujzS9Ffg6Z+PfQyplvJ7ZuqgMkza8eri3pAvY4gq4z/ZADIPNRs
 dC4tJg87bjPIAbUJhAdOFbdpmwIVxlrGSTX0eTaqa/GmgDOFEO1Vdui2hQ+i+SCSc9pgpEnMmob
 iqv/3mYfNiuJtbDC+F3bwGmGlMXuvP/1QYyjy9sATGqAPlR0lYLwp8xqdZyLaSD00rhs937S94J
 ZsygFWgADpApnTBv9gU/pGIiarcLfkIqWa57fopdFYWQnkyOZS/UGXZfPjPQJg/m0ar4CEyeO6G
 FkBcSqXGBWlMSEa7k97zeKLy7MdeVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130078

Most Qualcomm platforms feature Gunyah hypervisor, which typically
handles IOMMU configuration. This includes mapping memory regions and
device memory resources for remote processors by intercepting
qcom_scm_pas_auth_and_reset() calls. These mappings are later removed
during teardown. Additionally, SHM bridge setup is required to enable
memory protection for both remoteproc metadata and its memory regions.
When the aforementioned hypervisor is absent, the operating system must
perform these configurations instead.

When Linux runs as the hypervisor (@ EL2) on a SoC, it will have its
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
 drivers/remoteproc/qcom_q6v5_pas.c | 48 ++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 4d00837db58d..efb83e0374db 100644
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
@@ -256,6 +257,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
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
@@ -290,11 +307,15 @@ static int qcom_pas_start(struct rproc *rproc)
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
 
@@ -305,18 +326,22 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -328,10 +353,16 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -387,8 +418,12 @@ static int qcom_pas_stop(struct rproc *rproc)
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
@@ -758,6 +793,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	rproc->has_iommu = of_property_present(pdev->dev.of_node, "iommus");
 	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
@@ -837,6 +873,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto remove_ssr_sysmon;
 	}
 
+	pas->pas_ctx->has_iommu = rproc->has_iommu;
+	pas->dtb_pas_ctx->has_iommu = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;

-- 
2.50.1


