Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBAF67E477
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:03:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231841AbjA0MDZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:03:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjA0MCt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:02:49 -0500
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B545822DD7
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:58:08 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id ss4so13000627ejb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wL+J3vKYyO+ixLbcMrHJZAkGHMLmqvXASaXe1XTQm3U=;
        b=QMSVpTkgf9r+mDm9E3i7ygdWPE9SKC2y4h3Zm8g4lXfxjZRBlKAWidCR9K3zgiG/Tt
         KAJD3zo0ZvWCQg8bI3xfKltjqtbENwM5+kG6zjhMpysR8IdrH6DgkoTsAbS5wB93g6yJ
         /uqZDtGkElvBVODdn5W9+jtAjuAG8vjJrio4SMigqLEuv8d0RN8xwPNxrH5lCC4ZXJvx
         7UL+Sw7ia4WK2Zx6M1koiIPJ/2oJkZTy+MSC1B9Lv5ci1ogGDXCfFq07rr651c50jYbW
         NUdTM0699hUCOYvRPjPHSwpNnLHhFs4ITwHy5s/VKVM/gI6pCZ5GaLOOVRM9J+aBUy+u
         7z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wL+J3vKYyO+ixLbcMrHJZAkGHMLmqvXASaXe1XTQm3U=;
        b=5foGUWpFqeyxT+VX1brHGkgq44Iv1cbhueMEhTC4p/oEQ/Y3xKg8/eT+JQx56VI1OR
         5flShtNltS8796ivh4RlzGS7TTKHKuXlgxGbydTC6FfVB6MpyrflT7wUtHO1cPY5WGT6
         6BmOGE2sKC+jhr2g5ssbfryYzK+vGeumR+xOXu8S2CQfrDYDYX5wwj6D/BpEdtZrneB8
         GEvKIZGizAAzAko7XhiQV+ZkGRE9u0Bbq86k5Lzjg0tzJjWTUw1HXdXM/Hr9FS+DpOFl
         m6LJ6U/3yLDVXkWWjLAc+fk2lL1uO+6izU38dkvqjMGeA4n3rbBMZEWsjXI2Nm17xtQd
         Zq6g==
X-Gm-Message-State: AO0yUKXB9PG+AvgSxqhjJznDujRqyxQAdvQRV6ZJW091+U6TZFiIhctV
        +FNvSZaV2ISjmTpmXToYGEyY2g==
X-Google-Smtp-Source: AK7set+5O0OEKgLx5emltDwKFWF/HSBRr9uGsI47Q+WCU1Snfp9lSR9AZtdULnzdcvbTn+wN8GTeYQ==
X-Received: by 2002:a17:907:9725:b0:879:aa55:a908 with SMTP id jg37-20020a170907972500b00879aa55a908mr4375273ejc.12.1674820559822;
        Fri, 27 Jan 2023 03:55:59 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709066d9100b0087856bd9dbbsm2155468ejt.97.2023.01.27.03.55.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:55:59 -0800 (PST)
Message-ID: <d31fe7c5-8e4d-173b-3f59-a00b0302a62b@linaro.org>
Date:   Fri, 27 Jan 2023 12:55:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 06/11] arm64: dts: qcom: sdm845: align RPMh regulator
 nodes with bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
 <20230127114347.235963-6-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230127114347.235963-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.01.2023 12:43, Krzysztof Kozlowski wrote:
> Device node names should be generic and bindings expect certain pattern
> for RPMh regulator nodes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi                  | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts                  | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi              | 6 +++---
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts                     | 6 +++---
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi         | 6 +++---
>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts     | 4 ++--
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts           | 6 +++---
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi       | 6 +++---
>  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 +-
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts          | 6 +++---
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts        | 2 +-
>  arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts            | 2 +-
>  12 files changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index e19178c1ec44..f2b48241d15c 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -339,7 +339,7 @@ flash@0 {
>  
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -621,7 +621,7 @@ src_pp1800_lvs2: lvs2 {
>  		};
>  	};
>  
> -	pm8005-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8005-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 9c9a587ea7a9..0b7940c130af 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -270,7 +270,7 @@ &adsp_pas {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  		vdd-s1-supply = <&vph_pwr>;
> @@ -395,7 +395,7 @@ vreg_lvs2a_1p8: lvs2 {
>  		};
>  	};
>  
> -	pmi8998-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pmi8998-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> index 36f291d4d691..f942c5afea9b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
> @@ -166,7 +166,7 @@ &adsp_pas {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -419,7 +419,7 @@ vreg_lvs2a_1p8: lvs2 {
>  		};
>  	};
>  
> -	pmi8998-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pmi8998-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -433,7 +433,7 @@ vreg_bob: bob {
>  		};
>  	};
>  
> -	pm8005-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8005-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 482f43fe0151..d1440b790fa6 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -117,7 +117,7 @@ &adsp_pas {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -382,7 +382,7 @@ vreg_lvs2a_1p8: lvs2 {
>  		};
>  	};
>  
> -	pmi8998-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pmi8998-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -396,7 +396,7 @@ vreg_bob: bob {
>  		};
>  	};
>  
> -	pm8005-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8005-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 548e34632de2..601f6467146d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -145,7 +145,7 @@ &adsp_pas {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -281,7 +281,7 @@ vreg_l28a_3p0: ldo28 {
>  		};
>  	};
>  
> -	pmi8998-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pmi8998-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -295,7 +295,7 @@ vreg_bob: bob {
>  		};
>  	};
>  
> -	pm8005-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8005-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> index e742c27fe91f..d37a433130b9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
> @@ -73,7 +73,7 @@ memory@a1300000 {
>  
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -332,7 +332,7 @@ vreg_lvs2a_1p8: lvs2 {
>  		};
>  	};
>  
> -	pm8005-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8005-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 5d0509f61fe8..b54e304abf71 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -111,7 +111,7 @@ &adsp_pas {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -376,7 +376,7 @@ vreg_lvs2a_1p8: lvs2 {
>  		};
>  	};
>  
> -	pmi8998-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pmi8998-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -390,7 +390,7 @@ vreg_bob: bob {
>  		};
>  	};
>  
> -	pm8005-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8005-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index 85ff0a0789ea..4984c7496c31 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -99,7 +99,7 @@ ramoops@ffc00000 {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -329,7 +329,7 @@ vreg_lvs2a_1p8: lvs2 {
>  		};
>  	};
>  
> -	pmi8998-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pmi8998-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -340,7 +340,7 @@ src_vreg_bob: bob {
>  		};
>  	};
>  
> -	pm8005-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8005-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 0d19506dc54c..8de01a84f8a0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -124,7 +124,7 @@ &adsp_pas {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> index 40185eda28a8..a08d9c97e414 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> @@ -144,7 +144,7 @@ vreg_s4a_1p8: vreg-s4a-1p8 {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> @@ -344,7 +344,7 @@ vreg_lvs2a_1p8: lvs2 {
>  		};
>  	};
>  
> -	pmi8998-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pmi8998-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -356,7 +356,7 @@ vreg_bob: bob {
>  		};
>  	};
>  
> -	pm8005-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8005-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index e9e960b1ad9f..25f88215986b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -100,7 +100,7 @@ &adsp_pas {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> index eae696f0dbe4..b650fa846d23 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
> @@ -130,7 +130,7 @@ &adsp_pas {
>  };
>  
>  &apps_rsc {
> -	pm8998-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8998-rpmh-regulators";
>  		qcom,pmic-id = "a";
>  
