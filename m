Return-Path: <linux-arm-msm+bounces-13835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6B8783E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 16:35:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2AA11C21A90
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4AD747F53;
	Mon, 11 Mar 2024 15:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sLN8FHOH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4A34776A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171253; cv=none; b=preLoIddBWKbnXVsAcFtbTLHbAcj9y50XEUYtokmmupWK+WGRh8sfITwIOc3uIcrFXH7smk23F85LBB8MSqSpWJQZeQ8Qh25xJGl6Imo9F0OBL7KJEpV2LgTqw0tRjnH94tC8g9Awl0nGrv8LVzCORt7pWORHudFt9Oaux/ZhKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171253; c=relaxed/simple;
	bh=HezEmRJ2gh2lp9Ogvu/1P0/j8r2F0Fge3IiGQ4ToCc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g17ycuvVXtX4iA8YMCVUJGnvC2PgXGgy+OQKQSFoCLOXrxQ6/u+LNONiCXJhcs+taLPEXikICB6QKrUoL3ayWR6zwPLMHLb/qkLal2wOSJ8q8nGDRDN2895idbFXEFOFFBhtwZqtO74jVJB5F816FirpNCunVxQltUIcd27Mp1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sLN8FHOH; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d23114b19dso61379391fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 08:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710171250; x=1710776050; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XjcOkTFMVp9cyWMILHcQ5nIdsorgS8uraxiKcFmnJk=;
        b=sLN8FHOHNEQtWZz4a9oRf7NlvYTvev51huJIqf/D2yq3aWbcnlCLYoEzVzC9tj+PTp
         Y2G6TPcK1xGrlaM2xY+ieFBKGWXuqxIo9DuAUvGyKVk8Y0kRuqr5To9hxyotgIXLLfmi
         8D409xed1gDD7PVO4E6JCTUlIwuYG1FZ68cNMdEb/HBpSkgLnhaRPusgtS03K38Q+C2S
         q5w8T+qKDspeXYYMIfOWD1jAvl+owrIETF3lMe3IL01pnrIDOP45XE2dlA3rat78YSNq
         NaFwTJrua4K8+Prd3t2u71cyGY6QoqcFKmvxCE2ouirbDJALxOPw1wqs5f8t4khtdtAx
         ioMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171250; x=1710776050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XjcOkTFMVp9cyWMILHcQ5nIdsorgS8uraxiKcFmnJk=;
        b=hDGzbWYGf7sgMF5AhViQfHJsNpny2rJRRJDgkO/YH04jhnF/b41BI1HbH9t/oETCvR
         G3AxOr19YSqFdFp+luG8CozTnBxFJJO7zcXUBqUNZJIYkqenmfJnVYsZpXhMlfGhwmnA
         wp0fh61QELsEEP4BqZcZIW2trce1NNSb1FXm9EymM+WldIX4kESTgVP69XiAcf/THWm1
         LdtOPOiJJbueNRUGdarfSoZ6b3hirXG3e+Xd5bd2W2b44+AygG5Nf0utgqOhf0kpLugq
         tMCZz3ttZu2GXzI/rNBlioV5X0drrIHEvhhIJeikBi1/jHtAbNJHHlE/A7N4W9Japb68
         u0aQ==
X-Gm-Message-State: AOJu0YwpK076qxTD8zy1xYnTI5QtJN+qORKLNrYj0/s1xItzVwCfh9Xv
	NHCl8iKL5c2Ievo7ClQWFU9J30y8EHQj9D/GNuaJvJlnz1S5yoEC8fNoYrKxhkL3Kot1V8sLPyO
	8
X-Google-Smtp-Source: AGHT+IEJHDV9+YJcF3r9STr5+V5UzaPIbdJ7xsukEQC5f5EWnizGDDpGPguTdUPVqV6ej7kaF4S8aA==
X-Received: by 2002:a2e:b8ce:0:b0:2d2:2ce1:1196 with SMTP id s14-20020a2eb8ce000000b002d22ce11196mr778022ljp.53.1710171250210;
        Mon, 11 Mar 2024 08:34:10 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q19-20020a2e9153000000b002d449f736ddsm119294ljg.0.2024.03.11.08.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 08:34:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 17:34:06 +0200
Subject: [PATCH v4 6/7] remoteproc: qcom: mss: add configuration for
 in-kernel pdm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-qcom-pd-mapper-v4-6-24679cca5c24@linaro.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5957;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HezEmRJ2gh2lp9Ogvu/1P0/j8r2F0Fge3IiGQ4ToCc8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7yRsr9KbdD0/8v6A38SRkevh8oemNsz8pdh0u
 IRWQbLZRRaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe8kbAAKCRCLPIo+Aiko
 1QnvCACyMVpglQEo/y+Q6OcY62UpYO3+Qq0UDflPRu5hrYvAkXxNdPk8t6hTU1TwMJJU+LqgAwX
 ZT1VXbO5MimOzNgORmcUxtsfm+V5RKmFdImzfuzr6dI3SQjKLgjq21O7YCaS0mggX3Cat88agpd
 Tuf4+3UokY2KAU2Wa7b6ffWL+l1kicn7m26GWANEfH8vYILAXMpRgcA+p95ApdnjD/b2EvvECgW
 W1o6EA5IT2R7UwPvUSDDzHk9HgIWJlrAjP+dmPCrp8KPJIVojtUwTXQmuBLQyj/SexZzDLFNzWJ
 trEzx+m64UwxhykXM69EPBtl2zPnkm3uxqIy0D91tw+0o8Zi
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add domain / service configuration for the in-kernel protection domain
mapper service.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig         |  1 +
 drivers/remoteproc/qcom_q6v5_mss.c | 80 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index f1698d4c302e..8152e845f7a3 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -202,6 +202,7 @@ config QCOM_Q6V5_MSS
 	depends on QCOM_SYSMON || QCOM_SYSMON=n
 	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
 	depends on QCOM_AOSS_QMP || QCOM_AOSS_QMP=n
+	depends on QCOM_PD_MAPPER || QCOM_PD_MAPPER=n
 	select MFD_SYSCON
 	select QCOM_MDT_LOADER
 	select QCOM_PIL_INFO
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 394b2c1cb5e2..d9ef874c3722 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -26,6 +26,7 @@
 #include <linux/remoteproc.h>
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
+#include <linux/soc/qcom/pd_mapper.h>
 #include <linux/iopoll.h>
 #include <linux/slab.h>
 
@@ -163,6 +164,9 @@ struct rproc_hexagon_res {
 	bool has_qaccept_regs;
 	bool has_ext_cntl_regs;
 	bool has_vq6;
+
+	const struct qcom_pdm_domain_data * const *domains;
+	size_t num_domains;
 };
 
 struct q6v5 {
@@ -242,6 +246,9 @@ struct q6v5 {
 	u64 mba_perm;
 	const char *hexagon_mdt_image;
 	int version;
+
+	const struct qcom_pdm_domain_data * const *domains;
+	size_t num_domains;
 };
 
 enum {
@@ -1581,10 +1588,14 @@ static int q6v5_start(struct rproc *rproc)
 	int xfermemop_ret;
 	int ret;
 
-	ret = q6v5_mba_load(qproc);
+	ret = qcom_pdm_add_domains(qproc->domains, qproc->num_domains);
 	if (ret)
 		return ret;
 
+	ret = q6v5_mba_load(qproc);
+	if (ret)
+		goto del_domains;
+
 	dev_info(qproc->dev, "MBA booted with%s debug policy, loading mpss\n",
 		 qproc->dp_size ? "" : "out");
 
@@ -1614,6 +1625,9 @@ static int q6v5_start(struct rproc *rproc)
 	q6v5_mba_reclaim(qproc);
 	q6v5_dump_mba_logs(qproc);
 
+del_domains:
+	qcom_pdm_del_domains(qproc->domains, qproc->num_domains);
+
 	return ret;
 }
 
@@ -1628,6 +1642,8 @@ static int q6v5_stop(struct rproc *rproc)
 
 	q6v5_mba_reclaim(qproc);
 
+	qcom_pdm_del_domains(qproc->domains, qproc->num_domains);
+
 	return 0;
 }
 
@@ -2013,6 +2029,9 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qproc);
 
+	qproc->domains = desc->domains;
+	qproc->num_domains = desc->num_domains;
+
 	qproc->has_qaccept_regs = desc->has_qaccept_regs;
 	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
 	qproc->has_vq6 = desc->has_vq6;
@@ -2153,6 +2172,54 @@ static void q6v5_remove(struct platform_device *pdev)
 	rproc_free(rproc);
 }
 
+static const struct qcom_pdm_domain_data mpss_root_pd = {
+	.domain = "msm/modem/root_pd",
+	.instance_id = 180,
+	.services = { NULL },
+};
+
+static const struct qcom_pdm_domain_data msm8996_mpss_root_pd = {
+	.domain = "msm/modem/root_pd",
+	.instance_id = 100,
+	.services = { NULL },
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
+static const struct qcom_pdm_domain_data *msm8996_mpss_domains[] = {
+	&msm8996_mpss_root_pd,
+};
+
+static const struct qcom_pdm_domain_data *sdm660_mpss_domains[] = {
+	&mpss_wlan_pd,
+};
+
+static const struct qcom_pdm_domain_data *sdm845_mpss_domains[] = {
+	&mpss_root_pd,
+	&mpss_wlan_pd,
+};
+
+static const struct qcom_pdm_domain_data *sm8350_mpss_domains[] = {
+	&sm8150_mpss_root_pd,
+};
+
 static const struct rproc_hexagon_res sc7180_mss = {
 	.hexagon_mba_image = "mba.mbn",
 	.proxy_clk_names = (char*[]){
@@ -2184,6 +2251,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SC7180,
+	// FIXME: domains?
 };
 
 static const struct rproc_hexagon_res sc7280_mss = {
@@ -2212,6 +2280,8 @@ static const struct rproc_hexagon_res sc7280_mss = {
 	.has_ext_cntl_regs = true,
 	.has_vq6 = true,
 	.version = MSS_SC7280,
+	.domains = sm8350_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
 };
 
 static const struct rproc_hexagon_res sdm660_mss = {
@@ -2243,6 +2313,8 @@ static const struct rproc_hexagon_res sdm660_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM660,
+	.domains = sdm660_mpss_domains,
+	.num_domains = ARRAY_SIZE(sdm660_mpss_domains),
 };
 
 static const struct rproc_hexagon_res sdm845_mss = {
@@ -2278,6 +2350,8 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM845,
+	.domains = sdm845_mpss_domains,
+	.num_domains = ARRAY_SIZE(sdm845_mpss_domains),
 };
 
 static const struct rproc_hexagon_res msm8998_mss = {
@@ -2309,6 +2383,8 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8998,
+	.domains = sdm845_mpss_domains,
+	.num_domains = ARRAY_SIZE(sdm845_mpss_domains),
 };
 
 static const struct rproc_hexagon_res msm8996_mss = {
@@ -2347,6 +2423,8 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8996,
+	.domains = msm8996_mpss_domains,
+	.num_domains = ARRAY_SIZE(msm8996_mpss_domains),
 };
 
 static const struct rproc_hexagon_res msm8909_mss = {

-- 
2.39.2


