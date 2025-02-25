Return-Path: <linux-arm-msm+bounces-49382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EADA44E58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 22:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C820D171440
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 21:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F86C192B77;
	Tue, 25 Feb 2025 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQxVhYtA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C003018893C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 21:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740517590; cv=none; b=N6DdQIC6AZ8guvXTvXGvyYw+bipiVqbwX/vaFMIHzUa164tsbJRM/xdmxelqu+OrbKhzDXZ6lg/GrYIksKRV5u3VivyYrx7kliwDj2wI+5lZ3TGbv41ROb8FCHRopPhi5jEXWyZyb+hRcbE5s0hXcu5S4I+jGv86+J2wO7W5E8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740517590; c=relaxed/simple;
	bh=WmGJxpRtCAtAMLQXKUCjzBB1xFWO+4jFrTVLTJKp0yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBCBNUtUIjyLKu/B1T15OIABjpCg5s2ia0FLunI6nTekm79XWbkoc7mD99v2zKqCUoYCjMLYIXO9uKFdXdtMf84WJpx6VP59BXfmX07TsfAeLo/uOTaaCGuEEIc0BhNjuC0ZB/cnTrkRLyMC9FYq8JZjxPbtJTizNl47xG3g0q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQxVhYtA; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-548409cd2a8so4362568e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Feb 2025 13:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740517587; x=1741122387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4ccj8mQiqVZD3kd0H/8TemcjtwIEI2BuIPjkRPoWw6Q=;
        b=oQxVhYtApH8KpEn7K1SORifN3X32IQF61N1XRLW7Lbcr6gWIOW5+mzomUxNL4SVOOv
         SM3rCSqvlcnyVww3o5ip31wUKvXfgBDkbi50BL1COYNj/bhseqDJnpn/IJk8D6wMmP/3
         eo8x9P1HbRiZUEAJsZHd/Ktb7lsI/8roeF8dNO45CM7s0Pc//rOmFn5xvnXZNGPdQF01
         enpK2uaak9gUVdw2spnLNKN/rVO/anh8BeEWiG/C6KzIZR433xrlR25k622ujk7Sjj5L
         qQAXwYk1dITAHmqUi0yLoraylUDl+TBR2KvKPyO0teyLxN4nqgEFK56hQD2uTbqUkvq2
         l6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517587; x=1741122387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ccj8mQiqVZD3kd0H/8TemcjtwIEI2BuIPjkRPoWw6Q=;
        b=OjNgACiVkIUcNTsZoWpB0M5n5cI2Yv4RDp291rZHmQ9Z+QIBbOyNTIpGD24f41Zck8
         vmB1qncTMenCSPtQZVTCa73nr/qiRKBwrrDVisN3pxx3MtaFGEBpxSzRQROVmpUfbpBx
         w5b+wh4Wd/QCaar16uFlX5jLPzodWnZIhdFlgKbP6yJU1ZLQoJ5a1ZjH6vgJ/3phgFlD
         CzcjTYZkhvfEMWVj05+9E+cUu+VwhgmOoNuG1Cjs4MG1sHALnjFJ5B1R6FD6jHRQPcnO
         sZ1Qx8ZeYxWPhqJfY4awsqhu7eWKS305iJrQ6Chww7OCztmeyuOwDF6rP/5kyva1wE5o
         iH3w==
X-Forwarded-Encrypted: i=1; AJvYcCXRysZMqOE2zV0e+dG5B/U9Hkukqz68U0obs6vJ0RKcRvTgrKPRzz6IV+rgL5Tr7ZdTpI1XLDlk1FTUmA/o@vger.kernel.org
X-Gm-Message-State: AOJu0YwjxjDBACYq3dfuMGxNyscJH/dLu9L4c+fIe7I/TdUiB9e0Q+6X
	k3D9mpNvrphYgOexxi/ybVpNBhdhSY1xKNWwWuzBQ65XJo2vSfsloWHrqarxW9k=
X-Gm-Gg: ASbGncu0B+V6Xosme+9redkV0LdaFdMmJhwKrVam4nt42xOaG9NeHbJ4mLHMYhfN/9d
	Rv5jW9sud9AdHtRVKqjZR7kEtgtu3J5/QLDBsm1D8KNup9kHbnV1cwkS1Kt9Bv3LBCnbh83dBdS
	NTFyzlZP8VPRk6BqtXi8TnNY0pO9Z1MlbPs/eO3AE6VOCEKBK5dZRy2vEuo4a0OMgG073/veOZ1
	CPbvMR3/umjB6JS0BdACcP+7t3GN23Jn++GJiWO0yy5UEfNLW7FzWtlWoJN7Kn0uEhylZGzzRb+
	gzXD7glSAr8Fr+NMasOxjPWEdim1P18jX8Nnn9P+sTGX5aSJnVVR/JcHoUYWSzKVxAoA3bXdSY+
	wdYKzmA==
X-Google-Smtp-Source: AGHT+IHHsK+fxV7rGxHgqaCajsxqWGESnNX/hIrjllNl78iTD1Ai8xp/XSeeAKtHfF2+7lOR6sFvcQ==
X-Received: by 2002:a05:6512:e83:b0:545:2776:8529 with SMTP id 2adb3069b0e04-548510ce6e2mr3332428e87.5.1740517586807;
        Tue, 25 Feb 2025 13:06:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514efaccsm266286e87.155.2025.02.25.13.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 13:06:25 -0800 (PST)
Date: Tue, 25 Feb 2025 23:06:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Konrad Dybcio <quic_kdybcio@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] Revert "arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on
 apps_smmu"
Message-ID: <bwj3a7cbxqh2eeglvx6vh7bmjonbfufup4clgdogoub77mkjfo@wa4jmtvwnrvx>
References: <20250225-topic-845_smmu_not_coherent-v1-1-98ca9d17471c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-topic-845_smmu_not_coherent-v1-1-98ca9d17471c@oss.qualcomm.com>

On Tue, Feb 25, 2025 at 02:44:40PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> There are reports that the pagetable walker cache coherency is not a
> given across the spectrum of SDM845/850 devices, leading to lock-ups
> and resets. It works fine on some devices (like the Dragonboard 845c,
> but not so much on the Lenovo Yoga C630).
> 
> This unfortunately looks like a fluke in firmware development, where
> likely somewhere in the vast hypervisor stack, a change to accommodate
> for this was only introduced after the initial software release (which
> often serves as a baseline for products).
> 
> Revert the change to avoid additional guesswork around crashes.
> 
> This reverts commit 6b31a9744b8726c69bb0af290f8475a368a4b805.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Closes: https://lore.kernel.org/linux-arm-msm/20250215-yoga-dma-coherent-v1-1-2419ee184a81@linaro.org/
> Fixes: 6b31a9744b87 ("arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Should we enable dma-coherent for RB3 only then?


-- 
With best wishes
Dmitry

