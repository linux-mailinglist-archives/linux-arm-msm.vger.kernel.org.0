Return-Path: <linux-arm-msm+bounces-39904-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A739E0752
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 16:43:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A958216690B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 15:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F643204F8D;
	Mon,  2 Dec 2024 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b5TRXOqL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3D3204093
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 15:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152019; cv=none; b=bOzcqATvifAiJGgU0uBrxgnbPunVcvEtOKrwY+tdyLFKlEIWXFPQX6Ce5Xgx9EQ8qkoPTRLXcu4cLE72bfHC1cZS6Puj84tDAUEmctBGP0EbBbiF4thRSoNS3fEs8FdpeWMhV80IA3OVoQYnrUma13n8oJ4JXQUyn4w9oPOwHgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152019; c=relaxed/simple;
	bh=1EX3Q/6V7Sjs15HKyRfyVFj2pNMzzOFk0u9V9vlZJYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOC7qznW/DytZ7dPxGNMiLke59g+jNC43Yqc3/cQXRnirgUF0SyBQEffl8ueRJLj3dCI+rPuaTR6roxx6QQr1kZfqS4Sw7+VCgXkDHH6GrMCkx5Ym7RYex1IK3e6WOat+n+x/6GPbmbTub2EbdCobDO9r7f9Uy+KWPZEENelBR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b5TRXOqL; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-723f37dd76cso3793050b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 07:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733152017; x=1733756817; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rhh1F0FNt93OWks/1WTeBIrSdzXMhFaYNcAsFDXPT8E=;
        b=b5TRXOqLyMkneZu+DnXQuUD7bvlUpwIFiiElKNUbUXI2zD2FTD3mWl7fS2ag5V/t+o
         FJHjHFgesW3oAMZe72MTtaO+XvkTFuRU2Fbzs4MymAx/MNtQuqkm1mbNFo6DFOzQJTty
         USzIFP8M0JvhiX2KDktHWxKvnHMGmwnvyjq1jVSRZneTfOozRTGD0tzrDG392HedUPbV
         oo0eobFCOi7FPveFrG9MxQLU0U+rUDOE5owNMRU/ZwxrhFqq0JzgwPiIBrVcMvXtY4L+
         UTesjtq0C/6A0H7riYvz9a8SBWzsKITTcM+c/hhkNQoyTwewPgMC/yukgoV5iU5yqaBy
         hFKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733152017; x=1733756817;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhh1F0FNt93OWks/1WTeBIrSdzXMhFaYNcAsFDXPT8E=;
        b=wEqNH6teFzBumpHYPxE/faQpP2aFl338x+VAc159Th4bUaQCgXOGNPDJX9NxgPaUZ2
         XgJD4Z6mRJMItB2NreDHhzqCs48V+hZ0YWTnFkXMwss2FsQpNlINDlIt2qKYus2l/OD2
         1qWoKx/S9smtnbRJZ3TMNHdl2kAX78JOBBlwpZm1uYlSzsAEpAj79424NVwq1QQW4I4g
         s2HIHNy8vnW/kjWgLQPsHkfFHhQxeN0yxqQ8WciyCcE+EbF09YZ6AbWQDsy1twunrc1G
         6/QAlYIeXmFRG7Gyp3/jqUp8diRqArtr6XC2dLKeTfKBW5hgeMSdjj+rjp1iM4301SoI
         pD3A==
X-Forwarded-Encrypted: i=1; AJvYcCX8cph/8Phjr6UoZxAzpvr3O1GwkMhpbkBZoVtj5BdHB+MCW3R9JCqPn7Ntmm2ajnjtkk7K1DRcihFniRSz@vger.kernel.org
X-Gm-Message-State: AOJu0YxHmS8RVX2cMRSsSZNDz40ouyUnFf/AN52tDGlvMQGgDEtCK/8G
	sZKndeMhXtvJ/BufOOmyBdRM8TaO3y7+y1YZpC2TAXF3Qx2Ojo+1H+YNw9c+Xw==
X-Gm-Gg: ASbGncu7aF9F3JSVMdRxMIACJTJpYd3uRVLTm7NSEeYk+ubJPVnDnn+Qv69dzcU9vW2
	dg5Se9ztU9OsV2iFSTJBTO1xGskOBdBKIZbppdESOZfM421Rk6Y7WG9/9H5ATijRc2TcuU91pEt
	Q+E3oq6nOBnEWUqvb3ZihJouzN9GW3V6aaHld9u8seX/rjmiogj//cFIngUBBEu3vHx1o6e7pcU
	lHY4Jr1YMQJgkMZMRtvXfOKB7C7AIpFrI6dTlpq6ySnd3cqZVApSsX4nx8W0Q==
X-Google-Smtp-Source: AGHT+IHc2nR+uOEZidcr15cshfEn4P+vpBs4f+sVjGhFr5D8hxW5/7LO0D+hvIuBPYBe1VGyJsW1Rw==
X-Received: by 2002:a17:903:2347:b0:215:6c9a:15 with SMTP id d9443c01a7336-2156c9a0365mr117358825ad.42.1733152016720;
        Mon, 02 Dec 2024 07:06:56 -0800 (PST)
Received: from thinkpad ([120.60.140.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2158103ba15sm26841555ad.280.2024.12.02.07.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:06:55 -0800 (PST)
Date: Mon, 2 Dec 2024 20:36:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, quic_vbadigan@quicinc.com,
	quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
	quic_skananth@quicinc.com, quic_vpernami@quicinc.com,
	quic_mrana@quicinc.com, mmareddy@quicinc.com,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/3] arm64: dts: qcom: sc7280: Increase config size to
 256MB for ECAM feature
Message-ID: <20241202150648.fwi2wzbdyyedueby@thinkpad>
References: <20241117-ecam-v1-0-6059faf38d07@quicinc.com>
 <20241117-ecam-v1-1-6059faf38d07@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241117-ecam-v1-1-6059faf38d07@quicinc.com>

On Sun, Nov 17, 2024 at 03:30:18AM +0530, Krishna chaitanya chundru wrote:
> Increase the configuration size to 256MB as required by the ECAM feature.
> And also move config space, DBI, ELBI, IATU to upper PCIe region and use
> lower PCIe region entierly for BAR region.
> 

Is this change compatible with old kernels before commit '10ba0854c5e6 ("PCI:
qcom: Disable mirroring of DBI and iATU register space in BAR region")'?

- Mani

> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3d8410683402..a7e3d3e9d034 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2196,10 +2196,10 @@ wifi: wifi@17a10040 {
>  		pcie1: pcie@1c08000 {
>  			compatible = "qcom,pcie-sc7280";
>  			reg = <0 0x01c08000 0 0x3000>,
> -			      <0 0x40000000 0 0xf1d>,
> -			      <0 0x40000f20 0 0xa8>,
> -			      <0 0x40001000 0 0x1000>,
> -			      <0 0x40100000 0 0x100000>;
> +			      <4 0x00000000 0 0xf1d>,
> +			      <4 0x00000f20 0 0xa8>,
> +			      <4 0x10000000 0 0x1000>,
> +			      <4 0x00000000 0 0x10000000>;
>  
>  			reg-names = "parf", "dbi", "elbi", "atu", "config";
>  			device_type = "pci";
> @@ -2210,8 +2210,8 @@ pcie1: pcie@1c08000 {
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  
> -			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
> -				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x40000000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x40100000 0x0 0x40100000 0x0 0x1ff00000>;
>  
>  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

