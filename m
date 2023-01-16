Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54B2866CF59
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 20:10:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbjAPTKr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 14:10:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbjAPTKp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 14:10:45 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0312798D
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 11:10:44 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id ud5so70263733ejc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 11:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Co2g9IMkk73uKQEckznsjPdf9rOk98qtlKq/GS31a/w=;
        b=U714rqVZg173SnKUPuCRnKX3tvwBwaSG8VtImxN4rrf/BDh9nnYe6KzyleixazhPxP
         A7OTCSaQrm1KfFD2C0ElinXw7VfsQzQkulca9N2XZsBa+yhZ8B7ZhE4C2i6mQvJiOyu/
         Poam/01xBxy83M/lKNRrgnt0vs03iTu6v2co+WHq8hcqT3ngZ2/wLglaDPoSwNYf5mw0
         FC4XfqtP0nF6sL8Tuo37qD/UUegdNfYUbRBb4QuCqqkTGujoOSGW4+LfiuezDrRLLKoW
         ECWTHLo9wwg04wFeOD/bW4tYkWbv30totLZK3C5M+upSXf3Z9ZifyKqCh1XQJwecH4p9
         BBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Co2g9IMkk73uKQEckznsjPdf9rOk98qtlKq/GS31a/w=;
        b=WDw3VKuzl+iib3VyHCmQMg1fpoKG5i0bfZuQu1PMTARN9NXojtelC/9+RNo/H1+D1T
         sT2A3iGNzdlCalphnf10PCL+CwUGErCLCJgmWPbHY1RticAovssh3Fa2byS+dtP89364
         TLW3OtrABQXiYjaHgnZg5pBQArScyHX85vEjStqFBSPmp+FpV+l4p7qeMCDiihjPCr3N
         3v7OXSV739THo6F81iNNQeS/YbyTLMGizLNVgTo4/p7x/qYy33CUesAVv4hboRiQJzu0
         68/I8f2JabID0SN7xg6hE2kX3niQs1yCWkx8+3xXnOOmNP5nIcMjTWveaD37hWIpX2+j
         QBHA==
X-Gm-Message-State: AFqh2kqPIyvSrhu4QeLGwylU5xWn/dNj3qSso4yk32GVhBQI5RHsIKMJ
        Df3WYavUFo8C92lp0eu4DnQWhA==
X-Google-Smtp-Source: AMrXdXu7KxNRBkkMmI1eVW/Eoo9jAdHt6qJ1e/DZ7tGTObc7DPCWM2gvqdSko6LhWVAwn+JazerySg==
X-Received: by 2002:a17:906:b855:b0:864:8c78:e7ff with SMTP id ga21-20020a170906b85500b008648c78e7ffmr12488537ejb.23.1673896243157;
        Mon, 16 Jan 2023 11:10:43 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id b17-20020a1709063cb100b0079e11b8e891sm12050219ejh.125.2023.01.16.11.10.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 11:10:42 -0800 (PST)
Message-ID: <18cab846-f62a-93f2-8d47-17b37b638278@linaro.org>
Date:   Mon, 16 Jan 2023 20:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: qcom: geni-se: Fix '#address-cells' &
 '#size-cells' related dt-binding error
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230113201038.267449-1-bhupesh.sharma@linaro.org>
 <aef753a5-e8b1-5b7b-1b9e-e92a84de15bd@linaro.org>
 <CAH=2Ntx5rLWu4jzXV8DwKj+yweHPRqb4+Rv8uZpDn_brWDxyJg@mail.gmail.com>
 <b9aa6d30-5fe8-57a9-e478-c99bca70d185@linaro.org>
 <CAH=2Nty2gUL3DufowzHavhUNdeht2dcX4EU7ooM+xzax2vP7uQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAH=2Nty2gUL3DufowzHavhUNdeht2dcX4EU7ooM+xzax2vP7uQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/01/2023 16:43, Bhupesh Sharma wrote:
> On Mon, 16 Jan 2023 at 13:23, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 15/01/2023 22:33, Bhupesh Sharma wrote:
>>> On Sun, 15 Jan 2023 at 20:57, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 13/01/2023 21:10, Bhupesh Sharma wrote:
>>>>> Fix the following '#address-cells' & '#size-cells' related
>>>>> dt-binding error:
>>>>>
>>>>>    $ make dtbs_check
>>>>>
>>>>>    From schema: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>>>>>         arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: geniqup@4ac0000:
>>>>>               #address-cells:0:0: 2 was expected
>>>>>       From schema: Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.yaml
>>>>
>>>> Don't we want rather to unify the soc address range?
>>>
>>> Well, the assumption in the original dt-bindings was that every reg
>>> variable is 4 * u32 wide (as most new qcom SoCs set #address- and
>>> #size-cells to <2>). However, that is not the case for all of the
>>> SoCs.
>>
>> Hm, which device of that SoC cannot be used with address/size cells 2?
> 
> As noted in the git log already the geniqup on sm6115 / sm4250 cannot
> be used with address/size cells 2 (See:
> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/qcom/sm6115.dtsi#L795)

That's not relevant and not answering to my question. Address/size cells
affect children, so not geniqup. address-cells 2 means you have
everywhere 64 bit addresses, so which devices cannot work with such DTS?
If you claim that geniqup and its children has some troubles - please
point what troubles. The DTS and existing address/size cells have
nothing to do with it.

Best regards,
Krzysztof

