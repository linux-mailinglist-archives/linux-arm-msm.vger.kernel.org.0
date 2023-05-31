Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 479B8717C49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235002AbjEaJom (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:44:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234775AbjEaJol (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:44:41 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F647C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:44:38 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f5021faa16so3782740e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685526276; x=1688118276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YtUpdGbtHIsBeeIjbAWftyMkQuDCFyyEEzl7wNajK6Y=;
        b=KN8F6V/8cy1snEi5dRCg6wbkBJ+qVkEW5aydsqb1FnSVOiXHKoGtyqwz4VN+bLSQmI
         /Vu3wdiEhnLO2znAY+Z1MalDovhunuYUTPp7XC7cgDn/cLPHo2ApUH++E6gSGbVOecfi
         Hb95IZ4HwJumI9302JtSbNaLbTPhNyT7+T5Hng8nbOkAWGeh7C3IqVRNFZMn3okdyCqR
         qFHXKDFAF23mwsJq4xwmm/KtIsmIyKB5LbOPExk6F0d7bEQ1N55IrPUnKCIoSfupbpAV
         ZzqaElU18dSxshWDjf+SurUKxSJlCWVPLVUzG0mnqd3DgiH/s64+4Qi3ljGpi/rRHYWN
         jwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526276; x=1688118276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YtUpdGbtHIsBeeIjbAWftyMkQuDCFyyEEzl7wNajK6Y=;
        b=JYCSm5gtfBLt7oGQb5+JZeSdzCJ/cMckcQTjFeXQyVKQi2ph7dmmKxfr+BJsa/T4vZ
         d+G+5Z4vmIaAZjQNBD+tGVw3KcjFqUzWqy/oudpMELC1REsOW4w9c5R7By8sXU6St8dt
         zW9WElMI0aFn8DrOj7xmaHYiOo/ZpjrPoafn83IA3ISTwXLAFR+KTjSuS1N2XCz7WG5f
         paKAb55+LcktWUoUzyy6fsZDKwyQx59MvRgtO/Z48CzXSHdOfc4SzxfhEPrwV9KZnm0c
         H6SDhP/BwK7OGO1WhSzvCNcqEQPz+zCgEw6tWc9VNMgQRn8Z+dI70WuNMkmYJBqetTJ5
         +TWQ==
X-Gm-Message-State: AC+VfDw92kNgGzvxlNq9xOzoW0J2WK2GJ5bqEpZqKi7mn5KYqNjCMH2L
        W8Cfj4NxcbBQ5Z/DZjTZY4C99w==
X-Google-Smtp-Source: ACHHUZ574Rt9+CTXST8L9QW4i5j9dXDvJp74/1+I+dMlfW2SKemr2aCBTmjg4jeMJKCUZdnE74JWIw==
X-Received: by 2002:ac2:4154:0:b0:4f3:b32d:f739 with SMTP id c20-20020ac24154000000b004f3b32df739mr1998075lfi.19.1685526276348;
        Wed, 31 May 2023 02:44:36 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id n14-20020a19550e000000b004f4cabba7ebsm644847lfe.199.2023.05.31.02.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:44:36 -0700 (PDT)
Message-ID: <3f0f5942-4542-b760-d982-2fd57fee1adf@linaro.org>
Date:   Wed, 31 May 2023 11:44:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 11/14] arm64: dts: qcom: sdm845: rename labels for DSI
 nodes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
 <20230531011623.3808538-12-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-12-dmitry.baryshkov@linaro.org>
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



On 31.05.2023 03:16, Dmitry Baryshkov wrote:
> Currently in board files MDSS and DSI nodes stay apart, because labels
> for DSI nodes do not have the mdss_ prefix. It was found that grouping
> all display-related notes is more useful.
> 
> To keep all display-related nodes close in the board files, change DSI
> node labels from dsi_* to mdss_dsi_*.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    | 40 ++++----
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts    | 98 +++++++++----------
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts       | 86 ++++++++--------
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 76 +++++++-------
>  .../boot/dts/qcom/sdm845-shift-axolotl.dts    | 76 +++++++-------
>  .../dts/qcom/sdm845-sony-xperia-tama.dtsi     | 74 +++++++-------
>  .../qcom/sdm845-xiaomi-beryllium-common.dtsi  | 66 ++++++-------
>  .../boot/dts/qcom/sdm845-xiaomi-polaris.dts   | 76 +++++++-------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          | 36 +++----
>  9 files changed, 314 insertions(+), 314 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> index d05c511718df..1ce413263b7f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> @@ -636,25 +636,6 @@ src_pp600_s3c: smps3 {
>  	};
>  };
>  
> -&dsi0 {
> -	status = "okay";
> -	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> -
> -	ports {
> -		port@1 {
> -			endpoint {
> -				remote-endpoint = <&sn65dsi86_in>;
> -				data-lanes = <0 1 2 3>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi0_phy {
> -	status = "okay";
> -	vdds-supply = <&vdda_mipi_dsi0_pll>;
> -};
> -
>  edp_brij_i2c: &i2c3 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> @@ -687,7 +668,7 @@ ports {
>  			port@0 {
>  				reg = <0>;
>  				sn65dsi86_in: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> +					remote-endpoint = <&mdss_dsi0_out>;
>  				};
>  			};
>  
> @@ -767,6 +748,25 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&sn65dsi86_in>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +};
> +
>  /*
>   * Cheza fw does not properly program the GPU aperture to allow the
>   * GPU to update the SMMU pagetables for context switches.  Work
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 4dea2c04b22f..fd183f74c216 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -415,53 +415,6 @@ &cdsp_pas {
>  	firmware-name = "qcom/sdm845/cdsp.mbn";
>  };
>  
> -&dsi0 {
> -	status = "okay";
> -	vdda-supply = <&vreg_l26a_1p2>;
> -
> -	qcom,dual-dsi-mode;
> -	qcom,master-dsi;
> -
> -	ports {
> -		port@1 {
> -			endpoint {
> -				remote-endpoint = <&lt9611_a>;
> -				data-lanes = <0 1 2 3>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi0_phy {
> -	status = "okay";
> -	vdds-supply = <&vreg_l1a_0p875>;
> -};
> -
> -&dsi1 {
> -	vdda-supply = <&vreg_l26a_1p2>;
> -
> -	qcom,dual-dsi-mode;
> -
> -	/* DSI1 is slave, so use DSI0 clocks */
> -	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> -
> -	status = "okay";
> -
> -	ports {
> -		port@1 {
> -			endpoint {
> -				remote-endpoint = <&lt9611_b>;
> -				data-lanes = <0 1 2 3>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi1_phy {
> -	vdds-supply = <&vreg_l1a_0p875>;
> -	status = "okay";
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -517,7 +470,7 @@ port@0 {
>  				reg = <0>;
>  
>  				lt9611_a: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> +					remote-endpoint = <&mdss_dsi0_out>;
>  				};
>  			};
>  
> @@ -525,7 +478,7 @@ port@1 {
>  				reg = <1>;
>  
>  				lt9611_b: endpoint {
> -					remote-endpoint = <&dsi1_out>;
> +					remote-endpoint = <&mdss_dsi1_out>;
>  				};
>  			};
>  
> @@ -556,6 +509,53 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l26a_1p2>;
> +
> +	qcom,dual-dsi-mode;
> +	qcom,master-dsi;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_a>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vreg_l1a_0p875>;
> +};
> +
> +&mdss_dsi1 {
> +	vdda-supply = <&vreg_l26a_1p2>;
> +
> +	qcom,dual-dsi-mode;
> +
> +	/* DSI1 is slave, so use DSI0 clocks */
> +	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> +
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&lt9611_b>;
> +				data-lanes = <0 1 2 3>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi1_phy {
> +	vdds-supply = <&vreg_l1a_0p875>;
> +	status = "okay";
> +};
> +
>  &mss_pil {
>  	status = "okay";
>  	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index d1440b790fa6..b2d4336e764b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -417,7 +417,43 @@ &cdsp_pas {
>  	firmware-name = "qcom/sdm845/cdsp.mdt";
>  };
>  
> -&dsi0 {
> +&gcc {
> +	protected-clocks = <GCC_QSPI_CORE_CLK>,
> +			   <GCC_QSPI_CORE_CLK_SRC>,
> +			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +			   <GCC_LPASS_Q6_AXI_CLK>,
> +			   <GCC_LPASS_SWAY_CLK>;
> +};
> +
> +&gmu {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +
> +	zap-shader {
> +		memory-region = <&gpu_mem>;
> +		firmware-name = "qcom/sdm845/a630_zap.mbn";
> +	};
> +};
> +
> +&i2c10 {
> +	status = "okay";
> +	clock-frequency = <400000>;
> +};
> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vdda_mipi_dsi0_1p2>;
>  
> @@ -448,33 +484,33 @@ ports {
>  			port@0 {
>  				reg = <0>;
>  				truly_in_0: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> +					remote-endpoint = <&mdss_dsi0_out>;
>  				};
>  			};
>  
>  			port@1 {
>  				reg = <1>;
>  				truly_in_1: endpoint {
> -					remote-endpoint = <&dsi1_out>;
> +					remote-endpoint = <&mdss_dsi1_out>;
>  				};
>  			};
>  		};
>  	};
>  };
>  
> -&dsi0_phy {
> +&mdss_dsi0_phy {
>  	status = "okay";
>  	vdds-supply = <&vdda_mipi_dsi0_pll>;
>  };
>  
> -&dsi1 {
> +&mdss_dsi1 {
>  	status = "okay";
>  	vdda-supply = <&vdda_mipi_dsi1_1p2>;
>  
>  	qcom,dual-dsi-mode;
>  
>  	/* DSI1 is slave, so use DSI0 clocks */
> -	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
>  
>  	ports {
>  		port@1 {
> @@ -486,47 +522,11 @@ endpoint {
>  	};
>  };
>  
> -&dsi1_phy {
> +&mdss_dsi1_phy {
>  	status = "okay";
>  	vdds-supply = <&vdda_mipi_dsi1_pll>;
>  };
>  
> -&gcc {
> -	protected-clocks = <GCC_QSPI_CORE_CLK>,
> -			   <GCC_QSPI_CORE_CLK_SRC>,
> -			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> -			   <GCC_LPASS_Q6_AXI_CLK>,
> -			   <GCC_LPASS_SWAY_CLK>;
> -};
> -
> -&gmu {
> -	status = "okay";
> -};
> -
> -&gpu {
> -	status = "okay";
> -
> -	zap-shader {
> -		memory-region = <&gpu_mem>;
> -		firmware-name = "qcom/sdm845/a630_zap.mbn";
> -	};
> -};
> -
> -&i2c10 {
> -	status = "okay";
> -	clock-frequency = <400000>;
> -};
> -
> -&ipa {
> -	qcom,gsi-loader = "self";
> -	memory-region = <&ipa_fw_mem>;
> -	status = "okay";
> -};
> -
> -&mdss {
> -	status = "okay";
> -};
> -
>  &mss_pil {
>  	status = "okay";
>  	firmware-name = "qcom/sdm845/mba.mbn", "qcom/sdm845/modem.mbn";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 5c384345c05d..7b1555af97b8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -336,44 +336,6 @@ &cdsp_pas {
>  	firmware-name = "qcom/sdm845/oneplus6/cdsp.mbn";
>  };
>  
> -&dsi0 {
> -	status = "okay";
> -	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> -
> -	/*
> -	 * Both devices use different panels but all other properties
> -	 * are common. Compatible line is declared in device dts.
> -	 */
> -	display_panel: panel@0 {
> -		status = "disabled";
> -
> -		reg = <0>;
> -
> -		vddio-supply = <&vreg_l14a_1p88>;
> -
> -		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&dsi0_out>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi0_out {
> -	remote-endpoint = <&panel_in>;
> -	data-lanes = <0 1 2 3>;
> -};
> -
> -&dsi0_phy {
> -	status = "okay";
> -	vdds-supply = <&vdda_mipi_dsi0_pll>;
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  				<GCC_QSPI_CORE_CLK_SRC>,
> @@ -452,6 +414,44 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	/*
> +	 * Both devices use different panels but all other properties
> +	 * are common. Compatible line is declared in device dts.
> +	 */
> +	display_panel: panel@0 {
> +		status = "disabled";
> +
> +		reg = <0>;
> +
> +		vddio-supply = <&vreg_l14a_1p88>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_reset_pins &panel_te_pin &panel_esd_pin>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +};
> +
>  /* Modem/wifi */
>  &mss_pil {
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> index 1eaff964b202..91ae5e875d6d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
> @@ -411,44 +411,6 @@ &cdsp_pas {
>  	firmware-name = "qcom/sdm845/axolotl/cdsp.mbn";
>  };
>  
> -&dsi0 {
> -	status = "okay";
> -	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> -
> -	panel@0 {
> -		compatible = "visionox,rm69299-shift";
> -		status = "okay";
> -		reg = <0>;
> -		vdda-supply = <&vreg_l14a_1p88>;
> -		vdd3p3-supply = <&vreg_l28a_3p0>;
> -
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> -
> -		pinctrl-names = "default", "sleep";
> -		pinctrl-0 = <&sde_dsi_active &sde_te_active>;
> -		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend>;
> -
> -		port {
> -			panel_in_0: endpoint {
> -				remote-endpoint = <&dsi0_out>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi0_out {
> -	remote-endpoint = <&panel_in_0>;
> -	data-lanes = <0 1 2 3>;
> -};
> -
> -&dsi0_phy {
> -	status = "okay";
> -	vdds-supply = <&vdda_mipi_dsi0_pll>;
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -505,6 +467,44 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +
> +	panel@0 {
> +		compatible = "visionox,rm69299-shift";
> +		status = "okay";
> +		reg = <0>;
> +		vdda-supply = <&vreg_l14a_1p88>;
> +		vdd3p3-supply = <&vreg_l28a_3p0>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&sde_dsi_active &sde_te_active>;
> +		pinctrl-1 = <&sde_dsi_suspend &sde_te_suspend>;
> +
> +		port {
> +			panel_in_0: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in_0>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +};
> +
>  &mss_pil {
>  	status = "okay";
>  	firmware-name = "qcom/sdm845/axolotl/mba.mbn", "qcom/sdm845/axolotl/modem.mbn";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index 420ffede3e80..3bc187a066ae 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -368,43 +368,6 @@ &cdsp_pas {
>  	status = "okay";
>  };
>  
> -&dsi0 {
> -	vdda-supply = <&vreg_l26a_1p2>;
> -	status = "okay";
> -
> -	panel: panel@0 {
> -		/* The compatible is assigned in device DTs. */
> -		reg = <0>;
> -
> -		backlight = <&pmi8998_wled>;
> -		vddio-supply = <&vreg_l14a_1p8>;
> -		vsp-supply = <&lab>;
> -		vsn-supply = <&ibb>;
> -		panel-reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> -		touch-reset-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> -
> -		pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
> -		pinctrl-1 = <&sde_dsi_sleep &sde_te_active_sleep>;
> -		pinctrl-names = "default", "sleep";
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&dsi0_out>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi0_out {
> -	remote-endpoint = <&panel_in>;
> -	data-lanes = <0 1 2 3>;
> -};
> -
> -&dsi0_phy {
> -	vdds-supply = <&vreg_l1a_0p9>;
> -	status = "okay";
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			<GCC_QSPI_CORE_CLK_SRC>,
> @@ -515,6 +478,43 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l26a_1p2>;
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		/* The compatible is assigned in device DTs. */
> +		reg = <0>;
> +
> +		backlight = <&pmi8998_wled>;
> +		vddio-supply = <&vreg_l14a_1p8>;
> +		vsp-supply = <&lab>;
> +		vsn-supply = <&ibb>;
> +		panel-reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
> +		touch-reset-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&sde_dsi_active &sde_te_active_sleep>;
> +		pinctrl-1 = <&sde_dsi_sleep &sde_te_active_sleep>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l1a_0p9>;
> +	status = "okay";
> +};
> +
>  &pm8998_gpios {
>  	focus_n: focus-n-state {
>  		pins = "gpio2";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> index 5ed975cc6ecb..8bac4b153cc9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
> @@ -223,39 +223,6 @@ &cdsp_pas {
>  	firmware-name = "qcom/sdm845/beryllium/cdsp.mbn";
>  };
>  
> -&dsi0 {
> -	status = "okay";
> -	vdda-supply = <&vreg_l26a_1p2>;
> -
> -	display_panel: panel@0 {
> -		reg = <0>;
> -		vddio-supply = <&vreg_l14a_1p8>;
> -		vddpos-supply = <&lab>;
> -		vddneg-supply = <&ibb>;
> -
> -		backlight = <&pmi8998_wled>;
> -		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> -
> -		status = "disabled";
> -
> -		port {
> -			panel_in_0: endpoint {
> -				remote-endpoint = <&dsi0_out>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi0_out {
> -	remote-endpoint = <&panel_in_0>;
> -	data-lanes = <0 1 2 3>;
> -};
> -
> -&dsi0_phy {
> -	status = "okay";
> -	vdds-supply = <&vreg_l1a_0p875>;
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -298,6 +265,39 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l26a_1p2>;
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +		vddio-supply = <&vreg_l14a_1p8>;
> +		vddpos-supply = <&lab>;
> +		vddneg-supply = <&ibb>;
> +
> +		backlight = <&pmi8998_wled>;
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +		status = "disabled";
> +
> +		port {
> +			panel_in_0: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in_0>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	status = "okay";
> +	vdds-supply = <&vreg_l1a_0p875>;
> +};
> +
>  &mss_pil {
>  	status = "okay";
>  	firmware-name = "qcom/sdm845/beryllium/mba.mbn", "qcom/sdm845/beryllium/modem.mbn";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> index 576f0421824f..6db12abaa88d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> @@ -373,44 +373,6 @@ &cdsp_pas {
>  	status = "okay";
>  };
>  
> -&dsi0 {
> -	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> -	status = "okay";
> -
> -	display_panel: panel@0 {
> -		compatible = "jdi,fhd-nt35596s";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		reg = <0>;
> -
> -		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> -		vddio-supply = <&vreg_l14a_1p8>;
> -		backlight = <&pmi8998_wled>;
> -		vddpos-supply = <&lab>;
> -		vddneg-supply = <&ibb>;
> -
> -		pinctrl-names = "default", "sleep";
> -		pinctrl-0 = <&sde_dsi_active>;
> -		pinctrl-1 = <&sde_dsi_suspend>;
> -
> -		port {
> -			panel_in: endpoint {
> -				remote-endpoint = <&dsi0_out>;
> -			};
> -		};
> -	};
> -};
> -
> -&dsi0_out {
> -	remote-endpoint = <&panel_in>;
> -	data-lanes = <0 1 2 3>;
> -};
> -
> -&dsi0_phy {
> -	vdds-supply = <&vdda_mipi_dsi0_pll>;
> -	status = "okay";
> -};
> -
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  				<GCC_QSPI_CORE_CLK_SRC>,
> @@ -505,6 +467,44 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	vdda-supply = <&vdda_mipi_dsi0_1p2>;
> +	status = "okay";
> +
> +	display_panel: panel@0 {
> +		compatible = "jdi,fhd-nt35596s";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +		vddio-supply = <&vreg_l14a_1p8>;
> +		backlight = <&pmi8998_wled>;
> +		vddpos-supply = <&lab>;
> +		vddneg-supply = <&ibb>;
> +
> +		pinctrl-names = "default", "sleep";
> +		pinctrl-0 = <&sde_dsi_active>;
> +		pinctrl-1 = <&sde_dsi_suspend>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vdda_mipi_dsi0_pll>;
> +	status = "okay";
> +};
> +
>  &mss_pil {
>  	firmware-name = "qcom/sdm845/polaris/mba.mbn", "qcom/sdm845/polaris/modem.mbn";
>  	status = "okay";
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 950305aad44d..29524c25b63d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -4510,14 +4510,14 @@ dpu_intf0_out: endpoint {
>  					port@1 {
>  						reg = <1>;
>  						dpu_intf1_out: endpoint {
> -							remote-endpoint = <&dsi0_in>;
> +							remote-endpoint = <&mdss_dsi0_in>;
>  						};
>  					};
>  
>  					port@2 {
>  						reg = <2>;
>  						dpu_intf2_out: endpoint {
> -							remote-endpoint = <&dsi1_in>;
> +							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
>  				};
> @@ -4617,7 +4617,7 @@ opp-810000000 {
>  				};
>  			};
>  
> -			dsi0: dsi@ae94000 {
> +			mdss_dsi0: dsi@ae94000 {
>  				compatible = "qcom,sdm845-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae94000 0 0x400>;
> @@ -4639,12 +4639,12 @@ dsi0: dsi@ae94000 {
>  					      "iface",
>  					      "bus";
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> -				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
>  
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SDM845_CX>;
>  
> -				phys = <&dsi0_phy>;
> +				phys = <&mdss_dsi0_phy>;
>  
>  				status = "disabled";
>  
> @@ -4657,20 +4657,20 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						dsi0_in: endpoint {
> +						mdss_dsi0_in: endpoint {
>  							remote-endpoint = <&dpu_intf1_out>;
>  						};
>  					};
>  
>  					port@1 {
>  						reg = <1>;
> -						dsi0_out: endpoint {
> +						mdss_dsi0_out: endpoint {
>  						};
>  					};
>  				};
>  			};
>  
> -			dsi0_phy: phy@ae94400 {
> +			mdss_dsi0_phy: phy@ae94400 {
>  				compatible = "qcom,dsi-phy-10nm";
>  				reg = <0 0x0ae94400 0 0x200>,
>  				      <0 0x0ae94600 0 0x280>,
> @@ -4689,7 +4689,7 @@ dsi0_phy: phy@ae94400 {
>  				status = "disabled";
>  			};
>  
> -			dsi1: dsi@ae96000 {
> +			mdss_dsi1: dsi@ae96000 {
>  				compatible = "qcom,sdm845-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae96000 0 0x400>;
> @@ -4711,12 +4711,12 @@ dsi1: dsi@ae96000 {
>  					      "iface",
>  					      "bus";
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> -				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
>  
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SDM845_CX>;
>  
> -				phys = <&dsi1_phy>;
> +				phys = <&mdss_dsi1_phy>;
>  
>  				status = "disabled";
>  
> @@ -4729,20 +4729,20 @@ ports {
>  
>  					port@0 {
>  						reg = <0>;
> -						dsi1_in: endpoint {
> +						mdss_dsi1_in: endpoint {
>  							remote-endpoint = <&dpu_intf2_out>;
>  						};
>  					};
>  
>  					port@1 {
>  						reg = <1>;
> -						dsi1_out: endpoint {
> +						mdss_dsi1_out: endpoint {
>  						};
>  					};
>  				};
>  			};
>  
> -			dsi1_phy: phy@ae96400 {
> +			mdss_dsi1_phy: phy@ae96400 {
>  				compatible = "qcom,dsi-phy-10nm";
>  				reg = <0 0x0ae96400 0 0x200>,
>  				      <0 0x0ae96600 0 0x280>,
> @@ -4904,10 +4904,10 @@ dispcc: clock-controller@af00000 {
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
>  				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
> -				 <&dsi0_phy 0>,
> -				 <&dsi0_phy 1>,
> -				 <&dsi1_phy 0>,
> -				 <&dsi1_phy 1>,
> +				 <&mdss_dsi0_phy 0>,
> +				 <&mdss_dsi0_phy 1>,
> +				 <&mdss_dsi1_phy 0>,
> +				 <&mdss_dsi1_phy 1>,
>  				 <&dp_phy 0>,
>  				 <&dp_phy 1>;
>  			clock-names = "bi_tcxo",
