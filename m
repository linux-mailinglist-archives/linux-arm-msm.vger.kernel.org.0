Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3549F5E9BD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 10:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbiIZITp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 04:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233137AbiIZITn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 04:19:43 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8A7A45C
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:19:41 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id iv17so3925761wmb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=jKQIIfv2SW4ou+kZFFsY1IMYg5mAOYRQt6YkKfTElQc=;
        b=hzu6+mpr5ZSXCUGWDhOrCiA/RBD+DXSpHdsd8IElxDjzrXFdb3sr8oFx8ARIvmEnU8
         9Yinz7wN9grihuTOp1JZ/qKreV/y5zG20wh6Qkmo8ZLwHJm1RJQkRz00VZ6cVA+uod6S
         LtRMwurY8TVYUc9KSZUs+NosyBOK/1uf8kYSmx7cN90vCWQ6UoByAwWRw6ZISYyfE0KG
         t4/AYgL5Bd1KBtAcOn4wylwUPsTlE5yYpUK6vgERQ0D52zyNb7Kx6HtEaGjpmWiT4O+S
         4skgGauyUl9wAKzx3oCjkfNONXIltgHLrn9T8pzkgAI+cQh2kDaBSHy5nAqW+tMimkCv
         CKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=jKQIIfv2SW4ou+kZFFsY1IMYg5mAOYRQt6YkKfTElQc=;
        b=U98qDLc7zRFQKrXsB0g5uPMpkxekjor6L08Rdmk5U72oVO1msc70Pif3rfvzkSu2ia
         VwhlsJrqV4rNqrxdXSDtdbsy5t3FEroY2D5B+nJEnbILqKlg0Wol2R/7C9bnuA3DnmVJ
         x5aucGE25s/5G/s9jqgxD2v748JwTfo2TcBAkVzy0dMQaJPDp/GezwO8AVQaBMV4/+Kt
         ynYWEpdBKgPswgL2rZHCKeKCMaycoOJVwSDsMFRfmynmpQeB9pzCH2HIfdI50ls4vyXX
         yXP1gfdv6pqFkUxcLrV1s9LmzqdjZTvnN+2w8zenUo8l12Vy9atPztYZhmlucE5LgpRv
         jwKg==
X-Gm-Message-State: ACrzQf256FBhrvUeydsKfgAGDl73yaA82tK9FyHiusY96RY6Xsa44SoK
        s8CC7L9uPRcydAUn0qeCepnfhfz+5f47DWVG
X-Google-Smtp-Source: AMsMyM5a2SkwBGXm2LWW0e7JAvd4yKtan0bGn2F204UAj1PUgOIhbzsX8e7mgfY9oj1t+aeGqTbWdw==
X-Received: by 2002:a7b:c056:0:b0:3b4:e007:2050 with SMTP id u22-20020a7bc056000000b003b4e0072050mr21229837wmc.38.1664180380142;
        Mon, 26 Sep 2022 01:19:40 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d4a49000000b0022a3a887ceasm8776476wrs.49.2022.09.26.01.19.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:19:39 -0700 (PDT)
Message-ID: <07e63329-b3b7-736e-1de3-625af5c4541f@linaro.org>
Date:   Mon, 26 Sep 2022 10:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ARM: dts: qcom: pmx65: use node name "gpio" for spmi-gpio
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925190622.111505-1-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925190622.111505-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/09/2022 21:06, Luca Weiss wrote:
> All other usages of qcom,spmi-gpio use the gpio@ node name, and this is
> also validated by the dt binding check. Fix it.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-pmx65.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-pmx65.dtsi b/arch/arm/boot/dts/qcom-pmx65.dtsi
> index abf229a8b75a..1c7fdf59c1f5 100644
> --- a/arch/arm/boot/dts/qcom-pmx65.dtsi
> +++ b/arch/arm/boot/dts/qcom-pmx65.dtsi
> @@ -20,7 +20,7 @@ pmx65_temp: temp-alarm@a00 {
>   			#thermal-sensor-cells = <0>;
>   		};
>   
> -		pmx65_gpios: pinctrl@8800 {
> +		pmx65_gpios: gpio@8800 {
>   			compatible = "qcom,pmx65-gpio", "qcom,spmi-gpio";
>   			reg = <0x8800>;
>   			gpio-controller;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
