Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D746356DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 08:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbfFEGTh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 02:19:37 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33372 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbfFEGTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 02:19:36 -0400
Received: by mail-pl1-f195.google.com with SMTP id g21so9321139plq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2019 23:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8NDvqSiCIKv+/i60Ynslx6ipNYtxvNjYvkZ3l5Jrxiw=;
        b=Jv+ylw+eYYUmtx1uLMAE5WfRGbPZcDvoOmC1qqQkMmVoWISm6X+KqDoG/xkKlfZp1M
         O6gSWIh+Sh12hcQ1RTa4KsSVZBTgRrVifmZUjlC3+RENnfGGKqgwZIjqDpBIZG7ZZ0o9
         cgt6l84qKjCge1D0+WNYLBz4yjubpHHQLrQE/uGjorTP8Bo6TcuCatE17fGGRYUdhLHa
         YrMCziHY1qjVIkTMkhNdM+sEuMQR9wqYTzegHOCf/2dCREgk/m0XHsyumJ/GOC18x5+a
         DQ6HMN7Cc1c/9R7EJYu5f/Ojspos4AX5jlFgJbN4m2txeCi4CRZW+ZO99kX+jPvezxjt
         KgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8NDvqSiCIKv+/i60Ynslx6ipNYtxvNjYvkZ3l5Jrxiw=;
        b=bFM20FZIt1pAhL9En6N7DfyKMBJcVnxg2YKFFHU9ZufDl+htPqKhM6wpKXnFuCvxnw
         uXtLZLlZr6Ju5KIuMuQ6uMwLz84/qqPMU/iqUs484VDrdtI3FlxFRhXNZTWNrGAR6mRb
         IoAPV+sdPEzq+CSd0BGpP3mTwdlaBWs9atrYq3HhuEtgTRxOiqylRZpVn49ISMp5bas/
         oYDcy673pEc0EDdC/uUlARDvnfnv8wPqsNpiZrIfjHyCZhW3PFXt6ImB8Cgi1HN+IxRk
         yBV0EbHqaZU0SVWEVrjAH5yhTz5S8rkuMN3+YuNUFVCXEXNRsjqm2bUgspEdjiFw7Y4+
         uEvw==
X-Gm-Message-State: APjAAAXfRrb0ywnGn6Qp3jGgDxOg9BFhyrYonnEPLG4BQEQl3t2RK2Hz
        UQRhXx25697dRwSNYUpcc/zhvQ==
X-Google-Smtp-Source: APXvYqwh+STN/4aMELzC9REIaRk3yfuoyfOR7lNLNz7fdt88CIQ5SzfZxE21KW+S3BxQ6DpLT5kMqQ==
X-Received: by 2002:a17:902:a708:: with SMTP id w8mr39377169plq.162.1559715575910;
        Tue, 04 Jun 2019 23:19:35 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id t25sm15044103pgv.30.2019.06.04.23.19.34
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 23:19:35 -0700 (PDT)
Date:   Tue, 4 Jun 2019 23:20:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, kramasub@codeaurora.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        wsa+renesas@sang-engineering.com, linus.walleij@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        jlhugo@gmail.com, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/8] i2c: i2c-qcom-geni: Signify successful driver probe
Message-ID: <20190605062020.GL22737@tuxbook-pro>
References: <20190604104455.8877-1-lee.jones@linaro.org>
 <20190604104455.8877-2-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604104455.8877-2-lee.jones@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 04 Jun 03:44 PDT 2019, Lee Jones wrote:

> The Qualcomm Geni I2C driver currently probes silently which can be
> confusing when debugging potential issues.  Add a low level (INFO)
> print when each I2C controller is successfully initially set-up.
> 
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/i2c/busses/i2c-qcom-geni.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index 0fa93b448e8d..e27466d77767 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -598,6 +598,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dev_info(&pdev->dev, "Geni-I2C adaptor successfully added\n");
> +

I would prefer that we do not add such prints, as it would be to accept
the downstream behaviour of spamming the log to the point where no one
will ever look through it.

Regards,
Bjorn

>  	return 0;
>  }
>  
> -- 
> 2.17.1
> 
