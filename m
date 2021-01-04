Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83312E987C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 16:28:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727442AbhADP2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 10:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbhADP2S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 10:28:18 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66573C0617A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 07:27:36 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id r4so14696737pls.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 07:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Y64vhsvtwqo45cZnpJeAfSIbz8dQZPOpnuAjaj7/aOM=;
        b=R/emHFo+bjo2g6kruphg2DlLXt4NTilH/oGUtc+tdb0yZTyGG3l06aFcwhN5r8EHbZ
         3ahnxf2kRnCDuQniTdsVnav5g8dgty94zvVhAReNMbOBA4mWDZijhL/31cAtfbLqd99O
         OnoPzXQSS0hZvCRMXDUjeq7X85gMjZCIiXB2eNG/5MagchBphQFL7i77+HUFXgMPR+OB
         678xrNM2fdWKcYp4T1LSDVZ6liQZbWXjYlQvWM5NubDf80nvWl1a8qZVTXXZxRgR4SVn
         zEwlaS2ucE9MNeCcIAligNSCvF6lxaq6NuYWoEA9y0017kxoexS3UOPf2uaZI8coKBeD
         N7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Y64vhsvtwqo45cZnpJeAfSIbz8dQZPOpnuAjaj7/aOM=;
        b=Gz3ygX7sAWfqFvgXoA5CnQ7QRaiLvb5PI1SKY3ziJ0zYGAZRIfj1ylD+C9DbHGPU3L
         2xcDfrPRAIrRKLhlhIwQSAh8D/2PCNCe/Z6yLYvZCC+ExHmAYw8S7mPq35C8T7TywVJR
         TO2PZ7aTNw9/LRgnS6MPtPQ+qhLMJvUzf3kFwV3NjzJwFUYIhLo4lw2CS5SMpe912LNd
         qz+o+bR2D+mZUuROOLIst1avp6bsRgAYEZhbW6+TH3zE9Qgu5YkqLiTAFj9KIMv2dVIm
         08Wwo3vr1I8TGYWe7dnkvdqmZVm1IGOCG0rWHGTsP7Z6jM34MFN9eiuhlykJduBeOoAP
         icxA==
X-Gm-Message-State: AOAM532K/r3l1ozmyhooqJXqYN2PSOf4GjhYpBpYd4Zvrra5Rf0S+6bT
        es+z9P/Eq7Mf+KQOznmI65ID
X-Google-Smtp-Source: ABdhPJyuMBUdZoHZqw2LESljO0PSkOcVDzsL3jFlUMItvyugVINt8RW3W6ag/a3Pgpdvy9syw4NrhQ==
X-Received: by 2002:a17:902:16b:b029:dc:4ca1:f5fc with SMTP id 98-20020a170902016bb02900dc4ca1f5fcmr47508765plb.26.1609774055952;
        Mon, 04 Jan 2021 07:27:35 -0800 (PST)
Received: from work ([103.77.37.129])
        by smtp.gmail.com with ESMTPSA id u25sm53349161pfn.101.2021.01.04.07.27.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jan 2021 07:27:35 -0800 (PST)
Date:   Mon, 4 Jan 2021 20:57:32 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org
Subject: Re: [PATCH v7 10/10] mhi: pci_generic: Set irq moderation value to
 1ms for hw channels
Message-ID: <20210104152732.GD2256@work>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
 <1609768179-10132-11-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1609768179-10132-11-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 04, 2021 at 02:49:39PM +0100, Loic Poulain wrote:
> MHI hardware channels are usually the hardware accelerated data path
> e.g. IP packets path for modems. This path needs to be optimized for
> low latency and high throughput. After several tests on FN980m SDX55
> based modem, it seems 1ms is a good default irq_moderation value:
> 
> - It allows to reach the maximum download throughput
> - It introduces limited latency (5ms is too high)
> - It prevents interrupt flooding
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index a4b6221..1603c83 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -130,7 +130,7 @@ struct mhi_pci_dev_info {
>  #define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
>  	{					\
>  		.num_elements = 256,		\
> -		.irq_moderation_ms = 5,		\
> +		.irq_moderation_ms = 1,		\
>  		.irq = (ev_ring) + 1,		\
>  		.priority = 1,			\
>  		.mode = MHI_DB_BRST_DISABLE,	\
> -- 
> 2.7.4
> 
