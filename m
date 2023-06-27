Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F57673FAFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 13:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbjF0LWI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 07:22:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbjF0LWE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 07:22:04 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA12268D
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:21:58 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6a1245542so33483351fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687864916; x=1690456916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=swfhp5yH0RnjoppI2nMfK+yE4pAadKe2W/xxWZJGHWk=;
        b=QMs5H3LPz7pJc4Kll96ju0g7LmJK7hB5Qzm4OLmXTed5Yxxnr9IA9CIG4VABQzmIgu
         QNx99p7X29VQtMqCYVolJVsRV0znZ9kag+WcP9synekdbHsQjqL5Pt0bkgE0HgyKVHiI
         s4Lx3NyfhA14vEw1w6MznRt0ieGFtdv6afAn0xPZBX3TpPkVifVDfdQM3oBTzsOa7v/y
         kCy3T92LSiwGW73JiC7xbmYZqtS0ToxMcQYJFCX8yBYkk+mO+W0su4H7WKQsGhWYUNCE
         X2jmrsSpXCgXFNieikeaJMAAIxSZTEfQf4G6M9HXnxVimWb0styz2AepuGLE0rd1cN1F
         SV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864916; x=1690456916;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swfhp5yH0RnjoppI2nMfK+yE4pAadKe2W/xxWZJGHWk=;
        b=alwyuez9KLOpc19/rDG73HidrPstV607+pIy8+FOIp5w0QAlx8hjgvEoZ/4pAJwDuK
         ki4TGbb/5yVquDc6EvYTtLo4Y8B2c22xJEG6gg4lLyKLt07e44WW+30/fdPgnCK4b/Ky
         /Znyhcm6Sh4OyLpiNWViGdpaVKp081dgHPsWOrOmFFxkWpZXx8tSxt8JrBEe6hJJkBzo
         xtAwfb2f59AP4jXMn2bI6f9AeWKoYBNtoTwXaUOTaZE12/QUAgMblDaaHMjpky0M90Nq
         FRJoyGiQ5Fbe/rwVXSxYDOx2FiCVSMFTt7XWHB4jKWL5wUvK3scbkcJYfL3Q8Y1UtJhk
         Wl9A==
X-Gm-Message-State: AC+VfDwNcWTy8ptZHRYc6q3KlG1u1n3jbVgVlWmSAzXo7Mi7+NYpQO2l
        p8cPGS57QksJJ+6SglEjjDBpbw==
X-Google-Smtp-Source: ACHHUZ7WSCNa0kRS320C/alTPIABkaRIUtRIkxwk2IaNvUrm7tG2p/IA2CEd++PTyEkUATbfYnt1Uw==
X-Received: by 2002:a2e:9243:0:b0:2b6:a79d:f5ad with SMTP id v3-20020a2e9243000000b002b6a79df5admr2419185ljg.52.1687864916644;
        Tue, 27 Jun 2023 04:21:56 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id s19-20020a2e2c13000000b002b482823f73sm1703999ljs.11.2023.06.27.04.21.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 04:21:56 -0700 (PDT)
Message-ID: <54dd9007-9dc0-6023-bcb9-8be7835f3c5d@linaro.org>
Date:   Tue, 27 Jun 2023 13:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 14/15] ARM: dts: qcom: msm8660: move RPM regulators to
 board files
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
 <20230627012422.206077-15-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627012422.206077-15-dmitry.baryshkov@linaro.org>
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

On 27.06.2023 03:24, Dmitry Baryshkov wrote:
> The set of regulators available over the RPM requests is not a property
> of the SoC. Move them to board files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../dts/qcom/qcom-apq8060-dragonboard.dts     | 141 ++++++++++++------
>  arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts  |  10 ++
>  arch/arm/boot/dts/qcom/qcom-msm8660.dtsi      |  66 --------
>  3 files changed, 102 insertions(+), 115 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
> index 20de516a8deb..8a511f69d800 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dts
> @@ -449,6 +449,8 @@ &rpm {
>  	 * that means
>  	 */
>  	regulators-0 {
> +		compatible = "qcom,rpm-pm8901-regulators";
> +
>  		vdd_l0-supply = <&pm8901_s4>;
>  		vdd_l1-supply = <&vph>;
>  		vdd_l2-supply = <&vph>;
> @@ -466,57 +468,63 @@ regulators-0 {
>  		lvs3_in-supply = <&pm8058_s2>;
>  		mvs_in-supply = <&pm8058_s3>;
>  
> -		l0 {
> +		pm8901_l0: l0 {
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  		};
> -		l1 {
> +
> +		pm8901_l1: l1 {
>  			regulator-min-microvolt = <3300000>;
>  			regulator-max-microvolt = <3300000>;
>  			bias-pull-down;
>  		};
> -		l2 {
> +
> +		pm8901_l2: l2 {
>  			/* TMA340 requires strictly 3.3V */
>  			regulator-min-microvolt = <3300000>;
>  			regulator-max-microvolt = <3300000>;
>  			bias-pull-down;
>  		};
> -		l3 {
> +
> +		pm8901_l3: l3 {
>  			regulator-min-microvolt = <3300000>;
>  			regulator-max-microvolt = <3300000>;
>  			bias-pull-down;
>  		};
> -		l4 {
> +
> +		pm8901_l4: l4 {
>  			regulator-min-microvolt = <2600000>;
>  			regulator-max-microvolt = <2600000>;
>  			bias-pull-down;
>  		};
> -		l5 {
> +
> +		pm8901_l5: l5 {
>  			regulator-min-microvolt = <2850000>;
>  			regulator-max-microvolt = <2850000>;
>  			bias-pull-down;
>  		};
> -		l6 {
> +
> +		pm8901_l6: l6 {
>  			regulator-min-microvolt = <2200000>;
>  			regulator-max-microvolt = <2200000>;
>  			bias-pull-down;
>  		};
>  
>  		/* s0 and s1 are SAW regulators controlled over SPM */
> -		s2 {
> +		pm8901_s2: s2 {
>  			regulator-min-microvolt = <1300000>;
>  			regulator-max-microvolt = <1300000>;
>  			qcom,switch-mode-frequency = <1600000>;
>  			bias-pull-down;
>  		};
> -		s3 {
> +		pm8901_s3: s3 {
>  			regulator-min-microvolt = <1100000>;
>  			regulator-max-microvolt = <1100000>;
>  			qcom,switch-mode-frequency = <1600000>;
>  			bias-pull-down;
>  		};
> -		s4 {
> +		pm8901_s4: s4 {
>  			regulator-min-microvolt = <1225000>;
>  			regulator-max-microvolt = <1225000>;
>  			qcom,switch-mode-frequency = <1600000>;
> @@ -524,17 +532,22 @@ s4 {
>  		};
>  
>  		/* LVS0 thru 3 and mvs are just switches */
> -		lvs0 {
> +		pm8901_lvs0: lvs0 {
>  			regulator-always-on;
>  		};
> -		lvs1 { };
> -		lvs2 { };
> -		lvs3 { };
> -		mvs { };
>  
> +		pm8901_lvs1: lvs1 { };
> +
> +		pm8901_lvs2: lvs2 { };
> +
> +		pm8901_lvs3: lvs3 { };
> +
> +		pm8901_mvs: mvs { };
>  	};
>  
>  	regulators-1 {
> +		compatible = "qcom,rpm-pm8058-regulators";
> +
>  		vdd_l0_l1_lvs-supply = <&pm8058_s3>;
>  		vdd_l2_l11_l12-supply = <&vph>;
>  		vdd_l3_l4_l5-supply = <&vph>;
> @@ -556,144 +569,169 @@ regulators-1 {
>  		vdd_s4-supply = <&vph>;
>  		vdd_ncp-supply = <&vph>;
>  
> -		l0 {
> +		pm8058_l0: l0 {
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  		};
> -		l1 {
> +
> +		pm8058_l1: l1 {
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  		};
> -		l2 {
> +
> +		pm8058_l2: l2 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <2600000>;
>  			bias-pull-down;
>  		};
> -		l3 {
> +
> +		pm8058_l3: l3 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
> -		l4 {
> +
> +		pm8058_l4: l4 {
>  			regulator-min-microvolt = <2850000>;
>  			regulator-max-microvolt = <2850000>;
>  			bias-pull-down;
>  		};
> -		l5 {
> +
> +		pm8058_l5: l5 {
>  			regulator-min-microvolt = <2850000>;
>  			regulator-max-microvolt = <2850000>;
>  			bias-pull-down;
>  		};
> -		l6 {
> +
> +		pm8058_l6: l6 {
>  			regulator-min-microvolt = <3000000>;
>  			regulator-max-microvolt = <3600000>;
>  			bias-pull-down;
>  		};
> -		l7 {
> +
> +		pm8058_l7: l7 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
> -		l8 {
> +
> +		pm8058_l8: l8 {
>  			regulator-min-microvolt = <2900000>;
>  			regulator-max-microvolt = <3050000>;
>  			bias-pull-down;
>  		};
> -		l9 {
> +
> +		pm8058_l9: l9 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
> -		l10 {
> +
> +		pm8058_l10: l10 {
>  			regulator-min-microvolt = <2600000>;
>  			regulator-max-microvolt = <2600000>;
>  			bias-pull-down;
>  		};
> -		l11 {
> +
> +		pm8058_l11: l11 {
>  			regulator-min-microvolt = <1500000>;
>  			regulator-max-microvolt = <1500000>;
>  			bias-pull-down;
>  		};
> -		l12 {
> +
> +		pm8058_l12: l12 {
>  			regulator-min-microvolt = <2900000>;
>  			regulator-max-microvolt = <2900000>;
>  			bias-pull-down;
>  		};
> -		l13 {
> +
> +		pm8058_l13: l13 {
>  			regulator-min-microvolt = <2050000>;
>  			regulator-max-microvolt = <2050000>;
>  			bias-pull-down;
>  		};
> -		l14 {
> +
> +		pm8058_l14: l14 {
>  			regulator-min-microvolt = <2850000>;
>  			regulator-max-microvolt = <2850000>;
>  		};
> -		l15 {
> +
> +		pm8058_l15: l15 {
>  			regulator-min-microvolt = <2850000>;
>  			regulator-max-microvolt = <2850000>;
>  			bias-pull-down;
>  		};
> -		l16 {
> +
> +		pm8058_l16: l16 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  			regulator-always-on;
>  		};
> -		l17 {
> +
> +		pm8058_l17: l17 {
>  			// 1.5V according to schematic
>  			regulator-min-microvolt = <2600000>;
>  			regulator-max-microvolt = <2600000>;
>  			bias-pull-down;
>  		};
> -		l18 {
> +
> +		pm8058_l18: l18 {
>  			regulator-min-microvolt = <2200000>;
>  			regulator-max-microvolt = <2200000>;
>  			bias-pull-down;
>  		};
> -		l19 {
> +
> +		pm8058_l19: l19 {
>  			regulator-min-microvolt = <2500000>;
>  			regulator-max-microvolt = <2500000>;
>  			bias-pull-down;
>  		};
> -		l20 {
> +
> +		pm8058_l20: l20 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
> -		l21 {
> +
> +		pm8058_l21: l21 {
>  			// 1.1 V according to schematic
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  			regulator-always-on;
>  		};
> -		l22 {
> +
> +		pm8058_l22: l22 {
>  			// 1.2 V according to schematic
>  			regulator-min-microvolt = <1150000>;
>  			regulator-max-microvolt = <1150000>;
>  			bias-pull-down;
>  		};
> -		l23 {
> +
> +		pm8058_l23: l23 {
>  			// Unused
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  		};
> -		l24 {
> +
> +		pm8058_l24: l24 {
>  			// Unused
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  		};
> -		l25 {
> +
> +		pm8058_l25: l25 {
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  		};
>  
> -		s0 {
> +		pm8058_s0: s0 {
>  			// regulator-min-microvolt = <500000>;
>  			// regulator-max-microvolt = <1325000>;
>  			regulator-min-microvolt = <1100000>;
> @@ -701,7 +739,8 @@ s0 {
>  			qcom,switch-mode-frequency = <1600000>;
>  			bias-pull-down;
>  		};
> -		s1 {
> +
> +		pm8058_s1: s1 {
>  			// regulator-min-microvolt = <500000>;
>  			// regulator-max-microvolt = <1250000>;
>  			regulator-min-microvolt = <1100000>;
> @@ -709,21 +748,24 @@ s1 {
>  			qcom,switch-mode-frequency = <1600000>;
>  			bias-pull-down;
>  		};
> -		s2 {
> +
> +		pm8058_s2: s2 {
>  			// 1.3 V according to schematic
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1400000>;
>  			qcom,switch-mode-frequency = <1600000>;
>  			bias-pull-down;
>  		};
> -		s3 {
> +
> +		pm8058_s3: s3 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			qcom,switch-mode-frequency = <1600000>;
>  			regulator-always-on;
>  			bias-pull-down;
>  		};
> -		s4 {
> +
> +		pm8058_s4: s4 {
>  			regulator-min-microvolt = <2200000>;
>  			regulator-max-microvolt = <2200000>;
>  			qcom,switch-mode-frequency = <1600000>;
> @@ -732,14 +774,15 @@ s4 {
>  		};
>  
>  		/* LVS0 and LVS1 are just switches */
> -		lvs0 {
> +		pm8058_lvs0: lvs0 {
>  			bias-pull-down;
>  		};
> -		lvs1 {
> +
> +		pm8058_lvs1: lvs1 {
>  			bias-pull-down;
>  		};
>  
> -		ncp {
> +		pm8058_ncp: ncp {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			qcom,switch-mode-frequency = <1600000>;
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
> index 04dca0c93971..43e646ded7bd 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts
> @@ -61,6 +61,16 @@ MATRIX_KEY(5, 4, KEY_MENU)
>  	keypad,num-columns = <5>;
>  };
>  
> +&rpm {
> +	regulators-0 {
> +		compatible = "qcom,rpm-pm8901-regulators";
> +	};
> +
> +	regulators-1 {
> +		compatible = "qcom,rpm-pm8058-regulators";
> +	};
> +};
> +
>  /* eMMC */
>  &sdcc1 {
>  	vmmc-supply = <&vsdcc_fixed>;
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
> index b8094b7c09fc..c2cb3abd5177 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8660.dtsi
> @@ -352,72 +352,6 @@ rpmcc: clock-controller {
>  				clocks = <&pxo_board>;
>  				clock-names = "pxo";
>  			};
> -
> -			regulators-0 {
> -				compatible = "qcom,rpm-pm8901-regulators";
> -
> -				pm8901_l0: l0 {};
> -				pm8901_l1: l1 {};
> -				pm8901_l2: l2 {};
> -				pm8901_l3: l3 {};
> -				pm8901_l4: l4 {};
> -				pm8901_l5: l5 {};
> -				pm8901_l6: l6 {};
> -
> -				/* S0 and S1 Handled as SAW regulators by SPM */
> -				pm8901_s2: s2 {};
> -				pm8901_s3: s3 {};
> -				pm8901_s4: s4 {};
> -
> -				pm8901_lvs0: lvs0 {};
> -				pm8901_lvs1: lvs1 {};
> -				pm8901_lvs2: lvs2 {};
> -				pm8901_lvs3: lvs3 {};
> -
> -				pm8901_mvs: mvs {};
> -			};
> -
> -			regulators-1 {
> -				compatible = "qcom,rpm-pm8058-regulators";
> -
> -				pm8058_l0: l0 {};
> -				pm8058_l1: l1 {};
> -				pm8058_l2: l2 {};
> -				pm8058_l3: l3 {};
> -				pm8058_l4: l4 {};
> -				pm8058_l5: l5 {};
> -				pm8058_l6: l6 {};
> -				pm8058_l7: l7 {};
> -				pm8058_l8: l8 {};
> -				pm8058_l9: l9 {};
> -				pm8058_l10: l10 {};
> -				pm8058_l11: l11 {};
> -				pm8058_l12: l12 {};
> -				pm8058_l13: l13 {};
> -				pm8058_l14: l14 {};
> -				pm8058_l15: l15 {};
> -				pm8058_l16: l16 {};
> -				pm8058_l17: l17 {};
> -				pm8058_l18: l18 {};
> -				pm8058_l19: l19 {};
> -				pm8058_l20: l20 {};
> -				pm8058_l21: l21 {};
> -				pm8058_l22: l22 {};
> -				pm8058_l23: l23 {};
> -				pm8058_l24: l24 {};
> -				pm8058_l25: l25 {};
> -
> -				pm8058_s0: s0 {};
> -				pm8058_s1: s1 {};
> -				pm8058_s2: s2 {};
> -				pm8058_s3: s3 {};
> -				pm8058_s4: s4 {};
> -
> -				pm8058_lvs0: lvs0 {};
> -				pm8058_lvs1: lvs1 {};
> -
> -				pm8058_ncp: ncp {};
> -			};
>  		};
>  
>  		amba {
