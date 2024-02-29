Return-Path: <linux-arm-msm+bounces-13042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC5886D73E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 00:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13A89287D43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 23:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C154845957;
	Thu, 29 Feb 2024 23:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I9G3azVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660964F1F8
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 23:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247641; cv=none; b=DVQDo81ahZTb7SeOKGWjsPZGKN5+0KRBkuf11jr6AstM0ojThEr8oT/4p5W1BNnP49+IDl99woRp5OiFd2sjeRrUzUverU5Rwiyp0eu0NQ0QNnv7CTeWhFY+mOPRFVPQdXxkhYUY5Tpdv9xlz8FaK0AHgyUVVJ5IKDHY8NnBgqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247641; c=relaxed/simple;
	bh=D7GISN2u24vq//gqQkwKCj6VvgKSulhJ3sNBx5O0DQk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ml19mYoUEfRaK87NKAQ/aUzEa3RMvFI8vj86ws7izbO7nOo3zWGRf2OX5QXn/KelKAyt0AnPiEKo8EFhyp+ErAUYilwsN4/AwBJL3VzWQslO8DxuMgzHgJfQ024pHHdbS1P4WKuzeozJMY+UNbhiIow5/KZ0gc86ZTo2J8/fOZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I9G3azVH; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-51326436876so1286344e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 15:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709247637; x=1709852437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjR5/P3XTORvWdrJTjKKntV7v0Kfuhm+Qw2uqQr3JtQ=;
        b=I9G3azVHf3w8+ix0IOMupdXPaV/UsYfRjt/yu9Fa31ZxAiz0rQfmybZLvDCebiZrci
         1dcahk/THgn22UsQV6RlD8Mko5YqJq4sYTnVWYZe9VhBSt2RCVigoT5AnismKkyXCb9E
         ZzDb3UEC+bxC6L9ESFHJqoIP4qrhCa7qBcvDhtwb6eIfkuYnRlfVg+3e1nt42jSlMyKn
         IfTZH26KJl3LRi7oqDTnK6TUGt+gmdELWrkvRBcldyk40yWrnflIQk4Vf7Q65yadCpJ1
         L9MfMNZvur7hDfqIKjfeMSRkI0xuniQxuUevW26T2jR57GF5wbBQEN/BM/MmCEImpdKP
         HlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709247637; x=1709852437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjR5/P3XTORvWdrJTjKKntV7v0Kfuhm+Qw2uqQr3JtQ=;
        b=VZnQlFmp8804UYaeqAoEm1qxYlZKwXQCqNpfSmadOEtnKqHKRl8R6kd1UWQPvEpasT
         wRr5BAFaTPyUfmAcCRQXjJIg5UI8uGGXRWOb3oZnchNnG8JmaBRHCMZfhip+xX9afx+P
         9LRKxtudUAy4bc+XHFD3tU/IccLU/yi2NiLOP80RD+kLrj3XUU+pXpFnqZHperpinoOj
         heBxvW7RET9AlrogMMujRjgZiiNEGs4bUd/Aze4oLOWsFMKhNY7bqzT0f2rUJAvULzDK
         oOVOkbSeaiMMdltYeaqfrlIGec7xzO9Aoeicc7rJTszKW3NmgEjS1ENxduw+MA6ikoan
         5zzw==
X-Gm-Message-State: AOJu0YyYjJl9Q0tY/nV2+peseuD2niJrRdhwjJ1KnU5qRtm52NoQSpb3
	mKSUe6kdEcf15OpSrpEdv/kk6pm9T7SweVTZmnwNFlrvXD1FleJjkbUOnp0e3xQ=
X-Google-Smtp-Source: AGHT+IG/Rww5D3n7iwPYiVh0kBmLT4Zl5RMnq83sR796iMWq6Y3eW8JKpIZgnfL4nShRD8E5X4hBoQ==
X-Received: by 2002:a05:6512:31ca:b0:513:d2:ad11 with SMTP id j10-20020a05651231ca00b0051300d2ad11mr765lfe.53.1709247636695;
        Thu, 29 Feb 2024 15:00:36 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id s26-20020a19771a000000b00512ed2cf297sm408455lfc.151.2024.02.29.15.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:00:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Mar 2024 01:00:31 +0200
Subject: [PATCH RFC v2 5/5] remoteproc: qcom: pas: add configuration for
 in-kernel pdm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240301-qcom-pd-mapper-v2-5-5d12a081d9d1@linaro.org>
References: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
In-Reply-To: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=21347;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=D7GISN2u24vq//gqQkwKCj6VvgKSulhJ3sNBx5O0DQk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl4QyOGGAJ5AiLjS3eZP1V/wk+wi5zlU9BuVFGL
 NKk0ALakr2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeEMjgAKCRCLPIo+Aiko
 1aJVB/9py42jdfnyq6eQASACtNbW1cHC3/2klfWqryF3p7oz74w9rbYPt6lV4d9UaBo/VqrdkPD
 eou6AjwmVjPkL8ZmjophR2s7/g4ijH/dAO5ydF1Arj6MovVzPzaEgLgpoVHWpZWhtNYBwBme9cW
 DV5w7woMxWgTCRZAdyhh/Ncq8dDD/xtgwafnoALM4fFvCK6p4N5kK02Hl3qEXkO7z+kz7Ke4FOZ
 ISxWMVn9fJ64p4N/8md0anW+0zfnQk+IV+25f9i5DHi5qkJRHO/hI4dTMAu2xyEEj98HloOKNSi
 BAxnQFCcM6vgTh2VUz6PTZACWphTAMzaiL6zuY2Wf5ndgJa1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add domain / service configuration for the in-kernel protection domain
mapper service.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig         |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 351 +++++++++++++++++++++++++++++++++++--
 2 files changed, 339 insertions(+), 13 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 8152e845f7a3..7c6ec54c7b35 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -223,6 +223,7 @@ config QCOM_Q6V5_PAS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_PIL_INFO
 	select QCOM_MDT_LOADER
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 3e34b9ff38ae..6c88a913ca28 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -23,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -56,6 +57,9 @@ struct adsp_data {
 	int region_assign_count;
 	bool region_assign_shared;
 	int region_assign_vmid;
+
+	const struct qcom_pdm_domain_data * const *domains;
+	size_t num_domains;
 };
 
 struct qcom_adsp {
@@ -112,6 +116,9 @@ struct qcom_adsp {
 
 	struct qcom_scm_pas_metadata pas_metadata;
 	struct qcom_scm_pas_metadata dtb_pas_metadata;
+
+	const struct qcom_pdm_domain_data * const *domains;
+	size_t num_domains;
 };
 
 static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
@@ -255,6 +262,7 @@ static int adsp_start(struct rproc *rproc)
 {
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
+	int i;
 
 	ret = qcom_q6v5_prepare(&adsp->q6v5);
 	if (ret)
@@ -327,8 +335,18 @@ static int adsp_start(struct rproc *rproc)
 	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
 	adsp->firmware = NULL;
 
+	for (i = 0; i < adsp->num_domains; i++) {
+		ret = qcom_pdm_add_domain(adsp->domains[i]);
+		if (ret)
+			goto err_domains;
+	}
+
 	return 0;
 
+err_domains:
+	while (--i >= 0)
+		qcom_pdm_del_domain(adsp->domains[i]);
+
 release_pas_metadata:
 	qcom_scm_pas_metadata_release(&adsp->pas_metadata);
 	if (adsp->dtb_pas_id)
@@ -372,6 +390,10 @@ static int adsp_stop(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int handover;
 	int ret;
+	int i;
+
+	for (i = 0; i < adsp->num_domains; i++)
+		qcom_pdm_del_domain(adsp->domains[i]);
 
 	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
 	if (ret == -ETIMEDOUT)
@@ -730,6 +752,10 @@ static int adsp_probe(struct platform_device *pdev)
 		adsp->dtb_firmware_name = dtb_fw_name;
 		adsp->dtb_pas_id = desc->dtb_pas_id;
 	}
+
+	adsp->domains = desc->domains;
+	adsp->num_domains = desc->num_domains;
+
 	platform_set_drvdata(pdev, adsp);
 
 	ret = device_init_wakeup(adsp->dev, true);
@@ -806,6 +832,151 @@ static void adsp_remove(struct platform_device *pdev)
 	rproc_free(adsp->rproc);
 }
 
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
+static const struct qcom_pdm_domain_data adsp_root_pd_pdr = {
+	.domain = "msm/adsp/root_pd",
+	.instance_id = 74,
+	.services = {
+		"tms/pdr_enabled",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data adsp_sensor_pd = {
+	.domain = "msm/adsp/sensor_pd",
+	.instance_id = 74,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data msm8996_adsp_audio_pd = {
+	.domain = "msm/adsp/audio_pd",
+	.instance_id = 4,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data msm8996_adsp_root_pd = {
+	.domain = "msm/adsp/root_pd",
+	.instance_id = 4,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data *msm8996_adsp_domains[] = {
+	&msm8996_adsp_audio_pd,
+	&msm8996_adsp_root_pd,
+};
+
+static const struct qcom_pdm_domain_data *qcs404_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+	&adsp_sensor_pd
+};
+
+static const struct qcom_pdm_domain_data *sc7280_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd_pdr,
+	&adsp_charger_pd,
+	&adsp_sensor_pd
+};
+
+static const struct qcom_pdm_domain_data *sdm845_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
+};
+
+static const struct qcom_pdm_domain_data *sm8350_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd_pdr,
+	&adsp_charger_pd,
+};
+
+static const struct qcom_pdm_domain_data cdsp_root_pd = {
+	.domain = "msm/cdsp/root_pd",
+	.instance_id = 76,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data *sdm845_cdsp_domains[] = {
+	&cdsp_root_pd,
+};
+
+static const struct qcom_pdm_domain_data slpi_root_pd = {
+	.domain = "msm/slpi/root_pd",
+	.instance_id = 90,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data slpi_sensor_pd = {
+	.domain = "msm/slpi/sensor_pd",
+	.instance_id = 90,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data *sdm845_slpi_domains[] = {
+	&slpi_root_pd,
+	&slpi_sensor_pd,
+};
+
+static const struct qcom_pdm_domain_data mpss_root_pd = {
+	.domain = "msm/modem/root_pd",
+	.instance_id = 180,
+	.services = {
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data mpss_root_pd_gps = {
+	.domain = "msm/modem/root_pd",
+	.instance_id = 180,
+	.services = {
+		"gps/gps_service",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data mpss_wlan_pd = {
+	.domain = "msm/modem/wlan_pd",
+	.instance_id = 180,
+	.services = {
+		"kernel/elf_loader",
+		"wlan/fw",
+		NULL,
+	},
+};
+
+static const struct qcom_pdm_domain_data *qcs404_mpss_domains[] = {
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+};
+
+static const struct qcom_pdm_domain_data *sm8150_mpss_domains[] = {
+	&mpss_root_pd_gps,
+	&mpss_wlan_pd,
+};
+
+static const struct qcom_pdm_domain_data *sm8350_mpss_domains[] = {
+	&mpss_root_pd_gps,
+};
+
 static const struct adsp_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -814,6 +985,37 @@ static const struct adsp_data adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	/* no domains */
+};
+
+static const struct adsp_data qcs404_adsp_resource_init = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.domains = qcs404_adsp_domains,
+	.num_domains = ARRAY_SIZE(qcs404_adsp_domains),
+};
+
+static const struct adsp_data sc7280_adsp_resource = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.proxy_pd_names = (char*[]){
+		"lcx",
+		"lmx",
+		NULL
+	},
+	.load_state = "adsp",
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.domains = sc7280_adsp_domains,
+	.num_domains = ARRAY_SIZE(sc7280_adsp_domains),
 };
 
 static const struct adsp_data sdm845_adsp_resource_init = {
@@ -825,6 +1027,20 @@ static const struct adsp_data sdm845_adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = sdm845_adsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
+};
+
+static const struct adsp_data sm6115_adsp_resource_init = {
+	.crash_reason_smem = 423,
+	.firmware_name = "adsp.mdt",
+	.pas_id = 1,
+	.auto_boot = true,
+	.ssr_name = "lpass",
+	.sysmon_name = "adsp",
+	.ssctl_id = 0x14,
+	.domains = sdm845_adsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
 };
 
 static const struct adsp_data sm6350_adsp_resource = {
@@ -841,6 +1057,7 @@ static const struct adsp_data sm6350_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	// TODO: domains
 };
 
 static const struct adsp_data sm6375_mpss_resource = {
@@ -856,6 +1073,7 @@ static const struct adsp_data sm6375_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	// TODO: domains
 };
 
 static const struct adsp_data sm8150_adsp_resource = {
@@ -871,6 +1089,8 @@ static const struct adsp_data sm8150_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = sdm845_adsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
 };
 
 static const struct adsp_data sm8250_adsp_resource = {
@@ -887,6 +1107,8 @@ static const struct adsp_data sm8250_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = sdm845_adsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
 };
 
 static const struct adsp_data sm8350_adsp_resource = {
@@ -903,8 +1125,8 @@ static const struct adsp_data sm8350_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
-	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
 	.domains = sm8350_adsp_domains,
+	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
 };
 
 static const struct adsp_data msm8996_adsp_resource = {
@@ -919,9 +1141,11 @@ static const struct adsp_data msm8996_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = msm8996_adsp_domains,
+	.num_domains = ARRAY_SIZE(msm8996_adsp_domains),
 };
 
-static const struct adsp_data cdsp_resource_init = {
+static const struct adsp_data qcs404_cdsp_resource_init = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
@@ -929,6 +1153,8 @@ static const struct adsp_data cdsp_resource_init = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sdm845_cdsp_resource_init = {
@@ -940,6 +1166,20 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
+};
+
+static const struct adsp_data sm6115_cdsp_resource_init = {
+	.crash_reason_smem = 601,
+	.firmware_name = "cdsp.mdt",
+	.pas_id = 18,
+	.auto_boot = true,
+	.ssr_name = "cdsp",
+	.sysmon_name = "cdsp",
+	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sm6350_cdsp_resource = {
@@ -971,6 +1211,8 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sm8250_cdsp_resource = {
@@ -986,6 +1228,8 @@ static const struct adsp_data sm8250_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sc8280xp_nsp0_resource = {
@@ -1000,6 +1244,8 @@ static const struct adsp_data sc8280xp_nsp0_resource = {
 	.ssr_name = "cdsp0",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sc8280xp_nsp1_resource = {
@@ -1030,6 +1276,8 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data mpss_resource_init = {
@@ -1047,6 +1295,26 @@ static const struct adsp_data mpss_resource_init = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	/* no domains */
+};
+
+static const struct adsp_data sc7280_mpss_resource_init = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.domains = sm8350_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
 };
 
 static const struct adsp_data sc8180x_mpss_resource = {
@@ -1062,6 +1330,46 @@ static const struct adsp_data sc8180x_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.domains = sm8150_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8150_mpss_domains),
+};
+
+static const struct adsp_data sm8150_mpss_resource = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.domains = sm8150_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8150_mpss_domains),
+};
+
+static const struct adsp_data sm8350_mpss_resource_init = {
+	.crash_reason_smem = 421,
+	.firmware_name = "modem.mdt",
+	.pas_id = 4,
+	.minidump_id = 3,
+	.auto_boot = false,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mss",
+		NULL
+	},
+	.load_state = "modem",
+	.ssr_name = "mpss",
+	.sysmon_name = "modem",
+	.ssctl_id = 0x12,
+	.domains = sm8350_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
 };
 
 static const struct adsp_data msm8996_slpi_resource_init = {
@@ -1076,6 +1384,7 @@ static const struct adsp_data msm8996_slpi_resource_init = {
 	.ssr_name = "dsps",
 	.sysmon_name = "slpi",
 	.ssctl_id = 0x16,
+	/* no domains */
 };
 
 static const struct adsp_data sdm845_slpi_resource_init = {
@@ -1092,9 +1401,11 @@ static const struct adsp_data sdm845_slpi_resource_init = {
 	.ssr_name = "dsps",
 	.sysmon_name = "slpi",
 	.ssctl_id = 0x16,
+	.domains = sdm845_slpi_domains,
+	.num_domains = ARRAY_SIZE(sdm845_slpi_domains),
 };
 
-static const struct adsp_data wcss_resource_init = {
+static const struct adsp_data qcs404_wcss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "wcnss.mdt",
 	.pas_id = 6,
@@ -1102,6 +1413,8 @@ static const struct adsp_data wcss_resource_init = {
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
 	.ssctl_id = 0x12,
+	.domains = qcs404_mpss_domains,
+	.num_domains = ARRAY_SIZE(qcs404_mpss_domains),
 };
 
 static const struct adsp_data sdx55_mpss_resource = {
@@ -1135,6 +1448,8 @@ static const struct adsp_data sm8450_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.domains = sm8350_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
 };
 
 static const struct adsp_data sm8550_adsp_resource = {
@@ -1154,6 +1469,8 @@ static const struct adsp_data sm8550_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = sm8350_adsp_domains,
+	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
 };
 
 static const struct adsp_data sm8550_cdsp_resource = {
@@ -1174,6 +1491,8 @@ static const struct adsp_data sm8550_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sm8550_mpss_resource = {
@@ -1197,6 +1516,8 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.region_assign_idx = 2,
 	.region_assign_count = 1,
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+	.domains = sm8350_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
 };
 
 static const struct adsp_data sc7280_wpss_resource = {
@@ -1264,25 +1585,28 @@ static const struct adsp_data sm8650_mpss_resource = {
 
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
+	// FIXME: is msm8996 adsp audio domain applicable to msm8953 ?
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8996-slpi-pil", .data = &msm8996_slpi_resource_init},
 	{ .compatible = "qcom,msm8998-adsp-pas", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8998-slpi-pas", .data = &msm8996_slpi_resource_init},
-	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
-	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
-	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
+	{ .compatible = "qcom,qcs404-adsp-pas", .data = &qcs404_adsp_resource_init },
+	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &qcs404_cdsp_resource_init },
+	{ .compatible = "qcom,qcs404-wcss-pas", .data = &qcs404_wcss_resource_init },
+	// FIXME: is adsp audio domain applicable to sc7180 ?
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
+	// FIXME: no domains?
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
-	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
+	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sc7280_adsp_resource},
 	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource},
-	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc7280-mpss-pas", .data = &sc7280_mpss_resource_init},
 	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},
-	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource},
+	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource},
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource},
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
@@ -1290,18 +1614,19 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init},
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
-	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
-	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
+	{ .compatible = "qcom,sm6115-adsp-pas", .data = &sm6115_adsp_resource_init},
+	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &sm6115_cdsp_resource_init},
 	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource},
 	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
+	// FIXME: no domains?
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
-	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm8150-mpss-pas", .data = &sm8150_mpss_resource},
 	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sdm845_slpi_resource_init},
 	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
@@ -1309,7 +1634,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8350-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sm8350-cdsp-pas", .data = &sm8350_cdsp_resource},
 	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sdm845_slpi_resource_init},
-	{ .compatible = "qcom,sm8350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm8350-mpss-pas", .data = &sm8350_mpss_resource_init},
 	{ .compatible = "qcom,sm8450-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sm8450-cdsp-pas", .data = &sm8350_cdsp_resource},
 	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sdm845_slpi_resource_init},

-- 
2.39.2


