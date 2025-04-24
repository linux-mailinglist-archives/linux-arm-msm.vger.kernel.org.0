Return-Path: <linux-arm-msm+bounces-55251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9606EA9A054
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 07:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B66C51945A89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 05:08:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6CF19ABC3;
	Thu, 24 Apr 2025 05:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9Eq1uaP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CC4139B
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745471289; cv=none; b=BEQFyywx04Npsel80GWbgqwzOgFx5uwth/zOyD7p+iltrT7vGBZ/LSiR/w/dAQ4RQIHbDS/oNn7x7O52o6G6rVYAr5yMWF9GyEKaQRsMueP6gtmQxr/M9x4EzCnskTXViWz2xmTwj3AzO4CMjvGV0d18N6lW+C/MKgg8Anoiv6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745471289; c=relaxed/simple;
	bh=F6uOsjghVkNbX3/0dSdkmIOYm376mVnitly79L1kdAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dy2YWEoi3z56uQn3004AOV53A9Tgmdk0+1vM0zPMAGgeItWsIrZrXzupqC3zmsYkyc6wWkjfM65BRnoX+tHcaxOZLsyqkZds53v3rnom12/yw7mjIF84T2Yxrsd3pmqmNLW+wH7m2yHs27WSNn1LBBmHFi8Ai7fLNIQFTDgMSP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9Eq1uaP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so500361b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 22:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745471286; x=1746076086; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HCRkAMDBEcZOvUbHZMZAot/OwWs2AVrCZxyXey4UAAU=;
        b=k9Eq1uaP9WzOUQ/77JzVT0kKiCWUkz4F/mYPr2dvWYHMbXUd//J9awqwT8LYeej1rY
         7DJYrkguQ4x3OC/OSNCpVOBQbgEYAFvTATa734VOV5OP+XiJRvd7FdbVStWC40qYEs4q
         3IwNnpoNziNSz2/y0Mlbehvndgct+tLRDUFpW5OOiPR/qkN4/i1Ja/NsPMqDhmmCDV7e
         jbm86zbzEkAiTdhLD2B/WqnlSTZiPzAl+8p7XUuPH/mIh1yeGJtywlO5pNrbieIgUNOP
         Le3Rs/rn9B3AefNP1vESuYE8gOa61PPj1up16vrso/in5iyG1M07UCIkV861y0Wn4wXW
         /sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745471286; x=1746076086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCRkAMDBEcZOvUbHZMZAot/OwWs2AVrCZxyXey4UAAU=;
        b=Pt7xlLFhgEm7AzZOeTJDT2XuptOab3PtlxtilJG/H6w5FNZq1dN0BnWJmI4g8hzTBy
         plXPhQB7Dut3QLn5ZJMtVT56Rgqg6cl54VKQszXRquMqkDCdBkaXfpSDH5YVnAiCa8yB
         w9/CD91ZzCrOC/jA13vSG8mt3/laEInfEJAK9hJCXZvbeyHN1EN7pxSzprYNNtHyDtQH
         Kwtu87s4s8yTON6v3zRpQNAP8Gd5QhlFm9C7yFm5JEBiVSuaG16spXrpFvncw9OjzvyD
         PWYSnXHmhDfs4ve4D01i7iSVxkh7QjnU8RGr6Aiv2m7tS9G2DpHnHpZ9/hisTBRBW3Qx
         BwJg==
X-Forwarded-Encrypted: i=1; AJvYcCVm4ZTpAdHjcTswO/NY4pplN0zhco1rvZNny5C3bdh39DfXv1ltPLVzXhaZguPwuMU8OTy7/MaZvleGmO0P@vger.kernel.org
X-Gm-Message-State: AOJu0YwLxhQ+89f3rqx1fjNF6MTrgT5qFbjeQXx4Qs3VnQL8mRnPAn9N
	p92A7sODDSKEgStp2iIWnuD/+JsSe5cr8cNHHcgDplMN5o94KwfMTASqh3qrvg==
X-Gm-Gg: ASbGncv6CRAlolAd2QflnBK7ZuNQFRV1RxJYH38vRuT2/wuhZ6wQ1ZS7i5JjDlM1J/G
	z50CuTrDbWpcGkKlts/jEb/oSJXNvijtLBTN5ze2WyjrEuZjKf+yr7XG8xMg2TTukVP+4Qg9IId
	saraGZP2UKDv4BoGSVq8RAy9LUGI99jSpY3Y/15eGPrJ1/kjQe704Ba97QQ8DYVbPN8Gd98ysbb
	PxvtTKwC06jSE3nqcOQyz6QaW1Fw1ZfOKJs3w/g62ahrwh2KZN7HJfisyWks5hEtKw++VpJndUC
	PB721gjVTTOg9SU2x2rfq7tmNWhHoX7k8ZnvZmQwswDWjtZ/nm0=
X-Google-Smtp-Source: AGHT+IHKk0j4Ltd7MUfpRKyZV9i9ybMMdwfMuPy+Of0VruZIuaYQ9y0Zu4YDFK6qnZd7N1n/vaXojA==
X-Received: by 2002:a05:6a00:448a:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-73e244bab2amr1856960b3a.1.1745471286543;
        Wed, 23 Apr 2025 22:08:06 -0700 (PDT)
Received: from thinkpad ([120.60.139.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca621sm486790b3a.163.2025.04.23.22.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 22:08:06 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:37:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Remove assign resource usage
Message-ID: <pslapnhzptjtognzwaiqmlhgfrlbhk245pem6gbxbjwkk3nhx4@uux4cjcsqtst>
References: <20250416-remove_assin_resource-v1-1-e92dd361fa0a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-remove_assin_resource-v1-1-e92dd361fa0a@quicinc.com>

On Wed, Apr 16, 2025 at 10:49:51AM +0530, Subramanian Ananthanarayanan wrote:
> Avoid redundant usage of pci_assign_resource for BAR allocation.
> This is already taken care by PCIe framework. Invocation of this
> API leads to unnecessary relocation of BAR space to a new memory
> address.
> 
> Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 03aa88795209..7501abc835c7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -996,10 +996,6 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>  	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>  	int err;
>  
> -	err = pci_assign_resource(pdev, bar_num);
> -	if (err)
> -		return err;
> -
>  	err = pcim_enable_device(pdev);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
> 
> ---
> base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
> change-id: 20250416-remove_assin_resource-aa0db88d02eb
> 
> Best regards,
> -- 
> Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

