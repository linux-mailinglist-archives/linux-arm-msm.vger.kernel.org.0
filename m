Return-Path: <linux-arm-msm+bounces-88061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E7015D03194
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 14:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7334E30B0C65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 13:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC907496905;
	Thu,  8 Jan 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8V3/0EL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A44143A201;
	Thu,  8 Jan 2026 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767869437; cv=none; b=ZmMT82O5vPl3hJqjSJwdDWv7uySb0SxAOkWhai7uKBe+gjmF9N21oCjfO7dGnDAh8HF60skmgPz42QOOpNHHvwBr+lCx94xWgm1Q7xH3rCxe6JJ+FeRk6tlkKEFuunPZdAp/VPwzVcOb4xWUmdio3ogvOKghRSSDsTMAC+AhfzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767869437; c=relaxed/simple;
	bh=SGpUDos42pBZDIMyyUzT0elvZpqutwatO6lXeABoE1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrwBiBVt9g7ujz6tQwfbkmNg+FAGhronAAdGLzH0NfAUjunScvbOMlxnqbbxpZuk2lok9oB+Y+R4P8YEc8fxZb9RspUjPSSbVCUqJsdlmrvKwzR20ARdLbtbnMhcUo5dwsasKKwSAPidVh1oirJON4iixQVqXTxCOrPMrcwQzDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8V3/0EL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A032C116C6;
	Thu,  8 Jan 2026 10:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767869435;
	bh=SGpUDos42pBZDIMyyUzT0elvZpqutwatO6lXeABoE1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8V3/0ELFHU1p07HAatOLM9KHplMMAJHZfTXP4fO0eibun/fUWca/MTCerJSSpvrs
	 Fm9iA883hT3wdDe/N++UR+C9ggNJ1jwemGcc/rwHmB36hhxiYca5RDnZZ9arCCah/F
	 cX9jZYvenEB9uknaOmefIzjJGzyJPWtNyxMzdePvvdyMMJ9AA4kWRE+LKGAYsFVVaL
	 GVJGIGF7hLO11izUPGS7pMVf8/BVumuG1SsrTXarWh9ueQmQzWlKXK9HgNVTDJHIPL
	 fJ0Bkd+TD/QQWdQkk7DfXNC/zUlvAMDcGjP1G+NtohPRJwd7CZ4q1a/9NARhIiFPwr
	 6pzPVWMSzoFKQ==
Date: Thu, 8 Jan 2026 16:20:27 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, akhilpo@oss.qualcomm.com,
	vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
	robin.clark@oss.qualcomm.com, lumag@kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: agatti: Address Gunyah memory
 alignment needs
Message-ID: <aV-L81f5NQg4leu8@sumit-xelite>
References: <20251229071258.456254-1-sumit.garg@kernel.org>
 <20251229071258.456254-2-sumit.garg@kernel.org>
 <ahbbg3pffedrjzvksgz2jv7lwajwlcxc6nsmmtunwc4346eawa@xayff4ozvdbn>
 <aVtQHftDmENIAxrb@sumit-xelite>
 <73bcf4c8-3d49-4b55-a771-0c5c1ef54380@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73bcf4c8-3d49-4b55-a771-0c5c1ef54380@oss.qualcomm.com>

On Wed, Jan 07, 2026 at 12:29:02PM +0100, Konrad Dybcio wrote:
> On 1/5/26 6:46 AM, Sumit Garg wrote:
> > On Sat, Jan 03, 2026 at 09:49:04AM -0600, Bjorn Andersson wrote:
> >> On Mon, Dec 29, 2025 at 12:42:58PM +0530, Sumit Garg wrote:
> >>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >>>
> >>> Gunyah hypervisor requires it's memory start address to be 2MB aligned.
> >>> So the address map for Agatti is updated to incorporate that requirement.
> >>> This should be a backwards compatible DT change which should work with
> >>> legacy QHEE based firmware stack too.
> >>>
> >>
> >> How come this isn't conveyed to the operating system using the UEFI
> >> memory map?
> >>
> > 
> > I agree that with EFI boot, the information is getting conveyed via EFI
> > memory map. But there will be non-EFI boot scenarios as well in case of
> > U-Boot. And moreover I suppose we need to keep the reserved memory
> > ranges in DT updated to reflect the actual memory map.
> 
> Can U-Boot not do the same by altering /reserved-memory or /memory/reg?

I suppose you are referring to DT fixups here, we generally try to keep
them to a minimum required in U-Boot.

BTW, don't we want to keep reserved memory ranges updated in DT? Or we plan
to drop them altogether?

-Sumit

