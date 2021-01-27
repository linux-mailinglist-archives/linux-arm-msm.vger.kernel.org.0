Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4924305EE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 15:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhA0O7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 09:59:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234958AbhA0O4f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 09:56:35 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D2BC061A2E
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 06:50:37 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id z22so2756612edb.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Jan 2021 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kvX1fPx3FMQ5uXckxXhS8AVQna5Rb5Ybg4HAxWPNgfE=;
        b=kX4+vQu5KkA7c6fiC1k7aSk49vpEf2RMy0CIAZDrW3dRpuRRMv3k0/SMy/umi5P4Zg
         SWEqK8N9N6Xtjh0GQoz97dtOmBX9+qLFmULQZOrZPoqd1GHRbE86fYGlqowmTOCdnctl
         YiN17EyWk5A7LF+PbwdS/lcC9epJNJ2OM3EKoS4cAkfQzewh/jnNur5XsE5YsWRuEywx
         ZVeeQYDHn/IrE2e5fQcVHM3B5phgiTDntDi3z0cjLwUTR12csdNM0MAdYnAux8pGMRQA
         JrOg1dBqfZx6/Q7NGNSDL+n0ZRIkb5jVXkX050Fap/heqHS6OtfohiAk8BBZRC7rQGWv
         LBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kvX1fPx3FMQ5uXckxXhS8AVQna5Rb5Ybg4HAxWPNgfE=;
        b=gV2q2aMxnUin3TNreVQeukFlPXJwUmRecfXvxDNiESpL9Id32e1VED3vxPJjMNXp9A
         B5JoLhHUgyvFuISWU0v3Pihr6iM793OIGGKNm6Mly9pUp5guk7aiD3OIdZ6iEBZNinY1
         km2illDo0lC3Ohyjkcb/GCFB+keT974eW4j6Y7krjQAXrPoY4RTe7W8vlYPrNbAAw8LJ
         8qzqYYdxx2r4IqLPnKQQJ5fwe/v/90RZsohSLg/Q9HRaJHfDChTjC/GyEtSh90vS3BGK
         05Bfervg8UpP5puKhVJi4mhTynBMLGKk41a+ggN+7UE7bOfIt7wX52J8WSYGVank4sc9
         1bCA==
X-Gm-Message-State: AOAM531qXiL4GO+dH4rXErHCYyOnNZ5yajgTcO8ZqJJWNuRlvZfV0dXB
        U2KoYXo/NC6z5539jf3Oqs6T2g==
X-Google-Smtp-Source: ABdhPJwg82kCSRknpu03BmumlhEqoJfimSXVwrdZOUdJ9b1vQ02woAMebN3rBP1KSFIyqj/u0V5J/w==
X-Received: by 2002:a50:ee94:: with SMTP id f20mr9536768edr.222.1611759036316;
        Wed, 27 Jan 2021 06:50:36 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:62e7:589a:1625:7acc])
        by smtp.gmail.com with ESMTPSA id ah12sm947799ejc.70.2021.01.27.06.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 06:50:35 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        angelogioacchino.delregno@somainline.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v3 12/22] media: camss: Enable SDM845
Date:   Wed, 27 Jan 2021 15:49:20 +0100
Message-Id: <20210127144930.2158242-13-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127144930.2158242-1-robert.foss@linaro.org>
References: <20210127144930.2158242-1-robert.foss@linaro.org>
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

