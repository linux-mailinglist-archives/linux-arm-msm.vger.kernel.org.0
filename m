Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E0665B50A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 20:36:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229550AbiIKSg5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 14:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbiIKSg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 14:36:56 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF21B275C5
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 11:36:54 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id by6so8129831ljb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 11:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HEGKAKK1OqGgF3tIA2jjvvuMVVe0d6JEaemGS/L/y8U=;
        b=WpXgzNWoYrIbGwvpKV+qZ25JAOEjKIESKDLJbLOuTtr4m89vwB70GUvxDiUUjPeagy
         A7tNxBtZFDJYIBgbd1u99stOnpe6EVzSt5O1/nsxMk8CWJSEno7bVS/zhTXu1QVY8U7U
         xXaVWl2jPxEY5UPn1sz+A9J/U1aFGADL/sy3xpYq3STq3/Fv+lka3sxzWaw4rh8yczU7
         9fNiUsA23wx+HOELxYXwncUEtR5y9cfuVHbhC8Q8kTyUIwsUMVvV5NkjSzfp1uqPKqdu
         TV4EikYi6fXdySveGfE4Aqx9NlkepayOuyytK9NBGTN6eAeldOfMNvShRZwLEdy1JY56
         myow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HEGKAKK1OqGgF3tIA2jjvvuMVVe0d6JEaemGS/L/y8U=;
        b=xzqcfR2Hqmd6cKyMcvkOxFHFNfiXFOWzzPNRP0xKRjTatuFVIpNgsJ+d9tL8B2oLCg
         ZnXcDecJCeTEHNWTX68RQ0dUwjD0MD+UEcJQbTOjNROm6Rn+82puyTY5HP1cj1JrC3+h
         m9+jmqltwj3+Uf0rycioYZMlvl/TTPLw+NbsU7NIHy794OplY7w2fJA1HSz09yUl/qfI
         oy0U+7qf+f4hk53EnFMipT8qWrCBNshcD/OryWt/xaZNsqdTnqe6MgMwSSO2E22oGtco
         4gGHsVGvE2GXL4CJVdl/y9EMNTI38NEyqOV9ZtBxMTGKOxOS5AI0C/yI+LWrL1KqqTif
         gKhw==
X-Gm-Message-State: ACgBeo3iG8NSJJEa9RqofqFjcLIVUJbXL0cHuVksyE/49orJshpC1P99
        knm6kCJveDYY0XwAZ+VLiSSI6g==
X-Google-Smtp-Source: AA6agR414d7OgEiTCUavbnSUu/a+GLfdR22e6CqyXsFSb3o+Ap4GP8nLHn2EH/xpoe0hx5wc+gaTdw==
X-Received: by 2002:a05:651c:b08:b0:26b:dbae:1d8b with SMTP id b8-20020a05651c0b0800b0026bdbae1d8bmr5145910ljr.85.1662921413069;
        Sun, 11 Sep 2022 11:36:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id p3-20020a05651238c300b00498f36bce07sm686441lft.214.2022.09.11.11.36.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 11:36:52 -0700 (PDT)
Message-ID: <6e3bca5a-8b01-af12-ae69-b0044a8790f6@linaro.org>
Date:   Sun, 11 Sep 2022 20:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <272413e3-73d4-8e0d-7b5d-93007e419f76@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/09/2022 20:32, Krzysztof Kozlowski wrote:
> On 11/09/2022 19:45, Dmitry Baryshkov wrote:
>> On Sun, 11 Sept 2022 at 16:57, Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org> wrote:
>>>
>>> On 11/09/2022 15:45, Dmitry Baryshkov wrote:
>>>> On Sun, 11 Sept 2022 at 14:27, Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>>
>>>>> On 10/09/2022 14:54, Dmitry Baryshkov wrote:
>>>>>>>
>>>>>>> However I think there is no such problem, as Dmitry said, that ref
>>>>>>> changes anything. There will be always failure - either from parent
>>>>>>> schema (using $ref) or from device child schema (the one which actually
>>>>>>> misses the property).
>>>>>>
>>>>>> Initially I stumbled upon this issue with the dsi and dsi_phy nodes
>>>>>> for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
>>>>>> emit warnings regarding the missing -supply properties despite nodes
>>>>>> being disabled. If I use `compatible' here, the schema checks pass.
>>>>>> Thus I'd prefer to leave `compatible' here. Not to mention that it
>>>>>> also allows specifying a tighter binding than just using the $ref.
>>>>>
>>>>> I don't think we understood each other. I claim that error will be there
>>>>> anyway, just from different schema. So your change fixes nothing in
>>>>> total schema check...
>>>>
>>>> If the node is disabled, there will be no different schema check.
>>>
>>> As I wrote before, there was.
>>
>> The following results were captured with the following command, with
>> most of the DSI and MDSS schema files fixed, using the following
>> command:
>> $ PATH=~/.local/bin/:$PATH make -C ../build-64/ ARCH=arm64
>> qcom/sda660-inforce-ifc6560.dtb  CHECK_DTBS=y
>> DT_SCHEMA_FILES=display/msm
>>
>> As you can see from the example below, when using 'compatible' I'm
>> getting warnings just for the gpu@5000000 node, while using $ref I
>> also got warnings for the dsi-phy@c996400 node (disabled in the DT
>> file).
>> For your reference the tree in question is uploaded to the:
>>     https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-mdss-yaml
> 
> I did not say anything about msm-mdss. I said you will get errors from
> child schema anyway.
> 
> 	From schema:
> /home/krzk/dev/linux/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> 
> /home/krzk/dev/linux/linux/out/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb:
> dsi@c994000: clock-names: ['mdp_core', 'byte', 'byte_intf', 'mnoc',
> 'iface', 'bus', 'core_mmss', 'pixel', 'core'] is too long
> 
> 	From schema:
> /home/krzk/dev/linux/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> 
> /home/krzk/dev/linux/linux/out/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb:
> dsi@c994000: 'vdda-supply' does not match any of the regexes:
> 'pinctrl-[0-9]+'
> 
> 
> 
> If your child schema fails, the referencing schema fails as well...


Although now with DSI-PHY I cannot reproduce it and I am pretty sure I
reproduced it with DPU controllers after modifying the DTS to lack a
property... Hmmm


Best regards,
Krzysztof
