Return-Path: <linux-arm-msm+bounces-35853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CD39B00D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 13:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB7961C20E81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 11:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1AA22B66D;
	Fri, 25 Oct 2024 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sSoW3J+z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1141D363D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 11:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729854289; cv=none; b=bQHavmJZ1QuDIKIotDLrWLJKLLzrc8V2U0uYbU2V5nKsAA+Zgz9jPpWPHrhSs9+iLATshuOEZmaP32c6XJs3AkQPeB1CG9BNmaZVSd4Ex9gLZaOOypBT4NYg9rEuQ6HZ2Ez62ihUQ1ByTEhU1zMUCZY+Fx2IZxjqhWaurcnS4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729854289; c=relaxed/simple;
	bh=f1oZLRWi1iceQY+AnZhdiGRT5xb+TXAIA7EVsI6RjVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oKsFMmAm3OrVAbAvBBfYReK6hc4XJC75E8hA2FU/nE83Iw4JcKUag9fEnPw7fpsRE2K+3H3vKcqgvFXzqlx7o9yc/knnZ9f1KHyBWf5K2kZnow10P7Ucm84XLpkzAW3OzhEuIphyssMnhyUw9WYKKzt4XTmDchPkSGfmy64BugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sSoW3J+z; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539eb97f26aso2004717e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 04:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729854284; x=1730459084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0npUi/QQj/8hAzQtbz5IYAGn1L/kq6JvsHfxRiCt458=;
        b=sSoW3J+zOTlKtxZwUFGJF5GpSDAkz2KxWybEJoPv149b8Vqq2Q4h87j6wlAArPsvWE
         u/0uNPFF0DWXJv2SFjgPTLJhRPMHEf+IUeU61UTUGliDnO++SP5b3I5mhqvuRMgzkbfj
         AWsMRyo35n8Ci/JZXFxk8tgsIS7ogGt/QqJtWRLO8XrJez72DuLmjTX3f2hNdMbbwEGC
         ZC8JZ6wrZoeGbNx1Ompd67+WpPRakh4OvfCtC+RQjqHpf5UaEpiQNaq93Ir6nfLku4bf
         oCRDH6BO6O1/YUCvFFQJdDwHZGTjc1P1gyFOXIqirxSwcmL7qEM8hUtod5urWYvasoJe
         VolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729854284; x=1730459084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0npUi/QQj/8hAzQtbz5IYAGn1L/kq6JvsHfxRiCt458=;
        b=e3H9HmZYKxwbHQPNfZ+176brQWGnlBItL5mBY8TYWrpGS1l3G6iXxxFw9+KrPIXb45
         s0y7fMSyHR0c4lcrm2/OWslIw9+PKPhMwr/67RZZ2jXICAAwcvConzrcyndr9i8bm6Sa
         ZEjZa2duzPCtn4nv5epeFl58+UvjzozTDL9zf+PIfgjFL8iWMT/FihwJDdR/cQDjBD/Z
         z42yC2H3WC1b8cGZoqHwE2PgKQQs7gxLmFQiKTwKNJ2EIinT8ZjoxgDO+r9cptRr8uMf
         i/ec0kxNZuuGAGdRgbf3mpFYg1ERZ3jHd7sUS5FWm3vdn5/1fusdtmQPC6mO4LqL6YSn
         suBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPjtiRZTlqMuUVp6Tu4C5anKugZDjWPqfEG0IQY3W06aPR8KVHwJggQTa1sj3AUxhnyCAKBe3hd02/lLjh@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+E5x5EhgE+GHgvAgsOX4/3+YuBV8/Tb2xOCRxUevxHO6AKGd
	OJfaizoXmZgLSqa6pmwAnk/wO2UP62/Dh39QJxJb1Ov1TszP+9+K+i26nlwwHrw=
X-Google-Smtp-Source: AGHT+IFBLlidK1lSRc4guNpkuXJCSvMxBnTQgcK54ic6c+sgh480iBRvsq4Il+3SdkKU9IlNSqXOpw==
X-Received: by 2002:a05:6512:124c:b0:539:f699:4954 with SMTP id 2adb3069b0e04-53b1a39772bmr4551085e87.58.1729854284214;
        Fri, 25 Oct 2024 04:04:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10a555sm138281e87.34.2024.10.25.04.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:04:42 -0700 (PDT)
Date: Fri, 25 Oct 2024 14:04:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jiajie Chen <c@jia.je>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add performance hint for
 boost clock
Message-ID: <dbnc6kq2heyva2c4c4bt6kwo62sifi4kws6nup7etnnyyzawes@uag66bceq6is>
References: <20241025031257.6284-2-c@jia.je>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025031257.6284-2-c@jia.je>

On Fri, Oct 25, 2024 at 11:12:58AM +0800, Jiajie Chen wrote:
> The x1e80100 CPU can have up to two cores running at 4.0 GHz, with one
> core in the second cluster (cores 4-7) and the other in the third
> cluster (cores 8-11). However, the scheduler is currently unaware of
> this, leading to scenarios where a single core benchmark might run at
> 3.4 GHz when scheduled to the first cluster.
> 
> This patch introduces capacity-dmips-mhz nodes to each CPU node in the
> DTS. For cores numbered 4 and 8, the capacities are set to 1200, while
> others are set to 1024. This ensures that the two cores can be
> prioritized for scheduling. The value 1200 is derived from approximately
> `1024/3.4*4.0`.
> 
> Note that capacity-dmips-mhz is not ideally suited for this purpose, as
> it was designed to differentiate between performance and efficient
> cores, not for core boosting. According to its definition, DMIPS/MHz
> actually decreases with higher frequencies. However, since the CPU does
> not support AMU, and no elegant solution was found, this approach is
> used as a workaround.
> 
> With this patch, we observe two cores running at full 4.0 GHz without
> core binding. The single core score of Geekbench 6 increases from 2452
> to 2892, both without core binding. Tested on Surface Laptop 7.

I think this is a nice hack, but I'd prefer to see scheduler being
improved instead. From my (ignorant) point of view this should be close
to SMT-based scheduling. We should split the jobs between the clusters,
if that provides better power utilisation.

> 
> Signed-off-by: Jiajie Chen <c@jia.je>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

-- 
With best wishes
Dmitry

