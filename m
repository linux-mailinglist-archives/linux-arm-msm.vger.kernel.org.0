Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D486943F2ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 00:44:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbhJ1Wq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 18:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbhJ1Wq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 18:46:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 693C1C061570;
        Thu, 28 Oct 2021 15:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=1aP1RuxewBS7vDJk8te7l3M2iURYtqKADbLflxFn3qY=; b=R4WDzWL0Kr3H1+AoXPvIDhxxj4
        Gfge9IWEXlstzPMRlLUsHxFNIBN0l6uL3b4/EUHct3vqeaLtkBAFmhg9TARbJkLWtaudQtrPDt6L4
        iAQXWQ1dGnQmweRnsPEtHqPasrJY6ndE166qpA5dA5fe65o+JXzRyckVAxNzbS/C9hmnGrVfoNRUb
        ZTrNaoSX6ZAvJRJeKzuMH+DpC5EbI8/z8AFDyt0F+HnMiqdnkqd8RyxWkos7OAMWdOQuHH4fnqsLK
        eXemr4LlpzHWv3wRb4BGFuYhHG+4+vheDEMWwTwbkjo4hC1Xk1K8kE/k3Laj7u8XGFyspFYkaUjji
        4gqRgnYA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mgE7q-009GEi-W5; Thu, 28 Oct 2021 22:43:59 +0000
Subject: Re: [PATCH 2/3] platform: surface: Add surface xbl
To:     Jarrett Schultz <jaschultzms@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
 <20211028211753.573480-3-jaschultzMS@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <788208ca-abc4-70d3-7367-9489b0faead4@infradead.org>
Date:   Thu, 28 Oct 2021 15:43:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028211753.573480-3-jaschultzMS@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/28/21 2:17 PM, Jarrett Schultz wrote:
> diff --git a/drivers/platform/surface/Kconfig b/drivers/platform/surface/Kconfig
> index 3105f651614f..ca0546397414 100644
> --- a/drivers/platform/surface/Kconfig
> +++ b/drivers/platform/surface/Kconfig
> @@ -180,6 +180,16 @@ config SURFACE_PRO3_BUTTON
>   	help
>   	  This driver handles the power/home/volume buttons on the Microsoft Surface Pro 3/4 tablet.
>   
> +config SURFACE_XBL
> +	tristate "Surface XBL Driver"
> +	depends on ARM64 || COMPILE_TEST
> +	help
> +	  If you say 'Y' to this option, support will be included for the
> +	  Surface XBL Driver.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called surface-xbl.

Hi,

Can you tell the user/reader what XBL means, please?

Don't assume that they will look at some documentation.

thanks.
-- 
~Randy
