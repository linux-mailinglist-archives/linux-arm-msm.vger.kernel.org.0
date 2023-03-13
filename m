Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E083D6B719D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 09:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbjCMIv4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 04:51:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjCMIvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 04:51:14 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EA99EC8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:49:27 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z5so11766746ljc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 01:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678697363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=I5ZMNZCrruihlPgWnzPscl3vtoNWikyghd/e3GwVD90=;
        b=u277/x4CALiOzZ41tXMWpbtO/WObG5lRXO+DftvasXs5NJefWo8bGctVxgdsCKKVJB
         pqmRaWPdCATJ2R3UvUr7/YhIj9b8CpW8UG/+Agzy/ZVUZis9d0eHfK9NuvNSBW/vw8U/
         cQ/WEFaTwkmplUcdeEtsxv6xegNXBWFaZF1EnkphmGrtlDq9+acdMhpfdfADMk6vQ+oL
         j2/wO0zEZxCxgzpMNxpAaMKhAuBLyw4D/4Mf/eZP6FzxqJ5twsbU9bfnGy+8o2ufwlTa
         7hhvKNqRa6Wwc8xex9FFuAWw+amfKSTjj58Tl1CoKwh99/1yI2GqJp9mpvhFR5ggzgrT
         s81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697363;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5ZMNZCrruihlPgWnzPscl3vtoNWikyghd/e3GwVD90=;
        b=vIg3lYdYKQUuQdGBLh6VzPvGh0hFipF8zvDPwQGjtMzrnkI3GQ34OkimtDbFTLLahZ
         Mo8KpjKu1SqD3PYR4NlUeXEFlpJ8YU631zVU6Wx2NS23C7Ocu+Rbbp9JCIiUuW49R6Xp
         eSJE9pVTqlO7+BUnHZfyx0tGGEoyTX7yyBWyhwBjYJVYvNxBG2wzAtg8U3flo0f9usSq
         OL6DEqkmhEH1zY4q89wCciT+Nz5V1DSQDba74gOr7LgYSNz9dIsvWNcfh3SC50bTG6Um
         Ql7Lmz4TXAGSUwTDqZMt+ciM2OjwVuM9JfNjQOBD98sgrVdJbQhYQMwz6Y60EuR+swyr
         ht9w==
X-Gm-Message-State: AO0yUKVDH+suob6tQkqzEWxe/2gb5TcE/2akfqqADNmCpV960Z2sTmAk
        BR+q3WI0Hc4fRLcHjySd4OgPHg==
X-Google-Smtp-Source: AK7set8Uz17jE+SAAy6tly+2mQG/CkmxqSpe2bf6YkI82O4xoRDnV05hOwHXDqeH+ryMV2LwFtn/WA==
X-Received: by 2002:a05:651c:115:b0:294:7427:4ec4 with SMTP id a21-20020a05651c011500b0029474274ec4mr9738231ljb.41.1678697363289;
        Mon, 13 Mar 2023 01:49:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id c3-20020a2e9d83000000b0029352fc39fbsm904924ljj.63.2023.03.13.01.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 01:49:22 -0700 (PDT)
Message-ID: <951d238b-731f-7e55-72fb-88b4c5a60408@linaro.org>
Date:   Mon, 13 Mar 2023 09:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sc7180-trogdor-lazor: correct
 trackpad supply
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org>
 <20230312183622.460488-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230312183622.460488-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 12.03.2023 19:36, Krzysztof Kozlowski wrote:
> The hid-over-i2c takes VDD, not VCC supply.  Fix copy-pasta from other
> boards which use elan,ekth3000 with valid VCC:
> 
>   sc7180-trogdor-lazor-limozeen-nots-r4.dtb: trackpad@2c: 'vcc-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fixes: 2c26adb8dbab ("arm64: dts: qcom: Add sc7180-lazor-limozeen skus")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
> index 850776c5323d..70d5a7aa8873 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
> @@ -26,7 +26,7 @@ trackpad: trackpad@2c {
>  		interrupt-parent = <&tlmm>;
>  		interrupts = <58 IRQ_TYPE_EDGE_FALLING>;
>  
> -		vcc-supply = <&pp3300_fp_tp>;
> +		vdd-supply = <&pp3300_fp_tp>;
>  		hid-descr-addr = <0x20>;
>  
>  		wakeup-source;
