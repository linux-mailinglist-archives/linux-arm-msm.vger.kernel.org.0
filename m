Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0080A717C4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234672AbjEaJph (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:45:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbjEaJpf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:45:35 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832FC10E
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:45:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f3b9e54338so6601326e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685526331; x=1688118331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0s0TPilQ6DyocR7gonpBzxO0mHl4K2RjVzthKllqVU=;
        b=TKSEtX1nSL7h8losyLJTQiBQ2PLIsGwxi65D/6256ScJdAfCoJ3QeHx3cJqfHopw7z
         wzksK4bN8ARkDREpchy70K50oloTQr3tU8umqyl+2CQge49e3GpVHd2fHTb9xy44KewS
         hGRW+lX8xIT5LY5AG6C6gm3J1ogfOz1v9ptwKn+UF1jNLAIucPeOj7ZCkdcNnhoHoxaK
         oyfdGasGdShx86/ZhRO0Ry2cLtHxmZdJr8EuDVDGCqns32CeRXWVk5Ah0J5g4oKHL+BF
         M1CFhQWLEDlI7z54mm38KCNU/GBiFoeWNNutUU78t0/Z9aOWC+A5cVXUdbM5s1kfJ2+B
         AEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685526331; x=1688118331;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0s0TPilQ6DyocR7gonpBzxO0mHl4K2RjVzthKllqVU=;
        b=Vl6EGPWjBPkS2gIBO9scHMvhZSP9FZZU6gRvJtDS3FliHuoI2lYgAORwVAgmtfRHHv
         3GzCA3di3u+3RdCUQq+kYlEdMiaO+oTbi4SEhkljhdUABiAruVDg93heqFiE8DPeSNPQ
         /qiMftjDM9bp7oHRYPtpxM9nWLnT3fR1xffX7QiH6pKTBKGsX7UChhtch4uFtSUzVbT0
         GjIDWXWEkbL2L8tTFqPdfPaaRGZYq4TOGRzDJOgqcNc40HiC5PiHbyU3rQ017adcyVRx
         6UIGZhvy+px/wy6hrPwFASnt1sNbn2KIIYtpvCzzvxtHNCvaHE5nUo+NZ5CTcVF5qNb5
         PHTA==
X-Gm-Message-State: AC+VfDxwIR+PM6XbIw5oMxEqIJZOyOqb1SHQGzq2JbpcqLY7BazON4s8
        qPXXarR+FIoS4Wr4TkZKc4IG5Q==
X-Google-Smtp-Source: ACHHUZ5fZZ9IbrtxVDFxgLGs5T98+dP+je6FYnIq+0f1cYBbtnTc/Q7NtMlfcQ+VX/2UPrmX+f6/jg==
X-Received: by 2002:a2e:680a:0:b0:2a9:f640:2032 with SMTP id c10-20020a2e680a000000b002a9f6402032mr2058385lja.5.1685526330713;
        Wed, 31 May 2023 02:45:30 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id i21-20020a2e9415000000b002ab3ea4e566sm3221239ljh.58.2023.05.31.02.45.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:45:30 -0700 (PDT)
Message-ID: <28883fc0-b48d-b09d-3e57-4c231615ac1a@linaro.org>
Date:   Wed, 31 May 2023 11:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 12/14] arm64: dts: qcom: sm8250: rename labels for DSI
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
 <20230531011623.3808538-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-13-dmitry.baryshkov@linaro.org>
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
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  52 +++----
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  40 ++---
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 138 +++++++++---------
>  arch/arm64/boot/dts/qcom/sm8250.dtsi          |  36 ++---
>  4 files changed, 133 insertions(+), 133 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index dfcaac266456..9022ad726741 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -535,30 +535,6 @@ &cdsp {
>  	firmware-name = "qcom/sm8250/cdsp.mbn";
>  };
>  
> -&dsi0 {
> -	status = "okay";
> -	vdda-supply = <&vreg_l9a_1p2>;
> -
> -#if 0
Uh-oh, could you take care of this in a separate commit?


But since this just moves things:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

> -	qcom,dual-dsi-mode;
> -	qcom,master-dsi;
> -#endif
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
> -	vdds-supply = <&vreg_l5a_0p88>;
> -};
> -
>  &gmu {
>  	status = "okay";
>  };
> @@ -604,7 +580,7 @@ port@0 {
>  				reg = <0>;
>  
>  				lt9611_a: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> +					remote-endpoint = <&mdss_dsi0_out>;
>  				};
>  			};
>  
> @@ -613,7 +589,7 @@ port@1 {
>  				reg = <1>;
>  
>  				lt9611_b: endpoint {
> -					remote-endpoint = <&dsi1_out>;
> +					remote-endpoint = <&mdss_dsi1_out>;
>  				};
>  			};
>  #endif
> @@ -639,6 +615,30 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l9a_1p2>;
> +
> +#if 0
> +	qcom,dual-dsi-mode;
> +	qcom,master-dsi;
> +#endif
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
> +	vdds-supply = <&vreg_l5a_0p88>;
> +};
> +
>  &pm8150_adc {
>  	xo-therm@4c {
>  		reg = <ADC5_XO_THERM_100K_PU>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 1326c171fe72..cfbc4fc1eba9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -311,25 +311,6 @@ &cdsp_pas {
>  	status = "okay";
>  };
>  
> -&dsi0 {
> -	status = "okay";
> -	vdda-supply = <&vreg_l26a_1p2>;
> -
> -	ports {
> -		port@1 {
> -			endpoint {
> -				remote-endpoint = <&sn65dsi86_in_a>;
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
>  &gcc {
>  	protected-clocks = <GCC_QSPI_CORE_CLK>,
>  			   <GCC_QSPI_CORE_CLK_SRC>,
> @@ -422,7 +403,7 @@ ports {
>  			port@0 {
>  				reg = <0>;
>  				sn65dsi86_in_a: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> +					remote-endpoint = <&mdss_dsi0_out>;
>  				};
>  			};
>  
> @@ -475,6 +456,25 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	status = "okay";
> +	vdda-supply = <&vreg_l26a_1p2>;
> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&sn65dsi86_in_a>;
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
>  &mss_pil {
>  	status = "okay";
>  	firmware-name = "qcom/sdm850/LENOVO/81JL/qcdsp1v2850.mbn", "qcom/sdm850/LENOVO/81JL/qcdsp2850.mbn";
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index eaac00085894..b841ea9192ae 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -470,75 +470,6 @@ &cdsp {
>  	status = "okay";
>  };
>  
> -&dsi0 {
> -	vdda-supply = <&vreg_l9a_1p2>;
> -	qcom,dual-dsi-mode;
> -	qcom,sync-dual-dsi;
> -	qcom,master-dsi;
> -	status = "okay";
> -
> -	display_panel: panel@0 {
> -		reg = <0>;
> -		vddio-supply = <&vreg_l14a_1p88>;
> -		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> -		backlight = <&backlight>;
> -
> -		status = "disabled";
> -
> -		ports {
> -			#address-cells = <1>;
> -			#size-cells = <0>;
> -
> -			port@0 {
> -				reg = <0>;
> -
> -				panel_in_0: endpoint {
> -					remote-endpoint = <&dsi0_out>;
> -				};
> -			};
> -
> -			port@1{
> -				reg = <1>;
> -
> -				panel_in_1: endpoint {
> -					remote-endpoint = <&dsi1_out>;
> -				};
> -			};
> -		};
> -	};
> -};
> -
> -&dsi0_out {
> -	data-lanes = <0 1 2>;
> -	remote-endpoint = <&panel_in_0>;
> -};
> -
> -&dsi0_phy {
> -	vdds-supply = <&vreg_l5a_0p88>;
> -	phy-type = <PHY_TYPE_CPHY>;
> -	status = "okay";
> -};
> -
> -&dsi1 {
> -	vdda-supply = <&vreg_l9a_1p2>;
> -	qcom,dual-dsi-mode;
> -	qcom,sync-dual-dsi;
> -	/* DSI1 is slave, so use DSI0 clocks */
> -	assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> -	status = "okay";
> -};
> -
> -&dsi1_out {
> -	data-lanes = <0 1 2>;
> -	remote-endpoint = <&panel_in_1>;
> -};
> -
> -&dsi1_phy {
> -	vdds-supply = <&vreg_l5a_0p88>;
> -	phy-type = <PHY_TYPE_CPHY>;
> -	status = "okay";
> -};
> -
>  &gmu {
>  	status = "okay";
>  };
> @@ -607,6 +538,75 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l9a_1p2>;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +	qcom,master-dsi;
> +	status = "okay";
> +
> +	display_panel: panel@0 {
> +		reg = <0>;
> +		vddio-supply = <&vreg_l14a_1p88>;
> +		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> +		backlight = <&backlight>;
> +
> +		status = "disabled";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				panel_in_0: endpoint {
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@1{
> +				reg = <1>;
> +
> +				panel_in_1: endpoint {
> +					remote-endpoint = <&mdss_dsi1_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1 2>;
> +	remote-endpoint = <&panel_in_0>;
> +};
> +
> +&mdss_dsi0_phy {
> +	vdds-supply = <&vreg_l5a_0p88>;
> +	phy-type = <PHY_TYPE_CPHY>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi1 {
> +	vdda-supply = <&vreg_l9a_1p2>;
> +	qcom,dual-dsi-mode;
> +	qcom,sync-dual-dsi;
> +	/* DSI1 is slave, so use DSI0 clocks */
> +	assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> +	status = "okay";
> +};
> +
> +&mdss_dsi1_out {
> +	data-lanes = <0 1 2>;
> +	remote-endpoint = <&panel_in_1>;
> +};
> +
> +&mdss_dsi1_phy {
> +	vdds-supply = <&vreg_l5a_0p88>;
> +	phy-type = <PHY_TYPE_CPHY>;
> +	status = "okay";
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index e5c60a6e4074..8cfb951f6a67 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4234,14 +4234,14 @@ ports {
>  					port@0 {
>  						reg = <0>;
>  						dpu_intf1_out: endpoint {
> -							remote-endpoint = <&dsi0_in>;
> +							remote-endpoint = <&mdss_dsi0_in>;
>  						};
>  					};
>  
>  					port@1 {
>  						reg = <1>;
>  						dpu_intf2_out: endpoint {
> -							remote-endpoint = <&dsi1_in>;
> +							remote-endpoint = <&mdss_dsi1_in>;
>  						};
>  					};
>  				};
> @@ -4271,7 +4271,7 @@ opp-460000000 {
>  				};
>  			};
>  
> -			dsi0: dsi@ae94000 {
> +			mdss_dsi0: dsi@ae94000 {
>  				compatible = "qcom,sm8250-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae94000 0 0x400>;
> @@ -4294,12 +4294,12 @@ dsi0: dsi@ae94000 {
>  					      "bus";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> -				assigned-clock-parents = <&dsi0_phy 0>, <&dsi0_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
>  
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SM8250_MMCX>;
>  
> -				phys = <&dsi0_phy>;
> +				phys = <&mdss_dsi0_phy>;
>  
>  				status = "disabled";
>  
> @@ -4312,14 +4312,14 @@ ports {
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
> @@ -4344,7 +4344,7 @@ opp-358000000 {
>  				};
>  			};
>  
> -			dsi0_phy: phy@ae94400 {
> +			mdss_dsi0_phy: phy@ae94400 {
>  				compatible = "qcom,dsi-phy-7nm";
>  				reg = <0 0x0ae94400 0 0x200>,
>  				      <0 0x0ae94600 0 0x280>,
> @@ -4363,7 +4363,7 @@ dsi0_phy: phy@ae94400 {
>  				status = "disabled";
>  			};
>  
> -			dsi1: dsi@ae96000 {
> +			mdss_dsi1: dsi@ae96000 {
>  				compatible = "qcom,sm8250-dsi-ctrl",
>  					     "qcom,mdss-dsi-ctrl";
>  				reg = <0 0x0ae96000 0 0x400>;
> @@ -4386,12 +4386,12 @@ dsi1: dsi@ae96000 {
>  					      "bus";
>  
>  				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>, <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> -				assigned-clock-parents = <&dsi1_phy 0>, <&dsi1_phy 1>;
> +				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
>  
>  				operating-points-v2 = <&dsi_opp_table>;
>  				power-domains = <&rpmhpd SM8250_MMCX>;
>  
> -				phys = <&dsi1_phy>;
> +				phys = <&mdss_dsi1_phy>;
>  
>  				status = "disabled";
>  
> @@ -4404,20 +4404,20 @@ ports {
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
>  				compatible = "qcom,dsi-phy-7nm";
>  				reg = <0 0x0ae96400 0 0x200>,
>  				      <0 0x0ae96600 0 0x280>,
> @@ -4443,10 +4443,10 @@ dispcc: clock-controller@af00000 {
>  			power-domains = <&rpmhpd SM8250_MMCX>;
>  			required-opps = <&rpmhpd_opp_low_svs>;
>  			clocks = <&rpmhcc RPMH_CXO_CLK>,
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
