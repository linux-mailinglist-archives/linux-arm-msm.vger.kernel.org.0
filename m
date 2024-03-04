Return-Path: <linux-arm-msm+bounces-13275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A82C8707E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 18:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 055B91C2121F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 17:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B285D46B;
	Mon,  4 Mar 2024 17:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rYo9g71I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF105FB9C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 17:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571824; cv=none; b=SpKbtPdFyn8LJkfqY5bvDn4hD3Nde0sFxBmQRn1sAAUDCDvTggBJur48ZnXu4Sq0mxPuWLhIgAZKUK+6f0pCubPCigTyk9/KzWbXHtB4oPfpoavljuDiCUIC9woD3udzoSw9k94athEir36HBgyOE6S05Q5Nx9U9sXyBH/kt/1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571824; c=relaxed/simple;
	bh=H+7tUoihHYqF5r5UVf1/wYRNC8Tr92OKX0+0qwurl4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1DX5Jx+UE79tyYnFgaYi1MFxru1WcpyWrScdaV9VPaKBNjuWXKEizDtHJEhkejdhX/in8Gf/p0j4Ty64KEF2eh5eK4IgeHFMN5u6jHf7OjNDxq8ZNi1Ug6u3zQ6wwKH0/dWHMgcHm20MK8uXtMOgVWZUgXvxfsLYc0LAmPeiU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rYo9g71I; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5131f3fc695so4954161e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 09:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709571821; x=1710176621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5ilYydEiqSLSrOwKis6ciNK0Pj1JGODeYLFp0wqCzM=;
        b=rYo9g71IysTvMh0pcwmSAHHm9Dxrdv0DsdTpCmb6PvJeByRq0HPm71/zD3gOAHxOim
         0POAztw427z2bmH8udwqEIuvGFpOss1DJ2cgiRsC/x3OhX9hsRZwsXJQCWO7ZLri1OGK
         PWAqCAi1lOTe+036ncQEsLwqzbXZmu1V5vrJQddQvI49kaahnS2i4TxOgtZwp2mmMb+O
         nqAJz8nmbfI8GKmrtZ9IaVHXrVOwDrVvPkXVXJrWzN0kDDyJ8b8REISlzc7ksewYjV6+
         N+XAvkjvpRZtC5MxY3Kwm1s4XEoLZ5fb6CvxOqcyJLwZpdRyoMwyb/DYkHlWryggQBkQ
         fgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571821; x=1710176621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5ilYydEiqSLSrOwKis6ciNK0Pj1JGODeYLFp0wqCzM=;
        b=QdrE6iFVkISf4puPYlFsX8+BxotChxHWVsuLgWQhmDK6IqRDbEKH0tSXL/IkGWQbcr
         d0DVV1yoarHWb0JSPvWgn5A3FxAv76hAo1PcnDETcLYfkiA1BkDFeMbwUtUxeKnSpjY7
         DH/WwRP3feD55VjgwJgg97fB3QDguIIvAPWtpc4FeMsFFNr4QRSx2ZN+4qTZC7H5d9aG
         0kogq78lwKm97eiSEMDZAvGQT83mjhtNDGtS4Kef7TXl+IueEWqj5zbBTKLMV4cMK0S1
         cLOlZIBgORhH2FZxyG/y+QyhjOTmRXwAzmK4RNHxnN0UxwkhufHNlebyKgFDDPy/IRzd
         lI7g==
X-Gm-Message-State: AOJu0YwTtnd0laggvDA321c6wqaGQwNr1UuKXGHJyrfjqaGHo1mvHNCg
	KgaIvy3oIuadf+BSP+00J0e8t7VzZ5daQ7JowAoqT3PW/H4zrOU0FZCdBPJmDVg=
X-Google-Smtp-Source: AGHT+IF0E1jbrYIxnhT4hi4hEeYoVt8/gJSqM/6aDFSn5vDAy4X4hNX2o5vazg5anEN5XLklMH+P3A==
X-Received: by 2002:a05:6512:3b90:b0:513:45b6:18b2 with SMTP id g16-20020a0565123b9000b0051345b618b2mr3172460lfv.44.1709571820928;
        Mon, 04 Mar 2024 09:03:40 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id dx12-20020a0565122c0c00b005132441e07fsm1809151lfb.0.2024.03.04.09.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 09:03:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 04 Mar 2024 19:03:35 +0200
Subject: [PATCH RFC v3 5/7] remoteproc: qcom: adsp: add configuration for
 in-kernel pdm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-qcom-pd-mapper-v3-5-6858fa1ac1c8@linaro.org>
References: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
In-Reply-To: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6168;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=H+7tUoihHYqF5r5UVf1/wYRNC8Tr92OKX0+0qwurl4w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl5f7nH/hOYnTdnkS4RbpIJS6oyshgBvajxY9aI
 m9gO1oR8BSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeX+5wAKCRCLPIo+Aiko
 1eCPB/4/s1JE/OFlZN8oKTvbQAsGULtAVeuYlZ0ly6JhxWL6wkGZSoi6UL0jAmv8uBjaBu9c/vg
 wNK4GaltFYjmtfXiBpnjGTkkWKJghhjEIE/X86CoIVJcRJJ2jAnr/DME6Q5jlj1pymYbXWHm/Fq
 DfYE5IAO6uwlViP6jspMpBbbtZRKyhZ9d/juiqfYIb60RGk2USWkgJJwElGPYUY55ss3+5XyPBI
 ArLl8SLtvUkocpgMsaoe3aGI5yPKWBMusB+27rt8zd7N6Eg0brBBAMGrBfiqH59sd0OceSz6ZWM
 K/pyNCE2myIvUloNU5CviYaWJx4YaBIFPJaGYIViF6yv58/Z
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add domain / service configuration for the in-kernel protection domain
mapper service.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig          |  1 +
 drivers/remoteproc/qcom_q6v5_adsp.c | 82 ++++++++++++++++++++++++++++++++++---
 2 files changed, 78 insertions(+), 5 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48845dc8fa85..f1698d4c302e 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -181,6 +181,7 @@ config QCOM_Q6V5_ADSP
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 93f9a1537ec6..ea74ca730a50 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -23,6 +23,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -75,6 +76,9 @@ struct adsp_pil_data {
 	const char **pd_names;
 	unsigned int num_pds;
 	const char *load_state;
+
+	const struct qcom_pdm_domain_data * const *domains;
+	size_t num_domains;
 };
 
 struct qcom_adsp {
@@ -116,6 +120,9 @@ struct qcom_adsp {
 	struct qcom_sysmon *sysmon;
 
 	int (*shutdown)(struct qcom_adsp *adsp);
+
+	const struct qcom_pdm_domain_data * const *domains;
+	size_t num_domains;
 };
 
 static int qcom_rproc_pds_attach(struct qcom_adsp *adsp, const char **pd_names,
@@ -375,10 +382,14 @@ static int adsp_start(struct rproc *rproc)
 	int ret;
 	unsigned int val;
 
-	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_pdm_add_domains(adsp->domains, adsp->num_domains);
 	if (ret)
 		return ret;
 
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		goto del_domains;
+
 	ret = adsp_map_carveout(rproc);
 	if (ret) {
 		dev_err(adsp->dev, "ADSP smmu mapping failed\n");
@@ -446,6 +457,8 @@ static int adsp_start(struct rproc *rproc)
 	adsp_unmap_carveout(rproc);
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
+del_domains:
+	qcom_pdm_del_domains(adsp->domains, adsp->num_domains);
 
 	return ret;
 }
@@ -478,6 +491,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_adsp_pil_handover(&adsp->q6v5);
 
+	qcom_pdm_del_domains(adsp->domains, adsp->num_domains);
+
 	return ret;
 }
 
@@ -690,6 +705,8 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->rproc = rproc;
 	adsp->info_name = desc->sysmon_name;
 	adsp->has_iommu = desc->has_iommu;
+	adsp->domains = desc->domains;
+	adsp->num_domains = desc->num_domains;
 
 	platform_set_drvdata(pdev, adsp);
 
@@ -764,7 +781,56 @@ static void adsp_remove(struct platform_device *pdev)
 	rproc_free(adsp->rproc);
 }
 
-static const struct adsp_pil_data adsp_resource_init = {
+static const struct qcom_pdm_domain_data adsp_audio_pd = {
+	.domain = "msm/adsp/audio_pd",
+	.instance_id = 74,
+	.services = {
+		"avs/audio",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data adsp_charger_pd = {
+	.domain = "msm/adsp/charger_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data adsp_root_pd = {
+	.domain = "msm/adsp/root_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data adsp_sensor_pd = {
+	.domain = "msm/adsp/sensor_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data *sc7280_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_charger_pd,
+	&adsp_sensor_pd
+};
+
+static const struct qcom_pdm_domain_data cdsp_root_pd = {
+	.domain = "msm/cdsp/root_pd",
+	.instance_id = 76,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data *qcs404_cdsp_domains[] = {
+	&cdsp_root_pd,
+};
+
+static const struct qcom_pdm_domain_data *sdm845_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+};
+
+static const struct adsp_pil_data adsp_sdm845_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
 	.ssr_name = "lpass",
@@ -779,6 +845,8 @@ static const struct adsp_pil_data adsp_resource_init = {
 	.num_clks = 7,
 	.pd_names = (const char*[]) { "cx" },
 	.num_pds = 1,
+	.domains = sdm845_adsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
 };
 
 static const struct adsp_pil_data adsp_sc7280_resource_init = {
@@ -794,9 +862,11 @@ static const struct adsp_pil_data adsp_sc7280_resource_init = {
 		"gcc_cfg_noc_lpass", NULL
 	},
 	.num_clks = 1,
+	.domains = sc7280_adsp_domains,
+	.num_domains = ARRAY_SIZE(sc7280_adsp_domains),
 };
 
-static const struct adsp_pil_data cdsp_resource_init = {
+static const struct adsp_pil_data cdsp_qcs404_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.ssr_name = "cdsp",
@@ -811,6 +881,8 @@ static const struct adsp_pil_data cdsp_resource_init = {
 	.num_clks = 7,
 	.pd_names = (const char*[]) { "cx" },
 	.num_pds = 1,
+	.domains = qcs404_cdsp_domains,
+	.num_domains = ARRAY_SIZE(qcs404_cdsp_domains),
 };
 
 static const struct adsp_pil_data wpss_resource_init = {
@@ -831,10 +903,10 @@ static const struct adsp_pil_data wpss_resource_init = {
 };
 
 static const struct of_device_id adsp_of_match[] = {
-	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,qcs404-cdsp-pil", .data = &cdsp_qcs404_resource_init },
 	{ .compatible = "qcom,sc7280-adsp-pil", .data = &adsp_sc7280_resource_init },
 	{ .compatible = "qcom,sc7280-wpss-pil", .data = &wpss_resource_init },
-	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_resource_init },
+	{ .compatible = "qcom,sdm845-adsp-pil", .data = &adsp_sdm845_resource_init },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, adsp_of_match);

-- 
2.39.2


