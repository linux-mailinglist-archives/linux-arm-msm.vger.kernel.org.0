Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CF0B31D857
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 12:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231927AbhBQL3P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 06:29:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231958AbhBQL0e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 06:26:34 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96969C0698C4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 03:22:20 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id s11so15947741edd.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Feb 2021 03:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PZVbssStSeLcJiuSI+6NDfhUe0uXgKt+Gf8JFcpnG2I=;
        b=nH4BeaW9mLebvquKQugWuj1aU1QgYGl80GwT0OyCGL1l6CcbRQ64U3aVl1GExC7KsW
         nu8e1yzMENpvZCXa1JjIvHuCiljiu9gr5i9t4Hmlv6SD7UKc5pVTnbiMSjIiVyioHdOY
         9pM2P2ROc+5MfyETueyLbR2ZTyAsnDTbRwAKGsqCeozJNbgsvfiZnCd+eBskpU+EMa0K
         GH91KbeIxpLkfUNqvORkUEW8QydvHMkiESoVaTC/MVTQzPBSDOIkrbv5DvztLeM+cXpW
         MZO8x1QARCsed3OOOimST4NO3w0rtVm/6ZShL/X+o6iKJ8SG/1QSyT+L1mmwjJa95cKH
         orPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PZVbssStSeLcJiuSI+6NDfhUe0uXgKt+Gf8JFcpnG2I=;
        b=ZiVE+b9Zo9bcBjJ0AscYStnR5Kj8/bDRJ51109e6jjbUGK30Z3tAtFViOk4dhk5c/1
         I66x0/8peqm+XLNQJHCM+f5908yOoU7mhJ3a6MkVZD/kOOUB4T4Le8R7Dz87Y8bpBjp4
         SXPzsgyHEO7SIpDr3kT71mMVJad1CfKAV2wmuKWLjBJhHCFAEIZ9kozZuOz0P0hsTDwh
         ++sD8BHGNgyoBR5ku9HC0dURGtxy3mYqin6I0VC7AI0lI7neaJ+bZkhzqs9nHAxilP/G
         E9wk+6btWsZXmy3kJmVmg9CA07vKFe+Aocw/xK8LYSsSlysfPmY8mvbBWu20l2+RkU0v
         dDSg==
X-Gm-Message-State: AOAM532qehZLwMS2sEdudk1si5/9ZwzJRDqQXkiwx6p+SWVBHmrO9Jeb
        TMNwydDYhxCMgwiRc/n+VhDKow==
X-Google-Smtp-Source: ABdhPJxGtbuPEz0t/tTQMfjLJQfzS3nrwDixYRLOkyc84XJa01Y37v+G5C6lYeTyroJHG1MROs3K9g==
X-Received: by 2002:a05:6402:b86:: with SMTP id cf6mr26298471edb.66.1613560939380;
        Wed, 17 Feb 2021 03:22:19 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:4815:d4dc:ff5a:704a])
        by smtp.gmail.com with ESMTPSA id h10sm934344edk.45.2021.02.17.03.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 03:22:19 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v5 13/22] media: camss: Enable SDM845
Date:   Wed, 17 Feb 2021 12:21:13 +0100
Message-Id: <20210217112122.424236-14-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210217112122.424236-1-robert.foss@linaro.org>
References: <20210217112122.424236-1-robert.foss@linaro.org>
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
index 3c45537b2cfb..3bd3153b7905 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -894,6 +894,12 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -1196,6 +1202,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+	else if (camss->version == CAMSS_845)
+		nbr_pm_domains = PM_DOMAIN_TITAN_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
 		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
@@ -1264,6 +1272,12 @@ static int camss_probe(struct platform_device *pdev)
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
@@ -1395,6 +1409,8 @@ void camss_delete(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+	else if (camss->version == CAMSS_845)
+		nbr_pm_domains = PM_DOMAIN_TITAN_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
 		device_link_del(camss->genpd_link[i]);
@@ -1428,6 +1444,7 @@ static const struct of_device_id camss_dt_match[] = {
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

