Return-Path: <linux-arm-msm+bounces-30687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D722F96B95F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 12:56:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0713C1C24D12
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 10:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E56D1D0161;
	Wed,  4 Sep 2024 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yU3R7Tst"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55C1D014B
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725447341; cv=none; b=aHMgnpUUagkEVJPGsWjuXL2qOLeNJVIgtoqAL1PLS/pCVH4CiXP5SflGHYWV2IDcpc2DbJktfQ0gllRqPZ2sLr/117Ktqj4sLLhVA+oTozGSZN+3OeGfkF79s1Q0V7UH+rKQvrwog6cc4QhAaSAVaXCMYl7s6lCeZ0xR7rd4UKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725447341; c=relaxed/simple;
	bh=cOKW7NUKZZI6Wp4SVULd/68D6NarWm5qu7B4EWb1yQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1CDXha4Ss1+u+YX7GvtJdKUWZZ271Togs3VFtK83J9l6FzM1vF0gzRTc0Xv9WJI8mmjvcoNHbWZi4DSi2Ih7BisaHzFeau2Ince+9u1EvZukMwiVCMiZHzCOSZhF5lun1gODKZ4hfSVb69pGGO0wLPcm0zE4Rk+HnbucU0ccac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yU3R7Tst; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f50f1d864fso75063291fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Sep 2024 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725447338; x=1726052138; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1+7OAyLujGbFYszTADm1Fbnglj5tVVPCg8cnH8d6UNw=;
        b=yU3R7TstScONgqbu0F9jaQG+Pp1iizzmQ4b/9+4XQi+EQ+/n33Kuk0tdjtBzeBl8Ih
         ky2HWUkw1g/cqlsL1KgTxb4Wzut20NCZT+hXtIIeW3yUFVLS7Da4DqTM4KfE8k2/4nwH
         ZsKZ4PHwf0hBRk+XegCVyBhd7LTTYGEFM9PxLSQDATy+kuLekYAXqJHq69k1zMk/QVGO
         cMJkfw2Nnb+M8ge1dcW4UsLSB1E7Tv2xxjGJ3JxfTYCCCKWgI4tpS3FbwnUzJ5oaMRmK
         kcc9b+Zfkv+xZ+ScnEnSHUGa6RGpek/QqCrErjOo8IM4zEUEbfKxMi0gTl07DS7XQA9L
         BmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725447338; x=1726052138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+7OAyLujGbFYszTADm1Fbnglj5tVVPCg8cnH8d6UNw=;
        b=e0jpUcyQuHmDr7C2B59YzOxSg9xQIHLN483LMJ+qGFhUJRoEegqSPjguTfjxrHxmAz
         BIPEi48f10dntoKj6NjUBeF1DT6uDfCQ31dPjq9a2iBMk/DDff6BLVGacVcS0utrnM28
         xZEEMPgEpo/XSrbUqTHarL+BAU+GS9vpYgpJJxaUZMe5SyGYnwSFmseGqNUyydtqRNa8
         Xs9xWYgmKVpB1eyxTs0crP4VYyOfHfZEwC6/FGY6gdLlwkzLRk2S/dKRIfGr6pAdcq6i
         A10j+Vz3wBbQLQCRcgisVJHFtKlyrcRGLjYUYWZR5/v/AW5E0P1nBBDIE2xtXxASJElG
         8DFw==
X-Forwarded-Encrypted: i=1; AJvYcCVlAQB8GW7B0jYRIDY86tTvoebjW3B7Viu07jHbFp7HD+JFd+NoClucBwzjCRCunkFZd5OK4QpnEnxX3Wl0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3DG3cqjr33ZA6L6+uLcDpWebCVPNh9p531aKYpT/YDkdzh4aq
	LaizCfftxzZSMixwkjao+vKcjf14kbrodbnMs/vj8TGa/T69mBPFsQRflmyUD7U=
X-Google-Smtp-Source: AGHT+IFE66IwvXATV2zxxNEOIEdbkl9lbKAFhzct/n7RvYANLBHuO6JOsOi5ySMCjoe65faREHS88Q==
X-Received: by 2002:a05:651c:220a:b0:2f0:20cd:35fc with SMTP id 38308e7fff4ca-2f62902e264mr101506221fa.7.1725447336786;
        Wed, 04 Sep 2024 03:55:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f6151881dcsm25498841fa.124.2024.09.04.03.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 03:55:36 -0700 (PDT)
Date: Wed, 4 Sep 2024 13:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, Andy Gross <agross@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	Xin Liu <quic_liuxin@quicinc.com>
Subject: Re: [PATCH 03/19] dt-bindings: phy: Add QMP UFS PHY comptible for
 QCS8300
Message-ID: <e7qsuk3xoqgywubrkejoy3dztae2comlfn3mu6t226mvfvpfof@mlnj5s2xcsjf>
References: <20240904-qcs8300_initial_dtsi-v1-0-d0ea9afdc007@quicinc.com>
 <20240904-qcs8300_initial_dtsi-v1-3-d0ea9afdc007@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904-qcs8300_initial_dtsi-v1-3-d0ea9afdc007@quicinc.com>

On Wed, Sep 04, 2024 at 04:33:44PM GMT, Jingyi Wang wrote:
> From: Xin Liu <quic_liuxin@quicinc.com>
> 
> Document the QMP UFS PHY compatible for QCS8300 to support physical
> layer functionality for USB found on the SoC.

So this is talking about USB, but the patch changes UFS. Please adjust.

> 
> Signed-off-by: Xin Liu <quic_liuxin@quicinc.com>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> index f9cfbd0b2de6..a3540f7a8ef8 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-ufs-phy.yaml
> @@ -18,6 +18,7 @@ properties:
>      enum:
>        - qcom,msm8996-qmp-ufs-phy
>        - qcom,msm8998-qmp-ufs-phy
> +      - qcom,qcs8300-qmp-ufs-phy
>        - qcom,sa8775p-qmp-ufs-phy
>        - qcom,sc7180-qmp-ufs-phy
>        - qcom,sc7280-qmp-ufs-phy
> @@ -85,6 +86,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,msm8998-qmp-ufs-phy
> +              - qcom,qcs8300-qmp-ufs-phy
>                - qcom,sa8775p-qmp-ufs-phy
>                - qcom,sc7180-qmp-ufs-phy
>                - qcom,sc7280-qmp-ufs-phy
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

