Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B1D635FC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 14:33:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238394AbiKWNcu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 08:32:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238833AbiKWNcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 08:32:12 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F4746F37F
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 05:17:03 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id c1so28101784lfi.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 05:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9rrWiHxgy8XL4EMhVPJm4PXUcc5P4DC16VghLNpNvqc=;
        b=Szj6IJnVYD6/7h8/2+rn3OkkE6gMACGs65XIdv7bNYNGKsGU5q7Us/Uq7gdSb9ly1G
         yUlhPNVMz6Jqo8Yy5gy5XqTa9MdZy9guSkgl/F1M7lVObURlfoB6Gf2pzeztXiuRwVlu
         JqYlA1NWxo7mokcqBBNnjGN9lF8NJHWV0+52J3O7HoD1WEeLSPnIbBRAExSJr+FEOJx2
         S0l6yeBGx6sZg4BB+WTqhbdAXpWE4xxBBDDQHRS0qUEZvnyLwUgLaX79U6WYdduy9yEC
         rzhbGlJSyWEUw2D2dVast+4HSJf/B5S9MxVeqgGIYzSrlYTjUgEbrP4yW9kEWnfOBWJe
         ewtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rrWiHxgy8XL4EMhVPJm4PXUcc5P4DC16VghLNpNvqc=;
        b=NMW0y23ScdlNpPAy3aSSoKHDsncepwUFG+YS1uIgeJWx8dJh3adnsU/PhTDwjHx674
         5RCKZdObnJeh3yzY1Gq/Z6ylAPyV4hlFJ0nnvwXwi2WAS5HpooVwjqbZxwbg9c6QmAWR
         K6gx16PaD/WJl4dZe4hZSAhJpi80ZjXJZf/r0KXGohcph2ZnWJ2SvVeJuqn/a7BvPLum
         z10Yr7kXuU+emkmJe0+xGrxNcZcR4GhxOASfEswPcw8lJ4TdSHieGPSNGJgULAd5sSZw
         ZCn2NIUqP6ruSioz3UNDVk34MJFfLJSuj8PHY8zX9sY4oP8VfqQK7wcFfC6tHearMqdM
         h8qg==
X-Gm-Message-State: ANoB5pmTcpEvUaT+qnDzuHPu7/TVCf4sY0uSGlyISZD5yF9gFSyW9sh+
        M+dO0xKtLGlRmggErnKk6K0Z1w==
X-Google-Smtp-Source: AA0mqf7DLaDOx9/kIucgdP9wbuyY2ZzDY+IE1nEku1WaomgQSO+mpoC14e1nZTanImk+XPkpSwW5lg==
X-Received: by 2002:ac2:4c50:0:b0:4b1:8a90:6524 with SMTP id o16-20020ac24c50000000b004b18a906524mr8783922lfk.628.1669209421365;
        Wed, 23 Nov 2022 05:17:01 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id u14-20020ac258ce000000b00499d70c0310sm2888258lfo.3.2022.11.23.05.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:17:00 -0800 (PST)
Message-ID: <afa7567f-e86e-639b-92b7-efae505b55f1@linaro.org>
Date:   Wed, 23 Nov 2022 14:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: sm8450-hdk: enable display
 hardware
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
References: <20221122233659.3308175-1-dmitry.baryshkov@linaro.org>
 <20221122233659.3308175-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221122233659.3308175-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 23.11.2022 00:36, Dmitry Baryshkov wrote:
> Enable MDSS/DPU/DSI0 on SM8450-HDK device. Note, there is no panel
> configuration (yet).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 2dd4f8c8f931..75b7aecb7d8e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -349,6 +349,28 @@ vreg_l7e_2p8: ldo7 {
>  	};
>  };
>  
> +&dispcc {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l6b_1p2>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5b_0p88>;
> +	status = "okay";
> +};
> +
> +&mdss_mdp {
> +	status = "okay";
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  	max-link-speed = <2>;
