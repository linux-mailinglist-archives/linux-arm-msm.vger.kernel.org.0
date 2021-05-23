Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C95A38D934
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 May 2021 08:00:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbhEWGBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 23 May 2021 02:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbhEWGBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 23 May 2021 02:01:44 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05870C06138B
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 23:00:16 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x188so18152031pfd.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 May 2021 23:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mBfopW5d3IJHx9JAp5B2XG/55RVDXUQjqthuHE97u5E=;
        b=oSUc4Et4QiFnyKSiNcVYAevijCAa18konknMw+/Lyxctxi3kgxrEgTSu1LTwF9pE3G
         n5Jgq/loSBV/hHtGZrogeyBTsK1V81mxjKeBnwk/sIetldbBf/6C3vndCA7XKnZbD7XK
         jEDEisMicrEHkQHgy0LNOIoNIuekH2Xl9q1lzrLHbsb407nv0Ji8Xa0WL2m0JueaBK2A
         iSNrWBQ71UDRv1PvPh7Ggw4p2yZ0qWYirBwsnk8WU3PkSuh/O5jbOld8jbvcKLKVypYD
         vGxwEIL8vEEJ0jhq85FHQfwHSo5CywoWZjK1VxuZtC5jc9gEEm4uyu5iSMGTYEfL/UWC
         TrLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mBfopW5d3IJHx9JAp5B2XG/55RVDXUQjqthuHE97u5E=;
        b=ReEWjhPjThLW6N+2D+w40YcLTNBVc1kRwxxdIyGkJfy2jAVdS76oSDYBliWwMyGJBj
         cAtntStunWBheWYaxKyypn6S3WymvEALlQlxNh57RmHiZuc/1TpKNmstg/1JYSg15dDg
         R/67mbgFnG+hm9r8Vw0lLJve50uz6QeDgmNrJwTwHnXAOibHGL22V9KJPGgtj7e2JMWz
         QYQ0S64S6Bz0mgTcR4PkQTa/+GNWs881A7Q21XgUdt3DskTYf72uDLVh5fXyL0sFT8LW
         nK8QsnxnoRK+M34xmvNbqWUVCK8KttVXNGuWf0rroM/UJu4XkLlz/jeNBjl97YncK8Lp
         75vw==
X-Gm-Message-State: AOAM530klEDNrT/hoQBSYnTKKe+F7Z6Q5vq8nY81LYvKg6JX3tXH1SdK
        +Vl/KAmAcPxAOa5EzUop8EER2w==
X-Google-Smtp-Source: ABdhPJzfwtxQNO5KyXLzrphaldJNDNvilmz5Qk2gCNQ8wt6N4NdfsbWD59wj/nRMo4RZdWAFOj66gQ==
X-Received: by 2002:a63:5c1:: with SMTP id 184mr7420865pgf.75.1621749616457;
        Sat, 22 May 2021 23:00:16 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y20sm7267931pfn.164.2021.05.22.23.00.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 22 May 2021 23:00:15 -0700 (PDT)
Date:   Sun, 23 May 2021 14:00:10 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Jassi Brar <jassisinghbrar@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Benjamin Li <benl@squareup.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mailbox: qcom: Add MSM8939 APCS support
Message-ID: <20210523060009.GA29015@dragon>
References: <20210503081334.17143-1-shawn.guo@linaro.org>
 <20210503081334.17143-3-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503081334.17143-3-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 03, 2021 at 04:13:34PM +0800, Shawn Guo wrote:
> MSM8939 has 3 APCS instances for Cluster0 (little cores), Cluster1 (big
> cores) and CCI (Cache Coherent Interconnect).  Although only APCS of
> Cluster0 and Cluster1 have IPC bits, each of 3 APCS has A53PLL clock
> control bits.  That said, we need to register 3 'qcom-apcs-msm8916-clk'
> devices to instantiate all 3 clocks.  Let's use PLATFORM_DEVID_AUTO
> rather than PLATFORM_DEVID_NONE for platform_device_register_data()
> call.  Otherwise, the second A53PLL clock registration will fail due
> to duplicate device name.
> 
> [    0.519657] sysfs: cannot create duplicate filename '/bus/platform/devices/qcom-apcs-msm8916-clk'
> ...
> [    0.661158] qcom_apcs_ipc b111000.mailbox: failed to register APCS clk
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Hi Jassi,

Any comment on this patch?

Shawn

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index f25324d03842..1699ec38bc3b 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -132,7 +132,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  	if (apcs_data->clk_name) {
>  		apcs->clk = platform_device_register_data(&pdev->dev,
>  							  apcs_data->clk_name,
> -							  PLATFORM_DEVID_NONE,
> +							  PLATFORM_DEVID_AUTO,
>  							  NULL, 0);
>  		if (IS_ERR(apcs->clk))
>  			dev_err(&pdev->dev, "failed to register APCS clk\n");
> @@ -158,6 +158,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>  	{ .compatible = "qcom,ipq6018-apcs-apps-global", .data = &ipq6018_apcs_data },
>  	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq8074_apcs_data },
>  	{ .compatible = "qcom,msm8916-apcs-kpss-global", .data = &msm8916_apcs_data },
> +	{ .compatible = "qcom,msm8939-apcs-kpss-global", .data = &msm8916_apcs_data },
>  	{ .compatible = "qcom,msm8994-apcs-kpss-global", .data = &msm8994_apcs_data },
>  	{ .compatible = "qcom,msm8996-apcs-hmss-global", .data = &msm8996_apcs_data },
>  	{ .compatible = "qcom,msm8998-apcs-hmss-global", .data = &msm8998_apcs_data },
> -- 
> 2.17.1
> 
