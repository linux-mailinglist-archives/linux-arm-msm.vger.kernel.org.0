Return-Path: <linux-arm-msm+bounces-17009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF43A89F02F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 12:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 665351F2338B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 10:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B7A159573;
	Wed, 10 Apr 2024 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v+RKu5xk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D647A5C
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712746461; cv=none; b=vBkJxuiUuz2smpktvaNEBS8K3xSFOuVYd5aDzAATDMZ5tfoFjgYArTQ9U6d/GFm8jNBbp/UUkusrlXgeNkgZyaNDDeSkEL9le1agu2pwo7PNV17wKCTz9Wv/Kh4Eit3p7wEXdrohWk/gQXM9b+3xJz2u55Epp2gKxsr5yOxafWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712746461; c=relaxed/simple;
	bh=jUaUcsBz0kBYNiDTFGfgViL2znCd2+ewac233R5G5FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4n8+TdS0Kz3dgNViXotIy95byywu1qN+jkJug/Nfom/IFnzr/VIZdkeKpe0CC4A1VpFy3LhPZEcKIsxJWNptuCx9ypRGW7N5tV4fAbpvQ1AaSmVcmIeHNk44MKIHsjw/s7IQMp7bBvybnlKXX7EPLfokXnBGS1HdsZQdtCXAbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v+RKu5xk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ecec796323so6168571b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 03:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712746459; x=1713351259; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G7XlcG8nz/Uid5WPQaw8m1uFQJJAhe5HyrWzemE3ePs=;
        b=v+RKu5xk+HJBHb8XbUfmgazxyWPJmBDiMns33+475BbmhajRD4xhDmbqEfMakuL/zf
         C7x/9XgZ886TS+5Oc31ErzIDjz9Ojvq7/+m2lr3bPH/N4OGpL/PefSIl0rcqijW9cK2r
         I3rebyPKRq9q1vinAp0G5eiaXPzH4OCwI/WTAJEgpw7yZxZhuPGDqUR2+A6uFquF0WxP
         ZCMSz63A0QGJQPAq+SoEuBtyBFrqNS9YeaN70P6AVLMH/B4eSQIaE0xGiT/8pw+2mleE
         GwgcvpLtmUVwItSM2zGmq9UnOAUqoewLF7nKzWGkm3WkVLqa+7wh6ih2Y8ZG2vdJX6Iu
         xm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712746459; x=1713351259;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G7XlcG8nz/Uid5WPQaw8m1uFQJJAhe5HyrWzemE3ePs=;
        b=TSA7GAFkwd9png0LB8jUrtPsFuTVWv0D7qa3M0RIDcoo5cngXmoAkYN7BghZbHA4tF
         Otc5zA+uokxGBU/59L9bbPpfuZxPNRv1oMoL9tVBl7EcXtP2RhuIqm25VP5H44lV8CKS
         rj5vcmiwo4TVkCPDSb2uAXqL9xcNcRd9O/pt2sz5h6k1rboOXS43lj5b/0HsXlq8izK/
         zZ0L9Db+wJH7MVXVj6A1JffuBcGzgFFVOBQvRAHIGKwcRUUSK5luQeE9E5USfjxoxJs9
         brtnRV6QmtWuLMryt/E1PGIkV7fntcf+Q0qAKX4+rtGTEwTPDBfOuzxG4+eDtCebqzhr
         IFQg==
X-Forwarded-Encrypted: i=1; AJvYcCXuXb2PJ2eqsj8b1YArD4axHGd+3LGgaZ0ql4NFXQ7KyuGOBTSzEyQH6K2v9dDeJMjNBXs8fd/+jnJavseU6OwxaSQfXhUhcWY1ItWujw==
X-Gm-Message-State: AOJu0YyZYt4hxBhzWlWo36Lvag4AnVV/dmdRJqEOAwndWye6E1wn89Ru
	yrUOEWBH5NdgFac5q4u3k50/InTaF4geglv0hmibZig0iC0NI79c0za+ATVg4g==
X-Google-Smtp-Source: AGHT+IFCd4CUvr9tZEjG41EcHBSw0CUviyNK0Ht6d9nhGK7kPeU0ZuGtcybllY9zEnYiE3s44RmCWQ==
X-Received: by 2002:a05:6a00:2d93:b0:6ea:d114:5ea1 with SMTP id fb19-20020a056a002d9300b006ead1145ea1mr2497785pfb.17.1712746458832;
        Wed, 10 Apr 2024 03:54:18 -0700 (PDT)
Received: from thinkpad ([120.60.76.50])
        by smtp.gmail.com with ESMTPSA id i4-20020aa787c4000000b006e64c9bc2b3sm10137231pfo.11.2024.04.10.03.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 03:54:18 -0700 (PDT)
Date: Wed, 10 Apr 2024 16:24:10 +0530
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
Subject: Re: [PATCH v2 10/10] PCI: qcom: Implement shutdown() callback to
 properly reset the endpoint devices
Message-ID: <20240410105410.GC2903@thinkpad>
References: <20240401-pci-epf-rework-v2-0-970dbe90b99d@linaro.org>
 <20240401-pci-epf-rework-v2-10-970dbe90b99d@linaro.org>
 <ZgvpnqdjQ39JMRiV@ryzen>
 <20240403133217.GK25309@thinkpad>
 <Zg22Dhi2c7U5oqoz@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zg22Dhi2c7U5oqoz@ryzen>

On Wed, Apr 03, 2024 at 10:03:26PM +0200, Niklas Cassel wrote:
> On Wed, Apr 03, 2024 at 07:02:17PM +0530, Manivannan Sadhasivam wrote:
> > On Tue, Apr 02, 2024 at 01:18:54PM +0200, Niklas Cassel wrote:
> > > On Mon, Apr 01, 2024 at 09:20:36PM +0530, Manivannan Sadhasivam wrote:
> > > > PCIe host controller drivers are supposed to properly reset the endpoint
> > > > devices during host shutdown/reboot. Currently, Qcom driver doesn't do
> > > > anything during host shutdown/reboot, resulting in both PERST# and refclk
> > > > getting disabled at the same time. This prevents the endpoint device
> > > > firmware to properly reset the state machine. Because, if the refclk is
> > > > cutoff immediately along with PERST#, access to device specific registers
> > > > within the endpoint will result in a firmware crash.
> > > > 
> > > > To address this issue, let's call qcom_pcie_host_deinit() inside the
> > > > shutdown callback, that asserts PERST# and then cuts off the refclk with a
> > > > delay of 1ms, thus allowing the endpoint device firmware to properly
> > > > cleanup the state machine.
> > > 
> > > Hm... a QCOM EP device could be attached to any of the PCIe RC drivers that
> > > we have in the kernel, so it seems a bit weird to fix this problem by
> > > patching the QCOM RC driver only.
> > > 
> > > Which DBI call is it that causes this problem during perst assert on EP side?
> > > 
> > > I assume that it is pci-epf-test:deinit() callback that calls
> > > pci_epc_clear_bar(), which calls dw_pcie_ep_clear_bar(), which will both:
> > > -clear local data structures, e.g.
> > > ep->epf_bar[bar] = NULL;
> > > ep->bar_to_atu[bar] = 0;
> > > 
> > > but also call:
> > > __dw_pcie_ep_reset_bar()
> > > dw_pcie_disable_atu()
> > > 
> > > 
> > > Do we perhaps need to redesign the .deinit EPF callback?
> > > 
> > > Considering that we know that .deinit() will only be called on platforms
> > > where there will be a fundamental core reset, I guess we could do something
> > > like introduce a __dw_pcie_ep_clear_bar() which will only clear the local
> > > data structures. (It might not need to do any DBI writes, since the
> > > fundamental core reset should have reset all values.)
> > > 
> > > Or perhaps instead of letting pci_epf_test_epc_deinit() call
> > > pci_epf_test_clear_bar()/__pci_epf_test_clear_bar() directly, perhaps let
> > > pci_epf_test_epc_deinit() call add a .deinit()/.cleanup() defined in the
> > > EPC driver.
> > > 
> > > This EPC .deinit()/.cleanup() callback would then only clear the
> > > local data structures (no DBI writes...).
> > > 
> > > Something like that?
> > > 
> > 
> > It is not just about the EPF test driver. A function driver may need to do many
> > things to properly reset the state machine. Like in the case of MHI driver, it
> > needs to reset channel state, mask interrupts etc... and all requires writing to
> > some registers. So certainly there should be some time before cutting off the
> > refclk.
> 
> I was more thinking that perhaps we should think of .deinit() as in how
> dw_pcie_ep_init() used to be. It was not allowed to have any DBI writes.
> (The DBI writes were all in dw_pcie_ep_init_complete()).
> So perhaps we could define that a EPF .deinit() callback is not allowed
> to have any DBI writes.
> 
> If we take qcom-ep as an example, as soon as you get a PERST assertion
> the qcom-ep driver calls notify_deinit(), then asserts the reset control,
> disables clocks and regulators.
> 
> Since the PCIe core is held in reset, the hardware is in a well defined
> state, no? Sure, the data structures e.g. bar_to_iatu[], etc., might be
> out of sync, but these could be memset():ed no? Since this is a fundamental
> reset, all registers should be reset to their default state (once reset
> is deasserted).
> 

Well, we could prevent the register access during PERST# assert time in the
endpoint, but my worry is that we will end up with 2 version of the cleanup
APIs. Lets take an example of dw_pcie_edma_remove() API which gets called
during deinit and it touches some eDMA registers.

So should we introduce another API which just clears the sw data structure and
not touching the registers? And this may be needed for other generic APIs as
well.

Ideally, if there is a Link Down event before PERST# assert, then this could've
been solved, but that is also not a spec defined behavior.

- Mani

> For a real PCIe card, if you assert + msleep(100) + deassert PERST, surely
> the endpoint is supposed to be in a good/well defined state, regardless if
> he REFCLK was cutoff at the exact time as PERST was asserted or not?
> 
> I would assume that we would want a PCI EPF driver to behave the same way,
> if possible.
> 
> 
> Kind regards,
> Niklas

-- 
மணிவண்ணன் சதாசிவம்

