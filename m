Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF0B33517BA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 19:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbhDARml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 13:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234730AbhDARjb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 13:39:31 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA4EC02259F
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Apr 2021 08:25:16 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id v25so2138420oic.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Apr 2021 08:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s7L863S6WftXFsxqZvYmVjzveQfmGvn/T8RuaDXdB8Y=;
        b=Quy7GKECsPq78+y0j2fMJeEExk2GgslmoEZfLbEM9G2zAStbR93VF+oUHs2OByX3Vm
         Nxke/8gDcf02HyaifYKB0a9+yjihUm9KXxgg6SfnQWepA7aXZVWTPJRjLb72rF9Gs16I
         9o+a6Sc1j6nrNmX8fs7Kd8VpHuqIt6bEUmwHCJpmzgLxNt+RYvVODBPqm7bqHNhdBLLD
         VQu17bH6nU6cBql7ThLXY845wcX4jGgQScssItzMaMaiJ737oNgoXSNd5XsJOaasS5yL
         6EwjAnoBqGDMPSpDQMkzgyIRySyE8jElg6lNtNZnwavawwms28vn6xgd5sbChdmcNsgG
         2XHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s7L863S6WftXFsxqZvYmVjzveQfmGvn/T8RuaDXdB8Y=;
        b=PFOjWmeYQeiS6RKwNr5ONkqbrgrdnDjBEhTX5c6gAA/LxengPndzmG7ObjrXJS3KEL
         sRMFN3gwsYgd5mje0096SeBI1Dtz7FDit3fQecsnT3V6ZzCQJgqPFaV16FMs3Acj131z
         ve6BK+5X4CFJTpZ8RGrfOHthxtVWTacSYen654t8vx/QuxKiDG4lFAGVKm1my6e0mp0D
         I2MLvp8hbHRHGPJbbP6vuy/RR3rcWRo69szUdmG7Dxc5VpOJnwxAKKQZ1WuXUzmRX/JB
         eJg00ALqR9j9ZJ45qVe6Jg8M8cnMuwml8959DV2e1Ju6vT3x54Fk3MwwZHZVn3aojnCC
         8p/Q==
X-Gm-Message-State: AOAM533d7ro/9kCtuqbqxXolJnD10LypRqu2U1NO46IRlIIgjEQT4FmG
        6efGWMeJK/rSnuvGk2rJT5cMlQ==
X-Google-Smtp-Source: ABdhPJzC7iaCFKp+0pSiFTwGsaf2QZnZFDySAjw3sBt/KwdJRmPcDHJ9ke9EElJHbtdrxPuO4rnEjQ==
X-Received: by 2002:aca:db85:: with SMTP id s127mr6238984oig.142.1617290715450;
        Thu, 01 Apr 2021 08:25:15 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 24sm1083622oij.58.2021.04.01.08.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:25:15 -0700 (PDT)
Date:   Thu, 1 Apr 2021 10:25:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH V2 1/3] pinctrl: qcom: spmi-gpio: Add support for four
 variants
Message-ID: <20210401152512.GP904837@yoga>
References: <1617280546-9583-1-git-send-email-skakit@codeaurora.org>
 <1617280546-9583-2-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617280546-9583-2-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 01 Apr 07:35 CDT 2021, satya priya wrote:

> Add PM7325, PM8350c, PMK8350 and PMR735A compatibles for GPIO
> support.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> Changes in V2:
>  - No change.
> 
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index 9801c71..90f4f78 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -1131,6 +1131,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
>  	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
>  	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
>  	{ .compatible = "qcom,pmx55-gpio", .data = (void *) 11 },
> +	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
> +	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
> +	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },

Please try to keep the list sorted alphabetically, that way you'd see
that linux-next already has pm8350c and pmk8350 defined - or at least
Linus would notice when he tries to apply your patch.

Regards,
Bjorn

> +	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
>  	{ },
>  };
>  
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
