Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 037826FA743
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 12:28:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234626AbjEHK2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 06:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234510AbjEHK2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 06:28:36 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C6D4C07
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 03:28:34 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f13dafd5dcso4764342e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683541712; x=1686133712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I2Jb+xA8QGd1sVsf3f5607mlfCv/gv10lcVV2z3QNTI=;
        b=f3mTLwEfdvUiXjDcEzJ3Z+m0bt6D1IXVPzbEtXDvgGVP8nekC+GD6PIenAt/TlLgce
         7u+B2bdtASR6O3VIlfVzmZdwasDY0VeReTexR9/I99aZMqVmyNiajsrkXUSjmUelJ6YW
         DHOIahsjXRerPO2EI/l48ZlYZAgxIbNsJTLrowmfF2ryvWoO5mMMMCzcj1FHM4UN75G0
         UQM3BHRCT5azEWlgwHGX3AH2P+VSlQbyhLYztdRJPXu5DgA275k+XoFR+fO4ayCbU17I
         oreSPnESoyGzDalguQee8j0QVdjCkufWkMm96h41vZKX7eP5wodoGRadQfoMIU1b/xE+
         H46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683541712; x=1686133712;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I2Jb+xA8QGd1sVsf3f5607mlfCv/gv10lcVV2z3QNTI=;
        b=LpMMJmO5JPKc614E+ruJkNFfWv3C4DQ+Y3FQmIjt/vu5FxL8P3QalamnQO9cFEvF+2
         CYqns23omu5vYYhRNC3bIkkQ6NuPepXfkULo7pWYF2x/W5/UEGtv8nIPSIsiTIEFhdnD
         4FHhmNGy5yHEpNGU5atwUx47cY7nm6dTQqDipFT3XCpbCBIiFCaUkW5hn21x5hf3Sq8h
         GfZ3t+kO0e4fSzIj6yhnWJlX3iOcxB+H89gHrsc8AQH2sf1oFAj1p1tmue69o5HgxxEN
         vKr94IuzcjmVcByGO1xe6IHJy602Y+Yh0hVBuNWf8sFHeQtzwYc4f3PkiX+KmiNtaqSW
         6UaQ==
X-Gm-Message-State: AC+VfDxQi3aeAF0hGMUyo1VbUfD1Pe0zh6gNV8eN1E7sY8nNlEpkQkyg
        13y/8S4vb7DK7kgu4te3sQFNgQ==
X-Google-Smtp-Source: ACHHUZ4h0seTe4/zh3HmwznORxKSXd7UYJS5RgdNNFU0wGGRhLw3cbZnlmYxmIDSQ1Nw4afv8SwzXQ==
X-Received: by 2002:a2e:2419:0:b0:2ad:85dd:f3a8 with SMTP id k25-20020a2e2419000000b002ad85ddf3a8mr1287361ljk.30.1683541712491;
        Mon, 08 May 2023 03:28:32 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id p19-20020a2e9a93000000b002ad94c4351asm241662lji.66.2023.05.08.03.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 03:28:32 -0700 (PDT)
Message-ID: <d357a6f9-d66b-0ba1-138c-4b541c3bebfb@linaro.org>
Date:   Mon, 8 May 2023 12:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem clock to GPU
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
 <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
 <c8144b21-d672-318e-2761-5d1daf384c30@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c8144b21-d672-318e-2761-5d1daf384c30@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.05.2023 12:24, Dmitry Baryshkov wrote:
> On 08/05/2023 11:30, Konrad Dybcio wrote:
>>
>>
>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>> To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
>>> enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.
>>>
>>> Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Uhh.. this clock should be managed by RPM with:
>>
>> type = MEM
>> id = 2
>>
>> just like it's defined for 8994 today.
>>
>> Could you try adding it in rpmcc and confirming?
> 
> There is an RPM_SMD_OCMEMGX_CLK clk already, it is a bus clock for the ocmemnoc.
It's wrong.

Konrad
> 
>>
>> Konrad
>>>   arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>> index 834ad95515b1..fb661c1bd3d5 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>> @@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
>>>                 clocks = <&mmcc OXILI_GFX3D_CLK>,
>>>                    <&mmcc OXILICX_AHB_CLK>,
>>> +                 <&mmcc OXILI_OCMEMGX_CLK>,
>>>                    <&mmcc OXILICX_AXI_CLK>;
>>> -            clock-names = "core", "iface", "mem_iface";
>>> +            clock-names = "core", "iface", "mem", "mem_iface";
>>>                 sram = <&gmu_sram>;
>>>               power-domains = <&mmcc OXILICX_GDSC>;
> 
