Return-Path: <linux-arm-msm+bounces-85584-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F1CC8DE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 17:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1523D30B1183
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 16:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F35135B127;
	Wed, 17 Dec 2025 16:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5JtR7v/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="atQ8VRo1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9DE35A924
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765989360; cv=none; b=Q+cAv2bO7HaEJajsKHxqtSTTXWie6RkfWtkhvSi37n8kdInWtrPHbC/8WaVyAIyRxnjCCbUt0HWhWRwC3dF4IA0etTXu8/Ktc6JkQM05zysbCVfiw9hcWp4wT8i6ix4AAuqVuIPXhat8kDaCSs/2TbqJn/0XF3DfSWKcOeEuvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765989360; c=relaxed/simple;
	bh=bd5VFoeXgnnfPBNtjIyA8wzQq/ONErHwh2oKqdSLe6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gy0t+JbHW/8co2Bt+9NngYPrO5YCeAal/9tjnVjy1zJSKnc9y8CRFGMtkJ0STmiwJl+Jjda1JzBV3hTDQI4hZPLUbBcgKnZHrYaaqMbKiYNP9+Eb2U4+KTBKf/ccix9d0Q74Og3f1HjVGt4Bki0jW6zY7w0jypI32P+RNhIaDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5JtR7v/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atQ8VRo1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHEvYws2720550
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9oK8N2pwkMR746yYWz9PU4FgDHKcw/a2sTgcdOFd+Y=; b=c5JtR7v/YrgzQd+h
	aZ1n4Fcmo9mJEXlY8foIK6i/4CHz8aaQwRz0UtnHa1vOupflFEF41WOwnzyuzrfL
	eIc2sKbwfNIS22KYCCbSZEdv7Y9HBCI/2J90dxIZZLQN0I2wy67F2CpC5Ul8MqUs
	pjX50V7z6u8PJ7hI5FovWxBXZ7cXS/z6ijz0FG+31xK9xPfqsbhAQjusg1ZaV9OE
	9Fb7KkhKQGGGk3L5OZzeglO5pQTpxZPzb0s/P6g9wV8JMAm70ufM9Y5d8S32MpjO
	ztCQjxTY+RkkbO3GRamhpYsyzwI/sLVlJ9y1Mqb6/SZJwtNp4nGtz5qTLxIh7fyT
	2b4Oag==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr58cum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 16:35:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso41712955ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 08:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765989356; x=1766594156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9oK8N2pwkMR746yYWz9PU4FgDHKcw/a2sTgcdOFd+Y=;
        b=atQ8VRo1d/HQZa0XV4kQ3dCZmkfK3/70lL92hNLuAXo3vzvHOqUDN0X1oCwJJJNbkO
         T1iEI9Q/xOrCzC8cg5rwnWUNZVQhiAOgm9wuMC0OWlIS5cLQt5/FXNHkzbrM94kuPksf
         9NMrjXCNvRHZj2qBXsBWnYLVgMU/F9nmDGpKhMWUWqCvl6yeEXZe2FlWIIiag6iprg8a
         kyzO+MQ6pEsUAYSo/Ig88WDeeY8/KpM71LZgMxAAD5F9jjjBkFRo7oi51BfFmveTxtG8
         w7Kw5FvInZg3gDUCnxrRUmoZFOUhxsOpTZhF4Rh7ZI0NAwLqkqEjK678JO/TnsSj3xPr
         GEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765989356; x=1766594156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J9oK8N2pwkMR746yYWz9PU4FgDHKcw/a2sTgcdOFd+Y=;
        b=HiFV6Ruz2ywEnU1JaYv/oRdeanW6Sfb3J7J0aZn9aBnYJ/oGjCJ/LQfuhcPXmGir/I
         EMAQtgiDSj47cwpCKMxFY94e9oN0nzAjBBu+8RWHjrA/YR+xO5goPPp7oW0rAldc2E+/
         eNoBwrhuk6vTP6N1RgBZNRIq32ZS8l5F14RDttcE/Frq1zXW+bmTk6w0B4/ax8ruFamO
         remnaRfPQEieXN9HbHKonFdtrdMu4cxpTEUN7exLge6mnNyz7b4vJohXUJEkytLN5GkT
         rIPs1Q+XAhtYJ5eNrdiO0Q/jqAs0uRwLXU6rJoIgcWiRNTMV+Wu5V55/kesXwJl91Sl5
         QDaQ==
X-Gm-Message-State: AOJu0YxazMVjYc79rQczISuB18CdeDu+5sVOOdnqWDNwdWkNDZ2iUXQU
	Mi8zZPBzlGkNw3zfI7cOG5/OYJWERGArS49ILbfE3FTQId862XPJgzqV1fQbw2TyLofvz/AwAXq
	XUSBJ6nqaZbzzZase4iL9PKzn5SmqrE4DkhRktm/Gsv8JhpsTrvlr6x8peT1NECZaEWkU
X-Gm-Gg: AY/fxX4MASpPEEY+Zv9aFjt/gsxa6RIn080/FlLmM+ya1hxg5QZtAx3lBH+fLtIU21K
	FmihBzlnK3BofF7LXg9DlssIuegUJonyHha4hSrpr8tKz1XR6241zOi/Zw0C81V2+YaIq1yT9jg
	58jjLBFyHNG1TYffUXTiWh54L7Si6rDVAVG1RXrgEhvr0X1IM7B/XXdG42jVw18ZN5qrvHg6xLE
	c74b5EHXWuUdOMqFNwD3GJ5bCo8CM2MSNJ9P8oCRrcnEtb7rNsQvCFOz3Xx5dE0TjzP3xE7GAiD
	HRppD4cF3SRafqXaMakpONrTD0tXAyLI3HqV0TiyZjjxmDglS4GszVq9253gCd6SeB1GUoKZ5rv
	MnohFq4h6fJ4JuiL1JbgDztE/FVbCxYnraOo5
X-Received: by 2002:a17:902:f546:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a110f79932mr87507115ad.58.1765989356020;
        Wed, 17 Dec 2025 08:35:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAruBXU0fR3BqUKjNefzqSlJ2zO5Q8Vvekg8asvuasIpmzqrIxw0pu14gMAR+IzN3AUkbf9g==
X-Received: by 2002:a17:902:f546:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a110f79932mr87506745ad.58.1765989355375;
        Wed, 17 Dec 2025 08:35:55 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9b36af7sm204721055ad.18.2025.12.17.08.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:35:55 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 22:04:49 +0530
Subject: [PATCH v9 13/14] remoteproc: qcom: pas: Enable Secure PAS support
 with IOMMU managed by Linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-kvm_rproc_v9-v9-13-ab7ac03e0ff1@oss.qualcomm.com>
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765989299; l=5426;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=bd5VFoeXgnnfPBNtjIyA8wzQq/ONErHwh2oKqdSLe6E=;
 b=LwmspJyZYxCAuyaE6tQjtzG4WbqWblyS0P4c+6d8SuN/mZPf3TsDmMGPq93PAVs6POCoAKrxB
 qxiVjxgdOv7A8S0zrU7PZcRdAyOHjb//ATchIkj/S5Ff1BRuRBB8yPL
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-GUID: bm1LFd8YtiNxHMqnZWII3L7xzHVcEd4v
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6942dbed cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=58pnfTnN0ARRJNaB1lkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEzMSBTYWx0ZWRfX/5fmWRvxLgPi
 wX04diaZhzGqL5wCnw4QZbltMMI3o4ecWfuceeXDtP6BgEBBvJ4g4zRm3wOmBkeukbXW8oHEGuP
 qN6/TIkfQbwUQF34VucGgJzV9125bJ1J+io2CzASI7/7CFvoQDtGLjNxSMdKxaNHNRe/5ROqFWp
 T615xEw+1o6ga4XzF+gQYPVvdNp1b/Wdl/OqJP8NeKYCIucLsFl837P9zPF7YagfYiwlVAQ1TTG
 ZVue1jTWHPMhPFOQDfMFwIakyJ/vSs2iEyfO8HIzfm6YD/rCKALIcZ9441uf1s9qXQMvXWZOVyH
 aeaAkz/8YQOiUYr2eSoznB+qhE2zFCe4LAwf44Bq1VZoNLCXf1edQ9L0qVxuyhvnq/qH8OnDAvI
 06BfClrobwxY5Hqd1qkH9oPsxR5CRQ==
X-Proofpoint-ORIG-GUID: bm1LFd8YtiNxHMqnZWII3L7xzHVcEd4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_03,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170131

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
index 07754f3a4ef8..0be7b9983482 100644
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
@@ -255,6 +256,22 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
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
@@ -289,11 +306,15 @@ static int qcom_pas_start(struct rproc *rproc)
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
 
@@ -304,18 +325,22 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -327,10 +352,16 @@ static int qcom_pas_start(struct rproc *rproc)
 
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
@@ -386,8 +417,12 @@ static int qcom_pas_stop(struct rproc *rproc)
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
@@ -738,6 +773,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	rproc->has_iommu = of_property_present(pdev->dev.of_node, "iommus");
 	rproc->auto_boot = desc->auto_boot;
 	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
 
@@ -817,6 +853,8 @@ static int qcom_pas_probe(struct platform_device *pdev)
 		goto remove_ssr_sysmon;
 	}
 
+	pas->pas_ctx->use_tzmem = rproc->has_iommu;
+	pas->dtb_pas_ctx->use_tzmem = rproc->has_iommu;
 	ret = rproc_add(rproc);
 	if (ret)
 		goto remove_ssr_sysmon;

-- 
2.50.1


