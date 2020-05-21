Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD711DD18A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 17:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730296AbgEUPYS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 11:24:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:25758 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730316AbgEUPYO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 11:24:14 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590074653; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=abilVHcRe96eelslWKX/XNXJJR6Sa0xIlDety9B+swk=; b=cLzmgADhwhHPB41MoY/G0wXAbTQnvCwcapa9b8Ry1YWV8osXLPMA+r1BmYD8Je9fp1dJcaFV
 YsZLZ3uOP/QQ0/uReU+1cL1vGfNvZv8CI/Bj1lyVCrY3L1ZK69aql1lXUvEAfjJA1ogk/vmT
 hLczhciZia9d6n0wkssqhTBuiIY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5ec69d1d4c3faf51e27bacb3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 May 2020 15:24:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 30E05C433AF; Thu, 21 May 2020 15:24:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from vbadigan-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C4180C433C9;
        Thu, 21 May 2020 15:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4180C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
To:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Vijay Viswanath <vviswana@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Subject: [PATCH V2 2/3] mmc: sdhci-msm: Use internal voltage control
Date:   Thu, 21 May 2020 20:53:34 +0530
Message-Id: <1590074615-10787-3-git-send-email-vbadigan@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1590074615-10787-1-git-send-email-vbadigan@codeaurora.org>
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1590074615-10787-1-git-send-email-vbadigan@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On qcom SD host controllers voltage switching be done after the HW
is ready for it. The HW informs its readiness through power irq.
The voltage switching should happen only then.

Use the internal voltage switching and then control the voltage
switching using power irq.

Set the regulator load as well so that regulator can be configured
in LPM mode when in is not being used.

Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Co-developed-by: Vijay Viswanath <vviswana@codeaurora.org>
Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
Co-developed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
---
 drivers/mmc/host/sdhci-msm.c | 207 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 198 insertions(+), 9 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 97758fa..6211ab4 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -36,7 +36,9 @@
 #define CORE_PWRCTL_IO_LOW	BIT(2)
 #define CORE_PWRCTL_IO_HIGH	BIT(3)
 #define CORE_PWRCTL_BUS_SUCCESS BIT(0)
+#define CORE_PWRCTL_BUS_FAIL    BIT(1)
 #define CORE_PWRCTL_IO_SUCCESS	BIT(2)
+#define CORE_PWRCTL_IO_FAIL     BIT(3)
 #define REQ_BUS_OFF		BIT(0)
 #define REQ_BUS_ON		BIT(1)
 #define REQ_IO_LOW		BIT(2)
@@ -263,6 +265,8 @@ struct sdhci_msm_host {
 	bool use_cdr;
 	u32 transfer_mode;
 	bool updated_ddr_cfg;
+	u32 vqmmc_load;
+	bool vqmmc_enabled;
 };
 
 static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
@@ -1298,6 +1302,71 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
 		sdhci_msm_hs400(host, &mmc->ios);
 }
 
+static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
+{
+	int ret;
+
+	if (IS_ERR(mmc->supply.vmmc))
+		return 0;
+
+	ret = mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
+	if (ret)
+		dev_err(mmc_dev(mmc), "%s: vmmc set ocr with vdd=%d failed: %d\n",
+			mmc_hostname(mmc), mmc->ios.vdd, ret);
+
+	return ret;
+}
+
+static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
+			      struct mmc_host *mmc, bool level)
+{
+	int load, ret;
+	struct mmc_ios ios;
+
+	if (IS_ERR(mmc->supply.vqmmc)			 ||
+	    (mmc->ios.power_mode == MMC_POWER_UNDEFINED) ||
+	    (msm_host->vqmmc_enabled == level))
+		return 0;
+
+	if (msm_host->vqmmc_load) {
+		load = level ? msm_host->vqmmc_load : 0;
+		ret = regulator_set_load(mmc->supply.vqmmc, load);
+		if (ret) {
+			dev_err(mmc_dev(mmc), "%s: vqmmc set load failed: %d\n",
+				mmc_hostname(mmc), ret);
+			goto out;
+		}
+	}
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
 static inline void sdhci_msm_init_pwr_irq_wait(struct sdhci_msm_host *msm_host)
 {
 	init_waitqueue_head(&msm_host->pwr_irq_wait);
@@ -1401,8 +1470,9 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
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
@@ -1440,21 +1510,42 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
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
@@ -1503,7 +1594,7 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
 	if (io_level)
 		msm_host->curr_io_level = io_level;
 
-	pr_debug("%s: %s: Handled IRQ(%d), irq_status=0x%x, ack=0x%x\n",
+	dev_dbg(mmc_dev(mmc), "%s: %s: Handled IRQ(%d), irq_status=0x%x, ack=0x%x\n",
 		mmc_hostname(msm_host->mmc), __func__, irq, irq_status,
 		irq_ack);
 }
@@ -1833,6 +1924,98 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
 	sdhci_reset(host, mask);
 }
 
+static int sdhci_msm_register_vreg(struct sdhci_msm_host *msm_host)
+{
+	int ret;
+	u32 vmmc_load;
+	struct mmc_host *mmc = msm_host->mmc;
+
+	ret = mmc_regulator_get_supply(msm_host->mmc);
+	if (ret)
+		return ret;
+	device_property_read_u32(&msm_host->pdev->dev,
+			"vmmc-max-load-microamp",
+			&vmmc_load);
+	device_property_read_u32(&msm_host->pdev->dev,
+			"vqmmc-max-load-microamp",
+			&msm_host->vqmmc_load);
+
+	/* Vmmc regulator can be turned off. So just set active load once */
+	if (!IS_ERR(mmc->supply.vmmc) && vmmc_load) {
+		ret = regulator_set_load(mmc->supply.vmmc, vmmc_load);
+		if (ret) {
+			dev_err(mmc_dev(mmc), "%s: vmmc set active load failed: %d\n",
+				mmc_hostname(mmc), ret);
+			return ret;
+		}
+	}
+
+	sdhci_msm_set_regulator_caps(msm_host);
+	mmc->ios.power_mode = MMC_POWER_UNDEFINED;
+
+	return 0;
+
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
+		/*
+		 * Enable 1.8V Signal Enable in the Host Control2
+		 * register
+		 */
+		ctrl |= SDHCI_CTRL_VDD_180;
+		break;
+	case MMC_SIGNAL_VOLTAGE_120:
+		if (!(host->flags & SDHCI_SIGNALING_120))
+			return -EINVAL;
+		return 0;
+	default:
+		/* No signal voltage switch required */
+		return 0;
+	}
+
+	sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
+
+	/* Wait for 5ms */
+	usleep_range(5000, 5500);
+
+	/* regulator output should be stable within 5 ms */
+	status = !!(ctrl & SDHCI_CTRL_VDD_180);
+	ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
+	if (!!(ctrl &  SDHCI_CTRL_VDD_180) == status)
+		return 0;
+
+	dev_warn(mmc_dev(mmc), "%s: Regulator output did not became stable\n",
+		mmc_hostname(mmc));
+
+	return -EAGAIN;
+}
+
 static const struct sdhci_msm_variant_ops mci_var_ops = {
 	.msm_readl_relaxed = sdhci_msm_mci_variant_readl_relaxed,
 	.msm_writel_relaxed = sdhci_msm_mci_variant_writel_relaxed,
@@ -1880,6 +2063,7 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
 	.write_w = sdhci_msm_writew,
 	.write_b = sdhci_msm_writeb,
 	.irq	= sdhci_msm_cqe_irq,
+	.set_power = sdhci_set_power_noreg,
 };
 
 static const struct sdhci_pltfm_data sdhci_msm_pdata = {
@@ -2072,6 +2256,10 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 	if (core_major == 1 && core_minor >= 0x49)
 		msm_host->updated_ddr_cfg = true;
 
+	ret = sdhci_msm_register_vreg(msm_host);
+	if (ret)
+		goto clk_disable;
+
 	/*
 	 * Power on reset state may trigger power irq if previous status of
 	 * PWRCTL was either BUS_ON or IO_HIGH_V. So before enabling pwr irq
@@ -2116,6 +2304,8 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 					 MSM_MMC_AUTOSUSPEND_DELAY_MS);
 	pm_runtime_use_autosuspend(&pdev->dev);
 
+	host->mmc_host_ops.start_signal_voltage_switch =
+		sdhci_msm_start_signal_voltage_switch;
 	host->mmc_host_ops.execute_tuning = sdhci_msm_execute_tuning;
 	if (of_property_read_bool(node, "supports-cqe"))
 		ret = sdhci_msm_cqe_add_host(host, pdev);
@@ -2123,7 +2313,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 		ret = sdhci_add_host(host);
 	if (ret)
 		goto pm_runtime_disable;
-	sdhci_msm_set_regulator_caps(msm_host);
 
 	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project

