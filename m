Return-Path: <linux-arm-msm+bounces-67348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B96EB1818B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 14:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A1163A54F3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 12:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8C223956E;
	Fri,  1 Aug 2025 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K+J4gnRp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6CD2F5E;
	Fri,  1 Aug 2025 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754050764; cv=none; b=cuXMft1Vqpz6ps24jaWWR4D1nujv/Pb96n3w8ohZCRxw4PBV4rNKwOKuM6HBqKrOa6UoIwCz2kO6qStFMR0SyIAVRxlgEiv5IJvcJbnqtgZ8MA/6u4qP99CjpFgXxEP5sfbvGlKJhZNgCaSKV29XhDxE2s5/Y0bBsdp6azB/d5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754050764; c=relaxed/simple;
	bh=v3X4Y6GFa5Z6Re9e426LQ1bVzs4uMWOQgLnDgpHK6mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtdazEDBsePdcWI/i4Ki5nnJ4nrHv8Do39ERkTnZWREjrc1J+V5aHWORjvavXOVLYs7RBeMCR8XRYHlwQuEZIYV/NfYoo7LGS6jTnZrwmavqvBV/PekqvkCg7DzjEiyuG9xCWOYR4qT69BKxgwAXoAEz7C8KzxqVc3N9tYt7N2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K+J4gnRp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35826C4CEE7;
	Fri,  1 Aug 2025 12:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754050763;
	bh=v3X4Y6GFa5Z6Re9e426LQ1bVzs4uMWOQgLnDgpHK6mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+J4gnRpp9oYj7HZYNozhKJ7ABhCoK6m8WItz9b26HtXsCc0RL80a7xFE3dxn973r
	 PB9Hlm2wMoKbVmQJijvloMNmgcTWerCGFif0Dd/wDy/uxx4b+5NsX4CpyjoR3LGACv
	 iIyOuWAauSdBamIuob+yZZqeZABwrFcpCnlImBHWirE+RhLcxYtj7g2l+KsdgvxP0g
	 cW+/wlWK1hMNzqCMlvAoHDe94n+TQiaoz6vlO65olioWXThf1sc5ZPXZau0s/6/ZiF
	 J3Er1gVgK2RB+ZGATJxvEhHaDQ1VOTE+lsIX1nlkmF2pwHzNslC7lemN9BygxE8FaL
	 6S1jUKeIS+e/A==
Date: Fri, 1 Aug 2025 17:49:13 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com, 
	avri.altman@wdc.com, bvanassche@acm.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com, agross@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sa8155: Add gear and rate limit
 properties to UFS
Message-ID: <2nm7xurqgzrnffustrsmswy2rbug6geadaho42qlb7tr2jirlr@uw5gaery445y>
References: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
 <20250722161103.3938-3-quic_rdwivedi@quicinc.com>
 <2a3c8867-7745-4f0a-8618-0f0f1bea1d14@kernel.org>
 <jpawj3pob2qqa47qgxcuyabiva3ync7zxnybrazqnfx3vbbevs@sgbegaucevzx>
 <fa1847e3-7dab-45d0-8c1c-0aca1e365a2a@quicinc.com>
 <1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1701ec08-21bc-45b8-90bc-1cd64401abd8@kernel.org>

On Fri, Aug 01, 2025 at 11:12:42AM GMT, Krzysztof Kozlowski wrote:
> On 01/08/2025 11:10, Ram Kumar Dwivedi wrote:
> > 
> > 
> > On 01-Aug-25 1:58 PM, Manivannan Sadhasivam wrote:
> >> On Thu, Jul 24, 2025 at 09:48:53AM GMT, Krzysztof Kozlowski wrote:
> >>> On 22/07/2025 18:11, Ram Kumar Dwivedi wrote:
> >>>> Add optional limit-hs-gear and limit-rate properties to the UFS node to
> >>>> support automotive use cases that require limiting the maximum Tx/Rx HS
> >>>> gear and rate due to hardware constraints.
> >>>
> >>> What hardware constraints? This needs to be clearly documented.
> >>>
> >>
> >> Ram, both Krzysztof and I asked this question, but you never bothered to reply,
> >> but keep on responding to other comments. This won't help you to get this series
> >> merged in any form.
> >>
> >> Please address *all* review comments before posting next iteration.
> > 
> > Hi Mani,
> > 
> > Apologies for the delay in responding. 
> > I had planned to explain the hardware constraints in the next patchset’s commit message, which is why I didn’t reply earlier. 
> > 
> > To clarify: the limitations are due to customer board designs, not our SoC. Some boards can't support higher gear operation, hence the need for optional limit-hs-gear and limit-rate properties.
> > 
> 
> That's vague and does not justify the property. You need to document
> instead hardware capabilities or characteristic. Or explain why they
> cannot. With such form I will object to your next patch.
> 

I had an offline chat with Ram and got clarified on what these properties are.
The problem here is not with the SoC, but with the board design. On some Qcom
customer designs, both the UFS controller in the SoC and the UFS device are
capable of operating at higher gears (say G5). But due to board constraints like
poor thermal dissipation, routing loss, the board cannot efficiently operate at
the higher speeds.

So the customers wanted a way to limit the gear speed (say G3) and rate
(say Mode-A) on the specific board DTS.

But this series ended up adding these properties in the SoC dtsi, which was
wrong in the first place. And the patch description also lacked the above
reasoning.

I hope Ram will fix these two things in the next version.

FWIW: The customer is using a DT overlay to add these properties to the base
DTS. So there would be no DTS change posted in the next version.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

