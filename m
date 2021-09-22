Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA644153A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Sep 2021 00:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238473AbhIVW5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 18:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238293AbhIVW5q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 18:57:46 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19BFC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:56:15 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id x124so6881546oix.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Sep 2021 15:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j10MBxPavp973rCVehH8eqME/mHuJFVsbejVLw/uZ1o=;
        b=t3kCB8UqeEJ4R+OdQOJ2Kr82tyKJq0INAPORTdfSBZtDHOS57/KclJOA4xtMKp/y4Z
         xE4Ao5hmvtJn4eFw9Ac9fCCwprBzAp4zscrJTdykS9cOgmtWhhXbcjKpVnzz4bQ4sorT
         rtMDzAta0kERkn4qiWcD/6b+8ZdPdWJ4GREkYney9GBK1295oKaDPfTEQ0ggW2Pd2Z4t
         8AFGrHPQPaXrTok+yCLfTrYFq3zPW7pFt+gdU+dxn/t33+uODJ46qkswuS+tdFswJrbA
         2VULRvJnmY1X3fAunvK2oQrZeBCmbNxJ9i3yLTqh5kEHOJ2LKSWMKxZb5GM3cumFC/ps
         aYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j10MBxPavp973rCVehH8eqME/mHuJFVsbejVLw/uZ1o=;
        b=0mupTWi1hukwpXrVQrApviCH135gbHjGyQHQQK7kYPYoNzkqBf1y/5YgDOXUjHmvjt
         VF4sD84MYEl2954y6UjdPnMfq2rXgbP0NEiMKgKZ59tcBUG+rn70Ut+AzfUBFYJSVE4h
         iI6SZszOHsNVpw2NbURVhWI3r9PWtklByGKMrwa5oekHaZ/GuDDOQ6MpoGQjwIyT8fC6
         X3yGg2f1iVUu/pG0lLoCpxKpfZ9TuJc6WWQ0RS/cQkdDc5QnQozcTve15Wuvb9kOEXwE
         WVSm7c2r8hDWX/XSkgr3U9yo3eCEu+lJLbYV6qyAWKsm5ubVBqqX6o8oiaukwQ6wSUMj
         4ZnA==
X-Gm-Message-State: AOAM530aT7IEhmzJFGTz52cpB11ZbkBX7XvKaxbd6v6IbeLGQu/7PP5W
        vkaSESPe4jAbpxQ5TowSI3UOnA==
X-Google-Smtp-Source: ABdhPJzS3MdJAcPJHwP0ndkMvcbYOvHU9lPuESCiVcd1npUM+NI7qRNbu5hJzqcwFivorcTk+2yCMQ==
X-Received: by 2002:aca:b909:: with SMTP id j9mr9984871oif.1.1632351374903;
        Wed, 22 Sep 2021 15:56:14 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y11sm877508oof.32.2021.09.22.15.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 15:56:14 -0700 (PDT)
Date:   Wed, 22 Sep 2021 15:56:55 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH] phy: qcom-qusb2: Fix a memory leak on probe
Message-ID: <YUu0txXFw2fL3Fgq@ripper>
References: <20210922221613.2115038-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210922221613.2115038-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Sep 15:16 PDT 2021, Vladimir Zapolskiy wrote:

> On success nvmem_cell_read() returns a pointer to a dynamically allocated
> buffer, and therefore it shall be freed after usage.
> 
> The issue is reported by kmemleak:
> 
>   # cat /sys/kernel/debug/kmemleak
>   unreferenced object 0xffff3b3803e4b280 (size 128):
>     comm "kworker/u16:1", pid 107, jiffies 4294892861 (age 94.120s)
>     hex dump (first 32 bytes):
>       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>       00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>     backtrace:
>       [<000000007739afdc>] __kmalloc+0x27c/0x41c
>       [<0000000071c0fbf8>] nvmem_cell_read+0x40/0xe0
>       [<00000000e803ef1f>] qusb2_phy_init+0x258/0x5bc
>       [<00000000fc81fcfa>] phy_init+0x70/0x110
>       [<00000000e3d48a57>] dwc3_core_soft_reset+0x4c/0x234
>       [<0000000027d1dbd4>] dwc3_core_init+0x68/0x990
>       [<000000001965faf9>] dwc3_probe+0x4f4/0x730
>       [<000000002f7617ca>] platform_probe+0x74/0xf0
>       [<00000000a2576cac>] really_probe+0xc4/0x470
>       [<00000000bc77f2c5>] __driver_probe_device+0x11c/0x190
>       [<00000000130db71f>] driver_probe_device+0x48/0x110
>       [<0000000019f36c2b>] __device_attach_driver+0xa4/0x140
>       [<00000000e5812ff7>]  bus_for_each_drv+0x84/0xe0
>       [<00000000f4bac574>] __device_attach+0xe4/0x1c0
>       [<00000000d3beb631>] device_initial_probe+0x20/0x30
>       [<000000008019b9db>] bus_probe_device+0xa4/0xb0
> 
> Fixes: 0b56e9a7e835 ("phy: Group vendor specific phy drivers")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index 3c1d3b71c825..061665ba8ef7 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -589,6 +589,8 @@ static void qusb2_phy_set_tune2_param(struct qusb2_phy *qphy)
>  		qusb2_write_mask(qphy->base, cfg->regs[QUSB2PHY_PORT_TUNE2],
>  				 val[0] << HSTX_TRIM_SHIFT,
>  				 HSTX_TRIM_MASK);
> +
> +	kfree(val);

Nice catch, here's my:

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>


That said, do you think we could replace the nvmem_cell_read() with a
call to nvmem_cell_read_u8() to avoid the need to clean it up instead?

Regards,
Bjorn

>  }
>  
>  static int qusb2_phy_set_mode(struct phy *phy,
> -- 
> 2.33.0
> 
