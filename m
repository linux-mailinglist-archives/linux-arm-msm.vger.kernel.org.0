Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2CCC27265E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 15:57:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbgIUN5M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 09:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbgIUN5M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 09:57:12 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE06C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 06:57:12 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id jw11so7199205pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2020 06:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RpK5tVg9m6Pgy+ynmw4C02LWimLj70O3ZeNjFWtiOlU=;
        b=l29qCqUIgkAZuYb0SU+CFSaXch16b8vECEnFAgn2xFBJX7gTn6lIbpYMBrUxCfXx5L
         de+fRq163bGESNROD12t2rdQTxpNwPZpzsgachQBG5Eemur04aGZbmMpnQDA7E3uN2ib
         /Z3hn4/idKDf2gEgTK8L0nZcvxSPU+FUfc1bF4RUzO5yrVUVVtIhgENo7DUlN+4zQrsh
         ADv485PJ0N3n31OeCbyU++TeiJgPsYqNK9Sc41XLpElrFKPmFzfXZYsoYtSBaT7FudCg
         4KFpriDkodeWjE4e2Rwk1ePenO0R8z325JW5uyHr/fSJwtjwSkBv0/wrboUwZcqT1aAk
         BI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RpK5tVg9m6Pgy+ynmw4C02LWimLj70O3ZeNjFWtiOlU=;
        b=mb1WipvwaA1Svo5EP16qCheVWZUKwnK/KdoLQUTtpTnw+juwwg89iFeumtZvj6nWuC
         dV5EP4uQEkUMf+Yzo99lsuBmDuVvrVw1EufMFDpBm4KaUjVQ+nkB4A3kj/qr6yDgPxji
         sNsouXgyzBfvf3QXp6fFOCdXB0aduLoHoN8hQFgrtIzSiV/yJnOYcYzY5HCVYhYHnmPT
         jXZSG8/qe4wHJzAVBH78kq7y8W0bbO+Cw2Dpkbkx44DhgrikcvYQRiRQLulLiXdh6P6K
         pNZNJo6OPCA4xyr2xhRW/HNuVRJRYPWvNKiOaM5NBARUpFsfblN9tOllR27tPYLCkw8X
         /uVg==
X-Gm-Message-State: AOAM53199ehBwmzikheKfXK1CvY59S3TxPYSfP3racZ/b2ytroUJeSMO
        PVJy071XNh9qb26l9biEvQyDrWhR57wR
X-Google-Smtp-Source: ABdhPJyiIYT87H5K4sEOZBoI98gqwdtHHPURB4F8QiAKt3yPovYMwlAifH6bAHvKLxdZi6JtjiOxzQ==
X-Received: by 2002:a17:90b:138e:: with SMTP id hr14mr23750574pjb.161.1600696631432;
        Mon, 21 Sep 2020 06:57:11 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6d03:bd12:1004:2ccf:6900:b97])
        by smtp.gmail.com with ESMTPSA id j9sm11825234pfc.175.2020.09.21.06.57.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 06:57:10 -0700 (PDT)
Date:   Mon, 21 Sep 2020 19:27:04 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] bus: mhi: Fix entries based on Kconfig coding
 style
Message-ID: <20200921135704.GA3262@Mani-XPS-13-9360>
References: <1600457992-18448-1-git-send-email-bbhatt@codeaurora.org>
 <1600457992-18448-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600457992-18448-2-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 18, 2020 at 12:39:50PM -0700, Bhaumik Bhatt wrote:
> Kconfig coding style mandates use of tabs for the configuration
> definition and an additional two spaces for the help text. Make the
> required changes to the MHI Kconfig adhering to those guidelines.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

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
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
