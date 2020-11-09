Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC922AB7AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 13:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbgKIMBo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 07:01:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIMBo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 07:01:44 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0389EC0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 04:01:44 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id x13so7948726pfa.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 04:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=z9hwnkjw/oYyYqyDnTzFXbjt8eNkH5fqnTEaIrprnsU=;
        b=ASMWy21NXOXvBLyjqXCRv4BIdOANXjzFoqW2phQb2lHltsRJXR/eibkaZX2pSbEvlo
         rGKpssLtEc3xICgIsawktERw+y5oGlX1X1LQZQEntK5gME6O6q2f/nqnY8gdBIU8adqc
         WVLqI31q/MF4picTnLRYueh9ocfWc+FpdlFke2qFYtR+v1QQJl7hhKoPzV5bAFiUAQc+
         Ey99jiMMnC7k1GgFiao80aCW8pmwykbmb5UT4wasP0K7XDoO2YbyS4PjS/e8f5DDBWM3
         T8QABnNDO6Qsm/yB+jaCBKBEGRCqmJRtFS5OCOwF+BMCbhXQi7C9nerQzfBqfu1hbSTU
         3ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z9hwnkjw/oYyYqyDnTzFXbjt8eNkH5fqnTEaIrprnsU=;
        b=Uk2E8ctLVD9a8qZCnWdpkzCpXouIFCDIlnPTq9z4/N16l/Sro4p4f64c4CoVoZMMKT
         pZcK2Jn+JeF7iQLB/iKy6aTUGZ2YkBIBvVfp+jwZw+mss+UKvtcOhHE0zAArQRICaQ9m
         DhKYyGtfbQdDaxWCfSoBaT9CxuVlhhu1MyVpOgHx46Z8HT94h8aGKxT4Ai2M9pIuSJgv
         OTm/TyyCrpFn1G9z6JxXQh5lb97YpQFGomCwRv/Ip6ClIn+ZAzQ9Cdkruj0vFSUH+Gzd
         ny7HsSEyYLY7jq+oVABZr5sDuenCTcHRp1Y3EsxYBsKT83N3ngyrmXG0+gpUN7jbIO4M
         KqWg==
X-Gm-Message-State: AOAM532sbntj51mReB36LrXRCR1F5/edxtq7g5pAsCkPqx2A5ZduSUNq
        cXFwFJIbv88BOjBlRvvCTDBR
X-Google-Smtp-Source: ABdhPJxi/e0SV/jqp/Qv4E6tYbAX8FD9rKEMFoTnCmI6GBMNy0517G+YG8EmusAuVHdeTzT7m68KeA==
X-Received: by 2002:a17:90b:1603:: with SMTP id la3mr12835191pjb.135.1604923303499;
        Mon, 09 Nov 2020 04:01:43 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id u24sm7429385pfm.51.2020.11.09.04.01.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Nov 2020 04:01:42 -0800 (PST)
Date:   Mon, 9 Nov 2020 17:31:37 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     carl.yin@quectel.com
Cc:     hemantk@codeaurora.org, sfr@canb.auug.org.au,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        naveen.kumar@quectel.com
Subject: Re: [PATCH v2] bus: mhi: core: Fix null pointer access when parsing
 MHI configuration
Message-ID: <20201109120137.GG24289@work>
References: <20201102122710.23406-1-carl.yin@quectel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201102122710.23406-1-carl.yin@quectel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 02, 2020 at 08:27:10PM +0800, carl.yin@quectel.com wrote:
> From: "carl.yin" <carl.yin@quectel.com>
> 
> Functions parse_ev_cfg() and parse_ch_cfg() access mhi_cntrl->mhi_dev
> before it is set in function mhi_register_controller(),
> use cntrl_dev instead of mhi_dev.
> 
> Fixes: 0cbf260820fa ("bus: mhi: core: Add support for registering MHI controllers")
> Signed-off-by: carl.yin <carl.yin@quectel.com>
> Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 0ffdebd..c6b43e9 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -610,7 +610,7 @@ static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
>  {
>  	struct mhi_event *mhi_event;
>  	const struct mhi_event_config *event_cfg;
> -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct device *dev = mhi_cntrl->cntrl_dev;
>  	int i, num;
>  
>  	num = config->num_events;
> @@ -692,7 +692,7 @@ static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
>  			const struct mhi_controller_config *config)
>  {
>  	const struct mhi_channel_config *ch_cfg;
> -	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> +	struct device *dev = mhi_cntrl->cntrl_dev;
>  	int i;
>  	u32 chan;
>  
> -- 
> 2.25.1
> 
