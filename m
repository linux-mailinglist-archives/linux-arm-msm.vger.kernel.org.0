Return-Path: <linux-arm-msm+bounces-85654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A31DCCACCA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:11:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 971D3302F383
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72EF832E723;
	Thu, 18 Dec 2025 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XY+3b7aG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvLu28z1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42C62F2619
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045455; cv=none; b=UP62Dlq0FNMreotiWQC9c3GVcxird0NV4INd8+JmHoUbjowoF39WR7IpMv0Y8s082EYx7JvsebpnlbVth9eaCliinSByKbS+SqXiRjTKw8Y8fbdDSXw6DFogwfzMHnpVNrznkkOuMn/gRkk9puP3uvSJyGn0yOi/uhjoReehp3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045455; c=relaxed/simple;
	bh=VBlkATc/lcj6oh/+7N99ClnqOVJCbTvJk8ZfbtYCMaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WY6rK4CgWFtKXeyQsykOIZ4xGAZhAoco0Zpt1F6Dv08vXG4dJWLc0Oz9MENpFJjPbImL1Pvo/yaPK7AA0jJL9igxvAUtA15F9K3IvLl3dldy8IakxXkFZC7u+5BAxt3w4//Xr49iaxdnQ1IokDhjBjNqP5fOB2kRs0kJjbgiVIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XY+3b7aG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvLu28z1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YYIJ813757
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+bTnCXrZF7MRxf6WPpQ7TGUDn2ihAMOaEliTUQcOUv8=; b=XY+3b7aG56wq6J8B
	8qiPpnwIWjJ/cVr+NdLa/eye5DDK6ZK2/PzsAr/QaXvyAX7QA8/jgQvTb5Py5siA
	kryFPKWJw1touYZyr/vz7tRNbJe5Q7fqicEkAXWbkNQEcI3f0gUvzHrn+9mP041w
	4vaPrEeFEL+1nRvNZfkPJPBjYtKsJEEiIxRuDTLB5PthcXDJ3YXQUeXncLLIcFbs
	LeLD94FrOfp5arxPaYEbMpJdfD8Fb3VRNng8ua2xQclJIlSn0QCGBcvJRVfEY70U
	KwW+leZHMHBsHl5zOAW2CKnr0715DYPDS57XpNqCF9eNNvsBkgX+fJl1wOQHNueb
	FF1IOA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40v7a5ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:51 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so464415a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045450; x=1766650250; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bTnCXrZF7MRxf6WPpQ7TGUDn2ihAMOaEliTUQcOUv8=;
        b=XvLu28z1nNfl8nt+3yFZtOJ65Bwu6nI/0M1v6TfYXG+QIeg7nnDb42N16xwMPA7+K7
         Ic1yk5tHgHoS1RztcxQLa3Z7ga6OD/kDdvTKjKp8wWUO4AGHI05ACyXos6Bv0abstuR2
         z/oqfc85v7PKn0cV/JqzoW7jbuDTMaCegjbhgzw+383yEnWw6VUb+jaRwtKcjfUXr5HH
         UgKkmTEbXfkFAmhGcxPMcwPqOJU5jN8bat/nBF0U34Dun7+gBuw2KTXSZzz0ubV2NzTu
         DJ3lJHN9jH9LmbBSWVDbYNzLmOpTPibRpZ0O0hMNZEeHYpGT1HRt8fZlFKQviVxl/4VS
         UrWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045450; x=1766650250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+bTnCXrZF7MRxf6WPpQ7TGUDn2ihAMOaEliTUQcOUv8=;
        b=DwbQFjCe0ep8haOxHQaNm70TnLXPRf38MaH4y84MvYp2P7OKTUeREb/GDM9uV94sbJ
         djtiI4QKWpAKFu5E9by80+yuWlenQxtZyYC/GsPAyg9Id3HnDsdAulIc1zXYspd9WbDY
         QLKy1BGUnvQDYTN53PlWTzD0PLbKxGisVJB7GBMgGUujOhNpFC+lw0OcTSQwpH1Pqu+y
         LlskkmDDmpAVbvsGffabgs+cOVCesiehlg1Wv1JaVJZcgKFLDAuiJZAr9Qx+oPno5Ef9
         baHpJG60SnM6qzmnVJAJT5cTZULxucb0y85p8hy+M45PLrKAdLyH6A+LTxccoDeSx5cu
         /4dg==
X-Forwarded-Encrypted: i=1; AJvYcCXVP8CNmcXuaW7VWak0C+/plmTccC4MSE2TSsyg+U+8ulCjUDi427dQizSmJciYb8K/CFMrKWQslO0bauef@vger.kernel.org
X-Gm-Message-State: AOJu0YyhNEzzLV5XdaGIKwWks4ClnZe5vrH68qf2JVQ0YZGXaNXK8r7s
	e5DZrO8iTmyrlb1hg9vclPQxb5oqkaze8xqQERMTM5KbLXiFZgduESIk6216EvLlxCJqZqlYzp0
	YFNG+RBiMMBmDzo5DUME8TVGmJ5+iMEsaE0znVoSkUUyjYEA3NKIddzfW+rPM2mdZSlbW9IpLRO
	nPJcs=
X-Gm-Gg: AY/fxX4mJ03b+7XDBW81GSt8RCVn6SO03ObuMBVvchK9gYvVTDX7y2XyvJzcRpNnJXL
	dLs/gpSWO3mYdocqKbZxlc9zEYJC9GvpQkorHWsvCC9dDoTRsYA9BhhxPWF36HEAPQGecz6PdFO
	4iTSRx8vqNQ606dacCFjR6XR0NDBkakVLmBq/EUsRw9RHOv/l9y8QtlMH/viZ5c53Oyx3/wCx//
	b1ChDOub7RsaKrRz4ySyfREntEDKYYQiZMnJEs5lUX9WIGAHWbMWhnWsKdJJVMiqHFZHuTLIUz+
	0dqlzS3RXnP5uisoCDYxhlx95txzuWRK2DU+1z0LgjxIm/p6B0baQTJTd1cKNwDYJdxGQ1KhTS1
	zUygoKCz8EakbjOZSag8wv2+BCoWVfKdXz9f3Y0XVfqvwjz83GmgBOmFF720l014A/04=
X-Received: by 2002:a05:7300:2aa4:b0:2ae:6024:7a49 with SMTP id 5a478bee46e88-2ae60247d40mr3081172eec.30.1766045449888;
        Thu, 18 Dec 2025 00:10:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFO2m/fdcicBAoP4bK1C8K/V7fbv60Y9OFGS5ftQKn46N/HidNKcP8n5iWDeiFhQFJRnyoyew==
X-Received: by 2002:a05:7300:2aa4:b0:2ae:6024:7a49 with SMTP id 5a478bee46e88-2ae60247d40mr3081135eec.30.1766045449227;
        Thu, 18 Dec 2025 00:10:49 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:48 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:47 -0800
Subject: [PATCH v2 07/12] coresight-tmc: Support probe and initialization
 for CPU cluster TMCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-7-2335a6ae62a0@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=10021;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=VBlkATc/lcj6oh/+7N99ClnqOVJCbTvJk8ZfbtYCMaA=;
 b=jPtCN8o60f4IkWzznTnCyUC6rslRS9R4ZDA/TzyqRs8sWyR9Yt8N50nKiAJy8EX9fQoI6jH3U
 XSqF9/R2s1CA6VXJXu1DlV28z856e2Q1l3xIErAGKWsTiEJ9ABM+3rh
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: 04YzOsmLNhtOQEz6oC6NW_fIB4v-80H2
X-Proofpoint-GUID: 04YzOsmLNhtOQEz6oC6NW_fIB4v-80H2
X-Authority-Analysis: v=2.4 cv=f8JFxeyM c=1 sm=1 tr=0 ts=6943b70b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=AsHEykryqctiG1ll_fEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX0AEFscJRcoTb
 Moq43Cr2diueNnS62m1kyVQY1xoqJHgSVX63bpSC0+viCN95+ndPpEsBAAKF1GufSBO63cknGQZ
 ckQXO25wgRvmxNCo3NOQBcKtZCyWoGsrJK0liMprR2XrCUOglmROiJXtCuOKZJwJvpGXfTZ2QE5
 p9PCQV+FLghkVYHPtS2dClVvLNPKCpMP/jM+S6s5KbbXFrS7e7PWMSDVCbjcaNzZISjel/BdpHL
 TKdhb104cdsUVJDc0fFa7s38nsUDC66V7tInuJkIUl5X2uWxtfEDmltf7PhnNcwJektt+ibRXuF
 KabrMWzM/iBZt4tB6XYIdgjMI1EzwC7QNFike7TcpKpy3wem1BvZJzgee3wxdpxhMZdeMlj/X2E
 qfFrYn94aabV6oNFKFQHse8NUJT/mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066

TMC instances associated with CPU clusters reside in the cluster's power
domain. Unlike system-level TMCs, their registers are only accessible
when the cluster is powered on. Standard runtime PM may not suffice to
wake up a cluster from low-power states during probe, making direct
register access unreliable.

Refactor the probe sequence to handle these per-cluster devices safely:

1. Identify per-cluster TMCs using the "qcom,cpu-bound-components"
   property.
2. For such devices, use `smp_call_function_single()` to perform
   hardware initialization (`tmc_init_hw_config`) on a CPU within the
   cluster. This ensures the domain is powered during access.
3. Factor out the device registration logic into `tmc_add_coresight_dev()`.
   This allows common registration code to be shared between the standard
   probe path and the deferred probe path (used when the associated CPUs
   are initially offline).

This change ensures reliable initialization for per-cluster TMCs while
maintaining backward compatibility for standard system-level TMCs.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 195 +++++++++++++++--------
 drivers/hwtracing/coresight/coresight-tmc.h      |   6 +
 2 files changed, 132 insertions(+), 69 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6203e871fdcb8de569cc6701c52bb..0e1b5956398d3cefdd938a8a8404076eb4850b44 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -21,6 +21,7 @@
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
 #include <linux/spinlock.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -769,56 +770,14 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
-static int __tmc_probe(struct device *dev, struct resource *res)
+static int tmc_add_coresight_dev(struct device *dev)
 {
-	int ret = 0;
-	u32 devid;
-	void __iomem *base;
-	struct coresight_platform_data *pdata = NULL;
-	struct tmc_drvdata *drvdata;
+	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
 	struct coresight_desc desc = { 0 };
 	struct coresight_dev_list *dev_list = NULL;
+	int ret = 0;
 
-	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
-	if (!drvdata)
-		return -ENOMEM;
-
-	dev_set_drvdata(dev, drvdata);
-
-	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
-	if (ret)
-		return ret;
-
-	ret = -ENOMEM;
-
-	/* Validity for the resource is already checked by the AMBA core */
-	base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
-		goto out;
-	}
-
-	drvdata->base = base;
-	desc.access = CSDEV_ACCESS_IOMEM(base);
-
-	raw_spin_lock_init(&drvdata->spinlock);
-
-	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
-	drvdata->config_type = BMVAL(devid, 6, 7);
-	drvdata->memwidth = tmc_get_memwidth(devid);
-	/* This device is not associated with a session */
-	drvdata->pid = -1;
-	drvdata->etr_mode = ETR_MODE_AUTO;
-
-	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
-		drvdata->size = tmc_etr_get_default_buffer_size(dev);
-		drvdata->max_burst_size = tmc_etr_get_max_burst_size(dev);
-	} else {
-		drvdata->size = readl_relaxed(drvdata->base + TMC_RSZ) * 4;
-	}
-
-	tmc_get_reserved_region(dev);
-
+	desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
 	desc.dev = dev;
 
 	switch (drvdata->config_type) {
@@ -834,9 +793,9 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.type = CORESIGHT_DEV_TYPE_SINK;
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_SYSMEM;
 		desc.ops = &tmc_etr_cs_ops;
-		ret = tmc_etr_setup_caps(dev, devid, &desc.access);
+		ret = tmc_etr_setup_caps(dev, drvdata->devid, &desc.access);
 		if (ret)
-			goto out;
+			return ret;
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
@@ -851,44 +810,141 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	desc.name = coresight_alloc_device_name(dev_list, dev);
-	if (!desc.name) {
-		ret = -ENOMEM;
+	if (!desc.name)
+		return -ENOMEM;
+
+	drvdata->desc_name = desc.name;
+
+	desc.pdata = dev->platform_data;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	drvdata->miscdev.name = desc.name;
+	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
+	drvdata->miscdev.fops = &tmc_fops;
+	ret = misc_register(&drvdata->miscdev);
+	if (ret)
+		coresight_unregister(drvdata->csdev);
+
+	return ret;
+}
+
+static void tmc_clear_self_claim_tag(struct tmc_drvdata *drvdata)
+{
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	coresight_clear_self_claim_tag(&access);
+}
+
+static void tmc_init_hw_config(struct tmc_drvdata *drvdata)
+{
+	u32 devid;
+
+	devid = readl_relaxed(drvdata->base + CORESIGHT_DEVID);
+	drvdata->config_type = BMVAL(devid, 6, 7);
+	drvdata->memwidth = tmc_get_memwidth(devid);
+	drvdata->devid = devid;
+	drvdata->size = readl_relaxed(drvdata->base + TMC_RSZ) * 4;
+	tmc_clear_self_claim_tag(drvdata);
+}
+
+static void tmc_init_on_cpu(void *info)
+{
+	struct tmc_drvdata *drvdata = info;
+
+	tmc_init_hw_config(drvdata);
+}
+
+static struct cpumask *tmc_get_supported_cpus(struct device *dev)
+{
+	struct generic_pm_domain *pd;
+
+	pd = pd_to_genpd(dev->pm_domain);
+	if (pd)
+		return pd->cpus;
+
+	return NULL;
+}
+
+static int __tmc_probe(struct device *dev, struct resource *res)
+{
+	int cpu, ret = 0;
+	void __iomem *base;
+	struct coresight_platform_data *pdata = NULL;
+	struct tmc_drvdata *drvdata;
+
+	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+	if (!drvdata)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, drvdata);
+
+	ret = coresight_get_enable_clocks(dev, &drvdata->pclk, &drvdata->atclk);
+	if (ret)
+		return ret;
+
+	ret = -ENOMEM;
+
+	/* Validity for the resource is already checked by the AMBA core */
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base)) {
+		ret = PTR_ERR(base);
 		goto out;
 	}
 
+	drvdata->base = base;
+
+	raw_spin_lock_init(&drvdata->spinlock);
+	/* This device is not associated with a session */
+	drvdata->pid = -1;
+	drvdata->etr_mode = ETR_MODE_AUTO;
+	tmc_get_reserved_region(dev);
+
 	pdata = coresight_get_platform_data(dev);
 	if (IS_ERR(pdata)) {
 		ret = PTR_ERR(pdata);
 		goto out;
 	}
 	dev->platform_data = pdata;
-	desc.pdata = pdata;
 
-	coresight_clear_self_claim_tag(&desc.access);
-	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev)) {
-		ret = PTR_ERR(drvdata->csdev);
-		goto out;
+	if (fwnode_property_present(dev_fwnode(dev), "qcom,cpu-bound-components")) {
+		drvdata->supported_cpus = tmc_get_supported_cpus(dev);
+		if (!drvdata->supported_cpus)
+			return -EINVAL;
+
+		cpus_read_lock();
+		for_each_cpu(cpu, drvdata->supported_cpus) {
+			ret = smp_call_function_single(cpu,
+						       tmc_init_on_cpu, drvdata, 1);
+			if (!ret)
+				break;
+		}
+		cpus_read_unlock();
+		if (ret) {
+			ret = 0;
+			goto out;
+		}
+	} else {
+		tmc_init_hw_config(drvdata);
 	}
 
-	drvdata->miscdev.name = desc.name;
-	drvdata->miscdev.minor = MISC_DYNAMIC_MINOR;
-	drvdata->miscdev.fops = &tmc_fops;
-	ret = misc_register(&drvdata->miscdev);
-	if (ret) {
-		coresight_unregister(drvdata->csdev);
-		goto out;
+	if (drvdata->config_type == TMC_CONFIG_TYPE_ETR) {
+		drvdata->size = tmc_etr_get_default_buffer_size(dev);
+		drvdata->max_burst_size = tmc_etr_get_max_burst_size(dev);
 	}
 
+	ret = tmc_add_coresight_dev(dev);
+
 out:
 	if (is_tmc_crashdata_valid(drvdata) &&
 	    !tmc_prepare_crashdata(drvdata))
-		register_crash_dev_interface(drvdata, desc.name);
+		register_crash_dev_interface(drvdata, drvdata->desc_name);
 	return ret;
 }
 
@@ -934,10 +990,12 @@ static void __tmc_remove(struct device *dev)
 	 * etb fops in this case, device is there until last file
 	 * handler to this device is closed.
 	 */
-	misc_deregister(&drvdata->miscdev);
+	if (!drvdata->supported_cpus)
+		misc_deregister(&drvdata->miscdev);
 	if (drvdata->crashdev.fops)
 		misc_deregister(&drvdata->crashdev);
-	coresight_unregister(drvdata->csdev);
+	if (drvdata->csdev)
+		coresight_unregister(drvdata->csdev);
 }
 
 static void tmc_remove(struct amba_device *adev)
@@ -992,7 +1050,6 @@ static void tmc_platform_remove(struct platform_device *pdev)
 
 	if (WARN_ON(!drvdata))
 		return;
-
 	__tmc_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 95473d1310323425b7d136cbd46f118faa7256be..b104b7bf82d2a7a99382636e41d3718cf258d820 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -243,6 +243,9 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @supported_cpus:	Represent the CPUs related to this TMC.
+ * @devid:	TMC variant ID inferred from the device configuration register.
+ * @desc_name:	Name to be used while creating crash interface.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -273,6 +276,9 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct cpumask		*supported_cpus;
+	u32			devid;
+	const char		*desc_name;
 };
 
 struct etr_buf_operations {

-- 
2.34.1


