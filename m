Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C20155B4CAB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Sep 2022 10:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbiIKIko (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Sep 2022 04:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiIKIkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Sep 2022 04:40:43 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37EA32A94B
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 01:40:39 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a14so5051401ljj.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Sep 2022 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=V+Le/YSkQ8+3TteeDGCOhE/pejGYjfJaEoVSBNCqz4Y=;
        b=IJvAZkqUTOTg/DeJ5n1gQ6AgsXXjavZJ2S7vv1Hj6cWc4tPoqpnFWKL2ZniPAnNYZ6
         PWh76WBqfWW4i8XDYkEYKOQ5QUg3VYMptoXj5SqRi003Cm8qmVNIXHR1+T6tcMnJum80
         CyxYu3a4gVsBn57Xugsg+NafUqWeUyZlzzKbZ9KtMBBcI9hn5x8XeV1a9iQOIlWg/qxT
         dnswEBZqXqJQDvWlaeAiueiL9zt98+zjW47BWoRjJNsCcVLZp4yzTfh+F2yYtMTuRwxg
         mrgHBc/VdYLJjf9wXFHSWzzKANOKA44XbXUX8VqwEKu/5eMyMAP3RxgKytElL0P3GHAs
         2E2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=V+Le/YSkQ8+3TteeDGCOhE/pejGYjfJaEoVSBNCqz4Y=;
        b=ERv9+tpuMZSV2pedSucIFBnFJpDlOPMxrK4CwfSLpnte8lZguD8Q3MN0Vi364KosTI
         xfwgsgyL1+rIUj0xOlGiLCAgJi+DZfvjVcSng+TqJkZwtM6Jj0W0LL5ynQ8OEv8/PDL7
         RNX4EYsxbIJEydP8o9cQKcvl+krmstEfpIn+ZGMzkHj5EobTKSIc4uX4zHZFFWm50kKL
         +MrLCdlnXXlLUi9GB55gUtds3U5r9fLLTrmLgfKwxhrJbQ7hhi71XWMtDHG5Oxl8lEb6
         ya0AcSbAxDFSd/mrZwwUQcVqiZGRrz4DarZ4uYDq/UEAeiI+YerYCXY12MNjpuFsQJCw
         c0HQ==
X-Gm-Message-State: ACgBeo2Dr9bwVrNbjTZwrmw7amOVmI5+AJzaiUsw/1KrqXh0dcaxwRlx
        E1PDr0AarleTG+BWc49P8TQa+A==
X-Google-Smtp-Source: AA6agR5c7IKaJ3K/mwiKKqzV6QjEJagepk/cQT99gJ1/4ZMuQbOj9uaGxorWT0m/YhR9zOMAU91LCw==
X-Received: by 2002:a2e:96c4:0:b0:26a:cfca:532d with SMTP id d4-20020a2e96c4000000b0026acfca532dmr5540202ljj.410.1662885637515;
        Sun, 11 Sep 2022 01:40:37 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c4-20020a05651221a400b00496693860dcsm532684lft.232.2022.09.11.01.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Sep 2022 01:40:36 -0700 (PDT)
Message-ID: <d51b0a89-a151-dd5b-b026-4291031fe1ea@linaro.org>
Date:   Sun, 11 Sep 2022 10:40:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 7/9] arm64: dts: qcom: sm6115: Add basic soc dtsi
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org
References: <20220910143213.477261-1-iskren.chernev@gmail.com>
 <20220910143213.477261-8-iskren.chernev@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220910143213.477261-8-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/09/2022 16:32, Iskren Chernev wrote:
> Add support for Qualcomm SM6115 SoC. This includes:
> - GCC
> - Pinctrl
> - RPM (CC+PD)
> - USB
> - MMC
> - UFS
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
> pending issues with dtschema:
> - for some reason, using pinctrl phandles (in mmc) breaks the pinctrl
>   schema (4 times)
>       .output/arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: pinctrl@500000: sdc1-on-state: 'oneOf' conditional failed, one must be fixed:
>             'pins' is a required property
>             'clk', 'cmd', 'data', 'rclk' do not match any of the regexes: 'pinctrl-[0-9]+'
>             [[26]] is not of type 'object'
>             From schema: /home/iskren/src/pmos/linux-postmarketos/Documentation/devicetree/bindings/pinctrl/qcom,sm6115-pinctrl.yaml

It's the same as 06367559766b7c9bd96d2baef8bfc5a9bb451e25. I propose to
fix it the same way. I can do a biger change for all pinctrls, so here
you would need to add "-pins" prefix to entries (see patch
4fcdaf4b0320f93d0ccb4d36b795ed258fb07b27).



Best regards,
Krzysztof
