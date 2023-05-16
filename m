Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8D727045AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 09:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbjEPHAY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 03:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbjEPHAV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 03:00:21 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A6C46BE
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 00:00:17 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3078cc99232so10353071f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 00:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684220415; x=1686812415;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5j2to6ZOPrMGHT/auJP2FZOL4Y7mEFb4FkOqP9dtJd8=;
        b=kaiOsvXn/l53FZ5PR9bjiqBZcWOc2i39+z+fUZc++U/tHCDdjDoquPqFddCYyz/aNI
         zYqK8DYS5HH9Htf5lCPYF8xMSq2xZmM3iC1fbHal6AWn6XSr88Ifkqt+EGvbbFh2QROT
         D2Bo6bF+z05ne8VKLcSI5fQ6aQUIgMRVz9JGv5qETPREOo7RlZQp2T9c+d8Gdxt7Sotu
         7dp/hOFu0GzYAOqkdP8OyaTQCpsVRmJTXDWbNE7jBApfaNq82BhSI51tUfDg2xVXM3tO
         vRrFe4FLAK9SKZCpAz2/zAtawTqSDgVIEFn0OyOUDGXc3uODOabNl0BIiXRTWzuKF4Kf
         /Pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684220415; x=1686812415;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j2to6ZOPrMGHT/auJP2FZOL4Y7mEFb4FkOqP9dtJd8=;
        b=CjbNuRKIuFojICkRJWOdawcuRWywxD4WRFAScn2diS8Li3lIC4Fj3UKpk/2Vjo0wHd
         rxZZfWtBKDRGavk9U8JEUDWZ20MGSOI9s3o213b5xNm+WE48uqCrqWW37XNg252y52I4
         +awHzVz7oLZch9Uw2Y3Jts89mn7YSAjdN2bH3I7QLx2Tv/PV8vh9lZkv08BolvQ3xEw8
         OXJkRpX5QVN+Kx1RX1BY/Q+GIx7Tw5pWcsFIeSjj16oLm9pKfz1WnJidX0w31Vv1Ka8m
         c6gSwzivWILb4HapUoYnJ4UGA9tUbfUdDCHjE3DSB7sOla+ey1QcnhewTFzW1D+tPqJU
         wM7Q==
X-Gm-Message-State: AC+VfDyBmFLnErFzKtbgI1l4M0p6aRvvRlj6/sSVZPhxRgKSqDHsX9up
        8qbl7QrgFiPaiOBEcQlS/i5Vpw==
X-Google-Smtp-Source: ACHHUZ4YSjhKl8qZ+sZBe/WR6ExqM5d+PUUKyJ5e/JuR+cgf66isu2vmqgLezkLupAIhXYWPx7uMyw==
X-Received: by 2002:adf:e34c:0:b0:309:22ba:dcdf with SMTP id n12-20020adfe34c000000b0030922badcdfmr4077061wrj.32.1684220415569;
        Tue, 16 May 2023 00:00:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8? ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
        by smtp.gmail.com with ESMTPSA id r14-20020a5d494e000000b003063a92bbf5sm1470296wrs.70.2023.05.16.00.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 00:00:15 -0700 (PDT)
Message-ID: <202dd8d6-363d-e73d-8c91-a0bba411de5b@linaro.org>
Date:   Tue, 16 May 2023 09:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: Add missing RPMhPD OPP levels
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230516005306.952821-1-konrad.dybcio@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230516005306.952821-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2023 02:53, Konrad Dybcio wrote:
> We need more granularity for things like the GPU. Add the missing levels.
> 
> This unfortunately requires some re-indexing, resulting in an ugly diff.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 26 +++++++++++++++++++-------
>   1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index b4fc6abf8d8a..d3ac5644232b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -4195,31 +4195,43 @@ rpmhpd_opp_low_svs: opp4 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>   					};
>   
> -					rpmhpd_opp_svs: opp5 {
> +					rpmhpd_opp_low_svs_l1: opp5 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
> +					};
> +
> +					rpmhpd_opp_svs: opp6 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>   					};
>   
> -					rpmhpd_opp_svs_l1: opp6 {
> +					rpmhpd_opp_svs_l0: opp7 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
> +					};
> +
> +					rpmhpd_opp_svs_l1: opp8 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>   					};
>   
> -					rpmhpd_opp_nom: opp7 {
> +					rpmhpd_opp_svs_l2: opp9 {
> +						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
> +					};
> +
> +					rpmhpd_opp_nom: opp10 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
>   					};
>   
> -					rpmhpd_opp_nom_l1: opp8 {
> +					rpmhpd_opp_nom_l1: opp11 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
>   					};
>   
> -					rpmhpd_opp_nom_l2: opp9 {
> +					rpmhpd_opp_nom_l2: opp12 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
>   					};
>   
> -					rpmhpd_opp_turbo: opp10 {
> +					rpmhpd_opp_turbo: opp13 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
>   					};
>   
> -					rpmhpd_opp_turbo_l1: opp11 {
> +					rpmhpd_opp_turbo_l1: opp14 {
>   						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
>   					};
>   				};

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
