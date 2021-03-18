Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26C9133FD0F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Mar 2021 03:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230085AbhCRCKq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 22:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbhCRCKZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 22:10:25 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F03C061760
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 19:10:25 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id k14-20020a9d7dce0000b02901b866632f29so3797050otn.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 19:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EmLn8rZvApz0CEK+2n4J5E4ndQ/u3PQvps0+HiUUndQ=;
        b=IYZu/iRExH+qF3oPFMBhjXkesfxGZvxUuCAsL59J7g0Ir/FM9XdTLKhYblHv8dBdoe
         5a5OVxK6C8kL+ONV5e2Ls3n0AW01o1Lt6zPiGMuxRVaysLJArU1/h9PDrSX8FhH7/3K/
         Ykdk36RJgeunBwPJqvVkm/k8gzdbRvWSeCT+lUDbpvWjSBY8aV2lDylV82D0ajr9muTc
         VtIjUAxJXSATYb/Fio9Mi5w9QmpeAPAVtgPijd0pNOE2Oy0qpIX7InsitPKnw9c1yOad
         KtsJ6Ta0rz3PPXXg7C5yzNl6xjIDbI6Ln3inhqUuS3DSPn27tx51fjRC7RzMhwAosqET
         HxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EmLn8rZvApz0CEK+2n4J5E4ndQ/u3PQvps0+HiUUndQ=;
        b=lyFVOXkrS8Z+kKeneqtmLtU+DYJdGPy+ddpcbTeamVTXyWO2qO0M4XcnLxQhPfYvrd
         qgIjowYaFJkAVUgY3GvEMOy1qk8ZM2/QoeEPvHn1Hsyi/liUfQqGW5KzGaMafQC/Vuyl
         H+M+WqTdvkzvlrXvR5Zi1TYPuScdFx+0tu4TZo9dXOhUhdXjZnvY4nL3rjLN+YspvHKj
         5h05azPCBA3rVEW+L3CISJlenL3Gj787sEMZykv7fwjVUGnWGmUnUxbr9tBLH5Fz7JSa
         9ciWGOCYB4Vf8GiIl6u6d35ZC9RZOnozgi2zzgJK3/6/AlR902ezw+6hS0hyA7kl2PU4
         lC2Q==
X-Gm-Message-State: AOAM530U6iyy6xtQ7wHQHq7FNdR+ss+ifbb/+WJ5XRcJbCHyhRleFG4r
        xHHI2itRz8DgHTilSFiVNYyuYw==
X-Google-Smtp-Source: ABdhPJzkvAJJcqb04nH9kaQaty1xkwr8wUcYvda48HhOce67br9qznOZwO56g6l8fKsOrih1uXtLgg==
X-Received: by 2002:a9d:2226:: with SMTP id o35mr5533438ota.242.1616033424518;
        Wed, 17 Mar 2021 19:10:24 -0700 (PDT)
Received: from blackbox.Home ([2806:10b7:2:e880:2c32:cfff:fe8e:de1f])
        by smtp.gmail.com with ESMTPSA id p64sm212511oib.57.2021.03.17.19.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 19:10:23 -0700 (PDT)
From:   =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, anibal.limon@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, loic.poulain@linaro.org,
        mathieu.poirier@linaro.org, ohad@wizery.com
Subject: [PATCH] remoteproc: qcom: wcnss: Fix race with iris probe
Date:   Wed, 17 Mar 2021 20:10:21 -0600
Message-Id: <20210318021021.1127314-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312002251.3273013-1-bjorn.andersson@linaro.org>
References: <20210312002251.3273013-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The remoteproc driver is split between the responsibilities of getting
the SoC-internal ARM core up and running and the external RF (aka
"Iris") part configured.

In order to satisfy the regulator framework's need of a struct device *
to look up supplies this was implemented as two different drivers, using
of_platform_populate() in the remoteproc part to probe the iris part.

Unfortunately it's possible that the iris part probe defers on yet not
available regulators and an attempt to start the remoteproc will have to
be rejected, until this has been resolved. But there's no useful
mechanism of knowing when this would be.

Instead replace the of_platform_populate() and the iris probe with a
function that rolls its own struct device, with the relevant of_node
associated that is enough to acquire regulators and clocks specified in
the DT node and that may propagate the EPROBE_DEFER back to the wcnss
device's probe.

Reported-by: Anibal Limon <anibal.limon@linaro.org>
Reported-by: Loic Poulain <loic.poulain@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Tested-by: Anibal Limon <anibal.limon@linaro.org>
---
 drivers/remoteproc/qcom_wcnss.c      |  52 ++++--------
 drivers/remoteproc/qcom_wcnss.h      |   4 +-
 drivers/remoteproc/qcom_wcnss_iris.c | 120 +++++++++++++++++----------
 3 files changed, 91 insertions(+), 85 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index 2a6a23cb14ca..dcf21f12fe7e 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -142,18 +142,6 @@ static const struct wcnss_data pronto_v2_data = {
 	.num_vregs = 1,
 };
 
-void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
-			    struct qcom_iris *iris,
-			    bool use_48mhz_xo)
-{
-	mutex_lock(&wcnss->iris_lock);
-
-	wcnss->iris = iris;
-	wcnss->use_48mhz_xo = use_48mhz_xo;
-
-	mutex_unlock(&wcnss->iris_lock);
-}
-
 static int wcnss_load(struct rproc *rproc, const struct firmware *fw)
 {
 	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
@@ -633,12 +621,20 @@ static int wcnss_probe(struct platform_device *pdev)
 		goto detach_pds;
 	}
 
+	wcnss->iris = qcom_iris_probe(&pdev->dev, &wcnss->use_48mhz_xo);
+	if (IS_ERR(wcnss->iris)) {
+		ret = PTR_ERR(wcnss->iris);
+		goto detach_pds;
+	}
+
 	ret = rproc_add(rproc);
 	if (ret)
-		goto detach_pds;
+		goto remove_iris;
 
-	return of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
+	return 0;
 
+remove_iris:
+	qcom_iris_remove(wcnss->iris);
 detach_pds:
 	wcnss_release_pds(wcnss);
 free_rproc:
@@ -651,9 +647,10 @@ static int wcnss_remove(struct platform_device *pdev)
 {
 	struct qcom_wcnss *wcnss = platform_get_drvdata(pdev);
 
-	of_platform_depopulate(&pdev->dev);
+	qcom_iris_remove(wcnss->iris);
 
-	qcom_smem_state_put(wcnss->state);
+	if (wcnss->state)
+		qcom_smem_state_put(wcnss->state);
 	rproc_del(wcnss->rproc);
 
 	qcom_remove_sysmon_subdev(wcnss->sysmon);
@@ -681,28 +678,7 @@ static struct platform_driver wcnss_driver = {
 	},
 };
 
-static int __init wcnss_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&wcnss_driver);
-	if (ret)
-		return ret;
-
-	ret = platform_driver_register(&qcom_iris_driver);
-	if (ret)
-		platform_driver_unregister(&wcnss_driver);
-
-	return ret;
-}
-module_init(wcnss_init);
-
-static void __exit wcnss_exit(void)
-{
-	platform_driver_unregister(&qcom_iris_driver);
-	platform_driver_unregister(&wcnss_driver);
-}
-module_exit(wcnss_exit);
+module_platform_driver(wcnss_driver);
 
 MODULE_DESCRIPTION("Qualcomm Peripheral Image Loader for Wireless Subsystem");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/remoteproc/qcom_wcnss.h b/drivers/remoteproc/qcom_wcnss.h
index 62c8682d0a92..6d01ee6afa7f 100644
--- a/drivers/remoteproc/qcom_wcnss.h
+++ b/drivers/remoteproc/qcom_wcnss.h
@@ -17,9 +17,9 @@ struct wcnss_vreg_info {
 	bool super_turbo;
 };
 
+struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo);
+void qcom_iris_remove(struct qcom_iris *iris);
 int qcom_iris_enable(struct qcom_iris *iris);
 void qcom_iris_disable(struct qcom_iris *iris);
 
-void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss, struct qcom_iris *iris, bool use_48mhz_xo);
-
 #endif
diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index 169acd305ae3..09720ddddc85 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -17,7 +17,7 @@
 #include "qcom_wcnss.h"
 
 struct qcom_iris {
-	struct device *dev;
+	struct device dev;
 
 	struct clk *xo_clk;
 
@@ -75,7 +75,7 @@ int qcom_iris_enable(struct qcom_iris *iris)
 
 	ret = clk_prepare_enable(iris->xo_clk);
 	if (ret) {
-		dev_err(iris->dev, "failed to enable xo clk\n");
+		dev_err(&iris->dev, "failed to enable xo clk\n");
 		goto disable_regulators;
 	}
 
@@ -93,43 +93,90 @@ void qcom_iris_disable(struct qcom_iris *iris)
 	regulator_bulk_disable(iris->num_vregs, iris->vregs);
 }
 
-static int qcom_iris_probe(struct platform_device *pdev)
+static const struct of_device_id iris_of_match[] = {
+	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
+	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
+	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
+	{ .compatible = "qcom,wcn3680", .data = &wcn3680_data },
+	{}
+};
+
+static void qcom_iris_release(struct device *dev)
+{
+	struct qcom_iris *iris = container_of(dev, struct qcom_iris, dev);
+
+	of_node_put(iris->dev.of_node);
+	kfree(iris);
+}
+
+struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 {
+	const struct of_device_id *match;
 	const struct iris_data *data;
-	struct qcom_wcnss *wcnss;
+	struct device_node *of_node;
 	struct qcom_iris *iris;
 	int ret;
 	int i;
 
-	iris = devm_kzalloc(&pdev->dev, sizeof(struct qcom_iris), GFP_KERNEL);
-	if (!iris)
-		return -ENOMEM;
+	of_node = of_get_child_by_name(parent->of_node, "iris");
+	if (!of_node) {
+		dev_err(parent, "No child node \"iris\" found\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	iris = kzalloc(sizeof(*iris), GFP_KERNEL);
+	if (!iris) {
+		of_node_put(of_node);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	device_initialize(&iris->dev);
+	iris->dev.parent = parent;
+	iris->dev.release = qcom_iris_release;
+	iris->dev.of_node = of_node;
+
+	dev_set_name(&iris->dev, "%s.iris", dev_name(parent));
+
+	ret = device_add(&iris->dev);
+	if (ret) {
+		put_device(&iris->dev);
+		return ERR_PTR(ret);
+	}
+
+	match = of_match_device(iris_of_match, &iris->dev);
+	if (!match) {
+		dev_err(&iris->dev, "no matching compatible for iris\n");
+		ret = -EINVAL;
+		goto err_device_del;
+	}
 
-	data = of_device_get_match_data(&pdev->dev);
-	wcnss = dev_get_drvdata(pdev->dev.parent);
+	data = match->data;
 
-	iris->xo_clk = devm_clk_get(&pdev->dev, "xo");
+	iris->xo_clk = devm_clk_get(&iris->dev, "xo");
 	if (IS_ERR(iris->xo_clk)) {
-		if (PTR_ERR(iris->xo_clk) != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "failed to acquire xo clk\n");
-		return PTR_ERR(iris->xo_clk);
+		ret = PTR_ERR(iris->xo_clk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&iris->dev, "failed to acquire xo clk\n");
+		goto err_device_del;
 	}
 
 	iris->num_vregs = data->num_vregs;
-	iris->vregs = devm_kcalloc(&pdev->dev,
+	iris->vregs = devm_kcalloc(&iris->dev,
 				   iris->num_vregs,
 				   sizeof(struct regulator_bulk_data),
 				   GFP_KERNEL);
-	if (!iris->vregs)
-		return -ENOMEM;
+	if (!iris->vregs) {
+		ret = -ENOMEM;
+		goto err_device_del;
+	}
 
 	for (i = 0; i < iris->num_vregs; i++)
 		iris->vregs[i].supply = data->vregs[i].name;
 
-	ret = devm_regulator_bulk_get(&pdev->dev, iris->num_vregs, iris->vregs);
+	ret = devm_regulator_bulk_get(&iris->dev, iris->num_vregs, iris->vregs);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to get regulators\n");
-		return ret;
+		dev_err(&iris->dev, "failed to get regulators\n");
+		goto err_device_del;
 	}
 
 	for (i = 0; i < iris->num_vregs; i++) {
@@ -143,34 +190,17 @@ static int qcom_iris_probe(struct platform_device *pdev)
 					   data->vregs[i].load_uA);
 	}
 
-	qcom_wcnss_assign_iris(wcnss, iris, data->use_48mhz_xo);
-
-	return 0;
-}
+	*use_48mhz_xo = data->use_48mhz_xo;
 
-static int qcom_iris_remove(struct platform_device *pdev)
-{
-	struct qcom_wcnss *wcnss = dev_get_drvdata(pdev->dev.parent);
+	return iris;
 
-	qcom_wcnss_assign_iris(wcnss, NULL, false);
+err_device_del:
+	device_del(&iris->dev);
 
-	return 0;
+	return ERR_PTR(ret);
 }
 
-static const struct of_device_id iris_of_match[] = {
-	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
-	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
-	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
-	{ .compatible = "qcom,wcn3680", .data = &wcn3680_data },
-	{}
-};
-MODULE_DEVICE_TABLE(of, iris_of_match);
-
-struct platform_driver qcom_iris_driver = {
-	.probe = qcom_iris_probe,
-	.remove = qcom_iris_remove,
-	.driver = {
-		.name = "qcom-iris",
-		.of_match_table = iris_of_match,
-	},
-};
+void qcom_iris_remove(struct qcom_iris *iris)
+{
+	device_del(&iris->dev);
+}
-- 
2.30.1

