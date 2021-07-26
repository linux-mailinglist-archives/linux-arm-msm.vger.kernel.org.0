Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB6F3D5D9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jul 2021 17:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235717AbhGZPCR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 11:02:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235741AbhGZPCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 11:02:12 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A02A3C061765
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 08:42:41 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d1so4819378pll.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 08:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EHunyQVdmyIsCyTs6jyTk2mOp7kQ6TFaQgSnOQTR9xM=;
        b=Nd9B/Ey3g6J47c+7GhXc4H80ghOZzQwDZlzwUnDv8cJfrD7xm7g7l04ftT4rut7ukp
         QsUFVBVDDhTUTIvqde3Er83b9b0Eud7hP4sS/21EeAzKwDVx6hHVMKcvDXa6bVTJWDpT
         7WkW2fk1lFPc5TvkRyLHS7oRgkey5Z1LBUobk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EHunyQVdmyIsCyTs6jyTk2mOp7kQ6TFaQgSnOQTR9xM=;
        b=HqSW8fu9HtwwP9YaKeqK4X1Fogh1gJt6JOAPALztXKXpOad8r4R1rofEwuir1G3Dqf
         stp/uTJMEfGMxRPsZN0A51ZsMs9wYufyHYMeP3O3791EGn6a5bu/Nu6NmsngsPmgPFQl
         sm8WHG/cAf2HKtLoqb9nSv3IFGypQeFif1C6uGkZWnWXEsgfPcW8V3/cB+nkEqWZVL+a
         kOM7nzWQ2QBSAH3VEYn0IlUofgZ6V5fBTibeCQqP3p8EFRkiUHsohE5M5gtTpkCaQwbY
         /a4YI7EHLeesjSFKVVTZZ7q1PALTzdnm455WhEkYCgUhHDkkh5e3j5Ej2FWw+qivuL1+
         HqEQ==
X-Gm-Message-State: AOAM533TnXBO2Ag62MQeESAaLepVlFicgWzwd+PVNp8XUnZmLutBZhTU
        tRuTv4QXh+nad3TMwAGmbmMUHQ==
X-Google-Smtp-Source: ABdhPJy8Zr2JjcRLKwUHLJkgieVtTgbg79KYS2EFnbjMjPkoV7xF8YD65tKiul/99s5pud4A687Hhw==
X-Received: by 2002:a05:6a00:1503:b029:395:f05c:e073 with SMTP id q3-20020a056a001503b0290395f05ce073mr7117267pfu.80.1627314161175;
        Mon, 26 Jul 2021 08:42:41 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:f794:2436:8d25:f451])
        by smtp.gmail.com with UTF8SMTPSA id h30sm363032pfr.191.2021.07.26.08.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jul 2021 08:42:40 -0700 (PDT)
Date:   Mon, 26 Jul 2021 08:42:38 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>
Subject: Re: [PATCH V4 3/4] arm64: dts: sc7280: Update QUPv3 Debug UART DT
 node
Message-ID: <YP7X7kjH9wd818Xg@google.com>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org>
 <1627306847-25308-4-git-send-email-rajpat@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1627306847-25308-4-git-send-email-rajpat@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 26, 2021 at 07:10:46PM +0530, Rajesh Patil wrote:
> From: Roja Rani Yarubandi <rojay@codeaurora.org>
> 
> Update QUPv3 Debug UART DT node with the interconnect names and
> functions for SC7280 SoC.
> 
> Split the Debug UART pin control functions.
> 
> Signed-off-by: Roja Rani Yarubandi <rojay@codeaurora.org>
> Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> ---
> Changes in V4:
>  - As per Bjorn's comment, posting this debug-uart node update
>    as seperate patch
> 
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts | 18 +++++++-----------
>  arch/arm64/boot/dts/qcom/sc7280.dtsi    | 28 ++++++++++++++++++++++++----
>  2 files changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index f63cf51..a50c9e5 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -383,18 +383,14 @@
>  	bias-pull-up;
>  };
>  
> -&qup_uart5_default {
> -	tx {
> -		pins = "gpio46";
> -		drive-strength = <2>;
> -		bias-disable;
> -	};
> +&qup_uart5_tx {
> +	drive-strength = <2>;
> +	bias-disable;
> +};
>  
> -	rx {
> -		pins = "gpio47";
> -		drive-strength = <2>;
> -		bias-pull-up;
> -	};
> +&qup_uart5_rx {
> +	drive-strength = <2>;
> +	bias-pull-up;
>  };
>  
>  &sdc1_on {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 455e58f..951818f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -853,8 +853,13 @@
>  				clock-names = "se";
>  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
>  				pinctrl-names = "default";
> -				pinctrl-0 = <&qup_uart5_default>;
> +				pinctrl-0 = <&qup_uart5_cts>, <&qup_uart5_rts>, <&qup_uart5_tx>, <&qup_uart5_rx>;
>  				interrupts = <GIC_SPI 606 IRQ_TYPE_LEVEL_HIGH>;
> +				power-domains = <&rpmhpd SC7280_CX>;
> +				operating-points-v2 = <&qup_opp_table>;
> +				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
> +						<&gem_noc MASTER_APPSS_PROC 0 &cnoc2 SLAVE_QUP_0 0>;
> +				interconnect-names = "qup-core", "qup-config";


Most of the above should be added by patch '[2/4] arm64: dts: sc7280: Add QUPv3
wrapper_0 nodes'.

I have to say I dislike that the SoC DT file dictates which UART to use for
the serial console. Technically it could be any of them, right? uart5 is
used because that's what the IDP does, and the rest of the world is expected
to follow. Why not configure uart5 as "qcom,geni-uart" by default and
overwrite the compatible string and pinctrl in the board file? You could even
add 'qup-uartN-all' (or similar) pinconfigs to sc7280.dtsi, which would make
the changes in the board file trivial.
