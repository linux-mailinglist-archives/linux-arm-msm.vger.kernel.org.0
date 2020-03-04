Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE64417937D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2020 16:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388094AbgCDPfI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Mar 2020 10:35:08 -0500
Received: from mail-vs1-f67.google.com ([209.85.217.67]:46500 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388081AbgCDPfI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Mar 2020 10:35:08 -0500
Received: by mail-vs1-f67.google.com with SMTP id t12so1386732vso.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2020 07:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=onLoHv5Ms+4AzZ821JcEV0O5UG1JPs1cK0tJlERjAAQ=;
        b=m+dHif6cWAhNpvfUPUtJ8bg8npAAbe3Y0SdBgPuCLrgKAty+3VDSzuayGtPAFXEh96
         d3A5tIF0NrKJfs/U/Yddw2wk3lDqzH+XizvOSbFCw1507ROYd/8Z7wl7kc9tlpcdLJZB
         8qFWvI7ZzsYxIAS0lC+tb0tLpN5Rfg1IoYOPX++hcJvuQtF1T/WvNJAm0lQ7pfQD+VM0
         sVDJjrng7+HT0qlSMY1Fn7gwGOhDhmBqR9qtuPQMfrxa6OpGijM14phfR4VfXVGrkGfC
         gFGo7DPU0rCtPBQ/qLfSFpnjzrn0/KtH7VJywaWSKnxNhxOczJOW3mZLOlhSKG88bosh
         DdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=onLoHv5Ms+4AzZ821JcEV0O5UG1JPs1cK0tJlERjAAQ=;
        b=jaciJqagiRSTq9z26bwSbl0N30FJCqEK9XflP+yb7QonYhozdTAsaJkvC+HN+eCtKL
         Vw6rDJZNq++4Wse+NJAIpuWWktpaFRp3wqIeGu4LR2ni2nLJT5RD+bGZOYDWXH5d95OF
         iif0m6+fNe79fj+Tc9VB1J73Ppy3T3mqn/qFfGbaTISamABVM1a6ki7ndbcM2PQyYrqK
         1JxYlP2gKk2KrGZ0Znl72BrnDwvsOloB+6BH4Xr55wiO2XUs0Q65FpRpJiOWGMuKFDua
         GTLAnoPunK9bvCWwHQ+rDLMnpqy015hPSpObtEEzFEkpbzy2JCmIQktwD1swQeYmfwY2
         Gc4g==
X-Gm-Message-State: ANhLgQ2cNO1O83JGMyW7cU6THVcc70E9RTUKtOMYl8Fxmb+bcRxEPqGX
        84ygIQ4ozhhc79uuImI4Z0XNIZmEuHjERaJEqbJDTw==
X-Google-Smtp-Source: ADFU+vtETTmLUCopUJ0sb9jdFffuDWlaNhSB3DL9zpUBToCJK3mx9X4u/fBMgACCt37teT7kHgPNKAJFxU+nOCWg3s0=
X-Received: by 2002:a67:800e:: with SMTP id b14mr2057435vsd.191.1583336105439;
 Wed, 04 Mar 2020 07:35:05 -0800 (PST)
MIME-Version: 1.0
References: <1582181100-29914-1-git-send-email-sbhanu@codeaurora.org>
In-Reply-To: <1582181100-29914-1-git-send-email-sbhanu@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 4 Mar 2020 16:34:29 +0100
Message-ID: <CAPDyKFqSJ4h7UvQfQzWmSq9gg97A0MXvdcuXXaY7b-YUHs=V2g@mail.gmail.com>
Subject: Re: [PATCH V4] mmc: sdhci-msm: Update system suspend/resume callbacks
 of sdhci-msm platform driver
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>, cang@codeaurora.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 20 Feb 2020 at 07:45, Shaik Sajida Bhanu <sbhanu@codeaurora.org> wrote:
>
> The existing suspend/resume callbacks of sdhci-msm driver are just
> gating/un-gating the clocks. During suspend cycle more can be done
> like disabling controller, disabling card detection, enabling wake-up events.
>
> So updating the system pm callbacks for performing these extra
> actions besides controlling the clocks.
>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
> Changes since V3:
>     Invoking sdhci & cqhci resume if sdhci_host_suspend fails.
>     Removed condition check before invoking cqhci_resume since its a dummy function.
>
> Changes since V2:
>     Removed disabling/enabling pwr-irq from system pm ops.
>
> Changes since V1:
>     Invoking pm_runtime_force_suspend/resume instead of
>     sdhci_msm_runtime_suepend/resume.
> ---
>  drivers/mmc/host/sdhci-msm.c | 47 ++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 3955fa5d..3559b50 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2159,9 +2159,52 @@ static __maybe_unused int sdhci_msm_runtime_resume(struct device *dev)
>         return 0;
>  }
>
> +static int sdhci_msm_suspend(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +       int ret;
> +
> +       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> +               ret = cqhci_suspend(host->mmc);
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       ret = sdhci_suspend_host(host);
> +       if (ret)
> +               goto resume_cqhci;

sdhci_suspend_host() can't be called on a device that has been runtime
suspended, as that would lead to accessing device registers when
clocks/PM domains are gated.

Depending on how the corresponding cqhci device is managed from a
runtime PM point of view, it could also be problematic to call
cqhci_suspend().

> +
> +       ret = pm_runtime_force_suspend(dev);

It looks to me that perhaps you could make use of solely
pm_runtime_force_suspend(), then just skip calling
sdhci_suspend|resume_host() altogether. Do you think that could work?

And vice versa for sdhci_msm_resume(), of course.

> +       if (!ret)
> +               return ret;
> +
> +       sdhci_resume_host(host);
> +
> +resume_cqhci:
> +       cqhci_resume(host->mmc);
> +       return ret;
> +}
> +
> +static int sdhci_msm_resume(struct device *dev)
> +{
> +       struct sdhci_host *host = dev_get_drvdata(dev);
> +       int ret;
> +
> +       ret = pm_runtime_force_resume(dev);
> +       if (ret)
> +               return ret;
> +
> +       ret = sdhci_resume_host(host);
> +       if (ret < 0)
> +               return ret;
> +
> +       ret = cqhci_resume(host->mmc);
> +       return ret;
> +}
> +
>  static const struct dev_pm_ops sdhci_msm_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> +       SET_SYSTEM_SLEEP_PM_OPS(sdhci_msm_suspend,
> +                               sdhci_msm_resume)
>         SET_RUNTIME_PM_OPS(sdhci_msm_runtime_suspend,
>                            sdhci_msm_runtime_resume,
>                            NULL)
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>

Kind regards
Uffe
