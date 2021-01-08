Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360112EF1EB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 13:08:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbhAHMHE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 07:07:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727798AbhAHMHB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 07:07:01 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD5C2C061231
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 04:05:21 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ce23so14181143ejb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 04:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7rVgQIzgBRTIosfiF1p2wFlmLYHzThKp02Co3vN4N1o=;
        b=rUaPmaD/lopsdO/FAwrVClZBowUhrH7Q3l17m4gsDBAVC0SUDE40tSxHRHd9MLpKSX
         IFWJ5SKgcp51oF9TmCD2zXKE6hVgQo0sOc04nWnuqdfLtgjC1UH3+1gcGPZ6iYA4Zkf1
         ajQwZgswNq3Jkav+qHd3gtr659b58/ebj7XyOQOMeOs+vVQeH/chpX83wZux2idS6S8B
         eIaVPjp4j2QFCV6Fzg814BNCtMB5OYfpm9NehXf/jhItiKU+dngpzgL09ULxWStCUajG
         joWjAvdAeeYWJCc9jwGnrCNdtfF4iMdVSDoK4hGf6pqQBbKoWP0n/XAOhiU1Sx3tM68g
         JEdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7rVgQIzgBRTIosfiF1p2wFlmLYHzThKp02Co3vN4N1o=;
        b=Gzuw8lAC7GS86FLQvJHyB5O9VPURNSPgRKCrFO+N6kAX3zVzE9oDfeKzLewaIRoi5y
         O7o/filQThbJL19Z6Esl5LLnxvOfUzckqUO+RA2p6UelpEEWW80+IDSQLLFSroh72Pgs
         JFQmVLCuw4K6b3gL9Ew/Cj8z85rWv/p7pkoi2sdZU8bGBAXgIsXYyi011IZq38CTtBtX
         XbuLRJiTTrGHFQ2Hqs89NzoRf9PbPEungcSkmNk9UsZS0WdHQr0eW7RqMLhDiPTxW5Bt
         A1C6fBKnqxe+uRuwEkHkJFE3T1OD1W0xh5Puf4E97IGzThWbJfMRsmKfcQgIqZlSOOHB
         CkwA==
X-Gm-Message-State: AOAM530OOEqy1f5V4XgO9Ib1gWSwQgq642BZfPSLRolrP52LALHInJgC
        2+JfZtMCpnTxDMFuxywOcqe2XQ==
X-Google-Smtp-Source: ABdhPJxo7k8VeY3iDaOX3reinXKRWWHwJbzHrszuG8av4s4CmDtv04yeck85djG1XHC0RqEeOuB90Q==
X-Received: by 2002:a17:906:7f11:: with SMTP id d17mr2414165ejr.534.1610107520575;
        Fri, 08 Jan 2021 04:05:20 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:05:19 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 13/17] media: camss: Enable SDM845
Date:   Fri,  8 Jan 2021 13:04:25 +0100
Message-Id: <20210108120429.895046-14-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
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
index 259ed094cee4..4dfae29c6327 100644
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
@@ -1205,6 +1211,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+	else if (camss->version == CAMSS_845)
+		nbr_pm_domains = PM_DOMAIN_TITAN_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
 		camss->genpd[i] = dev_pm_domain_attach_by_id(camss->dev, i);
@@ -1273,6 +1281,12 @@ static int camss_probe(struct platform_device *pdev)
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
@@ -1404,6 +1418,8 @@ void camss_delete(struct camss *camss)
 	if (camss->version == CAMSS_8x96 ||
 	    camss->version == CAMSS_660)
 		nbr_pm_domains = PM_DOMAIN_CAMSS_COUNT;
+	else if (camss->version == CAMSS_845)
+		nbr_pm_domains = PM_DOMAIN_TITAN_COUNT;
 
 	for (i = 0; i < nbr_pm_domains; i++) {
 		device_link_del(camss->genpd_link[i]);
@@ -1437,6 +1453,7 @@ static const struct of_device_id camss_dt_match[] = {
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

