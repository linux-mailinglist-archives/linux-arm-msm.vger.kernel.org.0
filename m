Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0946160EB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 11:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbiKBKgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 06:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbiKBKf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 06:35:59 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C3DF28E28
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 03:35:58 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id k8so23889185wrh.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 03:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3WN2/5AaNk+i0YYkEzvn8N4BOdZE93Oe6unMv5mkyOU=;
        b=jvLYK6Dt4eW91AkvFHt+84p5Z2MUSxc+BbjNQabLU8ci2XT9bkpvCMqV+zIIF7ns+l
         WjrityVVBGHnEYKjB3wG43Rg3059J36FLr9J8zMjmR9yER8usjtl3BbARqcIOoTLS2qB
         zxpisWaPjDLYINEem1uJDCZWPzEUtlNHf/7Df9sxYrh7IEbWUJ0rdtMCWrPIiVT6NqV2
         I5CLDCvg/1IEUV7LQaSwwQvIjZX1hoOJBcFG4tKXhEZeZFOlku+vDr2fHA9JcjCOuJrd
         wtHBjHczx8usmhW7dkYRBOPfxbSD8fNQcvU2rAlxQZNQ2Jv9TxthrzQ3DQeihWWlLpcp
         efDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WN2/5AaNk+i0YYkEzvn8N4BOdZE93Oe6unMv5mkyOU=;
        b=R3hOBUf81r6eeUTvax5xDU0jjDQF+CAJ9O3xfyWsJ9/MWtBAneu1j5KlLaFYVNFk4I
         vyacK9yJRXgp7rNk1GGfk+Fko2oAejRf0O3dgYzujT0U0f3+YnOYQWVxKFGa4TW4EAem
         89bFqZ4wr+W4aiNTHLyZhPk9ZEXLi8bZYTLlCGARsahwwR6LV2gJj4NYQMKscYvMfm7b
         0IWKjPVB5ZUpbSBpRdgoWDVP3tGUuF3gaJIK1HPVHaHwd10NLxlx8c8qNfp4HKQN6tCo
         zRc+B5591lZctnDobP69DybmCv4JphfHUio32I/GOravbbr/rhxfDzmutfw8oVJ3YTmN
         HIOQ==
X-Gm-Message-State: ACrzQf2e6Ayub6vYRHbhIaA2ROREpfXqxVcaWu1Wdi2h7OQb0wZ35Q5v
        PgBcoA0zFsvg4rUx35CS+nH4Qg==
X-Google-Smtp-Source: AMsMyM7gPopMof47P8nmrYO4pB+S8LtMJ315l/aSLQQsfwpEdBr5ni7fqTtE2+eXRc1qHZbtSKwV+w==
X-Received: by 2002:a5d:4c8c:0:b0:236:a834:8e8e with SMTP id z12-20020a5d4c8c000000b00236a8348e8emr14465616wrs.644.1667385357078;
        Wed, 02 Nov 2022 03:35:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4? ([2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4])
        by smtp.gmail.com with ESMTPSA id q8-20020a05600c46c800b003c6b874a0dfsm1828015wmo.14.2022.11.02.03.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 03:35:56 -0700 (PDT)
Message-ID: <028adb9d-e8e7-33db-2aae-028a809a061a@linaro.org>
Date:   Wed, 2 Nov 2022 11:35:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 2/3] bindings: pm8941-misc: rename misc node name
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221031175717.942237-1-luca@z3ntu.xyz>
 <20221031175717.942237-2-luca@z3ntu.xyz>
Content-Language: en-US
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221031175717.942237-2-luca@z3ntu.xyz>
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

Hi,
On 31/10/2022 18:57, Luca Weiss wrote:
> The spmi-pmic bindings is now using usb-detect@ for this node, so adjust
> the example to match.

Subject should be:
dt-bindings: pm8941-misc: rename misc node name
instead of:
bindings: pm8941-misc: rename misc node name

> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> index 6a9c96f0352a..fbda899fd260 100644
> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> @@ -49,7 +49,7 @@ examples:
>               interrupt-controller;
>               #interrupt-cells = <4>;
>   
> -            usb_id: misc@900 {
> +            usb_id: usb-detect@900 {
>                       compatible = "qcom,pm8941-misc";
>                       reg = <0x900>;
>                       interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;

With subject fixed:

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
