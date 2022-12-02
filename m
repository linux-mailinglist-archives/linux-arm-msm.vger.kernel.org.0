Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF19C640AAA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 17:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbiLBQ0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 11:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233413AbiLBQ0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 11:26:47 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18D32E2A
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 08:26:46 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x6so5945863lji.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 08:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0UF5I9xvAaNLvIJujC4MXTflu00bNErvoIoO/UHyR+U=;
        b=MMHLX/rYkTO6DNuNz5CGYYz2/LRrC4kK+iaqOPC2lld4zqAcWZQDW9JwxgFmSRVK43
         soc+3LnasSwCmZV7er/Eqp1x3hFIeaWBgKheWS1ih+GwvTD4TZvvfhl3ob/nnmvy1Bog
         H7cx9W3Vmz/F6Rg98rPxb9KwGI0qaHciECzbf4lfz/g0Bc9l9AKDlD45Q+7iigmTuW3R
         hRPxDRPD20+Ypn73lFvbQgkklMQR13Mhd/qTXcU2nzVRNTkdJ5CsuNZGetmyW9YHMiuL
         VeAn9Gx0J4vlJKVBA1S+VA+igDqwMTawlKO9Em6bbnmNcR50RQygshB0pw+R/NKo3cpy
         GCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0UF5I9xvAaNLvIJujC4MXTflu00bNErvoIoO/UHyR+U=;
        b=SsaOyWrfK45qy1/fs7AvhXBaZq/NICQVmM1sB7yogdurParzb2KMXl5S8e43+l/OtH
         hur3aBrlMcRDUmbj1wCNC0ybeOn5NtpId3orvaGYQXSs4cjDveOVVfWI2XXRod6YEhEX
         a9ScxfTzlv3CmyloItG1DOdh6KpB3nmy6U9JoZJZZii/4XxjhxgOv5rm1boWeTNrJ/2s
         9b1BNmblaqFEMV5ojs2PvSFrMd17pSxlZBUIV2FpUkk9I3803mKbAr2zJVmf++NT/Kbe
         WZ6uzOuS9lM9HUJchp04Ber8hMMPYIBNJ2moNT6P9Q/QhpliaLwZZiaTz8KOlii/ztLr
         dhMg==
X-Gm-Message-State: ANoB5pmUA3dzzBTjtAZfNaCQwi0cThVXrgoaGt2eauDX7D7XhHi+nagF
        Shp2ucuLw5Z4BW+2hzrmCsD28lfcuVLCNIwY/TE=
X-Google-Smtp-Source: AA0mqf5lCR6dD2t++a9tnKVO+0/luzxPDifl4p+kmYbtSEFfuYBxDaWMLm1Fiibk9ZBslnwyiuaqqw==
X-Received: by 2002:a2e:b90a:0:b0:278:ec8b:4783 with SMTP id b10-20020a2eb90a000000b00278ec8b4783mr18134537ljb.91.1669998404415;
        Fri, 02 Dec 2022 08:26:44 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f14-20020a05651c03ce00b0027998486803sm661724ljp.130.2022.12.02.08.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 08:26:43 -0800 (PST)
Message-ID: <875a9a21-1cb7-3708-30f1-af6dd48e4f20@linaro.org>
Date:   Fri, 2 Dec 2022 17:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: sdm845-db845c: fix audio codec
 interrupt pin name
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221202155738.383301-1-krzysztof.kozlowski@linaro.org>
 <CAD=FV=U86PyVQP4wbhwEkzYprJxz2-S3ooniuYKJBNQOudx2uA@mail.gmail.com>
 <CAD=FV=VjfFx_GBNh9zC=fdV5gUBHww+4BhSSpAq0iq-72i62TQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=VjfFx_GBNh9zC=fdV5gUBHww+4BhSSpAq0iq-72i62TQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/12/2022 17:18, Doug Anderson wrote:
> Hi,
> 
> On Fri, Dec 2, 2022 at 8:08 AM Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Fri, Dec 2, 2022 at 7:57 AM Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> The pin config entry should have a string, not number, for the GPIO used
>>> as WCD9340 audio codec interrupt.
>>>
>>> Reported-by: Doug Anderson <dianders@chromium.org>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Cc: Doug Anderson <dianders@chromium.org>
>>>
>>> Changes since v2:
>>> 1. New patch.
>>> ---
>>>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> Presumably should have a "Fixes" tag since this is likely a true bug.
>>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> FWIW, this got copy-pasta-ed to another place, which I just noticed as
> I'm looking at your v3. So while your change is correct, it'd be
> better to also fix "sdm845-xiaomi-beryllium-common.dtsi"

Yep...

Best regards,
Krzysztof

