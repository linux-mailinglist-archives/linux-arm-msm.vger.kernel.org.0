Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79A145A2950
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 16:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbiHZOZS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 10:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240957AbiHZOZP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 10:25:15 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D33193E3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 07:25:13 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id z25so2220041lfr.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 07:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=06T9wTlCHBAEXY2GEb3qtwxCsT7B2RAGjEVPlOQCqks=;
        b=ZwE10iRG6CbbaA/6sykl/gq+h+IcnIMa5gJPDRkX0gHTE4GrnN6lsCgA/VqoB9fauZ
         EVxr4jMb3a+Jl9Q9Na57YjR0rlWC7QVjC7PncqtYGqV1ZeVkTuOTPQdmqezjHE4qh1hE
         aIy8iWkcPMJQBcnzQaoAFVj1WS0IrjBHinOo5jD0HnMIZA4TUMu1nCCtBNHqNIZKiMCT
         Cy+fwM/H00QTIFa2yIRv+zxStjTIYyDJ5lRLb9z7qGhaS6b5zE2uc0PUP18MLzKtgeTt
         pbGu88qICKMttQjFO1MXEX7nK740RIpeymtSzVUwJngqAgkhrYGFdBnh01LsMvq15vWD
         l4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=06T9wTlCHBAEXY2GEb3qtwxCsT7B2RAGjEVPlOQCqks=;
        b=h2j49waK2BTKEr8/IuWdTfoYMpsC1s+OM59HgObUpqTr5GRr1f/lSnTfouqTbdXSHC
         lix25EGeQgjGO7BdYB/N8ize9ZQwW3Fubp3voOMY8+rNawP2XkIi/+ZJtTT/3ayG04QM
         LxBEArVWDSNVVOOlsi/FuKkni39oH1XO4t3uW38FujZJooROQxCAEgK3PSUQ0WrS3EYk
         UiLrfwMbaiDcNkaeY7IZJsOTUPh3Zjze+NCdoSVv2zFX+c1Qr1mHP0BIvMv7RU+gEd9q
         09kSoDDH30phoMZXclFrD2mwp+5zktUAKisKvA8o+jCz/4oMZ0VVO6n3uDep8mi8klGw
         D/nA==
X-Gm-Message-State: ACgBeo0PdytFLH2FDqHjqd9VARzSdawKoXcjODPjZWHD3GTXJtU6DoSV
        X9+QwGBT+5kWnblyu4bTfEShRQ==
X-Google-Smtp-Source: AA6agR5dy+Gw8ohowBYNiJa6W/b7Gi3/F4l2mDhs2M3US0iGXtl48LOKo978070UI5a03H4IhoIFMQ==
X-Received: by 2002:a05:6512:1096:b0:492:ca89:a38d with SMTP id j22-20020a056512109600b00492ca89a38dmr2868202lfg.152.1661523911767;
        Fri, 26 Aug 2022 07:25:11 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q14-20020ac246ee000000b0048ad80a6d07sm391894lfo.170.2022.08.26.07.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 07:25:11 -0700 (PDT)
Message-ID: <6474b61e-69d8-dbcb-f638-7729ec3dee31@linaro.org>
Date:   Fri, 26 Aug 2022 17:25:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8996: add #clock-cells and XO
 clock to the HDMI PHY node
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
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
In-Reply-To: <20220704161148.814510-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/07/2022 19:11, Dmitry Baryshkov wrote:
> Add #clock-cells property to the HDMI PHY device node to let other nodes
> resolve the hdmipll clock. While we are at it, also add the XO clock to
> the device node.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Bjorn, I'm picking the patches 1,2 into msm-next. Could you please pick 
this patch into your dts-for-6.1?

> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 25d6b26fab60..b72385ffecc6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -1049,9 +1049,13 @@ hdmi_phy: hdmi-phy@9a0600 {
>   					    "hdmi_phy";
>   
>   				clocks = <&mmcc MDSS_AHB_CLK>,
> -					 <&gcc GCC_HDMI_CLKREF_CLK>;
> +					 <&gcc GCC_HDMI_CLKREF_CLK>,
> +					 <&xo_board>;
>   				clock-names = "iface",
> -					      "ref";
> +					      "ref",
> +					      "xo";
> +
> +				#clock-cells = <0>;
>   
>   				status = "disabled";
>   			};

-- 
With best wishes
Dmitry

