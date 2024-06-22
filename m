Return-Path: <linux-arm-msm+bounces-23724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5157891368D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Jun 2024 00:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 551101C212E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Jun 2024 22:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA7882D90;
	Sat, 22 Jun 2024 22:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWCJFmr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C162884DE2
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 22:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719093748; cv=none; b=eHbC4Z/2/kyAJGPKZZP3atB6hoKsIEMeg3NL2ESZiJOb4zcLBHx9x9vSBHFvPJgzxM+Mn/dUJJgM6G3bPABg4ahOm9lxUC66kA35qclaXWoz0uzdrwjVyHaeP1AOVsfrdv2ipu9M8/N2jZepFBZwIBAXbK2HKu2kOD+VNffKe/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719093748; c=relaxed/simple;
	bh=oep80Z2K2Jlzuj2Eg41CQ0HynF66YnEBtDALprDk3E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehbAuPll5+sxftthg/Auo8SMvIgxo2gItbqAmJzoI+2R8PnirP8Uil4fjikVbQjgSAluMK+4soDsD0rK9cJtB2Pj9CGXSBFIHl7YwuDB83Zkp8aPCOIHsxCAq9KfMPfO+1vagbKr+jBaAWFUsQbMWk7t0e1Wp8l1I+DM9kT7nLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QWCJFmr3; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ec50d4e47bso14978491fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Jun 2024 15:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719093745; x=1719698545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioH0kSreVM5204+/7ne4leOKqkukfnp1CbQNa7kS3uE=;
        b=QWCJFmr31BONpEL7JPMjwB8mqA6WyhetDgxVB6H9O4IChoPArH6Y8PdkkzymPFlSSt
         3x0NCOkuXgG6zReQrNlqSP2J1TMR3XC1FQ2iya05xfrkqPMFCuR6V9tNl2AWpFgvQLrp
         97LEu8FpxACWGleCCQStVlqtQzHZFHBtYxPUGkuczGEZNhAgljoQw0mwpvymt0M7L589
         9WYUu8XD+sH2D/diQLhLgnCVyc2DlEMhqDfxwi3jihFGXhGnuj/agirD/iYx81V4ejQL
         2KUu36N/6KTejuH330R6AuTYzznGupp4srjoaLkt/tXQlvQwXF1lJBmDBOTKsBn2czjd
         dDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719093745; x=1719698545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ioH0kSreVM5204+/7ne4leOKqkukfnp1CbQNa7kS3uE=;
        b=rK1QZwvgDEjjYDnbFPCrGhBTWyWzALONGWK2ON5oli8rUxY9imQSOK4nkqg4rxp1Zb
         Cb8HIIi3YYcKC0j0Y7hAkpY9VZJHs3gI9DtujAldM7uIOaEvaLDAKCZHrMevgll4pjMH
         z0kNlnU+eYppHK3cDi8FCTBo82Mj/Is81cfMy0lwzXdUDS8nDquj7WatI0f7SFrKpvE8
         N2zgzyQoWntmtVJk0NpLtM89iVyRfCTre15jgSEiquPf/LPLhwaaMu86ZpInoZpHtzAf
         GXSkTEdfXw1yaPlviZX/rcGHdGtVca0r6IHxowEQztC97pvPblWxjVykC4J5ialO5IJR
         kRpA==
X-Gm-Message-State: AOJu0YxxlixVl1eIoN3vt60pnovmeIxitckBP4sNiAHBG2wsGQOuGkjE
	mU3c8MPILk4qG782cV2lH8bRkgnCMNyPzLYKKVYqsN8+VtGdGdAfwIGlRIYY23Y=
X-Google-Smtp-Source: AGHT+IHLZImmyK/pnWuG95FTV4gPoOc4QrSl/5rfdttMADBUeCz4FORFiopsCOPQ/T2IE9zD/EoBfw==
X-Received: by 2002:a05:651c:158:b0:2ec:55b5:ed51 with SMTP id 38308e7fff4ca-2ec5b269428mr3933681fa.9.1719093745055;
        Sat, 22 Jun 2024 15:02:25 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec55e56ea5sm2502051fa.112.2024.06.22.15.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 15:02:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 23 Jun 2024 01:02:22 +0300
Subject: [PATCH v3 09/13] drm/msm/hdmi: rename hpd_clks to pwr_clks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240623-fd-hdmi-hpd-v3-9-8645a64cbd63@linaro.org>
References: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
In-Reply-To: <20240623-fd-hdmi-hpd-v3-0-8645a64cbd63@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3839;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=oep80Z2K2Jlzuj2Eg41CQ0HynF66YnEBtDALprDk3E4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd0npW5YjQsuxKinGOs6lp8xkrkAjZaRt95LyJ
 DooBKPfNW6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZndJ6QAKCRCLPIo+Aiko
 1X9aCACRFOh7HaRBPiIiaYjv3mjSh2+kuhlJTYB3/XUytpF2cyr1uqPAkiBwAHEpK93iCoX/Dnd
 CQxgdITWruqkhCdKipQ03Zuv2O/fOWZYkfq2dhASOOENyZnpdn3c3BZxg9/menjtSqwxQGFW4IM
 ws2lqUw4eZ4JHdbpUjpKtN4FeOoPI6TFpgXp7Yz+IzdCGMiznZKMhO0pPoTtxgPNyh92XDw9fPM
 sodwd7TNUvUnUzUuN/ruOywqQ7H3YG2kNLZUoNNFaGRJKWzsLSqYqFsoPAVWHN4EJOICdiqxMbZ
 RR/ln9e7DIXHKCBKVJs33vORXul18MmXpugKbSOUTpu/Lg0s
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

As these clocks are now used in the runtime PM callbacks, they have no
connection to 'HPD'. Rename corresponding fields to follow clocks
purpose, to power up the HDMI controller.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 26 +++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  6 +++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ba9d4671e722..48dd1843ea1f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -227,19 +227,19 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
 
 static const char *pwr_reg_names_8960[] = {"core-vdda"};
-static const char *hpd_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
+static const char *pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
 		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(hpd_clk, 8960),
+		HDMI_CFG(pwr_clk, 8960),
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static const char *pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_clk, 8x74),
+		HDMI_CFG(pwr_clk, 8x74),
 };
 
 /*
@@ -424,17 +424,17 @@ static int msm_hdmi_dev_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get pwr regulators\n");
 
-	hdmi->hpd_clks = devm_kcalloc(&pdev->dev,
-				      config->hpd_clk_cnt,
-				      sizeof(hdmi->hpd_clks[0]),
+	hdmi->pwr_clks = devm_kcalloc(&pdev->dev,
+				      config->pwr_clk_cnt,
+				      sizeof(hdmi->pwr_clks[0]),
 				      GFP_KERNEL);
-	if (!hdmi->hpd_clks)
+	if (!hdmi->pwr_clks)
 		return -ENOMEM;
 
-	for (i = 0; i < config->hpd_clk_cnt; i++)
-		hdmi->hpd_clks[i].id = config->hpd_clk_names[i];
+	for (i = 0; i < config->pwr_clk_cnt; i++)
+		hdmi->pwr_clks[i].id = config->pwr_clk_names[i];
 
-	ret = devm_clk_bulk_get(&pdev->dev, config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = devm_clk_bulk_get(&pdev->dev, config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		return ret;
 
@@ -492,7 +492,7 @@ static int msm_hdmi_runtime_suspend(struct device *dev)
 	struct hdmi *hdmi = dev_get_drvdata(dev);
 	const struct hdmi_platform_config *config = hdmi->config;
 
-	clk_bulk_disable_unprepare(config->hpd_clk_cnt, hdmi->hpd_clks);
+	clk_bulk_disable_unprepare(config->pwr_clk_cnt, hdmi->pwr_clks);
 
 	pinctrl_pm_select_sleep_state(dev);
 
@@ -515,7 +515,7 @@ static int msm_hdmi_runtime_resume(struct device *dev)
 	if (ret)
 		goto fail;
 
-	ret = clk_bulk_prepare_enable(config->hpd_clk_cnt, hdmi->hpd_clks);
+	ret = clk_bulk_prepare_enable(config->pwr_clk_cnt, hdmi->pwr_clks);
 	if (ret)
 		goto fail;
 
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 07a1b3641cb4..9bc4bd6761de 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -49,7 +49,7 @@ struct hdmi {
 	phys_addr_t mmio_phy_addr;
 
 	struct regulator_bulk_data *pwr_regs;
-	struct clk_bulk_data *hpd_clks;
+	struct clk_bulk_data *pwr_clks;
 	struct clk *extp_clk;
 
 	struct gpio_desc *hpd_gpiod;
@@ -88,8 +88,8 @@ struct hdmi_platform_config {
 	int pwr_reg_cnt;
 
 	/* clks that need to be on for hpd: */
-	const char **hpd_clk_names;
-	int hpd_clk_cnt;
+	const char **pwr_clk_names;
+	int pwr_clk_cnt;
 };
 
 struct hdmi_bridge {

-- 
2.39.2


