Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D354E1F39AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 13:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgFIL2q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 07:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727017AbgFIL2m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 07:28:42 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC450C05BD1E;
        Tue,  9 Jun 2020 04:28:41 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id e1so20906465wrt.5;
        Tue, 09 Jun 2020 04:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Wv1KQ5fDwzvCL7klQbnh2wel3Uw0e3luPyw/9ylWfE4=;
        b=W3B+lIkYwdi6QiofX1iUSrrDBLhvdB0ys9xrIn82NAAyUzlhFd6OZRVpGSxBWu7r0m
         ClFQQp6tFkS2FihvNemUM/Ygs/B7NeGPqh0H7SND1VjB249FAq78uy/O+bT+K3urTmaz
         i2stcm+Bgg4niCuTKHGOpHMgGIbnWoKm9KoWsg+BM8iv01VeHKu4Px+8b4DMuaP4O+5L
         qGEcELs+shgGYZylmLuY2kyPMXusnDx48cDfY+WiuyHuw6lrB2zHfXi7wSyD5w/mOC9S
         yqpwGfr9k1m0WBkkTl6+HtTnHYu7JI93XM2uEhbPOUNrsvErBirLPnDKbo5E8UA7Y90O
         2mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Wv1KQ5fDwzvCL7klQbnh2wel3Uw0e3luPyw/9ylWfE4=;
        b=BQIXx5CsHlZ16E26/isCZFAs0V+/nXX0vc+jGpQTETbwDO+4PluisiYDFRSBPyy2TB
         qWpkxj5fXkC3zYkBYONrXY0ZZUk+fJ2XkR0EURbv45KPN1Is0GUhWtGtzEUtcRBC+GtA
         edD2oSJo+ZY8Y328rxiUyKm2qZfO+X77wmkseMIEnoc27DBSpXhcwaXTVDGxwTeTYFUn
         By1IFXY8nnA8iLVqofMIDmT6BBFSygcZD7jUNLEc2y5+LS4+IFV+scetJWHYQvwI/p6g
         7hu+aXrgb4F6aih2kKdkTkuQXM/0xp02THwBz+lyi9o2Xsou1USSTX5qthUJ6oS5toHO
         ULOA==
X-Gm-Message-State: AOAM532q4RT/hHRtcty8ttgYdafm0mD9YLr4ajAwTj77edPQDqI9RvlJ
        5c44oaW3ExhpnEV1deQzwifdPTYT
X-Google-Smtp-Source: ABdhPJy529EcE6IuzhjftgsDXuphdW0GgPrYJkeQltCYlT85bnO6RVLOf/QF8BPMM3gJNvILg9cDsA==
X-Received: by 2002:adf:ff82:: with SMTP id j2mr3745444wrr.375.1591702119728;
        Tue, 09 Jun 2020 04:28:39 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.138])
        by smtp.gmail.com with ESMTPSA id c6sm3064947wro.92.2020.06.09.04.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2020 04:28:38 -0700 (PDT)
Subject: Re: [PATCH v6 3/4] mmc: mediatek: command queue support
To:     Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Al Cooper <alcooperx@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
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
From:   Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <41a6af77-cd90-5a1a-7405-cec003e7abb6@gmail.com>
Date:   Tue, 9 Jun 2020 13:28:36 +0200
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



On 09/06/2020 03:18, Chun-Hung Wu wrote:
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
> 

I think that we don't need the #if IS_ENABLED() because we add a boolean in the
msdc_host.

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

Does this mean that there are mt6779 contoller which do not support cqhci?
Otherwise could add the boolean in struct mtk_mmc_compatible and get rid of the
device tree requirement.

Regards,
Matthias
