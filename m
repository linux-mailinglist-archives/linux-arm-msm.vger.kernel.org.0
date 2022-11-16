Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B0F62BF10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 14:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiKPNJV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 08:09:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbiKPNJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 08:09:17 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B29020997
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:09:16 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id l11so26495604edb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgEG92Xup3/mVDZ3A5sVas1YVywyNuVA0qoL/v6KQmE=;
        b=cOwmbyq4DhKgMTF18V6U3k9aZx4YLgaaythcJQ8VKb30g6Uh7uSNr+hXEmgJs+vc22
         cCuqKX7/N9fxy8YbmS7jFkpB0IQ3voiVruO1GSyzIk9ZYSh1obIR38pU9lVutFeIVljk
         bh8WnLpwr8uX/Uy98Ek72lU7Yb218NXhwjZFvNiiKJhoLcx1B5iKX+wDE5FT4fKwzt1X
         jybBX4wpKQdI/ueKz/lEGU076TE92mVUPWnIv1QeVdD1xzib7PjdT7Enx1Jsbxq5yZUX
         Rrz3AxKwzGokqWhMDpKlJtlP5x84eG/+YTYyv/UQ7DAg99eQ3xgz510FuAkpHdqVdJR/
         IwLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qgEG92Xup3/mVDZ3A5sVas1YVywyNuVA0qoL/v6KQmE=;
        b=PRkdp2AyvGttqm8h532sa2FiQ2JoGFQqauD6e9DIp1DIOM2iXETRo/4em4JaReYF93
         nytjZ+FWiDWMNVa40C/rvjkhNdrHYLBJQYDfDtD0IDUuY/BhUC22tn49U/vJVfjJwAZo
         1PNiJuLQWNsPzOEDL9ip/ljgpys58lDQBv+YGn8pNaaZrl8Kik1K5gljdpYWcn+f2Kh/
         uiqEK4B0Nd2QMkQumKOWzah/8d5uoXYF3ZFcqtN9XElHcfxY/UVWx7el64fW4W7uo0OW
         lEtVDO+cHBG3L0iknl2FCFCdbetI1eEwYZnZlr4U6/3cYpRNQfjwNzoZK5kThRVqA4DG
         KVdw==
X-Gm-Message-State: ANoB5pn/DuvghSotx4XnMxPOZazYMQCnBnlt+vUkGj3RtKjfDhxTi5PS
        hTn3W4a1iKWtbMSW8lMOywF9DQ==
X-Google-Smtp-Source: AA0mqf6L7Mza3E/jBqky69qnp6QiDfXFXHjWoXZBBVdm93LL2vifNyClCRElRyHQAuOU7LZ1+o9YUA==
X-Received: by 2002:a05:6402:1204:b0:461:e3f2:38bc with SMTP id c4-20020a056402120400b00461e3f238bcmr19406728edw.149.1668604154720;
        Wed, 16 Nov 2022 05:09:14 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id n11-20020a170906118b00b0078cb06c2ef9sm6824283eja.8.2022.11.16.05.09.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 05:09:14 -0800 (PST)
Message-ID: <f584a204-db03-cf16-2db5-5cce1f3bf538@linaro.org>
Date:   Wed, 16 Nov 2022 14:09:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550-mtp: Add PCIe PHYs and
 controllers nodes
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20221116130430.2812173-1-abel.vesa@linaro.org>
 <20221116130430.2812173-3-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116130430.2812173-3-abel.vesa@linaro.org>
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



On 16/11/2022 14:04, Abel Vesa wrote:
> Enable PCIe controllers and PHYs nodes on SM8550 MTP board.
> 
> Co-developed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550-mtp.dts | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> index d4c8d5b2497e..93a676754666 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
> @@ -414,6 +414,31 @@ data-pins {
>   	};
>   };
>   
> +&pcie0 {
> +	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
These references should come before tlmm alphabetically.

Konrad
> +
> +&pcie0_phy {
> +	vdda-phy-supply = <&vreg_l1e_0p88>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&pcie1_phy {
> +	vdda-phy-supply = <&vreg_l3c_0p91>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +	vdda-qref-supply = <&vreg_l1e_0p88>;
> +	status = "okay";
> +};
> +
>   &uart7 {
>   	status = "okay";
>   };
