Return-Path: <linux-arm-msm+bounces-16292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8F08971AE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 15:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8820F1F21874
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 13:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F00414882F;
	Wed,  3 Apr 2024 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zfECiOLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE21148823
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712152447; cv=none; b=HVm388IIWdyt3MMR83I0VEgk1jcXDB5U1k3m2H2rANpotOkrMVllM1wLnjI3AMY5Bop8LU0q6X2EbrY0dFdnszwoyUtzWczNFnADwc3IXVzDVRMYPTKeoiEChwZTT9loGx/9lMZTY1mUrRC97jn7kEa+YEDE6utIQ+srOqOh7iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712152447; c=relaxed/simple;
	bh=6j77YuUzUESQrILjthCpboV69/4YqDzZNIS+7UAaB9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OnqE932sxBemd5g0UntiG6MKeLVz1D/HorKJeWVWEvANN7SgX+GpTExkpKdbgL4P4ynj49Z9fRhVTDRHaRsVzPiB/7oxqlbkTjg7Kmyfr4/5RuxfQSx/iBiFyrnwWC6NtxrmbKfffeFJ+N5nzI+2uYAvkLZeIlwF61CvPqXEPnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zfECiOLH; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5a496fde460so3943963eaf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712152445; x=1712757245; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1OAL06Mg2B7p2mgKMtF0umqm+s4wnDWvZ+hhRFE0Zzo=;
        b=zfECiOLHamGSPjMF81yan7vciO/nsc/LUleAiY+AtMER85KxW31RNy8S9o+C4MTPeq
         IY21xaOw344YBqKC+4P46rfjvFfGH4OGjM1lVXCrhPALPFiSrB8kkc0e2whUyeJ16x3C
         +hceBlueziSrmqF/kYO67H/aFoyIxMAFaPsgrJ2Iz7dGL6OQvlKfzPh1Ek+gRvqvQNvx
         xAL/PNFKwktdfjqLof4ywCzLJGrv4fJtE4TKbCEwM67zXPrkqM+EmwlEMkIOEhrBE2Z6
         1s57+eQ1TvkyHOUAtPZJKPVV2SxOx+Pgve+gHDhsUs+e+MCefSD6CLTT+SQPhiKf0Q0h
         plnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712152445; x=1712757245;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1OAL06Mg2B7p2mgKMtF0umqm+s4wnDWvZ+hhRFE0Zzo=;
        b=bEd3UDGFrpyiezjOAh3MmfPK7KZVZlazi9eOMz2tZWCAdlVqUFXFB4cie8KL+OrppW
         sCX7enh164x1tPi9lQTR9CJ3fS74irrcM2FmWkWJIJQhP1saagrpVbur+V2ESYiCJ13q
         LL+XfiiCka4zsJpzcAHC1lmwflx3aU7pA4wYO87YHOZFTDgfEof52w3H4q3epFalJ3vE
         8FfG9rTIPLFLM8Vz/3JVKvHZEaEKEiMRiX3Q/i7wVllZE7GqIebC/JpFyh4kFa331ELX
         WvqSRxJHGG1srJ2cDwP6Rjq77q+jMKf1QzuNrkGJjUuLdlZkp+WzjRxislTMlCMjs8Sm
         Hi/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuELqGnUhfKsoMDPy74FB2soiIsrmQ6ep2Ce3JKiwrSU0HQBsH0sx6S39Hi/iAXvIgxhJdNgbocilTRGamJkWOcIpIWyIT74VmxHvfTg==
X-Gm-Message-State: AOJu0YyHUJoMIKi86ssa3AolZ5EJxNJxqL4ROLWVYspsq7Zy6IBq8KYl
	JtsM7lr+GNHRa9ILnDrZrJu8CU/6dB6KOMrdBoKOEjz16JNR77PA23r+q6sJlg==
X-Google-Smtp-Source: AGHT+IF03w0jcECjD5j3s8soEBtUEIJMV7AING8b0+KbubR0veAvTNYHRFP+TmHHg+oq53dMCQ1BVw==
X-Received: by 2002:a05:6358:9486:b0:17f:7807:3204 with SMTP id i6-20020a056358948600b0017f78073204mr19114172rwb.25.1712152444401;
        Wed, 03 Apr 2024 06:54:04 -0700 (PDT)
Received: from thinkpad ([103.28.246.48])
        by smtp.gmail.com with ESMTPSA id dq8-20020a056a020f8800b005f3d54c0a57sm2081588pgb.49.2024.04.03.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:54:04 -0700 (PDT)
Date: Wed, 3 Apr 2024 19:23:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	cros-qcom-dts-watchers@chromium.org, davidwronek@gmail.com,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: qmp-ufs: Fix PHY clocks for SC7180
Message-ID: <20240403135359.GO25309@thinkpad>
References: <20240401182240.55282-1-danila@jiaxyga.com>
 <20240401182240.55282-2-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240401182240.55282-2-danila@jiaxyga.com>

On Mon, Apr 01, 2024 at 09:22:39PM +0300, Danila Tikhonov wrote:
> QMP UFS PHY used in SC7180 requires 3 clocks:
> 
> * ref - 19.2MHz reference clock from RPMh
> * ref_aux - Auxiliary reference clock from GCC
> * qref - QREF clock from GCC
> 
> This change obviously breaks the ABI, but it is inevitable since the
> clock topology needs to be accurately described in the binding.
> 
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index 91a6cc38ff7f..a79fde9a8cdf 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -86,6 +86,7 @@ allOf:
>              enum:
>                - qcom,msm8998-qmp-ufs-phy
>                - qcom,sa8775p-qmp-ufs-phy
> +              - qcom,sc7180-qmp-ufs-phy
>                - qcom,sc7280-qmp-ufs-phy
>                - qcom,sc8180x-qmp-ufs-phy
>                - qcom,sc8280xp-qmp-ufs-phy
> -- 
> 2.44.0
> 

-- 
மணிவண்ணன் சதாசிவம்

