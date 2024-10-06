Return-Path: <linux-arm-msm+bounces-33251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3D999203E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13D20B2145B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 18:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051DC189F33;
	Sun,  6 Oct 2024 18:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VEiq3KG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894D7189917
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728238020; cv=none; b=f4R2nMv1pkjNM1KDKajlAjU1/85FUnMvKkzIVrmKqXvNbXBASxQ02ilYa2laaRwSgKAGV/0lVGWwwU/tn8POwqpKpYSh9hb0VIfzS/9kRB7YuA61Io3TwiSXv0a7ZIZDP4K0XsfdR40UM+CYIqfSPAab2nSh13Ev7+o75T8tS8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728238020; c=relaxed/simple;
	bh=puSNQXAugT1xkNChFzu/b68+Xo9PvtlQ/j+G7gfjRXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1s8kEmol+3bNYGnr5c0NiAb8z6z0pf7ocXfFg65t+yi2OszSu2dhEqJJkxuR5Zoqcumb63UlJSgiOZjGdCP1IFYIpeUgA62mZ5CH9FKht3gjMGmvZGCpl7c0ah9lKQb3ZHmEI+h18JkryJrffj56KMnchHGA1ZoUfpKtPOkpko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VEiq3KG7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e05198d1dso37846b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 11:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728238019; x=1728842819; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2rEk73CxsoDmlidARikf9pj5QBpTcv09pnBHqqK3GE=;
        b=VEiq3KG7BC70+tHP6oZS5+ZTySBEKqZyga6neHns+eWOuUFmcLbjSnvEePmhjlDN9w
         nz1yeBioGI0XEUvuGHIi5bORgrlFjCZ9uvEGzFdTtBd82or3EfMaB2+U09v6M38jB5AD
         dSPQuE2OmV40SBwtCzzwd9iD1KOeoc2pxQKSfy3y4HoJb3J6mzBZyFe5o4ZbBU0rIWqb
         j2U4BK8JUQ3ASDi+xtDdEZ7fiVyDk9Fpkr+LLdfwOfLlNXzdPZW99+ysEeIuru9P7Qjo
         hebnT0E+1qeYQUn3R5evEWhA8F5wkn3+SLtxFyQ+0uy+8JWDJ49ja2Nug3UCecVtohjD
         dBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728238019; x=1728842819;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2rEk73CxsoDmlidARikf9pj5QBpTcv09pnBHqqK3GE=;
        b=hBcvottqEmyksLOFVUImZTRF/uf1igTyefUKYzZ87SKX8Udt9CbDd4SvqM482N1j3F
         ZXcCxGhWzE7HcCGY7EtZPQc+ZsCDPTvBnmGyvt3a7GbZi/ncOBMn1b9XARe9FhBViX3q
         HRCy6ESWnFtQudXlx0mJrAV3Y1kt4sozEpt3ksQGK83YQMMbaK2U7kiXJ0jXg+icW0zH
         5M4HuXFlW/BNBLoCUHd62rcmGXOUAQHLtT14Gp3B8YEnCdBf4NfgFnzCsFCIeciraNGW
         d/DQv9vfhBd6gW7tCY29M6qE63wdi+cy8vzNosReVkbByxr+dVLcwhNcUfBemX/fqAG/
         G29w==
X-Forwarded-Encrypted: i=1; AJvYcCVv++2pRxSFDZT0Cj/T1mEtqPM+gjU3fFQoowwtRJ3BI84mvQyb1owU105Dmmh2JX00fOjg70waDvriuBZf@vger.kernel.org
X-Gm-Message-State: AOJu0Yxea8N+wp4rp1kG7Eu1T2bdih6h1RAqbhVVOlkUObi5XjfRKYlH
	xKE/HnWybGsZjcPvkEA0CrFzYkslKZcNwRpz3CYjOIIGirvezTMNeGkgk8h+5g==
X-Google-Smtp-Source: AGHT+IGOKKbGokCNKWe9GPDiqe2400mq6UX7Z9N6tQ4E61yzGsckC/W5+GtKYt0cqtRd192YkVp+oA==
X-Received: by 2002:a05:6a20:438c:b0:1d2:e78a:36a2 with SMTP id adf61e73a8af0-1d6dfa24b28mr13406852637.8.1728238018742;
        Sun, 06 Oct 2024 11:06:58 -0700 (PDT)
Received: from thinkpad ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d4a39bsm3103212b3a.97.2024.10.06.11.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:06:58 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:36:53 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Fedor Pchelkin <pchelkin@ispras.ru>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Kalle Valo <quic_kvalo@quicinc.com>,
	Carl Vanderlip <quic_carlv@quicinc.com>,
	Sujeev Dias <sdias@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Siddartha Mohanadoss <smohanad@codeaurora.org>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexey Khoroshilov <khoroshilov@ispras.ru>,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] bus: mhi: host: free buffer on error in
 mhi_alloc_bhie_table
Message-ID: <20241006180653.amrkwtlgjiggenny@thinkpad>
References: <20240207065136.18316-1-pchelkin@ispras.ru>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240207065136.18316-1-pchelkin@ispras.ru>

On Wed, Feb 07, 2024 at 09:51:36AM +0300, Fedor Pchelkin wrote:
> img_info->mhi_buf should be freed on error path in mhi_alloc_bhie_table().
> This error case is rare but still needs to be fixed.
> 
> Found by Linux Verification Center (linuxtesting.org).
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/boot.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index edc0ec5a0933..738dcd11b66f 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -357,6 +357,7 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
>  		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
>  				  mhi_buf->buf, mhi_buf->dma_addr);
> +	kfree(img_info->mhi_buf);
>  
>  error_alloc_mhi_buf:
>  	kfree(img_info);
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

