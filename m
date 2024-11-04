Return-Path: <linux-arm-msm+bounces-36908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA77E9BB17F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 11:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC099281189
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2024 10:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6A81AC892;
	Mon,  4 Nov 2024 10:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AU5V7fnL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05B13049E
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Nov 2024 10:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730717401; cv=none; b=mORmhQ+rE85dr/k3lPRnD6yQxqEQIRSw47xlxiKnTx24qoJJyaktUYVE+XP1nt5xjH4kkVZZgbCR+UqpeS/xBy6BxCTbhDbWGn2c1k/5gLSoXyALYAucED+QSjluHFxv4DIS+EzYTcbcSd+7NfYhpjDKDWeSLdhQve+zRsw28X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730717401; c=relaxed/simple;
	bh=HjiluiYYU8ct9uzPa/9+3mrpL1aTF+xLCA8ImAoVnW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctmqbHOwkGMpyFxYAYel+QzvskVAY+E6Nemp5xwGzxelFFFeOojseE7hmmyYdKn5BCSgpwD6V/f6fJxqcJ+3OAQgbWG+0N4LJh/gXldsU9JYNV30QjRnAXQ1kAe2VcMdyzRS8jspoziDsmKpSOKuzDdxzXFh5+3wondYpRR8/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AU5V7fnL; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb561f273eso30668191fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Nov 2024 02:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730717398; x=1731322198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XeXQFy9Pj3a/4ODUXYJdySuoRgQr+QO7RlBYiaBrsZk=;
        b=AU5V7fnLPInUAccZmsYThZC/FIOOhHmW3PGKooWGVc9ogmaLvR0mCiFk64r6C9nLPh
         Fj0qV/ce132viVbNlqCheppIVYzRvsUTbLXzqoRxF4ISNpudn9vMefX9sNWoN8zSHakA
         gHzkfG5N8dR6JweS6kUqa+Y6Pksb/YkY4BPiQytYtUFEvtNNvCANe5pqoWoLw47H6YXJ
         /MJkWyRBxgaFp291ARQ62hRJxspi8XT2IAfIAmfmNMzr5JW+cdKltHBGK07vkB4uOKqm
         jlobwEJiLmCifTwuyXvRzDFgZ7kluOZWRefQIYkIBEB5NJt1uqljnKZQDaCXAmgrmLMo
         pS9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730717398; x=1731322198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeXQFy9Pj3a/4ODUXYJdySuoRgQr+QO7RlBYiaBrsZk=;
        b=czo2oWLi0J+dsC/3XCxwekmHDXyeOZb4X0+FnXj9TIQ5nUXf7L05cced0z1HPROL3S
         V3HG2PHvNMls0lfhjUea2d3EYpquqmiWNBvxSJDLCxioKoFg+aAW/JhaAQE8fItdyLAK
         V+BDXNQTw0dqQoPOdc0/ZrPUZCalhP9hwifyr8Kcf0WeVnnPScD5Q8Y6lOzAnHrPq/kK
         ZlrJ+MmdYdxJ+cc41Z6ogG2erCqvXQowtErYypGd5xmeNRSkh3TbI4EpOG/ZKkmh9O93
         lsRbAvZFG1JoJYNlj+Yje+3gRuziy5/amLj8Mj0gDUHPFK9b9dc0DefvvMj92+opfA+3
         +EYg==
X-Forwarded-Encrypted: i=1; AJvYcCU7MHopt0ukhzF7o1rHO2orpu6K+Y3VrSZg+qDK7HEaTe6xY6PuXJsV1J207HS/p5W1dn3b737+3r2GC5JD@vger.kernel.org
X-Gm-Message-State: AOJu0YyiAhF3SC4Gkl46pbtr8T7gT/cwbrdMWirin+y9+UnggBfLvbJw
	yM9BtavVyRzfpamyrms3cGjkDwCn/gUMXW+bcsyZJApvnFCqvOafqEfDah6Jq30=
X-Google-Smtp-Source: AGHT+IFkB+YOxqygY78jfvdT7ykV+NKLizBcQos+MO01VyMRIJ9LTRYILzClrQ7HWeqYmtT14mH4Sw==
X-Received: by 2002:a2e:1302:0:b0:2fb:5723:c9ea with SMTP id 38308e7fff4ca-2fd059d336amr70161111fa.30.1730717397626;
        Mon, 04 Nov 2024 02:49:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fdef3b732bsm16206121fa.4.2024.11.04.02.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 02:49:56 -0800 (PST)
Date: Mon, 4 Nov 2024 12:49:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sarthak Garg <quic_sartgarg@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com, 
	quic_narepall@quicinc.com, kernel@quicinc.com
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
Message-ID: <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104060722.10642-1-quic_sartgarg@quicinc.com>

On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
> This enables runtime PM for eMMC/SD card.

Could you please mention, which platforms were tested with this patch?
Note, upstream kernel supports a lot of platforms, including MSM8974, I
think the oldest one, which uses SDHCI.

> 
> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1..6657f7db1b8e 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2626,6 +2626,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  		goto clk_disable;
>  	}
>  
> +	msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
>  	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>  
>  	/* Set the timeout value to max possible */
> -- 
> 2.17.1
> 

-- 
With best wishes
Dmitry

