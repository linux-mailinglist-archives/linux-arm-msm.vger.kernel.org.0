Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BB3C6C692E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Mar 2023 14:10:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbjCWNKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Mar 2023 09:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231299AbjCWNKw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Mar 2023 09:10:52 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A70E9017
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 06:10:49 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so1144206wmq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Mar 2023 06:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679577047;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cS0+o7zM8LJLx7DPZpjCY5hNeBNoQNuN3JhovgtrJLE=;
        b=dKvkK0XKn7p4RyvseicMyVPdTSPyhnwBUnQJFRBFmi+6Yv0f5w+DbBHByWYdOMznAL
         wV28yrjelFiJOmMF0alCZx8zYwXk2DD0fQv2lfcU7XP0aPeqXJ1bklM8S6A/lwsGXTx0
         vGUgylBVemB6yAkBCW2TSbdp6ZwuRHjFu9R/2p0KlGBD7UsQUxwGemNlyhtkXokrSSUj
         eX4MzB8kP0bmAjpxgM0I9MCEno3wYJa08uDs68kCeIA1Cni3OB/UhW2vy3FvNYHNfbsp
         uWlOYjsahJpT3ocqIVNAyx0hq1LHo0IfCxGiM8NhhQWbrCG549z9grj2eXMvROx+dsMK
         wsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679577047;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cS0+o7zM8LJLx7DPZpjCY5hNeBNoQNuN3JhovgtrJLE=;
        b=Q9HvoNrmQFp6Q+Qku8CJcPCsMrwhMl+rfnxKZkBkgk4B/hthgCPWEPqUCS2xalFcO4
         pThDx4LqE2FX4LQQxXN5X3KMQp+INpgoo7lRcD2xRCuxy0JwrgiRfTBs04J6slQaxWI9
         sJWsYlk/gDow5Qy84MBXpwF9pY1tBh7WXLGKXiHk6LLPlppsFVb4CE/doEkqRng9Q7gx
         9nZC93SFYJ7fIENRgbPJzhcnj8Bb+O55hVJvx98A72wVxDLTqahfbFhFSGx2RbrKULuS
         nU+QNie9koJSMkSETCPpFQ+y663P8X5YuTo53kvvSk1xF3WkTKVnLWBs6Hcz+rAozEi5
         wfXg==
X-Gm-Message-State: AO0yUKWKYEo497qXrCLKqNuTlh2Dvrprg3JCzqgTX4UavxUSYQWEt/tQ
        4CHbiSROYvAzUdH1j8efnmH6pA==
X-Google-Smtp-Source: AK7set+tD0sGlRcEp0fyadjt97h4jc6tN/UCfkedKwkxauiWrNi7eFbnXeR9vkvPW0mAtApW+y0URQ==
X-Received: by 2002:a05:600c:204d:b0:3ed:2619:6485 with SMTP id p13-20020a05600c204d00b003ed26196485mr2354633wmg.3.1679577047703;
        Thu, 23 Mar 2023 06:10:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899? ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
        by smtp.gmail.com with ESMTPSA id p26-20020a7bcdfa000000b003ee443bf0c7sm1859376wmj.16.2023.03.23.06.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 06:10:47 -0700 (PDT)
Message-ID: <316d7d7d-b370-36e1-648a-400447d2dd47@linaro.org>
Date:   Thu, 23 Mar 2023 14:10:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 7/8] arm64: dts: qcom: sm8450: remove invalid reg-names
 from ufs node
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-scsi@vger.kernel.org
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-7-3ead1e418fe4@linaro.org>
 <9614782e-0d78-e8f2-a438-452cfa86f80b@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <9614782e-0d78-e8f2-a438-452cfa86f80b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 23/03/2023 11:49, Krzysztof Kozlowski wrote:
> On 23/03/2023 11:25, Neil Armstrong wrote:
>> Fixes the following DT bindings check error:
>> ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index ef9bae2e6acc..8ecc48c7c5ef 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -3996,7 +3996,6 @@ ufs_mem_hc: ufshc@1d84000 {
>>   				     "jedec,ufs-2.0";
>>   			reg = <0 0x01d84000 0 0x3000>,
>>   			      <0 0x01d88000 0 0x8000>;
>> -			reg-names = "std", "ice";
> 
> This is also part of:
> https://lore.kernel.org/linux-arm-msm/20230308155838.1094920-8-abel.vesa@linaro.org/#Z31arch:arm64:boot:dts:qcom:sm8450.dtsi
> but I actually wonder whether you just missed some binding patch?

I'm aware of Abel's RFC patchset to support shared ICE, but this is a cleanup of the current DT,
and the current bindings schema doesn't document reg-names.

Neil

> 
> Best regards,
> Krzysztof
> 

