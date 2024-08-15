Return-Path: <linux-arm-msm+bounces-28578-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E790F95285E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 05:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30AE51C20EEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 03:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A022322066;
	Thu, 15 Aug 2024 03:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n7vB+WHf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2112C6A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 03:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723693589; cv=none; b=DVLPLu7tl85Pyykk79cj24hJJEypwXc8NFwXfw7gr5xDZrn1dRjUPVs0cD/33UMH+1wq9C5Di/cMtyx3sbQUKTA/gvyGRBFwliGxpD9w7ExLKP2wcLCkb+Z6MaDWcesel1hDN/3brvARihj/NJ7700eifmVN1Wne7cevZSbefnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723693589; c=relaxed/simple;
	bh=n5jCn2lQNu3HQokHZ7Ul9GmwfjnmRu/a/xwckmbzH30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XQkR2lcXhJLWpy4nOgT51mgoy1QU0khUHM0v2qqzSwyc8Yw2hcM595TYTl3fF6qtLtNrAK0MUERXOIknx4rJlltCKd7hRKBOP0Mh3lTWlL4dEV+fTeHsnyRT0fAVEEQorNeKxNVAfHRZW/shO9vtS9aTX1dHjm/dZBQlQZZHTWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n7vB+WHf; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2cf98ba0559so363312a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Aug 2024 20:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723693587; x=1724298387; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n/UtcuLPeXEGeVkFD4i9l7m0b5eUI6Jyt9aWpvSyfzI=;
        b=n7vB+WHfnE7Fc6ySzNAxJH9v1nip7UqvXTgUqm2EI4HmVY6JUVUW+Iz4So6CHTflRr
         LVJxw1Q1pAkaFNaZdUTnWUf9jB7eVOYn/WRbBFkog4vNnqp0GklquDVg/xyva3WE9xQI
         BqAJOkW4hbAO2kQoAbNgLf2FG7NqZNorepODAUSyATGGlgEy+NFb7hu4Odq0vvlVQz9U
         2LdOrlpY0byU3CHEpUrSSpV1qkXrN6F3ydBo0lJKW3beOA4pgd5n6wJ0kgJA5Kppr2rH
         g7ZONfDVdTxqwBEwIT2qwbQDTGRb0U0PvRJ/+yThLm3NiwACivuLAU4BPTyH/MQI48oM
         XKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723693587; x=1724298387;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/UtcuLPeXEGeVkFD4i9l7m0b5eUI6Jyt9aWpvSyfzI=;
        b=vog9BGDYrBRRY3lqQxEaYOix6LYVtokNmHWHS7xzRNtvrl2eYl+SmHZjDpnXUbXL6Q
         wwKVPiNLxzuWcAYa31r+zvnXEGYp0D8w59qyvjI4se0NUn2/cEJYC0XVRoBq2vXQe9Bp
         xV7LNXm6YdYUh5WkKavF/3rHkoabwj955VlE+o1DnfwKGQFPAYcLFZrgys0rb+/DAO6E
         3vhiDcVJm0zRoO0dY0EbGzPgKbEcxR+s90HnHhu395hzEchZjG4/mVLteR+F8QeczfT8
         TlMRkJIkau5pvg7p0Zqv4KMjqzJEQv2YfI/3IDEG7SUiXL8KtBV3UgbX43oZzttJBPnk
         lySA==
X-Forwarded-Encrypted: i=1; AJvYcCVM/4ilDp0VqXqV4GXcPNNJE8eVc61rE50FAp9j42FekIVsnutrtf3bgqxoO5KhmZZoKQ01JAgqvmW54/M5KD2T4QLh8LF2kiekyoRj8A==
X-Gm-Message-State: AOJu0Yxp+gkp0HAsB9PDKJ0nprCaaD/jdO9yz28Dtkpv2fs5AmJjr9Z+
	tKrObReoo+D1uomKSuy4rWzPA/v1pP33o98G2YKF499Ozheuf2eupt/CzDX+Ug==
X-Google-Smtp-Source: AGHT+IFKWI2eumtYL+uYIFY0IdQGXn50Non1/LJ7OWfrGVHakeZ4f575voBgdrT/TdBcywTDGTVetw==
X-Received: by 2002:a17:90b:4b01:b0:2c9:7e98:a4b8 with SMTP id 98e67ed59e1d1-2d3aaab82b2mr5775327a91.24.1723693587323;
        Wed, 14 Aug 2024 20:46:27 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3c8792b2fsm437059a91.26.2024.08.14.20.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 20:46:26 -0700 (PDT)
Date: Thu, 15 Aug 2024 09:16:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>
Subject: Re: [PATCH 2/3] ufs: core: Add a quirk for handling broken SDBS
 field in controller capabilities register
Message-ID: <20240815034621.GB2562@thinkpad>
References: <20240814-ufs-bug-fix-v1-0-5eb49d5f7571@linaro.org>
 <20240814-ufs-bug-fix-v1-2-5eb49d5f7571@linaro.org>
 <f51533d5-46b9-4485-b71c-2fbd6a12071a@acm.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f51533d5-46b9-4485-b71c-2fbd6a12071a@acm.org>

On Wed, Aug 14, 2024 at 10:29:11AM -0700, Bart Van Assche wrote:
> On 8/14/24 10:15 AM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > 'Legacy Queue & Single Doorbell Support (SDBS)' field in the controller
> > capabilities register is supposed to be reserved for UFSHCI 3.0 based
> > controllers and should read as 0. But some controllers may report bogus
> > value of 1 due to the hardware bug. So let's add a quirk to handle those
> > controllers.
> > 
> > If the quirk is enabled by the controller driver and MCQ is not supported,
> > then 'hba->sdbs_sup' field will be ignored and the SCSI device will be
> > added in legacy/single doorbell mode.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/ufs/core/ufshcd.c | 5 +++--
> >   include/ufs/ufshcd.h      | 7 +++++++
> >   2 files changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> > index 168b9dbc3ada..acb6f261ecc2 100644
> > --- a/drivers/ufs/core/ufshcd.c
> > +++ b/drivers/ufs/core/ufshcd.c
> > @@ -10512,8 +10512,9 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
> >   	}
> >   	if (!is_mcq_supported(hba)) {
> > -		if (!hba->sdbs_sup) {
> > -			dev_err(hba->dev, "%s: failed to initialize (legacy doorbell mode not supported)\n",
> > +		if (!(hba->quirks & UFSHCD_QUIRK_BROKEN_SDBS_CAP) && !hba->sdbs_sup) {
> > +			dev_err(hba->dev,
> > +				"%s: failed to initialize (legacy doorbell mode not supported)\n",
> >   				__func__);
> >   			err = -EINVAL;
> >   			goto out_disable;
> 
> Adding a check for the UFSHCD_QUIRK_BROKEN_SDBS_CAP quirk everywhere
> hba->sdbs_sup is tested is wrong. Please move this check to the code
> that assigns a value to hba->sdbs_sup.
> 

I thought it wouldn't matter since it is used in just one place, but I agree it
is best to keep it in assignment itself.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

