Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10874451E3E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 01:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352431AbhKPAfa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 19:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344527AbhKOTY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 14:24:56 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29DDCC05D6E3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 10:34:14 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id r26so36692107oiw.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 10:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JwKaMGX//1jqQPgDQEKIqD6sj+mcxEeOUNB16V+QNig=;
        b=DFT6UQaUnkLeIQWICHLYL168uKkR+5z/D503YvheavNu5LiGXarxG6M4vUb/yuUeFD
         wBeAd1dgB4RTBrkHKWNx5vHplM5nGYRvGK6EK2v8gYF/BgYKF5TAeSn9oTYU2G9Rg6ry
         z2c4r2xISK/Vtm2nhmfSxW68yTnYiaYpGTGqkDNwXAqZgA8XmgltvNZukUt+9DrFjMuD
         r73Q4hkk7eD/v5RIcYrP/VSaMyRINws5XEqPvF3FmAvUzyfwJb0zkbwxkf2cMnq2YAGs
         CGRKPgVnuTvg6vm0+59+1YVaYaJ+91+pWkyulqApmmQzKhQUNbWlmiqQm3Q0bV+wPvMf
         llQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JwKaMGX//1jqQPgDQEKIqD6sj+mcxEeOUNB16V+QNig=;
        b=GvByIQr5VZ22Tj9/7N573gyz34/7HGCnmwPpOTDTIfkOJ6Bz3yeXiMGGEUOKr8U1cn
         gc+xqscpdbjya5eYKKD3+MBiqvHJyBDHwaMrAjV6BNWqGRE0++qp207t0RsHArd381Sr
         aog1ZQoKtpQTVMmOVwkQSmRnxfHcXbeEKxVrPUJK/jnbxv4pk3jd33a9+xkwVN/J52sL
         pZiEKE87yQGfiH2LxtMlFDTLwhi18h68YkL62qOoOXBaojJWN4Ve6ScqKkBq7S+7AUH2
         dnXbgnc3D7fDs6Fr2AWI6r+v4wf2eqvj46Z3qmpI2M4EIqq7IZ5DdNPYwyQD7pgCi1kl
         bhKg==
X-Gm-Message-State: AOAM532B/G+76VourE1avTdPau4lZKPChVNQroGbG0G1klJWP0oJIwE7
        tl264t+AOmUcE0TXO+4wQ+Y65w==
X-Google-Smtp-Source: ABdhPJxgGwtHSE6Ow+bkBcfir6vTaVoPAfAiPVhu0Xx/3q9Ecwchi5RX5V5eKCac1+SsR9K0YPHcGQ==
X-Received: by 2002:a54:4f1d:: with SMTP id e29mr47401177oiy.179.1637001253519;
        Mon, 15 Nov 2021 10:34:13 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o2sm2821311oik.11.2021.11.15.10.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 10:34:13 -0800 (PST)
Date:   Mon, 15 Nov 2021 12:34:08 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH v5 21/22] arm64/dts: qcom: sm8250: Add dt entries to
 support crypto engine.
Message-ID: <YZKoIA7kPHDaFoQK@builder.lan>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-22-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110105922.217895-22-bhupesh.sharma@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Nov 04:59 CST 2021, Bhupesh Sharma wrote:

> Add crypto engine (CE) and CE BAM related nodes and definitions to
> "sm8250.dtsi".
> 
> Cc: Thara Gopinath <thara.gopinath@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 6f6129b39c9c..691c28066cec 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4104,6 +4104,34 @@ cpufreq_hw: cpufreq@18591000 {
>  
>  			#freq-domain-cells = <1>;
>  		};
> +
> +		cryptobam: dma-controller@1dc4000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0 0x01dc4000 0 0x24000>;

Please keep nodes under /soc sorted by address.

Thanks,
Bjorn

> +			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			iommus = <&apps_smmu 0x584 0x0011>,
> +				 <&apps_smmu 0x586 0x0011>,
> +				 <&apps_smmu 0x594 0x0011>,
> +				 <&apps_smmu 0x596 0x0011>;
> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
> +			interconnect-names = "memory";
> +		};
> +
> +		crypto: crypto@1dfa000 {
> +			compatible = "qcom,sm8250-qce";
> +			reg = <0 0x01dfa000 0 0x6000>;
> +			dmas = <&cryptobam 4>, <&cryptobam 5>;
> +			dma-names = "rx", "tx";
> +			iommus = <&apps_smmu 0x584 0x0011>,
> +				 <&apps_smmu 0x586 0x0011>,
> +				 <&apps_smmu 0x594 0x0011>,
> +				 <&apps_smmu 0x596 0x0011>;
> +			interconnects = <&aggre2_noc MASTER_CRYPTO_CORE_0 &mc_virt SLAVE_EBI_CH0>;
> +			interconnect-names = "memory";
> +		};
>  	};
>  
>  	timer {
> -- 
> 2.31.1
> 
