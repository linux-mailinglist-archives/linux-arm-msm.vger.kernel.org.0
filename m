Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 902FA3CB53D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 11:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbhGPJ0x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 05:26:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:43392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232486AbhGPJ0w (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 05:26:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2022613D4;
        Fri, 16 Jul 2021 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626427437;
        bh=SSF2J5AJFadv8lcFZJGE8EsRfI4LjO0tmzEj5iYkobI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NGMn551XD5tSKGn21pbkfq41wRs5x9vdcTeIj802PSKFGPQUA+V++I9JFpHZ0js36
         qxoiOZ7z0B9dlW6yYMu7yE5QoygNKMJimPHc5woHTP3V8BiVevxX+uLo9KkpjSW5+0
         xfW/sj3qlY0cQQxYoeNNQ8pW+3DrzxFBN4rJyY+6R32f01OlQ9ef1uJD7aaDd+tmLu
         rRjji/y8V+FNPkmE+98jtykil3eiJNJvmADoHkCkS35GF1xiLgGrxVGb2spwFbk43G
         vUKt7OwnUYr279kRvh7IxrNq3ZyRL9HlmZESnY2ZrzdgY5xVcKK/QnkY3TGZlbrjLW
         nyO6gY2CXni/Q==
Date:   Fri, 16 Jul 2021 14:53:50 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Amit Pundir <amit.pundir@linaro.org>
Cc:     Jassi Brar <jassisinghbrar@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mailbox: qcom-ipcc: Enable loading QCOM_IPCC as a module
Message-ID: <20210716092350.GG3323@workstation>
References: <20210716074946.4093-1-amit.pundir@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716074946.4093-1-amit.pundir@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 16, 2021 at 01:19:46PM +0530, Amit Pundir wrote:
> This patch enables the qcom_ipcc driver to be loaded as a
> module. IPCC is fairly core to system, so as such it should
> never be unloaded. It registers as a mailbox + irq controller
> and the irq controller drivers in kernel are not supposed to
> be unloaded as they don't have the visibility over the clients
> consuming the irqs. Hence adding supress_bind_attrs to disable
> bind/unbind via sysfs.
> 
> Signed-off-by: Amit Pundir <amit.pundir@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/mailbox/Kconfig     | 2 +-
>  drivers/mailbox/qcom-ipcc.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
> index b4b780ea2ac8..c9fc06c7e685 100644
> --- a/drivers/mailbox/Kconfig
> +++ b/drivers/mailbox/Kconfig
> @@ -264,7 +264,7 @@ config SPRD_MBOX
>  	  you want to build the Spreatrum mailbox controller driver.
>  
>  config QCOM_IPCC
> -	bool "Qualcomm Technologies, Inc. IPCC driver"
> +	tristate "Qualcomm Technologies, Inc. IPCC driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	help
>  	  Qualcomm Technologies, Inc. Inter-Processor Communication Controller
> diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
> index 584700cd1585..f1d4f4679b17 100644
> --- a/drivers/mailbox/qcom-ipcc.c
> +++ b/drivers/mailbox/qcom-ipcc.c
> @@ -277,6 +277,7 @@ static struct platform_driver qcom_ipcc_driver = {
>  	.driver = {
>  		.name = "qcom-ipcc",
>  		.of_match_table = qcom_ipcc_of_match,
> +		.suppress_bind_attrs = true,
>  	},
>  };
>  
> -- 
> 2.25.1
> 
