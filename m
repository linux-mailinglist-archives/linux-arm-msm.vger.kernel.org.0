Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62D15765528
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 15:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbjG0Ne5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 09:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbjG0Ne4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 09:34:56 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E35742D4F
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 06:34:53 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9ba3d6157so14198041fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690464892; x=1691069692;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9uwU8ola2qkLcSKy+1rI5aYJOesLH456/lp3WB7O6aM=;
        b=C50x3UuXGGD+pywiK4+NxP6WrckJr3mb0tanueA232jGBD3tAJBugCLuZMBPwUmVXL
         fGKbEqxDdprS+Ycgh/dvbY/2g8e05/FJ1Fqo1akjAeZBvXX1+bwtLWS/iq5Rfw3B8x1p
         DNtAH0CCgf5///3MQ6sz/ERGZ5DhnkjJSIyIB8Ss68SfJGp/suJ6mOUrsfCw1A7FvpUW
         ivAedLk2G7Z1T4sgNqpMPjbkLSkvznYIQN5hPV6Iv8/8XP2uiLHCFJxLShHCLmtRXNqJ
         +cQqJ0DrrioMojCP/C+WEAaRT52km+9KUOYuzvn9Zc0YsmC2TaMfczDr41G9UaT/8fld
         9QWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690464892; x=1691069692;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uwU8ola2qkLcSKy+1rI5aYJOesLH456/lp3WB7O6aM=;
        b=cA9alJh/TtKoa8kgB0yoQFvmsndxANfT9f3zlnlHdEP13y0TL5lSd1N2jElv6dzLP1
         YGnsJNFBO2n1zxXzadFkdmdrKH7kcRH9xyj8Fhr2VHHqrYbXHqlWlRzq8XEpka6PO3aP
         m6b90WzKEt+bGyNYmezV5ebObxrEiJGLPUBTshwarL1rYh8MT/CZSmznqy7k2ruLPJcj
         nTLps226K1ty458vgi2rinlfGjxs2fmYyr3bNKxWK8bhbbQ87D2pjCxAJwXYS5QSAtd/
         PthyEDh0r3CtK21B0f/561qcf2qWcGiY+ls6j0bO0pFAqz0nLBWvK52PEh51vZOIaix8
         JHpA==
X-Gm-Message-State: ABy/qLak1hLwhPFjpkci/LJp2wrK9b8eYwUfSlB41ZVNzguhoCdEnA/S
        u7Ob3YG7DRLSifNwKN3WL8lwoA==
X-Google-Smtp-Source: APBJJlH0Y3VkQ0iBH2aM2WoMWRGBLQjYtW2yB9AaM+gkBgYJjEPBCW9UH2E6x4JfNXt58uxxP3R1kQ==
X-Received: by 2002:a2e:8310:0:b0:2b6:f1ad:d535 with SMTP id a16-20020a2e8310000000b002b6f1add535mr1641588ljh.14.1690464892041;
        Thu, 27 Jul 2023 06:34:52 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id lt5-20020a170906fa8500b0098f99048053sm792492ejb.148.2023.07.27.06.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 06:34:51 -0700 (PDT)
Message-ID: <6c5197c9-e24d-70ac-fd75-2c72369d8b7f@linaro.org>
Date:   Thu, 27 Jul 2023 16:34:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 00/17] drm/msm: Add SM6125 MDSS/DPU hardware and enable
 Sony Xperia 10 II panel
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230723-sm6125-dpu-v4-0-a3f287dd6c07@somainline.org>
 <169046051039.1413710.12901529844343078449.b4-ty@linaro.org>
In-Reply-To: <169046051039.1413710.12901529844343078449.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 15:22, Dmitry Baryshkov wrote:
> 
> On Sun, 23 Jul 2023 18:08:38 +0200, Marijn Suijten wrote:
>> Bring up the SM6125 DPU now that all preliminary series (such as INTF
>> TE) have been merged (for me to test the hardware properly), and most
>> other conflicting work (barring ongoing catalog *improvements*) has made
>> its way in as well or is still being discussed.
>>
>> The second part of the series complements that by immediately utilizing
>> this hardware in DT, and even enabling the MDSS/DSI nodes complete with
>> a 6.0" 1080x2520 panel for Sony's Seine PDX201 (Xperia 10 II).
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/17] drm/msm/dsi: Drop unused regulators from QCM2290 14nm DSI PHY config
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/a7e3fda5948a
> [02/17] arm64: dts: qcom: sm6125: Pad APPS IOMMU address to 8 characters
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/b7d35a8eae54
> [03/17] arm64: dts: qcom: sm6125: Sort spmi_bus node numerically by reg
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/2be52ca96a71

Of course, these two patches sneaked in by the mistake, dropped them now.

> [04/17] dt-bindings: display/msm: Remove DSI1 ports from SM6350/SM6375 example
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/4be2c19261fc
> [05/17] dt-bindings: clock: qcom,dispcc-sm6125: Require GCC PLL0 DIV clock
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/4f86e343f3c6
> [06/17] dt-bindings: clock: qcom,dispcc-sm6125: Allow power-domains property
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/91043642f28c
> [07/17] dt-bindings: display/msm: dsi-controller-main: Document SM6125
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/cf5859476e5d
> [08/17] dt-bindings: display/msm: sc7180-dpu: Describe SM6125
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/04a664dffd19
> [09/17] dt-bindings: display/msm: Add SM6125 MDSS
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/3bde3b8f8a04
> [10/17] drm/msm/dpu: Add SM6125 support
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/76c5dffd0bc4
> [11/17] drm/msm/mdss: Add SM6125 support
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/de50357565d3
> [12/17] dt-bindings: msm: dsi-phy-14nm: Document SM6125 variant
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/cdac445883cc
> [13/17] drm/msm/dsi: Reuse QCM2290 14nm DSI PHY configuration for SM6125
>          https://gitlab.freedesktop.org/lumag/msm/-/commit/7638d8059ace
> 
> Best regards,

-- 
With best wishes
Dmitry

