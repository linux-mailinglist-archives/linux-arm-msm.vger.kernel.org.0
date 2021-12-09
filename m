Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7412946F58E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Dec 2021 22:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbhLIVIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Dec 2021 16:08:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232608AbhLIVH7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Dec 2021 16:07:59 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F703C0617A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Dec 2021 13:04:25 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id bu18so14572661lfb.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Dec 2021 13:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lZp3hok6ihhGHif3grQz+Gnqmz/u+UpVJtw5fpnKmkg=;
        b=GbfIL5ruUB3nEW/Q1DyRYUIShr0DN3k5n9hGWBV40VRJn+IRTs6ctzPZJtHXeoGs1p
         dMRB4TnAwETRjizy2m39ldnU+SoQ6FeUSepHnQpVZxT0jJQ+ZCPWjC+RttIHpkMzeknz
         SOl+kkc7BaPWICIRBjEr4wvS39z9NUGd4RZ7QxrY95APXNX9kAK87tEJUd8/1DWF8rCO
         TzXtxWQP/4RuEIjyvX7ppMj00cI46Qrw7yPtCslgS4by88N1FAkF//ElBMbbfWfHS4BH
         C9tZYnIiCcCN+xLL/XN5CPNTIo5U/AKVDPt1ozn2fj/ZdOaAXgEsCWA240EPSgxdmW/o
         PEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lZp3hok6ihhGHif3grQz+Gnqmz/u+UpVJtw5fpnKmkg=;
        b=zWxUK0FJ8L5+y+NF0cpTsRIvV1QwnEzoBbgKXWMuPDc4QXJdXQuuVN+B3etLWGsJbv
         Jm1zCWr2dO/6peWHAFr4G4LgIWbxbRwYr22b1Fuu+YZx2wDY3HyZYCNsScDq3PAXQq0W
         SOgouOSQp2MFlcPhNf/z034rZCsfuuCQVTwp165oCKRCw+yHsWoCseF52Pikn3paTJDD
         ithhGd0saCeyIolewhsz1Q7NuB2OPvpv9zbiglff9qKgBiYQ89jbW9zcsLmUhDrtyFCq
         2g/NECddqt846pRMkyKc6U64cgjN9hDbAYZA1UyNH8t6rPOX/EbKnmgkKtiwIC5QFNrN
         5pjQ==
X-Gm-Message-State: AOAM533ruaa9kpWansLZ30YA+XHeAM/yhkDlIl43VYpnMXdi68kUTN9m
        fdx/N4nsDOIYngzYakEI4od4mA==
X-Google-Smtp-Source: ABdhPJwDvgi99jlWiY+uJbdbh1F+ibWffgmIxwYECFrg7ndkPbcjjcobb/JswtGdFKvZQJ+2opRLOg==
X-Received: by 2002:a05:6512:2286:: with SMTP id f6mr8378555lfu.368.1639083863351;
        Thu, 09 Dec 2021 13:04:23 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j18sm113427lfg.60.2021.12.09.13.04.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 13:04:22 -0800 (PST)
Message-ID: <a2c9efed-7fc0-ec13-c08c-314d32353c91@linaro.org>
Date:   Fri, 10 Dec 2021 00:04:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park
 disp_cc_mdss_mdp_clk_src
Content-Language: en-GB
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
 <YbJNp+tnD6kEQAzt@ripper>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <YbJNp+tnD6kEQAzt@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/12/2021 21:40, Bjorn Andersson wrote:
> On Tue 07 Dec 18:22 PST 2021, Dmitry Baryshkov wrote:
> 
>> To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
>> was enabled by the bootloader, part it to the TCXO clock source.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/clk/qcom/dispcc-sdm845.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
>> index 735adfefc379..f2afbba7bc72 100644
>> --- a/drivers/clk/qcom/dispcc-sdm845.c
>> +++ b/drivers/clk/qcom/dispcc-sdm845.c
>> @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
>>   
>>   	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>>   
>> +	/* Park disp_cc_mdss_mdp_clk_src */
>> +	clk_rcg2_park_safely(regmap, 0x2088, 0);
> 
> Today booting the system with "clk_ignore_unused" will give you a
> working efifb up until the point where the display driver kicks in and
> reinitializes the hardware state - which during development might be
> indefinite.
> 
> If we blindly cut the mdp_clk_src here that will no longer be possible.

Yep. There is an opposite issue. I was getting the rcg2 stuck messages 
_before_ the clk_disable_unused kicks in. So we definitely need 
something more complex than both our proposals. Not to mention that 
Steev tested that this does not fix the issue on C630.

> 
> Regards,
> Bjorn
> 
>> +
>>   	/* Enable hardware clock gating for DSI and MDP clocks */
>>   	regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
>>   
>> -- 
>> 2.33.0
>>


-- 
With best wishes
Dmitry
