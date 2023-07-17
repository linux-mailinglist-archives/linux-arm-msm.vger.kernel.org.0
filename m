Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9931C7562BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 14:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229917AbjGQMam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 08:30:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjGQMal (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 08:30:41 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77BE187
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 05:30:39 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b73564e98dso65318751fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 05:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689597038; x=1692189038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gqQWmYE6mikijhb+URcDev0GUwlO46fou+/8hKL8alM=;
        b=mWgM8gyI1LxJ1jt6p/Q+x1NKUulK53177cNhF7OyRsJsz7I93+gwnms4okO/iXydlR
         rTvVNgxyxjBasNNzXg9KcSj21F5063ezsBs5U0OS8gU+stxomq2U81zCOUiSjPGBOPEo
         ZrLAiSfXQlJEuVxwIC4ByBiE0pEabcdybjTcl9ITBpHF6NR02eFUUhhS6q3fcDBP5nEc
         x2ocG2P47WWDNEHD5I9l7JxKMx1zKTzhtLv1gD8Hi/5HBTl/aNL3eDr14Dc1PnvSlvwT
         vvmRM0aLSM2bQsqbMw3m0if2rsV/vJAGYKrPPjpj57qToM/gvKyKFhc2qp0MsPP7eWh5
         aYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689597038; x=1692189038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gqQWmYE6mikijhb+URcDev0GUwlO46fou+/8hKL8alM=;
        b=LSy1szuoT+rUrU+rmCqzeFDK+ozy7WiVfRw2Ok8/0ihqGVfhr7aM0OtUCWoqPxknhH
         oufNuuAPXNWEEPzfcMj2rIh3tDNApzdgLW/KedEk4BxkiBTNdNSoA8Pz9pOhgW367RDm
         xvWBn7k2QgsTulRsFE/hPas4fe6vg8MUz4GcHz22jFZjaufubMYH4serUdby05Ujcd4P
         lgaO5ws2AJX4DSNIlj5kZSa1f6gT7ceuKnj2TRVeoQ0kgmg5duC2Y0Gb4vvTGyfwBbRB
         mwPWJQhKW+aADqjVV88MXltQPSGLe8jIC1/ip0n0fNk+0B8F/uhzZs3EoiKybEW+fmYe
         wP8w==
X-Gm-Message-State: ABy/qLYJ0xkIRflK6OskpiILRTDl5g+dpFoeD/6wq3WTWEpIV6jpFT7H
        SNiZoJFpmqZi91pyHDq9gM/Qlg==
X-Google-Smtp-Source: APBJJlGDlL4uhDaQA6bjvwYThu/no32RAotlFuO5WDtVQINe1DbwFu1bJcmSSoEmuJ0ncS3RJ93q0w==
X-Received: by 2002:a2e:978d:0:b0:2b6:df5d:8e08 with SMTP id y13-20020a2e978d000000b002b6df5d8e08mr8104203lji.28.1689597037933;
        Mon, 17 Jul 2023 05:30:37 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id a26-20020a2e861a000000b002b6c9927a3csm3649783lji.37.2023.07.17.05.30.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 05:30:37 -0700 (PDT)
Message-ID: <f7fa82e3-ee2e-da05-f635-ba93819790ce@linaro.org>
Date:   Mon, 17 Jul 2023 14:30:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-samsung-e2015: Add
 accelerometer
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230715204128.12612-1-linmengbo0689@protonmail.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230715204128.12612-1-linmengbo0689@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.07.2023 22:41, Lin, Meng-Bo wrote:
> E5, E7 and Grand Max have ST LIS2HH12 accelerometer.
> Add support for it.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
> ---
Potentially missing Co-Developed-by?

>  .../qcom/msm8916-samsung-e2015-common.dtsi    | 21 +++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
> index 0cdd6af7817f..ef7c7ac40e05 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi
> @@ -42,10 +42,27 @@ reg_touch_key: regulator-touch-key {
>  
>  &blsp_i2c2 {
>  	/* lis2hh12 accelerometer instead of BMC150 */
> -	status = "disabled";
> -
>  	/delete-node/ accelerometer@10;
>  	/delete-node/ magnetometer@12;
> +
> +	accelerometer@1d {
> +		compatible = "st,lis2hh12";
> +		reg = <0x1d>;
> +
> +		interrupt-parent = <&msmgpio>;
> +		interrupts = <115 IRQ_TYPE_LEVEL_HIGH>;
interrupts-extended = <&msmgpio 115 IRQ_TYPE_LEVEL_HIGH>;

Konrad
> +
> +		vdd-supply = <&pm8916_l5>;
> +		vddio-supply = <&pm8916_l5>;
> +
> +		st,drdy-int-pin = <1>;
> +		mount-matrix = "1", "0", "0",
> +			       "0", "-1", "0",
> +			       "0", "0", "1";
> +
> +		pinctrl-0 = <&accel_int_default>;
> +		pinctrl-names = "default";
> +	};
>  };
>  
>  &reg_motor_vdd {
