Return-Path: <linux-arm-msm+bounces-13834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 487638783E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA04D1F21AEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F62D47F42;
	Mon, 11 Mar 2024 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/YiTwQT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A0E47768
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 15:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171253; cv=none; b=NFN5boUWU3l26NhlGhZA0ILg96kTtMGFa4gkCOHiBG8/FO9pVGbZbEJttcYr6Iz2nwTY9KfXRlYFKF0DwWBRVik7ZrZ8eG8XGtOd+mhysUzVVdKINuT4OiDAAoJc3EafYD3mhNgXFPtPxdpUSwmPN3URAPowjwnMkAClQYw4H1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171253; c=relaxed/simple;
	bh=H+7tUoihHYqF5r5UVf1/wYRNC8Tr92OKX0+0qwurl4w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hxk2EvWLxsOpI0dAM/iBItaTcYpam2L9oVJ11f9VNJHB0VSQHTshboz1HHqYU0u0V4EG4exjNjbqLsdQKPbhLX7uovtEdPPtwlmIGDF7E43EC2XYc3MLdIwhUFb57E54ghEJCxaFJMtxkRzWmmOIxjQEymyMgYpr/DjyysmZyBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/YiTwQT; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d3b93e992aso37445131fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 08:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710171249; x=1710776049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n5ilYydEiqSLSrOwKis6ciNK0Pj1JGODeYLFp0wqCzM=;
        b=x/YiTwQTybAYlo27rdIH8zxgFQvRbwT4ZdBbJ3/o9gTMBjW3zLyACSNX3kcVYY1D12
         vCXcA9Br6qEUoFGz3pNRn3VmG9zIHgd67z9g1AKX2DnnOgv8TPI/Ma4fKfe2w6rJfcZQ
         rGQIo7LWSis8MZBasujHbS+GizNNHd6lp3yXCkf8pEvuL1t8vy72X6/B1gNChVs/18KH
         z9HV6yAKW4H/RQGjtUxpqAfpL3P0HK6Nfafm7GBfaxqdRsIuAqEPAv8k5NfpnZ92fLXR
         G7Jus+w6K+0jGcTVoy88SpDIPbCh9dnfkTucV4XLdhUV/RZL2qcJ0VI4bYHZ5wtXMCgJ
         yRiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171249; x=1710776049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n5ilYydEiqSLSrOwKis6ciNK0Pj1JGODeYLFp0wqCzM=;
        b=ko891ROdqjtMZW3TRP9smflAD6SIWPWC92MhhsFTwimfv7ZMY5iPK0PLuSD/nhRy0l
         PVaFHtiI2n6CgXcR6pv6w8/2RkwhG52TKYeBgqZBvg1M8xg2g07XIUNC1ytfAqLICYez
         ueLnVGwtGgio0KeBw8rh4W/DtSl4Y2y0t+JuoTGCIcKU/1gd+rVI1Ltx6tyx9FOgpUNv
         RygKRjJpU2WyB7g0W4TMJQEaoqjRVQbPvB9vTVI+XI0S3pX3IyJ/iKJ7mw+nhbooBwmV
         9BddTrfooOT0+nm52gL4QVQW9O3daeLVYaWCxH77joOC0NICXtziLqDQwB5UU08Q+qB3
         f4Yw==
X-Gm-Message-State: AOJu0Yy8HXJid8IRdSxJaf7+7dpPM6WNEZWk0WtNgYYeUdaPO/TXu9zn
	JlIgHtF3PbV7/CEefO7jHsxxEzqNZT9Fkr4BCBebPelHEVaQyzXpCTfQ5O3cakIAAGiET9bwGQ+
	W
X-Google-Smtp-Source: AGHT+IHL6VWjwnd+j76MCgGB5r0cTsHDs5y81dIMXiS7lUCztljwktPllr+GgO/fGlTAqL9TnFBNBw==
X-Received: by 2002:a2e:88d4:0:b0:2d2:ed31:9fb7 with SMTP id a20-20020a2e88d4000000b002d2ed319fb7mr5517481ljk.4.1710171249458;
        Mon, 11 Mar 2024 08:34:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q19-20020a2e9153000000b002d449f736ddsm119294ljg.0.2024.03.11.08.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 08:34:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 17:34:05 +0200
Subject: [PATCH v4 5/7] remoteproc: qcom: adsp: add configuration for
 in-kernel pdm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-qcom-pd-mapper-v4-5-24679cca5c24@linaro.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6168;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=H+7tUoihHYqF5r5UVf1/wYRNC8Tr92OKX0+0qwurl4w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7yRrRIE66O/Kw69GLj5yNndJTnZNdbXXE5VS7
 c2hRCfYrp6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe8kawAKCRCLPIo+Aiko
 1XqyB/9r2ccjRrPPhOYJUOkK5ego1W5aXAhZJVzdcdTc5n6DIjJviJoq0Uy34A8OYfszAO3U0Ne
 owLRMRY1aAh6KDi5zhBATf5bPSbvhaqxAp8pyNoZYP+CbvCnDa4SJEMC1jwxzW959DQtPr71Kt9
 HW7m06cHw/BdXJ1J2WQ+VEYr8wRKFvhQ5Y5yiJHWKj0ZisIZQcd5vKzfR2hDoh1iT0N3BfwzP1e
 GXxk/KGc6vnBwqiXFh4gdzWdWeW0IFCXqNbm13rpDX/UcOjYA61DzV6VeBLd16E95h+eoQgibLL
 KwiLWZUUWYs/1FcKP4YkgzIlr6bPntVHcMd11JyXR/qcqGZZ
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


