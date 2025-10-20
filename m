Return-Path: <linux-arm-msm+bounces-77962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F00BF024E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 11:23:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B75674E138F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 09:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7465D2E1F13;
	Mon, 20 Oct 2025 09:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kRFehkgk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612AA2E9754
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 09:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760952185; cv=none; b=JV3u4UNWB8NajgGV1Bxisf42tQoaaqJCSK6EqA3EgCfIolOL7t1s2sWZ7FZ5qfG5J+/J9wEGAYLbESOZny8zmEwpoC94jY2/xj+iutr+JwCAWX9x93zJYOcCDnTeBGoGK8VTgGdIHAUZaZnSMEyTCijbt6VutKRJAOawF8sXejE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760952185; c=relaxed/simple;
	bh=hMFzAE+u+nASc8Ayen4g5l9uc68xWJVxUvqNMCpeXuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+OCepCwZ+vSqoppKHc/Qd0V380vqdp4n9HZCWC5xA6+04kU0AfuTJeSOz5rcsBhKE63YhgPa7jwszMPF7HpIl2JrGKAkQSETxQGKXYjtH1fmFZq53FtdanSo2EjBI1p8831JlqMZRGX2T+VmFMnGMF40VRFSvV3tGcu03rrLEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kRFehkgk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-471191ac79dso32987655e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 02:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760952182; x=1761556982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cdA6CsjifSV/CpZyjz8ziwjcjaEoS8UMM+9gCn6fwe8=;
        b=kRFehkgkfKCrEw/sHFVwfJ2FHr7wsdeWHSIchATr2vbQ5HRlgSJ+70P8hG4b1t24hr
         m9/Mk85Fgr7IoqG2q/crW/BJH4bjRHBe5UWKGfbdvdIfECAEZuvN/tKBy9OxsZn193/P
         rJKzVB/uanWu813YvHohLNrejGD++WeSrxRHdc3yBeQKkLdZ1wH5Uz0/LwHa5XlSctcF
         8awHmjkm+hVR3Up8anjZSV5f+zxspOmvEQYDiQztbtBVP2y8Jl97izGNlwwez3Tz7nBo
         Ve0Debc/kKQfa69Hm5Txrj+IUimJirPJLNJpBcpHYmYpVHW7vbGL2q1WMJiEwtekYi7g
         XcsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760952182; x=1761556982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdA6CsjifSV/CpZyjz8ziwjcjaEoS8UMM+9gCn6fwe8=;
        b=p97Cg0K56DqmEMBGPrzZpFpXwfygQ8t/L+MifUpbNFoHKUT2orOKKQWrWIq4iDIY88
         OkqAbxO1PAyB2cfrK8/SL03IdiY5XyhDslrOZ1BJdAfQfdQLojBcq6vi3pIGp374jdRI
         gLGvImdlQNKP9eVybUWLrXHbN2i+nyPeYevSOshX7vUUQtkWxE6YxvARXWMTd2608w27
         M75PLB1tE2Q9bZAUne5Bl41Q0+f6A4jmcnM06Sw/gSyS4ReSfnbk8j9vGAcbfCa3FDj4
         nKjfoGrUxGBPCciRvMmh4EX/zyzJNugqJJZKVqkR7Gbq7VRzn/5EFiiNA8lAh3s16fA+
         R7bw==
X-Forwarded-Encrypted: i=1; AJvYcCXXPb0ppRx4wYyQM8tR64Mja33uR2v3muHx5g5V1iwLEV11d6NCMwbWdivazEJ72HylgpKMUHc71uQ+wqF4@vger.kernel.org
X-Gm-Message-State: AOJu0YwYXMhxjxG7/N8Aped/uY8NcQHeEqNAKidtCVcv4uQhqvLnRosv
	LJkZBYq8uo8bx4eNaRGU5IxuSZppJkexlsMWMsIg48uoszLh6TXtNYTJdEn+QoK7+u8=
X-Gm-Gg: ASbGncvlMN2yUiv8tKKueCnnOXJOWbcVOOQV6GON8hQyf0lcwuPvCo58ESCu808PCHF
	V6vpQ7wV3+V1mHhUkyxYD5r06oVtqXENWIba+y20wNbEfY/RsU6auovq1y1YeVMUimOl2QDywY0
	cBB+e0Jv8PivvDFOl+jwXbxuNlqMQDJvd/mYSfSQZYrV9H2cnskqLxZsNSMiKsqPehpIqCzA5Lv
	6UPswDxirYesMO1Qxl0+/eTjMWFhj62ppoMpce/MZquGsGfI2dxruQf5jdPE9JWRcxfHKwtoAtc
	pW/zIwmdbNWlY0D9ZAz4aSKsy565HEclkPrhuym/Ao1Gr27i5bLWTYkJrvQeskGnZa8pjWLzSYe
	L0CkdSXoy8yfz8Ju6NnC0HLntDOlxKJByCLwRqrJns+UZ6SHsqaBXHJErFkjkOdc0ts64wmttYi
	GwwmcVyunSKCGhehNLr6Eb
X-Google-Smtp-Source: AGHT+IHNJzL0kQawtKy3fF4ivQKWG3FizlSZ82gu6HDNZ3hRrmE0LPQKVq82Mev6dpQnwG8Un0IyIw==
X-Received: by 2002:a05:600c:3b03:b0:46e:330a:1762 with SMTP id 5b1f17b1804b1-471179079dfmr98103875e9.22.1760952181601;
        Mon, 20 Oct 2025 02:23:01 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:363f:e987:7dd1:4f47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47152959b55sm139906525e9.6.2025.10.20.02.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 02:23:01 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:22:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: iommu: qcom_iommu: Allow 'tbu' clock
Message-ID: <aPX_cKtial56AgvU@linaro.org>
References: <20251015-topic-qciommu_bindings_fix-v2-1-a0f3c705d0f3@oss.qualcomm.com>
 <8e7a145e-6871-4974-ae19-40699747803b@arm.com>
 <56fcl2ip6ecu4inig7ecpjt7qrsdt6sehkrzrk6joysbp6tea7@4xdgxhhe3aso>
 <38c3bf97-4b69-4450-9e23-32ece07e38dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38c3bf97-4b69-4450-9e23-32ece07e38dc@oss.qualcomm.com>

On Thu, Oct 16, 2025 at 10:09:58AM +0200, Konrad Dybcio wrote:
> On 10/15/25 10:10 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 15, 2025 at 05:48:05PM +0100, Robin Murphy wrote:
> >> On 2025-10-15 5:41 pm, Konrad Dybcio wrote:
> >>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>
> >>> Some IOMMUs on some platforms (there doesn't seem to be a good denominator
> > 
> > It would be nice to provide some examples here.
> > 
> >>> for this) require the presence of a third clock, specifically for
> >>> accessing the IOMMU's Translation Buffer Unit (TBU). Allow it.
> >>
> >> Hmmm, but isn't the only thing that accesses TBUs the consumer of the
> >> qcom,tbu binding, which already has its own clock?
> > 
> > qcom,tbu is only defined for normal arm,mmu-500 platforms. Here Konrad
> > is fixing the older and more obscure Qualcomm virtual MMU device.
> 
> (for context: this touches upon 2014-ish platforms)
> 
> I checked the address map of the physical MMU500 that lies underneath
> this virtual impl and it doesn't fully expose the same registers that
> the modern ones do, I only see PWR_STATUS.
> 
> The BSP kernels for those oldies don't seem to have a notion of a TBU
> either, except for toggling clocks that contain "_TBU" in their name
> at both the IOMMU device and some DMA-capable multimedia blocks, which
> I suppose makes some sense..
> 

On MSM8939 for the &gpu_iommu, the "tbu" clock isn't listed for
accessing the TBU registers, it's necessary to avoid timeouts during TLB
flushes. See Qualcomm Snapdragon 410E Processor (APQ8016E) Technical
Reference Manual, SMMU chapter, section "8.8.3.1.2 Clock gating":

  Clock gating programming guide

    For APPS TCU/TBU (TBU to TCU interface is asynchronous)
    Software should turn ON clock to APPS TCU
      - During APPS TCU register programming sequence

    For GPU TCU/TBU (TBU to TCU interface is synchronous)
    Software should turn ON clock to GPU TBU
      - During GPU TLB invalidation sequence <=====================
    Software should turn ON clock to GPU TCU
      - During GPU TCU register programming sequence
      - While GPU master clock is Active

Might be worth clarifying this in the commit message. It was also
mentioned in commit 5bc1cf1466f6 ("iommu/qcom: add optional 'tbu' clock
for TLB invalidate") (not sure why that commit didn't adjust the
bindings...).

Thanks,
Stephan

