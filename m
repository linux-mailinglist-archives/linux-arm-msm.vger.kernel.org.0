Return-Path: <linux-arm-msm+bounces-29459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2795EB74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 10:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF58B284E1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 08:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F03713C8F0;
	Mon, 26 Aug 2024 08:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GmGF9aFj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D386912D1EA
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 08:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724659734; cv=none; b=HA58IZaXzwKgnhibVd59itmZUAYqwaYo4oCDbSPUZqGVU+bBWw58iatBcdIQ4058NzjkK4d+riaHL5RiLO4WkFRtXyLz0O20NX6cyxVw0XWszpwctyn37EaOQicnng5lpXdDMe75lav6sgCAmQFNCTpciA4KbwrKxTKm3/emSyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724659734; c=relaxed/simple;
	bh=tn40YMUaCAQ/DJXVR3dqBFaS1otGQJ2t9f0pbYl/a40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUaJFJqrbzB7GQ3GNoa5lUNbJ1l/avy4fJYrlqaHd+pF6eSMeHiWn39FGnuZkiUp0fnDhbvA23363UxNaYvMxj7M1gEx+ZSPb84k2zufqThyUT1hTP/2pJ4F1y2C6nSAL6bZtr+SCppN+X0bvk/FZGibcdqGU9hZSPBax5JvWjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GmGF9aFj; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2d3ec4bacc5so3553367a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Aug 2024 01:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724659732; x=1725264532; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fRo/wbfsDbFv4vokRUxbdhRpSy0+71+5/8aUqsQl01E=;
        b=GmGF9aFj7M1veonCxx7P8sntJ546JXFe8Gd6R/z3vAB6gs2eFyavy5xwowRnqIVon1
         afUGJYWhe9MsZItLTn4CZf8vUhZcN2UuReBtsgOzkYDI6FSUKTJh8uxjZ0/B6a51JIJy
         wkNY2dnjvKuykBmsLXS7RkkxXRyounjSG5DRf8nqGyPYpCtb7uK6EGJi3vA2VQbaFtLh
         3uWu6dTbL84LWHMGb8IjtNNdKlTlGrOVKCzMcE/QJfgxG+heq1Pvunkzt9QTw2ZQVnha
         Jvs8ZzFZgSd3HGkC9LzF2+FTJ0HjQU/WZPZyetDnWYYlVzgVfkzUKm/QAZ3PFq8wJb7c
         kPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724659732; x=1725264532;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fRo/wbfsDbFv4vokRUxbdhRpSy0+71+5/8aUqsQl01E=;
        b=Tz/xKLu70xdwOBHrE3pjpbgQ8UrFGv+gFmF7zQ2eif3DlO5Azii6KGLLzKklamK62R
         G1JIV2VIVf+acpsDWovIRpQ0RT9nRCrXtZrDA8k/mHOXewYuPUzNhLOO4bUWnzsekd5U
         GTH3ldrQa/diw4G0aq+Y/2+V7Wqt3TYY6r3dDDNY2uNm2jD3ijzzyl3abCb4OoMwB+Fl
         JQ9Ov5g/qXKrQ1zV326EUTK2INAx3r5lih99m9je7JxKY3f+gnPrMn6uBYtnz9+fHDhb
         dv4kBN0bx93K9GrNZFAcKPYRW2ZwwN6YUkBSRVvEXQalsrrlXVCL/8hKPcLp632OfEm2
         TzZw==
X-Forwarded-Encrypted: i=1; AJvYcCWYO+sa+ntpah9ve738our/7fW4wtq5IbPxJ+AGpgAVxhCxPfANJqWKojrNXDn/obSW8bGU7UdTNgODuPpr@vger.kernel.org
X-Gm-Message-State: AOJu0YzcVLTIHAY1cOnfuo5PgHm0k9Z+uz4DNV5ZwflgQCY9fBdvO27R
	tnOuqDwOGx8rFdKVite44EF3uwucaVlN0wNyuRvtFRiFJSIOT9HIyMBQiMuVeSyYNX1jiOVV9JM
	=
X-Google-Smtp-Source: AGHT+IF2FFGTkmSkhB3/aVaJKTxyAcidVgGCFapnxd1Gkrhhq7h1CAVaWdUOnm3UG/ERQdcmfDBKVA==
X-Received: by 2002:a17:90a:eb11:b0:2d3:ad41:4d7a with SMTP id 98e67ed59e1d1-2d644777e33mr15743472a91.4.1724659732042;
        Mon, 26 Aug 2024 01:08:52 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d6136fef1bsm9115774a91.4.2024.08.26.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 01:08:51 -0700 (PDT)
Date: Mon, 26 Aug 2024 13:38:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: gregkh@linuxfoundation.org, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] bus: mhi: host: make mhi_bus_type const
Message-ID: <20240826080848.vcj7yjdoovnnpvvd@thinkpad>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

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

