Return-Path: <linux-arm-msm+bounces-25855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9440592D417
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 16:20:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C563D1C20D72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 14:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD1D18FDDB;
	Wed, 10 Jul 2024 14:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XOHPgj37"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35752193447
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720621217; cv=none; b=Q+f6YjfndKQw1PNTztjnA3Q72X4WoaiAIVD2z0W00vorrQMRl2UkD+0lc63heAsSBYjXHN5vrHp9kl1LMrwwszYtFrndhlQuOAZfZc6hrg3Gyztrb4i8NKmLpzxa8zDi4YOXUILMEYJFW/TQKKsSig84/b3LCvTE8DL/l17DYNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720621217; c=relaxed/simple;
	bh=ve7x1Dbv42XAuoZEa9Qrx/JMTNm+HI0XOImGmGmFa5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=muoZyZqWjIMtysdJrZsWX0zELeUC7JwBxJnTqRu3C6L2n2Uc/eUiOlhaCOt0AslbRbXeDSD01QxbLDqx8tmo5eDCQOp3FsVBRaTG+D4H/9s0JbM3Hl0CisxTpKUYGELHbFuy0mMUi5VyzHZ1ATU+LMuQ1/X8rCiugSEZ2PnjL+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XOHPgj37; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ee910d6aaeso71571531fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jul 2024 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720621214; x=1721226014; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XpeXb3pbHZE8iFdvcMTCxnrODafkuyDSXSsC2wHbrso=;
        b=XOHPgj37w7qRtiiGunJEQEFBeqj+zvLJ0FH8sTaH7mVBEmx6IpY9irZ0YSmHc+IA3S
         MzHdBsyaaRjRcVqQEjCt/meefLFuCq1tsudSNZgOVn+21jSQMLzBKDr1mzSyzy1KQDMr
         Kado8vCSefxk/3pXTQ+HW0V/zJlzuU0vPzW1ml/f0nguk9TeNTFDnSVXanFZ3NbJn4Nk
         FW403KqGTVuj1qpnfv9ZGzRDHyGmmMIreO7ZKc0eoaGpIWPkHepAuIZHLiXOFtnf46Il
         782r4V9joWxkeA/qDmns7eT+zrThNDughfXYsU/0ZnLyDA8GGKzeiT/OOPKjtTXSzs53
         i88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720621214; x=1721226014;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XpeXb3pbHZE8iFdvcMTCxnrODafkuyDSXSsC2wHbrso=;
        b=lup1EWA3DaFXTiSHIWFCSrog3S2WRnCeia1HGDvEhZRStEgFzl2JmG9Ie1q/Eot1Li
         f45qwTY76XcO9eD6WIjTXoQYcK9RkhNetErzVax26Shp8vCJWE5/4ZTZ8E87ij3PRL++
         4Hdfe9Ekb1saCqjPj3U8bibxixdKCsIri2ZEnygEQaKgc/d3ru9pi7Tn4nUbl2pKPo95
         d/EmmAM8zM6NSeMmcJvFla1jUEzW3E0XrWDoMZFzXjde/Mj2scVLU/DC95avo4r4VbZq
         1nmtLYMWMXoD08avLXLPO+5fjFOYYAxX09AAMH6EV7SAABZs8u40a2JuCFaQ/GvaMTC7
         8rww==
X-Forwarded-Encrypted: i=1; AJvYcCUeLQyFINelPQnzcpHjlVhYXMae8Jmcj2XUHQcSmVqYT//vNBmqrZHex19EwuSkaAn/v9RjTL62uf1XyF7hpo9LGZhXQ6ejnhfTAgrDHQ==
X-Gm-Message-State: AOJu0YwBH2sQZCyiE2JnhkiKE3dLKBngOFA7o3y7h/c0DiKFpIWUpDVw
	jLZ3MIc+z4XsdgO4Xj80ioXRZLJ53f+llDlgEA6PW5yDMGNMhxxF1JbPKFZ4kcQ=
X-Google-Smtp-Source: AGHT+IHv518AJrnD6yFHzNQhjkiCjkN0ct7XJ+ZrjdCwY06UfQUDBwQbvFbm/FRdyJskVGfv2NTuhQ==
X-Received: by 2002:a2e:9b0f:0:b0:2ec:3e02:972a with SMTP id 38308e7fff4ca-2eeb30bba8bmr35455641fa.11.1720621214310;
        Wed, 10 Jul 2024 07:20:14 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f1182sm82083095e9.14.2024.07.10.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 07:20:13 -0700 (PDT)
Date: Wed, 10 Jul 2024 17:20:12 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix up BAR spaces
Message-ID: <Zo6YnCVj/8/KLrC1@linaro.org>
References: <20240710-topic-barman-v1-1-5f63fca8d0fc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710-topic-barman-v1-1-5f63fca8d0fc@linaro.org>

On 24-07-10 16:07:23, Konrad Dybcio wrote:
> The 32-bit BAR spaces are reaching outside their assigned register
> regions. Shrink them to match their actual sizes.
> While at it, unify the style.
> 
> Fixes: 5eb83fc10289 ("arm64: dts: qcom: x1e80100: Add PCIe nodes")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> index 7bca5fcd7d52..bc5b4f5ea127 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> @@ -2895,9 +2895,9 @@ pcie6a: pci@1bf8000 {
>  				    "mhi";
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> -			ranges = <0x01000000 0 0x00000000 0 0x70200000 0 0x100000>,
> -				 <0x02000000 0 0x70300000 0 0x70300000 0 0x3d00000>;
> -			bus-range = <0 0xff>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x1d00000>;
> +			bus-range = <0x00 0xff>;
>  
>  			dma-coherent;
>  
> @@ -3016,8 +3016,8 @@ pcie4: pci@1c08000 {
>  				    "mhi";
>  			#address-cells = <3>;
>  			#size-cells = <2>;
> -			ranges = <0x01000000 0 0x00000000 0 0x7c200000 0 0x100000>,
> -				 <0x02000000 0 0x7c300000 0 0x7c300000 0 0x3d00000>;
> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x7c200000 0x0 0x100000>,
> +				 <0x02000000 0x0 0x7c300000 0x0 0x7c300000 0x0 0x1d00000>;
>  			bus-range = <0x00 0xff>;
>  
>  			dma-coherent;
> 
> ---
> base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
> change-id: 20240710-topic-barman-57a52f7de103
> 
> Best regards,
> -- 
> Konrad Dybcio <konrad.dybcio@linaro.org>
> 

