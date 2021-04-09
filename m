Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6664359AF9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 12:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233977AbhDIKHI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 06:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233986AbhDIKCc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 06:02:32 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19448C0617AA
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 03:00:23 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id h25so3516660pgm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 03:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oc1E6kp+LWw/2VGNPd8azwQCeYvXeaubPfEpOpbRQdo=;
        b=QB4UHxUac2nlz+9P3qfDUbyePZ7dXu90DiWiercPIlT1l55e+F++e3xKpHnaJ0xo4f
         +cdIHswPl60VQ2ty5x6/YcV+l0Q4tlqCJoTwgTIFkhTa/sXVM1RSEcRSx3SgfoOl9ImL
         5AuzfKqokkoBwo49DE7vlQv0gD5Q4N9ARbRgGmjdtbtaqAi0Ow6v1JD0x8TYm1ZaY0TW
         HcAx+Um3hH8kBSk26nI56N08gii4DuHPKN8bBzo5ObqXaylNCF1q94Z3+XggcRYCLLpk
         Be+q3gX4Rxn7q9/S3qxO2YAFN5iXr4W/nzGysNk2WpDEEqzspgTHP24gxRVZf5lr3kFT
         WFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oc1E6kp+LWw/2VGNPd8azwQCeYvXeaubPfEpOpbRQdo=;
        b=PgnjpXP1oo5MrIA3DGglgeUK8emQlgyLHHLsAENVNknkHF+QXXYWBX076XT6kZaIgA
         62ws/hUe0ORfdejkwMvctsmpEiziXBQ9jf6hp7hTXnFP1WaL51wdQ0MFGBbW2PNu2cLD
         fCoYxpPZogkv+cE3bjjtA0fKM58et+fYZk6B+UjAg2PKMZzFZbW/4x8mjONAqeUHpFgt
         vAMPGM6PIBdxTs6uhTqvtEXtesgsAGpN0gzyHGyXKe2ZRyEwmZVy50oKWm107S/foYT/
         OQF49WKZeFLwcPWdxv8cj8QwKsqzWcAPd14TIQwi1MXVfeJ+48lKegZHgdMMo6EHWMG3
         2C7Q==
X-Gm-Message-State: AOAM531oBalWySicv9yCPxK72IwMQqJ5bWrjab+WKvTQItRs/Bgf6MBQ
        tkLdOa++gACtNImebnY4lerg
X-Google-Smtp-Source: ABdhPJxi8zK3aVtLgmS32J11GEjoH50OuPViZ9D116OA2a7WyAjR29XgtTxY/Di4sLxTN6S7JOSE5A==
X-Received: by 2002:a05:6a00:80b:b029:22e:e873:7f0e with SMTP id m11-20020a056a00080bb029022ee8737f0emr12097247pfk.61.1617962422520;
        Fri, 09 Apr 2021 03:00:22 -0700 (PDT)
Received: from work ([103.77.37.131])
        by smtp.gmail.com with ESMTPSA id j9sm1858435pjy.8.2021.04.09.03.00.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 03:00:22 -0700 (PDT)
Date:   Fri, 9 Apr 2021 15:30:18 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bixuan Cui <cuibixuan@huawei.com>
Cc:     linux-kernel@vger.kernel.org, agross@kernel.org,
        john.wanghui@huawei.com, bjorn.andersson@linaro.org,
        balbi@kernel.org, gregkh@linuxfoundation.org,
        mgautam@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Fixed an issue that the ret value is
 incorrect in dwc3_qcom_probe()
Message-ID: <20210409100018.GC31856@work>
References: <20210409004945.56776-1-cuibixuan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409004945.56776-1-cuibixuan@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 09, 2021 at 08:49:45AM +0800, Bixuan Cui wrote:
> There is a error message after devm_ioremap_resource failed, and the ret
> is needs to be obtained through PTR_ERR(qcom->qscratch_base).
> We need to move the dev_err() downwards to ensure that the ret value is
> correct.
> 
> Fixes: a4333c3a6ba9 ('usb: dwc3: Add Qualcomm DWC3 glue driver')
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index e37cc58dfa55..4716ca8c753d 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -774,8 +774,8 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
>  	if (IS_ERR(qcom->qscratch_base)) {
> -		dev_err(dev, "failed to map qscratch, err=%d\n", ret);
>  		ret = PTR_ERR(qcom->qscratch_base);
> +		dev_err(dev, "failed to map qscratch, err=%d\n", ret);

But this error message can be removed altogether as devm_ioremap_resource()
reports it already.

Thanks,
Mani

>  		goto clk_disable;
>  	}
>  
> -- 
> 2.17.1
> 
