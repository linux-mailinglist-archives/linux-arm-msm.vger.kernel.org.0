Return-Path: <linux-arm-msm+bounces-76417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7A0BC53C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 15:37:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D9C24E46DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 13:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEBF285C91;
	Wed,  8 Oct 2025 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cxkkNTGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953BD285C81
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 13:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759930627; cv=none; b=Fqz2LvUIyzDj6zIzjZgwIyMuNrR26FajoJrbqeEYqs3NHm6pjN/9YLkAeeGuviS9krXFd8IRMlgvDsSEMPV42Gk78O33/CMgEgevyCa5GafXNODntPziZAyMEqKbY/erkcJqtVfbGxRZnMOGVxsr21BJWChVbWbxsaYot20d3to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759930627; c=relaxed/simple;
	bh=wVHBPwpVk3DUd7kZR0axYvRZ4099szWxpx3XB/i9yAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcxLpfjqKuLVYBm8+2/2xu9tzy4ZH0r3S2KjiPoM9LfarRPKw0DGR5C6JA+WTXZt0jeynhqASCPa3vanLfZywV1s7pKeWgUK759PvHOM48WlMdGr+3B1LYD7JEEYTuVi0EHoat7ndiwi/00arLcaET7RxoCYF8uyZc21NHgqLsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cxkkNTGN; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so5883913f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759930624; x=1760535424; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bERJWZGdKctqPmQLMomr/DAHLC2om0vQYmyzBO9BTrM=;
        b=cxkkNTGNf1w5d2Yb752ESNYfLG0NXLkRO2TK6dlkFSk5btEfFsC6F4Mlb23LoOoGhC
         IY6W3M9H+mKkvWAzKShsCoiiKyML/axM0tXwhPdMVhfnK5PYHVr2ILh2L73Arby7JDdK
         PaYUwcRNY8FioLFF04pjtrHl+HvqbhV49lnjtA6efwu3fD1Sd3cTvolNznzNUsWBoqgv
         VzPKMSRYgmIJIMwO/f8fyZLRXx7ozA8Db7OBljDE7UrprhQLhzkO7BszAGM1sKXeR/ME
         Erb7wopDQZecGP7XJ4SmWI0HaiiZmcM+4Rm1BCGDdhJ0sZ8HOWhV74oF5C4x3LIG8gVa
         XF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759930624; x=1760535424;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bERJWZGdKctqPmQLMomr/DAHLC2om0vQYmyzBO9BTrM=;
        b=lVOFxXU1tNwbwITjY00uguMu1WDul6c+mjUDyMeh29MVc+XtHt4LlQLocNxe3WXW1f
         aQixfwTicXBnl7/Hn0JXHCfCqVcdtDokFw0Tq5YvdWc+NO9sk7gV4IcW6hrhzQmMaSke
         Wb3qv05mADG1Dl9rM69uG6nO35R+dBkrkIRRzdi182QYrCMbR8OD1LlvjtzXCnoxj1gd
         kMDHVH7RO9aGeYzmpMraNv53U/vucKGQ4EEYmQjuz70P12fnbj128GYRaBYPG8CPQpjQ
         PVAkptnU0ciKBr+pEqKoxnz8/HzqacMYYJGyMMUCt4ZqGr8PZek8tudH0kcDph6VcTLR
         SkuA==
X-Forwarded-Encrypted: i=1; AJvYcCUBC2vfICceaCa4Kf10+L2kx99tz4/lLOIO+ebIhtRynQ2uocfhgFf4A365M5NjKUujeWf/MLjAXJfUgO2b@vger.kernel.org
X-Gm-Message-State: AOJu0YwnP1xVFz7Y0qb9Y5xX2rMo9wnMQBGAMpsp2bxYVug64lZ8Y2oY
	xK2+uy4IolM0Vu1JjMfPOcz891DoE1k4s8PWbaNb9x6SWmPp0G7VlvQtteDD/tW6JyI=
X-Gm-Gg: ASbGncvohbw0NEhzg8W+kFQUwxE0jGM6oT61y7+HbvaaRoDCJ7hNI3/ACqwNQzzW66e
	Z4adnUSvYOit6ZBfU2qtyXjwhZit6w5UtXa5w4RL9rZuunYOD4wH7ryjSq+GcxHV2er+xZ9gbK5
	POSNUJbfG+rZkcAzj3i+052Z9ZHUsd97KyJK6DuSt2mwguARdkB8PjJaqoR38HV3uy8O0MavRWT
	DWb6OvJKsmkxoX8Moldjv50XJM1OPHII81JuaDaI9rjy/cfG9scAeZKl05VqJy0QXDWChwYTZa6
	8nuv9HR78fNjZG/frSb2vMOt1Dm6I+qpb9Ykfn828enahKfrbJfG3ub15FUnUGA/6KKVzhxa2xd
	Foyhb00ZICrYR4EUVcDBWWRfG/AMaN0d73i8u37NqVBSQ3gjTi5rQkDuDKw==
X-Google-Smtp-Source: AGHT+IGKQqQuzGZb6jiAzLLCrkmUpSwJGngkOf/csBaLSBCsDn//kcndB3Pgpj86O8bJQcTWuM+30A==
X-Received: by 2002:a05:6000:2401:b0:3e7:46bf:f89d with SMTP id ffacd0b85a97d-4266e8de2c2mr2452043f8f.44.1759930623657;
        Wed, 08 Oct 2025 06:37:03 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6c54sm30366116f8f.11.2025.10.08.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 06:37:01 -0700 (PDT)
Date: Wed, 8 Oct 2025 16:36:59 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>, Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: Re: [PATCH 19/24] arm64: dts: qcom: glymur: Add support for PCIe5
Message-ID: <da2vvejbqdteaszzwyktczqivjblyawzh2k2giyoxdxlxcdrcb@fkuqivjmaggf>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-v3_glymur_introduction-v1-19-24b601bbecc0@oss.qualcomm.com>

On 25-09-25 12:02:27, Pankaj Patil wrote:
> From: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> 
> Describe PCIe5 controller and PHY. Also add required system resources like
> regulators, clocks, interrupts and registers configuration for PCIe5.
> 
> Signed-off-by: Prudhvi Yarlagadda <quic_pyarlaga@quicinc.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 208 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 207 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index e6e001485747785fd29c606773cba7793bbd2a5c..17a07d33b9396dba00e61a3b4260fa1a535600f2 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -951,7 +951,7 @@ gcc: clock-controller@100000 {
>  				 <0>,
>  				 <0>,
>  				 <0>,
> -				 <0>;
> +				 <&pcie5_phy>;
>  			#clock-cells = <1>;
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
> @@ -2511,6 +2511,212 @@ pcie_west_slv_noc: interconnect@1920000 {
>  			#interconnect-cells = <2>;
>  		};
>  
> +		pcie5: pci@1b40000 {
> +			device_type = "pci";
> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";

The first compatible is definitely "qcom,pcie-glymur".

