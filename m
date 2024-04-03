Return-Path: <linux-arm-msm+bounces-16289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFA9897172
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 15:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 053651F209B7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Apr 2024 13:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227131487DE;
	Wed,  3 Apr 2024 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lpxgkZ0v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B41226AC8
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Apr 2024 13:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712151968; cv=none; b=lnyWu4OhTsxgR2P9ybJsS9DTtwlQT7edCxzag5YlOd3U5nn47+Lzn7j+0GeiHIETk9xICkPXTJ9fhvTiNiOvPmOcyDv8mZKg01zoUo6IYLeQyxuTgbzf1SWlGVSoumxPaV4nus/RuQjHRv01ql+9VdJyjl1QL1deDzlamrKHDWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712151968; c=relaxed/simple;
	bh=oNVe7SUbSSVH8Hwzoz+0n5x3tQwhvVYI/rKOgk9P1Ko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIyHz1h7tuwYH4qxdXQD8I8n/ZRne4nfP9X+fSrCcz+WCcf97NOpLVUthfxRYe7sUAFQZ2Bh8DQiTGk3UaX76Bef+uDz98RGV+iAdNgz5I9ezrwwHYIWARhlFOGhRi+69YzUF4zCTSDrzI0mn60ezSlPcDb/BE1SlE02VuPSFhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lpxgkZ0v; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1def89f0cfdso7483225ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Apr 2024 06:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712151966; x=1712756766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=902P16CJPnj1xKchC1BfN1x8nt3eQDIalgicu+1Lvwk=;
        b=lpxgkZ0vASiLQ+/wepIN45dVAGmf9Zm+N8OKg48F7O3ybnu/PMWZSCTidHAS/p10km
         1OVI1Mmgo8kf03lcg4l3kHsjPyj3vsyqMEfwTDvJr4b4FJKBsordR+ZiTdc/z+R05hlk
         qjqk+DIFutN2gM1Tg3ByzlZ1TwUg2m4Ky0UOXzray5y5lPZ+C41NScuZZ0Exe3vXcZ8A
         FeJ7/xSwnTqokTHmXUE67+SMYdCvoQubW8HWAI2XLD023p/5CsZJ2NIGB52+P7q2DTil
         CXVtLh0MNotVxHBZRawG26x5w8Qki7WtZM9536mRQbbPXrJKbCdx4AqnrirQMIujtGHB
         YZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712151966; x=1712756766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=902P16CJPnj1xKchC1BfN1x8nt3eQDIalgicu+1Lvwk=;
        b=WDc7a06UW+FBHxchO6rCZTBHpAoDt5twQC+0RPKbmsbpCPAWTP7Ldu1NZDmujomPp5
         IsU/8SEW4pHni/yilmLu3WLAKifpwdxV4iVGzhyXO4wOkwfos/dBO4eRVSnlqHiFAH/J
         1QEaJVAtMu6M9hHFcDCHsKUeqdxmmLoRNGds2hZ38qq8+BADPz1y+QL31zogByalle1b
         Wq28efGAmFYrU3wygswEQK75q2rpl7warad1aeYEOh1PRZM5qthidDxFjw54EiaX/ODZ
         BIeH5YOj6nh4EtMGxkDotX5LclRzz9yErvZqDkEjBkoHAAA/H5oM37rS/87ejklGnc1p
         oA7A==
X-Forwarded-Encrypted: i=1; AJvYcCWIB76Co+YchadZTd/o7TgkzDJqax2V7CsIe733qumsV9L1fLA3dJ0iu7xYP4Tba4tAGot3kXaA6xveIUBDjuXOY+hiW2sMO112K607JA==
X-Gm-Message-State: AOJu0YzYHHUxjvxdUEqAPGu+LwS3hBhgIl3OmgDeKF7U6lvAjlZvHOSi
	J5M/c1bBe7xKjlKV28Nt4xwXlvcQ7r2eJjLpVDRNn71+3PIsTSo48+z/ybw93Q==
X-Google-Smtp-Source: AGHT+IHatIDalzVcNZetMx8G4eOcZq4CA3SOosvubbiLoS5X3FwlL5WkyiDNnVYB6kUtPKfF3k+0Ug==
X-Received: by 2002:a17:903:2282:b0:1e2:45f3:2d57 with SMTP id b2-20020a170903228200b001e245f32d57mr3249524plh.6.1712151965699;
        Wed, 03 Apr 2024 06:46:05 -0700 (PDT)
Received: from thinkpad ([103.28.246.48])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902654500b001e290812d49sm1720356pln.226.2024.04.03.06.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:46:05 -0700 (PDT)
Date: Wed, 3 Apr 2024 19:16:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 03/10] PCI: endpoint: Rename core_init() callback in
 'struct pci_epc_event_ops' to init()
Message-ID: <20240403134600.GL25309@thinkpad>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
 <20240401-pci-epf-rework-v2-3-970dbe90b99d@linaro.org>
 <ZgvjWtC0f1CY6DJs@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgvjWtC0f1CY6DJs@ryzen>

On Tue, Apr 02, 2024 at 12:52:10PM +0200, Niklas Cassel wrote:
> On Mon, Apr 01, 2024 at 09:20:29PM +0530, Manivannan Sadhasivam wrote:
> > core_init() callback is used to notify the EPC initialization event to the
> > EPF drivers. The 'core' prefix was used indicate that the controller IP
> > core has completed initialization. But it serves no purpose as the EPF
> > driver will only care about the EPC initialization as a whole and there is
> > no real benefit to distinguish the IP core part.
> > 
> > So let's rename the core_init() callback in 'struct pci_epc_event_ops' to
> > just init() to make it more clear.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c  |  4 ++--
> >  drivers/pci/endpoint/functions/pci-epf-test.c |  4 ++--
> >  drivers/pci/endpoint/pci-epc-core.c           | 16 ++++++++--------
> >  include/linux/pci-epf.h                       |  4 ++--
> >  4 files changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > index 280863c0eeb9..b3c26ffd29a5 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> > @@ -716,7 +716,7 @@ static void pci_epf_mhi_dma_deinit(struct pci_epf_mhi *epf_mhi)
> >  	epf_mhi->dma_chan_rx = NULL;
> >  }
> >  
> > -static int pci_epf_mhi_core_init(struct pci_epf *epf)
> > +static int pci_epf_mhi_epc_init(struct pci_epf *epf)
> >  {
> >  	struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
> >  	const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
> > @@ -897,7 +897,7 @@ static void pci_epf_mhi_unbind(struct pci_epf *epf)
> >  }
> >  
> >  static const struct pci_epc_event_ops pci_epf_mhi_epc_event_ops = {
> > -	.core_init = pci_epf_mhi_core_init,
> > +	.init = pci_epf_mhi_epc_init,
> >  };
> >  
> >  static const struct pci_epc_bus_event_ops pci_epf_mhi_bus_event_ops = {
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 973db0b1bde2..abcb6ca61c4e 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> > @@ -731,7 +731,7 @@ static int pci_epf_test_set_bar(struct pci_epf *epf)
> >  	return 0;
> >  }
> >  
> > -static int pci_epf_test_core_init(struct pci_epf *epf)
> > +static int pci_epf_test_epc_init(struct pci_epf *epf)
> 
> On V1 you agreed that it is better to remove 'epc' from the naming.
> (For both pci-epf-test and pci-epf-mhi).
> You seem to have forgotten to address this for V2.
> 

Oh yeah, sorry about that. I tried to address comments for both series and
apparently this one got missed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

