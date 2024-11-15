Return-Path: <linux-arm-msm+bounces-37947-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE70B9CD6DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 940E22832B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 06:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93F6185B48;
	Fri, 15 Nov 2024 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PzsCR/iS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408D5183CD9
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 06:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731650819; cv=none; b=i5DltBAWfYvrGVt2eVu56qf2Uz//WF11Kwkm4XIe2cwaGAJeQyOT11JEAu0Idp9fDkoO0AtJuSauVzlR0oaWiRqmxP2BLsYCLtwKrtE6BqcuJZwBwqzm4S3Pw1aQjfOPGjmnN3yXSDh9/pzaXSARDLtSbNo/yHZpqY3QKWD2Pdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731650819; c=relaxed/simple;
	bh=sHx9FcgFBFeFm5RF/16v2qKPOEc+Ckhi1jLZrfQnz84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2a3fYw5iKilAU6Q8LB0WfY1KyYdbMFQ7pGWndVpXwYf8j9D9NyfswbvT3F5huFqQyn/ic4swbnvQdaJZRDeTB/AfHVe1IViv6Q2IQ68cQNB55rf4MefnF26kplgRHzxkhW/noRFSN77VUmZ/2QspvHR1+fLZHGSswj82cyMAAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PzsCR/iS; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e5130832aso1094066b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 22:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731650817; x=1732255617; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VYRfI6/zPnp4YjFXrlyTeKAyNIK9PnE2g8C5wjcAM0s=;
        b=PzsCR/iSnWIySz30zeYSvnUHEGWtXQzyIFm/tKUlHuAaYlr0FIIM1bLID7zBKYrGzS
         huFP0HHNxmtnBDWjJWiI7nJhDqa/4laVoGKyFQtGI32X7k/hU6x9Yg1Mnxs/dzB/u8Jn
         EvTBSQVZSgK8Kz1TI68HGYYBP3DmQ/+pgSVAtHZe2169yzHH1NmDX0Gn6dFTgCZKWgNI
         wz3X4ihatGNXsZEhvAShbHK6wv+KCATnB0AYwfm8OJKLpVj/sElK07MMQFSy6x9QBbCr
         +jnvkqoNlx7VFkmTNa/3ZxSsOP8YZTb2U9DbrmeS2z2ZsUNY4DH7q3zh3RVXBJzFDLhr
         6hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731650817; x=1732255617;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VYRfI6/zPnp4YjFXrlyTeKAyNIK9PnE2g8C5wjcAM0s=;
        b=S5bRIaiuirPphuCk/VY+hWh5G5zF+7jl4gsbVjz9XRqgGZ4Pn046CZO7tc3cN702jr
         +JPrF6HiBYFcX6tgYlEnfc58yoa2vrgjd+9scyqDROOfxjsjq/Qy8Ns/lD79hbKRO4qg
         YVC4NiipXdkB5Ui9Kpjo8fBBTvCns92xCG2bgaxafKaycSeQePuWObqQ8oiziBV0PCIR
         gLv9pyNveDgx4wgqdivqUkNp1pV2SZ5tKu/SoEDn2WdXFmYwjJnaRn8RP38RmKJNIQd9
         WdSy4BgYAWHb7Hrh0JGNIn+YT6QQr5c90LSR7cL34D2/W5UlYYfOifc83SYM0UuFt/IU
         Rvrg==
X-Forwarded-Encrypted: i=1; AJvYcCVYkUVNUBE+0rtK3JyV1r/NRYzVPRRxKGsO9qzbetK1BPTU8n+TCOEQ+FJNu6YFEoFFC2HvO6tr0H5kO4xG@vger.kernel.org
X-Gm-Message-State: AOJu0YxS/02IH2acIUXDfoY/9KcdpB6PtWoSgWH/ss8VpyHbo+AJR4/a
	jen3F3m+2ajfHE0BbYP1qV1pJzKFqUFUFl0lJVkM1No0W9DlVGnNQmy0Bd7ZnA==
X-Google-Smtp-Source: AGHT+IG8rujYSVN3685QyH0Y1bCgHtYCiTi6hk0BHecaEZS2xSCeMCTTyXIdpJNCe1Mfx3Jljvb5bQ==
X-Received: by 2002:a05:6a00:140b:b0:714:1d96:e6bd with SMTP id d2e1a72fcca58-72476bbaa67mr2506190b3a.13.1731650817465;
        Thu, 14 Nov 2024 22:06:57 -0800 (PST)
Received: from thinkpad ([117.193.208.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770ee810sm606748b3a.6.2024.11.14.22.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 22:06:56 -0800 (PST)
Date: Fri, 15 Nov 2024 11:36:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Youssef Samir <quic_yabdulra@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: Free mhi_buf vector inside
 mhi_alloc_bhie_table()
Message-ID: <20241115060651.bhwulbfk4ewhgrav@thinkpad>
References: <20241024214715.1208940-1-quic_yabdulra@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024214715.1208940-1-quic_yabdulra@quicinc.com>

On Thu, Oct 24, 2024 at 11:47:15PM +0200, Youssef Samir wrote:
> mhi_alloc_bhie_table() starts by allocating a vector of struct mhi_buf
> then it allocates a DMA buffer for each element. If allocation fails,
> it will free the allocated DMA buffers, but it neglects freeing the
> mhi_buf vector.
> 
> Avoid memory leaks by freeing the mhi_buf vector on error.
> 
> Fixes: 3000f85b8f47 ("bus: mhi: core: Add support for basic PM operations")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> ---
>  drivers/bus/mhi/host/boot.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 21bf042db9be..2e9ef55a566a 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -415,6 +415,7 @@ int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>  	for (--i, --mhi_buf; i >= 0; i--, mhi_buf--)
>  		dma_free_coherent(mhi_cntrl->cntrl_dev, mhi_buf->len,
>  				  mhi_buf->buf, mhi_buf->dma_addr);
> +	kfree(img_info->mhi_buf);
>  
>  error_alloc_mhi_buf:
>  	kfree(img_info);
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

