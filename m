Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11E60656AE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 13:23:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231962AbiL0MX3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 07:23:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbiL0MXE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 07:23:04 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A91CE24
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 04:19:29 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id z26so19399587lfu.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 04:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VPHkjkGIeCSL7pJ9xbCM+9RDfNFEtgDtG6YgScFLSnc=;
        b=xpLg+K+KOmF+puegoJy/2Q+Jxi8db015EfWuUOvId39R3we1xs5WcwIW/RS6lFZ+Cx
         dmfmcOy8fEJ8RCyRRP0PuQ38GxZLXw0y7/5JprDPvarjev25UGQU8Bvtupf/Gs+I0e0l
         UGU8qr67aS38PLTfyP75KR5RmYC3k++qt1cA4YeYkGbcW5B14PlXPAxqKBkQq2wHwDe5
         2Vo0d3vlqn/gvwvT2kTP5DrX4nlzNqNiatm2VmdlxLNemjvrWhJHg8unZxLXiHA2awio
         6ZJEsLuawbsU39cNAzKHm+F/T8h2sUqORm83y0E4B8vYcjSiZKLb8uW/wJp8jCC7E8x0
         XrzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VPHkjkGIeCSL7pJ9xbCM+9RDfNFEtgDtG6YgScFLSnc=;
        b=kCbtv0LKb0HSSRNZqAuSAutLRtLzwDd3VXJoKo+5z2cLrmc3K4zxhawVa7c4eqllHU
         8LtEL6PAXZemAf+3tO3Dl3viEUw6PGKtJudstVM3MtwHLdKIAqkF+qWHCPiJUenxPYh4
         ReiykyXT/cX7gEkXMVVU32m/+dU1sP7fdGOLLK1xP820/yKCXBNN5jiAMRgdX+jfAtn1
         X+FlMpnkEfEElj1xDabwBzQ5Cqw+fJ3KdosobLDbYlk5Hj1v/3WSmH9ma4+4ASmksY70
         by+cqKS18uIhdO/HY8fo7KYUv+bGTdsBtP4XkxLOg7tOE5z2OjDi9keXmvyscTIlqmYF
         wr3Q==
X-Gm-Message-State: AFqh2koXHhTvg5b9Vs3lSZ+L4vUeg9n9oDwYEsy7OpEg/pGiPDbln1nR
        33h+a3qzJBQeg8hhHN9wLf66Aw==
X-Google-Smtp-Source: AMrXdXsI2o3TWhxv9P8v2mys5BjX+T4kZB1jzpwetg1LDxrv1zWUKefr6dnCyrhbm5qUE4xtztjF7A==
X-Received: by 2002:a05:6512:1304:b0:4ca:ffd8:5993 with SMTP id x4-20020a056512130400b004caffd85993mr2848916lfu.67.1672143565168;
        Tue, 27 Dec 2022 04:19:25 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id o12-20020ac24e8c000000b004cb131751dcsm123810lfr.158.2022.12.27.04.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 04:19:24 -0800 (PST)
Message-ID: <59d18498-a56f-a992-f3f3-1fc2de308d72@linaro.org>
Date:   Tue, 27 Dec 2022 13:19:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 07/12] clk: qcom: gcc-apq8084: add
 GCC_MMSS_GPLL0_CLK_SRC
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-8-dmitry.baryshkov@linaro.org>
 <b3696a4b-4ddf-9ddf-a096-ccc43f1230a7@linaro.org>
 <CAA8EJprLwjE0woynmRsB2yn961Kdt4SpawB8rrk=tTdQPp-srQ@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJprLwjE0woynmRsB2yn961Kdt4SpawB8rrk=tTdQPp-srQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.12.2022 13:17, Dmitry Baryshkov wrote:
> On Tue, 27 Dec 2022 at 13:58, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 27.12.2022 02:32, Dmitry Baryshkov wrote:
>>> Add the GCC_MMSS_GPLL0_CLK_SRC, the branch clock gating gpll0 clock for
>>> the multimedia subsystem.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> I'm thinking whether it would maybe make sense to put 8974
>> and 8084 clocks in a single driver.. They seem close to identical.
> 
> Unfortunately the bindings are quite different. So even if we pack
> both gcc drivers into a single one, we'd still have to cope with
> different numeric ids.
> The only sensible solution that  I have in mind is to have a common C
> file, containing common clock definitions.
Right, let's forget it then.

Konrad
> 
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Konrad
>>>  drivers/clk/qcom/gcc-apq8084.c | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
>>> index c26e222c78d4..7085d2ccae49 100644
>>> --- a/drivers/clk/qcom/gcc-apq8084.c
>>> +++ b/drivers/clk/qcom/gcc-apq8084.c
>>> @@ -1382,6 +1382,19 @@ static struct clk_rcg2 usb_hsic_system_clk_src = {
>>>       },
>>>  };
>>>
>>> +static struct clk_regmap gcc_mmss_gpll0_clk_src = {
>>> +     .enable_reg = 0x1484,
>>> +     .enable_mask = BIT(26),
>>> +     .hw.init = &(struct clk_init_data){
>>> +             .name = "mmss_gpll0_vote",
>>> +             .parent_hws = (const struct clk_hw*[]){
>>> +                     &gpll0_vote.hw,
>>> +             },
>>> +             .num_parents = 1,
>>> +             .ops = &clk_branch_simple_ops,
>>> +     },
>>> +};
>>> +
>>>  static struct clk_branch gcc_bam_dma_ahb_clk = {
>>>       .halt_reg = 0x0d44,
>>>       .halt_check = BRANCH_HALT_VOTED,
>>> @@ -3480,6 +3493,7 @@ static struct clk_regmap *gcc_apq8084_clocks[] = {
>>>       [GCC_USB_HSIC_IO_CAL_SLEEP_CLK] = &gcc_usb_hsic_io_cal_sleep_clk.clkr,
>>>       [GCC_USB_HSIC_MOCK_UTMI_CLK] = &gcc_usb_hsic_mock_utmi_clk.clkr,
>>>       [GCC_USB_HSIC_SYSTEM_CLK] = &gcc_usb_hsic_system_clk.clkr,
>>> +     [GCC_MMSS_GPLL0_CLK_SRC] = &gcc_mmss_gpll0_clk_src,
>>>  };
>>>
>>>  static struct gdsc *gcc_apq8084_gdscs[] = {
> 
> 
> 
