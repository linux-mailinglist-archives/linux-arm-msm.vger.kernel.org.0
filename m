Return-Path: <linux-arm-msm+bounces-54615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7E8A9157E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 09:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AEA81898D94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 07:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBD421A458;
	Thu, 17 Apr 2025 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQqR4Pm8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE6E219A8C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 07:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875738; cv=none; b=rGCYQftiTIHh7y+dLwOVeofIPFBEKvbppg04UbAJ8NXl/AgiUxCxY6MXOfGt9PVpQktGD9tCgGdf/khT1GpHySFF1K9aWrxWTprSMeNhuJQVnU+PaG7mNUO1Bb95AKgSPvcBvanbjjDO/Zd4kk0cyiOdA3yjNvF30zwtecHf2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875738; c=relaxed/simple;
	bh=mVQwtEZSIlgHa/mm1mmUYoeDx30+E8QTcMPkDxPlNF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxsITIIbQVd48gwBe+9Ycm1x8XBHV4CqwqGvEnc03pwLQdriUp3ZRJciwnQUzqsIUNsG+KCXy8aO7XmaGaLzhTMkNCVsSi1BwjHxttVCSuCHW2RCgRz2yOckF/RC42zEXeDcRuCN1ypk0Z9QhPd/wKwj9EgZdsXAlDytxTu8tsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQqR4Pm8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-224341bbc1dso4555505ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Apr 2025 00:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875735; x=1745480535; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eDgB7wJ22ie3HmeLXVm86GHefERwHEPMmaPgZUtFTeM=;
        b=wQqR4Pm8rBZKdlxXyseRgKtd9U9JpvKFaxiVpgCLU69FG7KhNy3kcP064s6ki0Cabx
         H3nhgMN3CavkbM0vZ7svGG+PzM4ZLYWrVwNOz7OvR4KLKbMcOs/r8IMyumx+MJL5xa2h
         B7s7sCeZGLgfKdh0KWN5LXfqzfHSmYwYp1drtgqYeELQVcyk5PvKv2qDZfQWcXCkdGf8
         K47PsP2JXVDe7YjntJMr5OgyHcR8hWbCu0A27Qto6czighlnSyqIsoZOdEJra60xtudP
         8+90v6WsznqbIFsIbmQZrKki8WdDv7E3kzTJd4Uk8iuMtfsM/NvC/Tyk6o67AVJVg/Bw
         G+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875735; x=1745480535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDgB7wJ22ie3HmeLXVm86GHefERwHEPMmaPgZUtFTeM=;
        b=fRb4Gdu8Xtf8k3n76b85i4HCcRUlnWG0jPNWf62ykIz2FGSTGYqxLxKlR2M7Y7taOI
         j9ZPYdEgKzhQMcBd+tH8Y+OLXKutdC7uN4PrORT6GBEWBRE1ia6h3UNGqCg/jfLqI1eM
         OtWGeGvXr4Y8txWB7hpj1AzU4tu2COx99dSTnLiJICRtkfK0PsU4UwGH9UTsfRmcQ++f
         25vli/Ok5dI8IBYwxvOhZGD2UkFFijgi+DQW+8RwWkCWtTW79iDIcfkd5a0nWqv3ILCV
         5UxGudRq4mZxR32PmP5LLAGXTDbBFnbLUFCwV7airP51lU3AFSMV8XsAA6yJRrbHM/Gh
         oxpA==
X-Forwarded-Encrypted: i=1; AJvYcCV0hZ0SrZF4fEkZxLCuMELH763eoehkpoL/EZKqhtUvGxdw07GLJTD1zT17fE4wDgy+ZVq63Q0PlXPg3KsE@vger.kernel.org
X-Gm-Message-State: AOJu0YwdTAFa/qyznBAkmtT19TJFZ7G1Fg+ew92KNSy7hOr68yeJvyqA
	ik1GVi+yYX81nzLCa/hzpnSKeaTFQW6jbgdFSQ28Zi6jRAlw2QucfaRtpLJneA==
X-Gm-Gg: ASbGnct2xrB0xs1bwMujK4SJFTBX9L8YxBZcyTpw8D0W468IJ4KKBlhuMN+0kKm/a0r
	GwQyBWLPDNIja88RKwQZQvVn4h8APM6UCC+HO7Dg+nsDX91zyRTD22GxObmp4EQC9htbqvsCu6k
	uUzfdBT46XupmQ0ptX5ZYtw//zMOHhZ2ASwFMnS3Ewx5ugRvjuZRiVlER+NLpznPC90YxQ+dWN5
	5NYJDATeTsUUrEeWFX2YEVLvUn5rywH7GrgmM6ZCInwuuG1hwcTpKVVX2AKTM8kl1YXfK54qQ5p
	icjVsIOWO4NbJNogK9N6tW/yFV2dJdedTzLsrho7vUCXhFh5nrnTviAcI/s=
X-Google-Smtp-Source: AGHT+IG/Yi/qk4YGrJvgZRoRnXd14pk5pi5diwpsqtszPlC13bqbgZFlocoYN6rPXNF0yZn07MCGQQ==
X-Received: by 2002:a17:902:dacc:b0:223:35cb:e421 with SMTP id d9443c01a7336-22c35985d1dmr68962035ad.49.1744875735660;
        Thu, 17 Apr 2025 00:42:15 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3e0e19d2sm15264935ad.91.2025.04.17.00.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:42:15 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:12:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Message-ID: <doyt4kcaffgjm5u5notcjnqur7ydim3dpo4se5em2an36wa3rp@xzntx4sa47dl>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
 <Z__hZ2M8wDHn2XSn@wunner.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z__hZ2M8wDHn2XSn@wunner.de>

On Wed, Apr 16, 2025 at 06:57:11PM +0200, Lukas Wunner wrote:
> On Wed, Apr 16, 2025 at 09:59:05PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > --- a/drivers/pci/pcie/err.c
> > +++ b/drivers/pci/pcie/err.c
> > @@ -270,3 +270,30 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> >  
> >  	return status;
> >  }
> > +
> > +static pci_ers_result_t pcie_do_slot_reset(struct pci_dev *dev)
> > +{
> > +	int ret;
> > +
> > +	ret = pci_bus_error_reset(dev);
> > +	if (ret) {
> > +		pci_err(dev, "Failed to reset slot: %d\n", ret);
> > +		return PCI_ERS_RESULT_DISCONNECT;
> > +	}
> > +
> > +	pci_info(dev, "Slot has been reset\n");
> > +
> > +	return PCI_ERS_RESULT_RECOVERED;
> > +}
> > +
> > +void pcie_do_recover_slots(struct pci_host_bridge *host)
> > +{
> > +	struct pci_bus *bus = host->bus;
> > +	struct pci_dev *dev;
> > +
> > +	for_each_pci_bridge(dev, bus) {
> > +		if (pci_is_root_bus(bus))
> > +			pcie_do_recovery(dev, pci_channel_io_frozen,
> > +					 pcie_do_slot_reset);
> > +	}
> > +}
> 
> Since pcie_do_slot_reset(), pcie_do_recover_slots() and
> pcie_do_recover_slots() are only needed on platforms with a
> specific host controller (and not, say, on x86), it would be good
> if they could be kept e.g. in a library in drivers/pci/controller/
> to avoid unnecessarily enlarging the .text section for everyone else.
> 
> One option would be the existing pci-host-common.c, another a
> completely new file.
> 

I don't like introducing a new file, so I'll make pci-host-common as a common
library for host controller drivers and move this code there.

> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -966,6 +966,7 @@ int pci_aer_clear_status(struct pci_dev *dev);
> >  int pci_aer_raw_clear_status(struct pci_dev *dev);
> >  void pci_save_aer_state(struct pci_dev *dev);
> >  void pci_restore_aer_state(struct pci_dev *dev);
> > +void pcie_do_recover_slots(struct pci_host_bridge *host);
> >  #else
> >  static inline void pci_no_aer(void) { }
> >  static inline void pci_aer_init(struct pci_dev *d) { }
> > @@ -975,6 +976,26 @@ static inline int pci_aer_clear_status(struct pci_dev *dev) { return -EINVAL; }
> >  static inline int pci_aer_raw_clear_status(struct pci_dev *dev) { return -EINVAL; }
> >  static inline void pci_save_aer_state(struct pci_dev *dev) { }
> >  static inline void pci_restore_aer_state(struct pci_dev *dev) { }
> > +static inline void pcie_do_recover_slots(struct pci_host_bridge *host)
> > +{
> > +	struct pci_bus *bus = host->bus;
> > +	struct pci_dev *dev;
> > +	int ret;
> > +
> > +	if (!host->reset_slot)
> > +		dev_warn(&host->dev, "Missing reset_slot() callback\n");
> > +
> > +	for_each_pci_bridge(dev, bus) {
> > +		if (!pci_is_root_bus(bus))
> > +			continue;
> > +
> > +		ret = pci_bus_error_reset(dev);
> > +		if (ret)
> > +			pci_err(dev, "Failed to reset slot: %d\n", ret);
> > +		else
> > +			pci_info(dev, "Slot has been reset\n");
> > +	}
> > +}
> >  #endif
> 
> Unusual to have such a large inline function in a header.
> Can this likewise be moved to some library file and separated
> from the other version via #ifdef please?
> 

Sure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

