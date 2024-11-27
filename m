Return-Path: <linux-arm-msm+bounces-39243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E139DA149
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 05:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7882BB242A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 04:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47B8139D0B;
	Wed, 27 Nov 2024 04:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ypQEskSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB932282FE
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Nov 2024 04:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732680041; cv=none; b=lYKsDKYqn4ZPGbIrANuqw5xMlh12pcTBEcK/VlJvCog3su5JnkDUkTU3Z3K6uvkl0z+rvDq7jvv0TeF7YbZMLWIoE3hy4KfSaZ1Bfta76jinBBs6qehkYERCL+ABu5rHyVV7Tc8J8jw8vUbSgYcIhkXUJE2Q/M0Zuw5Ecr6X3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732680041; c=relaxed/simple;
	bh=HmL5KghJhyA1NHfNg2xF4U1baArdo1wSpfGkfHDUK8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U57WiyN2caBFWuXJhMh5RkrkX1jI/fA5jkqrpmZNBixyd/8sPhWvqrv+x+CGnUGxcCri7MvRD6scELZ7fxqoayAYNwLXQ5zmjN1QAen3XAm09Vg9fqh/54a1hpO+Kan035ZbWUm1CS38kQ+PPsBjWQ11g51uNT2rkf4JJmjX8/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ypQEskSa; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53de79c2be4so2723879e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 20:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732680038; x=1733284838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PvYaGtKoOy0NaIKR2w9foJlILqskaLFgzQORKPCUl0k=;
        b=ypQEskSanMKrjKGW+ixrojbbc+vVCzBWsMpVL9nTjtGn0gSHwPPaavt4VHF20ZmSwX
         IbTmSLkhVs6yLZjQNzZMLmoIfazgBalrwYORLw3PaBV8G8ycTYpdhcQ+fj420ZQVDtaU
         gtNayyC8GZtMAO9MsSbffhU9WKvNiq4fp8WSCszq3vqHZnN2m7XzeBm0XsANRG/RKtJW
         308N3TCiFYqer2ZLFB2GT7wxnSoNhc8fy+g3h6Aw42zA59SLgY6f1NL96eEi9mf1xD/t
         d5WmTxZ7dC+u+ushXiWlYNc/bIxxr2ernOD42FKPAr4PHpFPPuWBg0+HjyNT2UuL2DkU
         7Hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732680038; x=1733284838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PvYaGtKoOy0NaIKR2w9foJlILqskaLFgzQORKPCUl0k=;
        b=TJ596xHIi3Hm+tfx7xt7SBWLyxX0/1UVf2CuISJaL6a+6KRjSLDoeKbGztNx8TgHmt
         Au2kytrBL9yqZ4d810f+HWWwhfAW0P00K4tz660AtB3DLtnCs4n2pczHeZX9jBUB4nkn
         z2ZHwB2ER/bwCnMZ6OEX698QQ/PCAYLM5C1BXXeyQ+KnBqtAdlCA+vEQXhIWTuuDncdN
         iVYPxj/eopz+lwgtpRYm840aQPjevwNF18UGJYCUGWZhWuUmsxFgAcl3kUDhnI5Z1emm
         gWPB6dgSXkGptkvqA/aqdQ5yPqDXrqQyLTZDiB/De+oegNu4cdwEwIinQv5kFSrXqqLA
         mXbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPGeZfrBHhy0pDlS9RHrg3UHveVedKflHER4bSakdOxDJY+XkGWYF68tCS5c2kHBUmP0uNH2skYZQJzXWB@vger.kernel.org
X-Gm-Message-State: AOJu0YyctB5EZwqIBHJvJxO9DzsYd4XCGyjSXZ3yz3+VQWEUbgS0iemu
	RnbBHULipd1yCEH8Bxp29pBhvLsbB+/UyKGPbh/O9UJwU593f0vAav+zoN1oMzk=
X-Gm-Gg: ASbGncs7rnbqlHrOeCGFMMoqxQ5qsIIYRIoE0x2JeN9BW6ImT/60d6Rf2OSmOmuOu+u
	P1o1Rb4IcBFqC3+QcZYHfIhJAofEYWfB7+VfYg3LKkW+bhsXJ3tDyCWkCki1crzWr0UljQ/7Tue
	UwyhNuFkKEhS/uKe8JNi2Nc5hl5egCbH8OR8v0TgFc0HTR2leFHKBjcwd6pXGzEcWQnXNBzjjkx
	SBnpWOr0oExxbuW9NCm5SuTIIjdkoaIXQ4RnaxWLKtBEoQvH7yLxcG7rB5SIH+yd01O2MaVM5eQ
	r4HtMhvWy0DEDeaxfAiPUnvgWWLFag==
X-Google-Smtp-Source: AGHT+IFe46Ut3ixzrDaftB+74Cb5uVfPJwBiur6xDbxeHzU02v/b8vYaE19Gaapdwhhc1BJVVfN3HQ==
X-Received: by 2002:a05:6512:b15:b0:53d:ed4e:e5af with SMTP id 2adb3069b0e04-53df00dce8amr636846e87.33.1732680037797;
        Tue, 26 Nov 2024 20:00:37 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd88b54cbsm1914492e87.214.2024.11.26.20.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 20:00:36 -0800 (PST)
Date: Wed, 27 Nov 2024 06:00:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: adrian.hunter@intel.com, ulf.hansson@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_tingweiz@quicinc.com, quic_zhgao@quicinc.com
Subject: Re: [PATCH v1] mmc: sdhci-msm: Enable aggressive PM
Message-ID: <zrqcbghhhpmr2dknipkmqxcxcxnlqr4ury4haqq4n6xja5lc7p@6gh56cndcwjl>
References: <20241127031708.2343727-1-quic_yuanjiey@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241127031708.2343727-1-quic_yuanjiey@quicinc.com>

On Wed, Nov 27, 2024 at 11:17:08AM +0800, Yuanjie Yang wrote:
> The sdhci-msm driver supports the device in both RUNNING
> and IDLE states, when eMMC/SD are not reading or writing,
> eMMC/SD are in IDLE state, the power management module
> will suspend the device(power off and reduce frequency,
> etc.), putting the device into a low-power mode. But the
> current sdhci-msm driver cannot put device enter into
> low-power mode.
> 
> Enable aggressive PM capability to support runtime PM
> functionality, allowing the eMMC/SD card to enter
> lowe-power mode.
> 
> Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>

What is the difference to [1] ?

[1] https://lore.kernel.org/linux-arm-msm/20241104060722.10642-1-quic_sartgarg@quicinc.com

> ---
>  drivers/mmc/host/sdhci-msm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index e00208535bd1..e3444d223513 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2627,6 +2627,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>  	}
>  
>  	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
> +	msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
>  
>  	/* Set the timeout value to max possible */
>  	host->max_timeout_count = 0xF;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

