Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5171626A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 14:01:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgBRNBY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 08:01:24 -0500
Received: from alexa-out-blr-01.qualcomm.com ([103.229.18.197]:1082 "EHLO
        alexa-out-blr-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726648AbgBRNBY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 08:01:24 -0500
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by alexa-out-blr-01.qualcomm.com with ESMTP/TLS/AES256-SHA; 18 Feb 2020 18:31:16 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg02-blr.qualcomm.com with ESMTP; 18 Feb 2020 18:30:43 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 4B1954C42; Tue, 18 Feb 2020 18:30:42 +0530 (IST)
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
Subject: [RFC v4 1/2] mmc: sdhci-msm: Add interconnect bus bandwidth scaling support
Date:   Tue, 18 Feb 2020 18:30:32 +0530
Message-Id: <1582030833-12964-2-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1582030833-12964-1-git-send-email-ppvk@codeaurora.org>
References: <1582030833-12964-1-git-send-email-ppvk@codeaurora.org>
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

changes from RFC v3 -> v4:

- Addressed review comments from Bjorn and Matthias

 drivers/mmc/host/sdhci-msm.c | 204 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 200 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 71f29ba..5af1c58 100644
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
 
@@ -229,6 +231,12 @@ struct sdhci_msm_variant_info {
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
@@ -255,8 +263,11 @@ struct sdhci_msm_host {
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
@@ -1564,6 +1575,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 
 	msm_set_clock_rate_for_bus_mode(host, clock);
 out:
+	sdhci_msm_bus_voting(host, !!clock);
 	__sdhci_msm_set_clock(host, clock);
 }
 
@@ -1685,6 +1697,174 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
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
+		return msm_host->clk_rate/8;
+	case MMC_BUS_WIDTH_4:
+		return msm_host->clk_rate/2;
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
+	int i, ddr_rc, cpu_rc;
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
+	ddr_rc = icc_set_bw(vote_data->sdhc_to_ddr, 0, peak_bw[0]);
+	cpu_rc = icc_set_bw(vote_data->cpu_to_sdhc, 0, peak_bw[1]);
+	if (ddr_rc || cpu_rc) {
+		dev_err(dev, "icc_set() failed ddr_rc:%d cpu_rc:%d\n",
+							ddr_rc, cpu_rc);
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
+	int ret;
+
+	vote_data = devm_kzalloc(dev, sizeof(*vote_data), GFP_KERNEL);
+	if (!vote_data)
+		return NULL;
+
+	vote_data->sdhc_to_ddr = of_icc_get(&pdev->dev, "sdhc-ddr");
+	vote_data->cpu_to_sdhc = of_icc_get(&pdev->dev, "cpu-sdhc");
+	if (!vote_data->sdhc_to_ddr || !vote_data->cpu_to_sdhc) {
+		dev_info(&pdev->dev, "ICC DT property is missing. skip vote !!\n");
+		return NULL;
+	} else if (IS_ERR(vote_data->sdhc_to_ddr) ||
+			IS_ERR(vote_data->cpu_to_sdhc)) {
+		dev_err(&pdev->dev, "(%ld): failed getting %s path\n",
+				PTR_ERR(vote_data->sdhc_to_ddr), "sdhc-ddr");
+		dev_err(&pdev->dev, "(%ld): failed getting %s path\n",
+				PTR_ERR(vote_data->sdhc_to_ddr), "cpu-sdhc");
+
+		return IS_ERR(vote_data->sdhc_to_ddr) ?
+			ERR_CAST(vote_data->sdhc_to_ddr) :
+			ERR_CAST(vote_data->cpu_to_sdhc);
+	}
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret) {
+		if (ret == -ENODEV || ret == -ENODATA)
+			dev_err(dev, "OPP dt properties missing:%d\n", ret);
+		else
+			dev_err(dev, "OPP registration failed:%d\n", ret);
+		return ERR_PTR(ret);
+	}
+	return vote_data;
+}
+
+static void sdhci_msm_bus_unregister(struct device *dev,
+				struct sdhci_msm_host *host)
+{
+	struct sdhci_msm_bus_vote_data *vote_data = host->bus_vote_data;
+
+	if (!vote_data ||
+		IS_ERR(vote_data->sdhc_to_ddr) ||
+		IS_ERR(vote_data->cpu_to_sdhc))
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
+	if (!msm_host->bus_vote_data ||
+		IS_ERR(msm_host->bus_vote_data))
+		return;
+
+	if (enable) {
+		bw = sdhci_get_bw_required(host, ios);
+		sdhci_msm_bus_set_vote(host, bw);
+	} else
+		sdhci_msm_bus_set_vote(host, 0);
+}
+
 static const struct sdhci_msm_variant_ops mci_var_ops = {
 	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
 	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
@@ -1845,11 +2025,20 @@ static int sdhci_msm_probe(struct platform_device *pdev)
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
 
@@ -1924,7 +2113,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	msm_host->pwr_irq = platform_get_irq_byname(pdev, "pwr_irq");
 	if (msm_host->pwr_irq < 0) {
 		ret = msm_host->pwr_irq;
-		goto clk_disable;
+		goto bus_unregister;
 	}
 
 	sdhci_msm_init_pwr_irq_wait(msm_host);
@@ -1937,7 +2126,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 					dev_name(&pdev->dev), host);
 	if (ret) {
 		dev_err(&pdev->dev, "Request IRQ failed (%d)\n", ret);
-		goto clk_disable;
+		goto bus_unregister;
 	}
 
 	pm_runtime_get_noresume(&pdev->dev);
@@ -1962,6 +2151,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
+bus_unregister:
+	sdhci_msm_bus_voting(host, false);
+	sdhci_msm_bus_unregister(&pdev->dev, msm_host);
 clk_disable:
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
@@ -1991,6 +2183,9 @@ static int sdhci_msm_remove(struct platform_device *pdev)
 				   msm_host->bulk_clks);
 	if (!IS_ERR(msm_host->bus_clk))
 		clk_disable_unprepare(msm_host->bus_clk);
+
+	sdhci_msm_bus_voting(host, false);
+	sdhci_msm_bus_unregister(&pdev->dev, msm_host);
 	sdhci_pltfm_free(pdev);
 	return 0;
 }
@@ -2003,7 +2198,7 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
-
+	sdhci_msm_bus_voting(host, false);
 	return 0;
 }
 
@@ -2025,6 +2220,7 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 	if (msm_host->restore_dll_config && msm_host->clk_rate)
 		return sdhci_msm_restore_sdr_dll_config(host);
 
+	sdhci_msm_bus_voting(host, true);
 	return 0;
 }
 
-- 
1.9.1

