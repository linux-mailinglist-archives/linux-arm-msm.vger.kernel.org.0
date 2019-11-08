Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1228EF4D77
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 14:45:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfKHNpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 08:45:41 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:11767 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726845AbfKHNpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 08:45:40 -0500
X-Greylist: delayed 368 seconds by postgrey-1.27 at vger.kernel.org; Fri, 08 Nov 2019 08:45:33 EST
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Nov 2019 19:09:24 +0530
IronPort-SDR: RgwYrp2mYwoDXAZqYha4ck48LGBlD42tHUGpVpSOYN8V1EyDCB0F0o+CtrnRTM0J1sDtb9bhrZ
 TNJCEak7fXdor2gXgLdj9YBOx9FkwRgxWJus5WTiyIrfIchcNdOqU/EtUfx471sZ6aMMxah8ZP
 jMYDcd1ULTbo8mNo0g/gK815VuZSjpj2r7cPxKrXbYLkv8h/DTvUsqXKio5WKTrhcuPGaUsk45
 DGDGN75WwZ9np1DXzoY5iLQDBw73VV1e3zI6JM9qCkxXhcEC8hmqFDa0/oDRByZugznu6GsBcp
 vWDR2ww7KF8L+5PNLdtKzsQn
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Nov 2019 19:09:03 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 644BE4949; Fri,  8 Nov 2019 19:09:02 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     adrian.hunter@intel.com, georgi.djakov@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, vbadigan@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, sboyd@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Pradeep P V K <ppvk@codeaurora.org>,
        Subhash Jadavani <subhashj@codeaurora.org>
Subject: [RFC-v2 2/2] mmc: sdhci-msm: Add support for bus bandwidth voting
Date:   Fri,  8 Nov 2019 19:08:39 +0530
Message-Id: <1573220319-4287-3-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
References: <1573220319-4287-1-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Vote for the MSM bus bandwidth required by SDHC driver
based on the clock frequency and bus width of the card.
Otherwise,the system clocks may run at minimum clock speed
and thus affecting the performance.

This change is based on Georgi Djakov [RFC]
(https://lkml.org/lkml/2018/10/11/499)

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Co-Developed-by: Pradeep P V K <ppvk@codeaurora.org>
Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 366 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 363 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b75c82d..a12e0c6 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -11,6 +11,7 @@
 #include <linux/mmc/mmc.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/interconnect.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
 
@@ -228,6 +229,31 @@ struct sdhci_msm_variant_info {
 	const struct sdhci_msm_offset *offset;
 };
 
+struct msm_bus_vectors {
+	u64 ab;
+	u64 ib;
+};
+
+struct msm_bus_path {
+	unsigned int num_paths;
+	struct msm_bus_vectors *vec;
+};
+
+struct sdhci_msm_bus_vote_data {
+	const char *name;
+	unsigned int num_usecase;
+	struct msm_bus_path *usecase;
+
+	unsigned int *bw_vecs;
+	unsigned int bw_vecs_size;
+
+	struct icc_path *sdhc_ddr;
+	struct icc_path *cpu_sdhc;
+
+	u32 curr_vote;
+
+};
+
 struct sdhci_msm_host {
 	struct platform_device *pdev;
 	void __iomem *core_mem;	/* MSM SDCC mapped address */
@@ -253,8 +279,13 @@ struct sdhci_msm_host {
 	const struct sdhci_msm_offset *offset;
 	bool use_cdr;
 	u32 transfer_mode;
+	bool skip_bus_bw_voting;
+	struct sdhci_msm_bus_vote_data *bus_vote_data;
+	struct delayed_work bus_vote_work;
 };
 
+static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable);
+
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1557,6 +1588,8 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 
 	msm_set_clock_rate_for_bus_mode(host, clock);
 out:
+	if (!msm_host->skip_bus_bw_voting)
+		sdhci_msm_bus_voting(host, !!clock);
 	__sdhci_msm_set_clock(host, clock);
 }
 
@@ -1678,6 +1711,315 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
 	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
 }
 
+static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
+				 u32 **bw_vecs, int *len, u32 size)
+{
+	int ret = 0;
+	struct device_node *np = dev->of_node;
+	size_t sz;
+	u32 *arr = NULL;
+
+	if (!of_get_property(np, prop_name, len)) {
+		ret = -EINVAL;
+		goto out;
+	}
+	sz = *len = *len / sizeof(*arr);
+	if (sz <= 0 || (size > 0 && (sz > size))) {
+		dev_err(dev, "%s invalid size\n", prop_name);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	arr = devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
+	if (!arr) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = of_property_read_u32_array(np, prop_name, arr, sz);
+	if (ret < 0) {
+		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
+		goto out;
+	}
+	*bw_vecs = arr;
+out:
+	if (ret)
+		*len = 0;
+	return ret;
+}
+
+/* Returns required bandwidth in Bytes per Sec */
+static unsigned long sdhci_get_bw_required(struct sdhci_host *host,
+					struct mmc_ios *ios)
+{
+	unsigned long bw;
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	bw = msm_host->clk_rate;
+
+	if (ios->bus_width == MMC_BUS_WIDTH_4)
+		bw /= 2;
+	else if (ios->bus_width == MMC_BUS_WIDTH_1)
+		bw /= 8;
+
+	return bw;
+}
+
+static int sdhci_msm_bus_get_vote_for_bw(struct sdhci_msm_host *host,
+					   unsigned int bw)
+{
+	struct sdhci_msm_bus_vote_data *bvd = host->bus_vote_data;
+
+	const unsigned int *table = bvd->bw_vecs;
+	unsigned int size = bvd->bw_vecs_size;
+	int i;
+
+	for (i = 0; i < size; i++) {
+		if (bw <= table[i])
+			return i;
+	}
+
+	return i - 1;
+}
+
+/*
+ * Caller of this function should ensure that msm bus client
+ * handle is not null.
+ */
+static inline int sdhci_msm_bus_set_vote(struct sdhci_msm_host *msm_host,
+					     int vote)
+{
+	struct sdhci_host *host =  platform_get_drvdata(msm_host->pdev);
+	struct sdhci_msm_bus_vote_data *bvd = msm_host->bus_vote_data;
+	struct msm_bus_path *usecase = bvd->usecase;
+	struct msm_bus_vectors *vec = usecase[vote].vec;
+	int ddr_rc = 0, cpu_rc = 0;
+
+	if (vote != bvd->curr_vote) {
+		pr_debug("%s: vote:%d sdhc_ddr ab:%llu ib:%llu cpu_sdhc ab:%llu ib:%llu\n",
+				mmc_hostname(host->mmc), vote, vec[0].ab,
+				vec[0].ib, vec[1].ab, vec[1].ib);
+		ddr_rc = icc_set_bw(bvd->sdhc_ddr, vec[0].ab, vec[0].ib);
+		cpu_rc = icc_set_bw(bvd->cpu_sdhc, vec[1].ab, vec[1].ib);
+		if (ddr_rc || cpu_rc) {
+			pr_err("%s: icc_set() failed\n",
+				mmc_hostname(host->mmc));
+			goto out;
+		}
+		bvd->curr_vote = vote;
+	}
+out:
+	return cpu_rc;
+}
+
+/*
+ * Internal work. Work to set 0 bandwidth for msm bus.
+ */
+static void sdhci_msm_bus_work(struct work_struct *work)
+{
+	struct sdhci_msm_host *msm_host;
+	struct sdhci_host *host;
+
+	msm_host = container_of(work, struct sdhci_msm_host,
+				bus_vote_work.work);
+	host =  platform_get_drvdata(msm_host->pdev);
+
+	if (!msm_host->bus_vote_data->sdhc_ddr ||
+			!msm_host->bus_vote_data->cpu_sdhc)
+		return;
+	/* don't vote for 0 bandwidth if any request is in progress */
+	if (!host->mmc->ongoing_mrq)
+		sdhci_msm_bus_set_vote(msm_host, 0);
+	else
+		pr_debug("Transfer in progress. Skipping bus voting to 0\n");
+}
+
+/*
+ * This function cancels any scheduled delayed work and sets the bus
+ * vote based on bw (bandwidth) argument.
+ */
+static void sdhci_msm_bus_cancel_work_and_set_vote(struct sdhci_host *host,
+						unsigned int bw)
+{
+	int vote;
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	if (!msm_host->bus_vote_data->sdhc_ddr ||
+			!msm_host->bus_vote_data->cpu_sdhc)
+		return;
+	cancel_delayed_work_sync(&msm_host->bus_vote_work);
+	vote = sdhci_msm_bus_get_vote_for_bw(msm_host, bw);
+	sdhci_msm_bus_set_vote(msm_host, vote);
+}
+
+#define MSM_MMC_BUS_VOTING_DELAY	200 /* msecs */
+#define VOTE_ZERO  0
+
+/*
+ * This function queues a work which will set the bandwidth
+ * requirement to 0.
+ */
+static void sdhci_msm_bus_queue_work(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	if (msm_host->bus_vote_data->curr_vote != VOTE_ZERO)
+		queue_delayed_work(system_wq,
+				   &msm_host->bus_vote_work,
+				   msecs_to_jiffies(MSM_MMC_BUS_VOTING_DELAY));
+}
+
+static struct sdhci_msm_bus_vote_data *sdhci_msm_get_bus_vote_data(struct device
+				       *dev, struct sdhci_msm_host *host)
+
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct device_node *of_node = dev->of_node;
+	struct sdhci_msm_bus_vote_data *bvd = NULL;
+	struct msm_bus_path *usecase = NULL;
+	int ret = 0, i = 0, j, num_paths, len;
+	const u32 *vec_arr = NULL;
+
+	if (!pdev) {
+		dev_err(dev, "Null platform device!\n");
+		return NULL;
+	}
+
+	bvd = devm_kzalloc(dev, sizeof(*bvd), GFP_KERNEL);
+	if (!bvd) {
+		ret = -ENOMEM;
+		return bvd;
+	}
+	ret = sdhci_msm_dt_get_array(dev, "bus-bw-vectors-bps",
+				&bvd->bw_vecs, &bvd->bw_vecs_size, 0);
+	if (ret) {
+		if (ret == -EINVAL) {
+			dev_dbg(dev, "No dt property of bus bw. voting defined!\n");
+			dev_dbg(dev, "Skipping Bus BW voting now!!\n");
+			host->skip_bus_bw_voting = true;
+			goto err;
+		}
+		goto out;
+	}
+
+	ret = of_property_read_string(of_node, "msm-bus,name", &bvd->name);
+	if (ret) {
+		dev_err(dev, "Bus name missing err:(%d)\n", ret);
+		goto out;
+	}
+
+	ret = of_property_read_u32(of_node, "msm-bus,num-cases",
+		&bvd->num_usecase);
+	if (ret) {
+		dev_err(dev, "num-usecases not found err:(%d)\n", ret);
+		goto out;
+	}
+
+	usecase = devm_kzalloc(dev, (sizeof(struct msm_bus_path) *
+				   bvd->num_usecase), GFP_KERNEL);
+	if (!usecase)
+		goto out;
+
+	ret = of_property_read_u32(of_node, "msm-bus,num-paths",
+				   &num_paths);
+	if (ret) {
+		dev_err(dev, "num_paths not found err:(%d)\n", ret);
+		goto out;
+	}
+
+	vec_arr = of_get_property(of_node, "msm-bus,vectors-KBps", &len);
+	if (!vec_arr) {
+		dev_err(dev, "Vector array not found\n");
+		goto out;
+	}
+
+	for (i = 0; i < bvd->num_usecase; i++) {
+		usecase[i].num_paths = num_paths;
+		usecase[i].vec = devm_kcalloc(dev, num_paths,
+					      sizeof(struct msm_bus_vectors),
+					      GFP_KERNEL);
+		if (!usecase[i].vec)
+			goto out;
+		for (j = 0; j < num_paths; j++) {
+			int idx = ((i * num_paths) + j) * 2;
+
+			usecase[i].vec[j].ab = (u64)
+				be32_to_cpu(vec_arr[idx]);
+			usecase[i].vec[j].ib = (u64)
+				be32_to_cpu(vec_arr[idx + 1]);
+		}
+	}
+
+	bvd->usecase = usecase;
+	return bvd;
+err:
+	devm_kfree(dev, bvd);
+out:
+	bvd = NULL;
+	return bvd;
+}
+
+static int sdhci_msm_bus_register(struct sdhci_msm_host *host,
+				struct platform_device *pdev)
+{
+	struct sdhci_msm_bus_vote_data *bsd;
+	struct device *dev = &pdev->dev;
+	int ret = 0;
+
+	bsd = sdhci_msm_get_bus_vote_data(dev, host);
+	if (!bsd) {
+		dev_err(&pdev->dev, "Failed to get bus_scale data\n");
+		return -EINVAL;
+	}
+	host->bus_vote_data = bsd;
+
+	bsd->sdhc_ddr = of_icc_get(&pdev->dev, "sdhc-ddr");
+	if (IS_ERR(bsd->sdhc_ddr)) {
+		dev_err(&pdev->dev, "(%ld): failed getting %s path\n",
+			PTR_ERR(bsd->sdhc_ddr), "sdhc-ddr");
+		ret = PTR_ERR(bsd->sdhc_ddr);
+		bsd->sdhc_ddr = NULL;
+		return ret;
+	}
+
+	bsd->cpu_sdhc = of_icc_get(&pdev->dev, "cpu-sdhc");
+	if (IS_ERR(bsd->cpu_sdhc)) {
+		dev_err(&pdev->dev, "(%ld): failed getting %s path\n",
+			PTR_ERR(bsd->cpu_sdhc), "cpu-sdhc");
+		ret = PTR_ERR(bsd->cpu_sdhc);
+		bsd->cpu_sdhc = NULL;
+		return ret;
+	}
+
+	INIT_DELAYED_WORK(&host->bus_vote_work, sdhci_msm_bus_work);
+
+	return ret;
+}
+
+static void sdhci_msm_bus_unregister(struct device *dev,
+				struct sdhci_msm_host *host)
+{
+	struct sdhci_msm_bus_vote_data *bsd = host->bus_vote_data;
+
+	icc_put(bsd->sdhc_ddr);
+	icc_put(bsd->cpu_sdhc);
+}
+
+static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable)
+{
+	struct mmc_ios *ios = &host->mmc->ios;
+	unsigned int bw;
+
+	bw = sdhci_get_bw_required(host, ios);
+	if (enable)
+		sdhci_msm_bus_cancel_work_and_set_vote(host, bw);
+	else
+		sdhci_msm_bus_queue_work(host);
+}
+
 static const struct sdhci_msm_variant_ops mci_var_ops = {
 	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
 	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
@@ -1839,6 +2181,15 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "TCXO clk not present (%d)\n", ret);
 	}
 
+	ret = sdhci_msm_bus_register(msm_host, pdev);
+	if (ret && !msm_host->skip_bus_bw_voting) {
+		dev_err(&pdev->dev, "Bus registration failed (%d)\n", ret);
+		goto clk_disable;
+	}
+
+	if (!msm_host->skip_bus_bw_voting)
+		sdhci_msm_bus_voting(host, 1);
+
 	if (!msm_host->mci_removed) {
 		core_memres = platform_get_resource(pdev, IORESOURCE_MEM, 1);
 		msm_host->core_mem = devm_ioremap_resource(&pdev->dev,
@@ -1846,7 +2197,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 
 		if (IS_ERR(msm_host->core_mem)) {
 			ret = PTR_ERR(msm_host->core_mem);
-			goto clk_disable;
+			goto bus_unregister;
 		}
 	}
 
@@ -1918,7 +2269,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	msm_host->pwr_irq = platform_get_irq_byname(pdev, "pwr_irq");
 	if (msm_host->pwr_irq < 0) {
 		ret = msm_host->pwr_irq;
-		goto clk_disable;
+		goto bus_unregister;
 	}
 
 	sdhci_msm_init_pwr_irq_wait(msm_host);
@@ -1931,7 +2282,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 					dev_name(&pdev->dev), host);
 	if (ret) {
 		dev_err(&pdev->dev, "Request IRQ failed (%d)\n", ret);
-		goto clk_disable;
+		goto bus_unregister;
 	}
 
 	pm_runtime_get_noresume(&pdev->dev);
@@ -1956,6 +2307,11 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
+bus_unregister:
+	if (!msm_host->skip_bus_bw_voting) {
+		sdhci_msm_bus_cancel_work_and_set_vote(host, 0);
+		sdhci_msm_bus_unregister(&pdev->dev, msm_host);
+	}
 clk_disable:
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
@@ -1985,6 +2341,10 @@ static int sdhci_msm_remove(struct platform_device *pdev)
 				   msm_host->bulk_clks);
 	if (!IS_ERR(msm_host->bus_clk))
 		clk_disable_unprepare(msm_host->bus_clk);
+	if (!msm_host->skip_bus_bw_voting) {
+		sdhci_msm_bus_cancel_work_and_set_vote(host, 0);
+		sdhci_msm_bus_unregister(&pdev->dev, msm_host);
+	}
 	sdhci_pltfm_free(pdev);
 	return 0;
 }
-- 
1.9.1

