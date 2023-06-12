Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D619B72B95F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 09:57:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233724AbjFLH5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 03:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjFLH5P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 03:57:15 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B143C00
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 00:56:18 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f64fb05a8aso4668000e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 00:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686556576; x=1689148576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kquzc3qlTRCZjZApwmqUBkPBfjK2pUVfDwW5bPUj/0c=;
        b=W9cAuKDu1LPjU7PkgM5dFgQehbrTQLCHVqxK+IwBhs5T5Pyq6vWt58Z/LKjlQVoCeI
         gSX80E0CqpsRlq06jFWpXz7D1YZo2rhXO/WpC9ZsvJQegAMjcwOuVFn6Ta8CO7IO0m9H
         7wGoViod2i+isz26eVJAWsb+OgmXqcj5uml+8GJiKf3nmlwkR3GchW8ddoczAodneEVd
         4pouQ0CayRTZE6kQW1Ja7u9zHanCntvvxqmsYPHvcghGWudQRVTCQkgBmid4Dnsu2SeC
         Np9KlbslY5UzTwAtYJ5F36hYRXuhpwBDY1AmzhwKgmRj0krOqhTKyWNkcDZqgtbZG3Hu
         1Fig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686556576; x=1689148576;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kquzc3qlTRCZjZApwmqUBkPBfjK2pUVfDwW5bPUj/0c=;
        b=Rua6/8sPGtOsMPks1UHQNbWUqyR2YDeO9CUSWPFQR1KEwAPCn7ylaxCSDqhuDoST4S
         P05YdPwiEEXb0hA9ZYv78UOkntsUxDyRURH8/yNPOiOG6hoZ1xdQix1iy2FwKGhPl5i1
         zSEw7pb/Se8IPpudp5ffu4P3RKNGRS/6g9Ve8OjrOwJiiBytzzsLbF6gj+wSgsY5XkkV
         H/bkQWGRSzu8pQK3lGqEMxTJ6B621RUwR7R37Tpt/CEUvFRtO8i8c1y/DA9CmVOzcbUo
         kqj+RewzP8nSfmYcUGD0JAZdgA68OZp5WKlPab0ZnbVx7OcQKXgo82B/bR/v+7nong+O
         CErQ==
X-Gm-Message-State: AC+VfDxwBs/gsENboIsbeXkJ7CuRPO9W92bpoF302bo7NMRf9Ptp6oxr
        vX8LbHOpTbOIOA1yCNMwHnDsQg==
X-Google-Smtp-Source: ACHHUZ4LajqgjCVykBXWLrpuF1sWTtf/Q6zXc8EiQ34mVNavWWRdpwJRbI3MD4JI4nRpWnjuSGnv0w==
X-Received: by 2002:ac2:4ad9:0:b0:4e9:a3b7:2360 with SMTP id m25-20020ac24ad9000000b004e9a3b72360mr3726384lfp.8.1686556575827;
        Mon, 12 Jun 2023 00:56:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id m16-20020ac24250000000b004f62c178d47sm1378581lfl.201.2023.06.12.00.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 00:56:15 -0700 (PDT)
Message-ID: <83330f1a-f116-2a2c-f5ce-75f32c4bb5f3@linaro.org>
Date:   Mon, 12 Jun 2023 09:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: use proper DSI PHY compatible
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Degdag Mohamed <degdagmohamed@gmail.com>
References: <20230612031623.3620155-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230612031623.3620155-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.06.2023 05:16, Dmitry Baryshkov wrote:
> The DSI PHY on the Qualcomm SM8150 platform requires platform-specific
> handling. Use the proper SoC-specific compatible string for the DSI
> PHYs.
> 
> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
> Fixes: 2ef3bb17c45c ("arm64: dts: qcom: sm8150: Add DISPCC node")
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index 197c016aaeba..95d361443dff 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -3832,7 +3832,7 @@ opp-358000000 {
>  			};
>  
>  			mdss_dsi0_phy: phy@ae94400 {
> -				compatible = "qcom,dsi-phy-7nm";
> +				compatible = "qcom,dsi-phy-7nm-8150";
>  				reg = <0 0x0ae94400 0 0x200>,
>  				      <0 0x0ae94600 0 0x280>,
>  				      <0 0x0ae94900 0 0x260>;
> @@ -3906,7 +3906,7 @@ mdss_dsi1_out: endpoint {
>  			};
>  
>  			mdss_dsi1_phy: phy@ae96400 {
> -				compatible = "qcom,dsi-phy-7nm";
> +				compatible = "qcom,dsi-phy-7nm-8150";
>  				reg = <0 0x0ae96400 0 0x200>,
>  				      <0 0x0ae96600 0 0x280>,
>  				      <0 0x0ae96900 0 0x260>;
