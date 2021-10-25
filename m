Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3696B43A4A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 22:26:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238624AbhJYU2y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 16:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236738AbhJYU2v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 16:28:51 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A46AC0431AE;
        Mon, 25 Oct 2021 13:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=TOmVv8RYdCP7WdPI2k4qRR3ZB98gyGZVm4ksO65sAaE=; b=gYwBtb47VFNrl8RHglhpwGrp57
        tclObzk4zOl404oHQ5i2qHI0hHk8FK6Rg+41I2RQ3hzHba56WregGCW7F50QTrmFsHVwBPHL/5OZa
        aWtvQ9cg5/FtbUTG3+0I8yfciHstqC7WiWQXZOxADfhzS+kFo8ZoEtWgZn8LP+qhgavIond7Z/TIX
        EBnaMS60XNBkjVdohaMo/0Uz/sk1GYX1xRjLONkIkopMuYAxPhYhcVFGmxfQd41Pn8eEOhkrliyP4
        H0Xn/D6mqoI/eyd3BeTt1r6vv2HB0niAiVr6CArorJj3Q6NPAKF/oVfiJajn+O/Y+BU/ONWejK91L
        SLZItRFw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mf6Ta-00Ha1r-FF; Mon, 25 Oct 2021 20:21:46 +0000
Subject: Re: [PATCH 6/6] usb: typec: qcom: Add pm8150b TCPM driver
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     wcheng@codeaurora.org
References: <20211025150906.176686-1-bryan.odonoghue@linaro.org>
 <20211025150906.176686-7-bryan.odonoghue@linaro.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f650d244-59e6-406a-a342-b3f9214c2d25@infradead.org>
Date:   Mon, 25 Oct 2021 13:21:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211025150906.176686-7-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi--

On 10/25/21 8:09 AM, Bryan O'Donoghue wrote:
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 557f392fe24da..4ec0e230f7be4 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -66,4 +66,15 @@ config TYPEC_WCOVE
>   	  To compile this driver as module, choose M here: the module will be
>   	  called typec_wcove.ko
>   
> +config TYPEC_QCOM_PMIC
> +	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	help
> +	  A Type-C port and power-deliver driver. This driver aggregates

	                          delivery

> +	  together two discreet pieces of silicon in the PM8150b PMIC block the

"together" is redundant after "aggregates."
It's nice of them to be discreet, but "discrete" would be better here.
So:
	  two discrete pieces of silicon in the PM8150b PMIC block: the

> +	  Type-C port controller and the power delivery PHY.
> +
> +	  This driver provides Type-C role switching, orientation, Alternate
> +	  mode and Power Delivery support both for VBUS and VCONN.
> +
>   endif # TYPEC_TCPM


-- 
~Randy
