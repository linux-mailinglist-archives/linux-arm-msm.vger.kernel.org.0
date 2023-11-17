Return-Path: <linux-arm-msm+bounces-946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6877EF108
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:50:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 577A9B20C49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8B61A5AD;
	Fri, 17 Nov 2023 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVsv6nmF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A01A5A8;
	Fri, 17 Nov 2023 10:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0501CC433C8;
	Fri, 17 Nov 2023 10:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700218217;
	bh=HvWpi6K5JMfOG02tS6wIaBqmihK/4R9WAkRywr1PWk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eVsv6nmFrCOWliGgEylZ3eoOcL1B5/EIqny6OK8ESrckYwnkPxK6aqSYHZ9CEGzCa
	 GGQpTgbrqmFdyE891FwxMfG1G4KVsyEEKTPFnjkJRor4Tv3sznOpH5R4+gWjeLR2a/
	 djecHn0lDy1Hqk7BLjpJwstd/jTkXhs4fpp7VXJuUWW07C9d+GBc5922K7Zpv46EER
	 eoiGZmr+BSlobU9naNZ+zpqGXUFnJCr4cwHMYZsbBD8MuaqSsaM3I6uvlFT6kuD3SE
	 y7FjuSVjofKwnc5UqvK7nXifpd2n3VVaurBW+68KBu6DDfVFrSwc/dmX0/TsQ6gzP5
	 yHb3gRw/hGd5w==
Date: Fri, 17 Nov 2023 16:20:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <helgaas@kernel.org>, oe-kbuild-all@lists.linux.dev,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Michael Bottini <michael.a.bottini@linux.intel.com>,
	"David E . Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH 1/6] PCI/ASPM: Add locked helper for enabling link state
Message-ID: <20231117105007.GQ250770@thinkpad>
References: <20231114135553.32301-2-johan+linaro@kernel.org>
 <202311152225.ZdVv0ufT-lkp@intel.com>
 <ZVTsf9A05HQ9UYT-@hovoldconsulting.com>
 <20231117102724.GI250770@thinkpad>
 <ZVdAz4glDioMx5Zw@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVdAz4glDioMx5Zw@hovoldconsulting.com>

On Fri, Nov 17, 2023 at 11:30:39AM +0100, Johan Hovold wrote:
> On Fri, Nov 17, 2023 at 03:57:24PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Nov 15, 2023 at 05:06:23PM +0100, Johan Hovold wrote:
> > > On Wed, Nov 15, 2023 at 10:26:40PM +0800, kernel test robot wrote:
> > >  
> > > > >> drivers/pci/pcie/aspm.c:1186: warning: expecting prototype for pci_enable_link_state(). Prototype was for pci_enable_link_state_locked() instead
> > > > 
> > > > 
> > > > vim +1186 drivers/pci/pcie/aspm.c
> > > > 
> > > >   1172	
> > > >   1173	/**
> > > >   1174	 * pci_enable_link_state - Clear and set the default device link state so that
> > > 
> > > I apparently forgot to update the name here to
> > > 
> > > 	pci_enable_link_state_locked
> > > 
> > 
> > While fixing the name, please add locking information in description as well.
> 
> It's already there:
> 
> 	Context: Caller holds pci_bus_sem read lock.

Ah, I was looking for it in the description. Fine then!

- Mani

> 
> Johan

-- 
மணிவண்ணன் சதாசிவம்

