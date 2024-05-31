Return-Path: <linux-arm-msm+bounces-21358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A53038D6A2D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 21:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F0B9DB20C08
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 19:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 022C27FBBD;
	Fri, 31 May 2024 19:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGRRAnyn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0E0380
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 19:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717185333; cv=none; b=eGCLVGEoPyv59u/W1A6XcsGUHLV1vTppN4g/KlCwWpG+gHC0b4Jr2QznpLcRIlhQl6pwL1P9/EUYVS1zAgP73Fvhd8KsFhT8sazVZ8f15qjldHY+K/+hsCt/qNcYlssPPoXmBj9O+25hHp+mSE2R1/pCnetXWW2uL4yJqiK5n0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717185333; c=relaxed/simple;
	bh=X+W2TzIrXrsijhv99v8qX9im0q8qFS0iVU1HH5EZ9Uk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TNi3mKfAyVKxEUTNF1P63EmehpxCmWMyYaVj545yTvITzjhkIGdLSBmd7nqn8y7yI3vxgbL+snQewZN1fYt8iuYlXtEB7hlh92QoK3Su3K/D8eRTWDfRdWJL9N7n/0pr1fnt2DwjHdJLuFsszsHY37KlYOvn0tNScq/SwFBKOOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGRRAnyn; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52b83225088so1843400e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 May 2024 12:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717185330; x=1717790130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vDm4GFL7/RAcoZja5ASG+bsrJl52LSpMWwgkVjK9dlM=;
        b=EGRRAnynOKkNqHNuGaIXlZ2RqwvsBMz4FFULoHaXJYkcAXflVNCvgNRutYEjQyiZxB
         yDpDVSDZfOw1Fo25oWpvDHQaPaxqw52LxEueF6duovh5esxJ5Qp5lN37waX/vfCVzaoo
         trIqiKKc9aQ+p0BGAnCNwHnJeeLrdou7YQ8ZfFZdo4rBfehQFsBXp4V4PiAF7WfPaOj3
         8YANCjs/KgSUrFb/rQx65oFmNHziHXi3xn4nUam57Cz44KNFBQtpP0U6QA5lzmPWAgTg
         +3S59BNY/riJhiGrRoWN1bxJBbajcMpZoGykZD6EXp/zMFXceTmyaZxNQ0S7CZXyExBS
         IM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717185330; x=1717790130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDm4GFL7/RAcoZja5ASG+bsrJl52LSpMWwgkVjK9dlM=;
        b=sADl3TBbA3+D3Lx190rIiqqqRPoJ9WnCD+jd74ysSUP8jnJLw3OIAGwOU/PS2WtsBA
         ettonKm1+mTtnjJk2h+N9+YSRqGCKH5p/GLdujS3ZQHHJaLTxawinfMU7nxgPhItMRDS
         u5vrCikYHa/Osyw/3XpwMSi6hvMcm75vCG6DZrJYa4MH/XnOOrkYnrenqwr391MEP7rS
         oksjI5QnXfPXLova3DQQzSLQKfZCNa+jhk6Tp1DMDxMd9/5k/DfJtbfEE+ES3U6fLr5M
         DqjuLwl3lrMpyNCjRBU82/YKVYSGD7oUfk5Fy6Y5tSnVC5YkUCKOnJguxH/BtSu2tTbX
         rX4g==
X-Forwarded-Encrypted: i=1; AJvYcCURQ8RtZolMGKk11BnwQJbzynT1DdmQCXh9B8HtuL1nUN9b7F8lVIsH7OEC7ATLZRZohCmx/br4pmsGsE5aCTGTWcpWcB6318CSWx+Uaw==
X-Gm-Message-State: AOJu0YxecHnojVU9y/9dMnJmaCN4zMIDx/B79pBWrYoTXgHQwCt4JcvR
	oXJ/r+9l28GW4v96ChQkAL+s+sdfDgZOW9c5VOEotGJkQoZcVGC2uDrG47JiiY0=
X-Google-Smtp-Source: AGHT+IHXtouAwX7+XSqiud/KH4Qt8bdHoyhHs20i1HvALR/kGNz0/Jitv9ceS0LX3AcIuCNwRck8pg==
X-Received: by 2002:ac2:46f1:0:b0:52b:7c7e:303 with SMTP id 2adb3069b0e04-52b896da828mr1585439e87.49.1717185330369;
        Fri, 31 May 2024 12:55:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d89743sm426201e87.263.2024.05.31.12.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 12:55:30 -0700 (PDT)
Date: Fri, 31 May 2024 22:55:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100: Make the PCIe 6a PHY
 support 4 lanes mode
Message-ID: <myy42ljw4wz4kwxonio5lktlq52uuqmshhg7bql5raau4kh7ol@6w72pm5k2pzm>
References: <20240531-x1e80100-dts-fixes-pcie6a-v1-0-1573ebcae1e8@linaro.org>
 <20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531-x1e80100-dts-fixes-pcie6a-v1-2-1573ebcae1e8@linaro.org>

On Fri, May 31, 2024 at 08:00:32PM +0300, Abel Vesa wrote:
> So the PCIe 6 can be configured in 4-lane mode or 2-lane mode. For
> 4-lane mode, it fetches the lanes provided by PCIe 6b. For 2-lane mode,
> PCIe 6a uses 2 lanes and then PCIe 6b uses the other 2 lanes. Configure
> it in 4-lane mode and then each board can configure it depending on the
> design. Both the QCP and CRD boards, currently upstream, use the 6a for
> NVMe in 4-lane mode. Also, mark the controller as 4-lane as well.
> 
> Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index fe7ca2a73f9d..17e4c5cda22d 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2838,7 +2838,7 @@ pcie6a: pci@1bf8000 {
>  			dma-coherent;
>  
>  			linux,pci-domain = <7>;
> -			num-lanes = <2>;
> +			num-lanes = <4>;
>  
>  			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
> @@ -2903,19 +2903,21 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  		};
>  
>  		pcie6a_phy: phy@1bfc000 {
> -			compatible = "qcom,x1e80100-qmp-gen4x2-pcie-phy";
> -			reg = <0 0x01bfc000 0 0x2000>;
> +			compatible = "qcom,x1e80100-qmp-gen4x4-pcie-phy";
> +			reg = <0 0x01bfc000 0 0x2000>,
> +			      <0 0x01bfe000 0 0x2000>;
>  
>  			clocks = <&gcc GCC_PCIE_6A_PHY_AUX_CLK>,
>  				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
>  				 <&rpmhcc RPMH_CXO_CLK>,
>  				 <&gcc GCC_PCIE_6A_PHY_RCHNG_CLK>,
> -				 <&gcc GCC_PCIE_6A_PIPE_CLK>;
> +				 <&gcc GCC_PCIE_6A_PIPEDIV2_CLK>;
>  			clock-names = "aux",
>  				      "cfg_ahb",
>  				      "ref",
>  				      "rchng",
> -				      "pipe";
> +				      "pipe",
> +				      "pipediv2";

I see 5 clocks and 6 clock-names here.

>  
>  			resets = <&gcc GCC_PCIE_6A_PHY_BCR>,
>  				 <&gcc GCC_PCIE_6A_NOCSR_COM_PHY_BCR>;
> @@ -2927,6 +2929,8 @@ pcie6a_phy: phy@1bfc000 {
>  
>  			power-domains = <&gcc GCC_PCIE_6_PHY_GDSC>;
>  
> +			qcom,4ln-config-sel = <&tcsr 0x1a000 0>;
> +
>  			#clock-cells = <0>;
>  			clock-output-names = "pcie6a_pipe_clk";
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

