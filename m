Return-Path: <linux-arm-msm+bounces-48609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB53A3D236
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 08:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E08B16177F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 07:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48EE11E633C;
	Thu, 20 Feb 2025 07:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PO0IGoc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5988F1E571F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 07:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740036475; cv=none; b=jhM0H5cWm2Bcu8vjpbLDSIbNBZAWsX7KRFnqLIH9uK4H0RGM4HIaTijs7oazqW+IwXBF7PCm0Z+d3QcUwUtbZxEPge9jeUq5UUIT/wHzWXsIiH7AOxGVfesUXORncxKseavyRwVDkMBMzZkxRckS1/9Q+JwitiG8VFELDz3HAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740036475; c=relaxed/simple;
	bh=p3TD4N5ncUSlR7g2MNebA4UOXXszC8KvLXpzVDZ+CJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZ2l2HHghpCqdyAOZHwE4+BzlkAlRMqYUsX0y8eyZGzrzcW1p+Ds7Bp03BrP5mIl6ZMSqb+jbLBPjcUx2gv56p5z/FK8mE/xVbj1XIUma59RtP1wQaQrGleEOKyhqEb0E5sGvKc2q7oLD+jZhS8SLMTCY4LpyKyqxfcq9G3lixU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PO0IGoc+; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-220f048c038so10206675ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2025 23:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740036472; x=1740641272; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0YiPjJjyP/SfskdcyKsiE+Tu2gFKc0Gw/xXDAcrX5o4=;
        b=PO0IGoc+eNnetJrPKHq+GZnngvfpWyQ3F6Ct2aD3YCNjVAIKOGShRuuvdbFU3nmfvM
         v7QcEUsMYP0VgIML15pW2FPAI1IaeoDOTdeyqLEouV6Vt/fFGwvMZNdYMi91rXC+PWbR
         8A96k76sJCt8dqjLhF+XcGQmcg5E72/ACYPcZf4xLz/vYYfWCkn1lAKUNgFNaqhBku4Q
         J67X22SR+p1Q0Huq+UBtjxTQyjbEDSEl8Z97gms+Zn/3a6sfaW0w5xAm/gsa2M7nmLw9
         tmhDz+r1CN73R0zldP2Ayp6kMMBBNBsuKCwBjI/aTegEvhYqbBpYLDnNkyT2wWH9Nix8
         ErtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740036472; x=1740641272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0YiPjJjyP/SfskdcyKsiE+Tu2gFKc0Gw/xXDAcrX5o4=;
        b=AjeQwUjwU1wv++Ivma4cqvqOOVDXONsqfR0OsGAVSKpg3ZjUl7lCLAruZxf8zfXqqC
         XAXJeJz9VIkFu4p8xUeCgRFwNjK2jaAUv/FGgJNRAdKb20P42+I9nuA47RAxJ1ny8Z8+
         /1ySU9kiFZfVzoc0CV9NnB+qWtFKxgn+Bk40piOpznMfZz5mA312tFJRcyvYP4dU0FNZ
         eK9x7JTFRYX2wnk4rEgFyKMyUzo49MT6/0dhSBER9nZcY5ELcW418XM1EzYUBSdn/Q/C
         GJssYDmTbvJWdhahVH08jTW5yd7AT2vA/thSDCFmOQlBrsdS/CTf47SyhrmGBtw4EW2K
         i1cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA8smPMxz4CB5PUnM/D44D7Zo3zuh6qeET66HafQYDf/7ZuN3Dzdf7eNP5y/qNHT1/Oa+Lh1nGBcIzPaHq@vger.kernel.org
X-Gm-Message-State: AOJu0YxLi+T7n7PKACutUFYbMzd/sMplyEJ90+WVgDyA0d5DlO8BZTc3
	lS+1IxjK6EmTbmCC5tlYNaoX/7NchSQi5x7dO4jDn+Xqgy/8Zfcz5kW6wkN4ZA==
X-Gm-Gg: ASbGnctl/4pnKyZrB1YnFO7Ml8WPOAAXQjJZauJmtfeZ071CFlH+2hZIh/8/0xaLkQ6
	saqqCqEhzgRiL+uNsffE2r3W0R6rjr5/X963/JvJGW9mFCZVQ/dygWmDlFAxOP1EqcbT58O35pX
	kN3WJCX83H8+zkseyJyFwzkIMFtAvTRngnxQ1zomk84/p9wqOrx3hinD9Tak7rF3Ost6WfMtt5E
	VApOJlIRUDGy/BcuqUWOQXk6Q56lmTzHbDPdAb5WfsJG/iaK7JDNrd7UKOh/sNtbbPE4rQTrWC2
	2x5hRg39sX1bLXOGISGe9OUOtQ==
X-Google-Smtp-Source: AGHT+IEbtwoZL/ZxWNIg3lz+aSPbQjpyQnSpBy7VKI7Jg+TnXQypLzMP3r745tdSDFVEJjlsB7KSqg==
X-Received: by 2002:a17:903:1a0e:b0:220:f1a1:b6e1 with SMTP id d9443c01a7336-22104028854mr364462485ad.19.1740036472649;
        Wed, 19 Feb 2025 23:27:52 -0800 (PST)
Received: from thinkpad ([120.60.70.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366242sm115665795ad.87.2025.02.19.23.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 23:27:52 -0800 (PST)
Date: Thu, 20 Feb 2025 12:57:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Shradha Todi <shradha.t@samsung.com>
Cc: 'Shuai Xue' <xueshuai@linux.alibaba.com>,
	'Jing Zhang' <renyu.zj@linux.alibaba.com>,
	'Will Deacon' <will@kernel.org>,
	'Mark Rutland' <mark.rutland@arm.com>,
	'Jingoo Han' <jingoohan1@gmail.com>,
	'Bjorn Helgaas' <bhelgaas@google.com>,
	'Lorenzo Pieralisi' <lpieralisi@kernel.org>,
	'Krzysztof =?utf-8?Q?Wilczy=C5=84ski'?= <kw@linux.com>,
	'Rob Herring' <robh@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/4] perf/dwc_pcie: Move common DWC struct definitions to
 'pcie-dwc.h'
Message-ID: <20250220072747.azfluj6mrkqy5osq@thinkpad>
References: <20250218-pcie-qcom-ptm-v1-0-16d7e480d73e@linaro.org>
 <CGME20250218143703epcas5p2c0b9a60d17e030f7d3ce37c00c9b56ca@epcas5p2.samsung.com>
 <20250218-pcie-qcom-ptm-v1-1-16d7e480d73e@linaro.org>
 <02d901db835c$f0710450$d1530cf0$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02d901db835c$f0710450$d1530cf0$@samsung.com>

On Thu, Feb 20, 2025 at 11:31:49AM +0530, Shradha Todi wrote:
> 
> 
> > -----Original Message-----
> > From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
> > Sent: 18 February 2025 20:07
> > To: Shuai Xue <xueshuai@linux.alibaba.com>; Jing Zhang <renyu.zj@linux.alibaba.com>; Will Deacon <will@kernel.org>; Mark Rutland
> > <mark.rutland@arm.com>; Jingoo Han <jingoohan1@gmail.com>; Bjorn Helgaas <bhelgaas@google.com>; Lorenzo Pieralisi
> > <lpieralisi@kernel.org>; Krzysztof Wilczyński <kw@linux.com>; Rob Herring <robh@kernel.org>
> > Cc: Shradha Todi <shradha.t@samsung.com>; linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-perf-
> > users@vger.kernel.org; linux-pci@vger.kernel.org; linux-arm-msm@vger.kernel.org; Manivannan Sadhasivam
> > <manivannan.sadhasivam@linaro.org>
> > Subject: [PATCH 1/4] perf/dwc_pcie: Move common DWC struct definitions to 'pcie-dwc.h'
> > 
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Since these are common to all Desginware PCIe IPs, move them to a new header, 'pcie-dwc.h' so that other drivers could make use of
> > them.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  MAINTAINERS                 |  1 +
> >  drivers/perf/dwc_pcie_pmu.c | 23 ++---------------------
> >  include/linux/pcie-dwc.h    | 34 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 37 insertions(+), 21 deletions(-)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 896a307fa065..b4d09d52a750 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -18123,6 +18123,7 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie-ep.yaml
> >  F:	Documentation/devicetree/bindings/pci/snps,dw-pcie.yaml
> >  F:	drivers/pci/controller/dwc/*designware*
> > +F:	include/linux/pcie-dwc.h
> > 
> >  PCI DRIVER FOR TI DRA7XX/J721E
> >  M:	Vignesh Raghavendra <vigneshr@ti.com>
> > diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c index cccecae9823f..05b37ea7cf16 100644
> > --- a/drivers/perf/dwc_pcie_pmu.c
> > +++ b/drivers/perf/dwc_pcie_pmu.c
> > @@ -13,6 +13,7 @@
> >  #include <linux/errno.h>
> >  #include <linux/kernel.h>
> >  #include <linux/list.h>
> > +#include <linux/pcie-dwc.h>
> >  #include <linux/perf_event.h>
> >  #include <linux/pci.h>
> >  #include <linux/platform_device.h>
> > @@ -99,26 +100,6 @@ struct dwc_pcie_dev_info {
> >  	struct list_head dev_node;
> >  };
> > 
> > -struct dwc_pcie_pmu_vsec_id {
> > -	u16 vendor_id;
> > -	u16 vsec_id;
> > -	u8 vsec_rev;
> > -};
> > -
> > -/*
> > - * VSEC IDs are allocated by the vendor, so a given ID may mean different
> > - * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
> > - */
> > -static const struct dwc_pcie_pmu_vsec_id dwc_pcie_pmu_vsec_ids[] = {
> > -	{ .vendor_id = PCI_VENDOR_ID_ALIBABA,
> > -	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> > -	{ .vendor_id = PCI_VENDOR_ID_AMPERE,
> > -	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> > -	{ .vendor_id = PCI_VENDOR_ID_QCOM,
> > -	  .vsec_id = 0x02, .vsec_rev = 0x4 },
> > -	{} /* terminator */
> > -};
> > -
> >  static ssize_t cpumask_show(struct device *dev,
> >  					 struct device_attribute *attr,
> >  					 char *buf)
> > @@ -529,7 +510,7 @@ static void dwc_pcie_unregister_pmu(void *data)
> > 
> >  static u16 dwc_pcie_des_cap(struct pci_dev *pdev)  {
> > -	const struct dwc_pcie_pmu_vsec_id *vid;
> > +	const struct dwc_pcie_vsec_id *vid;
> >  	u16 vsec;
> >  	u32 val;
> > 
> > diff --git a/include/linux/pcie-dwc.h b/include/linux/pcie-dwc.h new file mode 100644 index 000000000000..261ae11d75a4
> > --- /dev/null
> > +++ b/include/linux/pcie-dwc.h
> > @@ -0,0 +1,34 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2021-2023 Alibaba Inc.
> > + *
> > + * Copyright 2025 Linaro Ltd.
> > + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > + */
> > +
> > +#ifndef LINUX_PCIE_DWC_H
> > +#define LINUX_PCIE_DWC_H
> > +
> > +#include <linux/pci_ids.h>
> > +
> > +struct dwc_pcie_vsec_id {
> > +	u16 vendor_id;
> > +	u16 vsec_id;
> > +	u8 vsec_rev;
> > +};
> > +
> > +/*
> > + * VSEC IDs are allocated by the vendor, so a given ID may mean
> > +different
> > + * things to different vendors.  See PCIe r6.0, sec 7.9.5.2.
> > + */
> > +static const struct dwc_pcie_vsec_id dwc_pcie_pmu_vsec_ids[] = {
> 
> Rename this to dwc_pcie_rasdes_vsec_ids? pmu was perf file specific but technically the vsec is rasdes.
> 

Sure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

