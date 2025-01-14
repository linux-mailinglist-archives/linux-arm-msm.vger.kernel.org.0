Return-Path: <linux-arm-msm+bounces-44999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20964A104FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 12:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C7E8161F18
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 11:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1074922962F;
	Tue, 14 Jan 2025 11:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="anTP6uWe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346B71D0E20
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736852734; cv=none; b=uRFe8A4ZL4oQd5c7/cAmSxlMVMll+n0x2R/yyLXlaWWtuG9hv2hcw0XPO4k1UK4aNTYjtW/NED0+CeeydPvl4NH3+5XqwK2sl4BjUMKKZwualpvpCcb0Rco3H8yHchoqSs/k7O/3LU9TOvGuHF7rCYwR/XRFyn4fsBkDQhByWsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736852734; c=relaxed/simple;
	bh=Ao1M8fWgwhlNjBBrHYsQEEjB0sMi+JiBBgJJ0a1ol/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKqyosFbv5+XHY3+0fg0Z9ON8DhvgVs7mABbxMVM06F/kT7bCuBrIcOBiAAUOMsw4B3rMUdEgMF1gKLAWlgV/+rvp2Om8da0sA1NZw9tKfE0Tk1SXqWBeslFPj+HmEAg2ttGDl8EOwOWAF1STS+2wRZ/j7PoLlIf3Mb7fE9GcsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=anTP6uWe; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3022484d4e4so49069591fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 03:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736852730; x=1737457530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ejrLFnBwCatlY6r8hGkdoeYmYx+mLsb3T3ChK8QOogk=;
        b=anTP6uWepYXqib/lGwUTyu7rzN5So+gc8qNrdw6x4OSnsZgjnnMr0eUD0xiUG0Y09o
         Z+1P7QkOJAkFmmJmro7MRMUfGprjuc6CNOd0ExAv4JbcpTJyFUXKkq+7PJr8RBlphwJl
         ZKgOI/JW4Rv2+edEWDvk0/xkLkP+8ImlhHrWlnttWnYMcEr4Nf/qN6qg3eTa14K39Yy6
         t8E76XuvB0qwIiO8JQuOni6XzBEQ3HNHdE8IUa5j1viIvoA7i1y5v+/F/J6Lgzz6jn0d
         0if1ZJ4AiMkYTwgrIXa9qEhfBwCNKg1wQ4rNBafBN5I74Pu7Sn1Oew6nHVDSdw12DI3M
         E2nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736852730; x=1737457530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejrLFnBwCatlY6r8hGkdoeYmYx+mLsb3T3ChK8QOogk=;
        b=T7E9SKLSiq0eRoPd4HAsJMoU9sWFlnMV0yl1/59Ixt3PDYgQAAOeGmUfGAahJQskSo
         cP7m9lyxng0k/pvq1htMz558sufalKVgvh+f3oyMiCi/oA1ksnMdHsaEExCnLhHhB2ih
         wjahhJtm/AWvf34hPapGVt6Ec34Blzhy8X9kyGHRfa/HVVlgpZb9Ht2pSxcTmP69zTFw
         l6fZ72maFX5B0+MpEAR0DruxL52D7imGAFlwm5+P4m7+2z9G+PrOHo6knkko6rYT/s8i
         Q5jO5yr4PnBLfGOj+BPsyXbgRHF7147VbF2Tx4xmuNf0XiEWbymLwJa64NnGfBhBzij3
         3b5w==
X-Forwarded-Encrypted: i=1; AJvYcCXUL4N7Eov3tj4wUpOMSFTueRDaZfRbh+TkAEP6a1Wt1TxqU4UmTjcvaGL6FqQI54mzT0Qj0SlLaHj30KNT@vger.kernel.org
X-Gm-Message-State: AOJu0YxjwKFov4dt3s8b5sO5KzwsvueLNhvbp7pn4/X57u7Q24Sh45se
	RphQ+VhbxsU/Zg59rqo6NJZ/5tppZPzRbF74oJI0XbOgkOdU4s+UMh4EkAsjbRE=
X-Gm-Gg: ASbGncugNJpF/okSru7zJjUOXwF1tiNyvZaIooFRDc9LOe8iTVWcG2IjLT3Ka5yFxRL
	1nU6OMo6kAsN3kmCgK3aBpJd0+lwgk7r0K+4ALpJ8KBZxuDwxIkodZtACFGCGgnZ2FZAY/kSwBB
	gSopGbRLC6R2GXg2Lm9wYIZ1qqIM6uVuNm7muHlacGy5dkxANyNXaQI7alDknyZUVBEwqWA7wsk
	NLD311UoAqccRbZ1hWTyI9sbdqVp12fIi93ODEpwPurU499rdGXaD/42ykPpPAobygS1Vy94qh7
	7yGh/34S8CJv/6Yn5rQD7cNkrhCxnFfNmDMA
X-Google-Smtp-Source: AGHT+IEBe/Fgxcaah4pz+mNPnU+GSP2+L82Jxcx6E5Sxu9sCuejCpiB8E9z0KxLtbFZbYLC+c8JKsw==
X-Received: by 2002:a2e:a585:0:b0:306:1524:20e with SMTP id 38308e7fff4ca-30615240283mr53003151fa.18.1736852730178;
        Tue, 14 Jan 2025 03:05:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-305ff0fa064sm17352351fa.66.2025.01.14.03.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:05:28 -0800 (PST)
Date: Tue, 14 Jan 2025 13:05:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, quic_tingweiz@quicinc.com, quic_zhgao@quicinc.com
Subject: Re: [PATCH v4] mmc: sdhci-msm: Correctly set the load for the
 regulator
Message-ID: <3nwrp4myl5djj6eiz4h5lom4tdvx3aifbjq2ojt2uju2ctiwvu@jmihj5z56qwp>
References: <20250114083514.258379-1-quic_yuanjiey@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114083514.258379-1-quic_yuanjiey@quicinc.com>

On Tue, Jan 14, 2025 at 04:35:14PM +0800, Yuanjie Yang wrote:
> Qualcomm regulator supports two power supply modes: HPM and LPM.
> Currently, the sdhci-msm.c driver does not set the load to adjust
> the current for eMMC and SD. If the regulator dont't set correct
> load in LPM state, it will lead to the inability to properly
> initialize eMMC and SD.
> 
> Set the correct regulator current for eMMC and SD to ensure that the
> device can work normally even when the regulator is in LPM.
> 
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> ---
> Changes in v4:
> - Optimize msm_config_vmmc_regulator and msm_config_vqmmc_regulator code logic
> - Delete redundant return in msm_config_vmmc_regulator and msm_config_vqmmc_regulator
> - Rebase on tag: next-20250114
> - Link to v3: https://lore.kernel.org/linux-arm-msm/20241226031845.2574669-1-quic_yuanjiey@quicinc.com/
> 
> Changes in v3:
> - Optimize the code logic and separate code for regulator vmmc and vqmmc
> - Rebase on tag: next-20241217
> - Link to v2: https://lore.kernel.org/all/20241127095029.3918290-1-quic_yuanjiey@quicinc.com/
> 
> Changes in v2:
> - Add enum msm_reg_type to optimize the code
> - Delete redundant emmc type judgment
> - Link to v1: https://lore.kernel.org/linux-arm-msm/20241122075048.2006894-1-quic_yuanjiey@quicinc.com/
> 
> ---
>  drivers/mmc/host/sdhci-msm.c | 53 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

