Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F3B23D997
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Aug 2020 13:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgHFLEL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Aug 2020 07:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729381AbgHFKgp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Aug 2020 06:36:45 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C32C061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2020 03:26:32 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f193so14277814pfa.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2020 03:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HFQwzbiefbpfbQFLc0zRge0aMRzUuoiJq6/bLA8CABQ=;
        b=z8tydMrbJZmdGu0lb6D8fiATUQOQnZ2LTi3TH8K+kklHy1YxIMA7o18BjoXkNo8SLu
         uDGXiQIhcaweqBHVQaS6UwO954M24jqnaK3oZEE49+ChN0NRBTjvEJttxbrsPVBge/3J
         kX1nJEAklBNWWZXdGZ1fyUiWi9EBasqndrPm2LhFaaI2/uWnnk6n1BAYBZXWeD6MSUww
         d3740yD04zI0BzUmuurGfrH2rXG794yB3fE9/pGbc5eEz3Fmu2wpxjzX5Xi7/6R6g5P3
         g35ZMrhUwug0NSjANrWSnp7LSIfGJAgDOMOdfSRpNmi+jSZoTbCV+bE8Glrk15ra+PVk
         oetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HFQwzbiefbpfbQFLc0zRge0aMRzUuoiJq6/bLA8CABQ=;
        b=lXesqas9AbbckZ/uHFinkJHg4guN7YivVp5H/CcNj+7h9KF5mZRsp/Fm6UKv1uhj3m
         Xf39v8RGoXhMjirkwpXV/5RLdambrqcF4i6j1Ypea/Gd5HpRZifY2dVUzkZkoHRQP5W0
         M/+st5otsZtW0e8J7PawoZRBpVYUsuQUJECsE8TFqPgoU6NwjhoNhLU8B8PXeP/xZBm0
         VgTPK7/jw9J/TSlg4A6BejZ6cErOZfYhWm+FyspCwcOximvaLcUolWk+SKWVUU9G2moP
         8hPwDvwxe1Xai3VbHElwsQ1uG4/fJTiGipuwHTHQSEmWgrW5yIYAeuqphLzzFFgddhsO
         uGqQ==
X-Gm-Message-State: AOAM531hHK/CPcQ1rbud3KBZzG0eY28y2xEMHRbV0Or9ZvQS3HsvZzkD
        oS5T/cFBK1OrE0ee36N5qYuu
X-Google-Smtp-Source: ABdhPJyeuaqpfkpPTZXEXyS2DV+YjRijY6hoRp+ZiREGIm+IZTpaxIeO+Am8BZpkc2kEWk4wH+OEtA==
X-Received: by 2002:a63:c50a:: with SMTP id f10mr6885148pgd.167.1596709591711;
        Thu, 06 Aug 2020 03:26:31 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:594:2f7a:c8c3:17bf:d7ce:f7e2])
        by smtp.gmail.com with ESMTPSA id a18sm6181942pjh.42.2020.08.06.03.26.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Aug 2020 03:26:31 -0700 (PDT)
Date:   Thu, 6 Aug 2020 15:56:23 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sricharan@codeaurora.org
Subject: Re: [PATCH v2 3/3] arm64: dts: Enabled MHI device over PCIe
Message-ID: <20200806102623.GB2406@Mani-XPS-13-9360>
References: <1596706332-12957-1-git-send-email-gokulsri@codeaurora.org>
 <1596706332-12957-4-git-send-email-gokulsri@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596706332-12957-4-git-send-email-gokulsri@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 06, 2020 at 03:02:12PM +0530, Gokul Sriram Palanisamy wrote:
> Enabled MHI device support over PCIe and added memory
> reservation required for MHI enabled QCN9000 PCIe card.
> 

There is no DT support exist for MHI as of now, so this is not going to work.

Thanks,
Mani

> Signed-off-by: Gokul Sriram Palanisamy <gokulsri@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 58 ++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi      |  8 +++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> index 0827055..d201a7b 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
> @@ -24,6 +24,22 @@
>  		device_type = "memory";
>  		reg = <0x0 0x40000000 0x0 0x20000000>;
>  	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		qcn9000_pcie0: memory@50f00000 {
> +			no-map;
> +			reg = <0x0 0x50f00000 0x0 0x03700000>;
> +		};
> +
> +		qcn9000_pcie1: memory@54600000 {
> +			no-map;
> +			reg = <0x0 0x54600000 0x0 0x03700000>;
> +		};
> +	};
>  };
>  
>  &blsp1_spi1 {
> @@ -74,3 +90,45 @@
>  		nand-bus-width = <8>;
>  	};
>  };
> +
> +&pcie0_rp {
> +	status = "ok";
> +
> +	mhi_0: qcom,mhi@0 {
> +		reg = <0 0 0 0 0 >;
> +		qrtr_instance_id = <0x20>;
> +		#address-cells = <0x2>;
> +		#size-cells = <0x2>;
> +
> +		base-addr = <0x50f00000>;
> +		qcom,caldb-addr = <0x53E00000>;
> +		qrtr_node_id = <0x27>;
> +		mhi,max-channels = <30>;
> +		mhi,timeout = <10000>;
> +
> +		pcie0_mhi: pcie0_mhi {
> +			status = "ok";
> +		};
> +	};
> +};
> +
> +&pcie1_rp {
> +	status = "ok";
> +
> +	mhi_1: qcom,mhi@1 {
> +		reg = <0 0 0 0 0 >;
> +		qrtr_instance_id = <0x21>;
> +		#address-cells = <0x2>;
> +		#size-cells = <0x2>;
> +
> +		base-addr = <0x54600000>;
> +		qcom,caldb-addr = <0x57500000>;
> +		qrtr_node_id = <0x28>;
> +		mhi,max-channels = <30>;
> +		mhi,timeout = <10000>;
> +
> +		pcie1_mhi: pcie1_mhi {
> +			status = "ok";
> +		};
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index b651345..eef47c1 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -709,6 +709,10 @@
>  				      "ahb",
>  				      "axi_m_sticky";
>  			status = "disabled";
> +
> +			pcie1_rp: pcie1_rp {
> +				reg = <0 0 0 0 0>;
> +			};
>  		};
>  
>  		pcie0: pci@20000000 {
> @@ -779,6 +783,10 @@
>  				      "axi_m_sticky",
>  				      "axi_s_sticky";
>  			status = "disabled";
> +
> +			pcie0_rp: pcie0_rp {
> +				reg = <0 0 0 0 0>;
> +			};
>  		};
>  
>  		tcsr_q6: syscon@1945000 {
> -- 
> 2.7.4
> 
