Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15DB56736DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 12:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbjASLam (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 06:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbjASLaY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 06:30:24 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD02178575
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 03:29:56 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id q8so1245593wmo.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 03:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/2ba17zj7VIMK/xPxIvdDUjP5shl1h27sejoZLeZuQ=;
        b=Qw9NmNb2h3Q/WXN8V5dKD8ZMvIo3a0/mIEIjRNyA53EOfat0tKaG0+L0ynTn+k0bn+
         7nB4MNLiiYgOCG7bjoRS10SdcndOKBq9AwVfBDlD94nOxaxQdV3xD35VPPvWBVtg29O0
         3wpX7BiIIIR/hUytdPdEjdj/9zcu+Y492n43AxsG6phf2LHg9p4F6WknT7O61Z48ZEfj
         zQvdXQWl3GvX79bSXIQ4vV97pmYo9gGScPOml2FX5ndGYGUnSkSDt3lXOGiOzx4NXJoY
         nSvSiP90PrTm9/BI2ZektMxNMMw0QiFqlkZKkxlMtOWCYyWEouI1VUK3PZUhiek9/Obk
         Jnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/2ba17zj7VIMK/xPxIvdDUjP5shl1h27sejoZLeZuQ=;
        b=iygBgTxfBggaHmY+8gFRTMVBy7u462sJDEGhvNVmrkaZiucpIhUuuZMnBBZpD6b+of
         PfPCMdZPoUyKiXQEs3lqa4C4sSCvVY5sJyGqh1NiAnEVQjTfTAUNe6kdV0OJFMHGPcmr
         VBlXQuX4Z6TgOEK35unYd6MAlR9OVyWxP5G3eOy6779usX9wPg30m7Mgv0bv5sd5KchK
         3o/iduuHj7Zzcn60MFP3Pt1EizZ1ScZUK7k+CnsufFQ66iJjyWXDwwXDhU9MkuXBMPTe
         teLhBfg9b3yF0K6YQVrQ7HwCMME/eeWBFGGhC5fNpAjvfHPXFORfpNToHe7rETtwCm1C
         0cVQ==
X-Gm-Message-State: AFqh2kqC1kwjtQpr6xvRjQBiSdmEX2hecgJEyEpav+mdBLb2wxQDsoFG
        nHQ8kddl11QAGnjkAyJAjFVH4A==
X-Google-Smtp-Source: AMrXdXuMiM4IM//k/gieCDJhxZvpWdnP1PFB01eqMkwELfRhnLAPpWXMgCWEP2v9uPTdedd9+u1RGw==
X-Received: by 2002:a05:600c:54d0:b0:3d9:7847:96e2 with SMTP id iw16-20020a05600c54d000b003d9784796e2mr9919025wmb.2.1674127792247;
        Thu, 19 Jan 2023 03:29:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c310900b003c21ba7d7d6sm1189775wmo.44.2023.01.19.03.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:29:51 -0800 (PST)
Message-ID: <9622fe3c-0f3a-a3a2-6e35-90befe869d1b@linaro.org>
Date:   Thu, 19 Jan 2023 12:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-oneplus: add tri-state-key
Content-Language: en-US
To:     Gergo Koteles <soyer@irl.hu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Caleb Connolly <caleb@connolly.tech>
References: <20230118234638.189098-1-soyer@irl.hu>
 <20230118234638.189098-4-soyer@irl.hu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118234638.189098-4-soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/01/2023 00:46, Gergo Koteles wrote:
> The tri-state-key is a sound profile switch found on the OnePlus 6,
> Android maps the states to "mute", "vibrate" and "ring", expose them as
> ABS_SND_PROFILE events.
> The previous GPIO numbers were wrong, the patch updates them to the correct
> ones.
> 
> Co-developed-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> ---
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 43 ++++++++++++++++++-
>  1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 42cf4dd5ea28..33215ad17513 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -49,6 +49,44 @@ key-vol-up {
>  		};
>  	};
>  
> +	tri-state-key {
> +		compatible = "gpio-keys";
> +		label = "Tri-state key";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tri_state_key_default>;
> +
> +		state-top {

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).

> +			label = "Tri-state key top";
> +			linux,input-type = <EV_ABS>;
> +			linux,code = <ABS_SND_PROFILE>;
> +			linux,input-value = <0>;
> +			gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <50>;
> +			linux,can-disable;
> +		};
> +
> +		state-middle {
> +			label = "Tri-state key middle";
> +			linux,input-type = <EV_ABS>;
> +			linux,code = <ABS_SND_PROFILE>;
> +			linux,input-value = <1>;
> +			gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <50>;
> +			linux,can-disable;
> +		};
> +
> +		state-bottom {
> +			label = "Tri-state key bottom";
> +			linux,input-type = <EV_ABS>;
> +			linux,code = <ABS_SND_PROFILE>;
> +			linux,input-value = <2>;
> +			gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
> +			debounce-interval = <50>;
> +			linux,can-disable;
> +		};
> +	};
> +
>  	reserved-memory {
>  		/*
>  		 * The rmtfs_mem needs to be guarded due to "XPU limitations"
> @@ -588,9 +626,10 @@ &usb_1_hsphy {
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
> -	tri_state_key_default: tri_state_key_default {
> +	// The GPIOs have a hardware pullup.
> +	tri_state_key_default: tri-state-pins {
>  		mux {

You need to rebase.

Best regards,
Krzysztof

