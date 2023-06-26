Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0642873E177
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Jun 2023 16:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbjFZODN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jun 2023 10:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjFZODM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jun 2023 10:03:12 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D79EBB
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 07:03:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f957a45b10so4160107e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jun 2023 07:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687788190; x=1690380190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1m/nlRm5c6fdBT7+YQ2mB0G4qPCt0O4tNSMeuq4kDLk=;
        b=Ei6sknJvXSvInwdGCOZvucUNOCVsrC3mfPHhf/K/xRpfdItHc0yzfMYvKvSJoCmEbo
         YBlBz2e+l5Hnz2+fnp/woN63kP/6GTBynmxmSu11e/FBUbCSC3wzVK8TRPgKyqk7raPd
         AOZkxJQkmXzik+rxbEVCIrfelwk2sWz9TMD7/nLIdKO1FMUGJ1Q2N9M5cCK18HXf+lVY
         omGv4U12IE/2ceYUz2yDfpxo4X4H98mZGr/O0Pl6jUqqRGPRbkz0yFWUAZQmBMQoFrD5
         siAYS641O/a4DbeX+3egRjpaItz2a6KSLNRKXNwV24Wzu8ZTfd/kcFq40g2lbJnkzGSq
         NQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687788190; x=1690380190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1m/nlRm5c6fdBT7+YQ2mB0G4qPCt0O4tNSMeuq4kDLk=;
        b=MWD5xi4yg44tNd5ZY1IhDmL8uSLVEo6YvHh95rAs49531sdNJmux7AuQJYLANlz54k
         3bRNvV+G/7Pkm3b7IFRDAzKE57bpYh8ZcupB4iqqFv6zaAO0VZcgrk/sNeeQ5XF690KH
         hXmrwRSVYu5hMTiAoP7NIH+wWL1WaC5bKAXAZd1wT8JOTolv4yqacSp2D4Sj/9oQlO7f
         GvZRAL/EoUylo6Jm3Dm1IWq7fQvrrCgTOx6av/XRfsek2XUHH7nIifgCyYD17+T+xj00
         +E+f4/j02mEqwXtDgLkU8K4L52nhute1hndL0I2DEuH7vPL+bkZku8eov1auKNxRfqlo
         PU1Q==
X-Gm-Message-State: AC+VfDzh+/9MvNKaWx2scYG5ahstSRI1xjto0NuzVojiVwGDkzdxD6yO
        bjujcdWZLY1swHvAM5vjj+L9ug==
X-Google-Smtp-Source: ACHHUZ6cONN737o/ck2GH+Mk25HfzskHEesl8nq67BXaUed7vzBHk7VTTrLTYneVAxP2qw4R3GytLg==
X-Received: by 2002:a05:6512:224f:b0:4fb:772a:af17 with SMTP id i15-20020a056512224f00b004fb772aaf17mr1501252lfu.37.1687788189874;
        Mon, 26 Jun 2023 07:03:09 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
        by smtp.gmail.com with ESMTPSA id s3-20020a19ad43000000b004fb745fd232sm548316lfd.30.2023.06.26.07.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 07:03:09 -0700 (PDT)
Message-ID: <fdf09949-a6d2-ac1f-9b2f-804d7b181079@linaro.org>
Date:   Mon, 26 Jun 2023 16:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 22/26] ARM: dts: qcom: msm8960: declare SAW2 regulators
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
 <20230625202547.174647-23-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230625202547.174647-23-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25.06.2023 22:25, Dmitry Baryshkov wrote:
> The SAW2 (SPM and AVS Wrapper) among other things is yet another way to
> handle CPU-related PMIC regulators. Provide a way to control voltage of
> these regulators.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index fa2013388d99..50a5d87e9851 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -227,13 +227,21 @@ acc1: clock-controller@2098000 {
>  		saw0: regulator@2089000 {
>  			compatible = "qcom,saw2";
>  			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
> -			regulator;
> +
> +			saw0_vreg: regulator {
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1300000>;
> +			};
>  		};
>  
>  		saw1: regulator@2099000 {
>  			compatible = "qcom,saw2";
>  			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
> -			regulator;
> +
> +			saw1_vreg: regulator {
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1300000>;
> +			};
>  		};
>  
>  		gsbi5: gsbi@16400000 {
