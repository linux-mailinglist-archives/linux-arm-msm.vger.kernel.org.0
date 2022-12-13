Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C703E64BC6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 19:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236504AbiLMSyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 13:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235840AbiLMSyU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 13:54:20 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07E581F2C9
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:54:19 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id x28so6467401lfn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lC+KntX++hM1w2lGSafes7pleNUR4S0pNhLp6Irfr/Q=;
        b=roYxglUr66VQa48ZHTZeu3uESZPXgc3tc3VCC+rRlXfM+pAuZX7d4eHa7JyuDevVx+
         5nrVchqktDeTLoeSJIct3WylaiScdddTDcLQFAinEMsHRrOFTm8f9bYKozeqRep2AFA6
         CYNgslUg9o2UnMzWsDAHA1jXD2TAE7MbOvszDfOWcgZ5RS75Dzx1mnJJUA1YsKqFxUiJ
         VhWj92XsLPw0JpyEdrTPpG5obwr40fp6g/2+NyMk7DE2ytfVhxuCQEB17uiuxQW4/GWz
         UC75tFrXrEt745KGIkOP17azY+7oqHrw+y+A56t++8yoGdykms/GNWWoe+Apcq7Ow2Zl
         tAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lC+KntX++hM1w2lGSafes7pleNUR4S0pNhLp6Irfr/Q=;
        b=jnFAxwUSAsv88MjHhQZwdHtwcGGz842b6/Rta26JJlFohljVLF37slt6vsUpf5F/Wz
         T6iIIRD20/Gdn4vrXOOE8ysg0EA/CvqfkivJMGJ9XO9aoDaAkBkzJKEpmwsm8LwLn6wq
         LweKN/KfgM05Ia4JUOiWtSofm7YeimQgARAQGTlomzEOLu1/0E4dvyW1jRxhCEf/4pCk
         vly1jaRXNVmxUMEqeA/kpB4OQQOtfIvF99PSh7scNR3cgSIGwIcdbAf/Vv4MDf2XZ+Dw
         0yxgm2aylrx1rdKsZGuL05CGDLynmakndWRVeAH7grMwVDceo7EMmkzB0uAIoSEAhwz6
         4fyQ==
X-Gm-Message-State: ANoB5plOGHHRIqN4zfRtsw0/Yaxt+ON51Bf28ogg3xQzH+DVwgwiAWfY
        MF8AHGA8kpLdXqCe+mBn4uv1hQ==
X-Google-Smtp-Source: AA0mqf4ZVl2lPVieJ+fMy9p8YDr0NR6mPjhOR69Td7DxTSED7Y57FO0SHQZ6jZpXcFrL6y+7S2jJNA==
X-Received: by 2002:a05:6512:b24:b0:4b6:f027:2af8 with SMTP id w36-20020a0565120b2400b004b6f0272af8mr2367597lfu.66.1670957657408;
        Tue, 13 Dec 2022 10:54:17 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id w26-20020ac2599a000000b004b40c2fccfdsm474474lfn.59.2022.12.13.10.54.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 10:54:16 -0800 (PST)
Message-ID: <c91e1b25-54b4-8d58-fafd-35202db5d65b@linaro.org>
Date:   Tue, 13 Dec 2022 19:54:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6115: Add USB SS qmp phy node
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        andersson@kernel.org
References: <20221213123823.455731-1-bhupesh.sharma@linaro.org>
 <20221213123823.455731-4-bhupesh.sharma@linaro.org>
 <39ff2174-6d04-ec21-b762-377ed28088cb@linaro.org>
 <CAH=2NtwUODvzLx=JThuZpADv+x+NtLx688Ox-95b_T9PtRf4_w@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAH=2NtwUODvzLx=JThuZpADv+x+NtLx688Ox-95b_T9PtRf4_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.12.2022 19:52, Bhupesh Sharma wrote:
> Hi Krzysztof,
> 
> On Tue, 13 Dec 2022 at 18:26, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 13/12/2022 13:38, Bhupesh Sharma wrote:
>>> Add USB superspeed qmp phy node to dtsi.
>>>
>>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 38 ++++++++++++++++++++++++++--
>>>  1 file changed, 36 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
>>> index e4ce135264f3d..9c5c024919f92 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
>>> @@ -579,6 +579,40 @@ usb_hsphy: phy@1613000 {
>>>                       status = "disabled";
>>>               };
>>>
>>> +             usb_qmpphy: phy@1615000 {
>>> +                     compatible = "qcom,sm6115-qmp-usb3-phy";
>>> +                     reg = <0x01615000 0x200>;
>>> +                     #clock-cells = <1>;
>>> +                     #address-cells = <1>;
>>> +                     #size-cells = <1>;
>>> +                     ranges;
>>> +                     clocks = <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>>> +                              <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>>> +                              <&gcc GCC_AHB2PHY_USB_CLK>;
>>> +                     clock-names = "com_aux",
>>> +                                   "ref",
>>> +                                   "cfg_ahb";
>>> +                     resets = <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>,
>>> +                              <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>;
>>> +                     reset-names = "phy", "phy_phy";
>>> +                     status = "disabled";
>>
>> Hm, you add a disabled PHY which is used by existing controller. The
>> controller is enabled in board DTS, but new PHY node isn't. Aren't you
>> now breaking it?
> 
> The USB controller is connected to two PHYs - one is HS PHY and the other is SS
> QMP Phy. So while the exiting board dts describes and uses only the HS
> PHY, newer
> board dts files (which will soon be sent out as a separate patch),
> will use both the HS and SS
> USB PHYs.
It will break Oneplus billie2, you need to specify just the usb2
phy (and phy-names with just usb2-phy) there. Otherwise it's gonna
end up waiting infinitely for the usb3 one to probe (but it won't
because it's disabled)

Konrad
> 
> So, this will not break the existing board dts files.
> 
>>> +
>>> +                     usb_ssphy: phy@1615200 {
>>> +                             reg = <0x01615200 0x200>,
>>> +                                   <0x01615400 0x200>,
>>> +                                   <0x01615c00 0x400>,
>>> +                                   <0x01615600 0x200>,
>>> +                                   <0x01615800 0x200>,
>>> +                                   <0x01615a00 0x100>;
>>> +                             #phy-cells = <0>;
>>> +                             #clock-cells = <1>;
>>> +                             clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>>> +                             clock-names = "pipe0";
>>> +                             clock-output-names = "usb3_phy_pipe_clk_src";
>>> +                     };
>>> +             };
>>> +
>>> +
>>
>> Just one blank line.
> 
> Ok, Will fix it in v2.
> 
>>>               qfprom@1b40000 {
>>>                       compatible = "qcom,sm6115-qfprom", "qcom,qfprom";
>>>                       reg = <0x01b40000 0x7000>;
>>> @@ -1023,8 +1057,8 @@ usb_dwc3: usb@4e00000 {
>>>                               compatible = "snps,dwc3";
>>>                               reg = <0x04e00000 0xcd00>;
>>>                               interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
>>> -                             phys = <&usb_hsphy>;
>>> -                             phy-names = "usb2-phy";
>>> +                             phys = <&usb_hsphy>, <&usb_ssphy>;
>>> +                             phy-names = "usb2-phy", "usb3-phy";
>>>                               iommus = <&apps_smmu 0x120 0x0>;
>>>                               snps,dis_u2_susphy_quirk;
>>>                               snps,dis_enblslpm_quirk;
>>
> 
> Thanks,
> Bhupesh
