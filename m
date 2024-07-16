Return-Path: <linux-arm-msm+bounces-26305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57AA9323AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 12:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F569284C0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 10:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A366F1991D6;
	Tue, 16 Jul 2024 10:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NTEDsi9k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0DA198A2A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 10:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721124830; cv=none; b=BlhSH/7n6YqJl8HFRRmWIkzdrvZzdC0L1Tbd5WcS5ce0vs4UycdYbPF05cj9uEc1088+G8DHW7T9YeOkRy4HU9c/bXaYFhq3xYCeS11zasCX3Rv3K7/7kgbtCcx4xbI2KfFqQOP/VCOdJLE4dAZywCal1fE47eGZn8QT+RWSiGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721124830; c=relaxed/simple;
	bh=f8Gky9YqWDCmNh8MKNY9H8sRB+mkfPsGLsY2vGiP7+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4UuigBXxL8y2xYsVesLjzSUgmi87UvzL4DswyV7JUwYhJaNH6jX92+1A+11vNq/SkFwfVDjHAKAILd85/GdwCMYeR5H9J16z1GX2eDcK+ZHuVYGYqDTwrHOPJbVLYQk5mHAspW9yo6bSj9TUIpkWxfLYuVcFgEzbPfbwDeO7mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NTEDsi9k; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-70b0ebd1ef9so3431206b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 03:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721124827; x=1721729627; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g6gMwbuavCbnycNTjRaKx9Abv3DoqBPYUEzkdAtOD14=;
        b=NTEDsi9kYF9duQPxqkOq3Bkr6Vol49BNRWzhV2wsTBiR7MJtBd+1IRNl4jzjrxoUAv
         Ykd5vKc7d+ndCODB7vfiibVcjhTZ6DkOt98lfgDBgb0QTKO1LfpaUmfF/TuD8x7oS9XD
         C+sd80RtqFIrVMON04BADFTBcEywMkjURVrCO4sQf4Sd56oPOTrjirsk+VgyNUI0JvkR
         IjzBRi0FEk4DLGimAtE/KdozIezmWTU0VYTR6nGHDPgafu6qtCrWU8PFPoLIEB6KUqyP
         kLYXTr3nvppS6V/MQ1Simq77QoMT5FvSVNHjjH9E33TIgzc4bmPdoTayW/ZGytsTvTDb
         ddjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721124827; x=1721729627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6gMwbuavCbnycNTjRaKx9Abv3DoqBPYUEzkdAtOD14=;
        b=lMWDO2xlng5NRz6ARrzOTBZZ9Hcl8qAcbL+i7Cp6rQ+UAcVDQ8WUyIf6SqkwZf4+A9
         ngXFsX1hf9rvAzIP3l9IIAIVUNMBYgN7meKzhCOPo6rUg4Ah+LQjZrertI/sqP2YPKjO
         wqb/hLDBV68noBeTfnb+NdutS71zTjqYUVy3s3WcGZX+Nqtiv6Z9SxiHo028XfJNBZ9r
         BfptbAYHZ6kH4zVrQnd/94h6IIX3xKWbXzeCVE91lAMY1vBnni8N6jJ/w6frpny5Vo+v
         PdvdznvLyFWvJgqpM9QVcKMY806KwddxSFXRwezpzig15p/bH6d5x+hWCv6lWr/W7WpK
         diww==
X-Forwarded-Encrypted: i=1; AJvYcCW9yl2CO5dk6Woi7j5P6Dpu2msAVr6Em0maC9LxRM8ErBGK0tbL2pk5SSSvQ4S/1bGzMhzffseGxEOTppfbD59Nb+cOeD5BTB7u6+Kong==
X-Gm-Message-State: AOJu0Yw9jaCzJDNsSk027g0DoCMIp8t5TCYJY2DC4Ph3GJz58VXOXSYM
	VSW9v/jt97ZnVz7NzpjFbUGcrg29wGuOBk2OG42/RfJcEzpgKcymXp3UDAi3wg==
X-Google-Smtp-Source: AGHT+IEDJskFirz6paZGF1HW14iR2GuRPxyEKCS91A1U9kJEn0J3pLh5f3w2w9WhXlu21KxqWnu3BQ==
X-Received: by 2002:a05:6a00:170d:b0:706:6272:417 with SMTP id d2e1a72fcca58-70c1fbd50acmr2120187b3a.10.1721124827058;
        Tue, 16 Jul 2024 03:13:47 -0700 (PDT)
Received: from thinkpad ([220.158.156.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eb9e285sm5915488b3a.8.2024.07.16.03.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 03:13:46 -0700 (PDT)
Date: Tue, 16 Jul 2024 15:43:35 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Patrick Wildt <patrick@blueri.se>
Cc: Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Steev Klimaszewski <steev@kali.org>, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e80100-yoga: add wifi
 calibration variant
Message-ID: <20240716101335.GK3446@thinkpad>
References: <ZpV6o8JUJWg9lZFE@windev.fritz.box>
 <ZpV7OeGNIGGpqNC0@windev.fritz.box>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpV7OeGNIGGpqNC0@windev.fritz.box>

On Mon, Jul 15, 2024 at 09:40:41PM +0200, Patrick Wildt wrote:
> Describe the bus topology for PCIe domain 4 and add the ath12k
> calibration variant so that the board file (calibration data) can be
> loaded.
> 
> Signed-off-by: Patrick Wildt <patrick@blueri.se>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts      |  9 +++++++++
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi                 | 10 ++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index fbff558f5b07..f569f0fbd1fc 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -635,6 +635,15 @@ &pcie4_phy {
>  	status = "okay";
>  };
>  
> +&pcie4_port0 {
> +	wifi@0 {
> +		compatible = "pci17cb,1107";
> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
> +
> +		qcom,ath12k-calibration-variant = "LES790";
> +	};
> +};
> +
>  &pcie6a {
>  	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 7bca5fcd7d52..70eeacd4f9ad 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3085,6 +3085,16 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			phy-names = "pciephy";
>  
>  			status = "disabled";
> +
> +			pcie4_port0: pcie@0 {
> +				device_type = "pci";
> +				reg = <0x0 0x0 0x0 0x0 0x0>;
> +				bus-range = <0x01 0xff>;
> +
> +				#address-cells = <3>;
> +				#size-cells = <2>;
> +				ranges;
> +			};
>  		};
>  
>  		pcie4_phy: phy@1c0e000 {
> -- 
> 2.45.2
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

