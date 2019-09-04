Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E53A958A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2019 23:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbfIDVuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Sep 2019 17:50:44 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34767 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727900AbfIDVuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Sep 2019 17:50:44 -0400
Received: by mail-pg1-f196.google.com with SMTP id n9so172351pgc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2019 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8+W3OmsE39CBrAqbMD2zucygtqzvFfD25TTwncsech0=;
        b=GjpcQGU018si9YdNfH37M4Jo6uFHTdY0pqnKW1bI2T4aZO3/19Jl5FH8QdTr0Txf8r
         lbdktBIKjY2hxc0z7a5SHCBYbyQppUU8ZGyzcF8t2+flQ2Lwlaci+p+gktP+EW6EDqmr
         7s3ugo5oTSkkJtiu8ZB2vHh7nTcCkJZ54OVg2D6VObo1g+/f028Cz07rHoklB10LETyV
         dFLuT9gELB49hdOz0T2z4JW8dQv635Vj0nXxpecfeEsOaJpbIBJvSdsZWsjU0QjyIfUH
         6VYX5tAcR4yuR3xTSFjlWWV60la4AcfUIWbgbdwQcCg1cQrBM60/vQn9sZI9Ky7KMt6T
         2ZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8+W3OmsE39CBrAqbMD2zucygtqzvFfD25TTwncsech0=;
        b=EtqYoVFKKzeXpYyo6PArchnShX8MPCh/GTL/T+VtsL2qLlYxciJGmSgaRDfeha12cb
         3qK4LaJIO2toeCB45wFWRb8jLyD75gpqLaTLqJ8fnQwGHpRXE87/u9Faa6ZZrx3YR6dy
         VBolVchIEAkK0n67N1fYF5TuSpul87s3ODFZPMOBtzam8WMrpOSisuq9ZTllidluGm+q
         ra5FHcB9s7vNNzx64/eNH7ZYmFWyfJ8zQp3WRR/g51z7j3xSIb/s+2d+Wtjj6B9dfsmx
         8pmiZBR3f9Nd8yzNu/JV4t+7lbDV3BYwV/Tg0Yx7746Xhb+H9iXecTniFY/efPmXsQHz
         xoFQ==
X-Gm-Message-State: APjAAAWGq+Rn6SYadq0EgqTLpur6lbcwunjeSnmqGam/jePALls38GkD
        p9CsUjjO9Vpamh5y6236Fny4lw==
X-Google-Smtp-Source: APXvYqznFPRSJgh/JgdkRzej7oU2uH6AV2QPDQ8rDqB3T60xWU5jKILyc014vwXgwi8/8ui1HTj0dw==
X-Received: by 2002:a17:90a:cc0c:: with SMTP id b12mr375908pju.138.1567633843429;
        Wed, 04 Sep 2019 14:50:43 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w2sm88618pgc.32.2019.09.04.14.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 14:50:42 -0700 (PDT)
Date:   Wed, 4 Sep 2019 14:50:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     miquel.raynal@bootlin.com, rui.zhang@intel.com,
        edubezval@gmail.com, daniel.lezcano@linaro.org,
        amit.kucheria@verdurent.com, eric@anholt.net, wahrenst@gmx.net,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        mmayer@broadcom.com, computersforpeace@gmail.com,
        gregory.0xf0@gmail.com, matthias.bgg@gmail.com, agross@kernel.org,
        heiko@sntech.de, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, marc.w.gonzalez@free.fr, mans@mansr.com,
        talel@amazon.com, jun.nie@linaro.org, shawnguo@kernel.org,
        phil@raspberrypi.org, gregkh@linuxfoundation.org,
        david.hernandezsanchez@st.com, horms+renesas@verge.net.au,
        wsa+renesas@sang-engineering.com,
        bcm-kernel-feedback-list@broadcom.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH -next 08/15] thermal: tsens: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20190904215039.GG580@tuxbook-pro>
References: <20190904122939.23780-1-yuehaibing@huawei.com>
 <20190904122939.23780-9-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904122939.23780-9-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 04 Sep 05:29 PDT 2019, YueHaibing wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/thermal/qcom/tsens-common.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
> index 528df88..43ce4fb 100644
> --- a/drivers/thermal/qcom/tsens-common.c
> +++ b/drivers/thermal/qcom/tsens-common.c
> @@ -155,7 +155,6 @@ int __init init_common(struct tsens_priv *priv)
>  {
>  	void __iomem *tm_base, *srot_base;
>  	struct device *dev = priv->dev;
> -	struct resource *res;
>  	u32 enabled;
>  	int ret, i, j;
>  	struct platform_device *op = of_find_device_by_node(priv->dev->of_node);
> @@ -166,8 +165,7 @@ int __init init_common(struct tsens_priv *priv)
>  	if (op->num_resources > 1) {
>  		/* DT with separate SROT and TM address space */
>  		priv->tm_offset = 0;
> -		res = platform_get_resource(op, IORESOURCE_MEM, 1);
> -		srot_base = devm_ioremap_resource(&op->dev, res);
> +		srot_base = devm_platform_ioremap_resource(op, 1);
>  		if (IS_ERR(srot_base)) {
>  			ret = PTR_ERR(srot_base);
>  			goto err_put_device;
> @@ -184,8 +182,7 @@ int __init init_common(struct tsens_priv *priv)
>  		priv->tm_offset = 0x1000;
>  	}
>  
> -	res = platform_get_resource(op, IORESOURCE_MEM, 0);
> -	tm_base = devm_ioremap_resource(&op->dev, res);
> +	tm_base = devm_platform_ioremap_resource(op, 0);
>  	if (IS_ERR(tm_base)) {
>  		ret = PTR_ERR(tm_base);
>  		goto err_put_device;
> -- 
> 2.7.4
> 
> 
