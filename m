Return-Path: <linux-arm-msm+bounces-39813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6A19DFDCB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D125F1632A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463D11FBCB7;
	Mon,  2 Dec 2024 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VF2K9Myb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236771F949
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733133120; cv=none; b=YTlvCjVRBqwwWwRHMamTi+M0r+p/ZQOg0RTK0FZQrmNeh/zqq/7Q9WnJeo0Iu4jL1/Je+owWLMVtANzVi0iMLy4ipcJG7wWMyvGcIsR8OrKIWBJ6cTb7bngDzb48bFBKMHTys7uy8TfOBDv//IQxvKXHf7CDpcJ4XzK/S2mmuso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733133120; c=relaxed/simple;
	bh=rrHT5ISu4ntl7jHH5qk6ptP2W7I5hEkSFLbxbRC4wt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dl7yD/vuK7z6mrSOh0n9a02X8NtqmOKYfA5if9/0hIOGUvdwKFAob39FTtV66B5pqQ3EPX2V09o7dOXYVER2YYuN6xtl9i7WRpUuWt7OIulZG1f6gFNlNHUbfdK/jusfuaxN1MpgapVwB6Jvqetyul0h85uAy1/dTYwopm+8SdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VF2K9Myb; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea9739647bso2712460a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 01:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733133117; x=1733737917; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=us2DAUmz8SSO9Fkdpm3cqKbhkQy4ljHHURt29NsDe3M=;
        b=VF2K9Myb8JmTT8AOTWmLlHqkghAN/0zS+nm4hoV9vzaMHV2Ih4dtZx7Rf3Dc6Hk2X6
         RxS6Tv+Dx9MOvnNlTWuVY/kq+qgmGxfKUobQtA4F0hJveZmhk+w0TEOL5/dKlHMAubW/
         O0j0W6hp0bwAJVsSzUBQaNq8yJZeT7xodnsZ5qAmb+Jq7iK5RcrZFcjsv+DYV7F5Vc+F
         ZFwAVSO9K6O0+DJfrTkQGlMBjJnVzuiliAhZAupn9gsF3N1Ai44xQ53AeIdVXHB1ELDd
         dE1DAq4Lzc4vGFIxFuzG/8VfYgQ24MQCO+PKZpuepKFUoZbQlnfmOh0c3SitxEtlnlvL
         G6Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733133117; x=1733737917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=us2DAUmz8SSO9Fkdpm3cqKbhkQy4ljHHURt29NsDe3M=;
        b=QjXtZBuug4pqhRbeddVCSsR1Acl5f5dFNlBJnCejx5JzCTI77Z4Hd1nuSa65bgHsTC
         j/DxML+fmTdpOuSpkiHUyRqVUszeCY8QKB7a941QdNZ3o8zl55P5Zm3LsbjUU+IiSEzm
         CvJxK+INCu5poNdKBobn1CgH1PSUuSuGoeR+V76/mm2yTb8ZSj0IhskXI9McgaHA/1RL
         SfxG5UfrdSFrg/6nwh7C4wRa3WQOGw1tj16tT2J2PlX8+k+QxSLLmzeC1fI9nAFkkbzY
         BbADEtHNmtdvn7YWPObi+Qj7GAMICOKOQRtYDlSNZEZlQ3QlJTlKCuj5+MtTDogAtqCE
         sfPA==
X-Forwarded-Encrypted: i=1; AJvYcCXrYomWkDGND71zImm7NboNZbWq8RQV2QU1Hf8FKlzc5dKhHZdmn4UIjlfGmXx2g1M+4ICzs22x+UMZ5RtX@vger.kernel.org
X-Gm-Message-State: AOJu0YwCWCPT7yayj1n220BmRc05F3rq5NDXYuTYNwhZpap1eG/TvH/J
	oV84zCM05T/pUl04dEW4X1zuTWnbW1QeknKZe+o5enwm1gkNuQbzXnSSeA4qbg==
X-Gm-Gg: ASbGncuD3pWh63NUFWYadK3N4dyHWTQJyOXN/DdBwdhDASZOZrKWCHS8iOHtMoD2KD4
	zyI+o+e590vn9paZoWd73pA8QpioWJsjT6Q5ebPyLzYq2c5JbAMSzkuwmu44zC5rURRPuKhflEt
	EoM1uN70G9+Gm+ixbVIptO8P/2zgzJu3/WQr6FRFHBQWKuedxOpBzuwVCWt+rZzTSj4pTZNSruY
	vWkGhVScJU+D1lFfQH+f6sMPAzrZh3G6anXp38x+4NuPRk+CmYDeUd35DiqGA==
X-Google-Smtp-Source: AGHT+IHG5Cu0Pp0i4nhGKaYi5qQQMFoWyzPs6PVgf5vKt8vckryTy7wgHXKr6o20H/OIRqQE8YLxDQ==
X-Received: by 2002:a05:6a21:2d87:b0:1e0:c954:ea7c with SMTP id adf61e73a8af0-1e0e0b16a5emr32819128637.27.1733133117491;
        Mon, 02 Dec 2024 01:51:57 -0800 (PST)
Received: from thinkpad ([120.60.140.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541848259sm8044152b3a.174.2024.12.02.01.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:51:57 -0800 (PST)
Date: Mon, 2 Dec 2024 15:21:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mayank Rana <quic_mrana@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: fix MHI BAR mapping
Message-ID: <20241202095152.ghhi2opa6nfhjvbm@thinkpad>
References: <20241201171120.31616-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241201171120.31616-1-johan+linaro@kernel.org>

On Sun, Dec 01, 2024 at 06:11:20PM +0100, Johan Hovold wrote:
> A recent change converting the MHI pci_generic driver to use
> pcim_iomap_region() failed to update the BAR parameter which is an index
> rather than a mask.
> 
> This specifically broke the modem on machines like the Lenovo ThinkPad
> X13s and x1e80100 CRD:
> 
> 	mhi-pci-generic 0004:01:00.0: failed to map pci region: -22
> 	mhi-pci-generic 0004:01:00.0: probe with driver mhi-pci-generic failed with error -22
> 
> Fixes: bd23e836423e ("bus: mhi: host: pci_generic: Use pcim_iomap_region() to request and map MHI BAR")
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Mayank Rana <quic_mrana@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Applied to mhi-fixes!

- Mani

> ---
> 
> The offending patch was marked as "Compile tested only", but that just
> makes you wonder *why* the patch was never tested...
> 
> 	https://lore.kernel.org/all/20241004023351.6946-1-manivannan.sadhasivam@linaro.org/
> 
> Johan
> 
> 
> #regzbot introduced: bd23e836423e
> 
> 
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 07645ce2119a..56ba4192c89c 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -917,7 +917,7 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>  		return err;
>  	}
>  
> -	mhi_cntrl->regs = pcim_iomap_region(pdev, 1 << bar_num, pci_name(pdev));
> +	mhi_cntrl->regs = pcim_iomap_region(pdev, bar_num, pci_name(pdev));
>  	if (IS_ERR(mhi_cntrl->regs)) {
>  		err = PTR_ERR(mhi_cntrl->regs);
>  		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
> -- 
> 2.45.2
> 

-- 
மணிவண்ணன் சதாசிவம்

