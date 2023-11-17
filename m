Return-Path: <linux-arm-msm+bounces-920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4F47EF065
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:30:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3C0D280F2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8631199B6;
	Fri, 17 Nov 2023 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuSThNAw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FCD18C38;
	Fri, 17 Nov 2023 10:30:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8B3C433C7;
	Fri, 17 Nov 2023 10:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700217040;
	bh=5GTodjIFYK3+cnDn/z8EfJv/gMxH/BGnB0nWLlAzxEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QuSThNAwH1MfJunYOe28kslPlu44S5J0JAkJPuY3v4rgiTy5E6ZobP+TAr3bCm/cN
	 siDSE8JpO29RINiiQP5ViFcsohJ/ZQ4UEfcTxxJ+jCHr/5z5cr00DbHwmgbR362l26
	 OK6aTsrFZTRSSJRi+qju/VI5E6D6Bcj/6uICNYL6sK+ujEFALEVQNZKRlb4rgsxT5W
	 f/FzTXowZsumJ5FFwZPZHhNkEbUbgumNiwgg+2N1niiXSLf/4NM881jBUmbfmrv/xz
	 vO428BOnJamwe+M1mhRUW/2NKOEvYSmcSuG1kKfgQrz3RdO1YrwxpY6vjyQcYRcsMa
	 3n2En4M7aUp4g==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r3w7T-0000av-0s;
	Fri, 17 Nov 2023 11:30:40 +0100
Date: Fri, 17 Nov 2023 11:30:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
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
Message-ID: <ZVdAz4glDioMx5Zw@hovoldconsulting.com>
References: <20231114135553.32301-2-johan+linaro@kernel.org>
 <202311152225.ZdVv0ufT-lkp@intel.com>
 <ZVTsf9A05HQ9UYT-@hovoldconsulting.com>
 <20231117102724.GI250770@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117102724.GI250770@thinkpad>

On Fri, Nov 17, 2023 at 03:57:24PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Nov 15, 2023 at 05:06:23PM +0100, Johan Hovold wrote:
> > On Wed, Nov 15, 2023 at 10:26:40PM +0800, kernel test robot wrote:
> >  
> > > >> drivers/pci/pcie/aspm.c:1186: warning: expecting prototype for pci_enable_link_state(). Prototype was for pci_enable_link_state_locked() instead
> > > 
> > > 
> > > vim +1186 drivers/pci/pcie/aspm.c
> > > 
> > >   1172	
> > >   1173	/**
> > >   1174	 * pci_enable_link_state - Clear and set the default device link state so that
> > 
> > I apparently forgot to update the name here to
> > 
> > 	pci_enable_link_state_locked
> > 
> 
> While fixing the name, please add locking information in description as well.

It's already there:

	Context: Caller holds pci_bus_sem read lock.

Johan

