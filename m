Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7D1253BAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Aug 2020 03:58:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgH0B6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Aug 2020 21:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgH0B63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Aug 2020 21:58:29 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5E5C061363
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 18:58:28 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id e6so3332811oii.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2020 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0gucHHi4ZHmdafDVfQXe+GXJ/XgXdpwzf5ZqQu5NL/k=;
        b=YbsZjk6v9g9Xa9eZaY0SvPFg6XfNVVF3igAoxgS6YrqjRJOWWmDUcMGFqPqg1DH8QI
         63RMGT/RdmKbLmQSo3npyAcapZJCrEb8BSwdBOcfDzZ6g/L5CPTqWIzCimTTUSsYY01a
         rBxdfZc9wFI731j4Ef1onoyunl8aw7pCIFLetDWbh8QbeH/svPSFZMeiv/rl25xTR5Hn
         zKSzYmnNhfZiDMhH8ygB8CAg3sW4/Z43OFBkHRaeGfCDVJY+9uyR/d64I/3jh0ncf5nL
         I7tY2Lr7rHbtXx3kgi2KScHPcaQKcw3i5JB+Di6/zyOqkx1YZqpxBqbVQFWHj2+Y59qJ
         paiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0gucHHi4ZHmdafDVfQXe+GXJ/XgXdpwzf5ZqQu5NL/k=;
        b=e4ULsBLdfj6GqQWrkIuPiZdm+fwqS5uEJ8iKoDFDxygPnNFOJATb4EZG7Utonfsn+I
         sNFuBLCAyho5RTGETaud3Y1bJJBkWjUtKtMLM5t2x4bz+7jb9Z/Cr0Z5Rmvk+YrN4J8t
         PFpRoeLA1uJJlA/T1Qq8lQwAsXVRpOQwWZgz3XGxxCCts8ClI6UJbKvwLun+im7O9SGf
         Am+6GfsBv6/j137C7s8WFZmNQLWWhCWvL3xEiqY9aROoqvC8aV4owtpltzF9vyYKD5IO
         wDq0RHnZP2TSUC1C7Pbj9yk2PI+HtCMD6s7Tup66SJwOT7KlWrmhXtt1Qgmf/G/Ep/QG
         RgFA==
X-Gm-Message-State: AOAM531GC3YUd7dQ8ShMnzY2moBAHNk1S12mb/jZcWUvWW/uFmMis2nD
        iGpVd+n6Gqbo6gHTLqCVB0IKLw==
X-Google-Smtp-Source: ABdhPJwpb3rQUmO+jOUwJ2+AiZW58Lr8FDMKLclX7/euqgJHWZbF4b6YOfxhfo9xy8vwFra33QQoow==
X-Received: by 2002:aca:5bc6:: with SMTP id p189mr5356770oib.130.1598493507642;
        Wed, 26 Aug 2020 18:58:27 -0700 (PDT)
Received: from yoga ([2605:6000:e5cb:c100:8898:14ff:fe6d:34e])
        by smtp.gmail.com with ESMTPSA id l6sm185018otd.20.2020.08.26.18.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 18:58:26 -0700 (PDT)
Date:   Wed, 26 Aug 2020 20:58:24 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     andy.gross@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ulf.hansson@linaro.org,
        swboyd@chromium.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        John Stultz <john.stultz@linaro.org>,
        Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh: Allow RPMH driver to be loaded
 as a module
Message-ID: <20200827015824.GH3715@yoga>
References: <1598354482-15491-1-git-send-email-mkshah@codeaurora.org>
 <1598354482-15491-3-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1598354482-15491-3-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Aug 06:21 CDT 2020, Maulik Shah wrote:

> From: John Stultz <john.stultz@linaro.org>
> 
> This patch allow the rpmh driver to be loaded as a permenent
> module. Meaning it can be loaded from a module, but then cannot
> be unloaded.
> 
> Ideally, it would include a remove hook and related logic, but
> the rpmh driver is fairly core to the system, so once its loaded
> with almost anything else to get the system to go, the dependencies
> are not likely to ever also be removed.
> 
> So making it a permanent module at least improves things slightly
> over requiring it to be a built in driver.
> 
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> [mkshah: Fix typos in commit message, send after removing _rcuidle trace]
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/soc/qcom/Kconfig    | 2 +-
>  drivers/soc/qcom/rpmh-rsc.c | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 3dc3e3d..892bdc7 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -92,7 +92,7 @@ config QCOM_RMTFS_MEM
>  	  Say y here if you intend to boot the modem remoteproc.
>  
>  config QCOM_RPMH
> -	bool "Qualcomm RPM-Hardened (RPMH) Communication"
> +	tristate "Qualcomm RPM-Hardened (RPMH) Communication"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	help
>  	  Support for communication with the hardened-RPM blocks in
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index fabe390d..5fce87c 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -13,6 +13,7 @@
>  #include <linux/iopoll.h>
>  #include <linux/kernel.h>
>  #include <linux/list.h>
> +#include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_irq.h>
>  #include <linux/of_platform.h>
> @@ -1025,6 +1026,7 @@ static const struct of_device_id rpmh_drv_match[] = {
>  	{ .compatible = "qcom,rpmh-rsc", },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, rpmh_drv_match);
>  
>  static struct platform_driver rpmh_driver = {
>  	.probe = rpmh_rsc_probe,
> @@ -1040,3 +1042,6 @@ static int __init rpmh_driver_init(void)
>  	return platform_driver_register(&rpmh_driver);
>  }
>  arch_initcall(rpmh_driver_init);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. RPMh Driver");
> +MODULE_LICENSE("GPL v2");
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
