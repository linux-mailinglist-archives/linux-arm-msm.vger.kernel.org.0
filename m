Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1612727071B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 22:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIRUbj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 16:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgIRUbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 16:31:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E1DEC0613CE;
        Fri, 18 Sep 2020 13:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=o9/imEnW9/JE981eQ7g+rdek3o0kI3zgkkujwrqFQ5I=; b=uDbL0HEBNBVE3o7olUIpMaBLYQ
        rA+e3k9vQopqp7W66Ikv6hHym5E/XrfaZldc/HRXU4U/AnaY8Qg2jUg9h9ydIVzHHkFX7frMswbYi
        KXLVDb5PppxYwwkgr6kN3m3/JWKm7PPj54xmVsm5uK3VGQaTiCiuhUnix2NgPfSUtR9Alu1R0ShKx
        fWFUTKTN5dSEUkH4HcguiGdwS6bVo4MYX7sJ7c/tbOmBpK1t9NZjA0TEV/Aj3BRXDHXds/KFIyEzT
        tOnTNqJStfxd+cSJzQaeBwlXhj1Q+12TJi54P5RYqEhyr8jOBX/lMVCv4LJumW/VbI+/K+3ie1STz
        SfNm7rFQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJN2f-0006iy-5k; Fri, 18 Sep 2020 20:31:37 +0000
Subject: Re: [PATCH v3 1/3] bus: mhi: Fix entries based on Kconfig coding
 style
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
References: <1600457992-18448-1-git-send-email-bbhatt@codeaurora.org>
 <1600457992-18448-2-git-send-email-bbhatt@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <200e7b72-cb62-b21d-72a6-767b4159353b@infradead.org>
Date:   Fri, 18 Sep 2020 13:31:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600457992-18448-2-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/18/20 12:39 PM, Bhaumik Bhatt wrote:
> Kconfig coding style mandates use of tabs for the configuration
> definition and an additional two spaces for the help text. Make the
> required changes to the MHI Kconfig adhering to those guidelines.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/bus/mhi/Kconfig | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index a8bd9bd..6677ccc 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -6,9 +6,9 @@
>  #
>  
>  config MHI_BUS
> -       tristate "Modem Host Interface (MHI) bus"
> -       help
> -	 Bus driver for MHI protocol. Modem Host Interface (MHI) is a
> -	 communication protocol used by the host processors to control
> -	 and communicate with modem devices over a high speed peripheral
> -	 bus or shared memory.
> +	tristate "Modem Host Interface (MHI) bus"
> +	help
> +	  Bus driver for MHI protocol. Modem Host Interface (MHI) is a
> +	  communication protocol used by the host processors to control
> +	  and communicate with modem devices over a high speed peripheral
> +	  bus or shared memory.
> 


-- 
~Randy
