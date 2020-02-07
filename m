Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9E01559F2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2020 15:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727243AbgBGOpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Feb 2020 09:45:54 -0500
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:2105 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726867AbgBGOpy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Feb 2020 09:45:54 -0500
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 07 Feb 2020 20:15:45 +0530
Received: from c-ppvk-linux.qualcomm.com ([10.206.24.34])
  by ironmsg01-blr.qualcomm.com with ESMTP; 07 Feb 2020 20:15:14 +0530
Received: by c-ppvk-linux.qualcomm.com (Postfix, from userid 2304101)
        id 3194A47EB; Fri,  7 Feb 2020 20:15:14 +0530 (IST)
From:   Pradeep P V K <ppvk@codeaurora.org>
To:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        rampraka@codeaurora.org, vbadigan@codeaurora.org, sboyd@kernel.org,
        georgi.djakov@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, linux-mmc-owner@vger.kernel.org,
        mka@chromium.org, Pradeep P V K <ppvk@codeaurora.org>,
        Subhash Jadavani <subhashj@codeaurora.org>
Subject: [RFC v3 1/2] mmc: sdhci-msm: Add interconnect bus bandwidth scaling support
Date:   Fri,  7 Feb 2020 20:14:54 +0530
Message-Id: <1581086695-16645-2-git-send-email-ppvk@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1581086695-16645-1-git-send-email-ppvk@codeaurora.org>
References: <1581086695-16645-1-git-send-email-ppvk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add interconnect bandwidths for SDHC driver using OPP framework that
is required by SDHC driver based on the clock frequency and bus width
of the card. Otherwise, the system clocks may run at minimum clock
speed and thus affecting the performance.

This change is based on Georgi Djakov [RFC]
(https://lkml.org/lkml/2018/10/11/499) and

Saravana Kannan [PATCH v6]
(https://lkml.org/lkml/2019/12/6/740)

change from RFC v2 -> v3 changes:
- Modified interconnect bandwidth support using OPP framework.
- Addressed review comments on v2.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
Signed-off-by: Subhash Jadavani <subhashj@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Co-developed-by: Pradeep P V K <ppvk@codeaurora.org>
Signed-off-by: Pradeep P V K <ppvk@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 251 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 247 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 71f29ba..f061cd8 100644
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
 
@@ -229,6 +231,14 @@ struct sdhci_msm_variant_info {
 	const struct sdhci_msm_offset *offset;
 };
 
+struct sdhci_msm_bus_vote_data {
+
+	struct icc_path *sdhc_to_ddr;
+	struct icc_path *cpu_to_sdhc;
+	bool skip_bus_bw_voting;
+	u32 curr_freq;
+};
+
 struct sdhci_msm_host {
 	struct platform_device *pdev;
 	void __iomem *core_mem;	/* MSM SDCC mapped address */
@@ -255,8 +265,11 @@ struct sdhci_msm_host {
 	bool use_cdr;
 	u32 transfer_mode;
 	bool updated_ddr_cfg;
+	struct sdhci_msm_bus_vote_data *bus_vote_data;
 };
 
+static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable);
+
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
@@ -1564,6 +1577,7 @@ static void sdhci_msm_set_clock(struct sdhci_host *host, unsigned int clock)
 
 	msm_set_clock_rate_for_bus_mode(host, clock);
 out:
+	sdhci_msm_bus_voting(host, !!clock);
 	__sdhci_msm_set_clock(host, clock);
 }
 
@@ -1685,6 +1699,219 @@ static void sdhci_msm_set_regulator_caps(struct sdhci_msm_host *msm_host)
 	pr_debug("%s: supported caps: 0x%08x\n", mmc_hostname(mmc), caps);
 }
 
+/*
+ * Returns required bandwidth in Bytes per Sec
+ */
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
+/*
+ * Helper function to parse the exact OPP node
+ * Returns OPP pointer on success else NULL on error
+ */
+static struct dev_pm_opp *find_opp_for_freq(struct sdhci_msm_host *msm_host,
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
+	/* Max Bandwidth vote */
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
+	int i;
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct sdhci_msm_bus_vote_data *vote_data = msm_host->bus_vote_data;
+	struct dev_pm_opp *opp;
+	unsigned long freq = bw;
+	unsigned long ib[BUS_INTERCONNECT_PATHS], ab[BUS_INTERCONNECT_PATHS];
+	int ddr_rc = 0, cpu_rc = 0;
+
+	if (!msm_host->bus_vote_data->sdhc_to_ddr ||
+			!msm_host->bus_vote_data->cpu_to_sdhc)
+		return;
+
+	if (bw != vote_data->curr_freq) {
+		for (i = 0; i < BUS_INTERCONNECT_PATHS; i++) {
+			opp = find_opp_for_freq(msm_host, freq);
+			if (opp) {
+				ab[i] =	dev_pm_opp_get_bw(opp, &ib[i]);
+				freq += 1; /* Next Band width vote */
+				dev_pm_opp_put(opp);
+			}
+		}
+		pr_debug("%s: freq:%d sdhc_to_ddr ab:%lu ib:%lu cpu_to_sdhc ab:%lu ib:%lu\n",
+				mmc_hostname(host->mmc), bw, ab[0], ib[0],
+				ab[1], ib[1]);
+		ddr_rc = icc_set_bw(vote_data->sdhc_to_ddr, 0, ib[0]);
+		cpu_rc = icc_set_bw(vote_data->cpu_to_sdhc, 0, ib[1]);
+		if (ddr_rc || cpu_rc) {
+			pr_err("%s: icc_set() failed ddr_rc_err:%d cpu_rc_err:%d\n",
+				mmc_hostname(host->mmc), ddr_rc, cpu_rc);
+			return;
+		}
+		vote_data->curr_freq = bw;
+	}
+}
+
+/*
+ * This function registers the device to OPP framework and
+ * parses few optional parameters from the device tree node.
+ * Returns NULL bvd pointer on error else a valid bvd pointer.
+ */
+static struct sdhci_msm_bus_vote_data *sdhci_msm_get_bus_vote_data(struct device
+				       *dev, struct sdhci_msm_host *host)
+
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct sdhci_msm_bus_vote_data *vote_data = NULL;
+	int ret = 0;
+
+	if (!pdev) {
+		dev_err(dev, "Null platform device!\n");
+		return NULL;
+	}
+	vote_data = devm_kzalloc(dev, sizeof(*vote_data), GFP_KERNEL);
+	if (!vote_data)
+		return vote_data;
+
+	ret = dev_pm_opp_of_add_table(dev);
+	if (ret) {
+		if (ret == -ENODEV || ret == -ENODATA) {
+			dev_dbg(dev, "OPP not found. Skip bus voting!!:%d\n",
+					ret);
+			vote_data->skip_bus_bw_voting = true;
+		} else {
+			dev_dbg(dev, "OPP regestration failed:%d\n", ret);
+			goto err;
+		}
+	}
+
+	return vote_data;
+err:
+	devm_kfree(dev, vote_data);
+	vote_data = NULL;
+	return vote_data;
+}
+
+/*
+ * Helper function to register for OPP and interconnect
+ * frameworks.
+ */
+static int sdhci_msm_bus_register(struct sdhci_msm_host *host,
+				struct platform_device *pdev)
+{
+	struct sdhci_msm_bus_vote_data *vote_data;
+	struct device *dev = &pdev->dev;
+	int ret = 0;
+
+	vote_data = sdhci_msm_get_bus_vote_data(dev, host);
+	if (!vote_data) {
+		dev_dbg(&pdev->dev, "Failed to get bus_scale data\n");
+		host->bus_vote_data = NULL;
+		return -EINVAL;
+	}
+	host->bus_vote_data = vote_data;
+
+	vote_data->sdhc_to_ddr = of_icc_get(&pdev->dev, "sdhc-ddr");
+	if (!vote_data->sdhc_to_ddr) {
+		dev_dbg(&pdev->dev, "DT property for path %s missing\n",
+				"sdhc-ddr");
+		return -ENOENT;
+	} else if (IS_ERR(vote_data->sdhc_to_ddr) {
+		dev_dbg(&pdev->dev, "(%ld): failed getting %s path\n",
+				PTR_ERR(vote_data->sdhc_to_ddr), "sdhc-ddr");
+		ret = PTR_ERR(vote_data->sdhc_to_ddr);
+		vote_data->sdhc_to_ddr = NULL;
+		return ret;
+	}
+	vote_data->cpu_to_sdhc = of_icc_get(&pdev->dev, "cpu-sdhc");
+	if (!vote_data->cpu_to_sdhc) {
+		dev_dbg(&pdev->dev, "DT property for path %s missing\n",
+					"cpu_to_sdhc");
+		return -ENOENT;
+	} else if (IS_ERR(vote_data->cpu_to_sdhc)) {
+		dev_dbg(&pdev->dev, "(%ld): failed getting %s path\n",
+				PTR_ERR(vote_data->cpu_to_sdhc), "cpu-sdhc");
+		ret = PTR_ERR(vote_data->cpu_to_sdhc);
+		vote_data->cpu_to_sdhc = NULL;
+		return ret;
+	}
+	return ret;
+}
+
+static void sdhci_msm_bus_unregister(struct device *dev,
+				struct sdhci_msm_host *host)
+{
+	struct sdhci_msm_bus_vote_data *vote_data = host->bus_vote_data;
+
+	if (vote_data->skip_bus_bw_voting ||
+		!vote_data->sdhc_to_ddr ||
+		!vote_data->cpu_to_sdhc)
+		return;
+
+	icc_put(vote_data->sdhc_to_ddr);
+	icc_put(vote_data->cpu_to_sdhc);
+}
+
+#define MSM_MMC_BUS_VOTING_DELAY        200 /* msecs */
+
+static void sdhci_msm_bus_voting(struct sdhci_host *host, u32 enable)
+{
+	struct mmc_ios *ios = &host->mmc->ios;
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	unsigned int bw;
+
+	if (msm_host->bus_vote_data->skip_bus_bw_voting)
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
@@ -1845,11 +2072,20 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "TCXO clk not present (%d)\n", ret);
 	}
 
+	ret = sdhci_msm_bus_register(msm_host, pdev);
+	if (ret && msm_host->bus_vote_data &&
+			!msm_host->bus_vote_data->skip_bus_bw_voting) {
+		dev_err(&pdev->dev, "Bus registration failed (%d)\n", ret);
+		goto clk_disable;
+	}
+
+	sdhci_msm_bus_voting(host, 1);
+
 	if (!msm_host->mci_removed) {
 		msm_host->core_mem = devm_platform_ioremap_resource(pdev, 1);
 		if (IS_ERR(msm_host->core_mem)) {
 			ret = PTR_ERR(msm_host->core_mem);
-			goto clk_disable;
+			goto bus_unregister;
 		}
 	}
 
@@ -1924,7 +2160,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	msm_host->pwr_irq = platform_get_irq_byname(pdev, "pwr_irq");
 	if (msm_host->pwr_irq < 0) {
 		ret = msm_host->pwr_irq;
-		goto clk_disable;
+		goto bus_unregister;
 	}
 
 	sdhci_msm_init_pwr_irq_wait(msm_host);
@@ -1937,7 +2173,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 					dev_name(&pdev->dev), host);
 	if (ret) {
 		dev_err(&pdev->dev, "Request IRQ failed (%d)\n", ret);
-		goto clk_disable;
+		goto bus_unregister;
 	}
 
 	pm_runtime_get_noresume(&pdev->dev);
@@ -1962,6 +2198,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
+bus_unregister:
+	sdhci_msm_bus_voting(host, 0);
+	sdhci_msm_bus_unregister(&pdev->dev, msm_host);
 clk_disable:
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
@@ -1991,6 +2230,9 @@ static int sdhci_msm_remove(struct platform_device *pdev)
 				   msm_host->bulk_clks);
 	if (!IS_ERR(msm_host->bus_clk))
 		clk_disable_unprepare(msm_host->bus_clk);
+
+	sdhci_msm_bus_voting(host, 0);
+	sdhci_msm_bus_unregister(&pdev->dev, msm_host);
 	sdhci_pltfm_free(pdev);
 	return 0;
 }
@@ -2003,7 +2245,7 @@ static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
 
 	clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
 				   msm_host->bulk_clks);
-
+	sdhci_msm_bus_voting(host, 0);
 	return 0;
 }
 
@@ -2025,6 +2267,7 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
 	if (msm_host->restore_dll_config && msm_host->clk_rate)
 		return sdhci_msm_restore_sdr_dll_config(host);
 
+	sdhci_msm_bus_voting(host, 1);
 	return 0;
 }
 
-- 
1.9.1

