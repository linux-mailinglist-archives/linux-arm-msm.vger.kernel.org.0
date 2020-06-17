Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7AC1FCF49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 16:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgFQOQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 10:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727047AbgFQOQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 10:16:38 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E43C0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:16:37 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id c1so1445615vsc.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gSW8BPLoltx1w5hCbo9mZt1Y0aly6PeCbW4FnOcx58o=;
        b=puyh6IIB9om+v34S6yPC5lV02PiuqvGWHI3pSFUkPQpUCe8Phx1XKP3aXPtyxAhmZD
         bxgQBCYv936XR5J8jgI0ilTX9BSW0sl7yZHQQ0AWFYV8Uf7QrN3TEZzQj4PKd0x4yiru
         ExmAVLgPbgDMHk14tMuz226+dGwcVxVfXgrZywCplVewC+xbahBxzlBWXNUOwT33t9a/
         P+BTFl7MjpGE/1vU2b+QalrVnNe2dqvEAOyBxNTj3CdupxQMtYtgnWXGJ3yp5KVy/nUp
         F7rR6aJ4XAXz1F4OQE4jVaph7ELqsAWlVSOn/W/BcgUao37f14paqOwOZaIxnestPX2J
         /xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSW8BPLoltx1w5hCbo9mZt1Y0aly6PeCbW4FnOcx58o=;
        b=GizV4iL2fZbm39dSbbogaAovWq4uPTq/Dpil0VpFtEtuwtjGQLcebexdG8Yi7T9IUE
         Ykwb6VFyhkDaDimyW0q3TOkySAxJhBGYzPImI6/5FiC6fPKAPvpOSy0lRvMKDEg+rNHe
         DyNp+yYYzI6wJel5QGpuMwTrYvrDlrwtTkDT+cRvigUle0CAyvatdFGv34ovT6Y/hepP
         RdJPGhFJqme/d/PN9+1HdjvI1Po9eJrVz737rd1OOoujXf7541i9EmPR1cKlXIrgyltK
         Hob7MIEWomsWFQhpAABitqlL2RSb3/zOrdygdr0OAgiZ+NzsSwLCFsE25dZ2s70zU7i7
         oG5g==
X-Gm-Message-State: AOAM532PxfBnGDD3vGN+AQWS9n+Pibo27CjnU6A7CeSLV0efnxnFS5M/
        oaXXg+aCXLvuNo5jS8HLCoDLJWByFrho3G/FK2iq8w==
X-Google-Smtp-Source: ABdhPJzmC8gc3+JMfV9wCocw1ivFjymC2aPSQ/lfOhTELQ8oMXdIviDwMW4WplrnBCcbqAC/slVDAmnXL6IsmyqJ4Wo=
X-Received: by 2002:a05:6102:18e:: with SMTP id r14mr6059812vsq.200.1592403397046;
 Wed, 17 Jun 2020 07:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org>
 <1592321779-28556-1-git-send-email-vbadigan@codeaurora.org>
 <1592321779-28556-3-git-send-email-vbadigan@codeaurora.org>
 <CAPDyKFrvvhQPio3FRQmoBgMm1Euvsma_dgGzxA=R8rm0aQgDMQ@mail.gmail.com> <40b03630-cdbc-50ee-e483-8ff919f76fb5@codeaurora.org>
In-Reply-To: <40b03630-cdbc-50ee-e483-8ff919f76fb5@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 17 Jun 2020 16:16:00 +0200
Message-ID: <CAPDyKFrf3rxA-_0wB=bNby2dVSxTwZHSTXeNO5OayQ57Eqiphg@mail.gmail.com>
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

On Wed, 17 Jun 2020 at 14:46, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> Thanks for comments Uffe.
>
> On 6/17/2020 3:04 PM, Ulf Hansson wrote:
> > On Tue, 16 Jun 2020 at 17:38, Veerabhadrarao Badiganti
> > <vbadigan@codeaurora.org> wrote:
> >> On qcom SD host controllers voltage switching be done after the HW
> >> is ready for it. The HW informs its readiness through power irq.
> >> The voltage switching should happen only then.
> >>
> >> Use the internal voltage switching and then control the voltage
> >> switching using power irq.
> >>
> >> IO-bus supply of eMMC would be kept always-on. So set the load
> >> for this supply to configure it in LPM when eMMC is suspend state
> >>   and in HPM when eMMC is active.
> >>
> >> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
> >> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> >> Co-developed-by: Vijay Viswanath <vviswana@codeaurora.org>
> >> Signed-off-by: Vijay Viswanath <vviswana@codeaurora.org>
> >> Co-developed-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> >> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> >> ---
> >>   drivers/mmc/host/sdhci-msm.c | 208 +++++++++++++++++++++++++++++++++++++++++--
> >>   1 file changed, 199 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> >> index 15c42b059240..8297b2142748 100644
> >> --- a/drivers/mmc/host/sdhci-msm.c
> >> +++ b/drivers/mmc/host/sdhci-msm.c
> >> @@ -37,7 +37,9 @@
> >>   #define CORE_PWRCTL_IO_LOW     BIT(2)
> >>   #define CORE_PWRCTL_IO_HIGH    BIT(3)
> >>   #define CORE_PWRCTL_BUS_SUCCESS BIT(0)
> >> +#define CORE_PWRCTL_BUS_FAIL    BIT(1)
> >>   #define CORE_PWRCTL_IO_SUCCESS BIT(2)
> >> +#define CORE_PWRCTL_IO_FAIL     BIT(3)
> >>   #define REQ_BUS_OFF            BIT(0)
> >>   #define REQ_BUS_ON             BIT(1)
> >>   #define REQ_IO_LOW             BIT(2)
> >> @@ -127,6 +129,9 @@
> >>   /* Timeout value to avoid infinite waiting for pwr_irq */
> >>   #define MSM_PWR_IRQ_TIMEOUT_MS 5000
> >>
> >> +/* Max load for eMMC Vdd-io supply */
> >> +#define MMC_VQMMC_MAX_LOAD_UA  325000
> >> +
> >>   #define msm_host_readl(msm_host, host, offset) \
> >>          msm_host->var_ops->msm_readl_relaxed(host, offset)
> >>
> >> @@ -278,6 +283,7 @@ struct sdhci_msm_host {
> >>          bool uses_tassadar_dll;
> >>          u32 dll_config;
> >>          u32 ddr_config;
> >> +       bool vqmmc_enabled;
> >>   };
> >>
> >>   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> >> @@ -1346,6 +1352,88 @@ static void sdhci_msm_set_uhs_signaling(struct sdhci_host *host,
> >>                  sdhci_msm_hs400(host, &mmc->ios);
> >>   }
> >>
> >> +static int sdhci_msm_set_vmmc(struct mmc_host *mmc)
> >> +{
> >> +       if (IS_ERR(mmc->supply.vmmc))
> >> +               return 0;
> >> +
> >> +       return mmc_regulator_set_ocr(mmc, mmc->supply.vmmc, mmc->ios.vdd);
> >> +}
> >> +
> >> +static int msm_toggle_vqmmc(struct sdhci_msm_host *msm_host,
> >> +                             struct mmc_host *mmc, bool level)
> >> +{
> >> +       int ret;
> >> +       struct mmc_ios ios;
> >> +
> >> +       if (msm_host->vqmmc_enabled == level)
> >> +               return 0;
> >> +
> >> +       if (level) {
> >> +               /* Set the IO voltage regulator to default voltage level */
> >> +               if (msm_host->caps_0 & CORE_3_0V_SUPPORT)
> >> +                       ios.signal_voltage = MMC_SIGNAL_VOLTAGE_330;
> >> +               else if (msm_host->caps_0 & CORE_1_8V_SUPPORT)
> >> +                       ios.signal_voltage = MMC_SIGNAL_VOLTAGE_180;
> >> +
> >> +               if (msm_host->caps_0 & CORE_VOLT_SUPPORT) {
> >> +                       ret = mmc_regulator_set_vqmmc(mmc, &ios);
> >> +                       if (ret < 0) {
> >> +                               dev_err(mmc_dev(mmc), "%s: vqmmc set volgate failed: %d\n",
> >> +                                       mmc_hostname(mmc), ret);
> >> +                               goto out;
> >> +                       }
> >> +               }
> >> +               ret = regulator_enable(mmc->supply.vqmmc);
> >> +       } else {
> >> +               ret = regulator_disable(mmc->supply.vqmmc);
> >> +       }
> >> +
> >> +       if (ret)
> >> +               dev_err(mmc_dev(mmc), "%s: vqmm %sable failed: %d\n",
> >> +                       mmc_hostname(mmc), level ? "en":"dis", ret);
> >> +       else
> >> +               msm_host->vqmmc_enabled = level;
> >> +out:
> >> +       return ret;
> >> +}
> >> +
> >> +static int msm_config_vqmmc_mode(struct sdhci_msm_host *msm_host,
> >> +                             struct mmc_host *mmc, bool hpm)
> >> +{
> >> +       int load, ret;
> >> +
> >> +       load = hpm ? MMC_VQMMC_MAX_LOAD_UA : 0;
> >> +       ret = regulator_set_load(mmc->supply.vqmmc, load);
> >> +       if (ret)
> >> +               dev_err(mmc_dev(mmc), "%s: vqmmc set load failed: %d\n",
> >> +                       mmc_hostname(mmc), ret);
> >> +       return ret;
> >> +}
> >> +
> >> +static int sdhci_msm_set_vqmmc(struct sdhci_msm_host *msm_host,
> >> +                             struct mmc_host *mmc, bool level)
> >> +{
> >> +       int ret;
> >> +       bool always_on;
> >> +
> >> +       if (IS_ERR(mmc->supply.vqmmc)           ||
> > White space.
> >
> >> +           (mmc->ios.power_mode == MMC_POWER_UNDEFINED))
> >> +               return 0;
> >> +       /*
> >> +        * For eMMC don't turn off Vqmmc, Instead just configure it in LPM
> >> +        * and HPM modes by setting the right amonut of load.
> > /s/right amonut of load/corresponding load
> >
> >> +        */
> >> +       always_on = mmc->card && mmc_card_mmc(mmc->card);
> >> +
> >> +       if (always_on)
> >> +               ret = msm_config_vqmmc_mode(msm_host, mmc, level);
> >> +       else
> >> +               ret = msm_toggle_vqmmc(msm_host, mmc, level);
> > I am worried that this isn't really doing what you think it does.
> > always_on may not always be set for an eMMC.
> >
> > This is because the mmc->card doesn't get assigned until the
> > initialization of the eMMC has been completed. In other words, way
> > after VCC and VCCQ have been turned on and changed voltage levels.
> For the very first time, i have to enable the vqmmc.
> And second time on-wards I have to set load instead of turning vqmmc off
> / on.
>
> This condition helps me in doing exactly the same.
>
> This gets invoked first time when  mmc_power_up() is called.
> Yes, by that time card won't be initialized. So this check fails and
> allows to turn on the regulator instead of setting load.
>
> After that, this gets invoked only next time mmc_power_up/off() is called
> which is during mmc_suspend/resume.

I see.

That assumes the initialization always works at the first attempt, so
no re-try or power cycle gets done in some error/reset path.

>
> By this time card is initialized, it allows to set load.

Okay, I get it. Thanks for clarifying.

Perhaps you can add a small comment about this in the code, so we
don't forget the reasons why the code looks like this.

>
>
> > Moreover, mmc_card_mmc() is also about legacy MMC cards, not solely for eMMCs.
>
> Okay. But on qcom platform, we have support for only eMMC/SD/SDIO.
> So this mmc_card_mmc() meets my requirements!!! Allows only eMMC not SD
> & SDIO.

Well, eMMC is fairly similar to MMC, from a basic functionality point
of view. So, I am quite sure you can get it to work with your
controller, even if it's not officially supported.

>
> > If you want special treatment of an eMMC, I think it's better to use
> > the DT bindings Documentation/devicetree/bindings/mmc/mmc-card.txt. If
> > you have such a subnode, that indicates that there is an eMMC card
> > attached.

That said, if you don't like the pure DT based solution, as I
suggested above - at least extend mmc_card_mmc() with checking the
MMC_CAP_NONREMOVABLE flag.

[...]

Kind regards
Uffe
