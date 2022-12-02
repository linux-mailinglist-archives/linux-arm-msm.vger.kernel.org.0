Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5126401E9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 09:19:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbiLBITf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 03:19:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbiLBISe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 03:18:34 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABCA13DFD
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 00:17:42 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id h10so4579502ljk.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 00:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JfOE5/j8wj6BlDWOHD6m2libhAmOvjCZ5n2WeZxrTXY=;
        b=X3Enft4Bpx+GTL1CPeXDZoyBQ66NZLIxzBRVdN+TPzDhGtMCu6dlZ2xMOaMTq+YjHm
         gC2qrQuZLsuv+KicuuY1xPo5eUrl/Uuzl/EhQx90HB3TbZ0dVeoTvVN7Du/UUq0en3oF
         SzcZFWepba2yxMyU5cTBjKUQQs9GktN+2efJ1qrqDDUaGBiWoEqFGgeHxWL5PzweU8/d
         P3BKCaiwFGuWblaZgmv+vQsJPqxk51Roe4mz1p3XPpWuIihygsHcLqHUt9fg5n2yjlRY
         vFVvEw/C9VVH2I/HHuHX5lfIF6OvahtLdzf9hrRNGPBkZBVXaOgUNIafWH0xK7xup73w
         WcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JfOE5/j8wj6BlDWOHD6m2libhAmOvjCZ5n2WeZxrTXY=;
        b=m97ZgRTp1QSyR+gwk0cpZU/2qXDo4oooPT1l3rZlvfSB6g6oqvbFT7z22uMhY6FY5T
         3AvU6zKlYJ9BOc5Q/VGJmbR6pfn5F9g8HJvSgtQIik0GyZvUvuT4dyB9GDTmke5b14DN
         H02f2behwOPQszc6h/rwAP8OMGM08bVf9gEYjg1W125pq5nt6uxty77A8eA8PrvuOHWg
         158rNFHfcWg9Np2D/7B1HiCPTl0AReo/CQRblvGRhlBXKOiDpGpNtUlOyOESHYfNIT5G
         cHm3+26APjnUfWm0hNm11O7rWumTgx123Y363/4Xdc2cecAX74O32zVgL7OSYvmG9+11
         sgWg==
X-Gm-Message-State: ANoB5pn/7fbihQ7BIOMnHEo0DsJEd9YZSo7Z0/Yc/EMs+/v0SHw4lRlS
        7rAMKIE46CUB572QzuVjW/GFJA==
X-Google-Smtp-Source: AA0mqf5lKw0C907wt2lGjVxAsXvSsZaJfGqEkfGG95X36RWWZ83jYHx5z+q6KTosvWG1oB+aM3U97A==
X-Received: by 2002:a2e:b0c3:0:b0:279:ba97:a2e7 with SMTP id g3-20020a2eb0c3000000b00279ba97a2e7mr4509787ljl.304.1669969061201;
        Fri, 02 Dec 2022 00:17:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s21-20020a056512203500b004ab98cd5644sm940491lfs.182.2022.12.02.00.17.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 00:17:40 -0800 (PST)
Message-ID: <ca4693a5-e941-a2c9-b023-42a91589dad6@linaro.org>
Date:   Fri, 2 Dec 2022 09:17:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFT PATCH v2 1/2] arm64: dts: qcom: sdm845-db845c: drop unneeded
 qup_spi0_default
Content-Language: en-US
To:     Doug Anderson <dianders@chromium.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221118164201.321147-1-krzysztof.kozlowski@linaro.org>
 <CAD=FV=Vo9zbsjgYEn0eBkC8eKRceg6v4u1g=w6nSYHNctFQWxg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAD=FV=Vo9zbsjgYEn0eBkC8eKRceg6v4u1g=w6nSYHNctFQWxg@mail.gmail.com>
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

On 02/12/2022 01:49, Doug Anderson wrote:
> Hi,
> 
> On Fri, Nov 18, 2022 at 8:42 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> The qup_spi0_default pin override is exactly the same as one already in
>> sdm845.dtsi.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Cc: Doug Anderson <dianders@chromium.org>
>>
>> Changes since v1:
>> 1. New patch.
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 8 --------
>>  1 file changed, 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>> index 02dcf75c0745..56a7afb697ed 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
>> @@ -1274,11 +1274,3 @@ ov7251_ep: endpoint {
>>                 };
>>         };
>>  };
>> -
>> -/* PINCTRL - additions to nodes defined in sdm845.dtsi */
>> -&qup_spi0_default {
>> -       config {
>> -               drive-strength = <6>;
>> -               bias-disable;
>> -       };
>> -};
> 
> I guess it's more of a question for what Bjorn thinks, but I view the
> fact that the drive-strength / bias are in the dtsi file to begin with
> as more as a bug in commit 8f6e20adaaf3 ("arm64: dts: qcom: sdm845:
> enable dma for spi"), which is where these properties were introduced
> to sdm845.dtsi.
> 
> The historical guidance from Bjorn was that things like
> "drive-strength" and "bias" didn't belong in the SoC dtsi file. Later
> we came to an agreement that it could be OK to put drive-strength in
> the SoC dtsi file but that bias was still problematic because it meant
> ugly "/delete-property/" stuff in the board dtsi files [1].

So let's move it from DTSI to all boards? Although what if the board
does not use SPI0?

Best regards,
Krzysztof

