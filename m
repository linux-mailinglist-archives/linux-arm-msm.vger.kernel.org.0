Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23CB27B6D1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Oct 2023 17:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237132AbjJCP3j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 11:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232156AbjJCP3i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 11:29:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E5BAB;
        Tue,  3 Oct 2023 08:29:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7FAC433CB;
        Tue,  3 Oct 2023 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696346975;
        bh=w6oW3CA5lhvBRe2ooxRAdYwa2HiP0AiSXwLhfx4hsQ4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u/bqTduxmjG7fM8rnm8Fuso35m9V9ijdiz/GM66mSY81rVf16I8i2ceQn4yr41eKh
         hu5DQUBbpwSsvpG9fKoOBsXtgBcGTxIb4zDnOGGbdDDhAIpde18qyutjeClG78vm4X
         3H7Pp3vrDinug7UMjQ4eazdvqczupeszGb+RtBDUtYgymoNchYMOkuEBN6Z8ZJ5nrX
         TBvyJJ8mZskREjk66lsGFGU1CJmn4FmhLvpZ+Bs6QmI05AzvnPswdEbpmcN/I7CPyB
         AIZtygRliI0v9KWrzXpagYIDHCcJrdSZtLPU1RWcIbgOlQfcZZm2ICUCL+QEbWzdVY
         SmhZUixDbKppw==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan+linaro@kernel.org>)
        id 1qnhLF-0003uN-2a;
        Tue, 03 Oct 2023 17:29:45 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Lee Jones <lee@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Caleb Connolly <caleb.connolly@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 2/5] mfd: qcom-spmi-pmic: fix revid implementation
Date:   Tue,  3 Oct 2023 17:29:24 +0200
Message-ID: <20231003152927.15000-3-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003152927.15000-1-johan+linaro@kernel.org>
References: <20231003152927.15000-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm SPMI PMIC revid implementation is broken in multiple ways.

First, it assumes that just because the sibling base device has been
registered that means that it is also bound to a driver, which may not
be the case (e.g. due to probe deferral or asynchronous probe). This
could trigger a NULL-pointer dereference when attempting to access the
driver data of the unbound device.

Second, it accesses driver data of a sibling device directly and without
any locking, which means that the driver data may be freed while it is
being accessed (e.g. on driver unbind).

Third, it leaks a struct device reference to the sibling device which is
looked up using the spmi_device_from_of() every time a function (child)
device is calling the revid function (e.g. on probe).

Fix this mess by reimplementing the revid lookup so that it is done only
at probe of the PMIC device; the base device fetches the revid info from
the hardware, while any secondary SPMI device fetches the information
from the base device and caches it so that it can be accessed safely
from its children. If the base device has not been probed yet then probe
of a secondary device is deferred.

Fixes: e9c11c6e3a0e ("mfd: qcom-spmi-pmic: expose the PMIC revid information to clients")
Cc: stable@vger.kernel.org      # 6.0
Cc: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mfd/qcom-spmi-pmic.c | 69 +++++++++++++++++++++++++++---------
 1 file changed, 53 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/qcom-spmi-pmic.c b/drivers/mfd/qcom-spmi-pmic.c
index 47738f7e492c..8e449cff5cec 100644
--- a/drivers/mfd/qcom-spmi-pmic.c
+++ b/drivers/mfd/qcom-spmi-pmic.c
@@ -30,6 +30,8 @@ struct qcom_spmi_dev {
 	struct qcom_spmi_pmic pmic;
 };
 
+static DEFINE_MUTEX(pmic_spmi_revid_lock);
+
 #define N_USIDS(n)		((void *)n)
 
 static const struct of_device_id pmic_spmi_id_table[] = {
@@ -76,24 +78,21 @@ static const struct of_device_id pmic_spmi_id_table[] = {
  *
  * This only supports PMICs with 1 or 2 USIDs.
  */
-static struct spmi_device *qcom_pmic_get_base_usid(struct device *dev)
+static struct spmi_device *qcom_pmic_get_base_usid(struct spmi_device *sdev, struct qcom_spmi_dev *ctx)
 {
-	struct spmi_device *sdev;
-	struct qcom_spmi_dev *ctx;
 	struct device_node *spmi_bus;
 	struct device_node *child;
 	int function_parent_usid, ret;
 	u32 pmic_addr;
 
-	sdev = to_spmi_device(dev);
-	ctx = dev_get_drvdata(&sdev->dev);
-
 	/*
 	 * Quick return if the function device is already in the base
 	 * USID. This will always be hit for PMICs with only 1 USID.
 	 */
-	if (sdev->usid % ctx->num_usids == 0)
+	if (sdev->usid % ctx->num_usids == 0) {
+		get_device(&sdev->dev);
 		return sdev;
+	}
 
 	function_parent_usid = sdev->usid;
 
@@ -118,10 +117,8 @@ static struct spmi_device *qcom_pmic_get_base_usid(struct device *dev)
 			sdev = spmi_device_from_of(child);
 			if (!sdev) {
 				/*
-				 * If the base USID for this PMIC hasn't probed yet
-				 * but the secondary USID has, then we need to defer
-				 * the function driver so that it will attempt to
-				 * probe again when the base USID is ready.
+				 * If the base USID for this PMIC hasn't been
+				 * registered yet then we need to defer.
 				 */
 				sdev = ERR_PTR(-EPROBE_DEFER);
 			}
@@ -135,6 +132,35 @@ static struct spmi_device *qcom_pmic_get_base_usid(struct device *dev)
 	return sdev;
 }
 
+static int pmic_spmi_get_base_revid(struct spmi_device *sdev, struct qcom_spmi_dev *ctx)
+{
+	struct qcom_spmi_dev *base_ctx;
+	struct spmi_device *base;
+	int ret = 0;
+
+	base = qcom_pmic_get_base_usid(sdev, ctx);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	/*
+	 * Copy revid info from base device if it has probed and is still
+	 * bound to its driver.
+	 */
+	mutex_lock(&pmic_spmi_revid_lock);
+	base_ctx = spmi_device_get_drvdata(base);
+	if (!base_ctx) {
+		ret = -EPROBE_DEFER;
+		goto out_unlock;
+	}
+	memcpy(&ctx->pmic, &base_ctx->pmic, sizeof(ctx->pmic));
+out_unlock:
+	mutex_unlock(&pmic_spmi_revid_lock);
+
+	put_device(&base->dev);
+
+	return ret;
+}
+
 static int pmic_spmi_load_revid(struct regmap *map, struct device *dev,
 				 struct qcom_spmi_pmic *pmic)
 {
@@ -210,11 +236,7 @@ const struct qcom_spmi_pmic *qcom_pmic_get(struct device *dev)
 	if (!of_match_device(pmic_spmi_id_table, dev->parent))
 		return ERR_PTR(-EINVAL);
 
-	sdev = qcom_pmic_get_base_usid(dev->parent);
-
-	if (IS_ERR(sdev))
-		return ERR_CAST(sdev);
-
+	sdev = to_spmi_device(dev->parent);
 	spmi = dev_get_drvdata(&sdev->dev);
 
 	return &spmi->pmic;
@@ -249,16 +271,31 @@ static int pmic_spmi_probe(struct spmi_device *sdev)
 		ret = pmic_spmi_load_revid(regmap, &sdev->dev, &ctx->pmic);
 		if (ret < 0)
 			return ret;
+	} else {
+		ret = pmic_spmi_get_base_revid(sdev, ctx);
+		if (ret)
+			return ret;
 	}
+
+	mutex_lock(&pmic_spmi_revid_lock);
 	spmi_device_set_drvdata(sdev, ctx);
+	mutex_unlock(&pmic_spmi_revid_lock);
 
 	return devm_of_platform_populate(&sdev->dev);
 }
 
+static void pmic_spmi_remove(struct spmi_device *sdev)
+{
+	mutex_lock(&pmic_spmi_revid_lock);
+	spmi_device_set_drvdata(sdev, NULL);
+	mutex_unlock(&pmic_spmi_revid_lock);
+}
+
 MODULE_DEVICE_TABLE(of, pmic_spmi_id_table);
 
 static struct spmi_driver pmic_spmi_driver = {
 	.probe = pmic_spmi_probe,
+	.remove = pmic_spmi_remove,
 	.driver = {
 		.name = "pmic-spmi",
 		.of_match_table = pmic_spmi_id_table,
-- 
2.41.0

