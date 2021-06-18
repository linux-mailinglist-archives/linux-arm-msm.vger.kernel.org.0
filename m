Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 795763AD1B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 20:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234747AbhFRSE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Jun 2021 14:04:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234391AbhFRSE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Jun 2021 14:04:56 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8164AC061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 11:02:46 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 102-20020a9d0eef0000b02903fccc5b733fso10509351otj.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jun 2021 11:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vPb+Fog9Orm8Pn55YFU+qXYgMRym8/cqFi5Nfj1rr0A=;
        b=w8UmirZyfCHJtL3TMF2/4bJodKSnlw6obTznBVHws83fKuuctaC8Ce7tE4EE4hfCiy
         Bp1MGojo4VgoPYQ1c5xeInLXlx2zRuuXVFywqGFFf1XXFVEhr6lrAZglPAWskceBW64s
         dE+VBsv94ztG1TuPEKFMZzO/5pQ2kRN0aA5v2kSdheTL1DIZbrmBZoppwaXrWgbyknZV
         iAFDRgiwJfJwKBGDPcOUbhRR+njWPR8OX1HQA4Y+RHk0mGzR27FuctWsSOu3vB88IR9J
         h0ybTKSIi5yM2cKCOYvkDB4WlBmzemYFZ/GI/fjHl+NP7qV3a9i4TqU/+lipDmzXa4aY
         Mmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vPb+Fog9Orm8Pn55YFU+qXYgMRym8/cqFi5Nfj1rr0A=;
        b=SbNlofVHZWFCg2dfpMFDgkICqjB53AESFP+nx8w+CDAHi0V8iHlKOrZCP/PtRG6j9f
         kP0sFwTJoBMVhHFLb+2StJ3Gx3i1/F44r8T7sv2/teBG2GqYvRXHbJyU0qxQFGq5ZELc
         0Urg09XS/XRjbFt/rylq345HAZcPCuPB3QfIsHpr15zLapsIVZXPoeB8oNud77VAUn+N
         /0KC/lp/aHeqb6To6oAHsmOUJIv8cZCXA3TsPqQHUFD9bWNqKenPmrlZMbIvKJCqwP3U
         LXsMr5V6trIMDXDYlIO5OxGjcBdZ9ubaquKNWowbfHDA5VwxXE4cbFLV/q0rEZfDvWXR
         s66g==
X-Gm-Message-State: AOAM530PXVyXi8AgUgN+7t9JWEMyWRtR+rh0MQXZYc0cF+i9mdPsnQXy
        YC7a5S3TFD82cBY/AqMp2lZnKQ==
X-Google-Smtp-Source: ABdhPJyC5Ud5gLpaNoU1AiG0wOs/5NZVyraUm6k8xZTxFudxfVVqMKAFio+Gt8ojf1wDPTqOByawtA==
X-Received: by 2002:a05:6830:2e3:: with SMTP id r3mr3886792ote.229.1624039365903;
        Fri, 18 Jun 2021 11:02:45 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l25sm1905270oie.57.2021.06.18.11.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 11:02:45 -0700 (PDT)
Date:   Fri, 18 Jun 2021 13:02:43 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, lgirdwood@gmail.com,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 4/4] pinctrl: qcom/pinctrl-spmi-gpio: Add compatible
 for pmic-gpio on SA8155p-adp
Message-ID: <YMzfwwscHU2rWjNL@builder.lan>
References: <20210617053432.350486-1-bhupesh.sharma@linaro.org>
 <20210617053432.350486-5-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617053432.350486-5-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 17 Jun 00:34 CDT 2021, Bhupesh Sharma wrote:

> SA8155p-adp PMIC (PMM8155AU) exposes 10 GPIOs.
> 
> Add support for the same in the pinctrl driver.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 89f6147efe58..cc50cfc576fd 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1132,6 +1132,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pmi8994-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pmi8998-gpio", .data = (void *) 14 },
>  	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
> +	{ .compatible = "qcom,pmm8155au-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
>  	{ .compatible = "qcom,pmr735b-gpio", .data = (void *) 4 },
>  	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
> -- 
> 2.31.1
> 
