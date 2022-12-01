Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6AE663F811
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Dec 2022 20:21:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiLATVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Dec 2022 14:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230078AbiLATVW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Dec 2022 14:21:22 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F20B5D8B
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Dec 2022 11:21:21 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id y15so2154277qtv.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Dec 2022 11:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fe3jUVZGIy1FPO2pl+zPAalHrPyjZcH31CDjXBgFG/o=;
        b=U4x2+ZZIsS0ftQAwkDovaLHKgkKlToAWcwEyyBAV44J9+MKSAutWSYt7UjZGU3Eyba
         PuGrrHNB4JWOzcfPWQTWRJ2GYlS+Ctrs+YNRL+W5ECLSTVSpWHpa+51I8e6wN8ebmP9u
         TZ9qkz3N6FySEF38t5rY5oW40s3Kjx2slwvNwXLxwzJfzDto0V7CqHiXTHdHIzKfTYCE
         16urq/SMX5Vdl1TqKvKdOm2qD743b+ZTOWcq2NDrE4BZzDn3uDnsR22thR3CgB3IZQHO
         2VJNM717ufl9NYpQMvnumCoyyzvHWcZFNGGE3m1oJggW8iSx5PjbEacBGz+hjdHs5ITb
         CdiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fe3jUVZGIy1FPO2pl+zPAalHrPyjZcH31CDjXBgFG/o=;
        b=d60Xe2INGLCzMDyvk3MH2Mm5z7naa3AUMSXL+T6FVasM4zrW/rv0aWwMqqWRngjRA3
         Amr+u4C+4liz5GmFSEu4gImcfEE0v/PeLQS7GfYS/1cNBPesaecSCacZK3v8Rs9BZfT6
         Ov4kepFBloBJqo2rmmTXt7FO64w2Ph03w1ng9Fm8pOiHIOLvG0rhDMVy0udqKer74Ia8
         tNurPcUW36Qy7BIYz+o7LHqXGP8ctb5yWXTl8HGPmBOCvgvblO3NS04cDTe/XXseqU6e
         GjjLYD0IjzGcWSxK536VVWhh001cPmfiECuQjdwySxJBNnl+XcnZtvRuSf1l2uX8lhdi
         Ma5g==
X-Gm-Message-State: ANoB5plkKG6vEspjSShdRL4kxhzJQ+LIumWS57mcAX7AcU+RVv/JGi/x
        i9aF9z/TJmDDCUA0u9OafRcdhw==
X-Google-Smtp-Source: AA0mqf79nI6sUeeA+YazmYFeAJw9Z64CMmIb3T6bRdLBFCfKrIqibBmIMQRKgwqqASbrDXlm5bOq1A==
X-Received: by 2002:ac8:6653:0:b0:3a5:264a:e6a1 with SMTP id j19-20020ac86653000000b003a5264ae6a1mr62168476qtp.336.1669922480876;
        Thu, 01 Dec 2022 11:21:20 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id y6-20020a05620a44c600b006fa7b5ea2d1sm3969233qkp.125.2022.12.01.11.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 11:21:20 -0800 (PST)
Message-ID: <71d37d3a-1704-b645-dee0-62527b228b00@linaro.org>
Date:   Thu, 1 Dec 2022 13:21:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 7/8] clk: qcom: rpmh: remove the last traces of the
 platform usage
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
 <20221130131001.20912-8-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221130131001.20912-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/30/22 7:10 AM, Dmitry Baryshkov wrote:
> Simplify __DEFINE_CLK_RPMH macros to use clk_rpmh directly instead of
> passing it through the `_platform' argument.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It's nice that you separated this step.  If you eliminated the
platform part in the name in one patch, maybe this could be
done at the same time--and still be an easy-to understand patch?

Please consider it but either way I think it's OK.

					-Alex

> ---
>   drivers/clk/qcom/clk-rpmh.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index dcac84614b06..2bcf725dd919 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
>   
>   static DEFINE_MUTEX(rpmh_clk_lock);
>   
> -#define __DEFINE_CLK_RPMH(_platform, _name, _cname, _res_name,		\
> +#define __DEFINE_CLK_RPMH(_name, _cname, _res_name,			\
>   			  _res_en_offset, _res_on, _div)		\
> -	static struct clk_rpmh _platform##_##_cname##_ao;		\
> -	static struct clk_rpmh _platform##_##_cname = {			\
> +	static struct clk_rpmh clk_rpmh_##_cname##_ao;			\
> +	static struct clk_rpmh clk_rpmh_##_cname = {			\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_cname##_ao,			\
> +		.peer = &clk_rpmh_##_cname##_ao,				\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>   				      BIT(RPMH_SLEEP_STATE)),		\
> @@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   			.num_parents = 1,				\
>   		},							\
>   	};								\
> -	static struct clk_rpmh _platform##_##_cname##_ao= {		\
> +	static struct clk_rpmh clk_rpmh_##_cname##_ao= {			\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_cname,				\
> +		.peer = &clk_rpmh_##_cname,				\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
>   		.hw.init = &(struct clk_init_data){			\
> @@ -112,11 +112,11 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   	}
>   
>   #define DEFINE_CLK_RPMH_ARC(_name, _res_name, _res_on, _div)		\
> -	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_##div##_div, _res_name, \
> +	__DEFINE_CLK_RPMH(_name, _name##_##div##_div, _res_name,	\
>   			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>   
>   #define DEFINE_CLK_RPMH_VRM(_name, _suffix, _res_name, _div)		\
> -	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_suffix, _res_name,	\
> +	__DEFINE_CLK_RPMH(_name, _name##_suffix, _res_name,		\
>   			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>   
>   #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\

