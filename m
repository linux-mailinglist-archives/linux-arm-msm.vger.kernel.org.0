Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3ABA52C3B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 May 2022 21:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242154AbiERTq6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 May 2022 15:46:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242143AbiERTq5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 May 2022 15:46:57 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 953A31A40A7
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 12:46:55 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id i68so1039730qke.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 May 2022 12:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lknfdui0Jkld21xyQxZKW/2k8Qh0EDK1oNvMjjFcPb8=;
        b=r8xniljnQ5xLCJGNADSb7eocGuy4bV996ee55GTs/IfAI2mGLOa4+WpmLaF5tOi0Q3
         fE4eGBB/asploPiE0/kbJaAflM+aA0hLXdSl2oTt43hbbkPL5i3ZNTAaspwHI6YvYYgF
         7P9/wFYB9Jmo3G/I50Jfr1ZELQarBU4nvbqTGW92IeHokrM1NqmXcaa8p0Gq0+PkW08O
         TbdMD7FHNVzECU2nejniep+jnIUieScvnLKYJX4gW/v6GrPpqhJp9xFR011iPMrY2Lv9
         5jWRGw9XxwdLbB0xGFCoqXlZXAehZcMhd/mUfN4Hut92b1Cyym2vudJUTrvNsNl6zd2m
         4ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lknfdui0Jkld21xyQxZKW/2k8Qh0EDK1oNvMjjFcPb8=;
        b=U3HYvO7QbuTGlKDk8i6QR/CRnBg2me2PJmuneEjtF/vnr3SdBdx3b6LxE671SwgC/M
         8aW6XQmi7vNBpzJEn0l+6yPRD9qXR6Qi9LLnhmEthmHo+aJOjWzMSQ+SpPgTO/kb4tOo
         +YuFS9DTXQ2SnK5PBnxRPgCLm7f6QDaTdaHv1ex6ruER1Y3OJdu9kKf50RpzyBhqd6aZ
         HizBo+ugXj6d39mgSC2YuxwLLIB6ky+8nXBIHPhvWOcKpDHxZyJS1SgOwVSk9Jh6/8UL
         TcNrsJYZ1BM3ojlOuWhqwWJjIftDnMgXD2I1WthH67CyTpXfrBzWanP4n3swdA+47LBS
         dOXQ==
X-Gm-Message-State: AOAM531T/SVUlgnIwod4n+7gDV40MNUQC7SOAuOP2VjpnLpv3i7UN/vK
        G/gOuSjpEyfRMifR4fj6Sx27Dw==
X-Google-Smtp-Source: ABdhPJx4LT9jmpxkokpBvF9ZdaMNZYPp3LhALhfeXcOaM1WWlLIjYqlPDryzV/DFogxJG7Wnt6xfdA==
X-Received: by 2002:a05:620a:c4b:b0:67e:11a2:7cfb with SMTP id u11-20020a05620a0c4b00b0067e11a27cfbmr807277qki.9.1652903214594;
        Wed, 18 May 2022 12:46:54 -0700 (PDT)
Received: from [192.168.0.189] (modemcable134.222-177-173.mc.videotron.ca. [173.177.222.134])
        by smtp.gmail.com with ESMTPSA id i125-20020a375483000000b0069fc13ce1f2sm88779qkb.35.2022.05.18.12.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 12:46:53 -0700 (PDT)
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Fix halt on boot by reducing
 driver's init level
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220518103554.949511-1-vladimir.zapolskiy@linaro.org>
 <f645fe49-8adf-c1b2-89be-e8ab8f620f16@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <034f3156-289d-caab-695d-28a9a0e5a9d9@marek.ca>
Date:   Wed, 18 May 2022 15:46:38 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f645fe49-8adf-c1b2-89be-e8ab8f620f16@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/18/22 8:48 AM, Bryan O'Donoghue wrote:
> On 18/05/2022 11:35, Vladimir Zapolskiy wrote:
>> Access to I/O of SM8250 camera clock controller IP depends on enabled
>> GCC_CAMERA_AHB_CLK clock supplied by global clock controller, the latter
>> one is inited on subsys level, so, to satisfy the dependency, it would
>> make sense to deprive the init level of camcc-sm8250 driver.
>>
>> If both drivers are compiled as built-in, there is a change that a board
>> won't boot up due to a race, which happens on the same init level.
>>
>> Fixes: 5d66ca79b58c ("clk: qcom: Add camera clock controller driver 
>> for SM8250")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/clk/qcom/camcc-sm8250.c | 12 +-----------
>>   1 file changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/camcc-sm8250.c 
>> b/drivers/clk/qcom/camcc-sm8250.c
>> index 439eaafdcc86..ae4e9774f36e 100644
>> --- a/drivers/clk/qcom/camcc-sm8250.c
>> +++ b/drivers/clk/qcom/camcc-sm8250.c
>> @@ -2440,17 +2440,7 @@ static struct platform_driver 
>> cam_cc_sm8250_driver = {
>>       },
>>   };
>> -static int __init cam_cc_sm8250_init(void)
>> -{
>> -    return platform_driver_register(&cam_cc_sm8250_driver);
>> -}
>> -subsys_initcall(cam_cc_sm8250_init);
>> -
>> -static void __exit cam_cc_sm8250_exit(void)
>> -{
>> -    platform_driver_unregister(&cam_cc_sm8250_driver);
>> -}
>> -module_exit(cam_cc_sm8250_exit);
>> +module_platform_driver(cam_cc_sm8250_driver);
>>   MODULE_DESCRIPTION("QTI CAMCC SM8250 Driver");
>>   MODULE_LICENSE("GPL v2");
> 
> So I tried this
> 
> -                       clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> -                                <&rpmhcc RPMH_CXO_CLK>,
> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                   <&rpmhcc RPMH_CXO_CLK_A>,
>                                   <&sleep_clk>;
> -                       clock-names = "iface", "bi_tcxo", "bi_tcxo_ao", 
> "sleep_clk";
> +                       clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> 
> and the system wouldn't boot @ * 736ee37e2e8e - (tag: next-20220518, 
> linux-next/master) Add linux-next specific files for 20220518 (2 hours ago)
> 

GCC_CAMERA_AHB_CLK is defined but it isn't actually implemented by the 
upstream gcc driver, and the camcc driver doesn't do anything with it 
either (I didn't include it in the camcc driver because the gcc driver 
didn't implement it, but I have a patch to do things like downstream, 
dispcc/gpucc/videocc drivers all have this problem too). Does having it 
in the dts like this cause the gcc driver to probe first somehow, even 
though the clock isn't used by the camcc driver?

(The sc7180 camcc driver does do something with the "iface" clock, but 
the sc7180 gcc driver also doesn't implement GCC_CAMERA_AHB_CLK either.. 
I guess you get a dummy clock for the unimplemented clocks?)

> If we do a grep
> 
> grep subsys_init drivers/clk/qcom/camcc-*
> drivers/clk/qcom/camcc-sc7180.c:subsys_initcall(cam_cc_sc7180_init);
> drivers/clk/qcom/camcc-sc7280.c:subsys_initcall(cam_cc_sc7280_init);
> drivers/clk/qcom/camcc-sdm845.c:subsys_initcall(cam_cc_sdm845_init);
> drivers/clk/qcom/camcc-sm8250.c:subsys_initcall(cam_cc_sm8250_init);
> 
> and
> 
> arch/arm64/boot/dts/qcom/sc7180.dtsi:                   <&gcc 
> GCC_CAMERA_AHB_CLK>,
> arch/arm64/boot/dts/qcom/sm8250.dtsi:            clocks = <&gcc 
> GCC_CAMERA_AHB_CLK>,
> 
> I think the sc7180 has this same dependency loop. Probably needs the 
> same fix.
> 
> Also not sure why sdm845 camcc doesn't declare a depends on 
> GCC_CAMERA_AHB_CLK - should it ?
> 
> Recommend applying this same fix to sc718x
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> ---
> bod
