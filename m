Return-Path: <linux-arm-msm+bounces-2254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 865CE7FB8B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 11:57:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41053282BAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94BC5381CD;
	Tue, 28 Nov 2023 10:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AD6s+RD+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72756D511;
	Tue, 28 Nov 2023 10:57:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8033C433C7;
	Tue, 28 Nov 2023 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701169043;
	bh=YneTLXB1mmfGNl3d0q1JaknL6gIyvE7m5Usmdw11fFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AD6s+RD+HhYX03u/xLI9X4ZvmMgS7DysGh94q+tZS3O1cAf+OBIcDcpYBkIiwr53Y
	 EVosBvet6LVHec5YJbCJHj6TjLkISwR64UUZHY5DGWLvU6UmbP75XfBvyCpJeC86tP
	 UjJTzPU8atfgF0MRQNDTRY2GoqpUGc+B7197fW3MtQEoi5ELJYg+R36Xd8rg075hPo
	 1wFeEgfjh2L/KmdVr8uNtrPYuF78BwN0I1lnqoZocOYReov7Le4/gtEzelwIKcQDoq
	 vY4rpwYWwcfiZQFQ1z0EgxF0xz5GNFoS8xetv+l/QEwPod/iNzgf6tvqUz+I10VQX9
	 NKQe2+aV88aNA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r7vmo-0005v9-2v;
	Tue, 28 Nov 2023 11:57:51 +0100
Date: Tue, 28 Nov 2023 11:57:50 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Message-ID: <ZWXHrvUDnF2dMk6r@hovoldconsulting.com>
References: <20231122191335.3058-1-quic_kriskura@quicinc.com>
 <ZV9dYpTYRXn63tXe@hovoldconsulting.com>
 <1192d91f-11bf-44af-953a-14e08e2b6ca8@quicinc.com>
 <ZWCpGdJRexnk98IN@hovoldconsulting.com>
 <004ddc69-1566-4de4-b260-0fca96a9395f@quicinc.com>
 <ZWW_FOAKp95Cf9vN@hovoldconsulting.com>
 <18965bb9-7afa-4892-8b71-981ba29d2cd4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18965bb9-7afa-4892-8b71-981ba29d2cd4@quicinc.com>

On Tue, Nov 28, 2023 at 04:02:53PM +0530, Krishna Kurapati PSSNV wrote:

> >    >> My opinion would be to keep the power_event irq as mandatory and not to
> >> include the hs_phy_irq.
> > 
> > Ok, but you still need to explain why dropping hs_phy_irq is correct.
> > 
> > Until there's a clear answer to that, it seems we need to include it.
> 
> Sure, I agree with you. It should describe what hardware is capable of, 
> not what we choose to add in driver code. In that sense we can add the 
> hs_phy_irq to all targets.
> 
> In my next revision, I can do the following:
> 
> 	- anyOf:
> 	  - items:
> 	    - const: qusb2_phy
> 	  - items:
> 	    - const: dp_hs_phy_irq
> 	    - const: dm_hs_phy_irq
> 	- const: hs_phy_irq
> 	- const: pwr_event
> 	- const: ss_phy_irq	(optional)
> 
> A modified version of your suggestion should help cover all cases and 
> describe all DT's perfectly.

It may be better to spell out the permutations. Especially since there
are no platforms with both qusb2_phy and dp/dm as I thought when
mentioning the above. Using anyOf also makes it hard to specify
min/maxItems as you'll need to do.

So back to my initial proposal, with a slight modification moving
pwr_event first (e.g. as it is not a wakeup interrupt):

qusb2-:

	- const: pwr_event
	- const: qusb2_phy
	- const: ss_phy_irq	(optional)

qusb2:

	- const: pwr_event
	- const: hs_phy_irq
	- const: qusb2_phy
	- const: ss_phy_irq	(optional)

femto-:
	- const: pwr_event
	- const: dp_hs_phy_irq
	- const: dm_hs_phy_irq
	- const: ss_phy_irq	(optional)

femto:
	- const: pwr_event
	- const: hs_phy_irq
	- const: dp_hs_phy_irq
	- const: dm_hs_phy_irq
	- const: ss_phy_irq	(optional)

That ss_phy_irq is optional would be expressed as minItems being one
less than maxItems for each permutation.

Johan

