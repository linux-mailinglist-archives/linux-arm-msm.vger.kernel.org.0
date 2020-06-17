Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6621FC9EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 11:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbgFQJe5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 05:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725773AbgFQJe5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 05:34:57 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8A09C061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 02:34:56 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id q10so401993vka.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GElPlr4lJptb9haWfXsqgG+Q3T74SPQGKuT2+25d/Nc=;
        b=QgQpD47EWWGn3dViPCny8k+6WhHaILSZY0/MwFhsYwBOSJCjNtgNPRyTIXYTqc2mei
         +iNnzZGquoFA7RaXy5sTjcEWTKtT1m/Ae9HmOrVdqf3t3rWnJlEgWQFaizBuCbNuzu5b
         jaXfyL0Bwi5qZSa112rI6nvLcHcTIrhOkXbkZtFRa17t1bwDwMpCKSAoezKR23fAA7Hv
         0ahaiB72cdyx1NKQWiB/G4cT2NXmVqXYAe4l/8jErtRqcF3y59xG6n0snbqSgKRyMnOA
         xSWDAkrqU30dz+uAis99wVemzxgyP+OMkMFHAoEfRsMn1Fkvjqm5WrhAzn079Qj+wp7R
         OwVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GElPlr4lJptb9haWfXsqgG+Q3T74SPQGKuT2+25d/Nc=;
        b=YIwm/hiAq7DnVLUa8AbDctf7T9+NxJNZs2FmPVcnzMKUi7pN/Ns0nT6TbK9P6tRNs1
         fLfer8zatWpYUskTWR39NpucWkXe/H35IhhIlWDn+Ls0u21IoSVRSTpE1aL/w/5ONvPU
         5r0SA4rLjlWehW+cN4EkCv7dhM+uJkJLloe8zXhXJl66GUBu0hU7eGWELRvadDx61GCk
         58APJHg7ydy46GaJLw9awMMISuddEN7UOUzMl7muXThl1xlgy9xdRT2ci4k+D3kjtf49
         pEy+smt7TAVTVk08bGLQLpN6bMF8GJuHdroOZwnPYXk/ZVqhlJi/JY3LxL28Vb+6WRcA
         vI+Q==
X-Gm-Message-State: AOAM530jHqU/vkL5cJDkiB6xkJSHuj0WFuyewDTbcPjHLMzqcmGZY1Zo
        0E0IpvhvGw6psxKR1GSd8gg4kQ0zCCvWMvsckhqJmw==
X-Google-Smtp-Source: ABdhPJyWfY/1iZalb3biUwsuKAh8amAEWBGwJk3uxqggu/gWXUmxylnDmUw4zphUCGFtqET/Yy5v92yP81jRMfmlP0c=
X-Received: by 2002:ac5:cc44:: with SMTP id l4mr4804956vkm.43.1592386495719;
 Wed, 17 Jun 2020 02:34:55 -0700 (PDT)
MIME-Version: 1.0
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1592321779-28556-1-git-send-email-vbadigan@codeaurora.org> <1592321779-28556-3-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1592321779-28556-3-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 17 Jun 2020 11:34:19 +0200
Message-ID: <CAPDyKFrvvhQPio3FRQmoBgMm1Euvsma_dgGzxA=R8rm0aQgDMQ@mail.gmail.com>
Subject: Re: [PATCH V4 2/2] mmc: sdhci-msm: Use internal voltage control
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Vijay Viswanath <vviswana@codeaurora.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 16 Jun 2020 at 17:38, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> On qcom SD host controllers voltage switching be done after the HW
> is ready for it. The HW informs its readiness through power irq.
> The voltage switching should happen only then.
>
> Use the internal voltage switching and then control the voltage
> switching using power irq.
>
> IO-bus supply of eMMC would be kept always-on. So set the load
> for this supply to configure it in LPM when eMMC is suspend state
>  and in HPM when eMMC is active.
>
> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Co-developed-by: Vijay Viswanath <vviswana@codeaurora.org>
> Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
> Co-developed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 208 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 199 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 15c42b059240..8297b2142748 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -37,7 +37,9 @@
>  #define CORE_PWRCTL_IO_LOW     BIT(2)
>  #define CORE_PWRCTL_IO_HIGH    BIT(3)
>  #define CORE_PWRCTL_BUS_SUCCESS BIT(0)
> +#define CORE_PWRCTL_BUS_FAIL    BIT(1)
>  #define CORE_PWRCTL_IO_SUCCESS BIT(2)
> +#define CORE_PWRCTL_IO_FAIL     BIT(3)
>  #define REQ_BUS_OFF            BIT(0)
>  #define REQ_BUS_ON             BIT(1)
>  #define REQ_IO_LOW             BIT(2)
> @@ -127,6 +129,9 @@
>  /* Timeout value to avoid infinite waiting for pwr_irq */
>  #define MSM_PWR_IRQ_TIMEOUT_MS 5000
>
> +/* Max load for eMMC Vdd-io supply */
> +#define MMC_VQMMC_MAX_LOAD_UA  325000
> +
>  #define msm_host_readl(msm_host, host, offset) \
>         msm_host->var_ops->msm_readl_relaxed(host, offset)
>
> @@ -278,6 +283,7 @@ struct sdhci_msm_host {
>         bool uses_tassadar_dll;
>         u32 dll_config;
>         u32 ddr_config;
> +       bool vqmmc_enabled;
>  };
>
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> @@ -1346,6 +1352,88 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
>                 sdhci_msm_hs400(host, &mmc->ios);
>  }
>
> +static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
> +{
> +       if (IS_ERR(mmc->supply.vmmc))
> +               return 0;
> +
> +       return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
> +}
> +
> +static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
> +                             struct mmc_host *mmc, bool level)
> +{
> +       int ret;
> +       struct mmc_ios ios;
> +
> +       if (msm_host->vqmmc_enabled == level)
> +               return 0;
> +
> +       if (level) {
> +               /* Set the IO voltage regulator to default voltage level */
> +               if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
> +                       ios.signal_voltage = MMC_SIGNAL_VOLTAGE_330;
> +               else if (msm_host->caps_0 & CORE_1_8V_SUPPORT)
> +                       ios.signal_voltage = MMC_SIGNAL_VOLTAGE_180;
> +
> +               if (msm_host->caps_0 & CORE_VOLT_SUPPORT) {
> +                       ret = mmc_regulator_set_vqmmc(mmc, &ios);
> +                       if (ret < 0) {
> +                               dev_err(mmc_dev(mmc), "%s: vqmmc set volgate failed: %d\n",
> +                                       mmc_hostname(mmc), ret);
> +                               goto out;
> +                       }
> +               }
> +               ret = regulator_enable(mmc->supply.vqmmc);
> +       } else {
> +               ret = regulator_disable(mmc->supply.vqmmc);
> +       }
> +
> +       if (ret)
> +               dev_err(mmc_dev(mmc), "%s: vqmm %sable failed: %d\n",
> +                       mmc_hostname(mmc), level ? "en":"dis", ret);
> +       else
> +               msm_host->vqmmc_enabled = level;
> +out:
> +       return ret;
> +}
> +
> +static int msm_config_vqmmc_mode(struct sdhci_msm_host *msm_host,
> +                             struct mmc_host *mmc, bool hpm)
> +{
> +       int load, ret;
> +
> +       load = hpm ? MMC_VQMMC_MAX_LOAD_UA : 0;
> +       ret = regulator_set_load(mmc->supply.vqmmc, load);
> +       if (ret)
> +               dev_err(mmc_dev(mmc), "%s: vqmmc set load failed: %d\n",
> +                       mmc_hostname(mmc), ret);
> +       return ret;
> +}
> +
> +static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
> +                             struct mmc_host *mmc, bool level)
> +{
> +       int ret;
> +       bool always_on;
> +
> +       if (IS_ERR(mmc->supply.vqmmc)           ||

White space.

> +           (mmc->ios.power_mode == MMC_POWER_UNDEFINED))
> +               return 0;
> +       /*
> +        * For eMMC don't turn off Vqmmc, Instead just configure it in LPM
> +        * and HPM modes by setting the right amonut of load.

/s/right amonut of load/corresponding load

> +        */
> +       always_on = mmc->card && mmc_card_mmc(mmc->card);
> +
> +       if (always_on)
> +               ret = msm_config_vqmmc_mode(msm_host, mmc, level);
> +       else
> +               ret = msm_toggle_vqmmc(msm_host, mmc, level);

I am worried that this isn't really doing what you think it does.
always_on may not always be set for an eMMC.

This is because the mmc->card doesn't get assigned until the
initialization of the eMMC has been completed. In other words, way
after VCC and VCCQ have been turned on and changed voltage levels.

Moreover, mmc_card_mmc() is also about legacy MMC cards, not solely for eMMCs.

If you want special treatment of an eMMC, I think it's better to use
the DT bindings Documentation/devicetree/bindings/mmc/mmc-card.txt. If
you have such a subnode, that indicates that there is an eMMC card
attached.

> +
> +       return ret;
> +}
> +
>  static inline void sdhci_msm_init_pwr_irq_wait(struct sdhci_msm_host *msm_host)
>  {
>         init_waitqueue_head(&msm_host->pwr_irq_wait);
> @@ -1449,8 +1537,9 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>  {
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +       struct mmc_host *mmc = host->mmc;
>         u32 irq_status, irq_ack = 0;
> -       int retry = 10;
> +       int retry = 10, ret;
>         u32 pwr_state = 0, io_level = 0;
>         u32 config;
>         const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> @@ -1488,21 +1577,42 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>         if (irq_status & CORE_PWRCTL_BUS_ON) {
>                 pwr_state = REQ_BUS_ON;
>                 io_level = REQ_IO_HIGH;
> -               irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
>         }
>         if (irq_status & CORE_PWRCTL_BUS_OFF) {
>                 pwr_state = REQ_BUS_OFF;
>                 io_level = REQ_IO_LOW;
> -               irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
>         }
> +
> +       if (pwr_state) {
> +               ret = sdhci_msm_set_vmmc(mmc);
> +               if (!ret)
> +                       ret = sdhci_msm_set_vqmmc(msm_host, mmc,
> +                                       pwr_state & REQ_BUS_ON);
> +               if (!ret)
> +                       irq_ack |= CORE_PWRCTL_BUS_SUCCESS;
> +               else
> +                       irq_ack |= CORE_PWRCTL_BUS_FAIL;
> +       }
> +
>         /* Handle IO LOW/HIGH */
> -       if (irq_status & CORE_PWRCTL_IO_LOW) {
> +       if (irq_status & CORE_PWRCTL_IO_LOW)
>                 io_level = REQ_IO_LOW;
> -               irq_ack |= CORE_PWRCTL_IO_SUCCESS;
> -       }
> -       if (irq_status & CORE_PWRCTL_IO_HIGH) {
> +
> +       if (irq_status & CORE_PWRCTL_IO_HIGH)
>                 io_level = REQ_IO_HIGH;
> +
> +       if (io_level)
>                 irq_ack |= CORE_PWRCTL_IO_SUCCESS;
> +
> +       if (io_level && !IS_ERR(mmc->supply.vqmmc) && !pwr_state) {
> +               ret = mmc_regulator_set_vqmmc(mmc, &mmc->ios);
> +               if (ret < 0) {
> +                       dev_err(mmc_dev(mmc), "%s: IO_level setting failed(%d). signal_voltage: %d, vdd: %d irq_status: 0x%08x\n",
> +                                       mmc_hostname(mmc), ret,
> +                                       mmc->ios.signal_voltage, mmc->ios.vdd,
> +                                       irq_status);
> +                       irq_ack |= CORE_PWRCTL_IO_FAIL;
> +               }
>         }
>
>         /*
> @@ -1551,7 +1661,7 @@ static void sdhci_msm_handle_pwr_irq(struct sdhci_host *host, int irq)
>         if (io_level)
>                 msm_host->curr_io_level = io_level;
>
> -       pr_debug("%s: %s: Handled IRQ(%d), irq_status=0x%x, ack=0x%x\n",
> +       dev_dbg(mmc_dev(mmc), "%s: %s: Handled IRQ(%d), irq_status=0x%x, ack=0x%x\n",
>                 mmc_hostname(msm_host->mmc), __func__, irq, irq_status,
>                 irq_ack);
>  }
> @@ -1881,6 +1991,80 @@ static void sdhci_msm_reset(struct sdhci_host *host, u8 mask)
>         sdhci_reset(host, mask);
>  }
>
> +static int sdhci_msm_register_vreg(struct sdhci_msm_host *msm_host)
> +{
> +       int ret;
> +       struct mmc_host *mmc = msm_host->mmc;
> +
> +       ret = mmc_regulator_get_supply(msm_host->mmc);
> +       if (ret)
> +               return ret;
> +
> +       sdhci_msm_set_regulator_caps(msm_host);
> +       mmc->ios.power_mode = MMC_POWER_UNDEFINED;

The mmc core already sets the initial "power_mode" to
MMC_POWER_UNDEFINED in mmc_start_host().

If I understand correctly, that may be too late for you. Then, let's
move that to mmc_alloc_host() instead, rather than having this done
here.

> +
> +       return 0;
> +}
> +
> +static int sdhci_msm_start_signal_voltage_switch(struct mmc_host *mmc,
> +                                     struct mmc_ios *ios)
> +{
> +       struct sdhci_host *host = mmc_priv(mmc);
> +       u16 ctrl, status;
> +
> +       /*
> +        * Signal Voltage Switching is only applicable for Host Controllers
> +        * v3.00 and above.
> +        */
> +       if (host->version < SDHCI_SPEC_300)
> +               return 0;
> +
> +       ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
> +
> +       switch (ios->signal_voltage) {
> +       case MMC_SIGNAL_VOLTAGE_330:
> +               if (!(host->flags & SDHCI_SIGNALING_330))
> +                       return -EINVAL;
> +
> +               /* Set 1.8V Signal Enable in the Host Control2 register to 0 */
> +               ctrl &= ~SDHCI_CTRL_VDD_180;
> +               break;
> +       case MMC_SIGNAL_VOLTAGE_180:
> +               if (!(host->flags & SDHCI_SIGNALING_180))
> +                       return -EINVAL;
> +
> +               /*
> +                * Enable 1.8V Signal Enable in the Host Control2
> +                * register
> +                */
> +               ctrl |= SDHCI_CTRL_VDD_180;
> +               break;
> +       case MMC_SIGNAL_VOLTAGE_120:
> +               if (!(host->flags & SDHCI_SIGNALING_120))
> +                       return -EINVAL;
> +               return 0;

This looks weird. You probably want to return -EINVAL instead!?

> +       default:
> +               /* No signal voltage switch required */
> +               return 0;

This is an error and should not be treated as a valid case.
I suggest you return -EINVAL here instead, then you may also skip the
case for MMC_SIGNAL_VOLTAGE_120 above, as it gets covered in this
part.

> +       }
> +
> +       sdhci_writew(host, ctrl, SDHCI_HOST_CONTROL2);
> +
> +       /* Wait for 5ms */
> +       usleep_range(5000, 5500);
> +
> +       /* regulator output should be stable within 5 ms */
> +       status = ctrl & SDHCI_CTRL_VDD_180;
> +       ctrl = sdhci_readw(host, SDHCI_HOST_CONTROL2);
> +       if ((ctrl & SDHCI_CTRL_VDD_180) == status)
> +               return 0;
> +
> +       dev_warn(mmc_dev(mmc), "%s: Regulator output did not became stable\n",
> +               mmc_hostname(mmc));
> +
> +       return -EAGAIN;
> +}
> +
>  #define DRIVER_NAME "sdhci_msm"
>  #define SDHCI_MSM_DUMP(f, x...) \
>         pr_err("%s: " DRIVER_NAME ": " f, mmc_hostname(host->mmc), ## x)
> @@ -1967,6 +2151,7 @@ void sdhci_msm_dump_vendor_regs(struct sdhci_host *host)
>         .write_b = sdhci_msm_writeb,
>         .irq    = sdhci_msm_cqe_irq,
>         .dump_vendor_regs = sdhci_msm_dump_vendor_regs,
> +       .set_power = sdhci_set_power_noreg,
>  };
>

[...]

Kind regards
Uffe
