Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EFFC5681A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 10:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbiGFIe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 04:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbiGFIeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 04:34:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2E5248D0
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 01:34:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id z25so7092598lfr.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 01:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DOaCGCmUeMU+aBCSHaz5vHzoj67y7Rf+nlaYsyBeoq8=;
        b=z8LHDTRNyLRB2QEngm+wtbjbQCoQydyzYiKCTYt/9h74YY2RmE9h8vy75w6JlsoBv9
         Fybkv4fkmpOgQG+RGnmAo0sG4/jH8nHZvoJAcw9K9V3uBtZz2ClgZfjjlGhxbj4xlSav
         F2NuHE4U3KKehL7I90K/ZD4Xo07oqoFMkQFRR6Cqs3ancEmqzsy8SammYTwi9thxhJdz
         TU07c5LYQaxrUHNnMCZO3tgOx7BxPJFXZmS24186BvTNzJQ2NGAO042vUbtuQanLbCru
         RwRXxXYg+bpp7vCPfCKqVbO2bj3cYtbHt7w7vzVylwNXfP3PMnUJ8MqOimffq/qvz1UK
         JRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DOaCGCmUeMU+aBCSHaz5vHzoj67y7Rf+nlaYsyBeoq8=;
        b=d7rjD06D8hZxXB4u4l6i6bZMKcYtWiw5XAicc1Po9eFeF3YBjjLVQbmaP/x9BWQUH6
         p8SusWxLzHYgvM9Hv6tFGLq1OYs9LxrOa6J+vVioFkfXFsB9uaw6FnG2JJl+vwuSimlI
         ODucv8butwoTkKNwqOBcqP6YAsaHymXDs3ibMyungXvp6nTNQbiM6ekz69l76+ynxnhX
         UHoTS7d11p0zvdsMcRRBMevgvLF2A2x4uVLAdMxAW2GzSn0tNUyXImHm/YehrBV/F29U
         ouX3pIGGzQp2/pzs57MaTl66yihaX+ok0Ys4vtbT2jcGl4Dx64pmx0GLAUC1UdNLSGDY
         pMFw==
X-Gm-Message-State: AJIora+5jfye4nI3O47mg8XfH+x4pyG532yjii8bNDbkTeRM81WVVBpU
        iyQ5r+bSEs1K27LKcqY0Nfud/NLzUoZv1Q==
X-Google-Smtp-Source: AGRyM1vFX6iI5mVeOz+sx6ehzIM88D0lyJ45NiC3hlV/lL+DDOdXf5Ex22+0duhZpGUaK7Dpcgcc1g==
X-Received: by 2002:a05:6512:3e06:b0:47f:7928:a578 with SMTP id i6-20020a0565123e0600b0047f7928a578mr24934014lfv.406.1657096458704;
        Wed, 06 Jul 2022 01:34:18 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id d10-20020a0565123d0a00b0048110fd06c4sm5185406lfv.53.2022.07.06.01.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:34:18 -0700 (PDT)
Message-ID: <e81344f6-7da5-a209-2785-d540e41f3958@linaro.org>
Date:   Wed, 6 Jul 2022 10:34:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/13] ARM: dts: qcom: add missing rpm regulators and
 cells for ipq8064
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20220705133917.8405-1-ansuelsmth@gmail.com>
 <20220705133917.8405-4-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705133917.8405-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 15:39, Christian Marangi wrote:
> Add cells definition for rpm node and add missing regulators for the 4
> regulator present on ipq8064. There regulators are controlled by rpm and
> to correctly works gsbi4_i2c require to be NEVER disabled or rpm will
> reject any regulator change request.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Tested-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 36 +++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index 1b4b72723ead..c0b05d2a2d6d 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -844,10 +844,46 @@ rpm: rpm@108000 {
>  			clocks = <&gcc RPM_MSG_RAM_H_CLK>;
>  			clock-names = "ram";
>  
> +			#address-cells = <1>;
> +			#size-cells = <0>;

Why adding these?

> +
>  			rpmcc: clock-controller {
>  				compatible = "qcom,rpmcc-ipq806x", "qcom,rpmcc";
>  				#clock-cells = <1>;
>  			};
> +
> +			smb208_regulators: regulators {
> +				compatible = "qcom,rpm-smb208-regulators";
> +				status = "okay";

Was the node disabled?

> +
> +				smb208_s1a: s1a {
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1150000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +
> +				smb208_s1b: s1b {
> +					regulator-min-microvolt = <1050000>;
> +					regulator-max-microvolt = <1150000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +
> +				smb208_s2a: s2a {
> +					regulator-min-microvolt = < 800000>;
> +					regulator-max-microvolt = <1250000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +
> +				smb208_s2b: s2b {
> +					regulator-min-microvolt = < 800000>;
> +					regulator-max-microvolt = <1250000>;
> +
> +					qcom,switch-mode-frequency = <1200000>;
> +				};
> +			};
>  		};
>  
>  		tcsr: syscon@1a400000 {


Best regards,
Krzysztof
