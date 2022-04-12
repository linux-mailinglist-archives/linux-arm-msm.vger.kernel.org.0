Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A844FCFD6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Apr 2022 08:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349651AbiDLGiw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 02:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350560AbiDLGiM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 02:38:12 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D10017E1D
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 23:34:56 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id o16so16944687ljp.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 23:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=O7aCx2FRRglqn4zVmoyWdyA60dbe6nn+Xs3q+BlzSm8=;
        b=L4yyc1O58czZqpyOXDLRpQ8l05yUbeItghn7To3S0DTazS9IDzRwjFvo5oGGj/Ls88
         C4GOQKM/+5fkeRYDoXuhEmTXf1DxZnepoXvD/IF6VBHeRCUQJpjCBHfcuCcUVSJB54es
         /wKtWNYQY2589yuMTFIiRALHhdYyfernMdAAnT4qu61mOQHhoP4PJvJDoljAONcL+oAi
         trrCM5X5fB5mkiaJYdAe5vOzqScpL5sM9lIXGSMA4YbOFtf2OA8AUAgiT46HdZjjVEK4
         AZRho6SWfHMRgAJdWxK5Gu9gQ6G1iqUGp2ODttg7nJK1v6LEEYNtnLGPDl0ECrNjXPzX
         9k6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=O7aCx2FRRglqn4zVmoyWdyA60dbe6nn+Xs3q+BlzSm8=;
        b=vhiDloFKyJ9Q/9vNCfuaAixedRVO36A8Dv0c4e7k7vvZkhGGPOELIdTG8EC5xs16c3
         Fcp/OgnQEJaIodaYM9nrE2/Lx9zA92/sAO6tWWpbc5KW8NPVCFz1RVfgXzWucbmWc8Vj
         YTm6hnMCM8a8xzr1UvcHLS6KIdpOdVbdO5rpj9A5lUOYwVgkzd3RgzzW1ASZB+GfL9B3
         SH41Qbh1HClAIsFk98Ghx0lCcuibx+sKgWn8hFs1Jc9wJdZ81zLcKy477evltP9Lk3TV
         n57b4WO0qPUJC+XZyP0+T+3KvOwYicslGYR2hxM8I7xtu2ItArnuQxDsPu2Qaivspb4F
         l4uw==
X-Gm-Message-State: AOAM533OwSSw0EHNyyTgbTIHqjwwf0nuM4IJ4CLIUKUihklDq9bVCiiB
        L0/JP2C1ARarjrw9i15aWMDKTA==
X-Google-Smtp-Source: ABdhPJz1jJQkcvdIMFi9xPEXuJ8UFT2G6hv/bmy3giVCY2SOU3WJ7AOgtzNN0L1E3q7f0TaLxs16tA==
X-Received: by 2002:a2e:9ed7:0:b0:24b:369:538b with SMTP id h23-20020a2e9ed7000000b0024b0369538bmr23292287ljk.206.1649745294581;
        Mon, 11 Apr 2022 23:34:54 -0700 (PDT)
Received: from [192.168.1.102] (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id bi2-20020a0565120e8200b004484aaaf818sm3541392lfb.13.2022.04.11.23.34.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 23:34:53 -0700 (PDT)
Message-ID: <2af9a8a7-0904-df31-7c1a-21705bcda8d6@linaro.org>
Date:   Tue, 12 Apr 2022 09:34:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: fix interconnects property of
 UFS node
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
 <dbe6d9c5-f717-785f-e65d-baa1328cea2b@linaro.org> <Ykx6NWrcf4IA2Mam@ripper>
 <CAA8EJpqrJr5RB8E6CQ+cAgp6bad4m_LSG6CPeMsf+Ws0jqFf1Q@mail.gmail.com>
 <YlTlZa35A4lu02oI@builder.lan>
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <YlTlZa35A4lu02oI@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 4/12/22 05:35, Bjorn Andersson wrote:
> On Tue 05 Apr 12:38 CDT 2022, Dmitry Baryshkov wrote:
> 
>> On Tue, 5 Apr 2022 at 20:17, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>>>
>>> On Tue 05 Apr 08:38 PDT 2022, Dmitry Baryshkov wrote:
>>>
>>>> On 11/03/2022 01:19, Vladimir Zapolskiy wrote:
>>>>> All interconnect device tree nodes on sm8450 are 2-cells, however in
>>>>> UFS node they are handled as 1-cells, fix it.
>>>>>
>>>>> Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
>>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>
>>>> Bjorn, could you please this pick for the -rc kernel?
>>>>
>>>
>>> The change is obviously correct, but what difference does this change
>>> make with the current implementation?
>>
>> it makes interconnect paths probe correctly. All NoC have
>> #interconnec-cells = <2> now.
>>
> 
> But there's no code in the UFS driver that calls of_icc_get(), so what
> does this actually do? (Other than correcting the dtb for the day when
> we add that support to the driver).

FWIW the change also has a runtime effect, it fixes a parsing of the board dtb,
otherwise a warning in the kernel log appears:

   OF: /soc@0/ufshc@1d84000: could not get #interconnect-cells for /clocks/sleep-clk

Why /clocks/sleep-clk is mentioned here at all??
Its phandle value is 0x26, which is equal to SLAVE_UFS_MEM_CFG from the array.

--
Best wishes,
Vladimir

>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
>>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> index 0cd5af8c03bd..bbd38b55e976 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> @@ -1376,8 +1376,8 @@ ufs_mem_hc: ufshc@1d84000 {
>>>>>                      iommus = <&apps_smmu 0xe0 0x0>;
>>>>> -                   interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
>>>>> -                                   <&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
>>>>> +                   interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
>>>>> +                                   <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
>>>>>                      interconnect-names = "ufs-ddr", "cpu-ufs";
>>>>>                      clock-names =
>>>>>                              "core_clk",
>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry
