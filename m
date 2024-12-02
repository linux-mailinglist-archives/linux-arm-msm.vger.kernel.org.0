Return-Path: <linux-arm-msm+bounces-39804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A985E9DFD46
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 10:35:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BA24B21DE3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 09:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 544311FA831;
	Mon,  2 Dec 2024 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PPaxCPzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03E51F8F14
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733132126; cv=none; b=ccfsevnSZTvQjjlRWSpKraXUdYc7Se+KHU8VhMEbww6OG+mtZymONjHswaY9W8vB0otCfBx3wQprv4yRHNuYGRFR/uSJ5yyNYA+rkv0PQXEeZjo5QrR8mFBFNc1xo77xFwQbNkFMB0sqd1RCa8voQYxIsN+BHas+C6VenqGvizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733132126; c=relaxed/simple;
	bh=4Ls56rRdnVJ9EpHYJal+FjHAigp26UK24vfmyXe9/Ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0gZuNYCE2NjwVDNxPBYA3VFUsEmwc7nMBDCPMMCD+QuJ1x36U64wI33b7Aw8hjQRPwxSA+ixU23jWS9S4z+iwfWT30B0/QxhDNdIyG2XzQ9CnZJHmt1AufCevV1z6N7T5kwlzwue7P57uDWo2NSezQAGZYWicyIKlSkkTrUrg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PPaxCPzd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21527bb7eb0so26075675ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 01:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733132123; x=1733736923; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D0/jNAjkVdudPnX4cpNWF1d7Eupiz108pESERY6Okt4=;
        b=PPaxCPzdImX3W0PMJOn4VF5xSp9jVWczpsplWPgkqJsLbMbCldSsadph4l1HBUmMha
         FaaolOc2DaoHFtoPNfLCgNf8QzGly46rSwZ/bv85Hgj/rr3MZrFFWprGlGyRs+Q+iLfv
         /3VH0YxRh3Pkdf8D2w4gSkYjOLaRNoQ41sRh13KHXzr5KvdYxkHo+SqjV2mH7V+X0JZl
         rS9gmAjhjv+xBpjr14NhbjWf7DCgojGksAnbbVmB6JSPFWyBmGAbqwlv65ZEZ6urHeyV
         iTzUNNHlNxG6cZmx1K/x1n4KF/AQG6rwtiP3YE3snGC95hNs4oXarC7eLVavW1BbviIz
         XS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733132123; x=1733736923;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D0/jNAjkVdudPnX4cpNWF1d7Eupiz108pESERY6Okt4=;
        b=usNtIMzr0fFllXoa4MtCCF/MBmpG35LKDlLmYmO0Mro1picpo6yjIxYll2nAWVN1DR
         LlP7Ola14xwbq2UCQsW/YLC8PNrbZ/8r4P+SwfhGjzXllMdbG4S0baHEcNsN5TqC8rvl
         Ew9wTaHg+VeMP5bEA+17TrWAbfxuDZGzFfZ2i/kLP4VvYGfDaxEEB7do/GBbXzBFUR5O
         5RCmQ5eUDpMc0hv31p4js1VYP9VBwSREEkmqPKfAvg3vAWFofKsdvLrKg0COf2JKntL6
         mbtIo6s78T3P+KcdtVe/sKIicDaXTXVA8ycMuJTd9fKdZw1/w0ObraQH1zY3apl7F/G2
         Vwqw==
X-Forwarded-Encrypted: i=1; AJvYcCVtOZ25VvMt0+g3gf8pXcuP4JngL26DYboso3mfz41FiyySX1VOeF7in/ZuugI25Cw1OcRtM7RLAG8+P69x@vger.kernel.org
X-Gm-Message-State: AOJu0YzVYE1E/2TOdDo8K7NWRMssE2kavcdFY1hdALya84bMgpeJ8RBd
	PGSCHHsOTvmMGlCtkLBY77BCZ1+7lbKa5DSkt4rlMqEOdWjVqv4Q5w6MbUDxb/iChpC0RXikuyc
	=
X-Gm-Gg: ASbGncvGk/SsCpA8Wbfsv3hf3iWhSVXKRJlHICqyqbXJDrjK7BEQb6nJ2NHjm4yq+bT
	GBWujrwqpSpml4Mk5nSV3Jpn6Rh8vFHF4eE7Z3o+zkjAbo3u7kNrE1IcpxmPn0igGBvReGz9nT6
	/ljbfEbyaKpnCM0MnmcCJR4hatzlczXZkVTYHHBUiIe886meuTkRSuF6b0CMmrQPWArhVG16uEC
	agJbz7dNOG0jGHLIkl0nul2uJgb71gliuddlqHuBftNOLLlq+SYqXnHpui4Dw==
X-Google-Smtp-Source: AGHT+IH6WqX5McwcnER4/bmD3nrKzgQKw8S99c/9pxMGg83RDoUGvFiPAnv49QNfV8BiBVRyQvzg2g==
X-Received: by 2002:a17:902:ec87:b0:215:9642:4d6d with SMTP id d9443c01a7336-21596424f7fmr34824995ad.17.1733132122840;
        Mon, 02 Dec 2024 01:35:22 -0800 (PST)
Received: from thinkpad ([120.60.140.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215218f479asm72459645ad.41.2024.12.02.01.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 01:35:22 -0800 (PST)
Date: Mon, 2 Dec 2024 15:05:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mayank Rana <quic_mrana@quicinc.com>
Subject: Re: [PATCH] bus: mhi: host: pci_generic: fix MHI BAR mapping
Message-ID: <20241202093517.qhiy7larutekuk2l@thinkpad>
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

That's silly on me. Thanks for the fix!

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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

> ---
> 
> The offending patch was marked as "Compile tested only", but that just
> makes you wonder *why* the patch was never tested...
> 

Because I didn't had a modem platform to test my change and since it was a
simple API conversion, I merged it after some time.

- Mani

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

