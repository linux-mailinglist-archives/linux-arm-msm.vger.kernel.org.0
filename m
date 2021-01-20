Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBAA92FDB7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Jan 2021 22:26:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732112AbhATU4F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 15:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387703AbhATNse (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 08:48:34 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8300FC061388
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 05:44:50 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id g10so4776832wrx.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Jan 2021 05:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kvX1fPx3FMQ5uXckxXhS8AVQna5Rb5Ybg4HAxWPNgfE=;
        b=Q/OOvB5sufKO/f+HBQXe5exjY/4GhQ+yiQHbkYN2i4txFLHXaV0N+hlFR0PHNA/moI
         BsZjgnR2jKTkaOdlGOjOvju7+aI5X+yXF+uqHpFWsxyJDYbVap8gtos3xFjhoGgnBd3I
         bFG7E8saHzGDjhPqpC4YGD6I0bPCJz5wBPMjzQE9WccVGLBMpFcMefc3eh6wkH2LtCwD
         8OYMiPvu3rZU2okWMd7BKp6IGK8dpShF/Ud5QiV5vF3dprX8C3OARqnE0B6mZrpPLGt1
         /HypXkmOfBOhEclaIR9Z9ZIAenu6BOPlYhXEhShUb+5NKB4XkmBJiluIlDpmoiWAaRFD
         F81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kvX1fPx3FMQ5uXckxXhS8AVQna5Rb5Ybg4HAxWPNgfE=;
        b=EA9WuRoZKZQI40bBTd1ifI6l/ssDzePAIY3JQcQhlrcvbWaqGHR58hhRaCcF7mOzYE
         TLHCXa4w5GTkfxuSufnoepGo3OdH/sSucZbSXAOTApieq3s0NpjmG8ILTcZxmt0j2QBy
         vgXt/4pziB3nlS4CtAZy4N4h72EKySlB8WtgR71kZ3+AkVNh23t73bVpvG9gowFkAJLd
         4KsRznrTVrpFos3V9vP4tSKZ/I6bYBQruPkE1TDExU6H1tQHk7wmpmsAN7Jmu+luzPGT
         GUwD/XWzNF5Bmdv1Y0fexGY5y3Hrf7cXluY42KiXb6bNFfnKn+RowPnn0m9vB9ADDiCY
         5A5A==
X-Gm-Message-State: AOAM530aFQXSOGUy0ATj6ArdirSywF5U2G/WQTyZPdCosMQbYf9KdDoa
        1ifP5q4L6waDPY4n2HcjwzQGXQ==
X-Google-Smtp-Source: ABdhPJwmeOkJDIwBxZPP1psrzo5rq2FDf7hRuBV8lpK8kRPuf0AVvSRZr+Fq+qh4DU6KCiFOy/XqeQ==
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr7403964wrn.79.1611150289327;
        Wed, 20 Jan 2021 05:44:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:44:48 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 12/22] media: camss: Enable SDM845
Date:   Wed, 20 Jan 2021 14:43:47 +0100
Message-Id: <20210120134357.1522254-12-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable support for SDM845 based Titan 170 ISPs.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  6 ++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 22f9d7d7085a..5ce7cae2ab9b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -897,6 +897,12 @@ static int camss_init_subdevices(struct camss *camss)
 		csid_res = csid_res_660;
 		ispif_res = &ispif_res_660;
 		vfe_res = vfe_res_660;
+	}  else if (camss->version == CAMSS_845) {
+		csiphy_res = csiphy_res_845;
+		csid_res = csid_res_845;
+		/* Titan VFEs don't have an ISPIF  */
+		ispif_res = NULL;
+		vfe_res = vfe_res_845;
 	} else {
 		return -EINVAL;
 	}
@@ -1203,6 +1209,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+	else if (camss->version == CAMSS_845)
+		nbr_pm_domains = PM_DOMAIN_TITAN_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
 		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
@@ -1271,6 +1279,12 @@ static int camss_probe(struct platform_device *pdev)
 		camss->csiphy_num = 3;
 		camss->csid_num = 4;
 		camss->vfe_num = 2;
+	} else if (of_device_is_compatible(dev->of_node,
+					   "qcom,sdm845-camss")) {
+		camss->version = CAMSS_845;
+		camss->csiphy_num = 4;
+		camss->csid_num = 3;
+		camss->vfe_num = 3;
 	} else {
 		ret = -EINVAL;
 		goto err_free;
@@ -1402,6 +1416,8 @@ void camss_delete(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+	else if (camss->version == CAMSS_845)
+		nbr_pm_domains = PM_DOMAIN_TITAN_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
 		device_link_del(camss->genpd_link[i]);
@@ -1435,6 +1451,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss" },
 	{ .compatible = "qcom,msm8996-camss" },
 	{ .compatible = "qcom,sdm660-camss" },
+	{ .compatible = "qcom,sdm845-camss" },
 	{ }
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7560d85b3352..2f853557ed16 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -60,6 +60,8 @@ enum pm_domain {
 	PM_DOMAIN_VFE0 = 0,
 	PM_DOMAIN_VFE1 = 1,
 	PM_DOMAIN_CAMSS_COUNT = 2,	/* CAMSS series of ISPs */
+	PM_DOMAIN_VFELITE = 2,		/* VFELITE / TOP GDSC */
+	PM_DOMAIN_TITAN_COUNT = 3,	/* Titan series of ISPs */
 };
 
 enum camss_version {
@@ -83,8 +85,8 @@ struct camss {
 	int vfe_num;
 	struct vfe_device *vfe;
 	atomic_t ref_count;
-	struct device *genpd[PM_DOMAIN_CAMSS_COUNT];
-	struct device_link *genpd_link[PM_DOMAIN_CAMSS_COUNT];
+	struct device *genpd[PM_DOMAIN_TITAN_COUNT];
+	struct device_link *genpd_link[PM_DOMAIN_TITAN_COUNT];
 };
 
 struct camss_camera_interface {
-- 
2.27.0

