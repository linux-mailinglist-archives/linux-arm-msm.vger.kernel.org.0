Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB401828B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 07:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387907AbgCLGDV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 02:03:21 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:15073 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387767AbgCLGDU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 02:03:20 -0400
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 Mar 2020 11:32:29 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg02-blr.qualcomm.com with ESMTP; 12 Mar 2020 11:32:00 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 668C24D31; Thu, 12 Mar 2020 11:31:59 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     bjorn.andersson@linaro.org, adrian.hunter@intel.com,
        robh+dt@kernel.org, ulf.hansson@linaro.org,
        asutoshd@codeaurora.org, stummala@codeaurora.org,
        sayalil@codeaurora.org, rampraka@codeaurora.org,
        vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        Pradeep P V K <ppvk@codeaurora.org>,
        Subhash Jadavani <subhashj@codeaurora.org>
Subject: [RFC v5 1/2] mmc: sdhci-msm: Add interconnect bus bandwidth scaling support
Date:   Thu, 12 Mar 2020 11:31:50 +0530
Message-Id: <1583992911-12001-2-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1583992911-12001-1-git-send-email-ppvk@codeaurora.org>
References: <1583992911-12001-1-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect bandwidths for SDHC driver using OPP framework that
is required by SDHC driver based on the clock frequency and bus width
of the card. Otherwise, the system clocks may run at minimum clock
speed and thus affecting the performance.

This change is based on
[RFC] mmc: host: sdhci-msm: Use the interconnect API
(https://lkml.org/lkml/2018/10/11/499) and

[PATCH v6] Introduce Bandwidth OPPs for interconnects
(https://lkml.org/lkml/2019/12/6/740)

Co-developed-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Co-developed-by: Subhash Jadavani <subhashj@codeaurora.org>
Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
Co-developed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Co-developed-by: Pradeep P V K <ppvk@codeaurora.org>
Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
---

RFC v4 -> v5:
- Rewrote the icc interconnect get handlers and its error handling
  and allocated vote data after handling all icc get handler errors.
- Removed explicit error check on ICC handlers.
- Addressed minor code style comments.

 drivers/mmc/host/sdhci-msm.c | 231 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 227 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 09ff731..5fe8fad 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -11,8 +11,10 @@
 #include <linux/mmc/mmc.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
+#include <linux/interconnect.h>
 #include <linux/iopoll.h>
 #include <linux/regulator/consumer.h>
+#include <linux/pm_opp.h>
 
 #include "sdhci-pltfm.h"
 #include "cqhci.h"
@@ -234,6 +236,12 @@ struct sdhci_msm_variant_info {
 	const struct sdhci_msm_offset *offset;
 };
 
+struct sdhci_msm_bus_vote_data {
+	struct icc_path *sdhc_to_ddr;
+	struct icc_path *cpu_to_sdhc;
+	u32 curr_freq;
+};
+
 struct sdhci_msm_host {
 	struct platform_device *pdev;
 	void __iomem *core_mem;	/* MSM SDCC mapped address */
@@ -260,8 +268,11 @@ struct sdhci_msm_host {
 	bool use_cdr;
 	u32 transfer_mode;
 	bool updated_ddr_cfg;
+	struct sdhci_msm_bus_vote_data *bus_vote_data;
 };
 
+static void sdhci_msm_bus_voting(struct sdhci_host *host, bool enable);
+
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1581,6 +1592,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 
 	msm_set_clock_rate_for_bus_mode(host, clock);
 out:
+	sdhci_msm_bus_voting(host, !!clock);
 	__sdhci_msm_set_clock(host, clock);
 }
 
@@ -1823,6 +1835,201 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
 	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
 }
 
+/*
+ * Returns required bandwidth in Bytes per Sec
+ */
+static unsigned long sdhci_get_bw_required(struct sdhci_host *host,
+					struct mmc_ios *ios)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+
+	switch (ios->bus_width) {
+	case MMC_BUS_WIDTH_1:
+		return msm_host->clk_rate / 8;
+	case MMC_BUS_WIDTH_4:
+		return msm_host->clk_rate / 2;
+	case MMC_BUS_WIDTH_8:
+		break;
+	}
+	return msm_host->clk_rate;
+}
+
+/*
+ * Helper function to parse the exact OPP node
+ * Returns OPP pointer on success else NULL on error
+ */
+static struct dev_pm_opp
+		*sdhci_msm_find_opp_for_freq(struct sdhci_msm_host *msm_host,
+							unsigned long bw)
+{
+	struct dev_pm_opp *opp;
+	struct sdhci_host *host = mmc_priv(msm_host->mmc);
+	unsigned int freq = bw;
+	struct device *dev = &msm_host->pdev->dev;
+
+
+	if (!freq)
+		opp = dev_pm_opp_find_peak_bw_floor(dev, &freq);
+	else
+		opp = dev_pm_opp_find_peak_bw_exact(dev, freq, true);
+
+	/* Max bandwidth vote */
+	if (PTR_ERR(opp) == -ERANGE && freq > sdhci_msm_get_max_clock(host))
+		opp = dev_pm_opp_find_peak_bw_ceil(dev, &bw);
+
+	if (IS_ERR(opp)) {
+		dev_err(dev, "Failed to find OPP for freq:%u err:%ld\n",
+				freq, PTR_ERR(opp));
+		return NULL;
+	}
+	return opp;
+}
+
+/*
+ * This function sets the interconnect bus bandwidth
+ * vote based on bw (bandwidth) argument.
+ */
+#define BUS_INTERCONNECT_PATHS 2 /* 1. sdhc -> ddr 2. cpu -> sdhc */
+static void sdhci_msm_bus_set_vote(struct sdhci_host *host,
+						unsigned int bw)
+{
+	int i, err;
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct sdhci_msm_bus_vote_data *vote_data = msm_host->bus_vote_data;
+	struct device *dev = &msm_host->pdev->dev;
+	struct dev_pm_opp *opp;
+	unsigned long freq = bw;
+	unsigned long peak_bw[BUS_INTERCONNECT_PATHS] = {0};
+	unsigned long avg_bw[BUS_INTERCONNECT_PATHS] = {0};
+
+	if (bw == vote_data->curr_freq)
+		return;
+
+	for (i = 0; i < BUS_INTERCONNECT_PATHS; i++) {
+		opp = sdhci_msm_find_opp_for_freq(msm_host, freq);
+		if (opp) {
+			avg_bw[i] = dev_pm_opp_get_bw(opp, &peak_bw[i]);
+			freq += 1; /* Next bandwidth vote */
+			dev_pm_opp_put(opp);
+		}
+	}
+	pr_debug("%s: freq:%d sdhc_to_ddr avg_bw:%lu peak_bw:%lu cpu_to_sdhc avg_bw:%lu peak_bw:%lu\n",
+			mmc_hostname(host->mmc), bw, avg_bw[0], peak_bw[0],
+				avg_bw[1], peak_bw[1]);
+	err = icc_set_bw(vote_data->sdhc_to_ddr, 0, peak_bw[0]);
+	if (err) {
+		dev_err(dev, "icc_set() failed for 'sdhc-ddr' path err:%d\n",
+							err);
+		return;
+	}
+	err = icc_set_bw(vote_data->cpu_to_sdhc, 0, peak_bw[1]);
+	if (err) {
+		dev_err(dev, "icc_set() failed for 'cpu-sdhc' path err:%d\n",
+							err);
+		return;
+	}
+	vote_data->curr_freq = bw;
+}
+
+/*
+ * Helper function to register for OPP and interconnect
+ * frameworks.
+ */
+static struct sdhci_msm_bus_vote_data
+		*sdhci_msm_bus_register(struct sdhci_msm_host *host,
+				struct platform_device *pdev)
+{
+	struct sdhci_msm_bus_vote_data *vote_data;
+	struct device *dev = &pdev->dev;
+	int ret, i, err;
+	struct icc_path *icc_paths[BUS_INTERCONNECT_PATHS];
+	const char *path_names[] = {
+		"sdhc-ddr",
+		"cpu-sdhc",
+	};
+
+	for (i = 0; i < BUS_INTERCONNECT_PATHS; i++)
+		icc_paths[i] = of_icc_get(&pdev->dev, path_names[i]);
+
+	if (!icc_paths[0] && !icc_paths[1]) {
+		dev_info(&pdev->dev, "ICC DT property is missing.Skip vote!!\n");
+		return NULL;
+	}
+
+	for (i = 0; i < BUS_INTERCONNECT_PATHS; i++) {
+		if (!icc_paths[i]) {
+			dev_err(&pdev->dev, "interconnect path '%s' is not configured\n",
+					path_names[i]);
+			err = -EINVAL;
+			goto handle_err;
+		}
+		if (IS_ERR(icc_paths[i])) {
+			err = PTR_ERR(icc_paths[i]);
+
+			if (err != -EPROBE_DEFER)
+				dev_err(&pdev->dev, "interconnect path '%s' is invalid:%d\n",
+					path_names[i], err);
+			goto handle_err;
+		}
+	}
+
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret) {
+		if (ret == -ENODEV || ret == -ENODATA)
+			dev_err(dev, "OPP dt properties missing:%d\n", ret);
+		else
+			dev_err(dev, "OPP registration failed:%d\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	vote_data = devm_kzalloc(dev, sizeof(*vote_data), GFP_KERNEL);
+	if (!vote_data)
+		return ERR_PTR(-ENOMEM);
+
+	vote_data->sdhc_to_ddr = icc_paths[0];
+	vote_data->cpu_to_sdhc = icc_paths[1];
+	return vote_data;
+handle_err:
+	if (err) {
+		int other = (i == 0) ? 1 : 0;
+
+		if (!IS_ERR_OR_NULL(icc_paths[other]))
+			icc_put(icc_paths[other]);
+	}
+	return ERR_PTR(err);
+}
+
+static void sdhci_msm_bus_unregister(struct device *dev,
+				struct sdhci_msm_host *host)
+{
+	struct sdhci_msm_bus_vote_data *vote_data = host->bus_vote_data;
+
+	if (IS_ERR_OR_NULL(vote_data))
+		return;
+
+	icc_put(vote_data->sdhc_to_ddr);
+	icc_put(vote_data->cpu_to_sdhc);
+}
+
+static void sdhci_msm_bus_voting(struct sdhci_host *host, bool enable)
+{
+	struct mmc_ios *ios = &host->mmc->ios;
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	unsigned int bw;
+
+	if (IS_ERR_OR_NULL(msm_host->bus_vote_data))
+		return;
+
+	if (enable) {
+		bw = sdhci_get_bw_required(host, ios);
+		sdhci_msm_bus_set_vote(host, bw);
+	} else
+		sdhci_msm_bus_set_vote(host, 0);
+}
+
 static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
 {
 	if ((host->mmc->caps2 & MMC_CAP2_CQE) && (mask & SDHCI_RESET_ALL))
@@ -1992,11 +2199,20 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "TCXO clk not present (%d)\n", ret);
 	}
 
+	msm_host->bus_vote_data = sdhci_msm_bus_register(msm_host, pdev);
+	if (IS_ERR(msm_host->bus_vote_data)) {
+		ret = PTR_ERR(msm_host->bus_vote_data);
+		dev_err(&pdev->dev, "Bus registration failed (%d)\n", ret);
+		goto clk_disable;
+	}
+
+	sdhci_msm_bus_voting(host, true);
+
 	if (!msm_host->mci_removed) {
 		msm_host->core_mem = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(msm_host->core_mem)) {
 			ret = PTR_ERR(msm_host->core_mem);
-			goto clk_disable;
+			goto bus_unregister;
 		}
 	}
 
@@ -2071,7 +2287,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	msm_host->pwr_irq = platform_get_irq_byname(pdev, "pwr_irq");
 	if (msm_host->pwr_irq < 0) {
 		ret = msm_host->pwr_irq;
-		goto clk_disable;
+		goto bus_unregister;
 	}
 
 	sdhci_msm_init_pwr_irq_wait(msm_host);
@@ -2084,7 +2300,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 					dev_name(&pdev->dev), host);
 	if (ret) {
 		dev_err(&pdev->dev, "Request IRQ failed (%d)\n", ret);
-		goto clk_disable;
+		goto bus_unregister;
 	}
 
 	pm_runtime_get_noresume(&pdev->dev);
@@ -2112,6 +2328,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
+bus_unregister:
+	sdhci_msm_bus_voting(host, false);
+	sdhci_msm_bus_unregister(&pdev->dev, msm_host);
 clk_disable:
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
@@ -2141,6 +2360,9 @@ static int sdhci_msm_remove(struct platform_device *pdev)
 				   msm_host->bulk_clks);
 	if (!IS_ERR(msm_host->bus_clk))
 		clk_disable_unprepare(msm_host->bus_clk);
+
+	sdhci_msm_bus_voting(host, false);
+	sdhci_msm_bus_unregister(&pdev->dev, msm_host);
 	sdhci_pltfm_free(pdev);
 	return 0;
 }
@@ -2153,7 +2375,7 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
-
+	sdhci_msm_bus_voting(host, false);
 	return 0;
 }
 
@@ -2175,6 +2397,7 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 	if (msm_host->restore_dll_config && msm_host->clk_rate)
 		return sdhci_msm_restore_sdr_dll_config(host);
 
+	sdhci_msm_bus_voting(host, true);
 	return 0;
 }
 
-- 
1.9.1

