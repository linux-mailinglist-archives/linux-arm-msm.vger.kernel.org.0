Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F186710DAB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 May 2023 15:55:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241406AbjEYNzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 May 2023 09:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241335AbjEYNzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 May 2023 09:55:11 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 308F3186
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 06:55:09 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-30ab3a2c4efso1150673f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 May 2023 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685022907; x=1687614907;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SEZJCXMSQqlp8stHQkF/ljMn24gR/Y9f2yo63+7SOx0=;
        b=p4D1SBp6bV3z0IL/+HxCX4230NXblHrZu/8ZqYbxnb3drbecRE20BEaaPoFSj9c/p+
         w9fEJLA5TZoi8aMvhfeSW3a8caAY4edvduFBqd7NeRTg8PFqQ+E18Ouo9UaO1abeRu5I
         NYntVwdCdx/BWmuwW1qEh9G09GXUxBYZANUAWbpEKaHKcyULFhsDXenqpcOHEEm+wqyP
         waZ1vltpLFTZEQuppLJ30e5iEx7rC4sNHo9YrujvNRNe64qY9S49O8d25RBG195NOt04
         ibwfYkl6WPTWgivRv7VsEcp8qW/caRB3IJDFZaGqDE+zZFg7pP0ZbVvkDq+Y7R0EUkT/
         34ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685022907; x=1687614907;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEZJCXMSQqlp8stHQkF/ljMn24gR/Y9f2yo63+7SOx0=;
        b=iwuzGNH8rHOJoZL8Vef0ELdB7bvyuWGJkcAN/7h1V0PzMA1/K20DNXqjsF1UrhXI9j
         a8QuK1LQlIbGvz7v7TwCTftatEpbVTmQRbElnKvdh3yfwXx00SZUs3im07QqbPW9DnxQ
         5XsalMQ6Bq93Jy/SfgqA1fYGj6ViJjqg7YmoraN6co0tmwZpXZ6/t93BQQPS6vmHuO1F
         wtqb7JOWup+SHPwqcWjGYNdP+lZtAwmfOb4Z/Vbaj1XpRfFUKRzGOjQocfJjMknbsaD7
         1vrdqLqqxuzqxEUhjYJJnEOXquM0qN5cMD62OFl4aKG2KY9Ppg5iAZzs5Po2+VG+5fJ5
         lV6g==
X-Gm-Message-State: AC+VfDyAm1rNYTtWQvIASnacYA9RUyLMRY3V6J7DzcMdQ9NqndT18G1V
        9Off1Be4bc3jRSXBU+DIaBCwtg==
X-Google-Smtp-Source: ACHHUZ4WwILC7yUs0IdTplb2eMuxUsV0OBnFfxuT0cIn9Ltph5Cv3TSQ7lVTwXE7NmuIaz/4zNvWFQ==
X-Received: by 2002:a5d:4150:0:b0:2fa:631a:9f23 with SMTP id c16-20020a5d4150000000b002fa631a9f23mr3258315wrq.2.1685022907504;
        Thu, 25 May 2023 06:55:07 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6? ([2a01:e0a:982:cbb0:5cdb:105b:7481:b0e6])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d65c8000000b0030649242b72sm1822343wrw.113.2023.05.25.06.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 06:55:07 -0700 (PDT)
Message-ID: <9f24396a-7a1e-012e-35e2-1e055941e87e@linaro.org>
Date:   Thu, 25 May 2023 15:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2] leds: qcom-lpg: Fix PWM period limits
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>
Cc:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Caleb Connolly <caleb.connolly@linaro.org>,
        Steev Klimaszewski <steev@kali.org>
References: <20230515162604.649203-1-quic_bjorande@quicinc.com>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230515162604.649203-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2023 18:26, Bjorn Andersson wrote:
> The introduction of high resolution PWM support changed the order of the
> operations in the calculation of min and max period. The result in both
> divisions is in most cases a truncation to 0, which limits the period to
> the range of [0, 0].
> 
> Both numerators (and denominators) are within 64 bits, so the whole
> expression can be put directly into the div64_u64, instead of doing it
> partially.
> 
> Fixes: b00d2ed37617 ("leds: rgb: leds-qcom-lpg: Add support for high resolution PWM")
> Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v1:
> - Reworded first sentence to express that it's the order and not the
>    previously non-existent parenthesis that changed...
> - Picked up review tags.
> 
>   drivers/leds/rgb/leds-qcom-lpg.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> index c9cea797a697..7287fadc00df 100644
> --- a/drivers/leds/rgb/leds-qcom-lpg.c
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -312,14 +312,14 @@ static int lpg_calc_freq(struct lpg_channel *chan, uint64_t period)
>   		max_res = LPG_RESOLUTION_9BIT;
>   	}
>   
> -	min_period = (u64)NSEC_PER_SEC *
> -			div64_u64((1 << pwm_resolution_arr[0]), clk_rate_arr[clk_len - 1]);
> +	min_period = div64_u64((u64)NSEC_PER_SEC * (1 << pwm_resolution_arr[0]),
> +			       clk_rate_arr[clk_len - 1]);
>   	if (period <= min_period)
>   		return -EINVAL;
>   
>   	/* Limit period to largest possible value, to avoid overflows */
> -	max_period = (u64)NSEC_PER_SEC * max_res * LPG_MAX_PREDIV *
> -			div64_u64((1 << LPG_MAX_M), 1024);
> +	max_period = div64_u64((u64)NSEC_PER_SEC * max_res * LPG_MAX_PREDIV * (1 << LPG_MAX_M),
> +			       1024);
>   	if (period > max_period)
>   		period = max_period;
>   

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
