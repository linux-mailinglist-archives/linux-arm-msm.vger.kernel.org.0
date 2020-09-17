Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA0B26E981
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 01:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbgIQXgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Sep 2020 19:36:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgIQXgy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Sep 2020 19:36:54 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E6FC06174A;
        Thu, 17 Sep 2020 16:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=L/ik8xWQGsvCl/IsgAaxVy6/l+78WiZ2kJbVDcmurfY=; b=DpNU85rBpi9QWuwMXSt0RSN27K
        hVOTDjhXYcEbg7fIU+WHVF8s0R44HWDiTrXVJPDFswR9YXCbV2JU76RRB44b5F09eyf+wR21Gm2zD
        B90HvTFceK5krxzoTUueFEMxnm8nrWiqsJqHpXv3YIqOyLiGke3oyf+8AKoaynxca5uhj7t823Q87
        9IRELZdXHXR/8jG+N+OUEvVj0whCZThAxsiv8yqxQOk/NvgIqXZMDFISMzlQekzdJYWpSWUF7N5b9
        oAmK/usXYPdUIoxqfDgrGmdbgHhsemaXzBXnlAfhdRs6AvXbzudjQxvRR6U92IqzFvEn2HfPF6GF7
        LK/7A9Pg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJ3SN-0000dd-NW; Thu, 17 Sep 2020 23:36:52 +0000
Subject: Re: [PATCH v1 2/3] bus: mhi: core: Introduce debugfs entries for MHI
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
References: <1600381176-37604-1-git-send-email-bbhatt@codeaurora.org>
 <1600381176-37604-3-git-send-email-bbhatt@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bf24b8fe-8ff3-4ff3-a1f0-c276dcc5832c@infradead.org>
Date:   Thu, 17 Sep 2020 16:36:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600381176-37604-3-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/17/20 3:19 PM, Bhaumik Bhatt wrote:
> diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> index a8bd9bd..ae68347 100644
> --- a/drivers/bus/mhi/Kconfig
> +++ b/drivers/bus/mhi/Kconfig
> @@ -12,3 +12,11 @@ config MHI_BUS
>  	 communication protocol used by the host processors to control
>  	 and communicate with modem devices over a high speed peripheral
>  	 bus or shared memory.
> +
> +config MHI_BUS_DEBUG
> +       bool "Debugfs support for the MHI bus"
> +       depends on MHI_BUS && DEBUG_FS
> +       help
> +	 Enable debugfs support for use with the MHI transport. Allows
> +	 reading and/or modifying some values within the MHI controller
> +	 for debug and test purposes.

from Documentation/process/coding-style.rst:

"""For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces."""

Several lines above use spaces instead of one tab...


-- 
~Randy

