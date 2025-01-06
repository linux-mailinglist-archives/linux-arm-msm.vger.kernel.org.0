Return-Path: <linux-arm-msm+bounces-44017-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F9A0288F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 15:52:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98FE63A4567
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 14:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCFED135A63;
	Mon,  6 Jan 2025 14:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xiiAzNIF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE248635D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jan 2025 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736175125; cv=none; b=NHqDvX13q7eCRodZLd5uRc2PDpGhtZqZFW0+R63P2rHb9vsMKUqBMscSPyXJgZ1/jsFZouiBNOwK5IvRvXJtP810QMd9SUmNz3HTzCR53xK+zLYpx/4UkzIK4ZkjP5F6sUKe3ioWaWHsp6g9tLT2l7Y2anQdpkl9fqkNbF94Ng0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736175125; c=relaxed/simple;
	bh=P2Yoy2vCOV6x77FyFR28353Mr6QAvH/ioPjEKxMfKSg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/harjZej7qvyU2jl0gLuU6V8EvDmuFWT7sSDZnDf9BZq6SLwoiJj9gB9wrlLpR3XZWLr4631k3V+MsJfQRm0CgOU+95KJmtwv6iUFeSdFBb0fSRSgINULcrlMQtW0IPrVe1MGM2J+2xYXtDkAGpPgIqPX9Z+hwP0CHw8Dowg68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xiiAzNIF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2156e078563so180611805ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2025 06:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736175123; x=1736779923; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RPzQv9JmUmJLzMLrGpE7zH6s1/r5xLoODlrZlCZTRjc=;
        b=xiiAzNIFsQ/LZ+eSZoNB/F1+mvskQjyjJCKbNXgbRt6csDjlBsrtYIUMu8lRq2U28w
         YpI3yAe4AYNJ6yqUHG6b2COTMzY+N1cEILcVN+k3JEZdctn80Bnv2oNI66FiDjFSVItF
         yqMb8/wCszlR8AWDXLB9kHKYceXZIvDG1fEuKkUY6oJlWu2j7KUfiCXcapJrhmltjOel
         2uk2ncT/xUWhVsPGijF/8XA6aohJY7InZ9sRT43FBbMrurf5LvZ6+0HUhyekOphSz0nv
         sBUWeypSkHtLOjWjz1Pk827NJ8EFqhXYDlfo3s+2+5WvAuPiJS4SvyNkSa81DMj0GmA2
         /fkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736175123; x=1736779923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPzQv9JmUmJLzMLrGpE7zH6s1/r5xLoODlrZlCZTRjc=;
        b=DfgULWl+HPhzUim5DDPFuq6UdyOboCiIClk1WnLFLvzG/yu4EC2v2wvrSaiadsYu/Y
         kdi3K+UjUYYcpiOSVHixDdEL3GYWx21jyX0gRvu7tJ936OdptZfOJRdeW4vAORlImsMA
         +D+R9nQACFGY4z8JzQ02LZmlBhPAkQHOu/YL6Ms3dedInMrDSFavhnekkfcIbZ3QUcBN
         KnZstbvgFvGaH8X6CinMnS3NQkqk3rvip677+XPJUhawgJGM6TE+As8N/Ar9VgPggKlS
         Fe5x6FDFbbvdnnTPjhuZCBoOiM6pX59N3viXxcXwQUKBHFXmD43BtTjWQCUZtQIR7fIJ
         faPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCW6AkPH11MBcAYsPuGFKN8WP+HsRmyhs0eZntD3jyWZQMejSVcxmdVGG8Y7hYSJt/oobJt7OdV8bCWLQy@vger.kernel.org
X-Gm-Message-State: AOJu0YziMRounbLTarB6Q91vsw82uXAzLP5RABtL9hYuAR4r+JRs3/48
	yd35o6JYETlXjczcUnOaXt1yLR9FbuW1L9A2Yeubqnrq4QitJr/t8dIUilqKQg==
X-Gm-Gg: ASbGnctkqSh5TirmP+P0GvFR8w86dclP3FplIrPn+3HVMzzLVim6aQKm2989NMqM1q+
	ptdMsT5+WvpbgDjvgFXU4wZtaPTaQVR9XdmtkmQkzxYzce8r1HHga68Nk4ZZho4BDADotSTEfuU
	li0CCnbB7tmSlrfZtqjQFuie4tfn/1Osooew19Nppqe0gFsi8eS47qMegauQy1BMDjfMGzKR0FQ
	TNz5vy7WyLNpcfCw3ZqaK28oD1oCdnWYNiw2T46KowyJztWWKA9C91SZg8ZZBD1yxA=
X-Google-Smtp-Source: AGHT+IE4mpVT+GjLv3+7pfnCFcTYcja+19fvRAPtd/vCZh5myuA6s94pcYZbmYqV21GyNYKnPHbFfQ==
X-Received: by 2002:a17:902:d510:b0:216:48f4:4f1a with SMTP id d9443c01a7336-219e6e9df37mr718707665ad.16.1736175123345;
        Mon, 06 Jan 2025 06:52:03 -0800 (PST)
Received: from thinkpad ([120.60.61.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96e85csm293333705ad.61.2025.01.06.06.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:52:02 -0800 (PST)
Date: Mon, 6 Jan 2025 20:21:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vivek Pernamitta <quic_vpernami@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Enable MSIx if the endpoint supports
Message-ID: <20250106145159.oqseq7ysedmrmyey@thinkpad>
References: <20250106-msix-v1-1-91d7b7143118@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250106-msix-v1-1-91d7b7143118@quicinc.com>

On Mon, Jan 06, 2025 at 10:17:33AM +0530, Vivek Pernamitta wrote:
> Enable MSIx if the end point supports.
> 

s/MSIx/MSI-X

s/end point/endpoint

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
> Enable MSIx if the endpoint supports.

No need of the comment here.

Change LGTM!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 56ba4192c89c16b4882d2e7c95f0dc689fd1e267..af1380220904a7e6232ff1b374da0a4ea49cb470 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -949,7 +949,7 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
>  	 */
>  	mhi_cntrl->nr_irqs = 1 + mhi_cntrl_config->num_events;
>  
> -	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSI);
> +	nr_vectors = pci_alloc_irq_vectors(pdev, 1, mhi_cntrl->nr_irqs, PCI_IRQ_MSIX | PCI_IRQ_MSI);
>  	if (nr_vectors < 0) {
>  		dev_err(&pdev->dev, "Error allocating MSI vectors %d\n",
>  			nr_vectors);
> 
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20250106-msix-a4c5488ecafe
> 
> Best regards,
> -- 
> Vivek Pernamitta <quic_vpernami@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

