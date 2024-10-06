Return-Path: <linux-arm-msm+bounces-33254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD3B992047
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 20:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEDF11F2192E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 18:13:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25FF189F43;
	Sun,  6 Oct 2024 18:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHSVlzyw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E91C189917
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Oct 2024 18:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728238428; cv=none; b=MOtMXGzexJ4VbPK8Cm5kmqTCbrM1/jmyema+k/rh2QF+mLkfvW50YwH+KlrGfjf6nIQU3dhx+1HTkw61NOXei5gQoOLD+NQ+wtYTrsvocG6iriYJb6q/XOFzyCJ7PzOC+kEd2SkCayeetFkgRHwh6P6wUp8MpG+yV3FWSYv6IkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728238428; c=relaxed/simple;
	bh=Ua9EPz2F0ax/VTNXjs0OZ+SzQLhTYERlSHK26OI8qU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQJXupDO99KI7tDbgRm1Dp8KXc0d57OoD2T5fqM/uo/pTbME9cx7aHyvbz/j2vbJQTLlQ8YpAcOuQF5oLMbPLpfSSeGfItgJKywIA8M9SO9UPq/eXR5cgVfRD2BMNzhdpmgj9zUqxHrN171UhjkZUsdZmf63Xbr1JvlNAdI0DYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHSVlzyw; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e0b93157caso3351658a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Oct 2024 11:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728238426; x=1728843226; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2/0dUjW4cyzgF6yaoe7/JlUubqxNdOah7f3VO0ZqngU=;
        b=lHSVlzywUJpd+ykKrwbEuPgwrZKxjFm3jGZvjJb8oE9ehjEd/BM3BA47aR6RALPYMi
         vH/4jgnKLb/HE8Jg3EoOX13o+hfpeOpjgybJCXbCBiVWXbBsNgkianVdM6ktK3IKlX6I
         Ez7VBIFgzJydqIHDZbxAHfKXE/+eJv4vbzJPD6BlH4uDYcAdU8iBt2MnxPQvUBvpxDT3
         1m406a6gQ1pCOVlEWlIL/ss1BUtv31ix0fmL9nHGG3kXSve8nLHYCZtrBP7aeyT9gUjJ
         2h7W41AXAh6pKTUlbRpj0Hb2Sb+4GGjnHS3clRuoRiyBZ1I4k+4ufnW/LtAvt6lubW6X
         HhuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728238426; x=1728843226;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/0dUjW4cyzgF6yaoe7/JlUubqxNdOah7f3VO0ZqngU=;
        b=olpHGCjPnfnl1/CCE4CtrjEZA43HfFKPSoqqG+kUPLriQG5KPW9gUEye63XTd2loYN
         qKd8m56bSi0kHz6X6kjpAZ5rtzx6g5gs+edHNkuxeFZHMHpsxHycdhrx/XqQ9OzWJOvw
         KPBE1U5eCWhq221qDGhuMXPqTmGIH1WGKY+F3uRNXO3iXZe8cF6x6j8KnhpWT6yCE1+U
         P7eVm9NK4WGp77x6kHybnZO7ufkQ1ccq8dwHdDq5xqAWlnk39NJ5oSQ0oWJ0c6jkfHxm
         RvK/8GAIK3PQdefmaq/TEP67ag2YhuK5LHrJTgQDFfI1hoiSABfG8K88ocv6HkpsyFD2
         Afpg==
X-Gm-Message-State: AOJu0Ywn9Lj0y+4O4uQ3Mzhh4K7rlaUQ0yjMPOjjT5Woy8htHF2rYY+e
	nVFmH8gFwSBQzIqPTyv2StnyonbA+GMOoKtobSI3UV4x38HAT2IvrLXFigEjKw==
X-Google-Smtp-Source: AGHT+IGR+azJ48oun8zo9Wf54stSUamrDzyOck3wVNecSl83OrIq+R2fL++Y4u9uqPUWdAaT8lZzWQ==
X-Received: by 2002:a17:90b:4a46:b0:2da:8edf:ddc with SMTP id 98e67ed59e1d1-2e1e5dbc080mr13800947a91.19.1728238426412;
        Sun, 06 Oct 2024 11:13:46 -0700 (PDT)
Received: from thinkpad ([220.158.156.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b0fb8c1sm3673804a91.43.2024.10.06.11.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 11:13:45 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:43:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: mhi@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Use pcim_iomap_region() to
 request and map MHI BAR
Message-ID: <20241006181343.bng5gkwvmofefomv@thinkpad>
References: <20241004023351.6946-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241004023351.6946-1-manivannan.sadhasivam@linaro.org>

On Fri, Oct 04, 2024 at 08:03:51AM +0530, Manivannan Sadhasivam wrote:
> Use of both pcim_iomap_regions() and pcim_iomap_table() APIs are
> deprecated. Hence, switch to pcim_iomap_region() API which handles both the
> request and map of the MHI BAR region.
> 
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

- Mani

> ---
> 
> Compile tested only.
> 
>  drivers/bus/mhi/host/pci_generic.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9938bb034c1c..07645ce2119a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -917,12 +917,12 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>  		return err;
>  	}
>  
> -	err = pcim_iomap_regions(pdev, 1 << bar_num, pci_name(pdev));
> -	if (err) {
> +	mhi_cntrl->regs = pcim_iomap_region(pdev, 1 << bar_num, pci_name(pdev));
> +	if (IS_ERR(mhi_cntrl->regs)) {
> +		err = PTR_ERR(mhi_cntrl->regs);
>  		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
>  		return err;
>  	}
> -	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
>  	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
>  
>  	err = dma_set_mask_and_coherent(&pdev->dev, dma_mask);
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

