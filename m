Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82CE56591F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 16:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728654AbfGKOgN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 10:36:13 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34843 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728529AbfGKOgN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 10:36:13 -0400
Received: by mail-pf1-f196.google.com with SMTP id u14so2868374pfn.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NI8ueteaj89rqZ5qyru0FAVjhgBE62EIuzbdLtCxeKE=;
        b=cBiNl8trXGosCTmFvIf1MABw+fY+EVySwYoqRsdJ4JVY5BGj8y3q9IhczgvhEaXDHL
         F0s+sTFh7UoajjJlMFq+/NDjewYjvgjpX5y4wMmqN91q4GbArNbdy9an8ETi6mpZHBzH
         9jF0+pekIj16fRZ6vivsubJDhz+CI4ksAG6FlrkvGGSS7pNGxVzmiztes70DheBRpAzg
         9xYLylJoHtRRqDszezdpDtwds9HSQh8WHR4a6nOYIMy6cWqFTGvCKlvxo8ddAN4sQymO
         rhwmaCzc9yw8FFwrjSHvcYPXMegGC5MlBW3Api+uWcS+KuSjaoIawHY8wN82biItP3Gg
         yvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NI8ueteaj89rqZ5qyru0FAVjhgBE62EIuzbdLtCxeKE=;
        b=nCUExarCb7hVWOMLEZDDpQDkLUsWB9QMtLLeU+Sl1F1FggXbgqrf41lyLf1OLaUOO6
         M91lDZfDccczq1SvdauNXMOjpsiITacwJbgJMKcikThQLc6ZJTo1Sm2Wr61C9glpmw3Z
         2Oe9C4cIP3ufxbktbPB8w2yK1lZBUAATeE/O3IKW9EnriNkY97KO/Xq9CvBWH0wTLYtl
         QpN2n4scp8im2yDaWtzZ5Iko88XB8EIoi4UVsma65Y3Y+U4HSJDcXvG4xYawRbud2D1C
         qADnqHSyzxsj3AWPyLPsEU6MQmzsSGA6cvMSnAxqmg2OlRyH74aM12Yg3xoDiwyjMwdi
         k/Qg==
X-Gm-Message-State: APjAAAXuITeVQTQDrq0LEwGJPomnNT/uOMwrhqSbz1Ul6KJMjBz3kxTu
        Fp8TGrylxcq8wu/q9Z/NlRUu0A==
X-Google-Smtp-Source: APXvYqz82P7lOd6wmnkvJ/9R8IhUwO4X1ef7XuOJL659cKsBmpHcSpp10bqgBCy6pMqMFsQQfs7M+A==
X-Received: by 2002:a63:3f48:: with SMTP id m69mr4684981pga.17.1562855772275;
        Thu, 11 Jul 2019 07:36:12 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g1sm14756235pgg.27.2019.07.11.07.36.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 07:36:11 -0700 (PDT)
Date:   Thu, 11 Jul 2019 07:37:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v3 03/14] mbox: qcom: replace integer with valid macro
Message-ID: <20190711143721.GC7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-4-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-4-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Use the correct macro when registering the platform device.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index a05dc3aabac7..c8088e9caf02 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -97,7 +97,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  
>  	apcs->clk = platform_device_register_data(&pdev->dev,
>  						  "qcom-apcs-msm8916-clk",
> -						  -1, NULL, 0);
> +						  PLATFORM_DEVID_NONE, NULL, 0);
>  	if (IS_ERR(apcs->clk))
>  		dev_err(&pdev->dev, "failed to register APCS clk\n");
>  
> -- 
> 2.21.0
> 
