Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9301C61610C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 11:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiKBKkF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 06:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbiKBKj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 06:39:29 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EABD29C97
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 03:38:50 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id bs21so23892303wrb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 03:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ESVIl7kj46BPvNO9QdqByWm3nJ2rwuYRwjFwZ3R2h+Q=;
        b=M1ZiwSaFsisrWHJ/y3ZoFTMvhmDaGS2CyB1NDRK/f/sFj5Qm4JT/ljSt9ppTtEoLQB
         4NKeDJgDRWXkFZLWdnhGoeYfRHnX6/3YIEMKXN9PHLA2J05q5OW7Grc2JN+XI8juEViU
         qLNPJLvfjDdkC8JUMucupxlj42krS61LxT7W0lWE8I58GBcJz9gsY4rMmQd6+B7V6ah1
         7mMFsYxX7u5sV+MnpFoEHYyArBEHqOA/jObL0zPajuuT7S9xkfg988IG0aykJ7UNWgJx
         Q3d6lP76i9AE8Ggutj1n8qCuP0T/rsqR6YJkLOsh9vfXJ0hC9lwVVYt8gZS9cZaFJzHc
         L62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESVIl7kj46BPvNO9QdqByWm3nJ2rwuYRwjFwZ3R2h+Q=;
        b=punXz53Hpl5hQK+E44f6TiL/nAl4q/2n/a8AVMQI5P3KgrC0n8PIjNYU0mXrM3e/VW
         oSxXzd3n2IvbpPxACJ8KHuHScLZBtkM+d3e9xjSvh13k1XSOe+g8CrC7XIjcPa+YwFfG
         iRcksidZNx1LjBaqLqgSX8XVztHjVDb8bj5W2DhcSe0djwSv2EADSEjpglJ7a6jMLxB+
         +ijJmICj1vcJEYHNE4bNY/g3pUQLPqiUjW7X30KuJ7wdALYoSW+BPsUlEqolcMxq3YtL
         kE29mREEKHCFEtDPhPsITPXiUjZKfU8MgksTANTZqM/smfjDQC6kTwJcHF+Narrpo3b/
         K7wA==
X-Gm-Message-State: ACrzQf0QpJVl93yk9fxaaQCqFRapJfWNvmfaYBPdbVspm08U0SXXRw+p
        T4AQjkqbfy8aMiK1oDCinAuLFg==
X-Google-Smtp-Source: AMsMyM50o5tIKkNMewp4JlUDoNpxXY/QOQgV3dKFQsAxXK8d4i+5IU2V63sqmG+TL7AeanS03YlI9w==
X-Received: by 2002:a05:6000:18a2:b0:22e:72fd:c5d0 with SMTP id b2-20020a05600018a200b0022e72fdc5d0mr14579385wri.682.1667385528704;
        Wed, 02 Nov 2022 03:38:48 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4? ([2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4])
        by smtp.gmail.com with ESMTPSA id t9-20020a05600c198900b003c701c12a17sm1868001wmq.12.2022.11.02.03.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:38:48 -0700 (PDT)
Message-ID: <f2dd0188-29dc-f651-5712-8d84804ebd58@linaro.org>
Date:   Wed, 2 Nov 2022 11:38:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: pm8150b: change vbus-regulator
 node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221031173933.936147-1-luca@z3ntu.xyz>
 <20221031173933.936147-3-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221031173933.936147-3-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 31/10/2022 18:39, Luca Weiss wrote:
> Use the node name as now defined in the spmi-pmic bindings.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
> Changes in v2:
> * New patch
> 
>   arch/arm64/boot/dts/qcom/pm8150b.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> index cdded791d96e..66752cc063d6 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
> @@ -53,7 +53,7 @@ pon@800 {
>   			status = "disabled";
>   		};
>   
> -		pm8150b_vbus: dcdc@1100 {
> +		pm8150b_vbus: usb-vbus-regulator@1100 {
>   			compatible = "qcom,pm8150b-vbus-reg";
>   			status = "disabled";
>   			reg = <0x1100>;


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
