Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 272AF729E6E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 17:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240734AbjFIP1S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 11:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241799AbjFIP1B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 11:27:01 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072002136
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 08:26:54 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f655293a38so2047895e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686324412; x=1688916412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8h8nvAlYxjt65p34kTEt9z5VacxK7Nqh+ENT3iDotY=;
        b=r7dwKJjomTzS138lHBt4vXtOJxVTBCplyBMk28R3almKAIEJ2NBkoog+qRIlpwewid
         RBvo5MJekgxOQrFUqmjy6nwfeT2gGIqljzXGEjZxPEwJuC4rnhF9KFeVWZ/J6LPoB9qM
         gLSZ0l20sJszC6Obp3MzSsOmf/Y/4l73uklf3B1o448dwmc6XwIQOiFEu6pxfRAb3psK
         SNzMCm2zo5uOQSbJyFUPdFnHr0hE8jJi1zJEXrnnuUSdiaNeGqndCCYH2sxhnFQX9qy0
         TIUVnfOM0oBJ/GrdFMq54k+B2plFO7ib5326+Ga8XG2bcUEaB6DenjPTXI4GhDLP16/O
         E0TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686324412; x=1688916412;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8h8nvAlYxjt65p34kTEt9z5VacxK7Nqh+ENT3iDotY=;
        b=KM5o1v6n3lrlpsLiA5K2yfMOCm+Jhvc3R4o1p30I46LaaKV02ICkPG7y92qoo3cLnf
         m0BIihniLmNuCi/Q50QuUsw88KeO6dn9MsHg7jh/Ve7NVBdswE/n3YeZkZ/Lw8IEF1uI
         MKqUGU05oJek7tjPo3uS0L2RxTDEN/+hdR6kGlfv4oS67N8dQA5OP7TvCN9WZU8clahL
         +NTtW2Jo+axvQjG76C4vAkaaF0+oEP5ZQPymLk1EE+D0f/OGa1ucIm9olQz19dEOF7fB
         60WZ7ilaycEeruYmik+DRJbn4xTZDuZu0oFN2rH3j9VattFKiFmf/6KEhKAW1jIW35DR
         4vPg==
X-Gm-Message-State: AC+VfDyQoO1cLT3qlyPZxQmUcluSG5eWUBRdWVGtS/F1pwPA5Tm92f40
        hKiUwQud/iNUfdYLhjl0dwXcAw==
X-Google-Smtp-Source: ACHHUZ6nfXS3EdrDJ02t1fgKYoivhiWD/EO9yQWbZsiNC/Qxwhtoz2NveBXHLPaML4z3I42Xi/d64g==
X-Received: by 2002:a19:e304:0:b0:4f3:d682:7b1c with SMTP id a4-20020a19e304000000b004f3d6827b1cmr1021019lfh.45.1686324412226;
        Fri, 09 Jun 2023 08:26:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id d17-20020ac25ed1000000b004db508326c0sm575310lfq.90.2023.06.09.08.26.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:26:51 -0700 (PDT)
Message-ID: <0e4b8889-7440-f011-ade2-bc5b415e7b79@linaro.org>
Date:   Fri, 9 Jun 2023 17:26:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 11/12] ARM: dts: qcom: Add rpm-proc node for SMD
 platforms
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v2-0-56a4a00c8260@gerhold.net>
 <20230531-rpm-rproc-v2-11-56a4a00c8260@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v2-11-56a4a00c8260@gerhold.net>
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



On 8.06.2023 09:10, Stephan Gerhold wrote:
> Rather than having the RPM SMD channels as the only child of a dummy
> SMD node, switch to representing the RPM as remoteproc like all the
> other remoteprocs (WCNSS, modem DSP).
> 
> This allows assigning additional subdevices to it like the MPM
> interrupt-controller or rpm-master-stats.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-apq8084.dtsi |  6 ++---
>  arch/arm/boot/dts/qcom-msm8226.dtsi | 38 ++++++++++++++++----------------
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 44 ++++++++++++++++++-------------------
>  3 files changed, 44 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index 8f178bc87e1d..2b1f9d0fb510 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -784,10 +784,10 @@ spmi_bus: spmi@fc4cf000 {
>  		};
>  	};
>  
> -	smd {
> -		compatible = "qcom,smd";
> +	rpm: remoteproc {
> +		compatible = "qcom,apq8084-rpm-proc", "qcom,rpm-proc";
>  
> -		rpm {
> +		smd-edge {
>  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>  			qcom,ipc = <&apcs 8 0>;
>  			qcom,smd-edge = <15>;
> diff --git a/arch/arm/boot/dts/qcom-msm8226.dtsi b/arch/arm/boot/dts/qcom-msm8226.dtsi
> index a3a9162e9c28..a3e8d023d0e6 100644
> --- a/arch/arm/boot/dts/qcom-msm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8226.dtsi
> @@ -53,26 +53,10 @@ pmu {
>  					 IRQ_TYPE_LEVEL_HIGH)>;
>  	};
>  
> -	reserved-memory {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -
> -		smem_region: smem@3000000 {
> -			reg = <0x3000000 0x100000>;
> -			no-map;
> -		};
> -
> -		adsp_region: adsp@dc00000 {
> -			reg = <0x0dc00000 0x1900000>;
> -			no-map;
> -		};
> -	};
> -
> -	smd {
> -		compatible = "qcom,smd";
> +	rpm: remoteproc {
> +		compatible = "qcom,msm8226-rpm-proc", "qcom,rpm-proc";
>  
> -		rpm {
> +		smd-edge {
>  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>  			qcom,ipc = <&apcs 8 0>;
>  			qcom,smd-edge = <15>;
> @@ -120,6 +104,22 @@ rpmpd_opp_super_turbo: opp6 {
>  		};
>  	};
>  
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		smem_region: smem@3000000 {
> +			reg = <0x3000000 0x100000>;
> +			no-map;
> +		};
> +
> +		adsp_region: adsp@dc00000 {
> +			reg = <0x0dc00000 0x1900000>;
> +			no-map;
> +		};
> +	};
> +
>  	smem {
>  		compatible = "qcom,smem";
>  
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index 58e144957c5d..0a5b5ecb5dfa 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -113,6 +113,28 @@ pmu {
>  		interrupts = <GIC_PPI 7 0xf04>;
>  	};
>  
> +	rpm: remoteproc {
> +		compatible = "qcom,msm8974-rpm-proc", "qcom,rpm-proc";
> +
> +		smd-edge {
> +			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> +			qcom,ipc = <&apcs 8 0>;
> +			qcom,smd-edge = <15>;
> +
> +			rpm_requests: rpm-requests {
> +				compatible = "qcom,rpm-msm8974";
> +				qcom,smd-channels = "rpm_requests";
> +
> +				rpmcc: clock-controller {
> +					compatible = "qcom,rpmcc-msm8974", "qcom,rpmcc";
> +					#clock-cells = <1>;
> +					clocks = <&xo_board>;
> +					clock-names = "xo";
> +				};
> +			};
> +		};
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> @@ -293,28 +315,6 @@ wcnss_smsm: wcnss@7 {
>  		};
>  	};
>  
> -	smd {
> -		compatible = "qcom,smd";
> -
> -		rpm {
> -			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
> -			qcom,ipc = <&apcs 8 0>;
> -			qcom,smd-edge = <15>;
> -
> -			rpm_requests: rpm-requests {
> -				compatible = "qcom,rpm-msm8974";
> -				qcom,smd-channels = "rpm_requests";
> -
> -				rpmcc: clock-controller {
> -					compatible = "qcom,rpmcc-msm8974", "qcom,rpmcc";
> -					#clock-cells = <1>;
> -					clocks = <&xo_board>;
> -					clock-names = "xo";
> -				};
> -			};
> -		};
> -	};
> -
>  	soc: soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> 
