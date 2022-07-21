Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E558057D659
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jul 2022 23:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233980AbiGUV6q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jul 2022 17:58:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233956AbiGUV6p (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jul 2022 17:58:45 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A873C936B6
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 14:58:43 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id r14so3416292ljp.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jul 2022 14:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=ruxLzND3PgJ9tqm9kUHYW4Ktbt1QR2XijLIeX7b4Pj4=;
        b=Ft4woQpDqYFAByyBLaLGcAiqGkvQ2SOKJ23bWhY7iB8ej/NSYlvpBCltgEVC48wDdv
         Boo/4ZaQQeSnVs185F/Ts8PbW2b4z1oLp+O/g9GQuSukh9VUaeSIGNyQ9E2rb8tMRNuF
         ihQKzHHOZPxdgwm4EM048n75mnQJRACrYAEvCykaHzCTv7g2lndbj9qwcN9pSPqLsdrP
         J75ZnKBDEXyw7UjSUKzPVKEdy+o3tE2yAleE08t3B5C8zsyEhGP7+P1MR3l4Z4VSiydW
         45xh2Jry76SRc4V1sPnI1OhzlovDK+cl4eObM5QQwJYQUW4cyTip6Qy1Qvg/9eXU8Ckq
         oUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ruxLzND3PgJ9tqm9kUHYW4Ktbt1QR2XijLIeX7b4Pj4=;
        b=RVI3CK8hfO/8eLCaeKPDdivRJ18fg7Vizd8eMEfez7d4fLJl+VF7wSeEQFR7KJJqqo
         fD2wi+Y38zTSxCuoSGJAyaGT6wPoe0QnJqxM6Wk9DlQATZygD9/3FfhPEmhkQu+tPOI6
         VWWvhaSNUckCJliRUUDdLSpJcYnQ1Bo3/FAI9wj7WqLnsg8MN+jbikxUTAIT/1JGEKNL
         jv04eXwRx0mKH4/0Aol5QayGVxrCkAI8ps/Io6BGt5Vil1uBvJ80C0YahAA/kWZwzRT6
         1VOELd6MKYZaKkavwsawT+/u/fcbTNK5pAUEPoV/oQqyCYqXa2iNQIL1ImsizataesR1
         Es5w==
X-Gm-Message-State: AJIora8fEOSSGXK/poBw5fbheX0c2t657rj3OhdK9OKyiTtaoQidMNh7
        QD9Dt6uwRJD1vmtSny3STg9S9g==
X-Google-Smtp-Source: AGRyM1uJA82GHparoFSnxSL6AlG+DnRHBmgFTdZGfW8hLzPeOq9ZpPpd632EiNEE9/zOnZWFcSgDNA==
X-Received: by 2002:a2e:a7cf:0:b0:25d:9fe6:7065 with SMTP id x15-20020a2ea7cf000000b0025d9fe67065mr144905ljp.138.1658440722010;
        Thu, 21 Jul 2022 14:58:42 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n7-20020a05651203e700b00485e55192a3sm674554lfq.72.2022.07.21.14.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 14:58:41 -0700 (PDT)
Message-ID: <a975956c-edbb-861c-e352-8a168e7cb536@linaro.org>
Date:   Fri, 22 Jul 2022 00:58:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: ipq8064: pad addresses to 8 digit
Content-Language: en-GB
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220718153815.29414-1-ansuelsmth@gmail.com>
 <20220718153815.29414-2-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220718153815.29414-2-ansuelsmth@gmail.com>
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

On 18/07/2022 18:38, Christian Marangi wrote:
> Pad reg addresses to 8 digit to make sorting easier.

Please put this patch before the patch 1/2. It makes reviewing easier.
Otherwise:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   arch/arm/boot/dts/qcom-ipq8064.dtsi | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index cf41d330c920..9405d6167b20 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -348,7 +348,7 @@ vsdcc_fixed: vsdcc-regulator {
>   
>   		rpm: rpm@108000 {
>   			compatible = "qcom,rpm-ipq8064";
> -			reg = <0x108000 0x1000>;
> +			reg = <0x00108000 0x1000>;
>   			qcom,ipc = <&l2cc 0x8 2>;
>   
>   			interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>,
> @@ -389,7 +389,7 @@ tsens_calib_backup: calib_backup@410 {
>   
>   		qcom_pinmux: pinmux@800000 {
>   			compatible = "qcom,ipq8064-pinctrl";
> -			reg = <0x800000 0x4000>;
> +			reg = <0x00800000 0x4000>;
>   
>   			gpio-controller;
>   			gpio-ranges = <&qcom_pinmux 0 0 69>;
> @@ -571,7 +571,7 @@ IRQ_TYPE_EDGE_RISING)>,
>   
>   		l2cc: clock-controller@2011000 {
>   			compatible = "qcom,kpss-gcc", "syscon";
> -			reg = <0x2011000 0x1000>;
> +			reg = <0x02011000 0x1000>;
>   			clocks = <&gcc PLL8_VOTE>, <&pxo_board>;
>   			clock-names = "pll8_vote", "pxo";
>   			clock-output-names = "acpu_l2_aux";


-- 
With best wishes
Dmitry
