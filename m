Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA33A1A8E7C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 00:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387738AbgDNWX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 18:23:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387737AbgDNWXW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 18:23:22 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A527DC061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 15:23:22 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id n10so625836pff.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 15:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UFTe4u5Y74nPDHZ96JTUPe7I2cuWzSZ7zVu37QG7nxg=;
        b=NHwXF7BNmRRnYfJyCE3haY1AahmmfCthI7mGWYzziRasWPI1YmJBTTV+5GuwfudtyF
         bR/8ac0TBsnDppONC+nXC5Xv6ALHiGO/+sOFJIrLZ8pnWqF6cd9rpy7x0/nViUJYloNp
         Ppx+0J+M1H4nuDt3iesHq8+ma07gHLcz5N/MUuANxDYsx17DK7sRQqoqzGhgQFQRaCiz
         8MP4IENPPh0QviIFJXYCiJLhzWp3E9PDbTp4f4qESOZosVJ1cNFOrWbLYf0QKGF+K2ue
         5PqACvbDOr29sgeIMpfhxMV4ufkul79aJmXeUvBbouuwHq+E5q+UX+ySwUZ7Cucm0ltl
         M74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UFTe4u5Y74nPDHZ96JTUPe7I2cuWzSZ7zVu37QG7nxg=;
        b=n2G57bzxumqxy85jrR5kKYj+ORA02Sl918XJ/EZIZHrlUktfpkFR3cAhhJBYvUucCB
         1NltXP8t2PIo04NM18GG21gFfvPZHZW0SueW9HufhYxG9IPUJryU/cDWI2GTnni1yAOM
         PzGIpRr3NUW5HKkKz0H2/L8hGZjBXin6FBXC1wN/G2bHgpkYnMsfAG63ZZ/4pb+j77Ea
         Daukn17FDLV5ra322KpIoh/13IEjJndqtljo/7bLxw8CPU543aFDNGoA76/InfVTPtKz
         37Y48wY5W+ZSPNGikiBRcMmrrotSnaYVthmS1cojwmpYif2oNNyW3yRpY7+qtpRjmgeR
         +Xsg==
X-Gm-Message-State: AGi0PuZ490MqC0CJKLICFD0WCt4d2GtPkVsk5ZIck7rncZoVdQiKq2cD
        Voa46ZjhbcoAwwxAGCXTF0vS2A==
X-Google-Smtp-Source: APiQypITsjTqqYH98qq3TOSpyhUC81raNdwb1weMAeIKOc2+d9XkPYBJ7Nz0PeVpgu94Ae1bDoyfWA==
X-Received: by 2002:a65:6910:: with SMTP id s16mr25161005pgq.426.1586903002149;
        Tue, 14 Apr 2020 15:23:22 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id y126sm6496046pgy.91.2020.04.14.15.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:23:21 -0700 (PDT)
Date:   Tue, 14 Apr 2020 15:23:37 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 2/3] soc: qcom: rpmh: Allow RPMH driver to be loaded
 as a module
Message-ID: <20200414222337.GM576963@builder.lan>
References: <20200326224459.105170-1-john.stultz@linaro.org>
 <20200326224459.105170-3-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326224459.105170-3-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 26 Mar 15:44 PDT 2020, John Stultz wrote:

> This patch allow the rpmh driver to be loaded as a permenent
> module. Meaning it can be loaded from a module, but then cannot
> be unloaded.
> 
> Ideally, it would include a remove hook and related logic, but
> the rpmh driver is fairly core to the system, so once its loaded
> with almost anythign else to get the system to go, the dependencies
> are not likely to ever also be removed.
> 
> So making it a permenent module at least improves things slightly
> over requiring it to be a built in driver.
> 
> Feedback would be appreciated!
> 
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

and applied.

Regards,
Bjorn

> ---
>  drivers/soc/qcom/Kconfig    | 2 +-
>  drivers/soc/qcom/rpmh-rsc.c | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index af774555b9d2..ac91eaf810f7 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -104,7 +104,7 @@ config QCOM_RMTFS_MEM
>  	  Say y here if you intend to boot the modem remoteproc.
>  
>  config QCOM_RPMH
> -	bool "Qualcomm RPM-Hardened (RPMH) Communication"
> +	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
>  	depends on ARCH_QCOM && ARM64 || COMPILE_TEST
>  	help
>  	  Support for communication with the hardened-RPM blocks in
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index e278fc11fe5c..30585d98fdf1 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -11,6 +11,7 @@
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> @@ -679,6 +680,8 @@ static const struct of_device_id rpmh_drv_match[] = {
>  	{ .compatible = "qcom,rpmh-rsc", },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, rpmh_drv_match);
> +
>  
>  static struct platform_driver rpmh_driver = {
>  	.probe = rpmh_rsc_probe,
> @@ -693,3 +696,6 @@ static int __init rpmh_driver_init(void)
>  	return platform_driver_register(&rpmh_driver);
>  }
>  arch_initcall(rpmh_driver_init);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. RPMh Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> 2.17.1
> 
