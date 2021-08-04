Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B84843E0049
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 13:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237753AbhHDLfp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 07:35:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237773AbhHDLfn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 07:35:43 -0400
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA71C0617A2
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Aug 2021 04:35:30 -0700 (PDT)
Received: by mail-ua1-x92a.google.com with SMTP id 67so730325uaq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Aug 2021 04:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K+XPIBdEmBiE3IWUYxG9LKoaZ2lDQ33Dr5Yh21o59y8=;
        b=ji72+81tL3oN9fkldOo7UUKwYqThUIAp8yuurX3vzylYFFpYopB5IZQgF2GArGEpgd
         fXlPEv9zrH+KvqSWd+zY1vj5CtZ/PtJgl8Gv5AIETYBBs8uT9HroRFWNpHwhv/GvjKF0
         ii8UxAzbj/4gdOH//ZFPxq5xEY55O+Cvusj1FiACbAlgCMBQJs37R8ZQ7COXgwjtefuf
         YZMembJuAN4CJxg2eRLLNOuYxZeylTrngIKus7Nnridjxkzd2NP+Beoq3wzgp8POqEw4
         o3HZN7YiUyfmMejpJJ82nezWm+YCJZpHIDtNXJH4Ke8ilF/+JdVhloXUuNC+pMr5ixg+
         71Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K+XPIBdEmBiE3IWUYxG9LKoaZ2lDQ33Dr5Yh21o59y8=;
        b=hETMc5+HnV+s5tqfu8VTvlHtUQrbeoiCYXus2qMkiW3vq5CsgFa9tHbACvYUd2RFsA
         3NMxk8bHUynd2fZsq6uvs1BuZCYd6dzU6CaChMmXzB5iZ1T1Mcq00F/tg3x3pODhRBPH
         3im2JHNusbBKzwHkTeVS0lVsdVZ+IfpblGOWX0o3aq8BVzSPWOFSaIgaLoWJJt8UU5ha
         jeF/ump7tth7NAziUfDUqcpiTjQ9qvqKA2qgaFUZGg9KWPa2banOxYpd7AoALS4BcKxL
         QpDbIwdc2kv2im1B+40kaZOYRZePtkfxVz0E9P/cNPWLPVFxLQowTUY0bKNWse8QYte0
         JaJg==
X-Gm-Message-State: AOAM531NVyXFwIdLqFltRZuKYIOrzs7YSOgJO2GE1m1S2/v6Y1A1t4cG
        8FyrMAstiLkRab3m8gGbY9i9f3+tbkYe9GcTccrs8g==
X-Google-Smtp-Source: ABdhPJwxHFU3OlHmpSdL0NsTNoSoJrlQpBg8cFrTZ79lrYAsD1hih94K7o8DEMExOnWFiAC79uyc3X/AFM4kjRbEYUI=
X-Received: by 2002:a9f:25a7:: with SMTP id 36mr9392519uaf.129.1628076929325;
 Wed, 04 Aug 2021 04:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <1626435974-14462-1-git-send-email-sbhanu@codeaurora.org> <d95ea0583c39b8e73f391502adb39b09@codeaurora.org>
In-Reply-To: <d95ea0583c39b8e73f391502adb39b09@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 4 Aug 2021 13:34:52 +0200
Message-ID: <CAPDyKFp0O-N79QzHtoaC0+yWvYbTy1mGCjn7wivLvFvJ7_oNiA@mail.gmail.com>
Subject: Re: [PATCH V4] mmc: sdhci-msm: Update the software timeout value for sdhc
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Asutosh Das <asutoshd@codeaurora.org>,
        Sahitya Tummala <stummala@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Ram Prakash Gupta <rampraka@codeaurora.org>,
        Sayali Lokhande <sayalil@codeaurora.org>,
        Sarthak Garg <sartgarg@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>, cang@codeaurora.org,
        Pradeep P V K <pragalla@codeaurora.org>,
        nitirawa@codeaurora.org, linux-mmc <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

+ Stephen

On Mon, 2 Aug 2021 at 12:41, <sbhanu@codeaurora.org> wrote:
>
> Gentle Reminder
>
> Thanks,
> Sajida
>
> On 2021-07-16 17:16, Shaik Sajida Bhanu wrote:
> > Whenever SDHC run at clock rate 50MHZ or below, the hardware data
> > timeout value will be 21.47secs, which is approx. 22secs and we have
> > a current software timeout value as 10secs. We have to set software
> > timeout value more than the hardware data timeout value to avioid
> > seeing
> > the below register dumps.
> >
> > [  332.953670] mmc2: Timeout waiting for hardware interrupt.
> > [  332.959608] mmc2: sdhci: ============ SDHCI REGISTER DUMP
> > ===========
> > [  332.966450] mmc2: sdhci: Sys addr:  0x00000000 | Version:
> > 0x00007202
> > [  332.973256] mmc2: sdhci: Blk size:  0x00000200 | Blk cnt:
> > 0x00000001
> > [  332.980054] mmc2: sdhci: Argument:  0x00000000 | Trn mode:
> > 0x00000027
> > [  332.986864] mmc2: sdhci: Present:   0x01f801f6 | Host ctl:
> > 0x0000001f
> > [  332.993671] mmc2: sdhci: Power:     0x00000001 | Blk gap:
> > 0x00000000
> > [  333.000583] mmc2: sdhci: Wake-up:   0x00000000 | Clock:
> > 0x00000007
> > [  333.007386] mmc2: sdhci: Timeout:   0x0000000e | Int stat:
> > 0x00000000
> > [  333.014182] mmc2: sdhci: Int enab:  0x03ff100b | Sig enab:
> > 0x03ff100b
> > [  333.020976] mmc2: sdhci: ACmd stat: 0x00000000 | Slot int:
> > 0x00000000
> > [  333.027771] mmc2: sdhci: Caps:      0x322dc8b2 | Caps_1:
> > 0x0000808f
> > [  333.034561] mmc2: sdhci: Cmd:       0x0000183a | Max curr:
> > 0x00000000
> > [  333.041359] mmc2: sdhci: Resp[0]:   0x00000900 | Resp[1]:
> > 0x00000000
> > [  333.048157] mmc2: sdhci: Resp[2]:   0x00000000 | Resp[3]:
> > 0x00000000
> > [  333.054945] mmc2: sdhci: Host ctl2: 0x00000000
> > [  333.059657] mmc2: sdhci: ADMA Err:  0x00000000 | ADMA Ptr:
> > 0x0000000ffffff218
> > [  333.067178] mmc2: sdhci_msm: ----------- VENDOR REGISTER DUMP
> > -----------
> > [  333.074343] mmc2: sdhci_msm: DLL sts: 0x00000000 | DLL cfg:
> > 0x6000642c | DLL cfg2: 0x0020a000
> > [  333.083417] mmc2: sdhci_msm: DLL cfg3: 0x00000000 | DLL usr ctl:
> > 0x00000000 | DDR cfg: 0x80040873
> > [  333.092850] mmc2: sdhci_msm: Vndr func: 0x00008a9c | Vndr func2 :
> > 0xf88218a8 Vndr func3: 0x02626040
> > [  333.102371] mmc2: sdhci:
> > ============================================
> >
> > So, set software timeout value more than hardware timeout value.
> >
> > Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
> > Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> > ---
> >
> > Changes since V3:
> >       - Addressed minor comments from Adrain Hunter and retained his
> >         Acked-by Signed-off.
> >
> > Changes since V2:
> >       - Updated 22 with 22LL to avoid compiler warning as
> >         suggested by Adrian Hunter.
> >       - Added a check to update software data timeout value if its value
> >         is less than the calculated hardware data timeout value as suggested
> >         by Veerabhadrarao Badiganti.
> > Changes since V1:
> >       - Moved software data timeout update part to qcom specific file
> >         as suggested by Veerabhadrarao Badiganti.
> > ---
> >  drivers/mmc/host/sdhci-msm.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-msm.c
> > b/drivers/mmc/host/sdhci-msm.c
> > index e44b7a6..290a14c 100644
> > --- a/drivers/mmc/host/sdhci-msm.c
> > +++ b/drivers/mmc/host/sdhci-msm.c
> > @@ -2089,6 +2089,23 @@ static void sdhci_msm_cqe_disable(struct
> > mmc_host *mmc, bool recovery)
> >       sdhci_cqe_disable(mmc, recovery);
> >  }
> >
> > +static void sdhci_msm_set_timeout(struct sdhci_host *host, struct
> > mmc_command *cmd)
> > +{
> > +     u32 count, start = 15;
> > +
> > +     __sdhci_set_timeout(host, cmd);
> > +     count = sdhci_readb(host, SDHCI_TIMEOUT_CONTROL);
> > +     /*
> > +      * Update software timeout value if its value is less than hardware
> > data
> > +      * timeout value. Qcom SoC hardware data timeout value was calculated
> > +      * using 4 * MCLK * 2^(count + 13). where MCLK = 1 / host->clock.
> > +      */
> > +     if (cmd && cmd->data && host->clock > 400000 &&
> > +         host->clock <= 50000000 &&
> > +         ((1 << (count + start)) > (10 * host->clock)))
> > +             host->data_timeout = 22LL * NSEC_PER_SEC;
> > +}
> > +
> >  static const struct cqhci_host_ops sdhci_msm_cqhci_ops = {
> >       .enable         = sdhci_msm_cqe_enable,
> >       .disable        = sdhci_msm_cqe_disable,
> > @@ -2438,6 +2455,7 @@ static const struct sdhci_ops sdhci_msm_ops = {
> >       .irq    = sdhci_msm_cqe_irq,
> >       .dump_vendor_regs = sdhci_msm_dump_vendor_regs,
> >       .set_power = sdhci_set_power_noreg,
> > +     .set_timeout = sdhci_msm_set_timeout,
> >  };
> >
> >  static const struct sdhci_pltfm_data sdhci_msm_pdata = {
