Return-Path: <linux-arm-msm+bounces-44997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C525BA104DB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 12:00:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 438CB7A36C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 10:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2C221ADC98;
	Tue, 14 Jan 2025 11:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VFfOd8x2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F2820F967
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 11:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852402; cv=none; b=Qv4xyIcSwBc0ygL2khcNufQQ0R3zpKXaNh+XhvNfqbQSw71EgO6jn/Le1noMyQP5wBnICmpim+/O0ljM4ItIcYPYE4Zrdfm6E0VKGt2BG2CQiBLQwOF86NeDbVs9pKH7/ewGb/kT9xitOJvWQ4fEIqCpGVDRlU79Nu3Tprq448E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852402; c=relaxed/simple;
	bh=zYC+LJGBzT7jX1TCKPt4yTydGvGRCWlYRbWU3ziZkvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SH26tfq2/WCGmrBjSxGV8eeYzFUbF/9kU/386eKbMNh4dYjLoF5q5bT8+y1AxIStrZG4vZN7tzNrJ/i9pTKSdfZCv+29pDfuo3J7mUNQKypHxmahHIG9c11puiNc6YtCnIySl4+RaMAcHhpkZ/l8yNarbn5iuPittxgOsXyW0eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VFfOd8x2; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30613802a59so29453991fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 03:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852399; x=1737457199; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkFYv1AX0Hh8J4zW9uSN3y+fYuCV+xvNFHIdq6traAg=;
        b=VFfOd8x2c5uC6mQjx/P7X6nbgOIHr58AUCkuMnMAuJPOG/qihr8xbIxCrgjR30rN6x
         W4NA2pTLFG20mnh+4ps27pZmrl3dO9e8Ip0K2XgXDDQ2DqWOaccsdYnn1P2ShBcJ3xiB
         dgWKmDu1u42knE5H5kqkpfBJscgptAZ2Tdhk+5rTe5N04KZbicv6NejpfzOPv5duakf0
         IGM4e3oCG/USIaK2bPitbpmeiCESh5yxr/5SSZ+TrpJrIQvi5wTkH3EqC47VNQJA/rri
         XCqqBgPl5iXGVZSWJg3Gm3i9gk48CJAAnORtxjaNYr9iorO/qgMtaB0kA5VD7beT5ko3
         0uqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852399; x=1737457199;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkFYv1AX0Hh8J4zW9uSN3y+fYuCV+xvNFHIdq6traAg=;
        b=VzGRJcq/TkZaLN9tVFt0ao6XD/2rKJl8mjXwXEyiQn8N1rP1Jj9CAd7Bc/hKFqd5SO
         uQ/PUmoIyHPwrd81VNmwrupkY6lKUS/ww7Hqe5vOCTxRvNxK5Z/9WSCEsX0Y/RUv8c4h
         pHpcapIeC/OI2QbkUJQZLlktOwNsMq2i+vOferUQxJ+cj7BGlw7t8m7I062jeuGw/Bn2
         Xil9Dd4rZWT30t8bRvg5yC2fV+p/QopsOIqfNFJ/PHmKVrWmBKY6ubmjZ4J6yZkcE5YY
         rOGq7Zcc8IaPq6lUUcTBRqsG9yHxEHOuc18EWqQAAnaVJ6X1ogm/iAhU76dYmPPRb/a3
         GJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCVXCNy0bQI4/PIhX5a0/CEUOqCthgUwVDPhIXgAKp2W4p/Acr2qVPsi58txoUk1Sqa2lHtQNFufM1QvOUC5@vger.kernel.org
X-Gm-Message-State: AOJu0YwaV+//7UqB2buqy8vQm/U+v2RptQw7ACXlcWti8o4i8ECfyLKg
	AwLw5LgzY/n+x6Lan22EVI35IltURilkRuOTOM6dtuXRiBR0GxpdrWBUftQFgdw=
X-Gm-Gg: ASbGncv2FJkgxhwvfzlzf6mJdujzFHl00Q25s4+FBMO6JYF00nI1aoO9wdoZTdTiZCB
	vO/uPQZxR3A0QlgYhqra670aoBO0RhLVDXH2Nij3qlKQw/SrG5kAdIBCNsP8hHlWoDTHYCrku+H
	ps+Ll20NecNFbZfikTO5ZLXxt/NL1c8Nc9YmvF+6PLvV0RyJBgZuGFHLOUV4ZKIcHh65MuOBkzP
	9z6sVgyK7uTo8PQXlsbvHavF6cni3iy9NV2/rZeT+CBPCsHdtj37IDnqhX4tas1ytLxHhjIzCEg
	rY50PpZOLG5QlSqNJajfM4yqknfzer6bvVpp
X-Google-Smtp-Source: AGHT+IFCFXLpskTww+oakGW+yd3kGKr+RYDFkg5RSWxp++2txZY27zK5gcNngkAOxYQvIKwGlJK7AQ==
X-Received: by 2002:a2e:bba2:0:b0:302:4115:acd with SMTP id 38308e7fff4ca-305f45a4203mr60644311fa.22.1736852398734;
        Tue, 14 Jan 2025 02:59:58 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff1c7700sm17465821fa.87.2025.01.14.02.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 02:59:57 -0800 (PST)
Date: Tue, 14 Jan 2025 12:59:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8750: Add LLCC node
Message-ID: <7jo242e674fsqbia7udid4abq4euofishstmix6m7xqzdgcqiy@3zukruizim4n>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
 <20250113-sm8750_llcc_master-v1-4-5389b92e2d7a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-sm8750_llcc_master-v1-4-5389b92e2d7a@quicinc.com>

On Mon, Jan 13, 2025 at 01:26:43PM -0800, Melody Olvera wrote:
> Add LLCC node for SM8750 SoC.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..3cd7b40bdde68ac00c3dbe7fb3f20ebb2ba27045 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2888,6 +2888,17 @@ gem_noc: interconnect@24100000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		cache-controller@24800000 {
> +			compatible = "qcom,sm8750-llcc";
> +			reg = <0x0 0x24800000 0x0 0x200000>, <0x0 0x25800000 0x0 0x200000>,
> +				<0x0 0x24C00000 0x0 0x200000>, <0x0 0x25C00000 0x0 0x200000>,
> +				<0x0 0x26800000 0x0 0x200000>, <0x0 0x26C00000 0x0 0x200000>;
> +			reg-names = "llcc0_base", "llcc1_base",
> +				"llcc2_base", "llcc3_base",
> +				"llcc_broadcast_base", "llcc_broadcast_and_base";
> +			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> +		};

PLease take a look at sm8650 and change your patch accordingly.

NAK

> +
>  		nsp_noc: interconnect@320c0000 {
>  			compatible = "qcom,sm8750-nsp-noc";
>  			reg = <0x0 0x320c0000 0x0 0x13080>;
> 
> -- 
> 2.46.1
> 

-- 
With best wishes
Dmitry

