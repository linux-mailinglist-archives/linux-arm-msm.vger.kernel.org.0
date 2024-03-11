Return-Path: <linux-arm-msm+bounces-13836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF5E8783E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C9F8E1F22378
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8800747F4A;
	Mon, 11 Mar 2024 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kBXjLKXn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B1B47A76
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 15:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171255; cv=none; b=RTdCHSWbBNNWdZbUmmSxZZxKH7J8zadMZIzpBdsgrg2BH8bjGkvabP2CQ94RtGW3jbk4Bcfb8zvBiav8loSUmj7kyL1YZ2GAtSnP1zvhJL8my1/0JPkSa4wJQ5nKmQO2Zx7pNa9LczRSr7qN2Fva2pp0jFkleZHbVOcVfBX5eBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171255; c=relaxed/simple;
	bh=Pd5HxDxl3geke343h9KbZXy6UOUknIP4GOVz9j+JjA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A75H1kqnA4IYNoXNvpaVsuVHiLsh+zfE8NhAlQGGZY9Ei5IpN1z+gq/KjKEEMCM0KmhVYzjk6/v8ezkOGJPqC3qg/5ZQRkbcFH/eoNysX3itsMGdF8cXPqxoEfwYLtK7N9NoiQEXdQ8y66BJNQCyVBny0vZ/7OAYiYygHPbszWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kBXjLKXn; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d2991e8c12so42865841fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 08:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710171251; x=1710776051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zlamnlsVA0iVCi4Vh7IzzVDyJZViPgeNcL9+iin29e4=;
        b=kBXjLKXnPWxQTPqMfUCNr1kru/KgyB9FSbLtaPCuFiCB5QKwgguvymd+GagtNKc/cA
         RsYYz1a4yH7/sIQbr38+c6K+/YKVxbz0mpmwoasYqxhH5uuBNQPPrevxPUxVzEAbND3X
         mqU9TYvVZyqvguLRsuu6S+qQ2SFyoLGcmqfx0tGpa+BmUYW3zlB2oUpq6sIKLmojgpxd
         TmUoS8jLpWFUgos77hWaNB/XcsvlXOo8PdveU4IFV45wWN8o6jxCmZ0LNzFnJYdZvOgg
         XdBITbmOm07hOxLCos1cRPIdxeLmQ7IDDWsXhMOKScj2xtIAPStwJh+AIl8efRBa4V0Y
         6jAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171251; x=1710776051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zlamnlsVA0iVCi4Vh7IzzVDyJZViPgeNcL9+iin29e4=;
        b=lNe5/TrM5jqrDmRmk5R0q4jzdXVvCb5tOHhCKqTXo1FcWbf8vhc7YKcqSvMuWHwfHY
         uLTexxAHDgRe2jYu0GNohQ2rAyhJmtjNBWVgjZmclrRGAy+8sp35Ge9VypdATDUStvgl
         LfBP5UuIGYuKz6gHEGeuVYOwtY3h5o6o5qdHUKf5ottgvEc1kyX0JfZCExk54ZouJSzN
         af9mN1sblNQ8NWHlSiGGPJ76ZJv522m+6ySFg0VaotjQ45F2tcu4OCdUccWRU7HGGmLx
         jvryF1UF46dfOge8rfVCus2AqSpygH7ERbXDp5QVfH2pSSCqXl1RLZEZjKAx3e4uHtCL
         2bHw==
X-Gm-Message-State: AOJu0YyNbgH4rNBiLACJTrRIrkUghx+gd2+qZQhEnIYxklw8i8Zyoxm2
	IjNTniS2e7/JKptaWo4vZ9IzylXfYuTQAUJJBbOtTIl7vYtE7VrUp1eg/wWLjHI=
X-Google-Smtp-Source: AGHT+IHjXejVF42d/WzWwSOsygPmEQ94GYnz58jHgRGnva8MYbSxThsPodaRtvcsmSnmkb4ZMNAN/Q==
X-Received: by 2002:a2e:a98c:0:b0:2d4:3b87:8b88 with SMTP id x12-20020a2ea98c000000b002d43b878b88mr1561717ljq.14.1710171251002;
        Mon, 11 Mar 2024 08:34:11 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q19-20020a2e9153000000b002d449f736ddsm119294ljg.0.2024.03.11.08.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 08:34:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 17:34:07 +0200
Subject: [PATCH v4 7/7] remoteproc: qcom: pas: add configuration for
 in-kernel pdm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-qcom-pd-mapper-v4-7-24679cca5c24@linaro.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=22975;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Pd5HxDxl3geke343h9KbZXy6UOUknIP4GOVz9j+JjA0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7yRs5KcapInXDkg+qmguNmy22Xyb1gZvWBaoT
 Vr78RXragKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe8kbAAKCRCLPIo+Aiko
 1UnuB/90VGsMGAuiI4VY4WsE9ClTUOzGq5Jt3IaSCjdmnB7jtuODKCtzPZKLzdfyl5AnPL5IOwY
 LIdTqoLxOfgUm4Q6WtcrktDLM55gSCCwUZ82YflUXELOSDtKAFViXtoR/a5USwZ9RUbYMgiCed2
 EC/G5yhFsktH+e4bUo7xDAFEwiNAmfQNF5gG5t8BNnwGVZmFs3+37MVSyROMqiDxbcPELcCGZIf
 82kjCy0QqvbjeqvsRYmWrn0nm7cZ8NH9URfVOrK8+Jc7Ylh7svYW7KMFPjnLsS9XyJY/rrDb/QJ
 WzmKl+anG32/YX5QjJAhWWDGtrBKWG1yjjZ3DCVbUX28EyE3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add domain / service configuration for the in-kernel protection domain
mapper service.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig         |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 370 +++++++++++++++++++++++++++++++++++--
 2 files changed, 354 insertions(+), 17 deletions(-)

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
index 3235249d703d..ba53df7ea30e 100644
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
@@ -256,10 +263,14 @@ static int adsp_start(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
 
-	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	ret = qcom_pdm_add_domains(adsp->domains, adsp->num_domains);
 	if (ret)
 		return ret;
 
+	ret = qcom_q6v5_prepare(&adsp->q6v5);
+	if (ret)
+		goto del_domains;
+
 	ret = adsp_pds_enable(adsp, adsp->proxy_pds, adsp->proxy_pd_count);
 	if (ret < 0)
 		goto disable_irqs;
@@ -348,6 +359,9 @@ static int adsp_start(struct rproc *rproc)
 disable_irqs:
 	qcom_q6v5_unprepare(&adsp->q6v5);
 
+del_domains:
+	qcom_pdm_del_domains(adsp->domains, adsp->num_domains);
+
 	/* Remove pointer to the loaded firmware, only valid in adsp_load() & adsp_start() */
 	adsp->firmware = NULL;
 
@@ -394,6 +408,8 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
 
+	qcom_pdm_del_domains(adsp->domains, adsp->num_domains);
+
 	return ret;
 }
 
@@ -730,6 +746,10 @@ static int adsp_probe(struct platform_device *pdev)
 		adsp->dtb_firmware_name = dtb_fw_name;
 		adsp->dtb_pas_id = desc->dtb_pas_id;
 	}
+
+	adsp->domains = desc->domains;
+	adsp->num_domains = desc->num_domains;
+
 	platform_set_drvdata(pdev, adsp);
 
 	ret = device_init_wakeup(adsp->dev, true);
@@ -806,6 +826,172 @@ static void adsp_remove(struct platform_device *pdev)
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
+	&adsp_sensor_pd,
+};
+
+static const struct qcom_pdm_domain_data *sc7180_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd_pdr,
+	&adsp_sensor_pd,
+};
+
+static const struct qcom_pdm_domain_data *sc7280_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd_pdr,
+	&adsp_charger_pd,
+	&adsp_sensor_pd,
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
+static const struct qcom_pdm_domain_data mpss_root_pd_gps_pdr = {
+	.domain = "msm/modem/root_pd",
+	.instance_id = 180,
+	.services = {
+		"gps/gps_service",
+		"tms/pdr_enabled",
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
+static const struct qcom_pdm_domain_data *sc7180_mpss_domains[] = {
+	&mpss_root_pd_gps_pdr,
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
@@ -814,6 +1000,55 @@ static const struct adsp_data adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	/* no domains */
+};
+
+static const struct adsp_data qcs404_adsp_resource = {
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
+static const struct adsp_data sc7180_adsp_resource = {
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
+	.domains = sc7180_adsp_domains,
+	.num_domains = ARRAY_SIZE(sc7180_adsp_domains),
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
@@ -825,6 +1060,20 @@ static const struct adsp_data sdm845_adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = sdm845_adsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
+};
+
+static const struct adsp_data sm6115_adsp_resource = {
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
@@ -841,6 +1090,8 @@ static const struct adsp_data sm6350_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = qcs404_adsp_domains,
+	.num_domains = ARRAY_SIZE(qcs404_adsp_domains),
 };
 
 static const struct adsp_data sm6375_mpss_resource = {
@@ -856,6 +1107,7 @@ static const struct adsp_data sm6375_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	// TODO: domains
 };
 
 static const struct adsp_data sm8150_adsp_resource = {
@@ -871,6 +1123,8 @@ static const struct adsp_data sm8150_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = sdm845_adsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
 };
 
 static const struct adsp_data sm8250_adsp_resource = {
@@ -887,6 +1141,8 @@ static const struct adsp_data sm8250_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = sdm845_adsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
 };
 
 static const struct adsp_data sm8350_adsp_resource = {
@@ -903,6 +1159,8 @@ static const struct adsp_data sm8350_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = sm8350_adsp_domains,
+	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
 };
 
 static const struct adsp_data msm8996_adsp_resource = {
@@ -917,9 +1175,11 @@ static const struct adsp_data msm8996_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = msm8996_adsp_domains,
+	.num_domains = ARRAY_SIZE(msm8996_adsp_domains),
 };
 
-static const struct adsp_data cdsp_resource_init = {
+static const struct adsp_data qcs404_cdsp_resource = {
 	.crash_reason_smem = 601,
 	.firmware_name = "cdsp.mdt",
 	.pas_id = 18,
@@ -927,6 +1187,8 @@ static const struct adsp_data cdsp_resource_init = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sdm845_cdsp_resource_init = {
@@ -938,6 +1200,8 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sm6350_cdsp_resource = {
@@ -954,6 +1218,8 @@ static const struct adsp_data sm6350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sm8150_cdsp_resource = {
@@ -969,6 +1235,8 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sm8250_cdsp_resource = {
@@ -984,6 +1252,8 @@ static const struct adsp_data sm8250_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sc8280xp_nsp0_resource = {
@@ -998,6 +1268,8 @@ static const struct adsp_data sc8280xp_nsp0_resource = {
 	.ssr_name = "cdsp0",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sc8280xp_nsp1_resource = {
@@ -1012,6 +1284,7 @@ static const struct adsp_data sc8280xp_nsp1_resource = {
 	.ssr_name = "cdsp1",
 	.sysmon_name = "cdsp1",
 	.ssctl_id = 0x20,
+	// TODO: domains
 };
 
 static const struct adsp_data sm8350_cdsp_resource = {
@@ -1028,9 +1301,11 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
-static const struct adsp_data mpss_resource_init = {
+static const struct adsp_data sc7180_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
@@ -1045,6 +1320,27 @@ static const struct adsp_data mpss_resource_init = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.domains = sc7180_mpss_domains,
+	.num_domains = ARRAY_SIZE(sc7180_mpss_domains),
+};
+
+static const struct adsp_data sc7280_mpss_resource = {
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
@@ -1060,6 +1356,27 @@ static const struct adsp_data sc8180x_mpss_resource = {
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
 };
 
 static const struct adsp_data msm8996_slpi_resource_init = {
@@ -1074,6 +1391,7 @@ static const struct adsp_data msm8996_slpi_resource_init = {
 	.ssr_name = "dsps",
 	.sysmon_name = "slpi",
 	.ssctl_id = 0x16,
+	/* no domains */
 };
 
 static const struct adsp_data sdm845_slpi_resource_init = {
@@ -1090,9 +1408,11 @@ static const struct adsp_data sdm845_slpi_resource_init = {
 	.ssr_name = "dsps",
 	.sysmon_name = "slpi",
 	.ssctl_id = 0x16,
+	.domains = sdm845_slpi_domains,
+	.num_domains = ARRAY_SIZE(sdm845_slpi_domains),
 };
 
-static const struct adsp_data wcss_resource_init = {
+static const struct adsp_data qcs404_wcss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "wcnss.mdt",
 	.pas_id = 6,
@@ -1100,6 +1420,8 @@ static const struct adsp_data wcss_resource_init = {
 	.ssr_name = "mpss",
 	.sysmon_name = "wcnss",
 	.ssctl_id = 0x12,
+	.domains = qcs404_mpss_domains,
+	.num_domains = ARRAY_SIZE(qcs404_mpss_domains),
 };
 
 static const struct adsp_data sdx55_mpss_resource = {
@@ -1115,6 +1437,7 @@ static const struct adsp_data sdx55_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x22,
+	// TODO: domains
 };
 
 static const struct adsp_data sm8450_mpss_resource = {
@@ -1133,6 +1456,8 @@ static const struct adsp_data sm8450_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.domains = sm8350_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
 };
 
 static const struct adsp_data sm8550_adsp_resource = {
@@ -1152,6 +1477,8 @@ static const struct adsp_data sm8550_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.domains = sm8350_adsp_domains,
+	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
 };
 
 static const struct adsp_data sm8550_cdsp_resource = {
@@ -1172,6 +1499,8 @@ static const struct adsp_data sm8550_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sm8550_mpss_resource = {
@@ -1195,6 +1524,8 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.region_assign_idx = 2,
 	.region_assign_count = 1,
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+	.domains = sm8350_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
 };
 
 static const struct adsp_data sc7280_wpss_resource = {
@@ -1235,6 +1566,8 @@ static const struct adsp_data sm8650_cdsp_resource = {
 	.region_assign_count = 1,
 	.region_assign_shared = true,
 	.region_assign_vmid = QCOM_SCM_VMID_CDSP,
+	.domains = sdm845_cdsp_domains,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
 };
 
 static const struct adsp_data sm8650_mpss_resource = {
@@ -1258,29 +1591,32 @@ static const struct adsp_data sm8650_mpss_resource = {
 	.region_assign_idx = 2,
 	.region_assign_count = 3,
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
+	.domains = sm8350_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
 };
 
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
-	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
-	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
-	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
+	{ .compatible = "qcom,qcs404-adsp-pas", .data = &qcs404_adsp_resource },
+	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &qcs404_cdsp_resource },
+	{ .compatible = "qcom,qcs404-wcss-pas", .data = &qcs404_wcss_resource },
+	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sc7180_adsp_resource},
+	{ .compatible = "qcom,sc7180-mpss-pas", .data = &sc7180_mpss_resource},
+	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sc7280_adsp_resource},
 	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource},
-	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc7280-mpss-pas", .data = &sc7280_mpss_resource},
 	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sc8180x-mpss-pas", .data = &sc8180x_mpss_resource},
-	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8250_adsp_resource},
+	{ .compatible = "qcom,sc8280xp-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sc8280xp-nsp0-pas", .data = &sc8280xp_nsp0_resource},
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource},
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init},
@@ -1288,18 +1624,18 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init},
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init},
 	{ .compatible = "qcom,sdx55-mpss-pas", .data = &sdx55_mpss_resource},
-	{ .compatible = "qcom,sm6115-adsp-pas", .data = &adsp_resource_init},
-	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &cdsp_resource_init},
+	{ .compatible = "qcom,sm6115-adsp-pas", .data = &sm6115_adsp_resource},
+	{ .compatible = "qcom,sm6115-cdsp-pas", .data = &qcs404_cdsp_resource},
 	{ .compatible = "qcom,sm6115-mpss-pas", .data = &sc8180x_mpss_resource},
 	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
-	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm6350-mpss-pas", .data = &sm8150_mpss_resource},
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
@@ -1307,7 +1643,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm8350-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sm8350-cdsp-pas", .data = &sm8350_cdsp_resource},
 	{ .compatible = "qcom,sm8350-slpi-pas", .data = &sdm845_slpi_resource_init},
-	{ .compatible = "qcom,sm8350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm8350-mpss-pas", .data = &sc7280_mpss_resource},
 	{ .compatible = "qcom,sm8450-adsp-pas", .data = &sm8350_adsp_resource},
 	{ .compatible = "qcom,sm8450-cdsp-pas", .data = &sm8350_cdsp_resource},
 	{ .compatible = "qcom,sm8450-slpi-pas", .data = &sdm845_slpi_resource_init},

-- 
2.39.2


