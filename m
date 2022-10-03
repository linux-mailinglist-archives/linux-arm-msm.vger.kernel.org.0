Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98A305F3359
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 18:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiJCQU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 12:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbiJCQU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 12:20:58 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C0116581
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 09:20:57 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id r3-20020a05600c35c300b003b4b5f6c6bdso6116507wmq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 09:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=kqY6OOfgOUM95ZCJP+o85wHk1MxmbH51heuqF3gddv8=;
        b=R352KpR/LTOEulaCgRUUqaVteUSBk1DFCKTYVy5y71yCzjD7eQ8e9wruHlODhLs+dC
         ucHE+xZiozgap4gVoAwpf8JvyG0qZ65T1Qxc+ND4kAC9Ht8CVQZjQyPeknS2WnUIWjfP
         BTv8bUhSVc1D/eMXQ5IKKM9WsALp33T2bEbweS51cB/LdhMklV4Va6OlatWKdQqtCAjd
         HOoGbRoTujxvdYDgBmztt9ZkXI8nWrrBOGwiXDEG4lizr87RNu/0d1MsPZVXi4sbh/XA
         nLyNvDsOiSvs5Ut3J7nRd4srnFQea0DnNTBRhyYeuYgKxZJav0JRnGNBjJpJIaiw6l0g
         K11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=kqY6OOfgOUM95ZCJP+o85wHk1MxmbH51heuqF3gddv8=;
        b=hQXlH+qqNQMW62xUxtqcQpHZRI60aigu6fvNWG5WhR/OnUgUhaGDgSgqKYUqYEpZjK
         ePcXREk46WR+zATNtsvrSdYIhTi3Z1xpNuQrdhdutISUj1j3GQQtFiU11xQVgKBqqGoO
         qc5kjpoVlMsTCwBnkvPFY1bhrLSv/SdHhCHYNyJ8tokyYlTnSZT7laGD7NeVNfNt/hAy
         rtWSH0brctziC8tDix9freu3ztuSJuUedTvWQ0koc2TiUgkDK2pWP2GByNgiXu9vb6Gm
         IHnD7RqHR5A0f3hpaj3SFwfjRZThPl1tGT+pjXkBLs+htxaipizWVwXktu0dvuyy2Sxa
         4RhA==
X-Gm-Message-State: ACrzQf3U/iWcYVAp3Ny0W/xpG+1EEBMYlYZeQtysuDQeclk9IKldTl5y
        2k6oPfgSQgl/GA8zE4/OBvavrA==
X-Google-Smtp-Source: AMsMyM5KNG4FRtDeDkU6pm6aVrs3IyuTz2D20TctkP7HUk6KMJW+MERxFt2aB0+RlvxtqNFaWr1+EA==
X-Received: by 2002:a05:600c:6d2:b0:3b4:8361:6154 with SMTP id b18-20020a05600c06d200b003b483616154mr7713625wmn.89.1664814055648;
        Mon, 03 Oct 2022 09:20:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id h18-20020a05600c2cb200b003b51a4c61aasm17489992wmc.40.2022.10.03.09.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 09:20:55 -0700 (PDT)
Message-ID: <4c0edc64-85cb-8f61-68e3-d86be2b25940@linaro.org>
Date:   Mon, 3 Oct 2022 18:20:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/23] ARM: dts: qcom: apq8064-cm-qs600: pull SDCC pwrseq
 node up one level
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930185236.867655-1-dmitry.baryshkov@linaro.org>
 <20220930185236.867655-11-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220930185236.867655-11-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 20:52, Dmitry Baryshkov wrote:
> There are no need to add additional simple-bus nodes just to populate
> a single pwrseq device. Pull it up one level into /. While we are at it
> also fix node name replacing underscore with dash.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts | 17 +++++------------
>   1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> index 5ff0d9a275cc..d6ecfd8addb7 100644
> --- a/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom-apq8064-cm-qs600.dts
> @@ -15,18 +15,11 @@ chosen {
>   		stdout-path = "serial0:115200n8";
>   	};
>   
> -	pwrseq {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -		compatible = "simple-bus";
> -
> -		sdcc4_pwrseq: sdcc4_pwrseq {
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&wlan_default_gpios>;
> -			compatible = "mmc-pwrseq-simple";
> -			reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;
> -		};
> +	sdcc4_pwrseq: pwrseq-sdcc4 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wlan_default_gpios>;
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pm8921_gpio 43 GPIO_ACTIVE_LOW>;
>   	};
>   
>   	/* on board fixed 3.3v supply */

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
