Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2415261F21E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 12:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbiKGLqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 06:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231406AbiKGLqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 06:46:30 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A0C19000
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 03:46:26 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id a15so15800915ljb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 03:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JKZi6enSst2kWBJr01vLjOt2FvneWEg8LFzz5LHGB0=;
        b=jRVQIfmhXkPyQnD1t0mtaV1FdLeZIGj3gSbWh1rV/Z4ZOVlfY1/hK0O5VkF0xmCWOp
         Oi/hUjXVsGyFoWijFXycIFRbt8rXdq6HltPG7+Q3sfTeKCnglMKmU/1dv0XliC+qLYp8
         KnbVu3PoifP80c87ciD4PHRNArjB9XIUQ4GcFBcQgyf8q23ONyTdnrK0AjdFf9R47Z2X
         hu+i+p1M+qlgmEluomPb91cwXF/CwqUx2bkHAkgs4/nKLFRT07XnQSsDc9DnlpKA7bF2
         aQnHXZPKtkCh0nf51yYKDew4qY8SNHunHgCiK5BA6dPQSCPkZCn66qqo073FJNZxpcEo
         UqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+JKZi6enSst2kWBJr01vLjOt2FvneWEg8LFzz5LHGB0=;
        b=n+ELzCFFwdqIucuWMOemjP7g5s8K/oIBs8pQoebjr4VhvYYAh17ZcnYQ8yD5HEme8j
         tdwVGf9RkE+tDEyCr5XmuoyejmhxcbEWmXPijWB0tkZMwTo0kyJUJe0jWXJPOERnCO0L
         H8yvX/Q7eeSbtDGRq/A3xRRdpLaMxZ+2QrLm8rQyE7KuhwNve+JJsYSZLmgumnwCo2r/
         rcrDSHbc5cgw8TzC1RU05qMlm9xVtTFf/2pdJk+ErMEJ82o50URTmvk0I6foD8U84zsU
         EtHNLT3E+dBknSrzJiJPqjAcNvRcQmqx44EtkM7vYKzg2vVywPSf0IPnQNo1uUsZdMob
         uDxQ==
X-Gm-Message-State: ACrzQf22hfk1sKVrk1B9zh6Rdkl78Lkxt8H9PcpHW16LKAMu+cCXVoGe
        +psTBTw9WRLlkzEd2Em1CCbPnA==
X-Google-Smtp-Source: AMsMyM5mKL7r8syre1BT4ctSIJFcHz6VTdD+N62rT1HzWdp50D84I5g9TtrE6H6vZRgIfavxv+ReSw==
X-Received: by 2002:a2e:a367:0:b0:277:7daa:cec6 with SMTP id i7-20020a2ea367000000b002777daacec6mr7265039ljn.265.1667821585056;
        Mon, 07 Nov 2022 03:46:25 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id c10-20020a056512324a00b004afc1607130sm1204444lfr.8.2022.11.07.03.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 03:46:24 -0800 (PST)
Message-ID: <819dc2f9-c1f2-201d-d611-f8b2a323473d@linaro.org>
Date:   Mon, 7 Nov 2022 12:46:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v1 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
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
 <163d117e-e519-e86d-b052-e4a2a53388d7@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <163d117e-e519-e86d-b052-e4a2a53388d7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 07/11/2022 12:36, Krzysztof Kozlowski wrote:
> On 07/11/2022 11:46, Konrad Dybcio wrote:
>>
>> On 06/11/2022 05:30, Bjorn Andersson wrote:
>>> On Fri, Nov 04, 2022 at 04:13:56PM +0300, Dmitry Baryshkov wrote:
>>>> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
>>>> configuration (yet).
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 18 ++++++++++++++++++
>>>>    1 file changed, 18 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>>> index 38ccd44620d0..e1a4cf1ee51d 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>>>> @@ -442,3 +442,21 @@ &usb_1_qmpphy {
>>>>    	vdda-phy-supply = <&vreg_l6b_1p2>;
>>>>    	vdda-pll-supply = <&vreg_l1b_0p91>;
>>>>    };
>>>> +
>>>> +&mdss {
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&mdss_mdp {
>>>> +	status = "okay";
>>>> +};
>>>> +
>>>> +&dsi0 {
>>> Please prefix the labels with "mdss_" so that you can keep them sorted
>>> alphabetically.
>> Why such a change all of a sudden? Only downstream (and sc7280 upstream)
>> has mdss_ prefixes for dsi.
> For keeping the nodes together - this makes review of code and patches
> easier.

Ok, I can see the reasoning.


>> Plain 'dsiN' is more generic.
> And why the label should be generic? Label should be useful and
> descriptive, although not too much, so mdss_dsi still fits in reasonable
> choice.

I was under the impression that it should be. But you're right.


Konrad

>
> Best regards,
> Krzysztof
>
