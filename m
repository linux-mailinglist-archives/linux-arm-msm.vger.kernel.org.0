Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDC15ED661
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 09:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbiI1Hjw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 03:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbiI1HjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 03:39:22 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F43101975
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:37:30 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id l18so6388689wrw.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 00:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=kFq/owo5gWxLx4y4U9Fe+fPvLJZVx8JY9zybO1v4ydg=;
        b=ckxO9rYUBw3zTw7PSdGafId1ucZgdHlyLgsZ8jPjH2pxi7wEQNPNURrMeeunL7D6AP
         T7NQbk/qn5v/vwiJdJVV8TiMr3zOuaekgPmHe9gsjBQeSbUX0LotbI3M9g/3s0gCuxJG
         fuUgZKztpJy5RyKxDQ5BbovtplL0LKPyauzkZwygCAEP1+MLuC3okpAajlyywtU2SqBy
         46wuNwRLrgGzRMytOFJkHi3pTCD2ADA3lQ7U0f/Rk1Agu92U9k7dgPLAfHFe9XbAsDBn
         rUi8cSJd5V8SOAIxyIFBpoG3/00FC41KdP+X1QCrwjheq7iK8OF+kXTwCnMxBhi/zOk/
         GYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=kFq/owo5gWxLx4y4U9Fe+fPvLJZVx8JY9zybO1v4ydg=;
        b=Sb6nxV2t0oIUXO8iMsbJ7STm1NDxgjX/35rt4QltQ8QDCGLud2LO3zqJCRdTN4rv7c
         NqEzfkJVR56QTyg7lpx5VFR+6+MnEBxavFUAlRRCcb+FaCPcN/+mSwQ+jM8cjYFTFyu4
         G4DkXbPQNjZ3aVaqFSZPTBszIPEXFNwwOrYbO4uNmpSm54tw+o7iuxJiFcdCHGfEgp5R
         rj3YCgTzsP8tRoUIo+jxdGbwNqate9iIx13ba1f3INAPUObwBT5H74H3pdiIRZRz5JOU
         PeGSzytS7mypXwmXfNq2t+sU+WI3Jz7t4ci3FsP3kaHrCsjC17kHdUZsXo1pt/XQlVIG
         rtcw==
X-Gm-Message-State: ACrzQf0TqxemdEEupfA3d3rB7lN0VzgbNksRA7HF6pVbIsF22e4KjmYI
        FZQBrEG3sMqBvkXBkTguTIvBLA==
X-Google-Smtp-Source: AMsMyM4UCYKXfp+Vp5r77z7N9Wtr6ueFmRFzPoSCUj42eYXswXZPNVfdXkBELNrukknRDKnbPrzp2g==
X-Received: by 2002:a5d:64e8:0:b0:22a:bb78:1e44 with SMTP id g8-20020a5d64e8000000b0022abb781e44mr21177746wri.378.1664350645933;
        Wed, 28 Sep 2022 00:37:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003a5c244fc13sm1014948wms.2.2022.09.28.00.37.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 00:37:25 -0700 (PDT)
Message-ID: <1fdbf742-e325-9b14-b795-0178c21dcf20@linaro.org>
Date:   Wed, 28 Sep 2022 09:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 01/12] arm64: dts: qcom: sc7280: drop clock-cells from
 LPASS TLMM
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
 <20220927153429.55365-2-krzysztof.kozlowski@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
In-Reply-To: <20220927153429.55365-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 17:34, Krzysztof Kozlowski wrote:
> The LPASS pin-controller is not a clock provider:
> 
>    qcom/sc7280-herobrine-herobrine-r1.dtb: pinctrl@33c0000: '#clock-cells' does not match any of the regexes: '-state$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 8d807b7bf66a..8823b75a6f1b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2432,8 +2432,6 @@ lpass_tlmm: pinctrl@33c0000 {
>   			#gpio-cells = <2>;
>   			gpio-ranges = <&lpass_tlmm 0 0 15>;
>   
> -			#clock-cells = <1>;
> -
>   			lpass_dmic01_clk: dmic01-clk {
>   				pins = "gpio6";
>   				function = "dmic1_clk";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
