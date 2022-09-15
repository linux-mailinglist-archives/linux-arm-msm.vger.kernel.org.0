Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 746005B9D33
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 16:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiIOOdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 10:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiIOOdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 10:33:38 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE1F9BB63
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 07:33:36 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id az6so14056507wmb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 07:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wnHQKWcpBCnlgkgGEcKhjPdjmSAL7sgo8FjBnqwxuRk=;
        b=Fv+3vdzUC/FW+D3gRIqf4d/40nLZ0zbPTAiGBYbmnKQ2x5kWskEbj0ZiKXWr6V7q4t
         JrlU3+00PgYIY2OT3jM7xg2Y1g+0CLkgtCM6owx9l3Mp47n1oObxi+zYKpOjaThYeXYg
         MZ1t7kEwhXLF4mOSj5P5nWUcBQRbwwcHwsjLOpjmTxmGJNCN8eiN4aBW9+8Qfatt23jB
         BTK7al5c5lv7n52rQ3z8b3oUamHfqvs6G2bh3rha6B4/REwYzRiAH7RpUaXDnt9E5Yjb
         6ciAsg1M3dyAAgp/pkDfjWEwK/Wyh39O3t2Ylg6DlA5dC0TJB7+0s4Fn7kaWgvWJDsGd
         GRMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wnHQKWcpBCnlgkgGEcKhjPdjmSAL7sgo8FjBnqwxuRk=;
        b=FQ8DmQSCLqzokzgIxjoVBC6sbPamqnGnjDeLDW7jBa1AX1tkPXQYFyg3cyIX3tyZSG
         jap3DTQatF9YH0P8/CfguCEJNLeVv99QcBEsiRoQb51TZfQSPHzrjqQ9wk0A/uipnD91
         5DhLQh/B594alij+doX9kPIHy7A1LQ1uGP+MUMvOxuoEB1Dkvmx0Fuyx05KkWFq8asec
         /wVkyxVLGJIVhnxHFNJjafeclMQES2rT97RyGju0R0pzjPFnLA8vWVBk2A+oYu0P6hTb
         +Nb8fvA71okwzgicFmU8qa6Zyu2Q9qs8jxwz5OKElkP50gO5vHwSxRG9ffP1WgI0ROMM
         sjOg==
X-Gm-Message-State: ACgBeo2UZ/99frNuiR8DsgcKLHnHAdIWLnDY32S6mhfmYrJ2F2dMMZ/k
        wlcmZg9xKVXgVG1XftxmxgFADA==
X-Google-Smtp-Source: AA6agR4DnsY43bvjKQeTuEmCzbwS04r06XWMjNusiQH3OTZHOoDDvEls+8tqOGfusd7I3N4mwXsNKQ==
X-Received: by 2002:a1c:721a:0:b0:3b4:641c:5d99 with SMTP id n26-20020a1c721a000000b003b4641c5d99mr7157814wmc.71.1663252415188;
        Thu, 15 Sep 2022 07:33:35 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.72])
        by smtp.gmail.com with ESMTPSA id m188-20020a1c26c5000000b003b33943ce5esm2991082wmm.32.2022.09.15.07.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 07:33:34 -0700 (PDT)
Message-ID: <0d2490ac-f5cc-c55a-030e-a49f021f81fa@linaro.org>
Date:   Thu, 15 Sep 2022 15:33:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
 <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
 <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
 <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
 <f013accb-96f7-a025-1d41-e2e97f8b2aa8@linaro.org>
 <CAA8EJprnrKP9Ze__KTTNGDs8sj3QhqpiHnnhf1=ipq+CFCoXsQ@mail.gmail.com>
 <272413e3-73d4-8e0d-7b5d-93007e419f76@linaro.org>
 <6e3bca5a-8b01-af12-ae69-b0044a8790f6@linaro.org>
 <2b4ab827-28aa-5e3f-951a-0bf43d1eb7b9@linaro.org>
 <dafc0231-c578-07f1-1f4b-1cf819fa349a@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dafc0231-c578-07f1-1f4b-1cf819fa349a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/09/2022 12:50, Dmitry Baryshkov wrote:
> On 11/09/2022 22:19, Krzysztof Kozlowski wrote:
>> On 11/09/2022 20:36, Krzysztof Kozlowski wrote:
>>
>>>> If your child schema fails, the referencing schema fails as well...
>>>
>>>
>>> Although now with DSI-PHY I cannot reproduce it and I am pretty sure I
>>> reproduced it with DPU controllers after modifying the DTS to lack a
>>> property... Hmmm
>>
>> https://github.com/devicetree-org/dt-schema/pull/82
> 
> Thanks for the quick fix!
> 
> However I think I'd still stick to the compatible binding for two reasons:
>   - It doesn't evaluate schema twice for these nodes
>   - It allows us to tightly link child nodes with the parent compatible, 
> which I think, was one of the points raised several revisions ago.

Yes, true. The referenced schema sometimes accepts few compatibles and
this gives strict matching without additional complexity.


Best regards,
Krzysztof
