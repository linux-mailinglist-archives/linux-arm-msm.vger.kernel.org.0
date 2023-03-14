Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8057C6B8F35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 11:05:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbjCNKFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 06:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjCNKFU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 06:05:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2127C62FD7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:05:18 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id n2so19207932lfb.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678788316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4RaonSoQjuXRem5niMAEN7QQ5G5pjNC5vMZ5otsYwY=;
        b=kt0HDj7RMZnnNNQJYgaJugd2clAf+wpBec+QxvFJfyfbEBubCeZsK98/wKSG3LZrOm
         ecB7DTU+Qt99oMuSomlGn6G1ykfqewfDxQLjRGz/vCqSG+VAv5lXNpZu/hEVGicbEqj2
         w6zOKR+9dbjN+GBKXFa/z8khg5NvvxdWNVWn2j54/Qq5amJJl7+OaQCRjLs7PhWioZ7w
         CT4+VbrQr167JKk7b9ikszpEFvfbu3CfYwZziRxfH9YKJuIiEQUvzNM2+CghuT2a6KmD
         LVlgwqFYYc7YbAOlqLarhvavYalfBfIih8VOWaxZ//I83m2Hu8rp4WzZVYAAD+wCgFD2
         dGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678788316;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4RaonSoQjuXRem5niMAEN7QQ5G5pjNC5vMZ5otsYwY=;
        b=el3buCzQ0r+leOeYdrie90KNWrkQMAwHAUFajgRhp5p6v0CNCmlEDR7doxYrVcMktE
         6G7Z9Dql3iAQF1ysrVrOmcLv9RmsyN7Mwu1QFqBziKcTPaCPAE08bYZohDHrIAJmmx0e
         xCDScyb824QhPcDf9LbFKDhC3NkLe/ihv0QPZAqAYOrtfX9xgli7QmobhASHFm0HjZ54
         ceMniubZD5FF7nfmZn5PmuSFzIOYyhb7bU2dm9xAHYr6ND1HBqyqFKUdLckV2lVUdEZQ
         BGZjqa6vugTwbVAzEAgzFNjagHxGbicVFHi1e5JQanJN3pC48oOHVWPdKox0BEtkBrfh
         kyqA==
X-Gm-Message-State: AO0yUKUIy+7VFSqyydBNjyN8/2k4NFHdR28EeDY1YEDEumfWkC/PO/zl
        cfXvAzyv2/mEmbIEGTsHFo8jqA==
X-Google-Smtp-Source: AK7set/aAW9Y474CQ14RsNpM2CIslKypga0EGEwbu8lqCYWnONFxEmKxaaE2KIR8shoXhQnC4N4pJA==
X-Received: by 2002:a19:ac03:0:b0:4db:387f:a3af with SMTP id g3-20020a19ac03000000b004db387fa3afmr610628lfc.4.1678788316308;
        Tue, 14 Mar 2023 03:05:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id b8-20020ac25e88000000b004e845a08567sm332387lfq.291.2023.03.14.03.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 03:05:15 -0700 (PDT)
Message-ID: <3ffb4326-ad13-d1c5-51e3-524dfa143930@linaro.org>
Date:   Tue, 14 Mar 2023 11:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845: add framebuffer reserved
 memory
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230314045812.3673958-1-caleb.connolly@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314045812.3673958-1-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.03.2023 05:58, Caleb Connolly wrote:
> Almost all of the SDM845 devices actually map the same region for the
> continuous splash / framebuffer. de-dup all the devices that specify it
> manually and put it in sdm845.dtsi instead.
> 
> This now reserves it on the OnePlus 6 where it was not reserved before,
> this is intentional.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
You didn't explain why is not done on 850 (which I assume has to do with
the windows memory map being different and putting it somewhere else) and
the reasoning for reserving it at all.

If that's the framebuffer handoff issue with smmu faults happening, it may
be worth looking into solving that properly, i.e. introducing something like
qcom,framebuffer which would suck up the starting address and figure out the
required size based on MDP5 VIG pipes' registers and could tickle the
autorefresh regs if needed. See how lk2nd does it, the hardware underneath
hasn't changed since msm8974.

Then, on drm handoff it could free the memory and let drm/msm initialize
its own, new, dynamically-allocated and dynamically-sized region as it wants.

Or we can use mdss's never-used memory-region property, but that would
kill 35 or so megs of ram for everyone, no matter display their resolution.

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi              | 6 ------
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts     | 5 -----
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts           | 5 -----
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi       | 6 ------
>  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi                        | 5 +++++
>  arch/arm64/boot/dts/qcom/sdm850.dtsi                        | 2 ++
>  7 files changed, 7 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index f942c5afea9b..6a1c674a015b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -93,12 +93,6 @@ spss_mem: memory@99000000 {
>  			no-map;
>  		};
>  
> -		/* Framebuffer region */
> -		memory@9d400000 {
> -			reg = <0x0 0x9d400000 0x0 0x2400000>;
> -			no-map;
> -		};
> -
>  		/* rmtfs lower guard */
>  		memory@f0800000 {
>  			reg = <0 0xf0800000 0 0x1000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index d37a433130b9..7c2457948a32 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -55,11 +55,6 @@ vreg_s4a_1p8: pm8998-smps4 {
>  	};
>  
>  	reserved-memory {
> -		memory@9d400000 {
> -			reg = <0x0 0x9d400000 0x0 0x02400000>;
> -			no-map;
> -		};
> -
>  		memory@a1300000 {
>  			compatible = "ramoops";
>  			reg = <0x0 0xa1300000 0x0 0x100000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index b54e304abf71..4f6b1053c15b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -60,11 +60,6 @@ key-vol-up {
>  	};
>  
>  	reserved-memory {
> -		framebuffer_region@9d400000 {
> -			reg = <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
> -			no-map;
> -		};
> -
>  		ramoops: ramoops@b0000000 {
>  			compatible = "ramoops";
>  			reg = <0 0xb0000000 0 0x00400000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index 4984c7496c31..7e273cc0158d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -79,12 +79,6 @@ vreg_s4a_1p8: pm8998-smps4 {
>  	};
>  
>  	reserved-memory {
> -		/* SONY was cool and didn't diverge from MTP this time, yay! */
> -		cont_splash_mem: memory@9d400000 {
> -			reg = <0x0 0x9d400000 0x0 0x2400000>;
> -			no-map;
> -		};
> -
>  		ramoops@ffc00000 {
>  			compatible = "ramoops";
>  			reg = <0x0 0xffc00000 0x0 0x100000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index e0fda4d754fe..191c2664f721 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -98,12 +98,6 @@ spss_mem: memory@97f00000 {
>  			no-map;
>  		};
>  
> -		/* Cont splash region set up by the bootloader */
> -		cont_splash_mem: framebuffer@9d400000 {
> -			reg = <0 0x9d400000 0 0x2400000>;
> -			no-map;
> -		};
> -
>  		rmtfs_mem: memory@f6301000 {
>  			compatible = "qcom,rmtfs-mem";
>  			reg = <0 0xf6301000 0 0x200000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 479859bd8ab3..ecec2ee46683 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -865,6 +865,11 @@ spss_mem: spss@97b00000 {
>  			no-map;
>  		};
>  
> +		cont_splash_mem: framebuffer@9d400000 {
> +			reg = <0 0x9d400000 0 0x2400000>;
> +			no-map;
> +		};
> +
>  		mdata_mem: mpss-metadata {
>  			alloc-ranges = <0 0xa0000000 0 0x20000000>;
>  			size = <0 0x4000>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
> index da9f6fbe32f6..b787575c77a5 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
> @@ -7,6 +7,8 @@
>  
>  #include "sdm845.dtsi"
>  
> +/delete-node/ &cont_splash_mem;
> +
>  &cpu4_opp_table {
>  	cpu4_opp33: opp-2841600000 {
>  		opp-hz = /bits/ 64 <2841600000>;
