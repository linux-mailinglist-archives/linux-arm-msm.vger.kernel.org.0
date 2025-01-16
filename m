Return-Path: <linux-arm-msm+bounces-45192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9048A1321E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 05:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CF903A5695
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 04:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A05B13C689;
	Thu, 16 Jan 2025 04:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rp9kWckM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586F44A05
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 04:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737002857; cv=none; b=LgUaJsBVJVVfy9y0sIh/IWbNOd5U+tsLCRaJwqd5cH6oeKP0idoAgNAEe0IpXcnFGprV0XTpNfIGWQYmtOK9uh1y7cx1a/wtwyw6i5mF79dgResNBxMLuPRI/av+/9NLJTM+8eVpFklkrPurXC1iz7Wv2CQA4VlyORK+9vfL1HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737002857; c=relaxed/simple;
	bh=LX6Kpof3GqQFlFOI2OjFz/Xlb/CA76NP/oUe2XWNbz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lvihuyk+VV3DD3KfyEy82QKGx3UWEb5pfqUbYtJc7gJNPQFU0FcQhGa292rffABHOJFDizfyu+hq6s1WZ8PTYKpwqUfXJRke0prcmYNbOpordX5QCVYsC1UXZ/5AfZAszAl3iCxQQGL9eBmcNGyEhrqQBJIXri7OwA5GesCosPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rp9kWckM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216426b0865so7425565ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 20:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737002855; x=1737607655; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V01nO0SZ37R+JBLX/uBesYNHFkKJgAfRsOpWZID4QTg=;
        b=Rp9kWckMO21zjCKeZ20RT0ABHl4/CQNKJQ2k3VnYGwBhVjLUD6seewsC5av6ORSgls
         fQo4mPWBqhwxn2jMpAMlfxMkeZby16GBrq7agYxNQfm4l2Q4LDGr2ldq5SUv9BMGESd1
         /mBSvyWdI2gH5MA5flhZ46IbxFAdcAz3YJrbIvBeTqaUotIYt7hT8D+DLQvB6X2cbfvR
         vR1Bw7tKK7yBLeXpZY/ySUA2Ehr1A7Gm1id2rvgjU1G1PMO4jpOaVzp8N2vLA9YlOZdG
         PHCo/F3avssvx38FHTmmQcrYOPkpvkKpHfCrlmF96VbfQXBMHyGUajUUmH9KDrecugoB
         HVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737002855; x=1737607655;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V01nO0SZ37R+JBLX/uBesYNHFkKJgAfRsOpWZID4QTg=;
        b=Z+XnRGGkZM/j6k1DTecbPnhigHfQFMxPLRaeHgAg7Tu1UrMWWkqMZPX12CsRn0oJ13
         P65hGPtOjwqtiE5/OYlh4LntiXLwUWllUNvgPxXpGeCnaIrsxnjt2j9oJoUfIPs0yLYC
         RMTgUk8lVdi8k/gu/NZSwkyp+blge5qjke9zTnKqHBcHmag3s0RPvDFsWcNR6S3OPknS
         Ew0/Wup1MkpWPAYkq+g9TTpIolefGrc3eomz7qgU/DT8ncT2fdfLodvxQQWgy3aqg/jf
         eCm5xMstVkVRvPl9vZz4PF/9NZrBIIF0RgWPcSAUaceRvEzxNkj2eFELl59UHUNlv3+c
         sF4A==
X-Forwarded-Encrypted: i=1; AJvYcCUUnX+s16JNziDTEMk6LjT3EHM79EnLEqkEx21tqFALuEhGjykNAH2DwaEGI7vE2AJOtrsaHX8Fy/Ne9mzw@vger.kernel.org
X-Gm-Message-State: AOJu0YyhweCMOpl9voJA4VsVnHniNiGIo3+8lWyvKKQXlnPr9n3aepyM
	R5n/g08inEaYfbYSK7budWiBt1zrXNMmYwbWd8NMj8GJS1N8R5lFTprWCA6zuQ==
X-Gm-Gg: ASbGncuYy1txDj8TUKgVc+PTqKsr+blVNA8A7ruqgfjsyr9cSXInDeUHtB30npJowYg
	YtCeXayys7SDoKGKYwqI+Jwed66XOJjsH/R1iLF1+AHrDfZs+FtzK94yYwPSLQcGixO3kcMexaD
	aKpxHNZ5dJnC37QiHtXTCeLEyqK2F6wTk/opumfPb4iFEWM30Mw7HyCg9EUfYX0i8vFJ3TcDiGi
	T1cPxrTsFbIIOIbUMy2BtYQDwWI9BE+aqNUveFgs5OPMlY9y68HCdP4BK43IvME5UI=
X-Google-Smtp-Source: AGHT+IHwfbiGq5loLxwv4zEURJyYuoHb37VHX9d1McOu5eZZj9jVra5zahjjNYA5h9O2VRKhhlx4Rg==
X-Received: by 2002:a05:6a00:392a:b0:725:b347:c3cc with SMTP id d2e1a72fcca58-72d2200273bmr45899486b3a.23.1737002854546;
        Wed, 15 Jan 2025 20:47:34 -0800 (PST)
Received: from thinkpad ([120.60.139.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405943c2sm9984852b3a.79.2025.01.15.20.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 20:47:34 -0800 (PST)
Date: Thu, 16 Jan 2025 10:17:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, kw@linux.com, gregkh@linuxfoundation.org,
	arnd@arndb.de, lpieralisi@kernel.org, shuah@kernel.org,
	kishon@kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org, robh@kernel.org,
	linux-kselftest@vger.kernel.org,
	Aman Gupta <aman1.gupta@samsung.com>,
	Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>
Subject: Re: [PATCH v4 3/3] selftests: pci_endpoint: Migrate to Kselftest
 framework
Message-ID: <20250116044725.ooskvqlh2lpdr2xx@thinkpad>
References: <20241231131341.39292-1-manivannan.sadhasivam@linaro.org>
 <20241231131341.39292-4-manivannan.sadhasivam@linaro.org>
 <Z3QtEihbiKIGogWA@ryzen>
 <20241231191812.ymyss2dh7naz4oda@thinkpad>
 <2C16240A-28F8-4D9B-9FD7-33E4E6F0879E@kernel.org>
 <20250102070404.aempesitsqktfnle@thinkpad>
 <Z3ahUuSjRv66L_g9@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z3ahUuSjRv66L_g9@ryzen>

On Thu, Jan 02, 2025 at 03:23:14PM +0100, Niklas Cassel wrote:
> Hello Mani, Vinod,
> 
> On Thu, Jan 02, 2025 at 12:34:04PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Dec 31, 2024 at 08:33:57PM +0100, Niklas Cassel wrote:
> > > 
> > > I have some patches that adds DMA_MEMCPY to dw-edma, but I'm not sure if the DWC eDMA hardware supports having both src and dst as PCI addresses, or if only one of them can be a PCI address (with the other one being a local address).
> > > 
> > > If only one of them can be a PCI address, then I'm not sure if your suggested patch is correct.
> > > 
> > 
> > I don't see why that would be an issue. DMA_MEMCPY is independent of PCI/local
> > addresses. If a dmaengine driver support doing MEMCPY, then the dma cap should
> > be sufficient. As you said, if a controller supports both SLAVE and MEMCPY, the
> > test currently errors out, which is wrong.
> 
> While I am okay with your suggested change to pci-epf-test.c:
> > >-               if (epf_test->dma_private) {
> > >+               if (!dma_has_cap(DMA_MEMCPY, epf_test->dma_chan_tx->device->cap_mask)) {
> 
> Since this will ensure that a DMA driver implementing DMA_MEMCPY,
> which cannot be shared (has DMA_PRIVATE set), will not error out.
> 
> 
> What I'm trying to explain is that in:
> https://lore.kernel.org/linux-pci/Z2BW4CjdE1p50AhC@vaman/
> https://lore.kernel.org/linux-pci/20241217090129.6dodrgi4tn7l3cod@thinkpad/
> 
> Vinod (any you) suggested that we should add support for prep_memcpy()
> (which implies also setting cap DMA_MEMCPY) in the dw-edma DMA driver.
> 
> However, from section "6.3 Using the DMA" in the DWC databook,
> the DWC eDMA hardware only supports:
> - Transfer (copy) of a block of data from local memory to remote memory.
> - Transfer (copy) of a block of data from remote memory to local memory.
> 
> 
> Currently, we have:
> https://github.com/torvalds/linux/blob/v6.13-rc5/include/linux/dmaengine.h#L843-L844
> https://github.com/torvalds/linux/blob/v6.13-rc5/drivers/dma/dw-edma/dw-edma-core.c#L215-L231
> 
> Where we can expose per-channel capabilities, so we set MEM_TO_DEV/DEV_TO_MEM
> per channel, however, these are returned in a struct dma_slave_caps *caps,
> so this is AFAICT only for DMA_SLAVE, not for DMA_MEMCPY.
> 
> Looking at:
> https://github.com/torvalds/linux/blob/v6.13-rc5/include/linux/dmaengine.h#L975-L979
> it seems that DMA_MEMCPY is always assumed to be MEM_TO_MEM.
> 
> To me, it seems that we would either need a new dma_transaction_type (e.g. DMA_COPY)
> where we can set dir:
> MEM_TO_DEV, DEV_TO_MEM, or DEV_TO_DEV. (dw-edma would not support DEV_TO_DEV.)
> 
> Or, if we should stick with DMA_MEMCPY, we would need another way of telling
> client drivers that only src or dst can be a remote address.
> 
> Until this is solved, I think I will stop my work on adding DMA_MEMCPY to the
> dw-edma driver.
> 

I think your concern is regarding setting the DMA transfer direction for MEMCPY,
right? And you are saying that even if we use tx/rx channels, currently we
cannot set DEV_TO_DEV like directions?

But I'm somewhat confused about what is blocking you from adding MEMCPY support
to the dw-edma driver since that driver cannot support DEV_TO_DEV. In your WIP
driver, you were setting the direction based on the channel. Isn't that
sufficient enough?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

