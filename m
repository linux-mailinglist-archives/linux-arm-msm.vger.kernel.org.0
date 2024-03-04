Return-Path: <linux-arm-msm+bounces-13276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 045D68707E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 18:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 292CB1C21106
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 17:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3BB45FBB0;
	Mon,  4 Mar 2024 17:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yIqDD4Nc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA215FF0C
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 17:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571825; cv=none; b=X5yXuT2UO34JNKFQc7sRDSWpu80DS61l6G9PP1VZjYKCU94oMO/gQv7gjN3wuoUFYli+dWN8KMxMcpGw/H09GmJ+TaOz4lB3UFSKHtIEHkPGZT5UPu8NRTuCCjGdJg4ORy+vH8GYxmbEePQdTE3/qdXZaGFH0IjjwTNIwHvC/oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571825; c=relaxed/simple;
	bh=HezEmRJ2gh2lp9Ogvu/1P0/j8r2F0Fge3IiGQ4ToCc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qT2QEp4etcydCgYQmigL4SGWnzHdtyWOo8ZRl6ZfVt0T3JhOI3iLegytxk+dWVRa7/vr/h4LpBM0+LETbR/ns8ab04HtdTCP08C6ETboHDboD9LI0nwsGxOYkq8kw9Lfd17Ncpf9lz/U7jpacKJ0o04+Rfjx22hImxSP3uHpzFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yIqDD4Nc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5133d26632fso2405127e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 09:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709571822; x=1710176622; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XjcOkTFMVp9cyWMILHcQ5nIdsorgS8uraxiKcFmnJk=;
        b=yIqDD4Nch+tWFm5v2Jl6j8aRuTcEk7nKY9wLncWRCMwVrij548t1gZy8nB1jzXobt6
         tnZm9q9MtDTG6Z4taVSwuqeLI3plB4wjTZkOsB1GDqap0xc41CluueoCgu5KCgOZFimr
         0AIP6/n9117P96Lc36Dee4LIJZBBUa3OCS/0I8Gaigaspfu593EmNVe08x44ljfGysRd
         ZPE2vEzXLUT8bAqS10aIlMoQk81fBK+baDCp+weNUyXx6J2IqH4+iu01vLaC79qy/cOE
         Br/Spg64XjUhWdRaI+kzxEOaLMpBnZitCYvrBZd4VTL5pAMG5MLpNmbsckA32e4+4gYQ
         SbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571822; x=1710176622;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6XjcOkTFMVp9cyWMILHcQ5nIdsorgS8uraxiKcFmnJk=;
        b=EbOjjjy582SsEbU26mlMMts0JkK9cLPn27jCKFY6E/SxmpHfwI3dW+S5yje8n2tt27
         fIARbfVE1QWK51VJppPt9xsk9KwFUn+xdc1CQCHoeSryySka7s3MhIMVkNzpj+Kexzed
         mwByutGqVWlx0OxwHclJ6NayLxTJrMIA/2f8fBztEbwWcJ3EVYexGqn2KKkQKloJhSAp
         YrKlOYm3Tm8ua+dgro2tWD8Ms1MJ11vm3yD4z7pANDhFJlxbaoKW4GZjqHRY7Adv1zJF
         s3HxS1AwuS0ZjdybWoASKcWOjo29NOHg6Cd3d0nmCIP/Zl4zJ+OAlzikrU6yOoJDmjrp
         BFKg==
X-Gm-Message-State: AOJu0Yw3IXKgWSt8HeOJT0fP9asBleUcVG9prEcfu6vd2Jogcckaez48
	tkzwLBalkxE4XSQDL7o94sYexY4jJdhc11zmA9YAtPS9QH+hHpKjBApcsv+/iaU=
X-Google-Smtp-Source: AGHT+IFW9U380cZ84d+EUYrq5a/nw3o3rsnPieuU36YW72Pe2WmloMfeQCj/7CVEPkvhg/NOBRQ3Qg==
X-Received: by 2002:a05:6512:b1f:b0:513:4da9:95b9 with SMTP id w31-20020a0565120b1f00b005134da995b9mr947381lfu.57.1709571821916;
        Mon, 04 Mar 2024 09:03:41 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id dx12-20020a0565122c0c00b005132441e07fsm1809151lfb.0.2024.03.04.09.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 09:03:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 04 Mar 2024 19:03:36 +0200
Subject: [PATCH RFC v3 6/7] remoteproc: qcom: mss: add configuration for
 in-kernel pdm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-qcom-pd-mapper-v3-6-6858fa1ac1c8@linaro.org>
References: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
In-Reply-To: <20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5957;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HezEmRJ2gh2lp9Ogvu/1P0/j8r2F0Fge3IiGQ4ToCc8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl5f7nfRN3Olw7SkRQSuedFF1iwF+LT3PPhcS1x
 ayYK+B5dvmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeX+5wAKCRCLPIo+Aiko
 1fG3B/4zRKyjv3KSiNMWtLdHDzDBCRraB5A6yPh3P6M4i+XYvboEBt8YqOKspxPmDFeX3186ILE
 BoFNQBgzd2MCAKlvDttf9KFIJnoQuzJYsfd78oTl7/rEUkKaVjDSxiIy2aetS5n2XsC041WiECQ
 PSJMlZCZVExW9xZA24k3a5qOJdFM6ePg0ClhpBpPOFxEkZFQXHYK7nY8hPNn3QY3cV+mzck3cGw
 tiWouGbSsgbQlEnEXwqU0tlNXm1odW/pOSuZuj9ic2VoehC+kwnOyaHBDvdjQpy6swO/14rxlpg
 NbAggWQ11SEBWRV7ccHODcLrIsL/+r8B4o+AKwO/PmlXvZ3d
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


