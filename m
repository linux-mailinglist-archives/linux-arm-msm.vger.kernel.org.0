Return-Path: <linux-arm-msm+bounces-13041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7356C86D743
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Mar 2024 00:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B7F5B22771
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 23:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809D85B1E4;
	Thu, 29 Feb 2024 23:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7M4okG0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707456D52F
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 23:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709247639; cv=none; b=iitcBc0RvtjmfWc4thKA0hVJrcEBrSzaqSS3MhrspWCPJkZKNTLUSesQglo6LUGMNN+HBPZLI99ywX+Lppo9GX7YzrBf0zg4f8mLqM96Dlp/RY1xGYFw8Se2yVRVRgGxIJbxFeWMQMFDpkj1V4Prv1erp5h3bEj5+tBQkOsmViw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709247639; c=relaxed/simple;
	bh=VeLpJ9RrhWEftUKiV6RI08P0z1Tg8bxvxEPvqRhZQyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/CNkKzwAJc3gEoYCHZBw7CD+JXkzUjsxVIIkyV9m7p4sLyXbR/4tfVxIjyeqTgeldJnk8cIHWXEIQ6Pz1oTXJhY2YFi44i4ji0aPn+RgwT/DAZPlcBhjAOSsTH42WTRmtl9Hc+ap9AyWU8lt7gFVHiI8VcuN5CzMskF3OThmXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h7M4okG0; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so17125591fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 15:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709247636; x=1709852436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKqBIp/MWEwYzRv6P9pfPz/DehwPilnWQZXqYwd2+DQ=;
        b=h7M4okG0612JZSCMmAMJIGRGXtbRbMTUETgJyNi9oDzAA6A5dpR3rYu2XSAPS9LHl6
         FOGjfIgeHCN3dNkGh7lP1qxiG688/17cc6YPRgmwCDDxKSuidSK9Oxl3BOvJ2ek5jJjz
         cybkSP3c2n4dqqMO/6oqcLKYDj/vOePmNDrzuS8hPS0LMat9uHvZyyhRBT2sonM1sFc1
         c+0xQky0Rqni+bDayjPQKAOhBf9Ra6Yx90WBD3AS4i486rMJCVqQNeBkZgFdD36cBeNb
         RUlt3mskgymhWYB4IXnvrAomvXhWBrW3npCDQnydkGqM/IyGo6R9tZoXS8qL4N/yi4MT
         Bxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709247636; x=1709852436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKqBIp/MWEwYzRv6P9pfPz/DehwPilnWQZXqYwd2+DQ=;
        b=csTN3RIQGqq3BfnhzIvKtMPiMHVnq0sX0u/6x/jWW9vZ8JTa5Ju2f51pQAUmCsn1gb
         74bOytai7y5HxsZa5DR7cUVe7uzzb7pifcrAbUBAsjDfa3rBMsItx2E80PXdR8TlKsg6
         kseptOIaisZqpq1yng9jp7w39Y8bwxyu5HKGwTkml1vPCbuUblafY+py+PRwqqqRuluc
         spDSgdnAeH3hKmcGZjHD8wPwGPd83vPURj0AEzgOzav9DRW2yr9nVP8gkmZhecbK2cFH
         2uBCMDQLmLerVOAmsvDBQ2f8rfOXRY1JYdO2BTJLXRSfiKjpGdX+jZDJBpYFwau9Caly
         QzSw==
X-Gm-Message-State: AOJu0YxiOA1rUz/x3uKApLpRwBnnngNIO/zHmirRFeRZSGPDZiZ77dC0
	w0tVoZmUY3X7d6fmg5vQ0KwFWnMopBgUaIhW7mKOOogxSXc8QdFRp08hpL+D74Q=
X-Google-Smtp-Source: AGHT+IFzzj6cyJ0hZ/om5SsSGumfj69130Y5fXKwW4vA9Wsy/VHT9XvaTKP52bEXDRDdFDJdlO70vQ==
X-Received: by 2002:a05:6512:1255:b0:513:2c6c:4cc8 with SMTP id fb21-20020a056512125500b005132c6c4cc8mr1184366lfb.63.1709247635656;
        Thu, 29 Feb 2024 15:00:35 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id s26-20020a19771a000000b00512ed2cf297sm408455lfc.151.2024.02.29.15.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 15:00:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Mar 2024 01:00:30 +0200
Subject: [PATCH RFC v2 4/5] remoteproc: qcom: mss: add configuration for
 in-kernel pdm
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240301-qcom-pd-mapper-v2-4-5d12a081d9d1@linaro.org>
References: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
In-Reply-To: <20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6069;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VeLpJ9RrhWEftUKiV6RI08P0z1Tg8bxvxEPvqRhZQyY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl4QyOBdFeTuNE2+P/IID4dkT/MAylCEaFhHolk
 Tn1vYJWl4qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZeEMjgAKCRCLPIo+Aiko
 1eBUB/9U2hLVam1lTtMZXqZETnfQEBr36SruItBKiLhqAs5fH5c9fHATQAUpxw7XvGc4Fwn+OpH
 cRtvJl2lFDg3Kb9KSsZi9JAPoJLBzRAI62LgtBIVJBufgQmzkbqEOhNzLLXRD0tUfHh+9smzjOe
 z6jHn72EhAU65PXi0mqJoDXhLZxoW5kB/etVzh8E6DENieSQiX69fh+EREvYD4Mxwd+IHh7/DoG
 A0sU2Wf3nL4OUetoDS4tuXj+RWubN6/4Fd7DlYBgI+RGwaPD4HfZ9N+/MNscrenK6APG7Shh+BK
 PUXiZGPad+NGhndlw8Woqcp6Y5Y/wCLQ/qvO6aYPJZkfsUav
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add domain / service configuration for the in-kernel protection domain
mapper service.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/Kconfig         |  1 +
 drivers/remoteproc/qcom_q6v5_mss.c | 84 ++++++++++++++++++++++++++++++++++++++
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
index 394b2c1cb5e2..8a7fca1e0b9a 100644
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
 
+	qproc->domains = desc->domains;
+	qproc->num_domains = desc->num_domains;
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
+	.domains = sm8350_mpss_domains,
+	.num_domains = ARRAY_SIZE(sm8350_mpss_domains),
 };
 
 static const struct rproc_hexagon_res sdm660_mss = {
@@ -2243,6 +2319,8 @@ static const struct rproc_hexagon_res sdm660_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM660,
+	.domains = sdm660_mpss_domains,
+	.num_domains = ARRAY_SIZE(sdm660_mpss_domains),
 };
 
 static const struct rproc_hexagon_res sdm845_mss = {
@@ -2278,6 +2356,8 @@ static const struct rproc_hexagon_res sdm845_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_SDM845,
+	.domains = sdm845_mpss_domains,
+	.num_domains = ARRAY_SIZE(sdm845_mpss_domains),
 };
 
 static const struct rproc_hexagon_res msm8998_mss = {
@@ -2309,6 +2389,8 @@ static const struct rproc_hexagon_res msm8998_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8998,
+	.domains = sdm845_mpss_domains,
+	.num_domains = ARRAY_SIZE(sdm845_mpss_domains),
 };
 
 static const struct rproc_hexagon_res msm8996_mss = {
@@ -2347,6 +2429,8 @@ static const struct rproc_hexagon_res msm8996_mss = {
 	.has_ext_cntl_regs = false,
 	.has_vq6 = false,
 	.version = MSS_MSM8996,
+	.domains = msm8996_mpss_domains,
+	.num_domains = ARRAY_SIZE(msm8996_mpss_domains),
 };
 
 static const struct rproc_hexagon_res msm8909_mss = {

-- 
2.39.2


