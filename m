Return-Path: <linux-arm-msm+bounces-51665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62516A66962
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 06:30:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4D0D1759CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 05:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE091CCB21;
	Tue, 18 Mar 2025 05:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OTPYGDSP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534931ADC90
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 05:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742275848; cv=none; b=M2Df2IDqczMlsjwfzO7FifzwSc1mAe/rmcEs8+nGoyhWvcOSshkXxn8N7w9D2XlroCyZVwEUzvFO33tpQUqItDCJCCOMBJpSdQMEtvVVvHK6BGKPCLdMs/ry9A5VntnJw7GbMjGF4O/SvY1JIGBztzoCRm72hRMUtEHGsn0UlB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742275848; c=relaxed/simple;
	bh=FM8tOSiWZN6ldhIz1/RdvJxSRCOBEVALQYCx8ILxKVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTOdT7fsCdwA/1NI84A57a7NEkj2OpbJNZp6VnzDDunqJFgI30bTR9qNlqCRXIOeJqO+5Tlt/nC6wOc7LPgRPyWgCdlX1KisB9BZnJ1UdLeHLB1mjcWWS9wx+9DWtCbalf62ITzvf9U8ar2qLwbqhKNFfzEoyW2AcPtA3WmgSbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OTPYGDSP; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22622ddcc35so30029535ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 22:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742275846; x=1742880646; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vVrlX5/yKFewVW4DNtsi/TcZgSdsi6s244vHzJco34Q=;
        b=OTPYGDSPuJcHCpdTTYvM2a8a1E0/0KwwgJmxisPzpXfqmDaf5VMeC+MeWQfEwfVVn2
         P1mHRPT0TPQJhgH5IvmMTnN9sIQ18jhmDTzXnhvUG4glBNVxbgeaPy1SWpQIlBXkC26k
         HBg0XHRRMFxOtXJoNIJPZJXVake1c9Zn2/P9d+uCyb8BYMibT/SeDWs+I0JP8/67y778
         jKgDf9MV2wBon06Tc1hNYZ/n28L91hckW3Bhp+PVQylcoy4iVdLKVkcYni/ah35eGAX3
         Yn2lD6XKjNF1Jx5hubcGLYQZmiHJI4HI8bHBCS2rKd7cGdoPI8D1cWFJrfyV673hfs/j
         tQHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742275846; x=1742880646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vVrlX5/yKFewVW4DNtsi/TcZgSdsi6s244vHzJco34Q=;
        b=W3zaNRs972ph6UoersNgGREWnnLLkzWVxx7MS9JcRHyH/+MFAx/fwPxT5i+SLJ8EGL
         lY4EbYEgPGfpHjE10q4IG80vqJTTIIWa9QTIWf7+gzPArveIHtEkoi/IQUjCr9onPRDq
         qutncYl+D2TgrC3LS51eq614NImX/ZLe1u4NyNlyCttjbAF+tyXPRj/xLVHzEYfyulZa
         3adNMhQQ57hxsBeB69P8zVuGdosUa9EvY50YBA01mvVYV2dHVEIgxQbBlnEKM5HDshoY
         GG+dAce/l2LbJeMQndmgXsEddBDc6Sa4Wc3OPUVfM2DzPZsAZtW7l76CRlC4DGfzbxw9
         2L4g==
X-Forwarded-Encrypted: i=1; AJvYcCWWiPqNh5cMZGT492QgXhgMViIRXo8Fb/9um5p0nZ7LpXeWlxbxHL3RgdqNS6UVjnKGY+8jhwp5y4RIGORT@vger.kernel.org
X-Gm-Message-State: AOJu0YxAGUiVz7qQhBg9uFRbnK+iISiuvCV7rizw/ByRcfKEUNUOr5ZI
	U7SP/HdcuCGiUGw6WexY/dC8uWq47buIsFXjx4gNGZn4IOzHPdONJI1VTs57nA==
X-Gm-Gg: ASbGnctJL89zgo/zovFJJWEzTCjx25XNHOP9zL/xufMKmd4xxkumGhklx2fFM1g/B3S
	S9aJErU8vy2KRe6e38AUIOZtosWdImN8Dfh8FdC0vp/o0UQqW3ovw/IjUeqvJ64lDz0ep1XCizh
	ufKMw66JmNpXOaaFsPKb573PGp/hqKKK9eglkALSKaX9+ElmoMhuUTSzmMLG8kQH2aXPAWLdDgI
	RRyq6qeSEcBMWXKI9v8dhNLMqVkkkaGxG+ShvqcLkDmCEXXvYG19VcUBlZN233VbW3wwbBfF/Vh
	H8D+aGbb2RYvsCkehRT1mAoOmX1vTmhNEyhfTPPgNHrh+Bnkb533Kul6GfSihV/6A/U=
X-Google-Smtp-Source: AGHT+IEtt4J+fZu9T/XWxc1ZJtom12OamyfKq1wK8CZ3f3/gBNHUNIaz9zHfTwn3v99uwCqK19+WIQ==
X-Received: by 2002:a17:902:db0a:b0:220:faa2:c911 with SMTP id d9443c01a7336-2262c53587bmr23587095ad.14.1742275846568;
        Mon, 17 Mar 2025 22:30:46 -0700 (PDT)
Received: from thinkpad ([120.56.195.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbffc2sm85375845ad.162.2025.03.17.22.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 22:30:46 -0700 (PDT)
Date: Tue, 18 Mar 2025 11:00:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Manish Pandey <quic_mapa@quicinc.com>
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: sm8750: Add UFS nodes for
 SM8750 MTP
Message-ID: <20250318053038.k25p26qsxqozqyvb@thinkpad>
References: <20250310-sm8750_ufs_master-v2-0-0dfdd6823161@quicinc.com>
 <20250310-sm8750_ufs_master-v2-5-0dfdd6823161@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250310-sm8750_ufs_master-v2-5-0dfdd6823161@quicinc.com>

On Mon, Mar 10, 2025 at 02:12:33PM -0700, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Add UFS host controller and PHY nodes for SM8750 MTP board.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index 9e3aacad7bdab6848e86f8e45e04907e1c752a07..9d34159e73948e7f3f939593d1ace444cc5dcd15 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -792,3 +792,21 @@ &tlmm {
>  &uart7 {
>  	status = "okay";
>  };
> +
> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l1j_0p91>;
> +	vdda-pll-supply = <&vreg_l3g_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 215 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l1d_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};
> 
> -- 
> 2.46.1
> 

-- 
மணிவண்ணன் சதாசிவம்

