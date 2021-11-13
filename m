Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F14D44F4A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Nov 2021 19:42:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbhKMSpt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 13:45:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235918AbhKMSps (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 13:45:48 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C959AC061766
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 10:42:55 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so18596939otg.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 13 Nov 2021 10:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kaGFJIxAKkKIuYdo9AHZ52Soms2ncoMLEdTxz5A3SVc=;
        b=O+48aBw7uEeBDrttRvg3Xz2isTQxfzpM+LkvAeA8Y3Kd7Fqk63xiOH6uiNzwtMnrk5
         1PfdBpo/FrYNAdXT/TBmwkNLuU4TF3S62svL1I+ESG4VjOxr5NOw8DHSP36NtfjZ0lVt
         9k9JnCcOLXbu+ECXX+gRCauBK9v+OsCfXSMiPXgp+VJsoGaq7Vqp5BnpEGcdMcKAjebB
         OgMpSSiL5Sj0q74I9FkgMlS9uB+RHUKdjYzLcrgNyYSgdb0bR74ksgQca0n/ESLiH/GT
         7y1QrQ6a35xfu5wja7ScD5T9OV3KQxwCDqoiI2Z0PNoi3jT/tTPj2XeSkb3klxDyc7NM
         djCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kaGFJIxAKkKIuYdo9AHZ52Soms2ncoMLEdTxz5A3SVc=;
        b=NLjGV6C6mTeg2ssCGdvJvFYkKYFx/boXeSjyIJZHyW7UAhKXdawbBh7qnhA0Ca6BNg
         HEU4w8/Bzr0dYk/n2ZZTmAteEi+DdtQshDvwNpShTIILII1JVY32dAKBI24TOSOWihs5
         i3JtKCHs7KKjEiyJvMvnhQjaS3AgUQZ6Jt+zIJQgQv0Z8nPUH90jl5+Acg0mgG+tlXjq
         /69I+AvmkEx2C1n2xIKO7qhrtZpRUoCKhWUOyRdewqQqxvfdhDd9uFaoQN8RDXQc3HCQ
         JxuJQplr6cTBbhA0oAdffh0sJ41f1+qplVSqmlgbB8KCFPNz9/ZMW4uc3VjympsZKQyf
         oycQ==
X-Gm-Message-State: AOAM533e3zDOj+2ygM82GuO/kCN+rGOl8NyeRY6PP1T/a/1/Wbjgk0Mp
        bgF21okezQ8VO2DcWnG2zteqB7Nz6SSKUQ==
X-Google-Smtp-Source: ABdhPJwxPkvaW2WfYzXVaBN/aT2CHDx3KhcipxEd5vMzaPz+HWLzvn73VO/sQB1X3YPkxnZdgJLjWg==
X-Received: by 2002:a05:6830:12c3:: with SMTP id a3mr20180849otq.24.1636828975194;
        Sat, 13 Nov 2021 10:42:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q15sm1944191otk.81.2021.11.13.10.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 10:42:54 -0800 (PST)
Date:   Sat, 13 Nov 2021 12:42:52 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: qcom-pmic-gpio: Add support for pm8019
Message-ID: <YZAHLLJPXRT/c1eA@builder.lan>
References: <20211112115342.17100-1-konrad.dybcio@somainline.org>
 <20211112115342.17100-2-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112115342.17100-2-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 12 Nov 05:53 CST 2021, Konrad Dybcio wrote:

> PM8019 provides 6 GPIOs. Add a compatible to support that.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 5283d5e9e8bc..1ae3895a7ff3 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1151,6 +1151,7 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
>  	{ .compatible = "qcom,pm8008-gpio", .data = (void *) 2 },
> +	{ .compatible = "qcom,pm8019-gpio", .data = (void *) 6 },
>  	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
>  	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
>  	{ .compatible = "qcom,pmc8180-gpio", .data = (void *) 10 },
> -- 
> 2.33.1
> 
