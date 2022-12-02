Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4259640E73
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 20:29:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234700AbiLBT3s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 14:29:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234159AbiLBT3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 14:29:47 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92105EDD5C
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 11:29:45 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id fz10so6600719qtb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 11:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+20XbQGU29ha3MjESx+A5LL2KSvJfQiwEkfJeGtVr0=;
        b=jrLuTshkNdUfnRjZLc9mz/5q8pbUswHWpPq00WO/hK0lbiqQcazzAjYV/7ktM+7KqY
         44QxFXg7XRhIl5zadvfDbcK0BmPLRoBewBXPeBqcK0YqfLbatN2UELXZPxFZr93tK6/A
         Co+/24LrkYc2vIcbIwcUYrs0PL1wD+D2VAHhUy8Un7sYw1RprYjPZLueToQfQYVomwtQ
         72u4+j6+QePfmr6jQDLhhDhgD4mCfSczQWvtjraC7QJtULxuWjsTy2izYcgKeUWXsb18
         WiezSy9CFT9nWUF99goke4BTf7f+sXnslVxRirGfI8QtnhTdLmrJOir5DYL7bMRERMPh
         0+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0+20XbQGU29ha3MjESx+A5LL2KSvJfQiwEkfJeGtVr0=;
        b=IhKvcOB3VtM4EgkdCQIpO+Y2U5jkwlAfbfmg47pnFsFcHbEb7lNtiuOg/R+5I0N5Ng
         rv1rs6WuL2cMZv/vzSj2raHgO2AC+wXCFDFyRxItXjRonaQvRbkO7JUaM59d+fWtXGrA
         A7OeGJUP0icVNOTt8n1phZsDACW5jAlHNXvDcrE92NgxBpn8NRrLC/wxdi2qwx0Ai/mB
         QuwGaJ2hzLLdAlVKHpuCfdv0i65a8JKvGf8igCbsZJqWrXratGDx/+7ha9p8Yl+ulBAt
         mIMJLos6dp+Ugsli4HyzMGoEdTkpCHvK7oUZs7mIqY2XvCY0W8FBMld4SUj0GVexyaid
         qgTA==
X-Gm-Message-State: ANoB5pkf+r6WcrgKA9lVZwq8EjCtf4QPrOlC6I7DitUA9lk0VUn+5vZ1
        MkhYGp6QA76FKxcVuzGcwCcqQA==
X-Google-Smtp-Source: AA0mqf7RmprlpT97E8/imh+zoxMMwj7z3FaytghWMKc1M2/1WywdqL4dlNtPTcfSX7U58/A+kirwTg==
X-Received: by 2002:a37:4553:0:b0:6fc:ae7e:2b4 with SMTP id s80-20020a374553000000b006fcae7e02b4mr4572755qka.767.1670009384558;
        Fri, 02 Dec 2022 11:29:44 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id v23-20020ac873d7000000b003a606428a59sm4642215qtp.91.2022.12.02.11.29.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 11:29:43 -0800 (PST)
Message-ID: <ef889512-61f8-5a38-240a-5e95230f9d81@linaro.org>
Date:   Fri, 2 Dec 2022 13:29:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 5/8] clk: qcom: rpmh: support separate symbol name for
 the RPMH clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
 <20221202185843.721673-6-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20221202185843.721673-6-dmitry.baryshkov@linaro.org>
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

On 12/2/22 12:58 PM, Dmitry Baryshkov wrote:
> Both ARC and VRM clocks have minor differences between platforms.
> However using SoC names directly results in duplication, confusion and
> ocassional errors. Next patches are going to drop the SoC names and

s/ocassional/occasional/

> encode these differences into the clock names.
> To keep the system clock names (visible to userspace) intact, add
> separate symbol names that are used in the code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Looks good.  Thank you for rearranging this, it's easier to follow.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
>   drivers/clk/qcom/clk-rpmh.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 2ab406c1dab5..34099bb6b899 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -70,15 +70,15 @@ struct clk_rpmh_desc {
>   
>   static DEFINE_MUTEX(rpmh_clk_lock);
>   
> -#define __DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
> +#define __DEFINE_CLK_RPMH(_platform, _name, _clk_name, _res_name,	\
>   			  _res_en_offset, _res_on, _div)		\
> -	static struct clk_rpmh _platform##_##_name##_ao;		\
> -	static struct clk_rpmh _platform##_##_name = {			\
> +	static struct clk_rpmh _platform##_##_clk_name##_ao;		\
> +	static struct clk_rpmh _platform##_##_clk_name = {		\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_name##_ao,			\
> +		.peer = &_platform##_##_clk_name##_ao,			\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
>   				      BIT(RPMH_SLEEP_STATE)),		\
> @@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   			.num_parents = 1,				\
>   		},							\
>   	};								\
> -	static struct clk_rpmh _platform##_##_name##_ao= {		\
> +	static struct clk_rpmh _platform##_##_clk_name##_ao= {		\
>   		.res_name = _res_name,					\
>   		.res_addr = _res_en_offset,				\
>   		.res_on_val = _res_on,					\
>   		.div = _div,						\
> -		.peer = &_platform##_##_name,				\
> +		.peer = &_platform##_##_clk_name,			\
>   		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
>   					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
>   		.hw.init = &(struct clk_init_data){			\
> @@ -112,11 +112,11 @@ static DEFINE_MUTEX(rpmh_clk_lock);
>   	}
>   
>   #define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
> -	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
> +	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
>   			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
>   
>   #define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
> -	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
> +	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
>   			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
>   
>   #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\

