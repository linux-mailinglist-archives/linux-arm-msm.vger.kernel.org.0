Return-Path: <linux-arm-msm+bounces-29463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BEF95EC03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:32:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 649DE280C91
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 08:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84291474A9;
	Mon, 26 Aug 2024 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PL7/PMfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC561422B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 08:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660967; cv=none; b=hLXhu2jJoLPGAMY5CFjRNWx9CoGvDjU/Mc/oGWx2Ia3b9fOA5VPrXT/U78zJlyXLw5JUp0m8TAeTTsIgMqH48HBvgX60Z1cf9zYUsq8n9kZ7dVLYVSdMwc6i5BfYWwPjyhUik9vY0FNHMuZGCPv1SdlbijPhhTZeyCmpqlWkaF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660967; c=relaxed/simple;
	bh=bDIgEfAUyhm/xLM9fRUYtKIzhj29vuxnUt+xTY13rhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjU4QeXWeLXwp6h1CLetOq5iNy6RVrUr6vtBb+NJ4irbLvw12Vk3CoR7Rxb6iAaZjOuhQULG7hGD3Xo4zUmediJu4PdBOJzRBT1PMRGsOVMv74dDNWIKk4BxXwGPpkKpWjE31Ly8HDr/oDtoTLliZEMhjbxlteHfmb8Z4McWEI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PL7/PMfE; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5de92d2e9b3so647513eaf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 01:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724660963; x=1725265763; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FpK+LqnMiQxXocEL/iu9e4s+c/+RcNGhhFEbJWYlCI8=;
        b=PL7/PMfEiea3bK0ye4SfMVvHkYXGih0Gg7SD/SJ0wGTe4CsGdAZVyM77KHJZ85BeAk
         TRMNIeCSvjPt7yll1kYuXX7IcY9QIVYhrKJKxjak86+0lukdvUZHlDpd90RycIFMfTPM
         A1lDADqwlvn1Wpo/5ZjjOBNYhZ2BKBUpAgxKJpiZlkdsnpJ48xlX5T00QDRjyDRgsQks
         PkKEw6QFYrYYxuHIaOnCL3ArYqe5EyF+N/xrUr0bOhiEdu3xxcCoPC++lkHVMd13Xtx6
         urWqI9P76Ul9F3KxKV7WNby1//NY2vN23owH3tAFG9+CI9uYzJp2oeNP4Eio+K2aLueg
         UlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724660963; x=1725265763;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpK+LqnMiQxXocEL/iu9e4s+c/+RcNGhhFEbJWYlCI8=;
        b=qa4PmkbxkrRx3eOSfzJb5IS008AIa2coXzklRBr8PkNe7oM/Hug9GMY/ZjDoY9i4Xt
         zz5qAutOq+0sE7f7dL7UxBj4wEZB1K3Ir6NVRjv8mj1K9/QmxCn/9CDqPgwVB7jeNlE7
         hozntgDDZIzOUhme9BgJreNjgI5VZhyuM+pKk4N04Oeqe+PY8AOYHL47A00fCS9+tpip
         Tm8NJmteVQEV0CMQEeo0KJsS1+N8h0tnOCDedrnEpX+kSMNWSVBy2ouzAT7+ilGvFF4H
         vAkWtZP4posQVsxkxYSttBhTxJRalomYBC4CvUB0x01jv+vRBrbSQZj0x3SUifqz0uy6
         TwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHA5Ativ1frqvri2fDUStXm+YLyHJLVWf75NJINEcYs/V82rPhV7OjYWqYlnJgawx3zhPvvO9B/WOsDH8N@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHoqX3GSGmNRbmbLw758sF7IdzIvbmawgpWCQodOG0E9wSNw9
	lGBVSipNo4kxfzgbuXV+m2P6HWYx4kePo2y3lLBAu/PycUSog46Tf3mTeZZIJw==
X-Google-Smtp-Source: AGHT+IHa05pyR1/biT4DWNfV5Ah2XihLBGIqbFSdAq19mKgtaB+tYgagS2IxBtdEtRGiuKRf7P4I5Q==
X-Received: by 2002:a05:6820:81f:b0:5dc:9f42:d5ea with SMTP id 006d021491bc7-5dcc6221da7mr11016787eaf.3.1724660963541;
        Mon, 26 Aug 2024 01:29:23 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad7d5ddsm7175457a12.89.2024.08.26.01.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:29:23 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:59:18 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: gregkh@linuxfoundation.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] bus: mhi: host: make mhi_bus_type const
Message-ID: <20240826082918.al7mt3v7rpfgazsv@thinkpad>
References: <20240823031129.49010-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823031129.49010-1-kunwu.chan@linux.dev>

On Fri, Aug 23, 2024 at 11:11:28AM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <chentao@kylinos.cn>
> 
> Now that the driver core can properly handle constant struct bus_type,
> move the mhi_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/init.c     | 2 +-
>  drivers/bus/mhi/host/internal.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> index ce7d2e62c2f1..a9b1f8beee7b 100644
> --- a/drivers/bus/mhi/host/init.c
> +++ b/drivers/bus/mhi/host/init.c
> @@ -1464,7 +1464,7 @@ static int mhi_match(struct device *dev, const struct device_driver *drv)
>  	return 0;
>  };
>  
> -struct bus_type mhi_bus_type = {
> +const struct bus_type mhi_bus_type = {
>  	.name = "mhi",
>  	.dev_name = "mhi",
>  	.match = mhi_match,
> diff --git a/drivers/bus/mhi/host/internal.h b/drivers/bus/mhi/host/internal.h
> index aaad40a07f69..d057e877932e 100644
> --- a/drivers/bus/mhi/host/internal.h
> +++ b/drivers/bus/mhi/host/internal.h
> @@ -9,7 +9,7 @@
>  
>  #include "../common.h"
>  
> -extern struct bus_type mhi_bus_type;
> +extern const struct bus_type mhi_bus_type;
>  
>  /* Host request register */
>  #define MHI_SOC_RESET_REQ_OFFSET			0xb0
> -- 
> 2.41.0
> 

-- 
மணிவண்ணன் சதாசிவம்

