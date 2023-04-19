Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2806A6E77D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Apr 2023 12:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232646AbjDSKyp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 06:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232560AbjDSKyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 06:54:44 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB37125A6
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 03:54:26 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a10so17033472ljr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 03:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681901664; x=1684493664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uuAL0jm9rsRTu3nBp8ODpALFwoK1GSUnFCFSkDU4Izk=;
        b=RvnbJN3oU7a5HdXMPROY8ndyEtLJmgZ5vpdNHaYvNHHEapp4q2kFLNlY26q8rxqQ+Y
         X14lJgqb165CW43hJ8KMVLTXWMiGc8CqLw0LS7ddXBWgOCybc6IZ3w5b8zVGFOLkfhbF
         j1A8f5sI80POMs4Q9pYc3S4fZ1Nq0yEz80Sk41Il7OEVBJpeN5mdc5ykfYOxYX6cuCIX
         h/LCLg4VKxG/8OcLz17mdeUCNzF2OF6ljHZXAugDIrNxZK6xYrINppn6+xgz/vA/6eKi
         MHGgLwc3YKllPWVon+D9vXh6tL1+znJcKQaN7llwComVcfK7sYQv4ckHpJrghqlcU1IW
         OwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681901664; x=1684493664;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uuAL0jm9rsRTu3nBp8ODpALFwoK1GSUnFCFSkDU4Izk=;
        b=flcjnq0Yl7BKawXgdM57SDBW4pIbmgsqP8J+gkwOyscwCdHUNicJFgthSKgiHYWDFe
         axTMC3hgLkbihVTqahkSH+9AnkUEzVXvuYO1zk5mEQHi1CfSoEy3pbJSkVz91jbiIppr
         0cfkvAO5czUXwvVBSp8Zn8nQ9ks9fPHuFD7IzY6ol1+qI4ptHvTkqkVpYzGiS7q1u39s
         FPPiWk7fSGOaLcbrxzcNGs6im+niNPjkV5Cp9rZV4ntmRYWbjHY2NoNbGNGWiOq0qdxO
         xXsAQRcWdpqqhaPoKbbWsYt7wwmlhVl52bju5B71S9NUC/+Z9SEEICe8mp9FCznVFWkY
         E99g==
X-Gm-Message-State: AAQBX9faBIPllt0qHSxlSf40a8CJiNvAKDVOgIjZTgOdk7GKO25RLzGH
        +6uK+sdPeZUOJx3GAZlQMpWaAA==
X-Google-Smtp-Source: AKy350aCEUV4bqY8gNsY4MKlo5sGPeJaHfbdPPJWkUZNLS8clY9FS8jAjv02Yr9FATfDEybbCmOK6w==
X-Received: by 2002:a2e:9bd3:0:b0:2a8:ad87:279d with SMTP id w19-20020a2e9bd3000000b002a8ad87279dmr1722246ljj.34.1681901664513;
        Wed, 19 Apr 2023 03:54:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id i7-20020a2e8647000000b00290b375a068sm2899393ljj.39.2023.04.19.03.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 03:54:24 -0700 (PDT)
Message-ID: <fa84facd-9b13-388f-5f22-a287f7aa403f@linaro.org>
Date:   Wed, 19 Apr 2023 12:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: ipq9574: Drop
 bias_pll_ubi_nc_clk & update intc node
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
References: <20230417053355.25691-1-quic_devipriy@quicinc.com>
 <20230417053355.25691-4-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230417053355.25691-4-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 17.04.2023 07:33, Devi Priya wrote:
> Drop the unused backup source bias_pll_ubi_nc_clk.
> Also, update the size of GICC and GICV region to 8kB and add target CPU
> encoding.
These things have too big and too distant consequences to go in
a single patch and the GIC fix should have a fixes tag.

> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index 3bb7435f5e7f..f1f959b43180 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -16,12 +16,6 @@
>  	#size-cells = <2>;
>  
>  	clocks {
> -		bias_pll_ubi_nc_clk: bias-pll-ubi-nc-clk {
> -			compatible = "fixed-clock";
> -			clock-frequency = <353000000>;
> -			#clock-cells = <0>;
> -		};
> -
>  		sleep_clk: sleep-clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> @@ -131,7 +125,6 @@
>  			reg = <0x01800000 0x80000>;
>  			clocks = <&xo_board_clk>,
>  				 <&sleep_clk>,
> -				 <&bias_pll_ubi_nc_clk>,
NAK, this is an ABI break. If you want to drop it, you'd need
to leave a <0> here.

Konrad
>  				 <0>,
>  				 <0>,
>  				 <0>,
> @@ -172,14 +165,14 @@
>  		intc: interrupt-controller@b000000 {
>  			compatible = "qcom,msm-qgic2";
>  			reg = <0x0b000000 0x1000>,  /* GICD */
> -			      <0x0b002000 0x1000>,  /* GICC */
> +			      <0x0b002000 0x2000>,  /* GICC */
>  			      <0x0b001000 0x1000>,  /* GICH */
> -			      <0x0b004000 0x1000>;  /* GICV */
> +			      <0x0b004000 0x2000>;  /* GICV */
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			interrupt-controller;
>  			#interrupt-cells = <3>;
> -			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>  			ranges = <0 0x0b00c000 0x3000>;
>  
>  			v2m0: v2m@0 {
