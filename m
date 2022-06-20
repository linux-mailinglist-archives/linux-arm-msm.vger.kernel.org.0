Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24B34551904
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 14:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242726AbiFTMf4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 08:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242722AbiFTMfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 08:35:55 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B3DB13D0B
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 05:35:54 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id fu3so20823464ejc.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 05:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pnFmigdYB8CDy5EmnO11M8plckPdpyszZAnznD2P5mo=;
        b=kE8oo6DdEe2/sewDFfXMvKp9elIEyCI+S2N/Uy/OSxvuw9Lj9sEniYkLWi2k/ksZZj
         WYx/r1FXwOHG0ut/UoOqv6r/M/sOUIQtv7/TwRRCiFoDTmRoz0wCaVk3pT/3wjUpa5cn
         L7B1G2tIq/xb6D21L3XAdmNaPW+vEEJhH8tSzCaa5XDpLlgkUyjpmWC9DHKgzEPfkMlF
         BbKu/ry7Sc1Ns4AxvDZReH6BWufEqWx5L7i4PJ8N3FTieH2M1pPB4qJ64iyii5bb1Xa/
         gKjxk8Uq5iUyxCL1eQ7GxIDyeWsOnKsvzIiAvRaVIK9P/77eVh9lJHwOszRyko+skIrq
         lj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pnFmigdYB8CDy5EmnO11M8plckPdpyszZAnznD2P5mo=;
        b=GkYTgE2ud6kA8OjLguMvCxR7joVN4nk09ovK6ZSxHFK+sZZ0oAJYfdMcIpNmrO62MM
         ALopj2+tpX7wkPAt8ThfPH/ftOQygNkOBwDkBZWiJoJFF1hQKlSEE5QPNsuroXiQFW8Z
         tcez01U0ftpK43we7Ygm5dywAzWqrJKKfSopKF1FTHCNRMNa5QJLafLbKS9by/aszIbJ
         /RbimvaLbZc6r9BT7TELEiaD9bmoDSMwogCPFMMKG7n374LVzWHS2bAdZB7rH4kG3119
         hMxbAEUqdD77tIcPwwNDd+pDdgTapOKqaGazGxeqdFW8FJKeedBkV2kcdhvaaZ0go6tT
         4GGw==
X-Gm-Message-State: AJIora8lL2D+UV8qBncFDZ+lwYzyUjyY5VPuq0G4gT/qlzzBAL3Nu+fl
        6Xss+7EvqSHwH9xqyt+cjBdZ2Q==
X-Google-Smtp-Source: AGRyM1vVkReq11RcMsu+hVm+ixFbKKKPHaU3CC0AhN/NqUZvmeFEaJU0+qUxSFQ/E6KhZ268qZ/8Sw==
X-Received: by 2002:a17:906:acb:b0:709:d274:611b with SMTP id z11-20020a1709060acb00b00709d274611bmr20598603ejf.147.1655728553140;
        Mon, 20 Jun 2022 05:35:53 -0700 (PDT)
Received: from [192.168.0.210] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g12-20020a056402424c00b0043589eba83bsm1589966edb.58.2022.06.20.05.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 05:35:52 -0700 (PDT)
Message-ID: <22b47d38-930f-c74c-378b-8676593e4eb0@linaro.org>
Date:   Mon, 20 Jun 2022 14:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/4] arm64: dts: qcom: msm8996: add GCC's optional clock
 sources
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220620071936.1558906-1-dmitry.baryshkov@linaro.org>
 <20220620071936.1558906-4-dmitry.baryshkov@linaro.org>
 <22f4ba43-2505-3000-24b6-b01d58d87e7f@linaro.org>
 <CAA8EJpoESu8FBhbg8R6axtS-VfuYqsXKvgvnDExVJy2wZt5+Jg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpoESu8FBhbg8R6axtS-VfuYqsXKvgvnDExVJy2wZt5+Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/06/2022 13:27, Dmitry Baryshkov wrote:
> On Mon, 20 Jun 2022 at 14:24, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 20/06/2022 09:19, Dmitry Baryshkov wrote:
>>> Add missing GCC clock sources. This includes PCIe and USB PIPE and UFS
>>> symbol clocks.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 18 ++++++++++++++++--
>>>  1 file changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>> index e97f193aefd3..6c7380f86383 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>> @@ -689,8 +689,22 @@ gcc: clock-controller@300000 {
>>>
>>>                       clocks = <&rpmcc RPM_SMD_BB_CLK1>,
>>>                                <&rpmcc RPM_SMD_LN_BB_CLK>,
>>> -                              <&sleep_clk>;
>>> -                     clock-names = "cxo", "cxo2", "sleep_clk";
>>> +                              <&sleep_clk>,
>>> +                              <&pciephy_0>,
>>> +                              <&pciephy_1>,
>>> +                              <&pciephy_2>,
>>> +                              <&ssusb_phy_0>,
>>> +                              <0>, <0>, <0>;
>>
>> Since the clocks are optional, there is no need to pass <0> to them. I
>> think it does not bring any benefits.
> 
> It serves as a reminder that they should be filled with the proper
> sources. We do the same thing for DSI/DP clocks where the PHY is not
> yet supported, but the GCC lists them.
> 
> I had to mark them as optional so that the existing schema files pass
> validation. Otherwise they would be in the 'required' part.
> 

Hm, ok. Let's hope someone will actually remember to fill these in once
there is proper clock.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
