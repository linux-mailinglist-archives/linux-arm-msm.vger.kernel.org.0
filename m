Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2292E7E8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Dec 2020 08:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbgLaHTl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Dec 2020 02:19:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbgLaHTk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Dec 2020 02:19:40 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9DDC061799
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:19:00 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id n7so12688814pgg.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Dec 2020 23:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xHJAqD1m0WezbxU2eduKC7svT5VleUFDDZnMbbuCmss=;
        b=HkwpPFG/t51XocyxHEAsRXDrWqcNVT9a9iT+cK99itGxbrACXG1oPeWZiax4oZUci4
         P0YRgcHG7zlp60SXc+f5tVN/6WnOtIrAnfiSMz8UGPw/Gn0AZo5o6PnRqH9/9C27NLZu
         7sLjfhWjcxGnkdrCAvtAph59KaolAi6A1H7dCTzlkQKzSz0GgMnak8ilT4ijh8b7ios7
         n/tgbMgd0PC2dbSYT7kGxuL6y76IysY704MXyamVd+P+EtNPeGrrInMxJs9xTX28av3K
         l2dF8NAjCJH2aUm+YEBwE/1ckx9bj7L2ImGgmKBH0dfBcN4mUtXY4SesUITFpXe2p/Hm
         cFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xHJAqD1m0WezbxU2eduKC7svT5VleUFDDZnMbbuCmss=;
        b=Neh5Xcs70EXCf/iBlU6FCz5Lkuz4sRenGX4Zc1pil3jcUk9BEup/TExnIEm7a8Wlr3
         OWu+/GaGZHwcPrDiZVt3AoTmanm9kIV5UKiJNhRBjhMON/3+y1Xoajkd6i6077iqOjiB
         IdLFm6tpTOijyo/5Zc83FtUZ+Wut1BBPz6vf8ajRc9vzkhKCbLnLC+hMGNkXLeKZqT0/
         wXKjXZko2VFj5OVGO5yGU/omcFwC5ChnNc71YS5sDiSSK9JlyeWeqry8JLFT1WgMBc+k
         NW1Ci+R/rgzJr4hkBGU3cSsA6vCA2aKNVAhtY+i7AKzH7r5/tXuLMhqG0Qi5Iha/B46a
         LcDg==
X-Gm-Message-State: AOAM531t3pdpZTo3nHCK4mmz+lwl9HQDnzTTEdEsGkbu33Te7cKhOK4n
        mvRAFyBFk+lPb2NqfLwRXall/INyAyCD
X-Google-Smtp-Source: ABdhPJzSU1bVVVnoDgEhqsqgJZ7jWdl3qfSxXz24pmGJR7JRNmTXtIvRy5IcZeCcFp2fWdcx2vAyfg==
X-Received: by 2002:a65:6205:: with SMTP id d5mr55261781pgv.76.1609399140320;
        Wed, 30 Dec 2020 23:19:00 -0800 (PST)
Received: from thinkpad ([2409:4072:6d1f:be3b:71a9:d2bf:a32d:897d])
        by smtp.gmail.com with ESMTPSA id gw21sm9450823pjb.28.2020.12.30.23.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Dec 2020 23:18:59 -0800 (PST)
Date:   Thu, 31 Dec 2020 12:48:54 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v6 09/10] mhi: pci_generic: Increase controller timeout
 value
Message-ID: <20201231071854.GC7345@thinkpad>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
 <1609231431-10048-10-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609231431-10048-10-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 29, 2020 at 09:43:50AM +0100, Loic Poulain wrote:
> On cold boot, device can take slightly more than 5 seconds to start.
> Increase the timeout to prevent MHI power-up issues.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 812d54f..d4ad9c5 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -162,7 +162,7 @@ static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  
>  static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
>  	.max_channels = 128,
> -	.timeout_ms = 5000,
> +	.timeout_ms = 8000,
>  	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
>  	.ch_cfg = modem_qcom_v1_mhi_channels,
>  	.num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
> -- 
> 2.7.4
> 
