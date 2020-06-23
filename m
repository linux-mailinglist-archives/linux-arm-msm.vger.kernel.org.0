Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95232053B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2020 15:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732639AbgFWNlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 09:41:23 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54929 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732706AbgFWNlW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 09:41:22 -0400
Received: from ironmsg07-lv.qualcomm.com (HELO ironmsg07-lv.qulacomm.com) ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 23 Jun 2020 06:35:16 -0700
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qulacomm.com with ESMTP/TLS/AES256-SHA; 23 Jun 2020 06:35:14 -0700
Received: from vbadigan-linux.qualcomm.com ([10.206.24.109])
  by ironmsg01-blr.qualcomm.com with ESMTP; 23 Jun 2020 19:05:10 +0530
Received: by vbadigan-linux.qualcomm.com (Postfix, from userid 76677)
        id 9A4564140; Tue, 23 Jun 2020 19:05:09 +0530 (IST)
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Vijay Viswanath <vviswana@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V5 3/3] mmc: sdhci-msm: Use internal voltage control
Date:   Tue, 23 Jun 2020 19:04:48 +0530
Message-Id: <1592919288-1020-4-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1592919288-1020-1-git-send-email-vbadigan@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1592919288-1020-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On qcom SD host controllers voltage switching be done after the HW
is ready for it. The HW informs its readiness through power irq.
The voltage switching should happen only then.

Use the internal voltage switching and then control the voltage
switching using power irq.

IO-bus supply of eMMC would be kept always-on. So set the load
for this supply to configure it in LPM when eMMC is suspend state
and in HPM when eMMC is active.

Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Co-developed-by: Vijay Viswanath <vviswana@codeaurora.org>
Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
Co-developed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 206 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 197 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 15c42b059240..cbe15519e7b9 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -37,7 +37,9 @@
 #define CORE_PWRCTL_IO_LOW	BIT(2)
 #define CORE_PWRCTL_IO_HIGH	BIT(3)
 #define CORE_PWRCTL_BUS_SUCCESS BIT(0)
+#define CORE_PWRCTL_BUS_FAIL    BIT(1)
 #define CORE_PWRCTL_IO_SUCCESS	BIT(2)
+#define CORE_PWRCTL_IO_FAIL     BIT(3)
 #define REQ_BUS_OFF		BIT(0)
 #define REQ_BUS_ON		BIT(1)
 #define REQ_IO_LOW		BIT(2)
@@ -127,6 +129,9 @@
 /* Timeout value to avoid infinite waiting for pwr_irq */
 #define MSM_PWR_IRQ_TIMEOUT_MS 5000
 
+/* Max load for eMMC Vdd-io supply */
+#define MMC_VQMMC_MAX_LOAD_UA	325000
+
 #define msm_host_readl(msm_host, host, offset) \
 	msm_host->var_ops->msm_readl_relaxed(host, offset)
 
@@ -278,6 +283,7 @@ struct sdhci_msm_host {
 	bool uses_tassadar_dll;
 	u32 dll_config;
 	u32 ddr_config;
+	bool vqmmc_enabled;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -1346,6 +1352,95 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
 		sdhci_msm_hs400(host, &mmc->ios);
 }
 
+static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
+{
+	if (IS_ERR(mmc->supply.vmmc))
+		return 0;
+
+	return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
+}
+
+static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
+			      struct mmc_host *mmc, bool level)
+{
+	int ret;
+	struct mmc_ios ios;
+
+	if (msm_host->vqmmc_enabled == level)
+		return 0;
+
+	if (level) {
+		/* Set the IO voltage regulator to default voltage level */
+		if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
+			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_330;
+		else if (msm_host->caps_0 & CORE_1_8V_SUPPORT)
+			ios.signal_voltage = MMC_SIGNAL_VOLTAGE_180;
+
+		if (msm_host->caps_0 & CORE_VOLT_SUPPORT) {
+			ret = mmc_regulator_set_vqmmc(mmc, &ios);
+			if (ret < 0) {
+				dev_err(mmc_dev(mmc), "%s: vqmmc set volgate failed: %d\n",
+					mmc_hostname(mmc), ret);
+				goto out;
+			}
+		}
+		ret = regulator_enable(mmc->supply.vqmmc);
+	} else {
+		ret = regulator_disable(mmc->supply.vqmmc);
+	}
+
+	if (ret)
+		dev_err(mmc_dev(mmc), "%s: vqmm %sable failed: %d\n",
+			mmc_hostname(mmc), level ? "en":"dis", ret);
+	else
+		msm_host->vqmmc_enabled = level;
+out:
+	return ret;
+}
+
+static int msm_config_vqmmc_mode(struct sdhci_msm_host *msm_host,
+			      struct mmc_host *mmc, bool hpm)
+{
+	int load, ret;
+
+	load = hpm ? MMC_VQMMC_MAX_LOAD_UA : 0;
+	ret = regulator_set_load(mmc->supply.vqmmc, load);
+	if (ret)
+		dev_err(mmc_dev(mmc), "%s: vqmmc set load failed: %d\n",
+			mmc_hostname(mmc), ret);
+	return ret;
+}
+
+static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
+			      struct mmc_host *mmc, bool level)
+{
+	int ret;
+	bool always_on;
+
+	if (IS_ERR(mmc->supply.vqmmc) ||
+			(mmc->ios.power_mode == MMC_POWER_UNDEFINED))
+		return 0;
+	/*
+	 * For eMMC don't turn off Vqmmc, Instead just configure it in LPM
+	 * and HPM modes by setting the corresponding load.
+	 *
+	 * Till eMMC is initialized (i.e. always_on == 0), just turn on/off
+	 * Vqmmc. Vqmmc gets turned off only if init fails and mmc_power_off
+	 * gets invoked. Once eMMC is initialized (i.e. always_on == 1),
+	 * Vqmmc should remain ON, So just set the load instead of turning it
+	 * off/on.
+	 */
+	always_on = !mmc_card_is_removable(mmc) &&
+			mmc->card && mmc_card_mmc(mmc->card);
+
+	if (always_on)
+		ret = msm_config_vqmmc_mode(msm_host, mmc, level);
+	else
+		ret = msm_toggle_vqmmc(msm_host, mmc, level);
+
+	return ret;
+}
+
 static inline void sdhci_msm_init_pwr_irq_wait(struct sdhci_msm_host *msm_host)
 {
 	init_waitqueue_head(&msm_host->pwr_irq_wait);
@@ -1449,8 +1544,9 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 {
 	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
 	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_host *mmc = host->mmc;
 	u32 irq_status, irq_ack = 0;
-	int retry = 10;
+	int retry = 10, ret;
 	u32 pwr_state = 0, io_level = 0;
 	u32 config;
 	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
@@ -1488,21 +1584,42 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 	if (irq_status & CORE_PWRCTL_BUS_ON) {
 		pwr_state = REQ_BUS_ON;
 		io_level = REQ_IO_HIGH;
-		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
 	}
 	if (irq_status & CORE_PWRCTL_BUS_OFF) {
 		pwr_state = REQ_BUS_OFF;
 		io_level = REQ_IO_LOW;
-		irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
 	}
+
+	if (pwr_state) {
+		ret = sdhci_msm_set_vmmc(mmc);
+		if (!ret)
+			ret = sdhci_msm_set_vqmmc(msm_host, mmc,
+					pwr_state & REQ_BUS_ON);
+		if (!ret)
+			irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
+		else
+			irq_ack |= CORE_PWRCTL_BUS_FAIL;
+	}
+
 	/* Handle IO LOW/HIGH */
-	if (irq_status & CORE_PWRCTL_IO_LOW) {
+	if (irq_status & CORE_PWRCTL_IO_LOW)
 		io_level = REQ_IO_LOW;
-		irq_ack |= CORE_PWRCTL_IO_SUCCESS;
-	}
-	if (irq_status & CORE_PWRCTL_IO_HIGH) {
+
+	if (irq_status & CORE_PWRCTL_IO_HIGH)
 		io_level = REQ_IO_HIGH;
+
+	if (io_level)
 		irq_ack |= CORE_PWRCTL_IO_SUCCESS;
+
+	if (io_level && !IS_ERR(mmc->supply.vqmmc) && !pwr_state) {
+		ret = mmc_regulator_set_vqmmc(mmc, &mmc->ios);
+		if (ret < 0) {
+			dev_err(mmc_dev(mmc), "%s: IO_level setting failed(%d). signal_voltage: %d, vdd: %d irq_status: 0x%08x\n",
+					mmc_hostname(mmc), ret,
+					mmc->ios.signal_voltage, mmc->ios.vdd,
+					irq_status);
+			irq_ack |= CORE_PWRCTL_IO_FAIL;
+		}
 	}
 
 	/*
@@ -1551,7 +1668,7 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 	if (io_level)
 		msm_host->curr_io_level = io_level;
 
-	pr_debug("%s: %s: Handled IRQ(%d), irq_status=0x%x, ack=0x%x\n",
+	dev_dbg(mmc_dev(mmc), "%s: %s: Handled IRQ(%d), irq_status=0x%x, ack=0x%x\n",
 		mmc_hostname(msm_host->mmc), __func__, irq, irq_status,
 		irq_ack);
 }
@@ -1881,6 +1998,71 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+static int sdhci_msm_register_vreg(struct sdhci_msm_host *msm_host)
+{
+	int ret;
+
+	ret = mmc_regulator_get_supply(msm_host->mmc);
+	if (ret)
+		return ret;
+
+	sdhci_msm_set_regulator_caps(msm_host);
+
+	return 0;
+}
+
+static int sdhci_msm_start_signal_voltage_switch(struct mmc_host *mmc,
+				      struct mmc_ios *ios)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	u16 ctrl, status;
+
+	/*
+	 * Signal Voltage Switching is only applicable for Host Controllers
+	 * v3.00 and above.
+	 */
+	if (host->version < SDHCI_SPEC_300)
+		return 0;
+
+	ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
+
+	switch (ios->signal_voltage) {
+	case MMC_SIGNAL_VOLTAGE_330:
+		if (!(host->flags & SDHCI_SIGNALING_330))
+			return -EINVAL;
+
+		/* Set 1.8V Signal Enable in the Host Control2 register to 0 */
+		ctrl &= ~SDHCI_CTRL_VDD_180;
+		break;
+	case MMC_SIGNAL_VOLTAGE_180:
+		if (!(host->flags & SDHCI_SIGNALING_180))
+			return -EINVAL;
+
+		/* Enable 1.8V Signal Enable in the Host Control2 register */
+		ctrl |= SDHCI_CTRL_VDD_180;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
+
+	/* Wait for 5ms */
+	usleep_range(5000, 5500);
+
+	/* regulator output should be stable within 5 ms */
+	status = ctrl & SDHCI_CTRL_VDD_180;
+	ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
+	if ((ctrl & SDHCI_CTRL_VDD_180) == status)
+		return 0;
+
+	dev_warn(mmc_dev(mmc), "%s: Regulator output did not became stable\n",
+		mmc_hostname(mmc));
+
+	return -EAGAIN;
+}
+
 #define DRIVER_NAME "sdhci_msm"
 #define SDHCI_MSM_DUMP(f, x...) \
 	pr_err("%s: " DRIVER_NAME ": " f, mmc_hostname(host->mmc), ## x)
@@ -1967,6 +2149,7 @@ void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
 	.write_b = sdhci_msm_writeb,
 	.irq	= sdhci_msm_cqe_irq,
 	.dump_vendor_regs = sdhci_msm_dump_vendor_regs,
+	.set_power = sdhci_set_power_noreg,
 };
 
 static const struct sdhci_pltfm_data sdhci_msm_pdata = {
@@ -2181,6 +2364,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (core_major == 1 && core_minor >= 0x49)
 		msm_host->updated_ddr_cfg = true;
 
+	ret = sdhci_msm_register_vreg(msm_host);
+	if (ret)
+		goto clk_disable;
+
 	/*
 	 * Power on reset state may trigger power irq if previous status of
 	 * PWRCTL was either BUS_ON or IO_HIGH_V. So before enabling pwr irq
@@ -2225,6 +2412,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 					 MSM_MMC_AUTOSUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
 
+	host->mmc_host_ops.start_signal_voltage_switch =
+		sdhci_msm_start_signal_voltage_switch;
 	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
 	if (of_property_read_bool(node, "supports-cqe"))
 		ret = sdhci_msm_cqe_add_host(host, pdev);
@@ -2232,7 +2421,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 		ret = sdhci_add_host(host);
 	if (ret)
 		goto pm_runtime_disable;
-	sdhci_msm_set_regulator_caps(msm_host);
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

