Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96AF0412B98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Sep 2021 04:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347398AbhIUCUe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Sep 2021 22:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346504AbhIUCS1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Sep 2021 22:18:27 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BACC19B988
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 11:37:29 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id w19so26069798oik.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Sep 2021 11:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=jmXZy3ZYvnQVJiuweO1D44zeGFgPGw08yvPDo3Pbv3I=;
        b=XC/luEuyaaVLTUmi5opLPnA6doYbam6Ho1XLD8rcmdYqJh3aNOv0BdhgEwj5+kFa6a
         W8dqAsWR2A15gn0ryUMmKW9v6l5p9RKxU3wGWDR9gYHSWg5jtxe0vfozBmPhNX5psSJF
         H7pZnBexjPRejL4f/Fv8aVmTQoZUXpmjOY+Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=jmXZy3ZYvnQVJiuweO1D44zeGFgPGw08yvPDo3Pbv3I=;
        b=8DeOPagbwk2AUYGRF0VD7OzHtHDJ8OegOvJM+wJ7SLZQT+QbWYx2fAMiDyZ3PSZrm9
         KeTPnTWwWKdsP33EKFlUBBT0KdpLAonkmMDhXbfgXrhOokwMQ5Lh35q0e6P2ltpPqLmn
         lVqrrA1MtN0WF9y1LL9JsCtN82v7nowE9GWvQcO4wkJtqQsG5R18L0vfDv7/bgq4773k
         d3NYthduNnm+IAX+ORKclXptBDX1+k1Aod9YQ6/izfSFS7bK3Xqqc3B1DxUooK/Uo3qQ
         bsU/nmw5fTpKk/Cvkh+XCMMISmf9jdZFF9JSci3OOYysj2+bmd2k9yqeeTL/EfltVn7p
         d9VA==
X-Gm-Message-State: AOAM533PuIPCQoqt573fuf6C6DyFqNzzM8H8eTRJVIXYYr9CMLOfuciH
        oRC4Q7XYBqdr8jr3qT0dD5Rwi69UNmrzrbV7Zb/LRw==
X-Google-Smtp-Source: ABdhPJwTEOlyaEX2x1B4YxNYuz+/kb9trz+bEZyg85Y6kB+G2b1jo3lw9p6nhwOGPHG8hiStsXeknZg1kStsTv/bazU=
X-Received: by 2002:aca:1a11:: with SMTP id a17mr384978oia.164.1632163048399;
 Mon, 20 Sep 2021 11:37:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Sep 2021 11:37:28 -0700
MIME-Version: 1.0
In-Reply-To: <1631991735-18920-1-git-send-email-deesin@codeaurora.org>
References: <1631991735-18920-1-git-send-email-deesin@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 20 Sep 2021 11:37:27 -0700
Message-ID: <CAE-0n52Gqossa9V-tPLHsgggQ_MHt_zD7gzrjUVrU7Rno-4f8w@mail.gmail.com>
Subject: Re: [PATCH V4 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P IRQ
To:     Deepak Kumar Singh <deesin@codeaurora.org>,
        bjorn.andersson@linaro.org, clew@codeaurora.org,
        sibis@codeaurora.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Deepak Kumar Singh (2021-09-18 12:02:15)
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 2df4883..60ad632 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -14,6 +14,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
>  #include <linux/regmap.h>
>  #include <linux/soc/qcom/smem.h>
>  #include <linux/soc/qcom/smem_state.h>
> @@ -538,9 +539,26 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>                 goto unwind_interfaces;
>         }
>
> +       /*
> +        * Treat smp2p interrupt as wakeup source, but keep it disabled
> +        * by default. User space can decide enabling it depending on its
> +        * use cases. For example if remoteproc crashes and device wants
> +        * to handle it immediatedly (e.g. to not miss phone calls) it can
> +        * enable wakeup source from user space, while other devices which
> +        * do not have proper autosleep feature may want to handle it with
> +        * other wakeup events (e.g. Power button) instead waking up immediately.
> +        */
> +       device_set_wakeup_capable(&pdev->dev, true);
> +
> +       ret = dev_pm_set_wake_irq(&pdev->dev, irq);
> +       if (ret)
> +               goto set_wake_irq_fail;
>
>         return 0;
>
> +set_wake_irq_fail:
> +       dev_pm_clear_wake_irq(&pdev->dev);
> +
>  unwind_interfaces:
>         list_for_each_entry(entry, &smp2p->inbound, node)
>                 irq_domain_remove(entry->domain);
> @@ -565,6 +583,9 @@ static int qcom_smp2p_remove(struct platform_device *pdev)
>         struct qcom_smp2p *smp2p = platform_get_drvdata(pdev);
>         struct smp2p_entry *entry;
>
> +       dev_pm_clear_wake_irq(&pdev->dev);
> +       device_init_wakeup(&pdev->dev, false);

Is this device_init_wakeup() call necessary? It looks like we can get
away without it and then once this driver probes the device will have
the wakeup capability set on it. Future binding/unbinding of the driver
will keep working.
