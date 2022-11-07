Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA0DC61F1EF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 12:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbiKGLga (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 06:36:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231829AbiKGLg3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 06:36:29 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C9E019C0E
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 03:36:27 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id o12so16339558lfq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 03:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4RvAclY+neH49C1cBsdQNnQdmHNpl6bHWNQMQFTUziI=;
        b=Y84q8IKqYWPLVgdrd9IB24CTZK4TkD31OXVWydpwXjb9dNftk4y9wVKt6z5pvCHydQ
         LVRAlFjZTi+0O9RQea6JzJfVeQHQsGDuKVUMKIOFkDZCyvppXzjAGWK4Oc268BGfVix3
         rVyF52l/ljmK7LIIrm57PJzQJ/nG07TzkC4T4ZjM2XQBk0OGUKdkYcxGhbZV3voddcKC
         4gkV9YOltOD1ij38GSGEkOGnSjHp0qXB4k8ZUApKRlvRp7o3wJ6ZfY1xf0Xw/rhJcSmZ
         79klGfdR4EPSScwgCOf7Sxh8B6ANutE/D7xkNng0aKm2ePOALPC15Y07AYDnEDGFYjp5
         lkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4RvAclY+neH49C1cBsdQNnQdmHNpl6bHWNQMQFTUziI=;
        b=60YzC7NG3FljX2k8Ktj9j/EN5Ya94v+Hb8taKyMwpBgMSSmTgZLtkgG9+yyvYDmTWT
         uBDflPeTsAXIWYEe6YFppuRCKBD1EWNGHc+YSKq8bMs82bd5q6nZdxj2rTTwJtfxqNsB
         SI9rw8PAkkxNxL5BmGZjw939vOabolh43O2AF4LpXpOCj95j29Ww9W3lU65Gph4BULfb
         xZpy9UwDHIWUgtP+f+pLw8f10BbDZ8xdY33mJ8VoDkvqSA2dcnCixYrd1aHEhPZnMF1f
         DLIRpt4hF7soCCp3jCvEgU4GGkLc6txo5LrQ5Iw8TGaEIJdaIH6idXTS7bg/ht6vvVLJ
         DnsQ==
X-Gm-Message-State: ACrzQf0/9RXFI5YKd12u7vLysHWhPAl8qoEXtN7R9MAPOEP0EoA2a2HX
        QkudMthnblwOaf7wr0Jreoeb/w==
X-Google-Smtp-Source: AMsMyM6FupxNgodwKghj39xjwOBD/jd7eC3m/sYxk9JT9Cl6jC+t5ibvzXVL4AV6K2lERpbW2FUNJQ==
X-Received: by 2002:ac2:4f0a:0:b0:4af:eacf:fb79 with SMTP id k10-20020ac24f0a000000b004afeacffb79mr16847457lfr.420.1667820985805;
        Mon, 07 Nov 2022 03:36:25 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id o22-20020a05651205d600b004aa0870b5e5sm1199763lfo.147.2022.11.07.03.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 03:36:25 -0800 (PST)
Message-ID: <163d117e-e519-e86d-b052-e4a2a53388d7@linaro.org>
Date:   Mon, 7 Nov 2022 12:36:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104131358.1025987-1-dmitry.baryshkov@linaro.org>
 <20221104131358.1025987-4-dmitry.baryshkov@linaro.org>
 <20221106043011.pw5fqeame7otzdcn@builder.lan>
 <dc19c341-c653-c60e-dd45-5c87ed4c6811@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <dc19c341-c653-c60e-dd45-5c87ed4c6811@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/11/2022 11:46, Konrad Dybcio wrote:
> 
> 
> On 06/11/2022 05:30, Bjorn Andersson wrote:
>> On Fri, Nov 04, 2022 at 04:13:56PM +0300, Dmitry Baryshkov wrote:
>>> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
>>> configuration (yet).
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>> index 38ccd44620d0..e1a4cf1ee51d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>> @@ -442,3 +442,21 @@ &usb_1_qmpphy {
>>>   	vdda-phy-supply = <&vreg_l6b_1p2>;
>>>   	vdda-pll-supply = <&vreg_l1b_0p91>;
>>>   };
>>> +
>>> +&mdss {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&mdss_mdp {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&dsi0 {
>>
>> Please prefix the labels with "mdss_" so that you can keep them sorted
>> alphabetically.
> Why such a change all of a sudden? Only downstream (and sc7280 upstream) 
> has mdss_ prefixes for dsi. 

For keeping the nodes together - this makes review of code and patches
easier.

> Plain 'dsiN' is more generic.

And why the label should be generic? Label should be useful and
descriptive, although not too much, so mdss_dsi still fits in reasonable
choice.

Best regards,
Krzysztof

