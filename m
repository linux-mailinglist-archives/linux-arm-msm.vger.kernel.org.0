Return-Path: <linux-arm-msm+bounces-36918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D659BB305
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 12:22:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AB981C21D7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D18E61D45EA;
	Mon,  4 Nov 2024 11:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FmHYaZxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E941D432F
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730718702; cv=none; b=Apiyy4mwCz34vTRiN0PoGq2N6rEhneVShAlsVVD7p02rNLX97qe2mT50bUicro+qaiXV75kdDG9SbmVS5lgOuFlKlMoWCNFTZ1nPLetb7pV9n7Z1/X6CJ93ks7iSuUy4wYKEqVtzIZyfvbzasMwr2nqe6/1zT030pbpBeN7m6bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730718702; c=relaxed/simple;
	bh=aS1RV5IccN4VjdNkh+IjN+mznBIRUHS1uP6nDzF8Z60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBU8N0Ph2EtK4J5ElV6AhYFzYiUlKyPoVw1AVp8njdEMFQYqhfuQGcosejTUrFO5O/ptIL+ZIOOoyuKG0kN/0B6TEUUtB7ED8UCY/TGfF+7Ym6vf5LjGJfkkM0jkAJVPgcmZ6Fg0XyBv+ALONy1/80a0/plOh6p5R4Z4Py4WqUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FmHYaZxC; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e4b7409fso3897345e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730718699; x=1731323499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fXfPeWafmveGhp9XKGGoB6z88NY3VZN6ji8tXCrwgCk=;
        b=FmHYaZxC19GwamqDkdYl5Pk5ZWKkIpm13Vz7E6hmyxWHycoIKiSJ2w6XDpiBIvS2RJ
         TbfepxSXl1KnHYaRX1n57nIjeRYfnJj5jrK2DAj83lghB/Ex546vmWz5N3zIfh3C7Q7M
         JgGBUmiRqEUF4zHevu/zn4JCFab3sVvKu+WGv+q9zYzxAvTAsNq2Dy0PauUCIbCo8tIe
         sOhuhBaTkR3ygYj14RoNMLloOcWLZWqRwmvaACmViA2BFmLFApeSTlcG7XPGsJIePSCr
         sd4dIP+dQ0wy0ehXeqQl741w/KrUg5tIWYym3VozMg6fmwiJwP/3PU+RU3uOt0fJw8yN
         J7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718699; x=1731323499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXfPeWafmveGhp9XKGGoB6z88NY3VZN6ji8tXCrwgCk=;
        b=quvzixYR/MVHM61zP08amJyQMJl/Qfljzpz2cWbsvuoHAPKyQGCGo4N+rM3YcxnDUA
         k7IEg1nh2gzNBYQX5VTg7oj4TSm+zsh7p2bdyqdyLgCKYPENRbKriiVuykjD3GKgNFh+
         MhFidL1WTTLIL1UxYnLY4zvrYajxC0dWfV1gWEOquIx5T78aPPD1qQ70po4UHg7lkP2H
         UHVIH2KnK1RVwUpzJuk0ql8q33JcQTOt9b3qtDtp/bwfGQRGawNageh2nHBAN+CedZN6
         UFiShqFG9IExPirC2BbrYn19rtfP/Xf4twu/nQYdvDr45BkJn6qrOVoOQsyeiSYdOH7R
         nk3g==
X-Forwarded-Encrypted: i=1; AJvYcCXMo09xMo1iCg7GIy6IBlduTt6K6Eb+nRHIOisyC5SPW355OQ8NBeXJuqrMHy4t5j3oFVgmh6D261+ruVtL@vger.kernel.org
X-Gm-Message-State: AOJu0YySj9gxgR6ULE2MINjUX2/4ClKPlp7E+CkHc8K5tiHmBavgBk98
	ehI5oQQ1ws/PcORtnQvKZlM2ScemQ7+hg9xTyRc1J5z48+njmGGJlOnMeiW1QFM=
X-Google-Smtp-Source: AGHT+IGqEF0e+IXoOCiPA1wD1EErF4DZpjMchrltLY3F4aIzKOLMtZB0smShDHkNlyYp+oQw+xv7+A==
X-Received: by 2002:a05:6512:20ca:b0:539:e263:331c with SMTP id 2adb3069b0e04-53c7bbee92dmr4530622e87.17.1730718698968;
        Mon, 04 Nov 2024 03:11:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde091csm1646261e87.251.2024.11.04.03.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:11:37 -0800 (PST)
Date: Mon, 4 Nov 2024 13:11:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS615
Message-ID: <ovzq44ymgqwnretjmifaygqbjaxewxyx3ritjwcvb2d7hio26v@3i3xw5x3icym>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
 <20241104-add_initial_support_for_qcs615-v5-5-9dde8d7b80b0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-5-9dde8d7b80b0@quicinc.com>

On Mon, Nov 04, 2024 at 05:10:12PM +0800, Lijuan Gao wrote:
> Enable clock controller, interconnect and pinctrl for Qualcomm QCS615
> platform to boot to UART console.
> 
> The serial engine depends on GCC, interconnect, and pinctrl. It is
> necessary to build them as built-in modules because the debug console
> must be registered before userspace is launched. The primary reason for
> this is that, for example, systemd opens /dev/console at launch (i.e.,
> when the init process starts). Therefore, if we register the console after
> this, we will not receive console output from systemd.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

