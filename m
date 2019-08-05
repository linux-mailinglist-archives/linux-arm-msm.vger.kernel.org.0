Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28F89827C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2019 00:58:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730037AbfHEW6O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Aug 2019 18:58:14 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42277 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729999AbfHEW6O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Aug 2019 18:58:14 -0400
Received: by mail-pl1-f194.google.com with SMTP id ay6so37068948plb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Aug 2019 15:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=33ODwh9+siw4jaJjkemMOwZowzifm/mJiOiBDrPOEqk=;
        b=I/auqCVDp+17lR7htooMYvNhX4kcFZAvbtwZcuJNVHW4VI/O002Fuo0/x4qgu0Fuu7
         ysIUHOOolI/96+Whm6FCbn+iv3bBzC1Fu1P8Rrp4DpcVAA7IDEgjxyjfw9J6rEv8zh6/
         4mVG1MySvmzriEHxURZSljfnxHy9k+W/8snVBb5SpzcxqLFFvuj8QXSAJ0UV5vIWPTkx
         vR32En/zf4U8QWE47GBteuRicLMLgLfN4axaki3LTEZE5DjI7AnJm/U5JLaGlT7uXxfv
         UHxlTH4lag4q6U7bvJE/P2B6k3w1M5T4habqkXpQNgJvhnah9ueYjRX6rE3kRzsOs/K2
         gRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=33ODwh9+siw4jaJjkemMOwZowzifm/mJiOiBDrPOEqk=;
        b=ChoX2ugmMTX4ec/bkeP8P9odyikRRuCglut8ps2KofNnMmuHWnC6IzxUjM+4RoI6Cy
         SYMl6+iACmY3iOufWAjQVLClj8pqmOQANUAQvAuVsYH1Pac1lmLbfXAjVChCdCnp5XgS
         kXw++/m2zoPUA6M+nZUmfRF1dxEZ7r2+mplbJ5M2Muxz+WIq7roNnsRwq0SJ0nn7tEG6
         LiVeDO1dVsPJvgqw3uSX3iqBp17uxUHQr7jt7e3Dg9Q2SPLgvQucYvQg/pYm5KNgDXCq
         9QAcuo5/DS8qmOwg3qEAshEJQV4iwUX1pPhb9qLjeSk/Q5xZoS7t9b4W7ErPfAwHfjBd
         a9Lw==
X-Gm-Message-State: APjAAAUF/C5ACX0LJL25LXVEur1P1Cng+y5rfegO3yerTA2NWaJqEmXi
        DshS9Vq9DMkDYj9LlT3pBpcK3w==
X-Google-Smtp-Source: APXvYqwkpdyNbEUT8xGflpzlSaRR34itFkKnM6gi8ljfIOf0bfXFvRlUOC/L2g9jZxj5pIZHIZZEhA==
X-Received: by 2002:a17:902:a40c:: with SMTP id p12mr161163plq.146.1565045893174;
        Mon, 05 Aug 2019 15:58:13 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 185sm85788076pfd.125.2019.08.05.15.58.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Aug 2019 15:58:12 -0700 (PDT)
Date:   Mon, 5 Aug 2019 15:58:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: smp2p: Add of_node_put() at goto
Message-ID: <20190805225810.GC6470@builder>
References: <20190804162502.6170-1-nishkadg.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190804162502.6170-1-nishkadg.linux@gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 04 Aug 09:25 PDT 2019, Nishka Dasgupta wrote:

> Each iteration of for_each_available_child_of_node puts the previous
> node, but in the case of a goto from the middle of the loop, there is no
> put, thus causing a memory leak. Hence make the gotos within the loop
> first go to a new label where an of_node_put() puts the last used node,
> before falling through to the original label.
> Issue found with Coccinelle.
> 

Good catch, thanks for the patch!

> Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
> ---
>  drivers/soc/qcom/smp2p.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/qcom/smp2p.c b/drivers/soc/qcom/smp2p.c
> index c7300d54e444..d223e914487d 100644
> --- a/drivers/soc/qcom/smp2p.c
> +++ b/drivers/soc/qcom/smp2p.c
> @@ -501,7 +501,7 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>  		entry = devm_kzalloc(&pdev->dev, sizeof(*entry), GFP_KERNEL);
>  		if (!entry) {
>  			ret = -ENOMEM;
> -			goto unwind_interfaces;
> +			goto release_child;
>  		}
>  
>  		entry->smp2p = smp2p;
> @@ -509,18 +509,18 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>  
>  		ret = of_property_read_string(node, "qcom,entry-name", &entry->name);
>  		if (ret < 0)
> -			goto unwind_interfaces;
> +			goto release_child;
>  
>  		if (of_property_read_bool(node, "interrupt-controller")) {
>  			ret = qcom_smp2p_inbound_entry(smp2p, entry, node);
>  			if (ret < 0)
> -				goto unwind_interfaces;
> +				goto release_child;
>  
>  			list_add(&entry->node, &smp2p->inbound);
>  		} else  {
>  			ret = qcom_smp2p_outbound_entry(smp2p, entry, node);
>  			if (ret < 0)
> -				goto unwind_interfaces;
> +				goto release_child;
>  
>  			list_add(&entry->node, &smp2p->outbound);
>  		}
> @@ -541,6 +541,8 @@ static int qcom_smp2p_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +release_child:
> +	of_node_put(node);

Following the loop over the children we request the irq and if that
falls we'll jump to unwind_interfaces. So while it would work fine to
jump to release_child within the loop and then unwind_interfaces after
the loop, it doesn't follow the idiomatic way of using the error path to
"unroll" things that has been setup up until a particular point in the
function.

So I would rather see that you of_node_put() in the loop and then jump
to unwind_interfaces as is done today.

Regards,
Bjorn

>  unwind_interfaces:
>  	list_for_each_entry(entry, &smp2p->inbound, node)
>  		irq_domain_remove(entry->domain);
> -- 
> 2.19.1
> 
