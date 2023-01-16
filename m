Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA64D66B98C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 09:57:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbjAPI5m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 03:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232441AbjAPI4g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 03:56:36 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3564113D74
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 00:56:35 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id a11so1629179lfg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 00:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eTej3R6a7StJO/X1aD8iGB5KaxJ3bqGGr/MCzLjiQ2g=;
        b=eg6mJCqGBJHTVkQ7/X62F0bWksNLADA8Np9XG8Xsqq4FeMMrrE3Iseks0sKQtAuPe1
         gxUgk8e9xnDNoUseGxQikBmrq8L3tkR04h+EiwFxPDIqltJ4XbLTEbyJ3ekb3kSRlWLi
         czCXRXPwOIiPuZm7CEmngdTw60HQaAF+AHVIfs04Q1eEGMsfi9UQDnvIBHCaIMr5Ev3B
         aPFE80jynAsqyuidwyaM8BrWdiFpQ6UQwnNmq/aM2nznB7wTi2F7uEvmgjY0yPuygBpj
         NCBR8qGELtG8QtX7LfFSPnhaiBGYtTRCQGLMJSwbUPMf2q/2dMxBU87KaSiihfkGIVgS
         Zxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTej3R6a7StJO/X1aD8iGB5KaxJ3bqGGr/MCzLjiQ2g=;
        b=ueBoivAqvbb8lSZTVUFEK5hWIE4ryXJSTVaAnAtjo1vkLSdAqmhugDTjvTdlVzF2uy
         k0jFTe9FAEtbxPW3jU6+ibFsYD8ylIovLMtcp9rrpGxFauFLxx5IiAEcUoapW5ZK+hNN
         UMVl4xtUFO1oOuSPARExOlhjGV0KcccpaioCemJtzuXJWcstSCumCUnHIB+VyFC9TN9f
         dD2C1/T6UMtFUtQJ6a+xZQV2R5xZnbVz7Q3ZHCUtOPnaJTrBrEsdTtCNH3B9ltqED6Hp
         pjHH4N77zIsy1rPVi1bg539uvaxghK8RTNN+tUVhIRSjs35i/TtPd2x3KrFM7q7XKDQ4
         lUzw==
X-Gm-Message-State: AFqh2kp5Lot5yQD2AEapNOBd+FEQTX0z0lWznZY6iBfrOTihT8IvLu5f
        Ii0NtxC3uirHqmXA1uU2wHbGWg==
X-Google-Smtp-Source: AMrXdXsUU0Y2ezVSvYFBupm+y2ISVnUmHhHa2zqr2l/aHQyb3+iXF60VUY2seTRCmf7ffGfwQTBsKA==
X-Received: by 2002:ac2:4e04:0:b0:4d5:733a:8a84 with SMTP id e4-20020ac24e04000000b004d5733a8a84mr1794578lfr.8.1673859393581;
        Mon, 16 Jan 2023 00:56:33 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id s14-20020a056512314e00b004cc82404ff9sm4011360lfi.7.2023.01.16.00.56.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 00:56:33 -0800 (PST)
Message-ID: <3ebaf19a-9d1a-be8d-1f99-f8cb6faa35dd@linaro.org>
Date:   Mon, 16 Jan 2023 09:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sdm845: move WCD9340 codec to
 separate file
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230113162245.117324-1-krzysztof.kozlowski@linaro.org>
 <20230113162245.117324-2-krzysztof.kozlowski@linaro.org>
 <e3c367ba-b752-d116-0b84-fd2437e565b8@linaro.org>
 <5e784285-c391-91f4-c9d1-a53443fc4264@linaro.org>
 <CAA8EJpr+0fnhy+aHwmdKQA_xk2Qkse0L5u8JdCJNDZqqdYwhrg@mail.gmail.com>
 <20385103-2217-a5d0-6355-802bc87ec888@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20385103-2217-a5d0-6355-802bc87ec888@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16.01.2023 08:58, Krzysztof Kozlowski wrote:
> On 16/01/2023 06:55, Dmitry Baryshkov wrote:
>> On Sun, 15 Jan 2023 at 13:21, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> On 14/01/2023 21:33, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 13.01.2023 17:22, Krzysztof Kozlowski wrote:
>>>>> WCD9340 codec node is not a property of the SoC, but board.  Move it to
>>>>> separate file and include it in the specific boards.  On all others,
>>>>> keep the Slimbus node disabled as it is empty.
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> ---
>>>> Generally this should be SoC-independent, for example some newer
>>>> MSM8998 devices shipped with the 9340 codec that most 845 devices
>>>> used, but earlier ones used the WCD9335 found on MSM8996
>>>
>>> OK, but I don't get if you expect me to change anything?
>>
>> Maybe it might make sense to name new include file just 'wcd9340.dtsi'
>> rather than 'sdm845-somthing.dtsi'? Same applies to the wcd9335 codec
>> found in msm8996.dtsi, if you are going to extract it too.
> 
> Ah, then I vote against, because it is not only codec, but also it's bus
> attachment. It cannot be re-used on other devices.
> 
> Same approach with sc7280 audios - not re-usable for other SoCs.
Riight.. and interrupts and so on, let's keep it SoC-bound.

Konrad
> 
> Best regards,
> Krzysztof
> 
