Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1EC712DCE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 May 2023 21:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbjEZTqN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 15:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjEZTqM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 15:46:12 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A720BB
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:46:11 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4b80bf93aso1230213e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 12:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685130369; x=1687722369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+GTsz5u1wW/FiKtBa8EeOzOAv+pOLAsqX8XjPemiGIE=;
        b=CuMzMw5QCiAQ8Fg9w5cWoaoAIb7FqAJTRFoiXoLpotQYFDZQHFaJwTqQjqz8tBqZaf
         4AZlQ1ZbluRl5T4IaXassjYIxEfMDxiHaUrOGTylWSBvNIpAp8ixlHUMacJ5G+O9DIQX
         XW5iQ8VaHJck3LdvqXVchE0/sNLsU/+UH7TWswuRKW/Eh/PoJsN2iu5u+va1LVJ8eymu
         G5MyAuoUtKzq/u7MZp3lAs+3p/Z3PmsdHFhsZmDquNmiNhRLW/I63cCsdrM91LMGbbyZ
         Zd73CThEbmgwq9wfdXmRg52Ep1wz6Gtgaqc1vm61nlJPuogJZPh26M8sbBNHoL4nL1u3
         YAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130369; x=1687722369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GTsz5u1wW/FiKtBa8EeOzOAv+pOLAsqX8XjPemiGIE=;
        b=gsQN8rmGLQhwwipWN3Iukd3jmTh6azo0QTOuiYay8S3uHxcFCM//TYP/pym+/OnhaZ
         FmEh1FR0odIb4zcEwcDgp55rc0Q9pMRE0FbAnFIZ/pOVfxjaGqZyTbA6YMEFWVhQP/nN
         eimPY7SPxtqADMCkQLSVpRXgN+HtmhxkZvje0U3hNIK4/V5GBCfgqLfXyqJLADjrXgxw
         7qQrOzVAGVBPV23vL8XHqyoz4KUR2IK8T6kw5g/g4jYG1bw9W+FbsTgnuwnCqf00NSIO
         mG1QOJZWxdiBIWkwjUzi0pnpY3O4QWCK9id6JvNE9v6Y4Wk949iDe4ugEWWTdVgg0rXg
         o9Xw==
X-Gm-Message-State: AC+VfDzTnLsEsqChnrLnraQxPoejk0mVmagg+AyqAh43ioHvV/FmNG2j
        jtAYDjA9w5ThiD9/ic9RqrrVkQ==
X-Google-Smtp-Source: ACHHUZ7jAItGZpQxn5hpWSY3sF/IIdRPkF69Ot+D7Syi4ndXBc6xL6fNSRM0U2KahCKxhtRYhrg5Aw==
X-Received: by 2002:ac2:5183:0:b0:4ed:ca3b:40f0 with SMTP id u3-20020ac25183000000b004edca3b40f0mr878426lfi.9.1685130369450;
        Fri, 26 May 2023 12:46:09 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id c22-20020a2e9496000000b002a7853b9339sm887300ljh.119.2023.05.26.12.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:46:08 -0700 (PDT)
Message-ID: <6ca15f25-b4aa-1806-06ef-343c11f8f19a@linaro.org>
Date:   Fri, 26 May 2023 21:46:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/6] arm64: dts: qcom: pmi8998: enable rradc by default
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20230524-pmi8998-charger-dts-v1-0-f9334afc4505@linaro.org>
 <20230524-pmi8998-charger-dts-v1-2-f9334afc4505@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230524-pmi8998-charger-dts-v1-2-f9334afc4505@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.05.2023 19:38, Caleb Connolly wrote:
> There is no need for the RRADC to be disabled by default,
> lets just enable it by default and not clutter up DT.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi         | 4 ----
>  arch/arm64/boot/dts/qcom/pmi8998.dtsi                        | 2 --
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 4 ----
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 4 ----
>  5 files changed, 18 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
> index 062d56c42385..68e634f8212c 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
> @@ -279,10 +279,6 @@ vol_keys_default: vol-keys-state {
>  	};
>  };
>  
> -&pmi8998_rradc {
> -	status = "okay";
> -};
> -
>  &qusb2phy {
>  	status = "okay";
>  
> diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> index ffe587f281d8..be6f60bfc26c 100644
> --- a/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
> @@ -23,8 +23,6 @@ pmi8998_rradc: adc@4500 {
>  			compatible = "qcom,pmi8998-rradc";
>  			reg = <0x4500>;
>  			#io-channel-cells = <1>;
> -
> -			status = "disabled";
>  		};
>  	};
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index e14fe9bbb386..66087af02d74 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -649,10 +649,6 @@ led@5 {
>  	};
>  };
>  
> -&pmi8998_rradc {
> -	status = "okay";
> -};
> -
>  /* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
>  &q6afedai {
>  	dai@22 {
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 5c384345c05d..55ee8dcf27c3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -480,10 +480,6 @@ pinconf {
>  	};
>  };
>  
> -&pmi8998_rradc {
> -	status = "okay";
> -};
> -
>  &q6afedai {
>  	qi2s@22 {
>  		reg = <22>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 5ed975cc6ecb..1915643f1c49 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -346,10 +346,6 @@ &pm8998_resin {
>  	status = "okay";
>  };
>  
> -&pmi8998_rradc {
> -	status = "okay";
> -};
> -
>  /* QUAT I2S Uses 1 I2S SD Line for audio on TAS2559/60 amplifiers */
>  &q6afedai {
>  	dai@22 {
> 
