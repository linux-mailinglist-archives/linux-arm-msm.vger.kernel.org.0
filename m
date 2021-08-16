Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BDED3ECD8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Aug 2021 06:22:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbhHPEWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 00:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbhHPEWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 00:22:46 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D99C061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Aug 2021 21:22:14 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so30398184pjr.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Aug 2021 21:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3rDZfr8lOCTkRiGFOf4dJlH0YY0QUUgHsgWvKT5ATVA=;
        b=UFxpKJXtV88SeRDAum9QVUimvRM7mH7OuY21Vil7HI/iIdrjIVqhMZwmHrXWvpdP/Z
         f/NfXh+PaoTS+iQAVI2/uy8mAWvRrMGulehM8dRhzBZybjDYdwYT/u9a626TSlfqM7XK
         i7LZ9+M9x/Naqiy+O9rapFdwWm9T582LKHwIgcChqj70bLYPmzp1w0bC5aAgDkoCjHxM
         mCp2jRCcwE0heFD3BnEBZ2gUyXEDkTwSASp0XC7SIbnDLM2CNNlWliF3gUsgZLprvIaw
         7DyzlY2viUtNoA/dFMi4ziiXan4YSYoPEkNqqf67kStG7q+9EiXcTiHKiuY+XRjHaPe6
         3Rcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3rDZfr8lOCTkRiGFOf4dJlH0YY0QUUgHsgWvKT5ATVA=;
        b=JEyuy+LhfFyY6LRpG80yDiJ9Wai38kd457v/1ItqgqyiGW/KiHgzuCjCw3yDWHBBE9
         1Mio4M+jiDjBffeXv5aX3p3oJLyTQWHmM/z+D4Cc1eoa8M6gEOL40MvD5Wn5B/1VMySW
         TINgbp2FxTKRj+tZm5/UYtoGYkI6+z72jTUKP3eT9lCPkuR9BeFCRYxTIvilEZmAPajO
         rnPUBGhWzjVnCQexzuT9DNmoGfMHwteMFMVCcH/RIWRCDNSH6vtNiiMHMntz8YPDKar7
         SlkASfnTvbZDC+23QIoBO4dyn0TVkD6iWXtl+PQBh9jLDqt7zoixNDpHOvKPsisQ/+NW
         NLMg==
X-Gm-Message-State: AOAM532taSFP2KvBe+lnX9suh4IBRC8CdvIyo/hHJXJLtZsfqLVmua56
        b/BrSiDgdbHT/mo6sQfwrLhg
X-Google-Smtp-Source: ABdhPJxLf4xxlizfAwplx0br1CQeaNvh0Bg9HShIqRUQJXtwsh5J9N9cSVrBqzbAvWHCLJ/nbSfDgg==
X-Received: by 2002:aa7:93b1:0:b0:3e0:f290:72b3 with SMTP id x17-20020aa793b1000000b003e0f29072b3mr14221866pff.46.1629087734219;
        Sun, 15 Aug 2021 21:22:14 -0700 (PDT)
Received: from thinkpad ([2409:4072:6e0b:22e6:4aa3:7ac0:ffe3:610a])
        by smtp.gmail.com with ESMTPSA id q11sm9119014pfk.32.2021.08.15.21.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 21:22:13 -0700 (PDT)
Date:   Mon, 16 Aug 2021 09:52:06 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        loic.poulain@linaro.org, stable@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: pci_generic: increase timeout value for
 operations to 24000ms
Message-ID: <20210816042206.GA3637@thinkpad>
References: <20210805140231.268273-1-thomas.perrot@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805140231.268273-1-thomas.perrot@bootlin.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 05, 2021 at 04:02:31PM +0200, Thomas Perrot wrote:
> Otherwise, the waiting time was too short to use a Sierra Wireless EM919X
> connected to an i.MX6 through the PCIe bus.
> 
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
> index 4dd1077354af..e08ed6e5031b 100644
> --- a/drivers/bus/mhi/pci_generic.c
> +++ b/drivers/bus/mhi/pci_generic.c
> @@ -248,7 +248,7 @@ static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
>  
>  static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
>  	.max_channels = 128,
> -	.timeout_ms = 8000,
> +	.timeout_ms = 24000,
>  	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
>  	.ch_cfg = modem_qcom_v1_mhi_channels,
>  	.num_events = ARRAY_SIZE(modem_qcom_v1_mhi_events),
> -- 
> 2.31.1
> 
