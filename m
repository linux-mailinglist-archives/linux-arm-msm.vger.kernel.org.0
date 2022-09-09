Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA3D5B3505
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 12:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230257AbiIIKS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 06:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbiIIKS0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 06:18:26 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B000129C6C
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 03:18:25 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a8so1849938lff.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 03:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/VudPBuUg8Yi2H0fyp4XXItQAWSGnhKI9+QIvSj4aPo=;
        b=SjK8642m+kC7L50jtrJprb6TubEpjuGV5QEEpGgw68uKQnlmEOHp0TpvHh5bZpVNEr
         rcO5WBcWwwONmzk1ETvAo+E7YImhsx7Kc3GR8qgDXM+MtXgUCFDVynI9eSqiNbAo5j5K
         iUE5CPFt5lMkjgbRv0Ryjp2qqWKSWHtOxTy4o62eplLuFo6GDYn74kkFZEwS4kR/Y6XS
         wH6la7j11eYaOK9DXmLzs0IVy5ooCLNv8uluaXu/Z74F3Fn4Ny2epqwSXSEOH42dtmT0
         +6SgKOkTAo8m3FiBSLCprgCQ2pSDKXey2HUG1wx+EiwaeSk0jZvdfDSmWdF0z3YtYn8I
         WLSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/VudPBuUg8Yi2H0fyp4XXItQAWSGnhKI9+QIvSj4aPo=;
        b=vz1rLE8J1m0YgFYdJAjQqKVmYDF9cUl1hpLt5taoDidTI2/d+ZX6nh+rAm7ZQtRGt8
         OqKu7iidBvA7mBGLdQQEDQYT+EdlO7cozEKFy/xFW58DXHtLr2Go/vJWrGo4uwZKAeGw
         +bJkwC3/+VmC5TMs9+88P10yoAMMyve+UhfhzklGXEkobnDhARVDwaBGE2uJPR6tZBwr
         0ijjLNIxcPTJ9sS87fu69GeDYU1S8s9FQMTuBfsu8BDXpBzO3UBdxq4eJsGcBZKWxE6z
         INuk6u9f6DgiHmoiZ0+bcHY2yX0jNY8tCDvPS6bNz15DqUNLQ3WLkdEsU/6mQdiYiX77
         AmKg==
X-Gm-Message-State: ACgBeo1jo0QpYfTRH60UshUt1GGO7w5+y2IDVoCdU3PbgZL4ANSYy1xP
        18yVyIqy5P/067I2qQY/Hc0nBg==
X-Google-Smtp-Source: AA6agR7TrZ2dYc7MCPiwqkYmLv9B4ObWokWYVKngs6cXjyE23B6nKRTFuKspSwXlWLoWmEatMQ/LOg==
X-Received: by 2002:a05:6512:159a:b0:492:d0c8:aec1 with SMTP id bp26-20020a056512159a00b00492d0c8aec1mr4455606lfb.275.1662718703748;
        Fri, 09 Sep 2022 03:18:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h27-20020a2eb0fb000000b00261b9ccb18esm27383ljl.10.2022.09.09.03.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 03:18:23 -0700 (PDT)
Message-ID: <7f002ba4-1e1e-300d-062e-db93390b0461@linaro.org>
Date:   Fri, 9 Sep 2022 13:18:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO
 clock to the HDMI PHY node
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
 <20220704161148.814510-4-dmitry.baryshkov@linaro.org>
 <6474b61e-69d8-dbcb-f638-7729ec3dee31@linaro.org>
In-Reply-To: <6474b61e-69d8-dbcb-f638-7729ec3dee31@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/08/2022 17:25, Dmitry Baryshkov wrote:
> On 04/07/2022 19:11, Dmitry Baryshkov wrote:
>> Add #clock-cells property to the HDMI PHY device node to let other nodes
>> resolve the hdmipll clock. While we are at it, also add the XO clock to
>> the device node.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Bjorn, I'm picking the patches 1,2 into msm-next. Could you please pick 
> this patch into your dts-for-6.1?

Again, gracious ping.

> 
>> ---
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi 
>> b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 25d6b26fab60..b72385ffecc6 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -1049,9 +1049,13 @@ hdmi_phy: hdmi-phy@9a0600 {
>>                           "hdmi_phy";
>>                   clocks = <&mmcc MDSS_AHB_CLK>,
>> -                     <&gcc GCC_HDMI_CLKREF_CLK>;
>> +                     <&gcc GCC_HDMI_CLKREF_CLK>,
>> +                     <&xo_board>;
>>                   clock-names = "iface",
>> -                          "ref";
>> +                          "ref",
>> +                          "xo";
>> +
>> +                #clock-cells = <0>;
>>                   status = "disabled";
>>               };
> 

-- 
With best wishes
Dmitry

