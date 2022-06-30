Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A973156225C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 20:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236589AbiF3Swh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 14:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236082AbiF3Swg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 14:52:36 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF852E6AF
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 11:52:35 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id r18so51438edb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 11:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a8QSshNO4PquU5B4T04Oyu46tpetIS7gSpq8ikJQaP4=;
        b=guCz8DJvJtTM9cHPdxsAV0VRJgFftXXGEHsFsTFB0Hy5F3ILiFqsR3FaeUtfjwkQFk
         fpJr0vQ3LT7+n3T5uFFRcrTtZ4NJgaEtFPhJ24Jy2PYiiFWVYFQrxhVDsi0id2gjOV9j
         VWRxQAboe83RB4FEWqToMuRiSsjn3v1pNMhx8bFV9vBcQx11Q+vdvoNaCOvUmVGVkU9o
         AEbUy6+nzOaLfx6GWhy4VR/lFKAwb/B2w8yvuCyrMFKADUHkvB+yhM8rTG8fE07GWG2f
         KAkhK/DI4GiIhU06ULCvnlRyAqmbTs/kiP0+dat6Br3w7uPosZrsfySHDPVq9mTlIELZ
         JIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a8QSshNO4PquU5B4T04Oyu46tpetIS7gSpq8ikJQaP4=;
        b=K3sW5WZjFAO/qyL7fcVDuPUs54sHHObHyh526XLuQHGJROQI+ZSGECqltoYgSf0v90
         /3fldoTbXaFPsx5sxSvzuJX93TKUIDKGv8+RHd5k66zma01lHrIo/Io33g8L07pe4GhI
         XH9pZpos9ySAjxfjnVGqJMsy1Ur11fSo4OFnzOleCBoaQxViYvYrW5tQZTQUXEkKVVIl
         I03GIphXzEPvYJAdPWOykSm2Jlp6pFWHsyOQdQ8AdR+xrGY3s7N1sNaRkljcHbiauUxf
         +hZpS7TifD3Lo5fpKfnXgWkGl3A5S0buz/aLcGBTW1xkuPs8j1c771nrPC3kBoyQSwKC
         oaTA==
X-Gm-Message-State: AJIora+wivjrRSiScunDayGkzNYAIN6s9Bv5FSpaNWvTsrleVRJbKVaE
        /+oVFDai+NrYLlG7qeDXXN5lJA==
X-Google-Smtp-Source: AGRyM1ttbJa44TsLRuzrOQZzeUeHw4K/sJQOM8KEFXgvISl4OmM8FZuHPnujXo2BxwYgn3l0moDkDg==
X-Received: by 2002:a05:6402:3304:b0:437:74dc:b6ea with SMTP id e4-20020a056402330400b0043774dcb6eamr13919912eda.141.1656615154199;
        Thu, 30 Jun 2022 11:52:34 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d15-20020a170906c20f00b006feb875503fsm9477611ejz.78.2022.06.30.11.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 11:52:33 -0700 (PDT)
Message-ID: <68801874-d62b-4300-03db-3702d55a4b0c@linaro.org>
Date:   Thu, 30 Jun 2022 20:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 06/13] arm64: dts: qcom: correct DWC3 node names and unit
 addresses
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
 <20220504131923.214367-7-krzysztof.kozlowski@linaro.org>
 <Yr0Yz7UATt0aqvL1@builder.lan>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Yr0Yz7UATt0aqvL1@builder.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 05:30, Bjorn Andersson wrote:
> On Wed 04 May 08:19 CDT 2022, Krzysztof Kozlowski wrote:
> [..]
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 692cf4be4eef..6af80a627c3a 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -3868,7 +3868,7 @@ usb_1: usb@a6f8800 {
>>  					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
>>  			interconnect-names = "usb-ddr", "apps-usb";
>>  
>> -			usb_1_dwc3: dwc3@a600000 {
>> +			usb_1_dwc3: usb@a600000 {
> 
> Linux uses the dev_name() when identifying each of these controllers in
> /sys/class/UDC, as such changing the name here will break existing USB
> ConfigFS Gadget users.
> 
> We had this fixed for a while, but where forced to revert it.
> 
> 
> So I think, in order for us to merge this without breaking AOSP, we'd
> need to come up with a way to retain the old UDC name (perhaps a label
> property?)

Ugh, I thought this was long time solved [1][2] and allowed to merge
most of [3] to get merged.


[1]
https://lore.kernel.org/all/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/

[2]
https://lore.kernel.org/linux-usb/CALAqxLXrs0_Xs0JV5H-wS1q2CJ7XhW5Dj90eu=uazkRXXEMUxQ@mail.gmail.com/

[3]
https://lore.kernel.org/all/20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru/


Best regards,
Krzysztof
