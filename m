Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A012159FB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 16:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729288AbgGFOty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 10:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729466AbgGFOtw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 10:49:52 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD7AC08C5DF
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2020 07:49:52 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id f24so20724164vsg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2020 07:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=InByvEjJPlQ7gTBk+VqXmPI+tHOV3mOPt/I3k/Qwrbw=;
        b=o1y7v38NkkoYxogRzwqgVzvL9W57wSuo9qqOEgxk/wXAT0aJcGb7V2kwmKgSjRXbCQ
         8YDhUi1ZRA3DxqqGX5oKE+UPROSVKnLTtkFs0up6GgDSaajq9qruFaag7xXX69XYBx8t
         KeR/kdKwiVRghrGaV6CKTZkVoaDm19lkYkKXWeFqEajTUKsGGVOrT0QX5xNAdIoR6fWe
         tkwwIt+LSPvw8a+oJh9qM1s25LgtOjoClipA3DDj1d7oX9Lne7O8GJcH3p4/EeYkLt2q
         HM060lgIsDiMlyGNYFiJWaUNlPSO43KMRfYQlLE5+gRocuB+GGoZJOTJ25QOUGT6efMQ
         irmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=InByvEjJPlQ7gTBk+VqXmPI+tHOV3mOPt/I3k/Qwrbw=;
        b=ou4UtNjReFZvztjgpRiFl70wLtVDUE6+xFmwRkp46JM9TkJdi7XNQqKVJykHsfXmeV
         Io68xEJR6PH7fCqVDFCGLc5pP+1oYElA/h/I0vGTFwQA/frTWy8hOp36+QEkgfYxxAGU
         TxVZ9SwjhYfP16RyDzxAyis1HFukHEThkhj3tW2X3w12/weE8L2VnvIyV96TGcFX+y+2
         NXbQf0PJBrSFOjgyi+0BflBRxEY1v9QszaMKVlNtnxIBUF93OazRlw8gG/HT3LYQ1e83
         yP6IcSawO4UXZ1sARZIBx+26toRjEBc/CWXSxt7BAzUvjaDJNCjMK4480+JNQPuQMpkm
         7/gw==
X-Gm-Message-State: AOAM530QKplup+p2VDWjrqXbyp91KANTbiOnDLvl8NgTWP3/qqP7lGAX
        9RMXnhN3h/2pcArfhEzJBO1JuDRL3fpCA6yOtb2HFA==
X-Google-Smtp-Source: ABdhPJwHbcQaTYD4fA5nzc1T5GJQgwoDZYjR82xJf+ip+IRJpiePRBEm6QefPXd0QWsTQnUoffZcXdPTOSvhjqUTpJQ=
X-Received: by 2002:a67:d01a:: with SMTP id r26mr17252391vsi.200.1594046991485;
 Mon, 06 Jul 2020 07:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <1589541535-8523-1-git-send-email-vbadigan@codeaurora.org> <1592919288-1020-1-git-send-email-vbadigan@codeaurora.org>
In-Reply-To: <1592919288-1020-1-git-send-email-vbadigan@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 6 Jul 2020 16:49:14 +0200
Message-ID: <CAPDyKFqG5iVda4A2swYx9-3nE__R+sSYKtJJyKAMwsQJ9z96gA@mail.gmail.com>
Subject: Re: [PATCH V5 0/3] Internal voltage control for qcom SDHC
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 23 Jun 2020 at 15:35, Veerabhadrarao Badiganti
<vbadigan@codeaurora.org> wrote:
>
> On qcom SD host controllers voltage switching be done after the HW
> is ready for it. The HW informs its readiness through power irq.
> The voltage switching should happen only then.
>
> So added support to register voltage regulators from the msm driver
> and use them.
>
> This patchset was posted long back but not actively pursued
> https://lore.kernel.org/linux-arm-msm/1539004739-32060-1-git-send-email-vbadigan@codeaurora.org/
> So posting it as fresh patchset.
>
> Changes since V4:
>         - Added clear comments on condtion which allows either to
>           tunf off/on Vqmmc or to set load.
>         - Added mmc_card_removable() to the condtion whcih checks
>           if the card is eMMC or other card.
>         - Rerturning error for unsupported voltagtes in
>           sdhci_msm_start_signal_voltage_switch()
>         - Moved setting ios.power_mode to mmc_alloc_host().
>
> Changes since V3:
>         - Dropped reading of regulator load values from device tree.
>         - Dropped documentaiton chagne.
>         - Since only Vqmmc supply of eMMC would be kept On during suspend,
>           setting load only for this regulator so that it can go to LPM.
>           And since this Load reamins same, load value is hard-coded in the driver.
>
> Changes since V2:
>         - Removed redundant log from sdhci_msm_set_vmmc.
>         - Added the condition for skiping disabling of vqmmc for eMMC.
>         - Updated logic such that, setting load for vqmmc only if
>           it is kept ON.
>         - Retained ack by Adrian for second patch.
>         - Updated dt properties names as per Robs comments.
>
> Changes since V1:
>         - Removed setting load for Vmmc regulator while turning it on/off.
>           Instead setting the active load once during probe.
>         - Simplified handlng of supplies for BUS_ON/OFF cases in shci_msm_handle_pwr_irq().
>         - Moved common code out of switch case in sdhci_msm_start_signal_voltage_switch().
>         - Updated variable name to sdhci_core_to_disable_vqmmc.
>         - Updated pr_err logs to dev_err logs.
> Veerabhadrarao Badiganti (2):
>   mmc: core: Set default power mode in mmc_alloc_host
>   mmc: sdhci-msm: Use internal voltage control
>
> Vijay Viswanath (1):
>   mmc: sdhci: Allow platform controlled voltage switching
>
>  drivers/mmc/core/host.c      |   1 +
>  drivers/mmc/host/sdhci-msm.c | 206 +++++++++++++++++++++++++++++++++++++++++--
>  drivers/mmc/host/sdhci.c     |  32 ++++---
>  drivers/mmc/host/sdhci.h     |   1 +
>  4 files changed, 218 insertions(+), 22 deletions(-)
>

V5 applied for next (did some minor amendment to patch 2), thanks!

Kind regards
Uffe
