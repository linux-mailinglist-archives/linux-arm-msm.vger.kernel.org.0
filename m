Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 715C64AFD0C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 20:14:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231361AbiBITOo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 14:14:44 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbiBITOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 14:14:43 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3442CC001916
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 11:14:37 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id m10so3548499oie.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 11:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=i83UrggLqqR8sfxQp+IQdzECOxPCCxqxbgAjSDGHq/Y=;
        b=n/sSem6NYUo+UdF/1GntVWuR1kT+0OyWraS+6jrUlMW2hux65KDqnHZrEiPE7QEJiF
         2nftYFoT7AtMqZ+Lsom7cvyvd5bVPwga1sPkB8lAFJ3iSBOB5T7INgDuYFizA0BpSCJO
         QHtOevRx7L/UmSgNQ4GhitW6+QAx5PAxidzf6PKNPcP4j5ajzKcS7J+/6i/jrZAenNpc
         4wtyAbAFWqfV0ahtL76JY/9PSGTNOYHroN4nJ42A2O2yOv/sxRkDDNdoWg0ka2etLVNi
         51OEU7usFE2QMy5FRy+c2EF/dqy4CNz5AAsRY80iCisWg1OTs4YBHrnNqUcmPgzgiJU8
         yJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i83UrggLqqR8sfxQp+IQdzECOxPCCxqxbgAjSDGHq/Y=;
        b=OKAGvbubKYinfTP1AT/syU3riIxH1Ud/UpSPDVLZDGS0gyugB5eiKEGGtuSiWte580
         GOfSOaZ9V9+IOhmPNoumbdCIx62JXNJGJUY1vxzmCFCXF3Ue5ymxfpOEjmKrzmICsrGI
         /Brk/IYNkR/7nMe0/1UX4sgVDnz4c8PtpcK8qkHqiFINii4cS9Wq+R+tHT7GGlo62nfx
         jsw02I3MYoZBOU7e8IDsSmbQFXRIzlajWIBiTWzV1qjpe6ru/FaVUsV5cwag4kxW34Hj
         c+Z8Mzix9Jvj5is1GiNHZtWnZVezrsM7h98AURukt7gPmL+lKT0nArZhXRtCZvoCxNv4
         4QYg==
X-Gm-Message-State: AOAM531gbdsHkAZzk9Y80X+aQ5V21b5UUJO0MQ2W/RFNq4ncx5urddph
        VfEfawFdHgpC0dYuhH1RgdgaKA==
X-Google-Smtp-Source: ABdhPJzNqLMqK731CrdUn6LdyrYJwYcsrQuDHu/wYHmXgCn+SMhJhaGK1IYh4ATk0fCF1/NvdkNh/Q==
X-Received: by 2002:aca:ab0d:: with SMTP id u13mr2058811oie.138.1644434066754;
        Wed, 09 Feb 2022 11:14:26 -0800 (PST)
Received: from [192.168.11.51] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id a15sm7127523oil.13.2022.02.09.11.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 11:14:26 -0800 (PST)
Message-ID: <72fa3837-1792-9a45-c1c2-7863d3381c31@kali.org>
Date:   Wed, 9 Feb 2022 13:14:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [v1 2/2] clk: qcom: dispcc: Update gdsc flag for display GDSC
Content-Language: en-US
To:     Taniya Das <tdas@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220209172513.17873-1-tdas@codeaurora.org>
 <20220209172513.17873-2-tdas@codeaurora.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220209172513.17873-2-tdas@codeaurora.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Taniya,

On 2/9/22 11:25 AM, Taniya Das wrote:
> Update the mdss gdsc flag for SC7180/SC7280/SM8150/SM8250
> to not program the transition delay.
>
> Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
> Fixes: 1a00c962f9cd ("clk: qcom: Add display clock controller driver for SC7280")
> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>   drivers/clk/qcom/dispcc-sc7180.c | 2 +-
>   drivers/clk/qcom/dispcc-sc7280.c | 2 +-
>   drivers/clk/qcom/dispcc-sm8250.c | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
> index 538e4963c915..c203888ab2ca 100644
> --- a/drivers/clk/qcom/dispcc-sc7180.c
> +++ b/drivers/clk/qcom/dispcc-sc7180.c
> @@ -629,7 +629,7 @@ static struct gdsc mdss_gdsc = {
>   		.name = "mdss_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL |  DEFAULT_TRANSITION_DELAY,
>   };
There's an extra space after the |
>   static struct gdsc *disp_cc_sc7180_gdscs[] = {
> diff --git a/drivers/clk/qcom/dispcc-sc7280.c b/drivers/clk/qcom/dispcc-sc7280.c
> index 4ef4ae231794..8e1a2d4a8120 100644
> --- a/drivers/clk/qcom/dispcc-sc7280.c
> +++ b/drivers/clk/qcom/dispcc-sc7280.c
> @@ -791,7 +791,7 @@ static struct gdsc disp_cc_mdss_core_gdsc = {
>   		.name = "disp_cc_mdss_core_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL | RETAIN_FF_ENABLE,
> +	.flags = HW_CTRL | RETAIN_FF_ENABLE | DEFAULT_TRANSITION_DELAY,
>   };
>
>   static struct clk_regmap *disp_cc_sc7280_clocks[] = {
> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
> index 566fdfa0a15b..4d64d499a285 100644
> --- a/drivers/clk/qcom/dispcc-sm8250.c
> +++ b/drivers/clk/qcom/dispcc-sm8250.c
> @@ -1130,7 +1130,7 @@ static struct gdsc mdss_gdsc = {
>   		.name = "mdss_gdsc",
>   	},
>   	.pwrsts = PWRSTS_OFF_ON,
> -	.flags = HW_CTRL,
> +	.flags = HW_CTRL | DEFAULT_TRANSITION_DELAY,
>   	.supply = "mmcx",
>   };
>
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
>
-- steev
