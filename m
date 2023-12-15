Return-Path: <linux-arm-msm+bounces-4913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6604181461D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 12:00:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B6761F23534
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Dec 2023 11:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A61B11C2A8;
	Fri, 15 Dec 2023 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xN2KBsZx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AAA250E4
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 11:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6cebbf51742so343540b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Dec 2023 03:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702638020; x=1703242820; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hqlj4/QUlWtIrDLHx0gmo3NTEhgLbAEJdvoypSzSkV4=;
        b=xN2KBsZxVgoKBE6ir6Jp4Avs4s1TK9HXSOe8DqdBP05Gd0cX9AXOhhFq4MsDvXpVQx
         zAn89MSO40y2cQR0pV2X4uTljoKMeJVzNYPxH3MKNlO0Ggd2a8r2XYF9JDSBCnUuh2IY
         bS3tZQhMiY7sC54YdjQAq9G6g2kuaQp/z8m4mk1YS6Unn5pMB2lwhdPyN9VmOUUBvHM7
         JUyduApnAyLpxlaaNNEmW/mvEJqxIz+iKkSldlA6px8OmBp14IO1KklfJZciiL9f6NPw
         9EHVVynCx5pKFGNq8KYCHRTHeI0TTv9YlAqZKq/466pkIgQwzQ2DQRPYt4/x0pRWtlEK
         UdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702638020; x=1703242820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqlj4/QUlWtIrDLHx0gmo3NTEhgLbAEJdvoypSzSkV4=;
        b=N9U1KVv43j7pBh3+p0zq2e1dEvnYkdsfS1jmbAE9Du2zL2Py24B99gjFZbu+CIkMlI
         y003uZ5rmg0EqQx9+xe70ipVHAWgLkaSmfadc5QA4nETHj9HrSK1dG80/04Uk5LXiJi8
         OBFQQsk+fgBrZ3SOOzgicCPv8Gl80P2mO55PEaGnmjh5Jlx/bny/Mkp30JnrvBOD6pHm
         F7hAVFRozy71tfwMwFaneNQMMDPsk4gIadgC/Qh2IlfvetYAoIWnJ1a4gSt4FZfDYoI7
         /MILPb2c5Pe6NqxCd1mNrez3NG7G29uPChFBhqTtTYPEIDmysGU6cd17AE9INrWL8vfr
         oafg==
X-Gm-Message-State: AOJu0Yz8MlzE0cbJEyyOxDcqTnxTZHwlIRfj/Uosi57LOZGKWyqprbPo
	b6khuh4FLu+LmSO/iLgTfe83
X-Google-Smtp-Source: AGHT+IFBP0BhD4lTrTKdOfab7a3x09nSVDozE87qcYpsEL0j06A1OVhRm9jH+v/Q2SbpZhn9G0wpGw==
X-Received: by 2002:a05:6a00:2301:b0:6c3:4bf2:7486 with SMTP id h1-20020a056a00230100b006c34bf27486mr15018314pfh.7.1702638019633;
        Fri, 15 Dec 2023 03:00:19 -0800 (PST)
Received: from thinkpad ([117.207.30.136])
        by smtp.gmail.com with ESMTPSA id c12-20020aa7880c000000b006ce7ff254b9sm13249835pfo.68.2023.12.15.03.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 03:00:19 -0800 (PST)
Date: Fri, 15 Dec 2023 16:30:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: lpieralisi@kernel.org, bhelgaas@google.com, kishon@kernel.org,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: epf-mhi: Fix the DMA data direction of
 dma_unmap_single()
Message-ID: <20231215110012.GA13113@thinkpad>
References: <20231214063328.40657-1-manivannan.sadhasivam@linaro.org>
 <20231214193521.GA2147106@rocinante>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231214193521.GA2147106@rocinante>

On Fri, Dec 15, 2023 at 04:35:21AM +0900, Krzysztof Wilczyński wrote:
> Hello,
> 
> > In the error path of pci_epf_mhi_edma_write() function, the DMA data
> > direction passed (DMA_FROM_DEVICE) doesn't match the actual direction used
> > for the data transfer. Fix it by passing the correct one (DMA_TO_DEVICE).
> 
> Nice catch!
> 
> > Fixes: 7b99aaaddabb ("PCI: epf-mhi: Add eDMA support")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > 
> > Bjorn, Krzysztof, I'd like to apply this patch to MHI tree on top of eDMA
> > async patches due to dependency:
> > https://lore.kernel.org/linux-pci/20231127124529.78203-1-manivannan.sadhasivam@linaro.org/
> 
> Sounds good to me!  We still have a little time, so let me know if you
> change your mind about who should take this patch and the other series. :)
> 

No change in plan :)

> >  drivers/pci/endpoint/functions/pci-epf-mhi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index 472bc489b754..d3d6a1054036 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -424,7 +424,7 @@ static int pci_epf_mhi_edma_write(struct mhi_ep_cntrl *mhi_cntrl,
> >  	}
> >  
> >  err_unmap:
> > -	dma_unmap_single(dma_dev, src_addr, buf_info->size, DMA_FROM_DEVICE);
> > +	dma_unmap_single(dma_dev, src_addr, buf_info->size, DMA_TO_DEVICE);
> >  err_unlock:
> >  	mutex_unlock(&epf_mhi->lock);
> 
> Looks good!
> 
> Reviewed-by: Krzysztof Wilczyński <kw@linux.com>
> 

Thanks! Applied to mhi-next.

- Mani

> 	Krzysztof

-- 
மணிவண்ணன் சதாசிவம்

