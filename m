Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABD961EFA4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 10:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbiKGJxh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 04:53:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231540AbiKGJxd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 04:53:33 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104F6263C
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 01:53:31 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id l11so16641612edb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 01:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrpOcBtn3HWMTxBFuFmQ7U6kciBf0Ub0H3iUH25EGv0=;
        b=VThaQHoiK194f4T5eApDXnIMZaUnNfXYV3g88ghL15kjblzUOIfzKsbt6Evlll/n0r
         L414tqkO0Qv8e5Di6OQXF8ihSNLEM7JvyPa1f1t710+/f6GgUU2E61mbZ9iakDE2Aq9A
         ieMdgHz1nDcHH8PJFlihdag8fazTaa8XU3uiEiS3o05HjDrXdxEELo9uVwwrgUNyn2SD
         Uc0xZNP+DVe4VVDvOdMQj+vwhT+JG6yY1FUj5Lf9tc0khCh/0VnYkXLrdBweG7DkSFhi
         VmDqssrIiZ0KbJDJ2Hffo8YEqLxCKhS+3za+I31eglTW4qNDwGoYhUPRjYztOeqb0L1T
         qujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nrpOcBtn3HWMTxBFuFmQ7U6kciBf0Ub0H3iUH25EGv0=;
        b=0ndtvvx324Q1PHo8fRzTwG9k+ehDEdV6/tsg4yYPKrwoOav/9h/14qaT7L//1z2QFA
         Q8rofA9qdiQSwDtNBGMO8Z864YZYTkDtSM2PXmHrKfcyWKSZGHlFfH3PuB3lsFbBFN3n
         YUMAKmLnU8qpmgUPdbRnPue340MKWhHFNkUb96jcTF+KXKf8hHsyP9oynEshc8kIOUq0
         XSk1/euTc/8MUbUI+0eZ8vN0YN+uG0kPfEMrHQU0YkBYgJAdCFqJuGjhD1VcxA2bZJav
         BJr/d93p5HwAtWZ9gEu2lPGDX6mu17F+UnCsdlC+X5gJAxSq7UkSD7SaGKgR+DYXuoSb
         g5Zw==
X-Gm-Message-State: ACrzQf0PR/06E6oNLnR1Q1ExTSJ1uZW6ZTvQTJEN03oF7Re9mQuCraoB
        7zhWMalCgTEotBgATwooguCODA==
X-Google-Smtp-Source: AMsMyM5BEU/PscivvE+aOXq9l80dpRVKt+3pctwgItNKm7ObLcP+QwuaMiLbf+J1zUg/Y8ubzEWpOw==
X-Received: by 2002:a05:6402:659:b0:463:a83c:e0af with SMTP id u25-20020a056402065900b00463a83ce0afmr697434edx.158.1667814810525;
        Mon, 07 Nov 2022 01:53:30 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id et19-20020a170907295300b0078df26efb7dsm3131175ejc.107.2022.11.07.01.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 01:53:30 -0800 (PST)
Message-ID: <d18aea2b-3ae8-2754-585d-ef763588461d@linaro.org>
Date:   Mon, 7 Nov 2022 10:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hk10: use "okay" instead of "ok"
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221107092930.33325-1-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221107092930.33325-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/11/2022 10:29, Robert Marko wrote:
> Use "okay" instead of "ok" in USB nodes as "ok" is deprecated.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> index db4b87944cdf..262b937e0bc6 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> @@ -22,7 +22,7 @@ memory {
>   };
>   
>   &blsp1_spi1 {
> -	status = "ok";
> +	status = "okay";
>   
>   	flash@0 {
>   		#address-cells = <1>;
> @@ -34,33 +34,33 @@ flash@0 {
>   };
>   
>   &blsp1_uart5 {
> -	status = "ok";
> +	status = "okay";
>   };
>   
>   &pcie0 {
> -	status = "ok";
> +	status = "okay";
>   	perst-gpios = <&tlmm 58 0x1>;
>   };
>   
>   &pcie1 {
> -	status = "ok";
> +	status = "okay";
>   	perst-gpios = <&tlmm 61 0x1>;
>   };
>   
>   &pcie_phy0 {
> -	status = "ok";
> +	status = "okay";
>   };
>   
>   &pcie_phy1 {
> -	status = "ok";
> +	status = "okay";
>   };
>   
>   &qpic_bam {
> -	status = "ok";
> +	status = "okay";
>   };
>   
>   &qpic_nand {
> -	status = "ok";
> +	status = "okay";
>   
>   	nand@0 {
>   		reg = <0>;
