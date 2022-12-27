Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7814E656CFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 17:35:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiL0QfS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 11:35:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiL0QfN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 11:35:13 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B15BC18
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 08:35:12 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id bq39so12479964lfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 08:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kEGcqGMQn+hzqm4YCiJVbrBqK5HxwH7CWSeMqD08OVI=;
        b=cOWC9LuwtS3FCi8Ol81isgC52++h6JjYRjfIevsCOoa5YiCYjapOUpbfLP2mX/1hKk
         XLcU66VmEfnn8Jf5RKUSz1L/ip9nQlbRRHRobAjffeEiSar+fv9dhh7iHxoH7ufKpC0v
         heFLn+k8WvOOgTki51XJ4Q1uYxpHZoI/IVoLEmOQxKOHFFAZx6GpFzSucfa32GCDEgP8
         e6fU0WY6DJyGzHWyDrg4QMguCWE/98anU2xZ9fr4hsSY4pKGgvcOt5s+r9BpMYCs7SMl
         TvMGRldFW+mnrgRb/fXCx4/2D+yCRGfJW0v7EJh1rdWfOERBnb39qn9Sk8aJRbMLB8VV
         pF7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEGcqGMQn+hzqm4YCiJVbrBqK5HxwH7CWSeMqD08OVI=;
        b=SlF7xZOC0eqiW2iYjCgjGyAosXCSQvLMcq6JBdqKRdPN7exg1rtzTQwFFCc2BDqAZz
         0UJj/Qm7mCQfZalIMcqqDVtl0ifgos6a0wxzUlgR+myirbbZbopcydqULB7iuQ9fH0nq
         YBe5bXIFLP0LvVuubUGyQc+6RyderBN/+02biFkNW9aqHbkV+B/SgGjr5Zr5oayk1nCE
         HiFB+mIrbTQDsk3JPl7QI71b5nnBwmZGg931tvE2MRjvF9lSIN6MqHs67/nAvFOGWN3m
         Rq3wdcJJDThFR6pbkoDtVw9mEnEnUdBuCcO7mqm7M9h6GvTl45gRMm++NDMLNCsGySHN
         IfDg==
X-Gm-Message-State: AFqh2kqUP4Un0nZpiREu1dhfdDU/T1T5axw2WP56uI9QyRgIlCxO8qmV
        eqjmtUykcwuVWKyvv8yrTpk332o6t061tDbf
X-Google-Smtp-Source: AMrXdXuUsAO0HLb2EJb0jBoGLM9gOZwW1Wp/sTyo1nrqceUDZRAbM4Cr4c8oliOWYY3Cn3KPuRu4xQ==
X-Received: by 2002:a05:6512:1582:b0:4b6:e494:a98d with SMTP id bp2-20020a056512158200b004b6e494a98dmr7346485lfb.44.1672158911160;
        Tue, 27 Dec 2022 08:35:11 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id s11-20020a056512214b00b004b57c5b7ec3sm2308867lfr.235.2022.12.27.08.35.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 08:35:10 -0800 (PST)
Message-ID: <fcffbab9-830f-312a-ee52-a0ea13007eea@linaro.org>
Date:   Tue, 27 Dec 2022 17:35:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8350: drop unused dispcc
 power-domain-names
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221227163158.102737-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221227163158.102737-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.12.2022 17:31, Krzysztof Kozlowski wrote:
> Display clock controller bindings do not allow power-domain-names:
> 
>   sm8350-hdk.dtb: clock-controller@af00000: 'power-domain-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> 	From schema: Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index 0726930c9e28..d473194c968d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2637,7 +2637,6 @@ dispcc: clock-controller@af00000 {
>  			#power-domain-cells = <1>;
>  
>  			power-domains = <&rpmhpd SM8350_MMCX>;
> -			power-domain-names = "mmcx";
>  		};
>  
>  		adsp: remoteproc@17300000 {
