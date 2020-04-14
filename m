Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 802B31A8E79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 00:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387648AbgDNWVt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 18:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728100AbgDNWVn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 18:21:43 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B6DC061A0C
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 15:21:43 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 188so557502pgj.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 15:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZwCrJaGxUOzJeHGKvHVPJYFgPdIhYcpo9yljCYyVINA=;
        b=ztxpc9P/5puzYuVP0ylIYDNls2wP+oCoQ5LomytlmZgClZ8aqrPg2fpqTfLkJP0M5d
         M5oSppS5NwlpOa/pz5s2uovRhN+jYnYinexRX3NPf63kKPMvZ7zhLwaTtbi9D9jCqpER
         mhqeL3QaxlvVdHn++gqu5g9eBYEnmz1e7jyFNlaAkPNUGcq7wbWL/gXE8mi0BxjCDtQ6
         Lt/2iTHeZcRji2SzUGOiKfZiqGfELyN/ghfduK24lqDlUfw4TaMWSfFUPmHqzq6HC9QR
         PcAbJkyq3KZ5gFA6edT3pBTPuojwr1xEiYfG21HRCwtcecUblGhE1kS0PHNwBzQFC76t
         0oVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZwCrJaGxUOzJeHGKvHVPJYFgPdIhYcpo9yljCYyVINA=;
        b=BNBPctmEzMyhAbpgmFSO1+atIL+wAHGoB2MfNWotT3fSzxODzWkT2NQyvMKUFEIVm+
         RCLFVHr8PBd1vIYCbp6jV+s4Gho/l7KJAyPqLkiIhFNEEIDw48GUryrGZ0QAaYlNoz56
         jMoku++nBNRP/2MT9/rSyL2W4Qt/4mMOMrKNdUWsp//fTvbv5PpPryIr2nympqeHYz/r
         bezYschF6Z0/6IwyGvdh0W1Cvcryq28oTQtk/2/9HwZAbAIzcScJp1oibwlG1Gn+qwjm
         8/x2P287JLnFv5qlRuKIz7OyTiCa9rQP/Q/R5cHcbGGEaGUk3ylYOJGnrynDFVqBbATC
         86FQ==
X-Gm-Message-State: AGi0PubAACsQuXgJCYcWAU5zh5DdAnWWR4vHmTySQ3qmMLTrbAsnJQYn
        3U2G24v4d0OYRLJDecbi0aihxw==
X-Google-Smtp-Source: APiQypJK7Z+ffXbRR1wnDe41MyryqC1NgQllHHYkqbCtNvpgKWSRtwZTf1HG5yhq46Qb6hqUYGuF7w==
X-Received: by 2002:a62:5c1:: with SMTP id 184mr13429191pff.68.1586902903205;
        Tue, 14 Apr 2020 15:21:43 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g9sm11056999pgc.46.2020.04.14.15.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 15:21:42 -0700 (PDT)
Date:   Tue, 14 Apr 2020 15:21:58 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>, Todd Kjos <tkjos@google.com>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/3] soc: qcom: rpmpd: Allow RPMPD driver to be loaded
 as a module
Message-ID: <20200414222158.GL576963@builder.lan>
References: <20200326224459.105170-1-john.stultz@linaro.org>
 <20200326224459.105170-2-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200326224459.105170-2-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 26 Mar 15:44 PDT 2020, John Stultz wrote:

> This patch allow the rpmpd driver to be loaded as a permenent
> module. Meaning it can be loaded from a module, but then cannot
> be unloaded.
> 
> Ideally, it would include a remove hook and related logic, but
> apparently the genpd code isn't able to track usage and cleaning
> things up? (See: https://lkml.org/lkml/2019/1/24/38)
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
> Acked-by: Saravana Kannan <saravanak@google.com>
> Signed-off-by: John Stultz <john.stultz@linaro.org>
> ---
> v2:
> * Fix MODULE_LICENSE to be GPL v2 as suggested by Bjorn
> * Leave initcall as core_initcall, since that switches to module_initcall
>   only when built as a module, also suggested by Bjorn
> * Add module tags taken from Rajendra's earlier patch
> ---
>  drivers/soc/qcom/Kconfig | 4 ++--
>  drivers/soc/qcom/rpmpd.c | 6 ++++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index d0a73e76d563..af774555b9d2 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -123,8 +123,8 @@ config QCOM_RPMHPD
>  	  for the voltage rail.
>  
>  config QCOM_RPMPD
> -	bool "Qualcomm RPM Power domain driver"
> -	depends on QCOM_SMD_RPM=y
> +	tristate "Qualcomm RPM Power domain driver"
> +	depends on QCOM_SMD_RPM
>  	help
>  	  QCOM RPM Power domain driver to support power-domains with
>  	  performance states. The driver communicates a performance state
> diff --git a/drivers/soc/qcom/rpmpd.c b/drivers/soc/qcom/rpmpd.c
> index 2b1834c5609a..22fe94c03e79 100644
> --- a/drivers/soc/qcom/rpmpd.c
> +++ b/drivers/soc/qcom/rpmpd.c
> @@ -5,6 +5,7 @@
>  #include <linux/init.h>
>  #include <linux/kernel.h>
>  #include <linux/mutex.h>
> +#include <linux/module.h>

module comes before mutex in the alphabet.

>  #include <linux/pm_domain.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> @@ -226,6 +227,7 @@ static const struct of_device_id rpmpd_match_table[] = {
>  	{ .compatible = "qcom,qcs404-rpmpd", .data = &qcs404_desc },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, rpmpd_match_table);
>  
>  static int rpmpd_send_enable(struct rpmpd *pd, bool enable)
>  {
> @@ -422,3 +424,7 @@ static int __init rpmpd_init(void)
>  	return platform_driver_register(&rpmpd_driver);
>  }
>  core_initcall(rpmpd_init);
> +
> +MODULE_DESCRIPTION("Qualcomm Technologies, Inc. RPM Power Domain Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:qcom-rpmpd");

Is there any reason for this alias?

The module will be automatically loaded based on compatible and the
MODULE_DEVICE_TABLE() information above, and for ACPI would need a
similar acpi_device_id table.

Regards,
Bjorn

> -- 
> 2.17.1
> 
