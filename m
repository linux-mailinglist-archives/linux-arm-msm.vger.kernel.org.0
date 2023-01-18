Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52031671E9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 14:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbjARN5O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 08:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjARN4m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 08:56:42 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB64E4861B
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:28:56 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id az20so64139867ejc.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 05:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RD9xTazty8qJBzZbHVEhRM4VLCqX49b0BUaP0rESuu8=;
        b=NDe2SWkROcKcgndpiF1eNt00Z6s/d4VujIVKd67GRbqI/s0Xk2yCoQqVF/aBIQSZpx
         4GgXqMUl81N+fiDp5tgNNwLnCCIayU4OHe0PZCz1wFmIKITcSbCYOwq+2xr0QAQNOEGK
         Cf7VDisGo1XyFeYccoSFyYdhcTJw28HHpq/+WvOfPqfJWUHHaYj/sPVL1SvVNfXO+Rxd
         jPSue+V8mWibrk8VvVj1tkGN996FmH8XP4wD4N7QqMOHTtfpik5fQVZ5irRu1NaFqnSa
         91Rl5rexKC2IhDqi0ctuk8GN2UecBt06oHhF5tvp91li02hwgMt8CgDFzKLx/M8m8Xyd
         LoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RD9xTazty8qJBzZbHVEhRM4VLCqX49b0BUaP0rESuu8=;
        b=ffEeoNFmOySO+tRPS5ZO2TgAZNtu5DnpyiIBFch/QfUPhfhCqkMPv9hRm/v21KRpjI
         y6QGs9GCFNqZrC2DojOKfCO1HZlD/MEDwljupaQaqJ+fsJ3mnjB0iL7+Td7R3cMxS+LC
         ytqF3wqNL18k2ETaIlK2z4HT0KvlWX2LWiCtci4Vx3aWjTOMuxZQcgcGhezqcc3ly31s
         IetsreOnv1aNNc8hml4NEuVY4niNYRCnRJLmdROc9Hqv32ckgLyYv4PzrRcUhvlomsq3
         ljNW3saE0h6o1pjLNvAVcVl8p/zd4PaRqNMKMdUU5pZDXTj3IyQGorXC1yWUL7afCSpz
         Ag3A==
X-Gm-Message-State: AFqh2kos7cpJXHSBaAK4vevt5/AyRGO4jKnKS305/ujZcYAYdFYM6CDW
        W+ADC19tlQL6ISVHX59pBqBElw==
X-Google-Smtp-Source: AMrXdXteIuYHa922dSmrroQ8vOH1WU5yVgqFeDtjom3Tw0yZOROGycRDFXEmJbKnIo6JlUiIAlezkQ==
X-Received: by 2002:a17:906:1d41:b0:86e:b750:d0fe with SMTP id o1-20020a1709061d4100b0086eb750d0femr16816944ejh.32.1674048535293;
        Wed, 18 Jan 2023 05:28:55 -0800 (PST)
Received: from [192.168.1.101] (abxh252.neoplus.adsl.tpnet.pl. [83.9.1.252])
        by smtp.gmail.com with ESMTPSA id k11-20020a1709062a4b00b0073022b796a7sm14902509eje.93.2023.01.18.05.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:28:54 -0800 (PST)
Message-ID: <39ba6ed5-f345-6c6a-247f-7b569da94192@linaro.org>
Date:   Wed, 18 Jan 2023 14:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl
 compatibles
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
References: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230118032024.1715857-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18.01.2023 04:20, Dmitry Baryshkov wrote:
> Add the per-SoC (qcom,sm8350-dsi-ctrl) compatible strings to DSI nodes
> to follow the pending DSI bindings changes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 703ba3d81e82..a066566b6ea9 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2883,7 +2883,7 @@ dpu_intf1_out: endpoint {
>  			};
>  
>  			mdss_dsi0: dsi@ae94000 {
> -				compatible = "qcom,mdss-dsi-ctrl";
> +				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae94000 0 0x400>;
>  				reg-names = "dsi_ctrl";
>  
> @@ -2978,7 +2978,7 @@ mdss_dsi0_phy: phy@ae94400 {
>  			};
>  
>  			mdss_dsi1: dsi@ae96000 {
> -				compatible = "qcom,mdss-dsi-ctrl";
> +				compatible = "qcom,sm8350-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae96000 0 0x400>;
>  				reg-names = "dsi_ctrl";
>  
