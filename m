Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 708DA6738A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 13:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbjASMe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 07:34:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbjASMeE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 07:34:04 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4170E7E6BD
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 04:30:08 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id q8so1376598wmo.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 04:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UcNbpiHNkJaSlONNLaq69/U1cHe0Wi/deeXgruiIYlk=;
        b=zs1r3iTSdsastCcqC1s6jGo+TMaT++Dj/p0LpEv0Rc68YNsHs7a66i3FWNetl7mOk6
         7IGujmpIUkdMotwpYTQOKI1Kic2VCZirLmVFHBV4uRLf7LjYLdHEyz8T2kaOQYYv5cnV
         7jVZSc8xv7W5mwt9QOysf+VPkuLuvpFDy9beQUDRUaXqcPO6JvIsOFbjkT/XUxsV14pU
         9P8yt4rmJkY5FTONzvTx3SdklJU2g1RcyaC5YG9DFSywVMTzpdj9epxAIGadnaEJr8sN
         16R/XWnbnjRjWIQ55vUnxX81Pwipdi/7ARLnltxEc4LfOAaEhfZMmIhdH5VvjBScH/P3
         SRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UcNbpiHNkJaSlONNLaq69/U1cHe0Wi/deeXgruiIYlk=;
        b=Y7H8z66M6TtKuwzQ3h9KuMmbfbgxwXt8w7P3522ZBe1czeszCLqjZwNyTMPNtN9rQv
         pCHsL/bIT+VkzH5JkZZlj0xlGuJUYIwzZnsJLnnPxVEInjyByi9NjUo/20aB718zTbol
         L4YPhkqwtRmBgtMiv2uLu0FGLc9gedVxiPCRQGd+aRmUZ9XOSWo7OKbTdlmANX76Zc9G
         U4DC0RT8XRQ5Vmcj+GwluzmKI7/SU5ukN4vrUMdk2/A5Xu7mkulG+Cj4+AjQM/uGq7rX
         5jMmd46RUnQn2ZtAI55m16XjLtFwK+U+6upc2dZ2H9muH213Lm4Y5TceWEZ/i8iWgatL
         4/rA==
X-Gm-Message-State: AFqh2kqEPib3LseaSymGVcXilXJUZ0yD9wS3vWImw60k/EauUdWvCd0B
        o+od71J8xSB2B9/bD98elhSWMg==
X-Google-Smtp-Source: AMrXdXvOzeYIEi4dp0Tgez1Sr/c2pgde4bny/gVuIgmZz8MDwKTiqF6jrgaPfXhhhJWF/xIm33wYIg==
X-Received: by 2002:a05:600c:1d22:b0:3d9:6bc3:b8b9 with SMTP id l34-20020a05600c1d2200b003d96bc3b8b9mr10165519wms.9.1674131380376;
        Thu, 19 Jan 2023 04:29:40 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ay13-20020a05600c1e0d00b003cf71b1f66csm5119821wmb.0.2023.01.19.04.29.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 04:29:39 -0800 (PST)
Message-ID: <8322af81-139c-b840-dbf0-d52d86e92032@linaro.org>
Date:   Thu, 19 Jan 2023 13:29:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sm8550: Add PCIe HC and PHY
 support
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
References: <20230118230526.1499328-1-abel.vesa@linaro.org>
 <167408614065.2989059.2950818972854332656.b4-ty@kernel.org>
 <Y8jyQAR7fF1NRmwu@hovoldconsulting.com> <Y8kzBz0ApSWgOkVJ@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y8kzBz0ApSWgOkVJ@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/01/2023 13:09, Abel Vesa wrote:
> On 23-01-19 08:33:20, Johan Hovold wrote:
>> On Wed, Jan 18, 2023 at 05:55:31PM -0600, Bjorn Andersson wrote:
>>> On Thu, 19 Jan 2023 01:05:24 +0200, Abel Vesa wrote:
>>>> This patchset adds PCIe controllers and PHYs support to SM8550 platform
>>>> and enables them on the MTP board.
>>>>
>>>> The v1 was here:
>>>> https://lore.kernel.org/all/20221116130430.2812173-1-abel.vesa@linaro.org/
>>>>
>>>> Changes since v1:
>>>>  * ordered pcie related nodes alphabetically in MTP dts
>>>>  * dropped the pipe_mux, phy_pipe and ref clocks from the pcie nodes
>>>>  * dropped the child node from the phy nodes, like Johan suggested,
>>>>    and updated to use the sc8280xp binding scheme
>>>>  * changed "pcie_1_nocsr_com_phy_reset" 2nd reset name of pcie1_phy
>>>>    to "nocsr"
>>>>  * reordered all pcie nodes properties to look similar to the ones
>>>>    from sc8280xp
>>>>
>>>> [...]
>>>
>>> Applied, thanks!
>>>
>>> [1/2] arm64: dts: qcom: sm8550: Add PCIe PHYs and controllers nodes
>>>       commit: 7d1158c984d37e79ab8bb55ab152a0b35566cb89
>>> [2/2] arm64: dts: qcom: sm8550-mtp: Add PCIe PHYs and controllers nodes
>>>       commit: 1eeef306b5d80494cdb149f058013c3ab43984b4
>>
>> I believe there were still some changes needed to the controller
>> and PHY bindings so this should not have been merged.
>>
>> 	https://lore.kernel.org/all/Y8fuUI4xaNkADkWl@hovoldconsulting.com/
>> 	https://lore.kernel.org/lkml/Y8giHJMtPu4wTlmA@hovoldconsulting.com/
>>
>> Perhaps in the future you can send the dts changes along with the (PHY)
>> driver changes so that they can be kept in lock-step and avoid this.
> 
> Well, that is a bit hard to do, because phy patches are based on
> linux-phy/next, while dtsi patches are based on Bjorn's tree which,
> so ...

... which we long time solved by basing your patches on linux-next.
That's the only way for inter-tree patchsets to be properly based.

Best regards,
Krzysztof

