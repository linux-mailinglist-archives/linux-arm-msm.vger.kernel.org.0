Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 392B95F3375
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbiJCQYj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiJCQYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:24:24 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50EBB356F8
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:24:23 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso9366856wma.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=07OPIF9p/0dyGR77WhVTYHBUfhX2GRpcCkHlEnGMyI0=;
        b=nYazcJMwn+dgWLdKSQAYRF09/D5m4zVxIGGe6Y2xD2iRcHoHRTgxXOU29ScW+56sUP
         KjJ+4U1soSXWJKDYo0Lf2Alxlnz3dzQ6MZGnbxNECGGXYh8QTFesC4E2d0NvuZu9u7uf
         iEgbDmJOOsCduVh1OFYbEGChFMZCZrYbdiApxNL02CU1jUn34ro2W2PlIEm0AYuiy+qd
         0p9LB96kG32mfg4BAes5567UXgP3vv73ijJ1EJ68Lbaey09dO2iZnUKmY3o7UzvOpwyA
         usRHQzk12gKPkx1/xlihK9ZMgV/km2jvAE3fBSEKZfl+wfX/rta3uPyG+CNLIjVT/SpI
         lgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=07OPIF9p/0dyGR77WhVTYHBUfhX2GRpcCkHlEnGMyI0=;
        b=GM8D4+sbD2hUqgULDUey8bvlcxZmKxwOpQOyg3JgCx8FSvYUEVAO/p57pXEE/dvOyc
         WPSaMA+NB3sfujgazpT/B3bdI/DfwxNbW2XupaWMbqTZeXMpU6ACpHLQin1zIZiN5uhH
         fD78Mafew1iGx0AbrGKs3oiiN6JnUsFY0H318KPEeT2rVNtjS/F8FtBaExdZNlG3N3Pe
         UzwAwGZmdRX0Lxx2oSNIOEVPyd7cjuKS6Fjmxjlznfq8Cvpc0FZ3T+nbZjrfbYSGlLha
         GTqX7DpTgCyNZ485E7nUtqXDeyGrQneKmBeUbJTCXPDUidKkQ/YrBP2oeoNb1PWMZdfe
         vn+w==
X-Gm-Message-State: ACrzQf0kGT9O6U9z7w1juKZWbWMLhilVvE/dF7XE3aLH9WepyJfmiO4x
        5ru1FbcaJE2QMZO20/5NC0ru7g==
X-Google-Smtp-Source: AMsMyM4TrrrLhqF9RQPaC/KmMa0COV1ldeyIspCZUczkTKf2hFU61OWp3OZC5EbMtBtKzo0XW2iGMg==
X-Received: by 2002:a05:600c:4a9a:b0:3b4:78ab:bae5 with SMTP id b26-20020a05600c4a9a00b003b478abbae5mr7710742wmp.114.1664814261498;
        Mon, 03 Oct 2022 09:24:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id l6-20020a5d5606000000b00228d52b935asm10550792wrv.71.2022.10.03.09.24.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:24:21 -0700 (PDT)
Message-ID: <d6a09c3d-b78f-a626-f9fe-d255a89fc83c@linaro.org>
Date:   Mon, 3 Oct 2022 18:24:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 14/23] ARM: dts: qcom: apq8064: drop qcom, prefix from
 SSBI node name
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-15-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-15-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
> index 6a8f3fd0fcc3..be4c82945c53 100644
> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
> @@ -693,7 +693,7 @@ pm8821_mpps: mpps@50 {
>   			};
>   		};
>   
> -		qcom,ssbi@500000 {
> +		ssbi@500000 {
>   			compatible = "qcom,ssbi";
>   			reg = <0x00500000 0x1000>;
>   			qcom,controller-type = "pmic-arbiter";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
