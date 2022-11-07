Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37F061EFDF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 11:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbiKGKCs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 05:02:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231355AbiKGKCq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 05:02:46 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4D7186D2
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 02:02:45 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id f7so16666308edc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gAFEt9n72l1TbZh7patpk5N+v5IMCUKiiANHEz64Vv0=;
        b=ftdcatyrH6eSLKqBzW2SsZxiAxEkjIvIs3tnecFy9tUSWUksla5LB7tXZwXeDoJeD5
         D/kxLfxX9Or7Pf0N1gEvorsQIl0uOYx6G8PlEn128PXGt15GjL3haz5O0iMhs0EBwDHL
         TVrvrDlFha4zGw7seb2jcmBRBXP+q2ZQrX88tsOCutoV7BxQOHwjQJM7QWHpDQgMR52B
         IkUqw0ezkgLO+WQ1PyMEbc8E61o3usPXFgpYSnI+uwiz4I97mhZ0QWN2d8LR9074U+zG
         R7y+rF1UjZybPwJx97VQs8du+p63dbQhxt5OMAiG6+vrRX7scrtrEFqIrINY0oRw8Oxh
         c+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gAFEt9n72l1TbZh7patpk5N+v5IMCUKiiANHEz64Vv0=;
        b=gQIsLOlbXrclECjcvOXI/dn/ApiSC2fWadmGHDNKlx+a9Vm3GYoXKBQY7hH8KDeg0q
         8jUJpStzgnq7Kb41XtmnmmSPoClS2+qu14+PAuhBUnDT4BJLJqXLc7wmMmkWIVyhN4om
         9yRGVgFsKaBmBXKgGFBCy06Q1B9UxS6VIpq+ZanyKP/24H1kcBaRY+Hh1/nvdI179dzN
         xTvQAX0xXTu+Tz83EZ+3Ap2WsG0zs7JnECw5310SwCdNiqAwf/Hu33f73HEJ8evNIH61
         Z3uikqibuzaWcsHcVh81FZfm/Tjavr42MFbKeHylb3DD5L40KXkvGtrWOCA1ZLNM8iXD
         J0UA==
X-Gm-Message-State: ACrzQf0JBFv0XxDDSms1OIuzve36m5O8+l09mZ8ymhQz3EKv2/AttXjD
        P1QMy+gohsiaD58HfjFJkekmVQ==
X-Google-Smtp-Source: AMsMyM7giR1DbLO9Nytsd+S8BKNwWBg9upI3Vlwkab81b/MJYhPAf9NRq8/Nx4+vbWaYDuAGtQq9zQ==
X-Received: by 2002:a05:6402:5288:b0:457:22e5:8022 with SMTP id en8-20020a056402528800b0045722e58022mr26103364edb.244.1667815363948;
        Mon, 07 Nov 2022 02:02:43 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id q8-20020aa7da88000000b004619f024864sm3914294eds.81.2022.11.07.02.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:02:43 -0800 (PST)
Message-ID: <4fc177e1-448e-45f4-4a58-d52968536b17@linaro.org>
Date:   Mon, 7 Nov 2022 11:02:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v11 5/5] arm64: dts: qcom: sc7280: sort out the "Status"
 to last property with sc7280-herobrine-audio-rt5682.dtsi
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221107094345.2838931-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20221107173954.v11.5.I4c6d97e6f3cf8cdc691d2d4519883c3018dd4372@changeid>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221107173954.v11.5.I4c6d97e6f3cf8cdc691d2d4519883c3018dd4372@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/11/2022 10:43, Sheng-Liang Pan wrote:
> To keep diffs clean, sort out "Status" to last property.
> 
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
> Changes in v11:
> - sort out the "Status" property with sc7280-herobrine-audio-rt5682.dtsi
> 
>   .../dts/qcom/sc7280-herobrine-audio-rt5682.dtsi    | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> index 2dbdeeb29ecec..fc7a659dfe4ae 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audio-rt5682.dtsi
> @@ -13,14 +13,14 @@ sound: sound {
>   		compatible = "google,sc7280-herobrine";
>   		model = "sc7280-rt5682-max98360a-1mic";
>   
> -		status = "okay";
> -		audio-routing =
> -			"Headphone Jack", "HPOL",
> -			"Headphone Jack", "HPOR";
> +		audio-routing = "Headphone Jack", "HPOL",
> +				"Headphone Jack", "HPOR";
>   
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +		status = "okay";
> +
>   		dai-link@0 {
>   			link-name = "MAX98360";
>   			reg = <0>;
> @@ -50,8 +50,8 @@ codec {
>   };
>   
>   hp_i2c: &i2c2 {
> -	status = "okay";
>   	clock-frequency = <400000>;
> +	status = "okay";
>   
>   	alc5682: codec@1a {
>   		compatible = "realtek,rt5682s";
> @@ -75,8 +75,6 @@ alc5682: codec@1a {
>   };
>   
>   &lpass_cpu {
> -	status = "okay";
> -
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&mi2s0_data0>, <&mi2s0_data1>, <&mi2s0_mclk>, <&mi2s0_sclk>, <&mi2s0_ws>,
>   			<&mi2s1_data0>, <&mi2s1_sclk>, <&mi2s1_ws>;
> @@ -84,6 +82,8 @@ &lpass_cpu {
>   	#address-cells = <1>;
>   	#size-cells = <0>;
>   
> +	status = "okay";
> +
>   	dai-link@0 {
>   		reg = <MI2S_PRIMARY>;
>   		qcom,playback-sd-lines = <1>;
