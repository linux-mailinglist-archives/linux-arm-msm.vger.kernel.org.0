Return-Path: <linux-arm-msm+bounces-5970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E6181E436
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 01:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64E201C21BA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 00:50:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F159F4C7B;
	Tue, 26 Dec 2023 00:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yHDMz7b+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC34A15A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Dec 2023 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-555104e21faso424627a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 16:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703550892; x=1704155692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZu6J97lhtg4OsgIXHw7256PW1uCOBxB+lYSwmckdnk=;
        b=yHDMz7b+4K6Mkj+CtCA7M2cVi0txmFAF0V/cWsoYq8KBq0DLEKtSPLDl3Vemg2LetG
         941VP3/952gMaQ64K51v3WnfTyQilOdKUqc9P7yo5g6h03o0CJz669OzyYvESdO0v2MI
         AoEi1YrdSCMkXly6+YIxsvrcNnh1iZlLe6gJVPsCjtyaPwhtlca1aK8x6AvbFPbq03ue
         J55wcqYxK0NW7YOUvTQNFNM2IdGJvbEbSCvfkAUJiOtZvpqpZGRBID31yVVgL/Iq4yRY
         aEpQUWHfxjR/w1RF5GGU4tA2uhrWVhVwFVyNtJxHvNdfeWGOO7j6vKYfjBDYddF7sWN8
         VARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703550892; x=1704155692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WZu6J97lhtg4OsgIXHw7256PW1uCOBxB+lYSwmckdnk=;
        b=o3Zu/nhYF57rkBZNrFSKltGBQm9wiLx+WBKgEAUCkGgsQV1mJ6Gzt0V3TfAsx8pblK
         TtGXpKlI4TCO6PnRBoZyGC6ZQa8KOAsh13g+2Rx7hfN05D3zub+Qzkr3jH8IElIoIr8f
         C/xvjgErgt076zdwmgYgbQEXSWdNpwfOBXxwTDBZ0n4/C3x1GTQhzzRzL4c2deqf5p/c
         u88P0uOZz+JpM5wbyzEkPRrnBa+JD8DRkXxVLlkykh3IIgPr7XfhwWWByDpkc6nz20MC
         /hRdPbJOwV91K7twIL5rdvVD0qgpS2W6GBk1MF6wOg755+3+Z+JQwxGq+g39Xj0YCq9O
         O14w==
X-Gm-Message-State: AOJu0Yw8qTRWmj4XmvAGy0JXJlhhThM0QoCf4lWfftRoWLlm8XB6LbZq
	4uc8tlcRk09r+tjbbS2E0bFdWlLQcvCnyQ==
X-Google-Smtp-Source: AGHT+IEaf7erng6WHHASSYDAc++NKJWJyEXpkUSa3g/JoAV/QExg4RqdbHIbIdE+9tMs2UhESVYtWw==
X-Received: by 2002:a50:8d15:0:b0:554:7470:2248 with SMTP id s21-20020a508d15000000b0055474702248mr3174542eds.41.1703550892082;
        Mon, 25 Dec 2023 16:34:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a05651c088100b002ccb1301d53sm1368810ljq.48.2023.12.25.16.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 16:34:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 5/5] remoteproc: qcom: pas: add configuration for in-kernel pdm
Date: Tue, 26 Dec 2023 02:34:47 +0200
Message-Id: <20231226003447.3044365-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
References: <20231226003447.3044365-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add domain / service configuration for the in-kernel protection domain
mapper service.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig         |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c | 292 ++++++++++++++++++++++++++++-
 2 files changed, 287 insertions(+), 6 deletions(-)

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
index c1f7c5ff8d93..caf2001eb532 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -23,6 +23,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/soc/qcom/smem_state.h>
 
@@ -51,6 +52,9 @@ struct adsp_data {
 	int ssctl_id;
 
 	int region_assign_idx;
+
+	size_t num_domains;
+	const struct qcom_pdm_domain_data * const *domains;
 };
 
 struct qcom_adsp {
@@ -104,6 +108,9 @@ struct qcom_adsp {
 
 	struct qcom_scm_pas_metadata pas_metadata;
 	struct qcom_scm_pas_metadata dtb_pas_metadata;
+
+	size_t num_domains;
+	const struct qcom_pdm_domain_data * const *domains;
 };
 
 static void adsp_segment_dump(struct rproc *rproc, struct rproc_dump_segment *segment,
@@ -247,6 +254,7 @@ static int adsp_start(struct rproc *rproc)
 {
 	struct qcom_adsp *adsp = rproc->priv;
 	int ret;
+	int i;
 
 	ret = qcom_q6v5_prepare(&adsp->q6v5);
 	if (ret)
@@ -319,8 +327,18 @@ static int adsp_start(struct rproc *rproc)
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
@@ -364,6 +382,10 @@ static int adsp_stop(struct rproc *rproc)
 	struct qcom_adsp *adsp = rproc->priv;
 	int handover;
 	int ret;
+	int i;
+
+	for (i = 0; i < adsp->num_domains; i++)
+		qcom_pdm_del_domain(adsp->domains[i]);
 
 	ret = qcom_q6v5_request_stop(&adsp->q6v5, adsp->sysmon);
 	if (ret == -ETIMEDOUT)
@@ -700,6 +722,10 @@ static int adsp_probe(struct platform_device *pdev)
 		adsp->dtb_firmware_name = dtb_fw_name;
 		adsp->dtb_pas_id = desc->dtb_pas_id;
 	}
+
+	adsp->domains = desc->domains;
+	adsp->num_domains = desc->num_domains;
+
 	platform_set_drvdata(pdev, adsp);
 
 	ret = device_init_wakeup(adsp->dev, true);
@@ -776,6 +802,123 @@ static void adsp_remove(struct platform_device *pdev)
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
+static const struct qcom_pdm_domain_data *sc7280_adsp_domains[] = {
+	&adsp_audio_pd,
+	&adsp_root_pd,
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
+	&adsp_root_pd,
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
+static const struct qcom_pdm_domain_data sm8150_mpss_root_pd = {
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
+static const struct qcom_pdm_domain_data *sm8150_mpss_domains[] = {
+	&sm8150_mpss_root_pd,
+	&mpss_wlan_pd,
+};
+
+static const struct qcom_pdm_domain_data *sm8350_mpss_domains[] = {
+	&sm8150_mpss_root_pd,
+};
+
 static const struct adsp_data adsp_resource_init = {
 	.crash_reason_smem = 423,
 	.firmware_name = "adsp.mdt",
@@ -784,6 +927,25 @@ static const struct adsp_data adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	/* no domains */
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
+	.num_domains = ARRAY_SIZE(sc7280_adsp_domains),
+	.domains = sc7280_adsp_domains,
 };
 
 static const struct adsp_data sdm845_adsp_resource_init = {
@@ -795,6 +957,20 @@ static const struct adsp_data sdm845_adsp_resource_init = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
+	.domains = sdm845_adsp_domains,
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
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
+	.domains = sdm845_adsp_domains,
 };
 
 static const struct adsp_data sm6350_adsp_resource = {
@@ -811,6 +987,7 @@ static const struct adsp_data sm6350_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	// TODO: domains
 };
 
 static const struct adsp_data sm6375_mpss_resource = {
@@ -826,6 +1003,7 @@ static const struct adsp_data sm6375_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	// TODO: domains
 };
 
 static const struct adsp_data sm8150_adsp_resource = {
@@ -841,6 +1019,8 @@ static const struct adsp_data sm8150_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
+	.domains = sdm845_adsp_domains,
 };
 
 static const struct adsp_data sm8250_adsp_resource = {
@@ -857,6 +1037,8 @@ static const struct adsp_data sm8250_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.num_domains = ARRAY_SIZE(sdm845_adsp_domains),
+	.domains = sdm845_adsp_domains,
 };
 
 static const struct adsp_data sm8350_adsp_resource = {
@@ -889,6 +1071,8 @@ static const struct adsp_data msm8996_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.num_domains = ARRAY_SIZE(msm8996_adsp_domains),
+	.domains = msm8996_adsp_domains,
 };
 
 static const struct adsp_data cdsp_resource_init = {
@@ -899,6 +1083,7 @@ static const struct adsp_data cdsp_resource_init = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	/* no domains */
 };
 
 static const struct adsp_data sdm845_cdsp_resource_init = {
@@ -910,6 +1095,20 @@ static const struct adsp_data sdm845_cdsp_resource_init = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
+	.domains = sdm845_cdsp_domains,
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
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
+	.domains = sdm845_cdsp_domains,
 };
 
 static const struct adsp_data sm6350_cdsp_resource = {
@@ -941,6 +1140,8 @@ static const struct adsp_data sm8150_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
+	.domains = sdm845_cdsp_domains,
 };
 
 static const struct adsp_data sm8250_cdsp_resource = {
@@ -956,6 +1157,8 @@ static const struct adsp_data sm8250_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
+	.domains = sdm845_cdsp_domains,
 };
 
 static const struct adsp_data sc8280xp_nsp0_resource = {
@@ -970,6 +1173,8 @@ static const struct adsp_data sc8280xp_nsp0_resource = {
 	.ssr_name = "cdsp0",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
+	.domains = sdm845_cdsp_domains,
 };
 
 static const struct adsp_data sc8280xp_nsp1_resource = {
@@ -1000,6 +1205,8 @@ static const struct adsp_data sm8350_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
+	.domains = sdm845_cdsp_domains,
 };
 
 static const struct adsp_data mpss_resource_init = {
@@ -1017,6 +1224,26 @@ static const struct adsp_data mpss_resource_init = {
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
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
+	.domains = sm8350_mpss_domains,
 };
 
 static const struct adsp_data sc8180x_mpss_resource = {
@@ -1032,6 +1259,46 @@ static const struct adsp_data sc8180x_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.num_domains = ARRAY_SIZE(sm8150_mpss_domains),
+	.domains = sm8150_mpss_domains,
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
+	.num_domains = ARRAY_SIZE(sm8150_mpss_domains),
+	.domains = sm8150_mpss_domains,
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
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
+	.domains = sm8350_mpss_domains,
 };
 
 static const struct adsp_data msm8996_slpi_resource_init = {
@@ -1046,6 +1313,7 @@ static const struct adsp_data msm8996_slpi_resource_init = {
 	.ssr_name = "dsps",
 	.sysmon_name = "slpi",
 	.ssctl_id = 0x16,
+	/* no domains */
 };
 
 static const struct adsp_data sdm845_slpi_resource_init = {
@@ -1062,6 +1330,8 @@ static const struct adsp_data sdm845_slpi_resource_init = {
 	.ssr_name = "dsps",
 	.sysmon_name = "slpi",
 	.ssctl_id = 0x16,
+	.num_domains = ARRAY_SIZE(sdm845_slpi_domains),
+	.domains = sdm845_slpi_domains,
 };
 
 static const struct adsp_data wcss_resource_init = {
@@ -1105,6 +1375,8 @@ static const struct adsp_data sm8450_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
+	.domains = sm8350_mpss_domains,
 };
 
 static const struct adsp_data sm8550_adsp_resource = {
@@ -1124,6 +1396,8 @@ static const struct adsp_data sm8550_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.num_domains = ARRAY_SIZE(sm8350_adsp_domains),
+	.domains = sm8350_adsp_domains,
 };
 
 static const struct adsp_data sm8550_cdsp_resource = {
@@ -1144,6 +1418,8 @@ static const struct adsp_data sm8550_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.num_domains = ARRAY_SIZE(sdm845_cdsp_domains),
+	.domains = sdm845_cdsp_domains,
 };
 
 static const struct adsp_data sm8550_mpss_resource = {
@@ -1165,6 +1441,8 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
 	.region_assign_idx = 2,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
+	.domains = sm8350_mpss_domains,
 };
 
 static const struct adsp_data sc7280_wpss_resource = {
@@ -1185,6 +1463,7 @@ static const struct adsp_data sc7280_wpss_resource = {
 
 static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,msm8226-adsp-pil", .data = &adsp_resource_init},
+	// FIXME: is msm8996 adsp audio domain applicable to msm8953 ?
 	{ .compatible = "qcom,msm8953-adsp-pil", .data = &msm8996_adsp_resource},
 	{ .compatible = "qcom,msm8974-adsp-pil", .data = &adsp_resource_init},
 	{ .compatible = "qcom,msm8996-adsp-pil", .data = &msm8996_adsp_resource},
@@ -1194,11 +1473,12 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
+	// FIXME: is adsp audio domain applicable to sc7180 ?
 	{ .compatible = "qcom,sc7180-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
-	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sm8350_adsp_resource},
+	{ .compatible = "qcom,sc7280-adsp-pas", .data = &sc7280_adsp_resource},
 	{ .compatible = "qcom,sc7280-cdsp-pas", .data = &sm6350_cdsp_resource},
-	{ .compatible = "qcom,sc7280-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sc7280-mpss-pas", .data = &sc7280_mpss_resource_init},
 	{ .compatible = "qcom,sc7280-wpss-pas", .data = &sc7280_wpss_resource},
 	{ .compatible = "qcom,sc8180x-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sc8180x-cdsp-pas", .data = &sm8150_cdsp_resource},
@@ -1211,8 +1491,8 @@ static const struct of_device_id adsp_of_match[] = {
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
@@ -1222,7 +1502,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6375-mpss-pas", .data = &sm6375_mpss_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
-	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm8150-mpss-pas", .data = &sm8150_mpss_resource},
 	{ .compatible = "qcom,sm8150-slpi-pas", .data = &sdm845_slpi_resource_init},
 	{ .compatible = "qcom,sm8250-adsp-pas", .data = &sm8250_adsp_resource},
 	{ .compatible = "qcom,sm8250-cdsp-pas", .data = &sm8250_cdsp_resource},
@@ -1230,7 +1510,7 @@ static const struct of_device_id adsp_of_match[] = {
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


