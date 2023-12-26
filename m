Return-Path: <linux-arm-msm+bounces-5969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D44C281E435
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 01:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DCD31F230E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Dec 2023 00:50:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DE3C4A32;
	Tue, 26 Dec 2023 00:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsVYEKfI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46ADD1104
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Dec 2023 00:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ccb78da44fso17111281fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 16:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703550891; x=1704155691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jX3eO3feWUJNZX6BIAEYE8glaW4JPeslJan+d7r4XsQ=;
        b=ZsVYEKfIA5STcUMbHqGV3E201urnmbHD4cMKYMxnyD57oW01WV11E5hU/JKPkrOC7K
         1oGGjQqXQM/c4hXrYhxwEF0JoKSjoUORKkuqKcd1KC+3Z/LZ/NORjJ6BynQQIpeRJI5q
         8aC83TE4VJrp4vKGp5OghEeQTS3ouvu8WuIH3Dg6elomZhGzS19DLGMUwFGbxnR1ktn6
         Z2PAdt9O5gErCafhkK+PxyOWUnNB8LMOWVdm7RwPkSiRjvOLHob8c6dKTY/RQuR03Sfm
         B67XDM7A0xKfjcSdON/Hj4TNVIhtvdo1qE+Cxa4CPnzIE+xn/Mi89pjepWK+6PyHcPq7
         OZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703550891; x=1704155691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jX3eO3feWUJNZX6BIAEYE8glaW4JPeslJan+d7r4XsQ=;
        b=thMiupi/u847APd3Zo43sTOfrekU1pPqxvy2P4A7cH2dEen9dXL0BtTWkuLFN9s3DJ
         ews3kT3ncRLBZk8xeOQAPreOO9OpFrFQLp1Bxp3ZarvUcOGd0cYitESqutqHFEmQjwn9
         CAsAUD/laeO7jwOTECg9RWcGhzuMs7FTP3qJ9eelaLiwDr2jPBIlVAe2PP4e2cOfzoTe
         f0Olm+TBq2Bh3WNuBB5ivFv3XmJDF2cxT5WlNdyUTFJ0kiNKoW1NQWHrU2PbNXWDPbcB
         YME0kcrmqwzPbPiqfjkX6xN/rlm5lPb7hz3zSTdIdw7aL8g3LUeZNUjOWwUlL7OCHwgj
         1oDg==
X-Gm-Message-State: AOJu0YxB4RbMbZzJInKryP6AKT2llOxN/4rBcgs33J1qhXGMsJ+Wj1Dx
	bqOqL78TYaWV0woio/+1kuVPAmAj3VZ9VQ==
X-Google-Smtp-Source: AGHT+IHMFYdVkJAYdgHHQ5xefSmh7kREbueJsCdLz2upBsQSqy4L2BiuQV+qOq7SaAGoF8c3fhpbng==
X-Received: by 2002:a2e:86d9:0:b0:2cb:28d1:c22 with SMTP id n25-20020a2e86d9000000b002cb28d10c22mr2702960ljj.26.1703550891431;
        Mon, 25 Dec 2023 16:34:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d1-20020a05651c088100b002ccb1301d53sm1368810ljq.48.2023.12.25.16.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 16:34:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH 4/5] remoteproc: qcom: mss: add configuration for in-kernel pdm
Date: Tue, 26 Dec 2023 02:34:46 +0200
Message-Id: <20231226003447.3044365-5-dmitry.baryshkov@linaro.org>
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
 drivers/remoteproc/Kconfig         |  1 +
 drivers/remoteproc/qcom_q6v5_mss.c | 84 ++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

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
index 394b2c1cb5e2..0bc611165657 100644
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
+	size_t num_domains;
+	const struct qcom_pdm_domain_data * const *domains;
 };
 
 struct q6v5 {
@@ -242,6 +246,9 @@ struct q6v5 {
 	u64 mba_perm;
 	const char *hexagon_mdt_image;
 	int version;
+
+	size_t num_domains;
+	const struct qcom_pdm_domain_data * const *domains;
 };
 
 enum {
@@ -1580,6 +1587,7 @@ static int q6v5_start(struct rproc *rproc)
 	struct q6v5 *qproc = rproc->priv;
 	int xfermemop_ret;
 	int ret;
+	int i;
 
 	ret = q6v5_mba_load(qproc);
 	if (ret)
@@ -1608,8 +1616,18 @@ static int q6v5_start(struct rproc *rproc)
 	/* Reset Dump Segment Mask */
 	qproc->current_dump_size = 0;
 
+	for (i = 0; i < qproc->num_domains; i++) {
+		ret = qcom_pdm_add_domain(qproc->domains[i]);
+		if (ret)
+			goto err_domains;
+	}
+
 	return 0;
 
+err_domains:
+	while (--i >= 0)
+		qcom_pdm_del_domain(qproc->domains[i]);
+
 reclaim_mpss:
 	q6v5_mba_reclaim(qproc);
 	q6v5_dump_mba_logs(qproc);
@@ -1621,6 +1639,10 @@ static int q6v5_stop(struct rproc *rproc)
 {
 	struct q6v5 *qproc = rproc->priv;
 	int ret;
+	int i;
+
+	for (i = 0; i < qproc->num_domains; i++)
+		qcom_pdm_del_domain(qproc->domains[i]);
 
 	ret = qcom_q6v5_request_stop(&qproc->q6v5, qproc->sysmon);
 	if (ret == -ETIMEDOUT)
@@ -2013,6 +2035,9 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, qproc);
 
+	qproc->num_domains = desc->num_domains;
+	qproc->domains = desc->domains;
+
 	qproc->has_qaccept_regs = desc->has_qaccept_regs;
 	qproc->has_ext_cntl_regs = desc->has_ext_cntl_regs;
 	qproc->has_vq6 = desc->has_vq6;
@@ -2153,6 +2178,54 @@ static void q6v5_remove(struct platform_device *pdev)
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
@@ -2184,6 +2257,7 @@ static const struct rproc_hexagon_res sc7180_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SC7180,
+	// FIXME: domains?
 };
 
 static const struct rproc_hexagon_res sc7280_mss = {
@@ -2212,6 +2286,8 @@ static const struct rproc_hexagon_res sc7280_mss = {
 	.has_ext_cntl_regs = true,
 	.has_vq6 = true,
 	.version = MSS_SC7280,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
+	.domains = sm8350_mpss_domains,
 };
 
 static const struct rproc_hexagon_res sdm660_mss = {
@@ -2243,6 +2319,8 @@ static const struct rproc_hexagon_res sdm660_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM660,
+	.num_domains = ARRAY_SIZE(sdm660_mpss_domains),
+	.domains = sdm660_mpss_domains,
 };
 
 static const struct rproc_hexagon_res sdm845_mss = {
@@ -2278,6 +2356,8 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM845,
+	.num_domains = ARRAY_SIZE(sdm845_mpss_domains),
+	.domains = sdm845_mpss_domains,
 };
 
 static const struct rproc_hexagon_res msm8998_mss = {
@@ -2309,6 +2389,8 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8998,
+	.num_domains = ARRAY_SIZE(sdm845_mpss_domains),
+	.domains = sdm845_mpss_domains,
 };
 
 static const struct rproc_hexagon_res msm8996_mss = {
@@ -2347,6 +2429,8 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8996,
+	.num_domains = ARRAY_SIZE(msm8996_mpss_domains),
+	.domains = msm8996_mpss_domains,
 };
 
 static const struct rproc_hexagon_res msm8909_mss = {
-- 
2.39.2


