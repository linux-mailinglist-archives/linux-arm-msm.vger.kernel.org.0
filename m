Return-Path: <linux-arm-msm+bounces-31851-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E597A629
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 18:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C5B028372B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 16:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF58D14EC47;
	Mon, 16 Sep 2024 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgEH6/W1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com [209.85.167.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D413D62F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 16:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726505055; cv=none; b=e2VLn4cBkUDIEPA2Kd0ibtSaxoaOZy8OU8zTB/cXtgSeE1Nz8+iWcaKR2DmAkzcPZ0LKucUcbf4MtdDf8/OKGaHk8fgEw+ZZnXiGtFZ8V/55DbyxLtshXdplxgrcdykK1ebpSr2/xOK2RRVbcEpuIE875ubY1IuOofUBnGedAzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726505055; c=relaxed/simple;
	bh=v3dHwuCf7bGJLiOzqeZS/vfPKiy2VCc19nb07+JFkRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7o93wNNwccQ6vsyMUoGIcVc/kUXYjJnOADgBKRsBFSK3tt8nkpouMDS9Y/tjs9eTCMcW1wH+JsVGDHvvlIY4ZT3DsobOjdKuvaru7HVx1NQEhdS+5qwzLo9qUNsOcfDPL8tLbgSXA4hLrGYgBf5GT1ntqKtN/XjJMWiXmeZQIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgEH6/W1; arc=none smtp.client-ip=209.85.167.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f66.google.com with SMTP id 2adb3069b0e04-5365d3f9d34so3705348e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Sep 2024 09:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726505052; x=1727109852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9asM4ZkqAqq7Aiqf7cPOjNzz9OLiaEbdqNNy38RQ7zo=;
        b=rgEH6/W1WR1FdB/LfzWFMPTs5PBTVaeUFRlbmfvUpwLAHL7I7z2CyciUcnzD4ZWuS/
         01QCesVS/pGAcaphUVvHUnnn/J8Bc6smSx1YwVyBTnnFgi6jFJjqoN5asCGg06n6yLcN
         cdKQj9bjj2doTDAjuMKDXqQPBTYG5fg23S0UuLivkbwDQ93diihIUsBRV1+dT08bbr/z
         PItKT2MFtgcBmiCW1Z60UdVyrQkzZnvm3qiXFSdKAv0cXaIStxmGiFql5GEj/EECdMQd
         J8+7i8lX9uPt1Mx3XgqZtg5+6aN/O+WR8vav79tuH/ILMnRy4xnVQ50LCAVR0c6taobK
         CXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726505052; x=1727109852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9asM4ZkqAqq7Aiqf7cPOjNzz9OLiaEbdqNNy38RQ7zo=;
        b=bR+7fIw7kY8qqLGZ2P78ep98ugS7jxWgqjkn9W/oi+/6lbV3BW05Tv1f2KKGBFHZZ4
         96E9ql/mahWIOCWBmaOFBSdf8hZa4EPhRPmym+0ztZh8s5o88V802w3mF9CAwu9uzKws
         ngk9T8Hp1GxOAInzZLO5iHcEsaZ7z2ksw8Ym70GS3BdXLL8oXSnz8121zHKtO/1lMWLl
         O3hmnSxV866400t5W51aIF1WDPN/E1ik44fhZ+tT6fGq0R1oHE2XDFGu/L2I3G5hxK5B
         fnVW7N4hk0ebySAq9tQAj5aOlMwyqsg45Cn3pZJf5BoTTgEyD50FmA10TAoc6YTKfrwI
         yANg==
X-Forwarded-Encrypted: i=1; AJvYcCVu78cmkemtnScqJJAB0gu3++29mfQMOzh05fgpLWhltX60MKXvl9IsGAFoheBXtyfqPa1wtzVtZOLJucl9@vger.kernel.org
X-Gm-Message-State: AOJu0YxxP/dPyWrtig5so+UCKnTJCpvzLyQV7NwJZmE2IBhQKTrP9m62
	dgZUbsjavnfgX0woFvcJP+B4u/oFHkf7Ny698GnA5TGZBdxYA5HUvxItLHwOy3I=
X-Google-Smtp-Source: AGHT+IFI+g9XCv7kdqUJfAZmJ0113Wysbm+R135Fgz8UC6iz9OeDKve1D2N2nbFgvz2GB4H+HhcNbw==
X-Received: by 2002:a05:6512:a90:b0:535:3dae:a14b with SMTP id 2adb3069b0e04-5367feba05emr5940508e87.2.1726505051760;
        Mon, 16 Sep 2024 09:44:11 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef80:251b:f65d:68f8:ced1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612b3bb2sm337335866b.136.2024.09.16.09.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 09:44:11 -0700 (PDT)
Date: Mon, 16 Sep 2024 18:44:07 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Halaney <ahalaney@redhat.com>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rudraksha Gupta <guptarud@gmail.com>,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 2/2] firmware: qcom: scm: fall back to kcalloc() for
 no SCM device bound
Message-ID: <ZuhgV1vicIFzPGI-@linaro.org>
References: <20240911-tzmem-null-ptr-v2-0-7c61b1a1b463@linaro.org>
 <20240911-tzmem-null-ptr-v2-2-7c61b1a1b463@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911-tzmem-null-ptr-v2-2-7c61b1a1b463@linaro.org>

On Wed, Sep 11, 2024 at 11:07:04AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Older platforms don't have an actual SCM device tied into the driver
> model and so there's no struct device which to use with the TZ Mem API.
> We need to fall-back to kcalloc() when allocating the buffer for
> additional SMC arguments on such platforms which don't even probe the SCM
> driver and never create the TZMem pool.
> 
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm-smc.c | 28 ++++++++++++++++++++++++----
>  1 file changed, 24 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm-smc.c b/drivers/firmware/qcom/qcom_scm-smc.c
> index 2b4c2826f572..88652c38c9a0 100644
> --- a/drivers/firmware/qcom/qcom_scm-smc.c
> +++ b/drivers/firmware/qcom/qcom_scm-smc.c
> [...]
> @@ -173,9 +182,20 @@ int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
>  		smc.args[i + SCM_SMC_FIRST_REG_IDX] = desc->args[i];
>  
>  	if (unlikely(arglen > SCM_SMC_N_REG_ARGS)) {
> -		args_virt = qcom_tzmem_alloc(mempool,
> -					     SCM_SMC_N_EXT_ARGS * sizeof(u64),
> -					     flag);
> +		/*
> +		 * Older platforms don't have an entry for SCM in device-tree
> +		 * and so no device is bound to the SCM driver. This means there
> +		 * is no struct device for the TZ Mem API. Fall back to
> +		 * kcalloc() on such platforms.
> +		 */
> +		if (mempool)
> +			args_virt = qcom_tzmem_alloc(
> +					mempool,
> +					SCM_SMC_N_EXT_ARGS * sizeof(u64),
> +					flag);
> +		else
> +			args_virt = kcalloc(SCM_SMC_N_EXT_ARGS, sizeof(u64),
> +					    flag);

I'm afraid this won't work. For kcalloc, we would need to flush the
cache since it returns cached memory. In v6.10 this was done using the
dma_map_single() call that you removed when moving to the tzmem
allocator.

Actually, taking only the first patch in this series should be enough to
fix the crash Rudraksha reported. None of the older platforms should
ever reach into this if statement. I think the rough story is:

 1. The crash Rudraksha reported happens in qcom_scm_set_cold_boot_addr()
    during SMP CPU core boot-up. That code runs very early, AFAIK even
    before the device model is initialized. There is no way to get
    a device pointer at that point. Even if you add the scm node to DT.

 2. AFAIK all the ARM32 platforms without PSCI support implement the
    legacy calling convention (see qcom_scm-legacy.c). They will only
    reach qcom_scm-smc.c once during convention detection (see
    __get_convention()). This is a SCM call with just a single argument
    that won't go inside the if (unlikely(arglen > SCM_SMC_N_REG_ARGS)).
    And qcom_scm-legacy.c does not use the tzmem allocator (yet?).

 3. qcom_scm-legacy.c does use the device pointer for dma_map_single(),
    so it already needs a scm node in the DT. I suspect MSM8960 does not
    hit an error there only because it does not have enough functionality
    enabled to actually reach a non-atomic SCM call. This means: Whoever
    adds that functionality should also add the scm node in the DT.

It would be good to add explicit checks for the device pointer where
needed, instead of crashing. But other than that I think we should be
good with just the first patch of this series?

Thanks,
Stephan

