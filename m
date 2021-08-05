Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 615073E1CE4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 21:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238328AbhHETk0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 15:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237546AbhHETkZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 15:40:25 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB94C061798
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 12:40:10 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id e13-20020a056830200db02904f06fa2790cso6331287otp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 12:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=u516B4IDOq5HPZ3Fekbj0IXtz4ADHjdylXCRO6f+AtE=;
        b=Mj7GAi0LhIrpfGb8uOKnGR/1zqnyjRwyav0vcbe0Y2ll2nJVjdD3w5fZLmJac1xna5
         cBnIfhhuhtP9c2xQQoTF7mNLscEpuTlg1IHdvxFvr8P7rQ+mwFDPbUoNftn96DU+s/RI
         6N+4Zs4ZI3Z+K6hgwc9kBUK41Isvxa6/s52ZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=u516B4IDOq5HPZ3Fekbj0IXtz4ADHjdylXCRO6f+AtE=;
        b=mi3tRJWwD720/CXrmikQx7koMgmHtoYRVSbccuSCf3/RjO2Q+wmWjcWPGPXats5b2v
         olUGyouwJG2AbDDCzvkYPQBgrvldyqNHexfp81Nl10P1gQeVucSGBfHKnXJXQe2LbTAL
         IOmO1JxLvdV7lDHMAorGtJB9aFxvjQu3f24GWrCZeIA7IJX0n68hwgIFK6x1u1ILcnDd
         nMfEEZiUB5fiv1m3mJjI50tvcZEIVYHx8nkxl/gt+qiUlKlaHCX9tzyI7TYbjGoF2q23
         5w5J93fmGJBCFDVdpwPZ3V7DX7znDd2zMcpTwZSTppd5edZcVsCM1nM/C2HsRK0npDxe
         Jl7g==
X-Gm-Message-State: AOAM533bmGFzwC7fg8Tr4ZfrotP7NDPPOBVm1Aw0xD1R/+O56fw3HjC4
        wyDS8EuVjsPaUmj7rtmSiIBLrzkAc3ND7NVUCwo4wg==
X-Google-Smtp-Source: ABdhPJwSKh/dCjbC1x/LRZpD3rrmsUjweEJ0zHyBAS26I7atE8009pKiiiZweJ5j1Tia6FY8WUQO0zSJaxd9F3lNYn4=
X-Received: by 2002:a05:6830:1490:: with SMTP id s16mr5020325otq.233.1628192409655;
 Thu, 05 Aug 2021 12:40:09 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 5 Aug 2021 12:40:09 -0700
MIME-Version: 1.0
In-Reply-To: <1628180254-758-1-git-send-email-deesin@codeaurora.org>
References: <1628180254-758-1-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 5 Aug 2021 12:40:09 -0700
Message-ID: <CAE-0n5203g4CkF5WP1fQYU57fntXbdyVBsMsTKU_xPkgvbt+7Q@mail.gmail.com>
Subject: Re: [PATCH V1 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-08-05 09:17:33)
> Some use cases require SMP2P interrupts to wake up the host
> from suspend.

Please elaborate on this point so we understand what sort of scenarios
want to wakeup from suspend.

> Mark smp2p interrupt as wakeup capable to abort
> the suspend.
>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/smp2p.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 2df4883..f8659b0 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -18,6 +18,7 @@
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/smem_state.h>
>  #include <linux/spinlock.h>
> +#include <linux/pm_wakeirq.h>
>
>  /*
>   * The Shared Memory Point to Point (SMP2P) protocol facilitates communication
> @@ -538,9 +539,19 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>                 goto unwind_interfaces;
>         }
>
> +       ret = device_init_wakeup(&pdev->dev, true);

Is smp2p supposed to wake up the device by default? If not, then this
should be device_set_wakeup_capable() instead so that userspace can
decide if it wants to get the wakeup.

> +       if (ret)
> +               goto unwind_interfaces;
> +
> +       ret = dev_pm_set_wake_irq(&pdev->dev, irq);
> +       if (ret)
> +               goto set_wakeup_failed;

Otherwise this looks good to me.

>
>         return 0;
>
> +set_wakeup_failed:
> +       device_init_wakeup(&pdev->dev, false);
> +
>  unwind_interfaces:
>         list_for_each_entry(entry, &smp2p->inbound, node)
>                 irq_domain_remove(entry->domain);
