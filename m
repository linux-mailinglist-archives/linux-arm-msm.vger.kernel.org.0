Return-Path: <linux-arm-msm+bounces-50431-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D80BA54114
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 04:13:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCB21188C8C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 03:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639F9194A60;
	Thu,  6 Mar 2025 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Al+nf66H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E26C1917D4
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 03:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741230816; cv=none; b=jwxPFIoF5qVXY3q3MagrHhrHTRvkjqRuWu9DxGyNhwID/NBVwfkmAq/GMyddwmwduTMYUGxLuRbF3wGIrFNcqJz0gwRqst839CJruscnD+R2Z6JaamHrrF9EJsSxeRmoERzPMSy5iHnjHD/HbyechkGDh3/RrjKnE/tsBdJhofU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741230816; c=relaxed/simple;
	bh=Tveglffe8ZqIwGSYe2WrroPWZ6zSCid8BKA2Rrxbctc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOtwEutvbEgffL0sp8VI7ExuQLA1lRg3C2ElaMiKqm5BfOy1QBAkE3bAKvbA+5hsIxHAVUpz9yz5m8Po1aP8Y1bpULlS8CRqbGEkauoOJ8GIzCFYroOJPuPBbdBIvtK6g8Kv2pDwZXLTsQlA9+oe729as7skNtHtL0H4TGg+Asw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Al+nf66H; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2235189adaeso3299765ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 19:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741230813; x=1741835613; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1xC4B23ZVUrI+v0nWKIC4hRtohRTbUpDYv0ldFM8Y84=;
        b=Al+nf66HEEs5M50XPaD9As54O3i83iWFQYo4pHJWvRRdBLiBuORBNTX1rjz1znKazc
         6PzI2oBstzsNXgN0tAnx5zMYiRhxVu1cora1nThZu0mGDN6qeGl29I5d51ly+T01NG7y
         fMRZ2SnQGqDqGAFgmuXiZoL2AnhVP3mCZqtToEbQRvNcdD/7rr9/U9WmwnECaEmdwu8C
         pWs8MSWfd3R7RwwaWRjYMHDX1zbBl6QttyeXDQ6pmg8wgOqK0XEz1Yr+vcf8ULWNajd7
         W3ej8KnWlUYbZ2AX1ieRESyQPK/iakPnJtr8i1nLONAtxlyeLgD5V7+PGCi8aJ7pBCXe
         zsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741230813; x=1741835613;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1xC4B23ZVUrI+v0nWKIC4hRtohRTbUpDYv0ldFM8Y84=;
        b=hqwp/MU3ZMSqUue+cxS/ztNbmHI8n3D7DDM/j9VbibU/wMqvAUX2Ht6C2bttIDyDP6
         PwuQ+VYBceKaIqbbwYLnVK8Cpjob+gZo/x8uKJwzEJGh3xigfUa9ai6YlPCEivSF5f0o
         1W0lFq1S7xFtg1wqGnxnnaHSjZcKUlkmnd+2xuHq7sB33LuQ7EIE7sl0QSTzWFQCRJrU
         bOHNzYyjXCWyprZc8CN2sGRac9OtlKEhwwJ7IDuL+e3jadY/doTZEd/nkDjg7m4fghAH
         9uBU/OR1LoKuGTCmOnYqzNtsEY+8ZIIG1Q3eEAelU+Xz387qe7x4mc7GyGvb00TH684W
         UaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCX62Aj9bd4HfciVrqW6CB7/eLRHZHHtPRyMtatdtGhVGsN32orsSqcmSDGL2/EphHFIoPECka+wA2WoH2AY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo5KqGtpF1/5kreSEWEL2LBfBQMTRw5JszB4OXmtP+9otT8tNk
	HZ/uL32KeN5/ct3K+jgFFVqK1SXwx7ank4OcDIJ6RtcZjTGvuIPMSxx23WnoAA==
X-Gm-Gg: ASbGnctu3WuIkGWVsxXx9hzTY6bNnqDfVro1QC5m0p25Jry4W+PPDcjXcgobVjvC65f
	B2dqsdtDDaYNWRwm1jy1U0BPEfp7nYp/hy+tQj2RBbthGFVq4g3zp8AFb64OCOHNukdV/zGQF4I
	GnAmKg2KCo2dfsjA6mg0cXRKhP8+qouWTQa53/0fYhKHFdrxrp0TDyNcpWgh74+0CZ450HIWHsp
	CEsNSk6o7MmdUAO6hTc9sJTUzK+uQGmBgqHfmjPQQfyAHdT4f0Uhaa3mY4Oj4uQcOgvDVn1veyA
	cB7xNlU93S9lLjwa8JEG0wBTtzNCXRbYh0UOpWQcXrZ8ulPsHgQSBjw=
X-Google-Smtp-Source: AGHT+IFy40lU01QwIDD6NgP1MWN6uVEbwb2emHO+b5oCOTPTFjpkYhW+N4OcEkblRt9yRpkBHJpIww==
X-Received: by 2002:a17:902:e5ca:b0:223:517a:d4ed with SMTP id d9443c01a7336-22409457e5dmr21605625ad.15.1741230812657;
        Wed, 05 Mar 2025 19:13:32 -0800 (PST)
Received: from thinkpad ([120.56.193.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410a91c43sm1613815ad.183.2025.03.05.19.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 19:13:32 -0800 (PST)
Date: Thu, 6 Mar 2025 08:43:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	quic_mrana@quicinc.com, quic_vbadigan@quicinc.com,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 1/4] arm64: dts: qcom: x1e80100: Add PCIe lane
 equalization preset properties
Message-ID: <20250306031325.bmx3p6htwtb6l6ji@thinkpad>
References: <20250225-preset_v6-v7-0-a593f3ef3951@oss.qualcomm.com>
 <20250225-preset_v6-v7-1-a593f3ef3951@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250225-preset_v6-v7-1-a593f3ef3951@oss.qualcomm.com>

On Tue, Feb 25, 2025 at 05:15:04PM +0530, Krishna Chaitanya Chundru wrote:
> Add PCIe lane equalization preset properties for 8 GT/s and 16 GT/s data
> rates used in lane equalization procedure.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One minor nit below.

> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> This patch depends on the this dt binding pull request which got recently
> merged: https://github.com/devicetree-org/dt-schema/pull/146
> ---
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 4936fa5b98ff..9a18b8f90145 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -3209,6 +3209,11 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>  			phys = <&pcie3_phy>;
>  			phy-names = "pciephy";
>  
> +			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555
> +						     0x5555 0x5555 0x5555 0x5555>;
> +

Get rid of the newline between eq-presets-8gts and eq-presets-16gts.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

