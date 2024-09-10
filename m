Return-Path: <linux-arm-msm+bounces-31425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBC4973CE7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 18:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 235D41F24E27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 16:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C7419EEB4;
	Tue, 10 Sep 2024 16:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zukOn88a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A812198824;
	Tue, 10 Sep 2024 16:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725984263; cv=none; b=SGh4wSjx460wDXpjmv50JdrVyJq/ldytcjpRy7aCtxXVJMtR41cwIV+x/OGG6AUiYKLeOx/qXwIYHgqscgGXvNpAhMAas+MWwGfVpTnbgLJJeVqxkBUVj9xY0byPJs0831urQzRDaoq+9C3yZBbvxsbZAd+DDPCcgs5v/wUY/Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725984263; c=relaxed/simple;
	bh=lyEi07OYy0HDwQcI/tVSb6icCUDckoGveROhmrvlc/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNQshbJpOrJgKKUJ8IOfiLPmTOKLrMDzC2m5U/nd4kck35FL47/e1rJYfRUsIjE98lFztNm87w56D86EwW983MVNw6x4ft1DmUEEEMY5bOmOrYXXrfetGEmWlOI08dD0L/7yWhNQ5g3Xj3MSq95kFf3nGhGtYDtScSHE/qn6nac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zukOn88a; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=0q5V/HDrRh41vRS9Fz5fpK96NnFQDgfsGbq54/gK0tY=; b=zukOn88ac0n/yjjixjNa40s1sv
	llWM2qRl4mMc7Pt+CvyOs+4A69pme6vbBNYLQIwmPi6z30w7pltfk3vgXyypj59QFxu/A1OPmheEI
	36XfzYEZitalx1+rI9X5TDGBB6Bkj1NjOPFfWvmcIo+G9qYrMBcT3oj3k2MQsRPxMnGw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1so3LY-0077mS-Af; Tue, 10 Sep 2024 18:04:04 +0200
Date: Tue, 10 Sep 2024 18:04:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Suraj Jaiswal <jsuraj@qti.qualcomm.com>
Cc: Andrew Halaney <ahalaney@redhat.com>,
	"Suraj Jaiswal (QUIC)" <quic_jsuraj@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	"bhupesh.sharma@linaro.org" <bhupesh.sharma@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	Prasad Sodagudi <psodagud@quicinc.com>,
	Rob Herring <robh@kernel.org>, kernel <kernel@quicinc.com>
Subject: Re: [PATCH net] net: stmmac: Stop using a single dma_map() for
 multiple descriptors
Message-ID: <417420b8-3010-4223-a683-55a0daf3b962@lunn.ch>
References: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
 <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
 <CYYPR02MB9788D9D0D2424B4F8361A736E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CYYPR02MB9788D9D0D2424B4F8361A736E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>

> On Mon, Sep 02, 2024 at 03:24:36PM GMT, Suraj Jaiswal wrote:
> > Currently same page address is shared
> > between multiple buffer addresses and causing smmu fault for other 
> > descriptor if address hold by one descriptor got cleaned.
> > Allocate separate buffer address for each descriptor for TSO path so 
> > that if one descriptor cleared it should not clean other descriptor 
> > address.
> 
> I think maybe you mean something like:
> 
>     Currently in the TSO case a page is mapped with dma_map_single(), and then
>     the resulting dma address is referenced (and offset) by multiple
>     descriptors until the whole region is programmed into the descriptors.
> 
>     This makes it possible for stmmac_tx_clean() to dma_unmap() the first of the
>     already processed descriptors, while the rest are still being processed
>     by the DMA engine. This leads to an iommu fault due to the DMA engine using
>     unmapped memory as seen below:
> 
>     <insert splat>
> 
>     You can reproduce this easily by <reproduction steps>.
> 
>     To fix this, let's map each descriptor's memory reference individually.
>     This way there's no risk of unmapping a region that's still being
>     referenced by the DMA engine in a later descriptor.
> 
> That's a bit nitpicky wording wise, but your first sentence is hard for me to follow (buffer addresses seems to mean descriptor?). I think showing a splat and mentioning how to reproduce is always a bonus as well.

What might also be interesting is some benchmark
numbers. dma_map_single() is not always cheap, since it has to flush
the cache. I've no idea if only the first call is expensive, and all
the subsequent calls are cheap? Depending on how expensive it is, some
sort of refcounting might be cheaper?

     Andrew

