Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00617210C6D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 15:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730388AbgGANlw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 09:41:52 -0400
Received: from mga07.intel.com ([134.134.136.100]:17360 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729332AbgGANlv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 09:41:51 -0400
IronPort-SDR: ogiZlWgCtkAG3dYQ5Ra77EuoLG+lPPocwvpVKhGii/u7277xgm01ymFKxOavk2MXvI+JCFQXHh
 AuxzcvQJ+jhA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="211624735"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="211624735"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 06:41:50 -0700
IronPort-SDR: y78nLwfsdpJbnAS2IIQTIYDWwIwPPhqTyS2nGsXesMWmQ0ZxIrtmfHWQrSd9dMoD8gTlseDBAg
 qKu4zpnuE/BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="313776140"
Received: from ahunter-desktop.fi.intel.com (HELO [10.237.72.73]) ([10.237.72.73])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2020 06:41:42 -0700
Subject: Re: [PATCH v6 3/4] mmc: mediatek: command queue support
To:     Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Chaotian Jing <chaotian.jing@mediatek.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Pan Bian <bianpan2016@163.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Allison Randal <allison@lohutok.net>,
        Mathieu Malaterre <malat@debian.org>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Kuohong Wang <kuohong.wang@mediatek.com>
Cc:     kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
 <1591665502-6573-4-git-send-email-chun-hung.wu@mediatek.com>
From:   Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
Message-ID: <3c36a73a-a292-daae-baf6-19b3e3d7b208@intel.com>
Date:   Wed, 1 Jul 2020 16:41:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <1591665502-6573-4-git-send-email-chun-hung.wu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/06/20 4:18 am, Chun-Hung Wu wrote:
> Support command queue for mt6779 platform.
> a. Add msdc_set_busy_timeout() to calculate emmc write timeout.
> b. Connect mtk msdc driver to cqhci driver through
>    host->cq_host->ops = &msdc_cmdq_ops;
> c. msdc_cmdq_irq() will link up with cqchi_irq(). Besides, it provides
>    more irq error messages like RSPCRCERR/CMDTO/DATACRCERR/DATTMO.
> d. Use the options below to separate support for CQHCI or not, because
>    some of our platform does not support CQHCI hence no kernel option:
>    CONFIG_MMC_CQHCI.
>    #if IS_ENABLED(CONFIG_MMC_CQHCI)
>    XXX //Support CQHCI
>    #else
>    XXX //Not support CQHCI
>    #endif

Other drivers "select MMC_CQHCI" in Kconfig even though they support
hardware with or without CQHCI.

> 
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 119 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 84a7bd44..9d69269 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -31,6 +31,8 @@
>  #include <linux/mmc/sdio.h>
>  #include <linux/mmc/slot-gpio.h>
>  
> +#include "cqhci.h"
> +
>  #define MAX_BD_NUM          1024
>  
>  /*--------------------------------------------------------------------------*/
> @@ -152,6 +154,7 @@
>  #define MSDC_INT_DMA_BDCSERR    (0x1 << 17)	/* W1C */
>  #define MSDC_INT_DMA_GPDCSERR   (0x1 << 18)	/* W1C */
>  #define MSDC_INT_DMA_PROTECT    (0x1 << 19)	/* W1C */
> +#define MSDC_INT_CMDQ           (0x1 << 28)	/* W1C */
>  
>  /* MSDC_INTEN mask */
>  #define MSDC_INTEN_MMCIRQ       (0x1 << 0)	/* RW */
> @@ -182,6 +185,7 @@
>  /* SDC_CFG mask */
>  #define SDC_CFG_SDIOINTWKUP     (0x1 << 0)	/* RW */
>  #define SDC_CFG_INSWKUP         (0x1 << 1)	/* RW */
> +#define SDC_CFG_WRDTOC          (0x1fff  << 2)  /* RW */
>  #define SDC_CFG_BUSWIDTH        (0x3 << 16)	/* RW */
>  #define SDC_CFG_SDIO            (0x1 << 19)	/* RW */
>  #define SDC_CFG_SDIOIDE         (0x1 << 20)	/* RW */
> @@ -230,6 +234,7 @@
>  #define MSDC_PATCH_BIT_DECRCTMO   (0x1 << 30)	/* RW */
>  
>  #define MSDC_PATCH_BIT1_CMDTA     (0x7 << 3)    /* RW */
> +#define MSDC_PB1_BUSY_CHECK_SEL   (0x1 << 7)    /* RW */
>  #define MSDC_PATCH_BIT1_STOP_DLY  (0xf << 8)    /* RW */
>  
>  #define MSDC_PATCH_BIT2_CFGRESP   (0x1 << 15)   /* RW */
> @@ -431,9 +436,11 @@ struct msdc_host {
>  				 /* cmd response sample selection for HS400 */
>  	bool hs400_mode;	/* current eMMC will run at hs400 mode */
>  	bool internal_cd;	/* Use internal card-detect logic */
> +	bool cqhci;		/* support eMMC hw cmdq */
>  	struct msdc_save_para save_para; /* used when gate HCLK */
>  	struct msdc_tune_para def_tune_para; /* default tune setting */
>  	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
> +	struct cqhci_host *cq_host;
>  };
>  
>  static const struct mtk_mmc_compatible mt8135_compat = {
> @@ -764,6 +771,15 @@ static void msdc_set_timeout(struct msdc_host *host, u64 ns, u64 clks)
>  		      (u32)(timeout > 255 ? 255 : timeout));
>  }
>  
> +static void msdc_set_busy_timeout(struct msdc_host *host, u64 ns, u64 clks)
> +{
> +	u64 timeout;
> +
> +	timeout = msdc_timeout_cal(host, ns, clks);
> +	sdr_set_field(host->base + SDC_CFG, SDC_CFG_WRDTOC,
> +		      (u32)(timeout > 8191 ? 8191 : timeout));
> +}
> +
>  static void msdc_gate_clock(struct msdc_host *host)
>  {
>  	clk_disable_unprepare(host->src_clk_cg);
> @@ -1480,6 +1496,36 @@ static void msdc_enable_sdio_irq(struct mmc_host *mmc, int enb)
>  		pm_runtime_put_noidle(host->dev);
>  }
>  
> +#if IS_ENABLED(CONFIG_MMC_CQHCI)
> +static irqreturn_t msdc_cmdq_irq(struct msdc_host *host, u32 intsts)
> +{
> +	int cmd_err = 0, dat_err = 0;
> +
> +	if (intsts & MSDC_INT_RSPCRCERR) {
> +		cmd_err = -EILSEQ;
> +		dev_err(host->dev, "%s: CMD CRC ERR", __func__);
> +	} else if (intsts & MSDC_INT_CMDTMO) {
> +		cmd_err = -ETIMEDOUT;
> +		dev_err(host->dev, "%s: CMD TIMEOUT ERR", __func__);
> +	}
> +
> +	if (intsts & MSDC_INT_DATCRCERR) {
> +		dat_err = -EILSEQ;
> +		dev_err(host->dev, "%s: DATA CRC ERR", __func__);
> +	} else if (intsts & MSDC_INT_DATTMO) {
> +		dat_err = -ETIMEDOUT;
> +		dev_err(host->dev, "%s: DATA TIMEOUT ERR", __func__);
> +	}
> +
> +	if (cmd_err || dat_err) {
> +		dev_err(host->dev, "cmd_err = %d, dat_err =%d, intsts = 0x%x",
> +			cmd_err, dat_err, intsts);
> +	}
> +
> +	return cqhci_irq(host->mmc, 0, cmd_err, dat_err);
> +}
> +#endif
> +
>  static irqreturn_t msdc_irq(int irq, void *dev_id)
>  {
>  	struct msdc_host *host = (struct msdc_host *) dev_id;
> @@ -1516,6 +1562,16 @@ static irqreturn_t msdc_irq(int irq, void *dev_id)
>  		if (!(events & (event_mask & ~MSDC_INT_SDIOIRQ)))
>  			break;
>  
> +#if IS_ENABLED(CONFIG_MMC_CQHCI)
> +		if ((host->mmc->caps2 & MMC_CAP2_CQE) &&
> +		    (events & MSDC_INT_CMDQ)) {
> +			msdc_cmdq_irq(host, events);
> +			/* clear interrupts */
> +			writel(events, host->base + MSDC_INT);
> +			return IRQ_HANDLED;
> +		}
> +#endif
> +
>  		if (!mrq) {
>  			dev_err(host->dev,
>  				"%s: MRQ=NULL; events=%08X; event_mask=%08X\n",
> @@ -2200,6 +2256,36 @@ static int msdc_get_cd(struct mmc_host *mmc)
>  		return !val;
>  }
>  
> +static void msdc_cqe_enable(struct mmc_host *mmc)
> +{
> +	struct msdc_host *host = mmc_priv(mmc);
> +
> +	/* enable cmdq irq */
> +	writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
> +	/* enable busy check */
> +	sdr_set_bits(host->base + MSDC_PATCH_BIT1, MSDC_PB1_BUSY_CHECK_SEL);
> +	/* default write data / busy timeout 20s */
> +	msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
> +	/* default read data timeout 1s */
> +	msdc_set_timeout(host, 1000000000ULL, 0);
> +}
> +
> +void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
> +{
> +	struct msdc_host *host = mmc_priv(mmc);
> +
> +	/* disable cmdq irq */
> +	sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INT_CMDQ);
> +	/* disable busy check */
> +	sdr_clr_bits(host->base + MSDC_PATCH_BIT1, MSDC_PB1_BUSY_CHECK_SEL);
> +
> +	if (recovery) {
> +		sdr_set_field(host->base + MSDC_DMA_CTRL,
> +			      MSDC_DMA_CTRL_STOP, 1);
> +		msdc_reset_hw(host);
> +	}
> +}
> +
>  static const struct mmc_host_ops mt_msdc_ops = {
>  	.post_req = msdc_post_req,
>  	.pre_req = msdc_pre_req,
> @@ -2216,6 +2302,11 @@ static int msdc_get_cd(struct mmc_host *mmc)
>  	.hw_reset = msdc_hw_reset,
>  };
>  
> +static const struct cqhci_host_ops msdc_cmdq_ops = {
> +	.enable         = msdc_cqe_enable,
> +	.disable        = msdc_cqe_disable,
> +};
> +
>  static void msdc_of_property_parse(struct platform_device *pdev,
>  				   struct msdc_host *host)
>  {
> @@ -2236,6 +2327,12 @@ static void msdc_of_property_parse(struct platform_device *pdev,
>  		host->hs400_cmd_resp_sel_rising = true;
>  	else
>  		host->hs400_cmd_resp_sel_rising = false;
> +
> +	if (of_property_read_bool(pdev->dev.of_node,
> +				  "mediatek,cqhci"))
> +		host->cqhci = true;
> +	else
> +		host->cqhci = false;
>  }
>  
>  static int msdc_drv_probe(struct platform_device *pdev)
> @@ -2351,6 +2448,8 @@ static int msdc_drv_probe(struct platform_device *pdev)
>  		mmc->caps2 |= MMC_CAP2_SDIO_IRQ_NOTHREAD;
>  
>  	mmc->caps |= MMC_CAP_ERASE | MMC_CAP_CMD23;
> +	if (host->cqhci)
> +		mmc->caps2 |= MMC_CAP2_CQE | MMC_CAP2_CQE_DCMD;
>  	/* MMC core transfer sizes tunable parameters */
>  	mmc->max_segs = MAX_BD_NUM;
>  	if (host->dev_comp->support_64g)
> @@ -2366,6 +2465,26 @@ static int msdc_drv_probe(struct platform_device *pdev)
>  		host->dma_mask = DMA_BIT_MASK(32);
>  	mmc_dev(mmc)->dma_mask = &host->dma_mask;
>  
> +#if IS_ENABLED(CONFIG_MMC_CQHCI)
> +	if (mmc->caps2 & MMC_CAP2_CQE) {
> +		host->cq_host = devm_kzalloc(host->mmc->parent,
> +					     sizeof(*host->cq_host),
> +					     GFP_KERNEL);
> +		if (!host->cq_host) {
> +			ret = -ENOMEM;
> +			goto host_free;
> +		}
> +		host->cq_host->caps |= CQHCI_TASK_DESC_SZ_128;
> +		host->cq_host->mmio = host->base + 0x800;
> +		host->cq_host->ops = &msdc_cmdq_ops;
> +		cqhci_init(host->cq_host, mmc, true);

cqhci_init() can return an error.

> +		mmc->max_segs = 128;
> +		/* cqhci 16bit length */
> +		/* 0 size, means 65536 so we don't have to -1 here */
> +		mmc->max_seg_size = 64 * 1024;
> +	}
> +#endif
> +
>  	host->timeout_clks = 3 * 1048576;
>  	host->dma.gpd = dma_alloc_coherent(&pdev->dev,
>  				2 * sizeof(struct mt_gpdma_desc),
> 

