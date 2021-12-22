Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31DFC47CA6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Dec 2021 01:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239969AbhLVAgH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 19:36:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240005AbhLVAgG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 19:36:06 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7914DC06173F
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:36:06 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id s1so1368643wrg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 16:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G8c71zTh04TorciXdFbO1w9DiM1ppvdvVk4okLW9tks=;
        b=rWoXBWCsnwaWG3cn1NTK6p6A1pK11bvXNdWXO+ycCT0Xse+IyCZDLMocicmCM2SEXJ
         wdGvzv1T+q+x/2h+DAPsTneV6Z2QYpeS/eAw5l/T9dq4KP10+ggr5QyUzT9uQT4EtySs
         zbmkXgbXjAd38tN8RRVrxtxUCsgO6U41vTXi3x/2JIYqB6eKyVXVI1b8IG0W5x8N7GrZ
         LOW0MKIS38r/4ZPDEJ3euPf7S547e2jOV4yRYjit+TwydBjhfcAY4E1eiKA+eFuW2Ubk
         OHv2F1SPH0MnJnn2oId5BRhsHv/j01xc4H1JP+z1AZU+Iu79+WXP36sMmMtJifxjkfz4
         RMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8c71zTh04TorciXdFbO1w9DiM1ppvdvVk4okLW9tks=;
        b=dk+Mw8fvlz+17tLm+3+BhJOmsPneys1IUJxi7WpSVpqIuY5nF5IEtne4gBElG6yBDf
         0dBUGmouW6ykwPu8aUUd1WxBmL1J+cg7OYNcYipDAC7AZ2yJEykpTd5ZviKRPVyQosQZ
         +43rELRS4MX1r9sYyqBj1xzy83h/o4pEPpFCEwUAhzSSZ61Gqv+21qDtePqkpAvTFTsU
         /LUTfO2VKeYJas1TBWdX1PeFzsgZhkh7aJZmYcrfAFv43kSYb0ilj1rNTPNysLrgl0Ew
         ra566Q3TuAg40TPAb36Qe170B0k/t5GRVy+CcLMp6B3O1JO3HpeRRYS4Gc1VokguWDyJ
         gOPA==
X-Gm-Message-State: AOAM530mkBvZhrDLnYWhsQIv5HUDEfBrGa9RLpr8zHn2hgl0Q23bktfi
        Y8pUU8KYO93AMAeYFkIuW9KC2ZF6o/L+bQ==
X-Google-Smtp-Source: ABdhPJxcc5NIw5cUPcVfm3qsB9Y6se2t+rhNB50sfqbd7sRCwep+JNifauSjZMjRPR7gcQGDi1kP7Q==
X-Received: by 2002:a05:6000:18aa:: with SMTP id b10mr381016wri.305.1640133364827;
        Tue, 21 Dec 2021 16:36:04 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:36:04 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 17/19] media: camss: Add SM8250 bandwdith configuration support
Date:   Wed, 22 Dec 2021 00:37:49 +0000
Message-Id: <20211222003751.2461466-18-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Downstream makes some pretty explicit comments about voting for bus
bandwidth prior to camcc_camnoc_axi_clk_src. Working with camx downstream
also shows that the bandwidth vote is required to get that root clock
working.

Add a simple mechanism to declare set and unset named NOCs. Whereas the
objective is to enable the sm8250 specifically the code has been
implemented to allow setting of whatever NOCs different SoCs using this
driver may require.

Tested-by: Julian Grahsl <jgrahsl@snap.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 81 +++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h | 17 +++++
 2 files changed, 98 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 066639db9f18b..d9905e737d88d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
 #include <linux/clk.h>
+#include <linux/interconnect.h>
 #include <linux/media-bus-format.h>
 #include <linux/media.h>
 #include <linux/module.h>
@@ -841,6 +842,29 @@ static const struct resources vfe_res_8250[] = {
 	},
 };
 
+static const struct resources_icc icc_res_sm8250[] = {
+	{
+		.name = "cam_ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "cam_hf_0_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "cam_sf_0_mnoc",
+		.icc_bw_tbl.avg = 0,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "cam_sf_icp_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -1470,6 +1494,29 @@ static int camss_configure_pd(struct camss *camss)
 	return ret;
 }
 
+static int camss_icc_get(struct camss *camss)
+{
+	const struct resources_icc *icc_res;
+	int nbr_icc_paths = 0;
+	int i;
+
+	if (camss->version == CAMSS_8250) {
+		icc_res = &icc_res_sm8250[0];
+		nbr_icc_paths =	ICC_SM8250_COUNT;
+	}
+
+	for (i = 0; i < nbr_icc_paths; i++) {
+		camss->icc_path[i] = devm_of_icc_get(camss->dev,
+						     icc_res[i].name);
+		if (IS_ERR(camss->icc_path[i]))
+			return PTR_ERR(camss->icc_path[i]);
+
+		camss->icc_bw_tbl[i] = icc_res[i].icc_bw_tbl;
+	}
+
+	return 0;
+}
+
 /*
  * camss_probe - Probe CAMSS platform device
  * @pdev: Pointer to CAMSS platform device
@@ -1562,6 +1609,10 @@ static int camss_probe(struct platform_device *pdev)
 		goto err_cleanup;
 	}
 
+	ret = camss_icc_get(camss);
+	if (ret < 0)
+		goto err_cleanup;
+
 	ret = camss_init_subdevices(camss);
 	if (ret < 0)
 		goto err_cleanup;
@@ -1695,11 +1746,41 @@ MODULE_DEVICE_TABLE(of, camss_dt_match);
 
 static int __maybe_unused camss_runtime_suspend(struct device *dev)
 {
+	struct camss *camss = dev_get_drvdata(dev);
+	int nbr_icc_paths = 0;
+	int i;
+	int ret;
+
+	if (camss->version == CAMSS_8250)
+		nbr_icc_paths =	ICC_SM8250_COUNT;
+
+	for (i = 0; i < nbr_icc_paths; i++) {
+		ret = icc_set_bw(camss->icc_path[i], 0, 0);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
 static int __maybe_unused camss_runtime_resume(struct device *dev)
 {
+	struct camss *camss = dev_get_drvdata(dev);
+	int nbr_icc_paths = 0;
+	int i;
+	int ret;
+
+	if (camss->version == CAMSS_8250)
+		nbr_icc_paths =	ICC_SM8250_COUNT;
+
+	for (i = 0; i < nbr_icc_paths; i++) {
+		ret = icc_set_bw(camss->icc_path[i],
+				 camss->icc_bw_tbl[i].avg,
+				 camss->icc_bw_tbl[i].peak);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 377e2474a485f..9c644e638a948 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -56,6 +56,16 @@ struct resources_ispif {
 	char *interrupt;
 };
 
+struct icc_bw_tbl {
+	u32 avg;
+	u32 peak;
+};
+
+struct resources_icc {
+	char *name;
+	struct icc_bw_tbl icc_bw_tbl;
+};
+
 enum pm_domain {
 	PM_DOMAIN_VFE0 = 0,
 	PM_DOMAIN_VFE1 = 1,
@@ -72,6 +82,11 @@ enum camss_version {
 	CAMSS_8250,
 };
 
+enum icc_count {
+	ICC_DEFAULT_COUNT = 0,
+	ICC_SM8250_COUNT = 4,
+};
+
 struct camss {
 	enum camss_version version;
 	struct v4l2_device v4l2_dev;
@@ -88,6 +103,8 @@ struct camss {
 	atomic_t ref_count;
 	struct device *genpd[PM_DOMAIN_GEN2_COUNT];
 	struct device_link *genpd_link[PM_DOMAIN_GEN2_COUNT];
+	struct icc_path *icc_path[ICC_SM8250_COUNT];
+	struct icc_bw_tbl icc_bw_tbl[ICC_SM8250_COUNT];
 };
 
 struct camss_camera_interface {
-- 
2.33.0

