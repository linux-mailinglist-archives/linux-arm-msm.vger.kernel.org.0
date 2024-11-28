Return-Path: <linux-arm-msm+bounces-39444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ED29DB85D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 14:13:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4EA85280E53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 13:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537501A0BFE;
	Thu, 28 Nov 2024 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GB/h+DPv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2921A0AF7
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 13:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732799579; cv=none; b=V1eKhYqOtkc6+YC9xf+/O2byhdyCdkE0Ednfxy07lpRZsMcep2vStkpRY6WMmfWl0QjkngRJYV1Nt6IGXulsnyBBkXYViTtzI0MJt6qMNG8KAGfN0gvC7zEUV2fO2CzD2zmWyPFuQw7gbwDtLcD5akvbxygJUG88pCJcKi6EOCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732799579; c=relaxed/simple;
	bh=4IZu694X/bkWyo3vwZjGxQoC0E+uORLSjZwc5JCEioU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbY0aF9xYqqFFJFcP/aOnMSLq47RhATzOxywljW3To0ew+FZyjc8fyXKilKtysmhOE2g7y42MEDmR58HFhbVclMx3Ltxr1uI/RYWyxO4zR+WRBGFpnEfnccaC27qZPxJ8byUNqmEbkbwDaWzMZASQnVqSOZSYLDXwRX/t/WArxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GB/h+DPv; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ffc81cee68so8701561fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 05:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732799576; x=1733404376; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KpJV3sxc/k5d9E7bw3woxWxWCXGkw8tAeHxF+F42yss=;
        b=GB/h+DPvugG4KGj0cghRI5av52n/CuMxwJ+/CI3f+DHycUod/1nQoV7fAA5kgZX6MJ
         xEX2Kuq4qszanAHs6plrR+vQOz+h8zfbCuBftw22ayhZONspIBSg9SBmCXgxE9n1ZX7s
         C1pfQap5t6QTkr5FtchN7Cn+Dr1CdMEKEIRCEK8lg9+4N+R9N/dEKBi7VNNVcGFrglkF
         5KOEkPHrAHq5sBWsvtQfvgdS8KBE05WFJFowtLcjJODsrj64nv3JVNPGy/tEVHaw0NUw
         GTToSAWV3G1skcnlhGcRCdMTiQWOXpB3EwW9gHRjIPlkZZmqg/7BpBcOnZJwL9fdfGmM
         OsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732799576; x=1733404376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpJV3sxc/k5d9E7bw3woxWxWCXGkw8tAeHxF+F42yss=;
        b=l2ycI3/m4GggYxa1jk0ZJaRpCA5U8GceVn4IyMVwwKE79QUxho28l1Ki1hMjCS43Mc
         gvW2jaYprFA8DNO32wdv+SQQD80JwEuCF/qnf+cvsgkrcT14HZ6rAhovGIQrCXuUILIT
         IixBuSq0+Y9SFHHjcZmMcCzb+Hyqofow2qn1aNk/ha5WWeAyxy57Hjb5/2TEI7RijYUD
         NwjTQhOnPbeKEYXqENmptDWoBT4mYQ43D3GAvTUmZ6oUHDCHdDrhyJVwR60PLBYpmoxP
         L/o4a3dA4mRAa2QvLYB069UQRkvE+fSxVVcFsVm19BCZZl1mG6QbkS1PPVEZQbVqRS0/
         jy9g==
X-Forwarded-Encrypted: i=1; AJvYcCXepjBZ5tNm+P4vssHfSM9qyDGBFe2COm1yL9P4VFMuW2gF2ll4maHjT+S7qhEqKJndO2khu76EsojXKHl9@vger.kernel.org
X-Gm-Message-State: AOJu0YymVsGEqGpEuM+Nj+fFudivEUj8rI+bKH5yMUqHa7eNJ+OYaL7D
	IcfikT7+AHerIFJQcIB0Iz71KEEaQIGN3rnRp8h9gH8/SBuO/3wsBThLCUVII/k=
X-Gm-Gg: ASbGnctD9lXiCJoOBhZfZiwOWqhaht2JoDb7ELMzDODcgpw0qCf8CQj0dmFx5HGl2ep
	PsGijHS9FPZ4NLv6AKPyabWDJvTN3Vsvuc8hojA1bibYjJUz1zJJ1Ne5NE+jZkrMmenGKJkloD+
	CSER/gcbmRuDex0EjDGvS2tfIs8vYZfVce/XVpODZ8yItdrBjMqMmNY9iFF/tF4ZMis8Hr/Zaw0
	5hvYac2+lSKyvrG6U2gO5OwqqEkmeBqqcpQsv/2DPvh2NyUjWEkWFd7ZaKpIk2JXTcSqLvG65iQ
	a67ez0ZLRQ+/e4gs5HUXl64xiJ/ilg==
X-Google-Smtp-Source: AGHT+IFEsWiYySQlUxeUCEhDU9UTuc/5MMtH5h2wIuS5BWZsJk6+mrBkFYDCQpE23ITXxkYf+O5fdw==
X-Received: by 2002:a2e:a816:0:b0:2ff:c242:29cc with SMTP id 38308e7fff4ca-2ffd60231a0mr39764271fa.20.1732799575587;
        Thu, 28 Nov 2024 05:12:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffe1daba82sm1273441fa.0.2024.11.28.05.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:12:55 -0800 (PST)
Date: Thu, 28 Nov 2024 15:12:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/4] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS8300
Message-ID: <evzdrhzrr242ynfv6p4qhtjpgd4allzgw3osxalmtyfxzsjj2h@vingsirpf5su>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-2-26aa8a164914@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-qcs8300_initial_dtsi-v3-2-26aa8a164914@quicinc.com>

On Thu, Nov 28, 2024 at 04:44:44PM +0800, Jingyi Wang wrote:
> Enable clock controller, interconnect and pinctrl for Qualcomm
> QCS8300 platform to boot to UART console.

... which is used on the ABC DEF board. The defconfig is being enabled
for everybody, so at least let them know which board increases the size
of the default kernel build.

> 
> The serial engine depends on gcc, interconnect and pinctrl. Since
> the serial console driver is only available as built-in, so these
> configs needs be built-in for the UART device to probe and register
> the console.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d13218d0c30f..3d9e48940c96 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -608,6 +608,7 @@ CONFIG_PINCTRL_MSM8996=y
>  CONFIG_PINCTRL_MSM8998=y
>  CONFIG_PINCTRL_QCM2290=y
>  CONFIG_PINCTRL_QCS404=y
> +CONFIG_PINCTRL_QCS8300=y
>  CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QDU1000=y
>  CONFIG_PINCTRL_SA8775P=y
> @@ -1327,6 +1328,7 @@ CONFIG_MSM_MMCC_8998=m
>  CONFIG_QCM_GCC_2290=y
>  CONFIG_QCM_DISPCC_2290=m
>  CONFIG_QCS_GCC_404=y
> +CONFIG_QCS_GCC_8300=y
>  CONFIG_SC_CAMCC_7280=m
>  CONFIG_QDU_GCC_1000=y
>  CONFIG_SC_CAMCC_8280XP=m
> @@ -1634,6 +1636,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
>  CONFIG_INTERCONNECT_QCOM_QCS404=m
> +CONFIG_INTERCONNECT_QCOM_QCS8300=y
>  CONFIG_INTERCONNECT_QCOM_QDU1000=y
>  CONFIG_INTERCONNECT_QCOM_SA8775P=y
>  CONFIG_INTERCONNECT_QCOM_SC7180=y
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

