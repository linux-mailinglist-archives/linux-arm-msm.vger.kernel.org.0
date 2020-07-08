Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73B52218925
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 15:33:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729672AbgGHNdt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 09:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729614AbgGHNds (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 09:33:48 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8F4C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 06:33:48 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id c7so12887005uap.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y1GTsvB1sENuLYTitDg+4KJVrg9ZAbmGFqqoF3A8ork=;
        b=dtWyJuBqyJLR1bSeZKeSipNjWrOFaLi6Et+BtwiwCKDNFw0+FIShvW+J/3Zd9/eNMQ
         9YJVXSlhQXbXA8jaAqde+sMEJLnyaXWSUoidNhNR+NmVMmPmxA6kF+JBBmh2Ydq8HuEy
         EmKgvmg8Qjh3GVaZ2Rtl+p2ZbohNCy71uE5htKD2NCCSgiOetnmxfHQyjUYCx3sCvxRe
         rRoeYQMCKVqz8JnhgKN41bBr3vjWxhJMH0t5Pc0xkEPmQ+UQ+B6D5GMLvfs5XjyqLtt2
         VnRcoB7+ZHiUYClGpfXYVVTCNBLDg5LARAre3p2R55W91wq/SbA6N2DIn0D5j6l9XqoZ
         /Dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y1GTsvB1sENuLYTitDg+4KJVrg9ZAbmGFqqoF3A8ork=;
        b=BKpcDhPSFITxvd1aEUJwHLChGHN1K8l+0KWaPwpqLbivQqff27kXO2MWy06ppYOoKk
         YBWR0yJTjp/vYF3l+4rySdhqEkPqhRchom9x4poebxkZlEnoCzi+jDx8rBUW+5jZ+qBS
         cJ5xiPEx/k3TZJmd0U3MnTqYTglqVVNmxA8caykT/noXzLdFD8TDh0DjUC0KBowwbeow
         XYEJpnQ3kDGTjU1QTX8IsfKtkLbh1yc3WbLKc8KWxf38S+ml6dfKB1sPggfKxT5kM2A0
         OnYR4gFaYHSh0SeJ4lssHpB4fCMJ/M94XNh7A8pBRyxjMfxX4C0eE1xECyZ8K0QOJFnT
         uQOA==
X-Gm-Message-State: AOAM531rk1AQugBqvuL+AYb5SQZSc5AspH84nncA/YEMr1Zv+FOS04Zs
        WIXVFWp3XAGuB9PZDtPqK48qwOupAtdN8qHRo51gAA==
X-Google-Smtp-Source: ABdhPJw+0z3dQW3AcfspoIM8itefwk3QY2ggPT+DFUkCpMKHpkWyXEKW3t8CCIUcJ8Mn3muqMEBQNOiJv4qt/ZeKuu8=
X-Received: by 2002:ab0:6f0a:: with SMTP id r10mr49334442uah.100.1594215227202;
 Wed, 08 Jul 2020 06:33:47 -0700 (PDT)
MIME-Version: 1.0
References: <1594213888-2780-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1594213888-2780-1-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 8 Jul 2020 15:33:10 +0200
Message-ID: <CAPDyKFqiAeQYcqkb=Wv2stgTb9yvGwFfHv-BGtd5VuyJxfJXAA@mail.gmail.com>
Subject: Re: [PATCH V1] mmc: sdhci-msm: Override DLL_CONFIG only if the valid
 value is supplied
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        Sarthak Garg <sartgarg@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 8 Jul 2020 at 15:12, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> During DLL initialization, the DLL_CONFIG register value would be
> updated with the value supplied from the device-tree.
>
> Override this register only if a valid value is supplied.
>
> Fixes: 03591160ca19 ("mmc: sdhci-msm: Read and use DLL Config property from device tree file")
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-msm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index efd2bae1430c..93d67a3a899f 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -626,8 +626,9 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>         config &= ~CORE_CLK_PWRSAVE;
>         writel_relaxed(config, host->ioaddr + msm_offset->core_vendor_spec);
>
> -       config = msm_host->dll_config;
> -       writel_relaxed(config, host->ioaddr + msm_offset->core_dll_config);
> +       if (msm_host->dll_config)
> +               writel_relaxed(msm_host->dll_config,
> +                               host->ioaddr + msm_offset->core_dll_config);
>
>         if (msm_host->use_14lpp_dll_reset) {
>                 config = readl_relaxed(host->ioaddr +
> --
> Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc., is a member of Code Aurora Forum, a Linux Foundation Collaborative Project
>
