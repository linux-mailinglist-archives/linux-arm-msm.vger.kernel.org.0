Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4025E17CB37
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2020 03:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgCGChr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Mar 2020 21:37:47 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55080 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbgCGChq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Mar 2020 21:37:46 -0500
Received: by mail-pj1-f66.google.com with SMTP id np16so1825358pjb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Mar 2020 18:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5GIvve0FlG5w469nF3Y4ZvcUMBqV8AQMJnsHfo+5RpQ=;
        b=VWuHF0IgCgP9XrC6GwTCfWsyZSt0Zc7z5qeNlZd0wzcbSldWjHcPAr5tD/WR2YSVzw
         Guv8AfnxNiSi91wFKkMdecGcz3HjAQtSfEbNmdFbJuvKb4PSo8RevMybVt6N/CaeULFQ
         FqItiUp/4V9MV6JMOolq9g8wVrF/9IPql9wDzZq0AtkWqAjo9QjggXEg4qQ9LEq80gRo
         L9hA8wJr2RNOXXHDZ/j/mPkm1odncdCXRAj1X8OWmK1UVDzefTMnUuTR/uWn0TF9jbUA
         jnQqq/jIDqXIJ6QB5nH71BMwXzqwdlfQ7J0Ac2pQncZ5GyYl/t+u/Z5fkL8CZqSgVKKt
         BW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5GIvve0FlG5w469nF3Y4ZvcUMBqV8AQMJnsHfo+5RpQ=;
        b=fN2Ylr9fmuNbrO6FyEQ+/CK1C779QsX2YVNrbNMYBql7MkGEi9tkERZwK/s8VSUyV7
         hlQZP1didpG1oeJk0iybAUsevJlD9VgtdyOiIJY+06vbB2ZfH2tCgvLRwF1U17pK0JLL
         NCm5yEX4UlX4w40IEEiXhFuXCVlyyJvO8DGQy/mfYji5qjvka7HhW56IdUhXN6EWWkoi
         8F/r3xBebNzjZEdKGzHuMn3ZBwXsrGHK5gD4yzO0UxbiR6DmdOKjXBRvFffhtsoilIZy
         t3mppidYyiTpPKYEAvTYxR2hoVpKW/yqzwH35dbnB6q8GOHzYUFJpyYhDwUbujv48x2T
         EuwQ==
X-Gm-Message-State: ANhLgQ26IJWYF20jr6aPg6zTG4DiINTkkTP7/Noo3BRkfAtFEDXidqCK
        8jEc+5ZAPxCwIT5GgLiO55BI1w==
X-Google-Smtp-Source: ADFU+vvLFEFhuvosMbYhjNKBga4ZTxXPoC+oty1ZBNO4A07s0fOMUCbsXcXsf9e0edb1EYMdkt9uhg==
X-Received: by 2002:a17:90a:9b8a:: with SMTP id g10mr6842575pjp.163.1583548665067;
        Fri, 06 Mar 2020 18:37:45 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x12sm27318128pfi.122.2020.03.06.18.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2020 18:37:44 -0800 (PST)
Date:   Fri, 6 Mar 2020 18:37:42 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sdm845: Add ADSP audio support
Message-ID: <20200307023742.GC1094083@builder>
References: <20200305145344.14670-1-srinivas.kandagatla@linaro.org>
 <20200305145344.14670-2-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200305145344.14670-2-srinivas.kandagatla@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 05 Mar 06:53 PST 2020, Srinivas Kandagatla wrote:

> This patch adds support to basic dsp audio, codec, slimbus
> and soundwire controller DT nodes.
> 

I wouldn't be against the idea of splitting this patch in a few...

> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 338 +++++++++++++++++++++++++++
>  1 file changed, 338 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 061f49faab19..705d8a0c3a1e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -20,6 +20,7 @@
>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/soc/qcom,apr.h>

Please keep these sorted alphabetically.

>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -491,6 +492,54 @@
>  			label = "lpass";
>  			qcom,remote-pid = <2>;
>  			mboxes = <&apss_shared 8>;

Please add an empty line here.

> +			apr {
> +				compatible = "qcom,apr-v2";
> +				qcom,glink-channels = "apr_audio_svc";
> +				qcom,apr-domain = <APR_DOMAIN_ADSP>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				qcom,intents = <512 20>;
> +
> +				q6core {

q6core@3

Due to the reg.

> +					reg = <APR_SVC_ADSP_CORE>;
> +					compatible = "qcom,q6core";

Don't we want some qcom,protection-domain properties on these?

> +				};
> +
> +				q6afe: q6afe {

q6afe@4

> +					compatible = "qcom,q6afe";
> +					reg = <APR_SVC_AFE>;
> +					q6afedai: dais {
> +						compatible = "qcom,q6afe-dais";
> +						#address-cells = <1>;
> +						#size-cells = <0>;
> +						#sound-dai-cells = <1>;
> +
> +						qi2s@22 {
> +							reg = <22>;
> +							qcom,sd-lines = <0 1 2 3>;
> +						};
> +					};
> +				};
> +
> +				q6asm: q6asm {

q6asm@7

> +					compatible = "qcom,q6asm";
> +					reg = <APR_SVC_ASM>;
> +					q6asmdai: dais {
> +						compatible = "qcom,q6asm-dais";
> +						#sound-dai-cells = <1>;
> +						iommus = <&apps_smmu 0x1821 0x0>;
> +					};
> +				};
> +
> +				q6adm: q6adm {

q6adm@8

Or perhaps then, as we have a unit address, these could use a generic
name and be on the form:

q6adm: apr-service@8 {

> +					compatible = "qcom,q6adm";
> +					reg = <APR_SVC_ADM>;
> +					q6routing: routing {
> +						compatible = "qcom,q6adm-routing";
> +						#sound-dai-cells = <0>;
> +					};
> +				};
> +			};

Please take the opportunity of adding an empty line here as well.

>  			fastrpc {
>  				compatible = "qcom,fastrpc";
>  				qcom,glink-channels = "fastrpcglink-apps-dsp";
> @@ -513,6 +562,9 @@
>  		};
>  	};
>  
> +	sound: sound {
> +	};
> +
>  	cdsp_pas: remoteproc-cdsp {
>  		compatible = "qcom,sdm845-cdsp-pas";
>  
> @@ -1782,6 +1834,142 @@
>  				};
>  			};
>  
> +			quat_mi2s_sleep: quat_mi2s_sleep {

Are these all board-agnostic or should they live in the board.dts files
instead?

For all of these, please replace _ with - in the node names.

> +				mux {
> +					pins = "gpio58", "gpio59";
> +					function = "gpio";
> +				};
> +
> +				config {
> +					pins = "gpio58", "gpio59";
> +					drive-strength = <2>;   /* 2 mA */
> +					bias-pull-down;         /* PULL DOWN */

Please omit these comments, given that the properties are quite
descriptive already.

> +					input-enable;
> +				};

And you don't need the subnode level these days, i.e. this can be
written as:

			quat_mi2s_sleep: quat-mi2s-sleep {
				pins = "gpio58", "gpio59";
				function = "gpio";
				drive-strength = <2>;
				bias-pull-down;
				input-enable;
			};

> +			};
> +
[..]
> @@ -2602,6 +2843,91 @@
>  			status = "disabled";
>  		};
>  
> +		slim_msm: slim@171c0000 {
> +			compatible = "qcom,slim-ngd-v2.1.0";
> +			reg = <0 0x171c0000 0 0x2C000>;

Please lowercase the digits of the size.

> +			reg-names = "ctrl";

reg-names is not in binding, nor used by driver.

> +			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;

s/0/GIC_SPI/

> +
> +			qcom,apps-ch-pipes = <0x780000>;
> +			qcom,ea-pc = <0x270>;
> +			status = "okay";
> +			dmas =	<&slimbam 3>, <&slimbam 4>,
> +				<&slimbam 5>, <&slimbam 6>;
> +			dma-names = "rx", "tx", "tx2", "rx2";
> +
> +			iommus = <&apps_smmu 0x1806 0x0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			ngd@1 {
> +				reg = <1>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +
> +				wcd9340_ifd: tas-ifd {

@0 given the reg, perhaps codec@0?

> +					compatible = "slim217,250";
> +					reg  = <0 0>;

Out of curiosity, why does ngd@1 have #size-cells = <1>, but then all
codecs have size 0?

> +				};
> +
> +				wcd9340: codec@1{
> +					pinctrl-0 = <&wcd_intr_default>;
> +					pinctrl-names = "default";
> +					compatible = "slim217,250";
> +					reg  = <1 0>;

I do prefer when the nodes start with compatible and then reg...

> +					reset-gpios = <&tlmm 64 0>;
> +					slim-ifc-dev  = <&wcd9340_ifd>;
> +
> +					#sound-dai-cells = <1>;
> +
> +					interrupt-parent = <&tlmm>;
> +					interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;


How about combining the interrupt-parent and interrupts as:
					interrupts-extended = <&tlmm 54 IRQ_TYPE_LEVEL_HIGH>;

> +					interrupt-controller;
> +					#interrupt-cells = <1>;
> +
> +					#clock-cells = <0>;
> +					clock-frequency = <9600000>;
> +					clock-output-names = "mclk";
> +					qcom,micbias1-millivolt = <1800>;
> +					qcom,micbias2-millivolt = <1800>;
> +					qcom,micbias3-millivolt = <1800>;
> +					qcom,micbias4-millivolt = <1800>;
> +
> +					#address-cells = <1>;
> +					#size-cells = <1>;
> +
> +					wcdpinctrl: wcd-pinctrl@42 {

s/wcd-pinctrl/gpio-controller/

> +						compatible = "qcom,wcd9340-gpio";
> +						gpio-controller;
> +						#gpio-cells = <2>;
> +						reg = <0x42 0x2>;
> +					};
> +
> +					swm: swm@c85 {
> +						compatible = "qcom,soundwire-v1.3.0";
> +						reg = <0xc85 0x40>;
> +						interrupt-parent = <&wcd9340>;
> +						interrupts = <20 IRQ_TYPE_EDGE_RISING>;

interrupts-extended?

> +						interrupt-names = "soundwire";

No interrupt-names in binding and driver resolves the interrupt by
index, so you can omit this.

> +
> +						qcom,dout-ports	= <6>;
> +						qcom,din-ports	= <2>;
> +						qcom,ports-sinterval-low =/bits/ 8  <0x07 0x1F 0x3F 0x7 0x1F 0x3F 0x0F 0x0F>;
> +						qcom,ports-offset1 = /bits/ 8 <0x01 0x02 0x0C 0x6 0x12 0x0D 0x07 0x0A >;
> +						qcom,ports-offset2 = /bits/ 8 <0x00 0x00 0x1F 0x00 0x00 0x1F 0x00 0x00>;
> +
> +						#sound-dai-cells = <1>;
> +						clocks = <&wcd9340>;
> +						clock-names = "iface";
> +                                                #address-cells = <2>;
> +                                                #size-cells = <0>;

Odd indentation on these two.

> +
> +

Empty lines?

> +					};
> +				};
> +			};
> +		};
> +
>  		usb_1_hsphy: phy@88e2000 {
>  			compatible = "qcom,sdm845-qusb2-phy";
>  			reg = <0 0x088e2000 0 0x400>;
> @@ -3446,6 +3772,18 @@
>  			};
>  		};
>  
> +		slimbam: bamdma@17184000 {

s/bamdma/dma/

Regards,
Bjorn

> +			compatible = "qcom,bam-v1.7.0";
> +			qcom,controlled-remotely;
> +			reg = <0 0x17184000 0 0x2a000>;
> +			num-channels  = <31>;
> +			interrupts = <0 164 IRQ_TYPE_LEVEL_HIGH>;

s/0/GIC_SPI/

Regards,
Bjorn

> +			#dma-cells = <1>;
> +			qcom,ee = <1>;
> +			qcom,num-ees = <2>;
> +			iommus = <&apps_smmu 0x1806 0x0>;
> +		};
> +
>  		timer@17c90000 {
>  			#address-cells = <2>;
>  			#size-cells = <2>;
> -- 
> 2.21.0
> 
