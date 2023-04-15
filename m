Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 253E56E30BC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Apr 2023 12:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbjDOKmf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Apr 2023 06:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbjDOKmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Apr 2023 06:42:33 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E439740
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 03:41:59 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bx15so19592619ljb.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Apr 2023 03:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681555314; x=1684147314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmIpyi6/VTzVwR3NUnypEdQ8q3iaaas7kIub4aO6IHw=;
        b=OsFYyZ3jgJxQdw2pwn6WlUYEcNltC2vYfjFDR9nB7nX85UcJZB887HpisNMDFkha3m
         ihWNz2OElgrMGAO7z1VtmGJVX/mGh1vAL9UrjimCa2SZcib6AdgAxCRVeO8tHL2uDLXi
         B0ibtNDpp0oLIHRsvSpq0RoOHL+9pw8ILiyTpZlC4iwvRFHPmvNd/OgjZ9v6YzxUG2kR
         ugBTOTI8kL92jPcqcugtIRE35CKLNj3qeYzZTFWno7hjwMvkehB0FVPDDc0mczQKmC/Z
         LqR9jcj9NmpARzzME7ACZ/z3JC8Sr2WPFrPhNTlW7w9MznjxCCD6TXJHUDmP7LOmbW69
         nDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681555314; x=1684147314;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmIpyi6/VTzVwR3NUnypEdQ8q3iaaas7kIub4aO6IHw=;
        b=VQ6pvYi79tYmjotU/RGWZkh67+HC45l9hEYZ0pUrG/9GdBN38qzfDqmus74pvI1NQK
         BTlhhJphOyDM8gVt87+6dDHkZsvNmfhfJ3hVQFYcv/zBegGsQm6VB1PLIA0Zw4FsxkGm
         m5bGKMnzCM4rO8NrBLejHG9uVQv6ELnYd7YZx+sMuT3LtfWIXgY3VtHFYpVWJJX0Hf3u
         q2IqIYTZWZ3YsJt1bij8HHczBDxSLaLqLvhehVmuMOCCS6r/rI0HECICo6sLhYQN+VV+
         HavMV2hjOW4f4U8qBEttD1WnyGyuAdF72U/QXtLYezHvcd8o2xdFIVYDZVGdsnwZVm5M
         sSIQ==
X-Gm-Message-State: AAQBX9cuq4zX00TAfYZ3kz1O69xE+ME9ejltdGx49u8CPVmfTwrTHMMS
        TdvdjnRxz3jGRQ/QoIdF2w2cZA==
X-Google-Smtp-Source: AKy350ZMoScIlZDLdVRk0mI6XK2W/BpNCPrjar+eP/56X+p/oI81gvPUNLcgVsAoH1ejne6AYBKpFg==
X-Received: by 2002:a05:651c:10cc:b0:2a7:a3b4:7747 with SMTP id l12-20020a05651c10cc00b002a7a3b47747mr2417038ljn.29.1681555314001;
        Sat, 15 Apr 2023 03:41:54 -0700 (PDT)
Received: from [192.168.1.101] (abyk99.neoplus.adsl.tpnet.pl. [83.9.30.99])
        by smtp.gmail.com with ESMTPSA id u7-20020a2ea167000000b002a784085edbsm1272666ljl.99.2023.04.15.03.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 03:41:53 -0700 (PDT)
Message-ID: <d34f008b-080c-7639-6839-918aaa8da8a1@linaro.org>
Date:   Sat, 15 Apr 2023 12:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg:
 introduce support for fts touchscreen
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Jeff LaBundy <jeff@labundy.com>,
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Max Krummenacher <max.krummenacher@toradex.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Hans de Goede <hdegoede@redhat.com>,
        Maxime Ripard <mripard@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230415020222.216232-1-joelselvaraj.oss@gmail.com>
 <20230415020222.216232-5-joelselvaraj.oss@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230415020222.216232-5-joelselvaraj.oss@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.04.2023 04:02, Joel Selvaraj wrote:
> The Poco F1 EBBG variant uses Focaltech FTS touchscreen. Introduce
> support for it.
> 
> Signed-off-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> index 76931ebad065..26e77979cdab 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts
> @@ -13,3 +13,24 @@ &display_panel {
>  	compatible = "ebbg,ft8719";
>  	status = "okay";
>  };
> +
> +&i2c14 {
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "focaltech,fts8719";
> +		reg = <0x38>;
> +
> +		interrupts-extended = <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
> +
> +		vddio-supply = <&vreg_l14a_1p8>;
> +
> +		pinctrl-0 = <&ts_int_default &ts_reset_default>;
> +		pinctrl-1 = <&ts_int_sleep &ts_reset_sleep>;
> +		pinctrl-names = "default", "sleep";
> +
> +		touchscreen-size-x = <1080>;
> +		touchscreen-size-y = <2246>;
> +	};
> +};
