Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 521AD26CE5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Sep 2020 00:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgIPWH6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 18:07:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgIPWH6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 18:07:58 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B13C0698CE;
        Wed, 16 Sep 2020 14:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=WXS+ff+b5bMlOip+NKUbf0Z9b6R6EpWN0difBpMRFZs=; b=P50r4tzkwmXp8h4nAvjTnJw/v7
        kPbHSxNAst66A4F4n8LTtKjaowXthHcYZkR+2ZXVtua9qRpZPYUjRbYoEQ32DBDizBkJgDy3wEeNm
        iBdTZAzAJGvbtdHpbLUE3woMTHE9p++LmeCvs9WGlGEBemg+VPLVUeKgriDTarI38RhVSGxw5dKEs
        YAelkJXRv6tLNIHHPnxwDtTRSI2ypj6uuyecMw8AnHF7AYN5OkbA8/UPAQCFB76XEqk6zxqkeVXjh
        fPhwCG6Pw1VIDt8npyntlIQKLPgozok5L46mzxqbzl+kjqXKXGfn0G+XmVJMsjM+cSICMv2EQMTxu
        edQEL8bw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kIfLy-0005SU-Te; Wed, 16 Sep 2020 21:52:39 +0000
Subject: Re: [PATCH v6 4/4] bus: mhi: Add userspace client interface driver
To:     Hemant Kumar <hemantk@codeaurora.org>,
        manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
 <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <73ab1853-a07d-599f-9d4c-c346376aa6fc@infradead.org>
Date:   Wed, 16 Sep 2020 14:52:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600286167-4432-5-git-send-email-hemantk@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/16/20 12:56 PM, Hemant Kumar wrote:
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index 6a217ff..8aebe8b 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -20,3 +20,16 @@ config MHI_BUS_DEBUG
>  	 Enable debugfs support for use with the MHI transport. Allows
>  	 reading and/or modifying some values within the MHI controller
>  	 for debug and test purposes.

Hi,
Please indent Kconfig keywords with one tab only, and indent
help text with one tab + 2 spaces, as documented in
Documentation/process/coding-style.rst:

"""
For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.
"""

> +
> +config MHI_UCI
> +       tristate "MHI UCI"
> +       depends on MHI_BUS
> +       help
> +	 MHI based userspace client interface driver is used for transferring
> +	 raw data between host and device using standard file operations from
> +	 userspace. Open, read, write, and close operations are supported
> +	 by this driver. Please check mhi_uci_match_table for all supported
> +	 channels that are exposed to userspace.
> +
> +	 To compile this driver as a module, choose M here: the module will be
> +	 called mhi_uci.

thanks.
-- 
~Randy

