Return-Path: <linux-arm-msm+bounces-12554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D79008673C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 12:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 150B51C218C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 11:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253C01EB27;
	Mon, 26 Feb 2024 11:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v7/cjrUo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849AD1DA21
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 11:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708948051; cv=none; b=f77+EWNyuQuvSuZ7NCvTe3JWzTfoUHgK+YKFtkpNshdoC853GcpI5rGjWdV82c24trM9GtMoZf4VyFOfLEMLy/13mPQAX8wQUUzYxLBE664/3T75SbnEUYdtde/boHVAIfbtf7kF+ddXtAEc1uzY1kQnmBbxYDnr5Z4KVLpeeYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708948051; c=relaxed/simple;
	bh=xI/+JNTH1HBg6PbQe98nkhNmlv7el3dBU8j34qK8pO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u4YZcM9/GJ5JFEhX83y+rrPOMwMKZmofTThuUrIzZNB4L7FuQmNl74xXXAjDiTxApJOlCFscpkeKYjA5LQZGrPSqFcjXqfFuTx2yrOmvJJlnTRBmRKvn5Qz9/OwNe9c0N6rOQyqkK30kgmO5FSGul1yV8c4eZOwuWr3O1f56HA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v7/cjrUo; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-787bb0d85eeso200231885a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 03:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708948048; x=1709552848; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QRqUlMYfT55I0mUOriv+WhNqbIIJL/CKuAFOjzZC4uk=;
        b=v7/cjrUoMDVmHDw9PDqqPaFB335Ic7Tm0VaARmQVLFXwA3NFNcCRf4wKZ6hZHXMGNc
         qiT0tfVNgebYMDrnrM2V5xXP9Skd5LrWzUIbCZYPG8X+L29HN3UoAsjiSS3N8ts7sAOt
         ZG7k+biFRF+JYyMmWlHPjLw/n41oZzxgiJ1sCxTJgueX6+1FzWFVSvGlOjKlWJ3ejb39
         KQR0ZArPO5vPHCmQPXiTvK/Opryoi7jwG4jFhdnJmbNDyuqiOwFds6DAEtc+MowARqZy
         7YH9cn6UHRcsYFjbl7jZH8v7ffPlxjhFOavQH9WFrzmcCXwNPbA5vsnAd7dHriWMt4Qt
         L2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708948048; x=1709552848;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QRqUlMYfT55I0mUOriv+WhNqbIIJL/CKuAFOjzZC4uk=;
        b=pwwv0Hfaxs6zfc+sqcPgtD3nehkrT6DEQQ3+N+RvE1Kk84PE1mx/moheAibWYFd8VF
         XprUiknInFs3DerUbw/qf3IMLGAGQmoVmsthPH8nc0v1uEKnM/wkmVGfd2LC6rdqW0J6
         UbfAXi/ULWnf9rDMcw9sbXmDGkwiyQe+gUgsX3eHox6p4akijzWMOru4X5Ke+k+OIEs6
         mWxQB00e+3GsI8ogM7Y8ZoG/RP4ugUhLnqNnn/YsbSdWtYzNpBu38fNGSWickgx1BjPQ
         jqdw7l9uoqcRkzuT/ebI6+QC4WUXpNd1JKwqqwXG2+3xS8ZvzmAMlMgwnXLsMjHfaU6g
         kfqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmLzhJbIpMRnclZL4h2yicoKjgbkBYCmLzgecq2s/e04xrUYLrk3NDfB41LflUY+0eSyp8s5iRgV062vm34U/LePpaCsiT5GlZXoQAGA==
X-Gm-Message-State: AOJu0Yx1Mr9NSvQwxOfm18OTxbyccQ8Lozt5wDD0jtjuwaeTGOQM2juz
	IPgb5Zdf1rUVCzIBTUhXuB/kiAKs/RRhS0GCnsR9WWU6YqiJ4BCMbHrF2KJvow==
X-Google-Smtp-Source: AGHT+IHi3HYOP27dsAZYTozwNq3EVHMCKBPNrZ0oYnRIkB0H+YY5YnR3Yxm0XqH2Uh4PixfVEIMWgQ==
X-Received: by 2002:a37:c209:0:b0:787:25e8:3391 with SMTP id i9-20020a37c209000000b0078725e83391mr7569722qkm.18.1708948048577;
        Mon, 26 Feb 2024 03:47:28 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id u23-20020a05620a121700b00787c6703539sm2033427qkj.90.2024.02.26.03.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:47:28 -0800 (PST)
Date: Mon, 26 Feb 2024 17:17:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: constify
 modem_telit_fn980_hw_v1_config
Message-ID: <20240226114723.GC8422@thinkpad>
References: <20240222-mhi-const-bus-mhi-host-pci_generic-v1-1-d4c9b0b0a7a5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240222-mhi-const-bus-mhi-host-pci_generic-v1-1-d4c9b0b0a7a5@quicinc.com>

On Thu, Feb 22, 2024 at 06:00:23PM -0800, Jeff Johnson wrote:
> MHI expects the controller configs to be const, and all of the other ones
> in this file already are, so constify modem_telit_fn980_hw_v1_config.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index cd6cd14b3d29..51639bfcfec7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -538,7 +538,7 @@ static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
>  	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
>  };
>  
> -static struct mhi_controller_config modem_telit_fn980_hw_v1_config = {
> +static const struct mhi_controller_config modem_telit_fn980_hw_v1_config = {
>  	.max_channels = 128,
>  	.timeout_ms = 20000,
>  	.num_channels = ARRAY_SIZE(mhi_telit_fn980_hw_v1_channels),
> 
> ---
> base-commit: 3ab6aff5793c3c7bdf6535d9b0024544a4abbdd5
> change-id: 20240222-mhi-const-bus-mhi-host-pci_generic-5ddf8f13d35c
> 

-- 
மணிவண்ணன் சதாசிவம்

