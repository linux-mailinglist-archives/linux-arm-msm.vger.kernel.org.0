Return-Path: <linux-arm-msm+bounces-52285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3510A6D58B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 08:57:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A6727A41AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 07:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F2EE25D1E4;
	Mon, 24 Mar 2025 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KooJ803R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8F025D1E0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 07:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803006; cv=none; b=f/jXU3DA4MheNCC7hAlH/K5Y1XSTxfJQuZT9gMSUoN2GXQaymqEJWQFA8Pas8GzfiXcnkOkeC9/ATmiDjnEmStM0HTJjfgcgm1OLU+oJMO/AJyuhmCvlXX01gKeQ1vjzYbiW/3YD3BmClnva0367THfzL6mWiEDXBb/GSf3CEfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803006; c=relaxed/simple;
	bh=MowFvwuwEIYlkePI0O2pj7UdeA7plRLewpqYbz31Td8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzFaDowVokGUGP8g+71eS2omnKWEPqkxY5vAjZBU8UeNW3E10rZbwJqb7FZ1tiIt8vYB9j/Am4XkZWRFcvJoqCsKoetCz8F/0Pmn9r1cAAUqaFKizvYABkHZcYfYWjLrWS7OflF1uh7CROVJErMRgXg79SqpZwk+E5aU9nUikoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KooJ803R; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2243803b776so63969115ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 00:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742803004; x=1743407804; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ucovPPIZbMhnnUBesgcZ12lDzz3S1j4cMh54lyRVHno=;
        b=KooJ803RG/3M0wFgxb2v/diJZ3ipeiZ5hwXz0XrbY6uzHJwn/8ipJ05sDpHBKZoWy1
         JeieJvThLYnfkV+L4kO3mSl7NKVMey7GIA/uH8ipJ9mj6SkO1G/iH+fBGdGPLwZePwhg
         NszorGBUvubYvEJgUwRZKj0mTNFeq3wrHCL/S36J57OnI1ScpC+yZzzpqIszBWB6oHlV
         aADahZe/baRfX0wEnidNFC5JTQpGsrvrKJHmPqVvEbI10WCSmU5MNMMHBGAElSorDOe/
         F1m7BAs3u6ytvTY5krjsYWZ1civgClU+FhothVzGXCWJ5W0B3FpTVpYlRsfIVPczxRpk
         mtnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742803004; x=1743407804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ucovPPIZbMhnnUBesgcZ12lDzz3S1j4cMh54lyRVHno=;
        b=NworgIEltzoBClNjK62J0bZaTOl/EI//doC+wjaSp2T3X05lq3kSFS0Bt0fpwvGUsb
         VP44MwP2DyRgoJrf0a6MBS22a3RbgGbz+dLUKYAy+IZL3my0a1TCwYnMZ9LiGiwEKOWx
         3pAc8GVK5FDAbpmro0fnyfIRSknZ+TiffVod3Vb1DHwOGLHmNHxLxW4FdGNDcz8YekZK
         IjF1QgdxxnSPSiUCQmNhf83LuDciXDsoF70My8j4npM26x287FjoCVO/5kU1Vwp605lO
         y+7IAaAJFYZN9h59IzTslSuInQAPS6YEDL1wLvznRRUjwhk90jHpQwaKtkdSYYIDJdT9
         enpQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/oFMXiAQiKmsFCLyD5IIIZT08ksaRPB0ikT7Atd2NH19lfCXxNygs7P4/72kUfHIGkj2SykTzk1mZ+xEl@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwEzjENKvz03NycUjSU5OaxcwLJKaW5FBceOQWMF4jocquT2J
	0C0KW+FTWT+iUfxAHwgk8Ai04HUfLC4QSwYuvEY5pyCgmnyvdaJijPKwBtar5A==
X-Gm-Gg: ASbGnctQOuRYkgwP1O0teCLWCkhO0urJMXI10ikhh9zHhKgD5/0dpbx5WAdGttzjN5B
	E0Jio62re117I7buY6Lqk5QDIYN8wkaKwjajp8V+POo2tHMEmy9R+SYY0SItdMQwZoqPIxNBAH4
	PI/CZFvb010fiSFSE3hPOFJYQVh85q8lc9y6bSKzyu8Dz3tMXv78UoUeN5cj0WcZn1fPF30oW2Z
	Tw/Y3CFbVGU2Zkjhz3pL+m9Q4r7xuCGAaATNknrmLRwsMOKJiDfcPLo7WkbUzo+1aStRGnYRwVF
	16Wb8sjxTix962O3pJ5360cDkuyTl3BlNRIgpW/WhgMvldiWfwT+L1oDJWUHzIp9G4g=
X-Google-Smtp-Source: AGHT+IEgOcZILiKswo2zmluq8e4AdwrjHS4ZAEDQVeVb9xSziePjjxKkYCCAw6aWXllXLfOHqJMcCQ==
X-Received: by 2002:a05:6a21:168e:b0:1f5:709d:e0cb with SMTP id adf61e73a8af0-1fe43437231mr20411659637.39.1742803003855;
        Mon, 24 Mar 2025 00:56:43 -0700 (PDT)
Received: from thinkpad ([220.158.156.91])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390611c950sm7425477b3a.104.2025.03.24.00.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 00:56:43 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:26:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: george.moussalem@outlook.com
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nitheesh Sekar <quic_nsekar@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	20250317100029.881286-2-quic_varada@quicinc.com, Sricharan R <quic_srichara@quicinc.com>
Subject: Re: [PATCH v6 5/6] arm64: dts: qcom: ipq5018: Add PCIe related nodes
Message-ID: <a4n3w62bg6x2iux4z7enu3po56hr5pcavjfmvtzdcwv2w4ptrr@ssvfdrltfg5y>
References: <20250321-ipq5018-pcie-v6-0-b7d659a76205@outlook.com>
 <20250321-ipq5018-pcie-v6-5-b7d659a76205@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321-ipq5018-pcie-v6-5-b7d659a76205@outlook.com>

On Fri, Mar 21, 2025 at 04:14:43PM +0400, George Moussalem via B4 Relay wrote:
> From: Nitheesh Sekar <quic_nsekar@quicinc.com>
> 
> Add phy and controller nodes for a 2-lane Gen2 and

Controller is Gen 3 capable but you are limiting it to Gen 2.

> a 1-lane Gen2 PCIe bus. IPQ5018 has 8 MSI SPI interrupts and
> one global interrupt.
> 
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

One comment below. With that addressed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 234 +++++++++++++++++++++++++++++++++-
>  1 file changed, 232 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 8914f2ef0bc4..d08034b57e80 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -147,6 +147,40 @@ usbphy0: phy@5b000 {
>  			status = "disabled";
>  		};
>  
> +		pcie1_phy: phy@7e000{
> +			compatible = "qcom,ipq5018-uniphy-pcie-phy";
> +			reg = <0x0007e000 0x800>;
> +
> +			clocks = <&gcc GCC_PCIE1_PIPE_CLK>;
> +
> +			resets = <&gcc GCC_PCIE1_PHY_BCR>,
> +				 <&gcc GCC_PCIE1PHY_PHY_BCR>;
> +
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			num-lanes = <1>;
> +
> +			status = "disabled";
> +		};
> +
> +		pcie0_phy: phy@86000{
> +			compatible = "qcom,ipq5018-uniphy-pcie-phy";
> +			reg = <0x00086000 0x800>;
> +
> +			clocks = <&gcc GCC_PCIE0_PIPE_CLK>;
> +
> +			resets = <&gcc GCC_PCIE0_PHY_BCR>,
> +				 <&gcc GCC_PCIE0PHY_PHY_BCR>;
> +
> +			#clock-cells = <0>;
> +			#phy-cells = <0>;
> +
> +			num-lanes = <2>;
> +
> +			status = "disabled";
> +		};
> +
>  		tlmm: pinctrl@1000000 {
>  			compatible = "qcom,ipq5018-tlmm";
>  			reg = <0x01000000 0x300000>;
> @@ -170,8 +204,8 @@ gcc: clock-controller@1800000 {
>  			reg = <0x01800000 0x80000>;
>  			clocks = <&xo_board_clk>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <0>,
>  				 <0>,
>  				 <0>,
> @@ -387,6 +421,202 @@ frame@b128000 {
>  				status = "disabled";
>  			};
>  		};
> +
> +		pcie1: pcie@80000000 {
> +			compatible = "qcom,pcie-ipq5018";
> +			reg = <0x80000000 0xf1d>,
> +			      <0x80000f20 0xa8>,
> +			      <0x80001000 0x1000>,
> +			      <0x00078000 0x3000>,
> +			      <0x80100000 0x1000>,
> +			      <0x0007b000 0x1000>;
> +			reg-names = "dbi",
> +				    "elbi",
> +				    "atu",
> +				    "parf",
> +				    "config",
> +				    "mhi";
> +			device_type = "pci";
> +			linux,pci-domain = <0>;
> +			bus-range = <0x00 0xff>;
> +			num-lanes = <1>;
> +			max-link-speed = <2>;

This still needs some justification. If Qcom folks didn't reply, atleast move
this to board dts with a comment saying that the link is not coming up with
Gen3.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

