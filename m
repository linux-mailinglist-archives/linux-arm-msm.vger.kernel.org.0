Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 005696B52C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 22:26:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbjCJV0D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 16:26:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbjCJVZy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 16:25:54 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 215A31FE9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:25:41 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id l9so622365iln.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 13:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678483540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lysTcPW0XVZ+IeRM4GcO6JyKJb8asSqs6h2ziKdVdMA=;
        b=Ib5+WiokdF4Wg6nmSNkoKrFmIfTRRN52sgdHf/J9pf53SOVZo6k9AEpxF0l9pEwlzP
         mOUdvT1brKB2+WtDE1wOcW0SKlXKaNVXg0j5NE6PbcwuS+e4QhwgsQHG6zh4bgz+hdTd
         OYACwE/cJdGrwhvpfeO6FVZC+CLuJ6i0RC2ojlyBUvFtY4vDkcGDJooZd3Omf/l3oNvK
         GrT3Sl0G8oNfKtd7B0ZC1MaLKTRyVeUkIoUdqCwiyX0A0rMdR9via28equAC5F1hLGug
         6Uu91Y9USxQfeRaocWpttTe+C+kPe0LPL0XcaYoN3STUJIrOdYVJOza93SWOC4+eiV1N
         0S8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678483540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lysTcPW0XVZ+IeRM4GcO6JyKJb8asSqs6h2ziKdVdMA=;
        b=My8Qzn1pfCrvpE9WTdYPSMyYdl2hIAgi2J83V/x06rMs2HMrzNjFdelgMC1Eq3SDUr
         DXzQ/8rFyN96tv3qDRRdC/P34B+RxrBQBozBrDNuZioDgZxYujldGtYaNTuuKBiOw6wk
         YsOf0Bhgdm7vvFNxdN4WGeS1M5+RrptxEueB0oTQAfDzVn8X2fpPoaGPoQtnvT7PiZIB
         TJn9zlalzBjsNbwaBTk3/8OBlqLyPWTPwUBADR4JSh7NL4NzVRioTmplLFTjp6x8fFnn
         Zc5lX/eG/AMeQEYUtnGQgWF2EmHuQuZMkvBdWyE1/pHQG/SS62xi5YjtII9SKVPLD4aS
         JxOg==
X-Gm-Message-State: AO0yUKXdlNKU0HRKzANj8wHrKtBLumgaJUbJF0Ne3lBLQQxaJrjqveGb
        Pgy25XcqILrpuSsKpV5vEmPB4A==
X-Google-Smtp-Source: AK7set+A2RqEnUDfe1tmfLOzGw/NX61oogxnL4AQW62P5+sZCs92EtU9+B6paRANwZs9OJtgTM6IOg==
X-Received: by 2002:a05:6e02:1010:b0:316:fcbe:628f with SMTP id n16-20020a056e02101000b00316fcbe628fmr17209813ilj.26.1678483540237;
        Fri, 10 Mar 2023 13:25:40 -0800 (PST)
Received: from [172.22.22.4] ([98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id z1-20020a92d6c1000000b003155ebba955sm287643ilp.68.2023.03.10.13.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 13:25:39 -0800 (PST)
Message-ID: <4e9a29b1-bcaa-8f14-3f2e-9ed40fd8e3ef@linaro.org>
Date:   Fri, 10 Mar 2023 15:25:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] arm64: dts: qcom: sm8350-hdk: enable IPA
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230310203438.1585701-1-dmitry.baryshkov@linaro.org>
From:   Alex Elder <elder@linaro.org>
In-Reply-To: <20230310203438.1585701-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/10/23 2:34 PM, Dmitry Baryshkov wrote:
> Although the HDK has no radio, the IPA part is still perfectly usable
> (altough it doesn't register any real networking devices). Enable it to
> make it possible to test IPA on this platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I like that you've captured this, but I'm not sure I
like the idea of enabling this if the modem is never
expected to function as, you know, a modem.

At a minimum I'd want to be sure we could exercise
IPA in loopback mode before considering this seriously.
I could work with you to experiment with doing that
next week if you want.

This isn't an outright "no" though; let's see if anyone
else feels strongly one way or the other.

					-Alex

> ---
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> index 09baf6959c71..60fbb2f49720 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> @@ -746,3 +746,10 @@ irq-pins {
>   		};
>   	};
>   };
> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&pil_ipa_fw_mem>;
> +	status = "okay";
> +	firmware-name = "qcom/sm8350/ipa_fws.mbn";
> +};

