Return-Path: <linux-arm-msm+bounces-89472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 520ADD389AD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CF1D301B82D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B0C2EBBB8;
	Fri, 16 Jan 2026 23:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eR3GzNuO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0431A21FF26;
	Fri, 16 Jan 2026 23:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605570; cv=none; b=h4tvprJnGauv9gQRPsnvR4xCus7iYpdSQBq91+Go2j4pnfR4jnCGbzEtL4TZXTzgACJ1EqRditpd4P6KEB2YIgj46vNU4Mi7l+uCtj5DhHjblSaQLyXx3wAtCe4MM/OHWj1VuVVOBUSQybvGW5geqevwFj8epofuwtYQBKr4OYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605570; c=relaxed/simple;
	bh=Lcy1/qneWWbhF9rcUNSw15OmV3c1mRk1sdmirD4A1z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gE7v5Gr8VKEvyuAFsz3VG78Ot/xKK9uHlLuKwisgJxg4FrHc0nF6HkhF/HDZDYjB/MWGfihY5CI+VHtOg2vO/xHg4Q1pD2ZlXFzFF6aSYijO9x1F2YeoQ9kR1tZ0b6vXPW3f+p3WiNIXmAmyvpbWmxbIvFBer6mDpzFKg9rsU3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eR3GzNuO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09B2C116C6;
	Fri, 16 Jan 2026 23:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768605569;
	bh=Lcy1/qneWWbhF9rcUNSw15OmV3c1mRk1sdmirD4A1z4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eR3GzNuO4c98VaXsoAYjkSJQxHybjCsD6qD/UCowv0UMcUDj8cMjkMbkqwYPXzoXY
	 XvLNCY++amsV2QtT7NM7DkGOSSo6ggg8HXYe6cnR6jTti9ww65HMTHigjggRprX55e
	 pDhOTDXU8h/BadNJ/GZQL/3Vjs15CHki3zcA+LMCCwkB8S205S7LE+nTwsikHTqZ6X
	 iA04ggLmPARaM6FaJNDSyiwEzG1GD1BFBVspqykQ+y84Q3/ZICoQwlUcxssCIk3E5q
	 +xkHLo+sWIdt9GShz0eiesL0wyEs1QCRU0nV7T3coY7ukKp8wD2qdOkkxH9vbSWCXc
	 zovgSO8VOiMVA==
Date: Fri, 16 Jan 2026 17:19:26 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
Message-ID: <ycygvgw4uwm6bb7i4fbuxmzb5a42zmn6atwwdznicvili3jh2h@eaa4ddtkwc5z>
References: <20251127212943.24480-1-jonathan@marek.ca>
 <176859948742.425550.1764024067188709567.b4-ty@kernel.org>
 <79b3e8ae-134c-df6d-396d-9b7f766ef666@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79b3e8ae-134c-df6d-396d-9b7f766ef666@marek.ca>

On Fri, Jan 16, 2026 at 05:53:59PM -0500, Jonathan Marek wrote:
> It turns out this change will make things worse for the (unfortunately
> common) EL1+64GB+brokenfirmware case.
> 
> Because of that I think the Fixes: tag and "(fix 64GB models)" should be
> dropped from the commit message. (I can also send a v2 with extra info in
> the commit message if needed)
> 

It seems to me that neither of these to actions will affect the impact
of the patch. What does "make things worse" imply?

Are we better off dropping this patch?

Regards,
Bjorn

> On 1/16/26 4:39 PM, Bjorn Andersson wrote:
> > 
> > On Thu, 27 Nov 2025 16:29:42 -0500, Jonathan Marek wrote:
> > > Unlike the phone SoCs this was copied from, x1e has a 40-bit physical bus.
> > > The upper address space is used to support more than 32GB of memory.
> > > 
> > > This fixes issues when DMA buffers are allocated outside the 36-bit range.
> > > 
> > > 
> > 
> > Applied, thanks!
> > 
> > [1/1] arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)
> >        commit: b38dd256e11a4c8bd5a893e11fc42d493939c907
> > 
> > Best regards,
> > 

