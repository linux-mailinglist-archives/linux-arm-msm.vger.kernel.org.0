Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D70B66B7EA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 18:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbjCMRD2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 13:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjCMRDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 13:03:13 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EFC7E7A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 10:02:29 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id t14so13336865ljd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 10:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678726880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f1RDtAGLj0Ru2Y2XZ1WbfrRwXcKezO5xKtNrT7rLq4M=;
        b=i1ay3requ062Q/P51oQcvpIxd3HoiBx9BQwoVQO1GtfP+yzxTw8KHfJZBVsDkNdwvF
         FTT9RMf3tIsG7hgHOu5wxE0BdczImUtinFEPCCYjiDFX0l86vBTNANw4uVm05AgktBki
         YZaKPwua9xHwGRJx72zFISfXk31qhYvUTweQnMGIV39d8yUslUPKfxCaTNvczoqcM2Rs
         EfQif4dAfLOImmbBoDpVDKktpcv5ineqKKfuoRL35/EK9A7+oj5KkMljtIrWL8MjaGZa
         0TmsddaTpYbHDk27jt4kJQp4VvvF4Jy+o7T5Nl/lBR68qgRp2cdxlt0XP73ZjZHK8MDA
         zpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678726880;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f1RDtAGLj0Ru2Y2XZ1WbfrRwXcKezO5xKtNrT7rLq4M=;
        b=GybzErU6an9KjNo77hY1j6KcGiK5sy9OUGWwj7Oi0CzKWJfhEnzBOpAQoi4wyMXA7p
         WF1aM3V7re8Ng/jl0ncYW6nz7SfXuLfdi+3CgkofT1uyRLkRoce2Eq+h0nXRhdW+dUNN
         51vQ6UiAqwXc30fk/MYBRuJ6vthkTQTEwtEJq4muUCwKyzm1IopSomtpLjXHf14Z0hhK
         5gxKZlLB4iVGrpux5xV5oiVPWgdygYEXHgEBv4C4KTz8cR05cQbKMUiw9H2QQdhz1njn
         tOwXwKThzxosmHd5wJcVPy5VViTojy/rUYOPrudgkoZZNDtp3WkDaYdmEwrqY6SSdpan
         LcRQ==
X-Gm-Message-State: AO0yUKV9acQpKTMZK2RgeqBr9EcDWtQQMDnOeAM7qo9aCheovw0TSapt
        pk53oNuV8TydSeu6T6XKSXwINg==
X-Google-Smtp-Source: AK7set9ikAiz3Ii8WfPk13mIVyXmlhmTfMzPl5IqSmp1dTqqDaWFactO+pFjYLfz/l/Tyotkzw2nZQ==
X-Received: by 2002:a2e:99c4:0:b0:293:4d57:7148 with SMTP id l4-20020a2e99c4000000b002934d577148mr10860247ljj.11.1678726880222;
        Mon, 13 Mar 2023 10:01:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id q7-20020a2e8747000000b002959f550084sm63352ljj.100.2023.03.13.10.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 10:01:19 -0700 (PDT)
Message-ID: <a131ffa0-1e9c-d355-16db-19e679ab0380@linaro.org>
Date:   Mon, 13 Mar 2023 18:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC v2 2/6] arm64: dts: qcom: sdm845-tama: Add Synaptics
 Touchscreen
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>
References: <20230313-topic-tama_disp-v2-0-37ececf43770@linaro.org>
 <20230313-topic-tama_disp-v2-2-37ececf43770@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230313-topic-tama_disp-v2-2-37ececf43770@linaro.org>
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



On 13.03.2023 17:32, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@somainline.org>
> 
> Add required pins and RMI4 node to the common DT and remove it
> from Akatsuki, as it uses a different touch.
> 
> Since the panels are super high tech proprietary incell, they
> need to be handled with very precise timings. As such the panel
> driver sets up the power rails and GPIOs and the touchscreen
> driver *has to* probe afterwards.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
[...]

>  &i2c5 {
> -	status = "okay";
>  	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	touchscreen: touchscreen@2c {
> +		compatible = "syna,rmi4-i2c";
> +		reg = <0x2c>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <125 IRQ_TYPE_EDGE_FALLING>;
interrupts-extended

> +		vdd-supply = <&vreg_l14a_1p8>;
> +		/*
> +		 * This is a blatant abuse of OF, but the panel driver *needs*
> +		 * to probe first, as the power/gpio switching needs to be precisely
> +		 * timed in order for both the display and touch panel to function properly.
> +		 */
> +		incell-supply = <&panel>;
> +
> +		syna,reset-delay-ms = <220>;
> +		syna,startup-delay-ms = <1000>;
> +
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&ts_default>;
> +		pinctrl-1 = <&ts_sleep>;
swapped

>  
> -	/* Synaptics touchscreen @ 2c, 3c */
> +		#address-cells = <1>;
> +		#size-cells = <0>;
Konrad

