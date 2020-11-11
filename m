Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9F232AF5C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 17:05:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgKKQFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 11:05:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgKKQFb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 11:05:31 -0500
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E94EC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 08:05:30 -0800 (PST)
Received: by mail-ot1-x343.google.com with SMTP id i18so2635672ots.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2020 08:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=tIdCI4JuUH0To3ThBGDMIM0wMwtQ0E2bZknwfovjkQY=;
        b=zGscNFqsQR0Cqr0sc4HVKjDAPMoT8IwDDlxPlPSolaPqFNhAbAJ9f7tes13lzFkbgm
         9h7vI6sscfhxeZJOzylBHp5/W241jIYXiw168JkCpHKIyDQk4foO3ExYk434Q1wcPnoT
         QD9ARnkTKJQGTR10rU5GHqsXrSsOHcn9LuhMF5xSP6QNFeCGw6ZqHAWdAE5lXAGeDbqa
         wFh6a/R89DRy5h/2SDFKXzKaGfCycyUyuHVtPlgTV8L3KseWKVhhp7hbV5hMk0Teh8t7
         bkohFpLiyaz9MQoD1pg7zLxPFrGEyPn+1RcSwuORj+1O8LR3KeB+1Mhv8/AUdDaN2xtu
         XPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tIdCI4JuUH0To3ThBGDMIM0wMwtQ0E2bZknwfovjkQY=;
        b=hXmlh+nae2iMX6bp5rpgwOmB/MwZn7yryOG+7falL9DTnXv6RMNsveQrbz29rX6RWG
         0nr85mz/JNay3Fm2rj8lUIeDRNHq4/NQJXRHCydJcfGiRAIh96TZVr97DlYx/zYoERSN
         O8qLG4NO3VIARD78jI4+saf/ivrbsQ3Z/B1Ehvsz76wb76JG8fqk3KN+38IZwIWoVvwO
         E+FIiaQTmuPZSZyKWlUDJkw8BQW2ScWJldv2HtWkDPxTgdH3Bu6+On3SlHOChup4CzPH
         XgKz6w7ZzLk0wnxlnroLrpN79Y1i+pLkVmE98KXPJRmaQGznQipk17xZ0qC8kWkdAWW7
         Gsfg==
X-Gm-Message-State: AOAM533DOQY0NPsMk55SK52tTs6L3/oWDYtiVbFrktUDJ6xKCmkLHtFp
        wsWa7lftVEJ+2oxJdnBKqEnAEQ==
X-Google-Smtp-Source: ABdhPJybLnLecwIG5z15kW8hap8FZxxo60aelsmKCuw5oQaDVQ8crNKy+LE3iNrxCD3SW+U6jrgyiA==
X-Received: by 2002:a9d:590e:: with SMTP id t14mr19057125oth.230.1605110729909;
        Wed, 11 Nov 2020 08:05:29 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c64sm479042oia.49.2020.11.11.08.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 08:05:29 -0800 (PST)
Date:   Wed, 11 Nov 2020 10:05:27 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/18] usb: dwc3: qcom: Detect DWC3 DT-nodes with
 "usb"-prefixed names
Message-ID: <20201111160527.GI173948@builder.lan>
References: <20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru>
 <20201111091552.15593-18-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111091552.15593-18-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 Nov 03:15 CST 2020, Serge Semin wrote:

> In accordance with the USB HCD/DRD schema all the USB controllers are
> supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
> existing DT-nodes will be renamed in a subsequent patch let's first make
> sure the DWC3 Qualcomm driver supports them and second falls back to the
> deprecated naming so not to fail on the legacy DTS-files passed to the
> newer kernels.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index e1e78e9824b1..661263e62f21 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -519,7 +519,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  	struct device		*dev = &pdev->dev;
>  	int			ret;
>  
> -	dwc3_np = of_get_child_by_name(np, "dwc3");
> +	dwc3_np = of_get_child_by_name(np, "usb") ?:
> +		  of_get_child_by_name(np, "dwc3");
>  	if (!dwc3_np) {
>  		dev_err(dev, "failed to find dwc3 core child\n");
>  		return -ENODEV;
> -- 
> 2.28.0
> 
