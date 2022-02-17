Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 442614BAC86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 23:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343749AbiBQWYa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 17:24:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343843AbiBQWY3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 17:24:29 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71FF2C115
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 14:24:14 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id q5so1139586oij.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 14:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/neFhOJyXKG5xSPOlx3CJHDkEqEd9BRroYvm8Izt9PU=;
        b=sYKcZLjYBIoEo8liVjK/NRa/cSfQMrW3EijXiy4Gakbj3BtmY1jTwBXZjgSm1KwYvw
         EUbw9qFK1Vis7+Hn8aLBdvJXtLaqo/KtJudsA5aapscIzSc+eLy9CuN27UAerGmKiZvw
         diOIyVr9vCMyCf+4jLgVKfUqhXcVfZg3t11inoh1V2nqpb0VyfiDWvz1qPUc7JjFhPj/
         4OmoXMJb14GlZEAzFIoUVlJPpBLSMD6w4h29JdMio6mIafyrmJJfZNjMcS5XBhBm2dGe
         ka6IbIduW9AfZdcOCpq1ckB9ClPUd8UBs8K3gmoB1UrDwBARBlw03epOB2JJQ/inDZ/D
         vkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/neFhOJyXKG5xSPOlx3CJHDkEqEd9BRroYvm8Izt9PU=;
        b=cyLzA5xKCM2+w2IHnzas8FT2TWabBIGNw9HSdXPUV+wfy9TfTjpbe5dI2aEtRX0Acb
         TMk+hmS7xsOJzKYbJdKGobPfLDv22mv3/HOQMZSrTH7rnxbGYm2JnqHOnScRdz/4TyxE
         ECZmL528oqqhKcUPo8Kep2aqEy6k1ijKKoMS9rJXvnzCLpEcHEd8+5q5m2P24XZcijSM
         Tl9/tmnGgpekY62dN31mq3mG5u/qqua6B6Nn0THuVowDKzco3E+8cyxAYCar8YE98lgJ
         n8VpxrmJMqdkHZFIzBepOpr/FqnqHyXlX6dIdWY1xu3dGX603NIeP7/nSRNfFdlKJyF0
         m8BA==
X-Gm-Message-State: AOAM531ajeBj4tVkCYrlhBPcp6HL0e92S9FIFiKL3G5cJXJ3fcm/vuqX
        WG4J9Es8ycrx9/SUMfn8mUq6QrV7O6wjog==
X-Google-Smtp-Source: ABdhPJyAHPTbyHfEMbFh3qbEs6lUXgioZ89TvaZDWuHOUNgl2HglyEel/rwjbbS0NIYVNx5zst55qw==
X-Received: by 2002:a05:6808:238f:b0:2ce:df34:1812 with SMTP id bp15-20020a056808238f00b002cedf341812mr3789990oib.147.1645136653688;
        Thu, 17 Feb 2022 14:24:13 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id w13sm545096ooj.5.2022.02.17.14.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 14:24:13 -0800 (PST)
Date:   Thu, 17 Feb 2022 14:26:20 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, mka@chromium.org,
        swboyd@chromium.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: Re: [PATCH V3 2/4] leds: Add pm8350c support to Qualcomm LPG driver
Message-ID: <Yg7LjJFi51cmDUQr@ripper>
References: <1635507893-25490-1-git-send-email-quic_c_skakit@quicinc.com>
 <1635507893-25490-3-git-send-email-quic_c_skakit@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635507893-25490-3-git-send-email-quic_c_skakit@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 29 Oct 04:44 PDT 2021, Satya Priya wrote:

> From: satya priya <skakit@codeaurora.org>
> 
> Add pm8350c compatible and lpg_data to the driver.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>

Sorry for the OCD, but I would really like for you to capitalize 's' and
'p' in your name.

> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in V2:
>  - Added const for lpg_channel_data[] struct.
> 
> Changes in V3:
>  - Correct the num_channels and add respective base addresses.
> 
>  drivers/leds/rgb/leds-qcom-lpg.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index 45ef4ec..ad99a9b 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -1275,9 +1275,22 @@ static const struct lpg_data pm8150l_lpg_data = {
>  	},
>  };
>  
> +static const struct lpg_data pm8350c_pwm_data = {
> +	.pwm_9bit_mask = BIT(2),

As you might have seen in v12 I dropped pwm_9bit_mask.

> +

Afaict there's a tri-channel current sink in pm8350c as well, so you
should have:

        .triled_base = 0xef00,

And then associated .triled_mask in the relevant channels.

Regards,
Bjorn

> +	.num_channels = 4,
> +	.channels = (const struct lpg_channel_data[]) {
> +		{ .base = 0xe800 },
> +		{ .base = 0xe900 },
> +		{ .base = 0xea00 },
> +		{ .base = 0xeb00 },
> +	},
> +};
> +
>  static const struct of_device_id lpg_of_table[] = {
>  	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
>  	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
> +	{ .compatible = "qcom,pm8350c-pwm", .data = &pm8350c_pwm_data },
>  	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
>  	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },
>  	{ .compatible = "qcom,pm8994-lpg", .data = &pm8994_lpg_data },
> -- 
> 2.7.4
> 
