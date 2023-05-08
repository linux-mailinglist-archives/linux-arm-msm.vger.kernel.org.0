Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5099A6FA7C8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 12:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234843AbjEHKex (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 06:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234700AbjEHKeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 06:34:21 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AE8027867
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 03:33:36 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2acb6571922so22562711fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683542015; x=1686134015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMkK5cHocOkySdQ1dvULOQ4jNtQaf1to9XDN1aW8VkM=;
        b=cnTXZAY/dC1mZhWnJp12bXNBoExNjAwk+0GnUWEDkYavWKThKgPlaw3OWMDOtsO3wf
         nI+rUpF8DhpoFnT/ucaXQbtXuQOUHkEn/byigFXHp0Nkaqk7HuumTB+qU2DA7jss7SDJ
         98cY5IoqOXqf3ApD4dC1BwGBMpaQWgYy6Nc7PYvc/L3LgCpaTEf9FCvxf1HTvwHPJNLp
         3wD4LwKrHLxAa3dYgidb5Ap54WWAC4UCXm/S8EzEepcU+QtimXzqb8R7PsZpG9BUzoPl
         cJxaJ6wFn2ECWWIEtBNvEw9tJl0MoDbExxxvBWs47nOJsM5mFIWJOlgYVRemAkM4znZ9
         n0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683542015; x=1686134015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMkK5cHocOkySdQ1dvULOQ4jNtQaf1to9XDN1aW8VkM=;
        b=dQaCqsWPJY/dppls98ipCI0j/dAM2ohs3rT3gzeeWb3yO30yM2yIit2GsLKZubZIK/
         7h8bWbVOMeqju3jHA2cHK5BrECbmPnxo4zUg38LEVasOBJQ+PddY44T3Ccm8UFiuoJPb
         3HD1gJ4BD1g4QB6NUHQ3+q+QyMzqRrQWSmkvyRPJHPJvBfpUAqtgD9kXLKrYOyt2EkFg
         Id7fISdODyAS7kSTU5AGVg5AJIUjWAhkm4NbzP9YSOtuLY5OrkQEkWEUU8n6mqGVmn+5
         dmtD/IUIuBWLhqxae7H28b4Zs1rKt61cppBlXYbv5cgDVXeyBzrkVGQxhcPh+tGkPssr
         a9wA==
X-Gm-Message-State: AC+VfDx5mtoEr2GbLM566pB/yX1dMgXTj2aRXk55zGxB3JGC5JOUcYsv
        DDHJEa6A5jF+1x7MwfibhBDbXQ==
X-Google-Smtp-Source: ACHHUZ6c1+OpsDSd4MYi0ZIkjZ8oJNw/uPXhw3lExTrIxEHsqFxKnyHc22rN/ZZOYQHgYm8zrvnpcg==
X-Received: by 2002:a2e:9590:0:b0:2ac:77fb:f2b3 with SMTP id w16-20020a2e9590000000b002ac77fbf2b3mr2810640ljh.40.1683542014794;
        Mon, 08 May 2023 03:33:34 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id z22-20020a2e3516000000b002a77792f2c5sm1109979ljz.62.2023.05.08.03.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:33:34 -0700 (PDT)
Message-ID: <f705d3c0-3822-1760-ba1f-fa11ef295bc7@linaro.org>
Date:   Mon, 8 May 2023 13:33:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: apq8074-dragonboard: enable DSI panel
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-5-dmitry.baryshkov@linaro.org>
 <ca09ce7d-b0c4-1544-0c9e-fab823aa79e6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ca09ce7d-b0c4-1544-0c9e-fab823aa79e6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 11:34, Konrad Dybcio wrote:
> 
> 
> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>> Enable MDSS, GPU and DSI panel output on the APQ8074 dragonboard.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> index c893afc00eb4..72f7e09a5bbf 100644
>> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> @@ -48,6 +48,57 @@ eeprom: eeprom@52 {
>>   	};
>>   };
>>   
>> +&dsi0 {
> old junk could use some mdss_ prefixing to keep the nodes together
> 
> Could you please take care of that?

Ack

> 
>> +	vdda-supply = <&pm8941_l2>;
>> +	vdd-supply = <&pm8941_l22>;
>> +	vddio-supply = <&pm8941_l12>;
>> +
>> +	status = "okay";
>> +
>> +	panel: panel@0 {
>> +		compatible = "sharp,ls043t1le01-qhd";
>> +		reg = <0>;
>> +
>> +		avdd-supply = <&pm8941_l22>;
>> +		backlight = <&pm8941_wled>;
>> +		reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
>> +
>> +		port {
>> +			panel_in: endpoint {
>> +				remote-endpoint = <&dsi0_out>;
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&dsi0_out {
>> +	remote-endpoint = <&panel_in>;
>> +	data-lanes = <0 1 2 3>;
>> +};
>> +
>> +&dsi0_phy {
>> +	status = "okay";
>> +
>> +	vddio-supply = <&pm8941_l12>;
> status last
> 
> Konrad
>> +};
>> +
>> +&gpu {
>> +	status = "okay";
>> +};
>> +
>> +&mdss {
>> +	status = "okay";
>> +};
>> +
>> +&pm8941_wled {
>> +	qcom,cs-out;
>> +	qcom,switching-freq = <3200>;
>> +	qcom,ovp = <32>;
>> +	qcom,num-strings = <1>;
>> +
>> +	status = "okay";
>> +};
>> +
>>   &remoteproc_adsp {
>>   	cx-supply = <&pm8841_s2>;
>>   

-- 
With best wishes
Dmitry

