Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54FD61F6498
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 11:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbgFKJUB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 05:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726987AbgFKJTY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 05:19:24 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4B5BC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:24 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 10so2414941pfx.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 02:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q1B6aWYD0uAf4gPuxXGlnst1FuczISvlZRRUpYuaBKQ=;
        b=RjwQt835eMam4f/R4dczq92wYgwkdv+pkslRD65ey1Mx6A0kgoLO8QTh7RaJZacmhU
         bp7OfY9Hh77aojmDyAUG/zIcV2TyD44ZUsktCNu3OwJGESPPCrFVwXnaAfGZYfCb+7qe
         OoFnzWfVNa7sMNeGtO56p+CsiiQYxFYeaiOMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q1B6aWYD0uAf4gPuxXGlnst1FuczISvlZRRUpYuaBKQ=;
        b=LAjQ/r/K3hjAoAZ7atF6YkuAsmriGclygyU8w159WAodfYZUPtuXjhLQApAIi0Dq7e
         k8AZe9mZoWc247zQA9miILPQbZWv8STlzI0bYMxqZKamENTwaiwvA4Octgw/uZAZ3MOx
         88Ez85G3Tz74L7+IeLlzPHu5NZUHS1cEWiTq+dz1X+v37/cfKQUpCOVvStuxMV/TA4S3
         fowpSnCXE6IA9EjlNTtw5o21CTfkyNqGZMuZCwJgdi5iabHTTsZu4HT6L+0PyFtR3PW+
         r4DQ8+v5u8+FA6K5C6o3QMfdlXbGmpldyTke/sSlX2i8IyFLRDoOEkdWzrfA4NNpDRSY
         iLSQ==
X-Gm-Message-State: AOAM530d6Xcdd9ltjIftP+rz8YGhNLUrumTFNrdcErRsOxoJR8D+E8nY
        9YMm/HxlBJx7mCrALOhvIPoFPw==
X-Google-Smtp-Source: ABdhPJysG0RqU9FUt0ELS9ApjNWfnlieuvncgKb/UpBWM9e0Pzrk+v2QYUI5kT60Qk++n+U53sYxJQ==
X-Received: by 2002:a65:6916:: with SMTP id s22mr1677760pgq.128.1591867164159;
        Thu, 11 Jun 2020 02:19:24 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 1sm2367852pfx.210.2020.06.11.02.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 02:19:23 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>
Subject: [PATCH/RFC 3/8] phy: qcom-qmp: Move 'serdes' and 'cfg' into 'struct qcom_phy'
Date:   Thu, 11 Jun 2020 02:19:14 -0700
Message-Id: <20200611091919.108018-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
In-Reply-To: <20200611091919.108018-1-swboyd@chromium.org>
References: <20200611091919.108018-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The serdes I/O region is where the PLL for the phy is controlled.
Sometimes the PLL is shared between multiple phys, for example in the
PCIe case where there are three phys inside the same wrapper. Other
times the PLL is for a single phy, i.e. some USB3 phys. To complete the
trifecta we have the USB3+DP combo phy where the USB3 and DP phys each
have their own serdes region because they have their own PLL while they
both share a common I/O region pertaining to the USB type-c pinout and
cable orientation.

Let's move the serdes iomem pointer into 'struct qmp_phy' so that we can
correlate PLL control to the phy that uses it. This allows us to support
the USB3+DP combo phy in this driver. This isn't a problem for the
3-lane/phy PCIe phy because there is a common init function that is the
only place the serdes region is programmed.

Furthermore, move the configuration data that contains most of the
register programming sequences to the qmp phy struct. This data isn't
qmp wrapper specific. It is phy specific data used to tune various
settings for things like pre-emphasis, bias, etc.

Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Chandan Uddaraju <chandanu@codeaurora.org>
Cc: Vara Reddy <varar@codeaurora.org>
Cc: Tanmay Shah <tanmay@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Manu Gautam <mgautam@codeaurora.org>
Cc: Sandeep Maheswaram <sanm@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 113 ++++++++++++++--------------
 1 file changed, 56 insertions(+), 57 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index f3f0cab99ed0..dace2f497c85 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -1340,6 +1340,8 @@ struct qmp_phy_cfg {
  * struct qmp_phy - per-lane phy descriptor
  *
  * @phy: generic phy
+ * @cfg: phy specific configuration
+ * @serdes: iomapped memory space for phy's serdes (i.e. PLL)
  * @tx: iomapped memory space for lane's tx
  * @rx: iomapped memory space for lane's rx
  * @pcs: iomapped memory space for lane's pcs
@@ -1354,6 +1356,8 @@ struct qmp_phy_cfg {
  */
 struct qmp_phy {
 	struct phy *phy;
+	const struct qmp_phy_cfg *cfg;
+	void __iomem *serdes;
 	void __iomem *tx;
 	void __iomem *rx;
 	void __iomem *pcs;
@@ -1371,14 +1375,12 @@ struct qmp_phy {
  * struct qcom_qmp - structure holding QMP phy block attributes
  *
  * @dev: device
- * @serdes: iomapped memory space for phy's serdes
  * @dp_com: iomapped memory space for phy's dp_com control block
  *
  * @clks: array of clocks required by phy
  * @resets: array of resets required by phy
  * @vregs: regulator supplies bulk data
  *
- * @cfg: phy specific configuration
  * @phys: array of per-lane phy descriptors
  * @phy_mutex: mutex lock for PHY common block initialization
  * @init_count: phy common block initialization count
@@ -1386,14 +1388,12 @@ struct qmp_phy {
  */
 struct qcom_qmp {
 	struct device *dev;
-	void __iomem *serdes;
 	void __iomem *dp_com;
 
 	struct clk_bulk_data *clks;
 	struct reset_control **resets;
 	struct regulator_bulk_data *vregs;
 
-	const struct qmp_phy_cfg *cfg;
 	struct qmp_phy **phys;
 
 	struct mutex phy_mutex;
@@ -1853,8 +1853,8 @@ static void qcom_qmp_phy_configure(void __iomem *base,
 static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 {
 	struct qcom_qmp *qmp = qphy->qmp;
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *serdes = qmp->serdes;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	void __iomem *serdes = qphy->serdes;
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *dp_com = qmp->dp_com;
 	int ret, i;
@@ -1885,7 +1885,7 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 		ret = reset_control_deassert(qmp->resets[i]);
 		if (ret) {
 			dev_err(qmp->dev, "%s reset deassert failed\n",
-				qmp->cfg->reset_list[i]);
+				qphy->cfg->reset_list[i]);
 			goto err_rst;
 		}
 	}
@@ -1960,10 +1960,11 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
 	return ret;
 }
 
-static int qcom_qmp_phy_com_exit(struct qcom_qmp *qmp)
+static int qcom_qmp_phy_com_exit(struct qmp_phy *qphy)
 {
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	void __iomem *serdes = qmp->serdes;
+	struct qcom_qmp *qmp = qphy->qmp;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
+	void __iomem *serdes = qphy->serdes;
 	int i = cfg->num_resets;
 
 	mutex_lock(&qmp->phy_mutex);
@@ -1998,7 +1999,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
 	struct qcom_qmp *qmp = qphy->qmp;
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *tx = qphy->tx;
 	void __iomem *rx = qphy->rx;
 	void __iomem *pcs = qphy->pcs;
@@ -2121,7 +2122,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
 err_lane_rst:
-	qcom_qmp_phy_com_exit(qmp);
+	qcom_qmp_phy_com_exit(qphy);
 
 	return ret;
 }
@@ -2129,8 +2130,7 @@ static int qcom_qmp_phy_enable(struct phy *phy)
 static int qcom_qmp_phy_disable(struct phy *phy)
 {
 	struct qmp_phy *qphy = phy_get_drvdata(phy);
-	struct qcom_qmp *qmp = qphy->qmp;
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
 	clk_disable_unprepare(qphy->pipe_clk);
 
@@ -2147,7 +2147,7 @@ static int qcom_qmp_phy_disable(struct phy *phy)
 	if (cfg->has_lane_rst)
 		reset_control_assert(qphy->lane_rst);
 
-	qcom_qmp_phy_com_exit(qmp);
+	qcom_qmp_phy_com_exit(qphy);
 
 	return 0;
 }
@@ -2164,8 +2164,7 @@ static int qcom_qmp_phy_set_mode(struct phy *phy,
 
 static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
 {
-	struct qcom_qmp *qmp = qphy->qmp;
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *pcs_misc = qphy->pcs_misc;
 	u32 intr_mask;
@@ -2194,8 +2193,7 @@ static void qcom_qmp_phy_enable_autonomous_mode(struct qmp_phy *qphy)
 
 static void qcom_qmp_phy_disable_autonomous_mode(struct qmp_phy *qphy)
 {
-	struct qcom_qmp *qmp = qphy->qmp;
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	void __iomem *pcs = qphy->pcs;
 	void __iomem *pcs_misc = qphy->pcs_misc;
 
@@ -2215,7 +2213,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_suspend(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qphy->mode);
 
@@ -2240,7 +2238,7 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct qmp_phy *qphy = qmp->phys[0];
-	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_cfg *cfg = qphy->cfg;
 	int ret = 0;
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qphy->mode);
@@ -2272,10 +2270,10 @@ static int __maybe_unused qcom_qmp_phy_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int qcom_qmp_phy_vreg_init(struct device *dev)
+static int qcom_qmp_phy_vreg_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
-	int num = qmp->cfg->num_vregs;
+	int num = cfg->num_vregs;
 	int i;
 
 	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
@@ -2283,24 +2281,24 @@ static int qcom_qmp_phy_vreg_init(struct device *dev)
 		return -ENOMEM;
 
 	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = qmp->cfg->vreg_list[i];
+		qmp->vregs[i].supply = cfg->vreg_list[i];
 
 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
 
-static int qcom_qmp_phy_reset_init(struct device *dev)
+static int qcom_qmp_phy_reset_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	int i;
 
-	qmp->resets = devm_kcalloc(dev, qmp->cfg->num_resets,
+	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
 				   sizeof(*qmp->resets), GFP_KERNEL);
 	if (!qmp->resets)
 		return -ENOMEM;
 
-	for (i = 0; i < qmp->cfg->num_resets; i++) {
+	for (i = 0; i < cfg->num_resets; i++) {
 		struct reset_control *rst;
-		const char *name = qmp->cfg->reset_list[i];
+		const char *name = cfg->reset_list[i];
 
 		rst = devm_reset_control_get(dev, name);
 		if (IS_ERR(rst)) {
@@ -2313,10 +2311,10 @@ static int qcom_qmp_phy_reset_init(struct device *dev)
 	return 0;
 }
 
-static int qcom_qmp_phy_clk_init(struct device *dev)
+static int qcom_qmp_phy_clk_init(struct device *dev, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
-	int num = qmp->cfg->num_clks;
+	int num = cfg->num_clks;
 	int i;
 
 	qmp->clks = devm_kcalloc(dev, num, sizeof(*qmp->clks), GFP_KERNEL);
@@ -2324,7 +2322,7 @@ static int qcom_qmp_phy_clk_init(struct device *dev)
 		return -ENOMEM;
 
 	for (i = 0; i < num; i++)
-		qmp->clks[i].id = qmp->cfg->clk_list[i];
+		qmp->clks[i].id = cfg->clk_list[i];
 
 	return devm_clk_bulk_get(dev, num, qmp->clks);
 }
@@ -2358,12 +2356,6 @@ static int phy_pipe_clk_register(struct qcom_qmp *qmp, struct device_node *np)
 	struct clk_init_data init = { };
 	int ret;
 
-	if ((qmp->cfg->type != PHY_TYPE_USB3) &&
-	    (qmp->cfg->type != PHY_TYPE_PCIE)) {
-		/* not all phys register pipe clocks, so return success */
-		return 0;
-	}
-
 	ret = of_property_read_string(np, "clock-output-names", &init.name);
 	if (ret) {
 		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
@@ -2414,7 +2406,8 @@ static const struct phy_ops qcom_qmp_pcie_ufs_ops = {
 };
 
 static
-int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
+int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id,
+			void __iomem *serdes, const struct qmp_phy_cfg *cfg)
 {
 	struct qcom_qmp *qmp = dev_get_drvdata(dev);
 	struct phy *generic_phy;
@@ -2427,6 +2420,8 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 	if (!qphy)
 		return -ENOMEM;
 
+	qphy->cfg = cfg;
+	qphy->serdes = serdes;
 	/*
 	 * Get memory resources for each phy lane:
 	 * Resources are indexed as: tx -> 0; rx -> 1; pcs -> 2.
@@ -2451,7 +2446,7 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 	 * back to old legacy behavior of assuming they can be reached at an
 	 * offset from the first lane.
 	 */
-	if (qmp->cfg->is_dual_lane_phy) {
+	if (cfg->is_dual_lane_phy) {
 		qphy->tx2 = of_iomap(np, 3);
 		qphy->rx2 = of_iomap(np, 4);
 		if (!qphy->tx2 || !qphy->rx2) {
@@ -2484,8 +2479,8 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 	snprintf(prop_name, sizeof(prop_name), "pipe%d", id);
 	qphy->pipe_clk = of_clk_get_by_name(np, prop_name);
 	if (IS_ERR(qphy->pipe_clk)) {
-		if (qmp->cfg->type == PHY_TYPE_PCIE ||
-		    qmp->cfg->type == PHY_TYPE_USB3) {
+		if (cfg->type == PHY_TYPE_PCIE ||
+		    cfg->type == PHY_TYPE_USB3) {
 			ret = PTR_ERR(qphy->pipe_clk);
 			if (ret != -EPROBE_DEFER)
 				dev_err(dev,
@@ -2497,7 +2492,7 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 	}
 
 	/* Get lane reset, if any */
-	if (qmp->cfg->has_lane_rst) {
+	if (cfg->has_lane_rst) {
 		snprintf(prop_name, sizeof(prop_name), "lane%d", id);
 		qphy->lane_rst = of_reset_control_get(np, prop_name);
 		if (IS_ERR(qphy->lane_rst)) {
@@ -2506,7 +2501,7 @@ int qcom_qmp_phy_create(struct device *dev, struct device_node *np, int id)
 		}
 	}
 
-	if (qmp->cfg->type == PHY_TYPE_UFS || qmp->cfg->type == PHY_TYPE_PCIE)
+	if (cfg->type == PHY_TYPE_UFS || cfg->type == PHY_TYPE_PCIE)
 		ops = &qcom_qmp_pcie_ufs_ops;
 
 	generic_phy = devm_phy_create(dev, np, ops);
@@ -2586,6 +2581,8 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	struct device_node *child;
 	struct phy_provider *phy_provider;
 	void __iomem *base;
+	void __iomem *serdes;
+	const struct qmp_phy_cfg *cfg;
 	int num, id;
 	int ret;
 
@@ -2597,8 +2594,8 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, qmp);
 
 	/* Get the specific init parameters of QMP phy */
-	qmp->cfg = of_device_get_match_data(dev);
-	if (!qmp->cfg)
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
 		return -EINVAL;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
@@ -2607,10 +2604,10 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	/* per PHY serdes; usually located at base address */
-	qmp->serdes = base;
+	serdes = base;
 
 	/* per PHY dp_com; if PHY has dp_com control block */
-	if (qmp->cfg->has_phy_dp_com_ctrl) {
+	if (cfg->has_phy_dp_com_ctrl) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
 						   "dp_com");
 		base = devm_ioremap_resource(dev, res);
@@ -2622,15 +2619,15 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qcom_qmp_phy_clk_init(dev);
+	ret = qcom_qmp_phy_clk_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_reset_init(dev);
+	ret = qcom_qmp_phy_reset_init(dev, cfg);
 	if (ret)
 		return ret;
 
-	ret = qcom_qmp_phy_vreg_init(dev);
+	ret = qcom_qmp_phy_vreg_init(dev, cfg);
 	if (ret) {
 		if (ret != -EPROBE_DEFER)
 			dev_err(dev, "failed to get regulator supplies: %d\n",
@@ -2640,7 +2637,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	num = of_get_available_child_count(dev->of_node);
 	/* do we have a rogue child node ? */
-	if (num > qmp->cfg->nlanes)
+	if (num > cfg->nlanes)
 		return -EINVAL;
 
 	qmp->phys = devm_kcalloc(dev, num, sizeof(*qmp->phys), GFP_KERNEL);
@@ -2658,7 +2655,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 
 	for_each_available_child_of_node(dev->of_node, child) {
 		/* Create per-lane phy */
-		ret = qcom_qmp_phy_create(dev, child, id);
+		ret = qcom_qmp_phy_create(dev, child, id, serdes, cfg);
 		if (ret) {
 			dev_err(dev, "failed to create lane%d phy, %d\n",
 				id, ret);
@@ -2669,11 +2666,13 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 		 * Register the pipe clock provided by phy.
 		 * See function description to see details of this pipe clock.
 		 */
-		ret = phy_pipe_clk_register(qmp, child);
-		if (ret) {
-			dev_err(qmp->dev,
-				"failed to register pipe clock source\n");
-			goto err_node_put;
+		if (cfg->type == PHY_TYPE_USB3 || cfg->type == PHY_TYPE_PCIE) {
+			ret = phy_pipe_clk_register(qmp, child);
+			if (ret) {
+				dev_err(qmp->dev,
+					"failed to register pipe clock source\n");
+				goto err_node_put;
+			}
 		}
 		id++;
 	}
-- 
Sent by a computer, using git, on the internet

