Return-Path: <linux-arm-msm+bounces-4514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF7810DB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 10:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F38601C2090A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 09:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B1E21359;
	Wed, 13 Dec 2023 09:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="RuvoDMyV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAB11E8;
	Wed, 13 Dec 2023 01:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7F13S8FLoutiZ3CalADES9Ypom9LrrGw6pCO4/ixxqw=; b=RuvoDMyVMMqqs1yxb8x0Hv1lR0
	MgvpCopZwbFbh/IJm/HmhiDSH5+was538qxsXbKTUCGvI1RgOdw3EukXbMtf4pwwf9A84COngxvsk
	1BE9R0UJ0+69oMZogGPSJ6B9j/7kgyya2bTz0TOfJerchu+fUph//fKvnOTIkCtIR4sQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rDLwI-002nrP-E7; Wed, 13 Dec 2023 10:54:02 +0100
Date: Wed, 13 Dec 2023 10:54:02 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>,
	andersson@kernel.org
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: Add sysfs nodes for
 qcom ethqos
Message-ID: <428bba44-c0b9-48b2-b4fc-feba3e2245ae@lunn.ch>
References: <20231204084854.31543-1-quic_snehshah@quicinc.com>
 <3e4a1b9c-ed0f-466e-ba11-fc5b7ef308a1@lunn.ch>
 <5d5f3955-fc30-428c-99f4-42f9b7580a84@quicinc.com>
 <0c966845-2bbc-4196-806d-6a33e435bf7d@lunn.ch>
 <dd585977-50c4-40a4-a664-0ecb5a84807a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd585977-50c4-40a4-a664-0ecb5a84807a@quicinc.com>

> >> We need to route vlan traffic of a specific Priority to GVM Queue
> >> (Ethernet queue 5) via programming a MAC register. The MAC register
> >> is not accessible in GVM and has to be programmed from PVM. stmmac
> >> already has TC OPS to program this routing via vlan
> >> priority. However, as PVM has only 4 queues enabled, TC tool will
> >> not take 5th queue as input. Hence, these nodes were added to
> >> conifure the MAC register to route specific vlan packets to 5th
> >> queue in GVM.
> >  
> >> Note: The queues mentioned above are HW MTL Queues and DMA
> >> Channels. The routing can be done in the HW itself based on vlan pcp
> >> before the packets reach to driver.
> > 
> > Is the normal way you would do this is like this:
> > 
> > tc qdisc add dev eth1 parent root handle 100 \
> > mqprio num_tc 4 \
> > map 0 1 2 3 0 0 0 0 0 0 0 0 0 0 0 0 \
> > queues 1@0 1@1 1@2 1@3 \
> > hw 1
> > 
> > But you are saying that you cannot extend this to 5 queues?
> > 
> >     Andrew
> 

> Yes this can't extend to 5 queues. Because, stmmac in primary
> virtual machine will only have 4 netdev queues. So TC won't take
> input for 5th queue.

I still don't understand your architecture. How can you have 5 queues
if the physical hardware only has 4?

Is there any documentation for all this? Any datasheet?

   Andrew

