Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34D43EDD18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 20:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhHPScY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 14:32:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230102AbhHPScY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 14:32:24 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ECCCC0613C1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 11:31:52 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id oa17so27958075pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 11:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=P8DIXUMiWfpgr4xiz7M1lZjbV422f4u1f8RA8daYKwY=;
        b=Y1bHjiUg1/uo6UKofntGpU/ZbEsHifM0SwBLuaQ7Jw5m72bq+BPsNs+BRugmgUNIeX
         gocGufpnx8xIAoqbwpdmXw00bpDw7Wxtbh0XIJyjcBkLR4e/6K/WhFEY4FImr7QUl2E/
         TtsQrBOdEXsTxxCaauBKdfznYy6uo0w2uITDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=P8DIXUMiWfpgr4xiz7M1lZjbV422f4u1f8RA8daYKwY=;
        b=sZrhCmhZvqKY3B06dgFUynzWueNz2WnUUFIjIx6P9dJF/R2xFoHuAWB3/H5Ml09d/M
         +NM2thSw1T6AIzf/S0IQheUmfrV+G6793EY6foWXSKIBTXDSeQEqf0YGx/bom04+fd5s
         cESrWG88DqbXFq/2OMsZu7yOvSlPIYUoQ3mA4ByYxbQMhJkQi2fQ6IxKc4myX00Y52Js
         nA5lL/INPekHTO//jT/Sw/flF1uZUyx1n/rxvmgx/hNr1byJmBQPSUMDrroFkJ7c517e
         0jF+FHEZdFeVDE7CBo0Mb7Q/4cs42iMqddHopEIxa7xrARHvJ83507/lTsGcpiqPH6Vi
         4YrQ==
X-Gm-Message-State: AOAM533AN7tZIDfeNaAL0gH4H4LpZI2iMWmEvap3zM3lQ7jllMttW8kD
        eMIPL8vxxBjLKGJbqYLnVYEAlw==
X-Google-Smtp-Source: ABdhPJwP0+ppbwzuAALtAJstVM8BY2ZJK6ehuGRK7VCp/BFOHhAvQ06CxsU9A8S2m8rrl2QBn4w+tw==
X-Received: by 2002:aa7:98da:0:b029:3e0:8b98:df83 with SMTP id e26-20020aa798da0000b02903e08b98df83mr81603pfm.63.1629138711918;
        Mon, 16 Aug 2021 11:31:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:5cff:3a19:755c:1b91])
        by smtp.gmail.com with UTF8SMTPSA id g26sm114755pgb.45.2021.08.16.11.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 11:31:51 -0700 (PDT)
Date:   Mon, 16 Aug 2021 11:31:49 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        clew@codeaurora.org, sibis@codeaurora.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>
Subject: Re: [PATCH V2 1/1] soc: qcom: smp2p: Add wakeup capability to SMP2P
 IRQ
Message-ID: <YRqvFVw1EJl+dnM+@google.com>
References: <1629108335-23463-1-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1629108335-23463-1-git-send-email-deesin@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 16, 2021 at 03:35:35PM +0530, Deepak Kumar Singh wrote:
> Remote susbsystems notify fatal crash throught smp2p interrupt.
> When modem/wifi crashes it can cause soc to come out of low power state
> and may not allow again to enter in low power state until crash is handled.
> 
> Mark smp2p interrupt wakeup capable so that interrupt handler is executed
> and remote susbsystem crash can be handled in system  resume path.
> 
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> ---
>  drivers/soc/qcom/smp2p.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index 2df4883..646848b 100644
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
> @@ -538,9 +539,20 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>  		goto unwind_interfaces;
>  	}
>  
> +	/* Setup smp2p interrupt as wakeup source */
> +	ret = device_init_wakeup(&pdev->dev, true);
> +	if (ret)
> +		goto unwind_interfaces;
> +
> +	ret = dev_pm_set_wake_irq(&pdev->dev, irq);
> +	if (ret)
> +		goto set_wakeup_failed;
>  
>  	return 0;
>  
> +set_wakeup_failed:
> +	device_init_wakeup(&pdev->dev, false);
> +

I think you need to call dev_pm_clear_wake_irq() and
device_init_wakeup(..., false) in qcom_smp2p_remove()
to free all resources.

