Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2C221A0C3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 12:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgDGKrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 06:47:01 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:37190 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728176AbgDGKrA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 06:47:00 -0400
Received: by mail-pf1-f194.google.com with SMTP id u65so620210pfb.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2020 03:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4YtfqkIGgXW1xusWEASGyU+2zFmL2OCHZ96I1LCBisM=;
        b=jrywjZgHRoaeZuIgBosPgfb1HAm9Oz46S+PE45x5nVT0Exh7oWjltxfsQV1URfaL+M
         e+2tSCbR3ygDI6yJb8Kg9CEAI67D/E4gbityQ7++hX2Qdo87mjWzX32bISfp5fudi3ed
         BJj4TkA8EAxK0nD9SDpeAjJr+/81GEzVaqMqbHyAw9Xjh95gv5GvS2hKz/xPXhV+pxv1
         w8aEvM4hd4aKFP/yXPK9HvYbXMl3ujdDK2Ea9D3yMqb3MfFfNNXHslIxNCnWmwjMuJgr
         Kvzeb1XqwyUQChhL3NE8TbKJs60H51gbSmsSO9jU6LY3D7N/hoe88G0NKk8dj3e41a1j
         w25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4YtfqkIGgXW1xusWEASGyU+2zFmL2OCHZ96I1LCBisM=;
        b=oKz1Xj1/PxEXNyDvToXrw1+sBi9STMlmxX2cGe3lMDH+9BRXkqn5mAuvTevjVDHyEX
         5hOTe9bqP/N8FlVOWKuXSuLY4d/epki4S37ds/l8Pr7m5ql/08k8jEB9FJos7iqMrvkL
         pMjBtrjUYVDTN4Zv99ksGphFP2AwM6CqaIpO/KiV7AJ7zUyoLVVlhwFIT4oegyU94i0v
         dxG8PRltjCRj+I311ump8U2cN0hhEahFOfBHveDOGZ4oIPNmyDoTB6qWnuFyBROnw/DV
         Dha+hYVZZbEngxodSY90JhYQbtBjq7YvmMCYWy60T1EH99BvKGkZIDB9mkEyQkfH+ZnE
         Vg5g==
X-Gm-Message-State: AGi0PuYX4pDUg6byKVsU99VCKCq1PM9faoHtiys/qkjf/sguhd6ghNRa
        jyXWxmkP8AlKLLFpfx7c/n0V
X-Google-Smtp-Source: APiQypKsO/kAkqhUjki9LOTVcMhhtoabGVkmmzOG391e8eHnzPHxXUkh2cilEXxWItXrajqpv3whvQ==
X-Received: by 2002:a63:34c9:: with SMTP id b192mr101158pga.275.1586256419192;
        Tue, 07 Apr 2020 03:46:59 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e86:d03b:4d11:a99a:dd42:277d])
        by smtp.gmail.com with ESMTPSA id fa16sm1252642pjb.35.2020.04.07.03.46.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 03:46:58 -0700 (PDT)
Date:   Tue, 7 Apr 2020 16:16:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Siddartha Mohanadoss <smohanad@codeaurora.org>,
        Sujeev Dias <sdias@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: core: Fix a NULL vs IS_ERR check in
 mhi_create_devices()
Message-ID: <20200407104651.GE2442@Mani-XPS-13-9360>
References: <20200407093133.GM68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407093133.GM68494@mwanda>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 07, 2020 at 12:31:33PM +0300, Dan Carpenter wrote:
> The mhi_alloc_device() function never returns NULL, it returns error
> pointers.
> 
> Fixes: da1c4f856924 ("bus: mhi: core: Add support for creating and destroying MHI devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks Dan!

Regards,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index eb4256b81406..55928feea0c9 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -294,7 +294,7 @@ void mhi_create_devices(struct mhi_controller *mhi_cntrl)
>  		    !(mhi_chan->ee_mask & BIT(mhi_cntrl->ee)))
>  			continue;
>  		mhi_dev = mhi_alloc_device(mhi_cntrl);
> -		if (!mhi_dev)
> +		if (IS_ERR(mhi_dev))
>  			return;
>  
>  		mhi_dev->dev_type = MHI_DEVICE_XFER;
> -- 
> 2.25.1
> 
