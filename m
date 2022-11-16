Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0081962BEC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 13:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbiKPM4u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 07:56:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbiKPM4s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 07:56:48 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AF83122C
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:56:45 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id v27so26444747eda.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 04:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpXPXex2pj+shAOqQ1Qkj2iiHvrTjroDhyNWQJmN94Y=;
        b=uwAyUynBI4H0SytHKL+axjOZPqeGxypmmWoN1PVWXgo2T915dI6384z7FSwUV024hy
         cy7/wxG94xGD/dy6UADeaz9JgEqWhCfiQ64qZW0bPLfWSXTo+hPEB/H/y9UOuvpJk+xT
         xGgJjrblQ0vXWIKJ/GjIcn8KVZn1UHvNn4tqdJj2ChPWa/Zjgu5JdeOLoW7uPfIaRvEc
         Cqs6eSv39AuGnUF8cxG3gg+sWRQ5cab0ZwhsteIwk7p/0taYb3twBj3+G9ZXdjasIkvV
         3n6mLodYblv70Xe/0dx36ut3qEe61uaB1V+DIwbedhtCgFPQtRXkA9v8jGbSI+DHC4zP
         0f6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FpXPXex2pj+shAOqQ1Qkj2iiHvrTjroDhyNWQJmN94Y=;
        b=ZghT4GyLQ4DGbSZnxBKT4VnLZjoj+7sIQ3TOnVTLpugcruC5Y4yLqQonWja2Dw9o3W
         I8W0IY5gZyrIHHWHPG8M6MEBffacegGIktArz3jMTMN8YlDpLQ4rnZg9aR0MR2B3bcFj
         slmre9JoH7bBhK7af5sl6DUXss8R/c0czZLSIZwecTVfVqY2LY01jX1+b1B6AU6aFj2N
         chaGkIgwa/MuPt4Ieqfc3IFo8/yf/5Z59XOpXzrMqv8FE2LmOhgCPidJgJMfl0p+uDlr
         Iy1f9mDg1rNqfOEK/f14238gCIs3a7hH6kssHYQRnsoDfH+114ROYPKJPqXoLUHvWvSY
         m++g==
X-Gm-Message-State: ANoB5plQkaiaIOtyT8uILDUYWHc4D6OXHaJ/4DOH/NQCbAOGrT+cX0BF
        NQwT3QMKuJXZ14ewc5xwwduoIvoPlETmihY7
X-Google-Smtp-Source: AA0mqf7lWA/QwqvzGcqFNDfNRicifSvvzr+7KxdPHa48eaUPqyAWOlh4cLsWjWIdcLTzBewgPlGhdQ==
X-Received: by 2002:a50:fe19:0:b0:462:70ee:fdb8 with SMTP id f25-20020a50fe19000000b0046270eefdb8mr19532589edt.66.1668603403903;
        Wed, 16 Nov 2022 04:56:43 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id qq18-20020a17090720d200b0078df3b4464fsm6939633ejb.19.2022.11.16.04.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 04:56:43 -0800 (PST)
Message-ID: <22a41a8c-9b4a-ecca-ddd2-5e217d00d20c@linaro.org>
Date:   Wed, 16 Nov 2022 13:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550-mtp: Add UFS host controller
 and PHY node
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20221116125112.2788318-1-abel.vesa@linaro.org>
 <20221116125112.2788318-3-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116125112.2788318-3-abel.vesa@linaro.org>
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



On 16/11/2022 13:51, Abel Vesa wrote:
> Enable UFS host controller and PHY node on SM8550 MTP board.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index d4c8d5b2497e..fef7793a7dec 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -417,3 +417,25 @@ data-pins {
>   &uart7 {
>   	status = "okay";
>   };
> +
> +&ufs_mem_hc {
> +	status = "okay";
Status last, please.

> +
> +	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
All these -microamp properties are downstream and do not exist in the 
mainline kernel. Remove them.

Konrad
> +	vccq-supply = <&vreg_l1g_1p2>;
> +	vccq-max-microamp = <1200000>;
> +	vccq2-supply = <&vreg_l3g_1p2>;
> +	vccq2-max-microamp = <100>;
> +};
> +
> +&ufs_mem_phy {
> +	status = "okay";
> +
> +	vdda-phy-supply = <&vreg_l1d_0p88>;
> +	vdda-phy-max-microamp = <188000>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-max-microamp = <18300>;
> +};
