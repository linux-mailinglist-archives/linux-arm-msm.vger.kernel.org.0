Return-Path: <linux-arm-msm+bounces-12134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ACB85F0E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 06:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A1B3B239DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 05:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B731C14;
	Thu, 22 Feb 2024 05:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JvjKCLiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE5610782
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 05:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708579353; cv=none; b=N/3w++3E9y6EMZMcwmR2XDemiay7ZbPfjiQ3/l9H+Ti6bHX60z8e5OPKGSzR3hCKJE0SWn1K1DZpqu+kJzAoGpPZcMOD2wMdMBprFmaxZvOS+SQ/detM9+t9DETpfok/aFkKSOE1rlQycwtZLkJLZ8EmGGiv/2V3w+7FPTVI8aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708579353; c=relaxed/simple;
	bh=YeT7pdFKBx0h2pjjLOX4Ge6GRmGK/bBs8ilNmslgI4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxFxaBZ+TGgoqzpV/nPu+6kC+X6EsmJaCojlqYD/2dt43/+LPAjyWJSnZtwNf1WxPxiVHEBrRWRgOqpEJ4scHReYNThe2qh3rqfz4Tj3jIs3hSiYXOUGLuzkXO0v5XqWtn+1lg1f4/OHe0HoF+KkHMeW9Gv09cgSgbt1cCdvb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JvjKCLiL; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-29a430c3057so263624a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 21:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708579351; x=1709184151; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uwlWZD+wtDen80T6/9sZq3GEC66Lq8p7KhscmDYdFLs=;
        b=JvjKCLiLdzlMxvqKiI4/5LRU6LCQKRSi7l2b+PF10cSai5SsKQ+U/dRjq8VvEzquio
         5S1oseAi9R6vEPcebDc/1C997RY7g2aQEffewovRHgWn3LuXgPcI2TqGkdYutmU8v7hf
         oYwZMJ7UHcUlzJrogdbeblOX+hALcE9TUC2qTKzQoG9fB3JYQXoyAaYsli8KVKYwmm+R
         O4tzOPYWCdpGhCNHjo1IPCQI1iGVCXx/kJwnoN51EE9qIyWldxTXVwhCBZ+7zjnOylAL
         IH/fitNm0AZW2ymctVK2tUryT0er9kGYMRtlIlSDqnsq85BRYKEYyV2ILfM1RXdpMPQ7
         MeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708579351; x=1709184151;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwlWZD+wtDen80T6/9sZq3GEC66Lq8p7KhscmDYdFLs=;
        b=ZXiKLd9JUMSAnzkOaKMsTWzapAp5beYYJ0m8La1lCb05hL6JYeunr84ZnnP6Qwc5Uf
         7s5SNVcn9dDlpvs+GiUuC9G+AR70enThq2hnkTjf17CW8H/23z+w4DEQ/V0QFkBSicze
         OQh7AQiXZRGAIFdZqKj00iOGUg4d21QMS8RvjiR5kI51LZVNR246fUMr0EZRFiRy1orO
         JLYfkeOkHTjAQ1btBm7sYz66S53swhS5paDJ+d+jnNv0oUfk+Y05rYLwVcw8I43md8Rn
         0dOgzbuhAKM/nBOi0tKiMjwb4wZI3UzzEuadd0Gz/AocsVKKyOLWkNqeRFORkPeqr1YD
         T+Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUr/G+KkGwAN5G3+wuTZK8N2zU6rydasJO9eKNRWwhqQaMAaaxQc4RtxN7SzF4macX5/2yGbbmx69nP/Hd/fFrnPRr4gsHOnAlMmXCPoQ==
X-Gm-Message-State: AOJu0YwqrWCjDR94+ujECC4cdGw3WQFf2uR+GZg8AVVe1y9+FkMi1Y5p
	cY9t7shcsSLp1ipjjN2cDoOHLmzN5a93g0fbknFO0++MmnMeVX5gNvWa8kxDeA==
X-Google-Smtp-Source: AGHT+IGtRLKXNREdQdvyN73j1BKXIF78m/5KnAZe+HbQRQ+0TXw7vcCP0uf4rzHwh6ITtbi7qcGvYA==
X-Received: by 2002:a17:90b:4f85:b0:299:9999:6bae with SMTP id qe5-20020a17090b4f8500b0029999996baemr8927857pjb.16.1708579351476;
        Wed, 21 Feb 2024 21:22:31 -0800 (PST)
Received: from thinkpad ([117.193.212.166])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b002995babd9b0sm10124988pjt.10.2024.02.21.21.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 21:22:30 -0800 (PST)
Date: Thu, 22 Feb 2024 10:52:22 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: root <root@hu-msarkar-hyd.qualcomm.com>
Cc: andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	jingoohan1@gmail.com, gustavo.pimentel@synopsys.com,
	konrad.dybcio@linaro.org, conor+dt@kernel.org,
	quic_nitegupt@quicinc.com, quic_shazhuss@quicinc.com,
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
	Mrinmay Sarkar <quic_msarkar@quicinc.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, shradha.t@samsung.com
Subject: Re: [PATCH v1 0/3] Add support for detecting Controller Level PCIe
 Errors
Message-ID: <20240222052222.GE3374@thinkpad>
References: <20240221140405.28532-1-root@hu-msarkar-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240221140405.28532-1-root@hu-msarkar-hyd.qualcomm.com>

+ Shradha

On Wed, Feb 21, 2024 at 07:34:01PM +0530, root wrote:
> From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> 

You are sending the patches from a wierd account. Please fix it.

> Synopsys Controllers provide capabilities to detect various controller
> level errors. These can range from controller interface error to random
> PCIe configuration errors. This patch intends to add support to detect
> these errors and report it to userspace entity via sysfs, which can take
> appropriate actions to mitigate the errors.
> 
> Also adding global irq support for PCIe RC and add corresponding change
> in PCIe dt-bindings.
> 

There is already a series submitted to add RAS support to DWC drivers [1] and
I've provided comments to check with EDAC maintainers on using the EDAC
framework. If they don't see this as a fit for their subsystem, then we can add
it in DWC drivers.

- Mani

[1] https://lore.kernel.org/all/20231130165514.GW3043@thinkpad/

> Mrinmay Sarkar (2):
>   dt-bindings: PCI: qcom: Add global irq support for SA8775p
>   arm64: dts: qcom: sa8775p: Enable global irq support for SA8775p
> 
> Nitesh Gupta (1):
>   PCI: qcom: Add support for detecting Controller Level PCIe Errors
> 
>  .../devicetree/bindings/pci/qcom,pcie.yaml    |  26 +-
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  12 +-
>  drivers/pci/controller/dwc/pcie-designware.h  |  26 ++
>  drivers/pci/controller/dwc/pcie-qcom.c        | 350 ++++++++++++++++++
>  4 files changed, 408 insertions(+), 6 deletions(-)
> 
> -- 
> 2.40.1
> 

-- 
மணிவண்ணன் சதாசிவம்

