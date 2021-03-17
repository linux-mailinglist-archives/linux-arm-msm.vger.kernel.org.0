Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9050233F28C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 15:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbhCQO0L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 10:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231839AbhCQO0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 10:26:01 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E26DBC061763
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:26:00 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id 30so1423604qva.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 07:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Oac/DlVej6hY85el0HaXgLiTpQUzb79aFBt4IEthyz0=;
        b=GKM4NaIxpRPCpBQcQWSGyqYsfZU/PTZSYW3A0Jz0vsRsLiAsfw410A2D0WKTa2PslS
         rey3lj5hAfeS+D7i4uvXO9e3pg/iTbD5dQK3yQdgHMC8eyafGpCBjlQtjGbHI1QnNWkt
         uMG8yr4WwyDUIoFrSkPn0k5vG1xR4Q/3C0++5tkOATQ87QqTDYb93hoh8pYj5GerQPxT
         YNXfPCyOyKNobP7NObSiJKhF+3ZXL7DNXLsuIo1oWUoASEUeeTZviIoeeJIarbj819/Y
         8z+EOoMylKhzK8v76auJzF+9+yT6JWsbl5eh0Tw51Vxr3LIVT65m+mye92QDidHQmLps
         WMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Oac/DlVej6hY85el0HaXgLiTpQUzb79aFBt4IEthyz0=;
        b=okpBXjoRKs+IQF/y5vBM7TU1x7o//hDDfrWkCsfZHqa8/J6m09rE173beVINGrz7nQ
         wwbbaOwX5CltB1tl9bxuFDrwOFyPEGld0TE/TKJNKSpiiaLGlwAGOY1sj6UFd0MdKnTe
         NkeaUKcsgYjOYN92bxRbrMaUAufxxj4Mj44q+nnOReyZj0fEQ09G/n2lEXK7E+m8P2+s
         OjgkEoMaz5Z2h+pyZkPjK8DF6ul003ORGdN8TkHlA0hEAoX5v1PDsnbuWvCKZ9AF4VMN
         ovXiIgwVzWqnX4fGNjvQRSjUP5G1ebDLyr3e01VLlFu1WEI/0kP9iLvutSzA0hUbvAco
         yEyw==
X-Gm-Message-State: AOAM531zEI1CO4x08e/GaRNtM/xkrJFsxmVr4iP0ENXx1k0z0V0eSfql
        Y5AaSYS5zL8eOPUEk1UpQfLOow==
X-Google-Smtp-Source: ABdhPJwUz2llOCCtPaylYmaDAP5eIdLpLfqeSpbLBQJXQonnkq+QeBs5NJ2NXWpytzPxXJWA4IU/SQ==
X-Received: by 2002:a0c:c248:: with SMTP id w8mr5675492qvh.58.1615991159804;
        Wed, 17 Mar 2021 07:25:59 -0700 (PDT)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id y9sm17232696qkm.19.2021.03.17.07.25.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Mar 2021 07:25:59 -0700 (PDT)
Subject: Re: [PATCH 2/8] dt-bindings: crypto : Add new compatible strings for
 qcom-qce
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
References: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
 <20210310052503.3618486-3-bhupesh.sharma@linaro.org>
 <20210316222825.GA3792517@robh.at.kernel.org>
 <CAH=2Ntw2dMaSYsx-Q=mXx_mMBr5PcmwhhBvTcmPYYKmy=rcCqw@mail.gmail.com>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <525bea31-b377-6f64-5cc2-827c738df372@linaro.org>
Date:   Wed, 17 Mar 2021 10:25:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAH=2Ntw2dMaSYsx-Q=mXx_mMBr5PcmwhhBvTcmPYYKmy=rcCqw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 3/17/21 9:20 AM, Bhupesh Sharma wrote:
> Hi Rob,
> 
> Thanks for your review.
> 
> On Wed, 17 Mar 2021 at 03:58, Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, Mar 10, 2021 at 10:54:57AM +0530, Bhupesh Sharma wrote:
>>> Newer qcom chips support newer versions of the qce IP, so add
>>> new compatible strings for qcom-qce (in addition to the existing
>>> "qcom,crypto-v5.1").
>>>
>>> With [1], Thara tried to add the support for new compatible strings,
>>> but we couldn't conclude on the approach to be used. Since we have
>>> a number of new qcom arm64 SoCs available now, several of which
>>> support the same crypto IP version, so it makes more sense to use
>>> the IP version for the compatible string, rather than using the soc
>>> name as the compatible string.
>>>
>>> [1]. https://lore.kernel.org/linux-arm-msm/20201119155233.3974286-7-thara.gopinath@linaro.org/
>>>
>>> Cc: Thara Gopinath <thara.gopinath@linaro.org>
>>> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
>>> Cc: Rob Herring <robh+dt@kernel.org>
>>> Cc: Andy Gross <agross@kernel.org>
>>> Cc: Herbert Xu <herbert@gondor.apana.org.au>
>>> Cc: David S. Miller <davem@davemloft.net>
>>> Cc: Stephen Boyd <sboyd@kernel.org>
>>> Cc: Michael Turquette <mturquette@baylibre.com>
>>> Cc: linux-clk@vger.kernel.org
>>> Cc: linux-crypto@vger.kernel.org
>>> Cc: devicetree@vger.kernel.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: bhupesh.linux@gmail.com
>>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/crypto/qcom-qce.txt | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
>>> index 07ee1b12000b..217b37dbd58a 100644
>>> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
>>> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
>>> @@ -2,7 +2,11 @@ Qualcomm crypto engine driver
>>>
>>>   Required properties:
>>>
>>> -- compatible  : should be "qcom,crypto-v5.1"
>>> +- compatible  : Supported versions are:
>>> +             - "qcom,crypto-v5.1", for ipq6018
>>> +             - "qcom,crypto-v5.4", for sdm845, sm8150
>>
>> 2 SoCs sharing 1 version doesn't convince me on using version numbers.
>> Having 4 versions for 5 SoCs further convinces me you should stick with
>> SoC specific compatibles as *everyone* else does (including most QCom
>> bindings).

Hi!

So, it is 2 SoCs today. But we do have a bunch of SoCs for each version 
and these could be added in future. I think I have asked this question 
before as well,how about "qcom,sdm845-crypto", "qcom,crypto-v5.4" and 
have only "qcom,crypto-<version>" in the driver ? I see this being done 
by some Qcom bindings.


> Fair enough. I will add SoC specific compatibles in v2, which should
> be out shortly.
> 
> Regards,
> Bhupesh
> 
>>> +             - "qcom,crypto-v5.5", for sm8250
>>> +             - "qcom,crypto-v5.6", for sm8350
>>>   - reg         : specifies base physical address and size of the registers map
>>>   - clocks      : phandle to clock-controller plus clock-specifier pair
>>>   - clock-names : "iface" clocks register interface
>>> --
>>> 2.29.2
>>>

-- 
Warm Regards
Thara
