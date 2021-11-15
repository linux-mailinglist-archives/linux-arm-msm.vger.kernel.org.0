Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27C8451530
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 21:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350890AbhKOU1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 15:27:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350415AbhKOUXs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 15:23:48 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FC01C079782
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 12:11:40 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so28588595otg.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 12:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DnTpN3V7pf+joD5qh4ITq1+EZdAEZtVPtGOOXePkcLQ=;
        b=IN0jBpF9GlP8d27T+5LzU2/AdrYDUqj9FftsV7QDHYobl1bErsLOf8Rb9o2pRiEMYz
         35LEE6+iUMNIVkswnf+GLmDVCiZlx55IDnYKoxcb+4Wt//yd45BpRJ6L7YX5rHlIF0Nl
         ulwhYE9lMWQcE93WL5nWj9/iFnL9xSbtVKJ70UNRpN7vX/L2iIMaSv/Z05JHlXwYj28r
         6CalhJpzjD7lwWq//gcdg0CN3b514j7PtwTiJbc6RHG8XQ4/dRL+TbNFI00i0h/4Pbkl
         9oqAaB9/ab4/op84A3R4wxiC41QcN6uXqfkgGvG+oSXoB1hDx3wIFXEdJYWbu+q3qFJX
         27Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DnTpN3V7pf+joD5qh4ITq1+EZdAEZtVPtGOOXePkcLQ=;
        b=WvLTyQRjET7FwxKFHTB7PG4vWvzfjUBM7Cmwx3S7/+DZZZ8GydeXhmCpEa148fPv4Y
         w8Wk6L/UHIl3Rl1v3UFxaDFL0hpBdYj7HEu3hdomfmgV7YrI3fKZ1zhjMXnvxC+m9boG
         QKLIjTZnMpCHr6IIkW9porVNnFmU0OB/UxLB9cVOT4lRWJqW9+E5Zv9sm//AeVKa+jpY
         q5WO4HoxHEEIIRWfTluVY/re8JG75wuHysrHVAt6gFc/2InxPjWbYVoYWpXjZwj6/2Oo
         AHdMjJWOKyADHhBC2giE+RaPW+I6Qgxt9eZQT3JCz1CmLLI/jh1hPFmpTem/YEGFyRLV
         Ot0Q==
X-Gm-Message-State: AOAM530OcypvvP0rjYzLBYa6TsMFpD52rQbiKAOqN0zCjbG8NFzJpG+c
        oqp1Qwv0Ky4SZZ5WGX360XsuOQ==
X-Google-Smtp-Source: ABdhPJwDHcO1BFEuFFDETnP3C+wXDED5yvMFPiZg845gXJiwCR4MHwdU6Nd4vXCoK4GwOkbs5dEH2Q==
X-Received: by 2002:a05:6830:22d8:: with SMTP id q24mr1373215otc.170.1637007099923;
        Mon, 15 Nov 2021 12:11:39 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w22sm1775175ooc.47.2021.11.15.12.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 12:11:39 -0800 (PST)
Date:   Mon, 15 Nov 2021 14:11:34 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH v5 21/22] arm64/dts: qcom: sm8250: Add dt entries to
 support crypto engine.
Message-ID: <YZK+9pT7tsbkMz9J@builder.lan>
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

Forgot to mention, please double check that the $subject prefix matches
other patches to the file.

Regards,
Bjorn

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
