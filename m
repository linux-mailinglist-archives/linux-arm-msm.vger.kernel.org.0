Return-Path: <linux-arm-msm+bounces-42822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636609F8299
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 18:54:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AA3616530F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 17:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19411AAA16;
	Thu, 19 Dec 2024 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUWDX+wd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C18119DF60;
	Thu, 19 Dec 2024 17:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630694; cv=none; b=nhluxXGnp3cOjPHAwvTlEf2IjJHiuHrVmN2cR5PofavSHDJIR/gR38SRQEI/NbMK8h0LpTQoqIm7WtnIJ3o4dkJoQ7pxPvXo2MfVzCezUbcYVzVZVmHj1q23rHwjtB7+OkKr3TYsiJBCerIKLHq1KVfE2RFEhn9fzKG8XWyNjAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630694; c=relaxed/simple;
	bh=mQhuLz9tB1b4rMtMDBUwzTyOUylWB0rq8Uw9EnJkeJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xp8qKqU3v3xDUjGEK+uDSdEnDpiURycjuREGvIACh81k5A6mCc2Co9/W7Z+E5nJIiDoRfKAk4U4A/M3jRaQNW2DPXzARdSXClFoT/pu3UiJlm9H9kq8Ss9CLA8ae16XtmAQR16Rv9T3FVtDUMyQY7nKn4qKMhg1Ks4CS2+ysgLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUWDX+wd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0D1C4CECE;
	Thu, 19 Dec 2024 17:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734630694;
	bh=mQhuLz9tB1b4rMtMDBUwzTyOUylWB0rq8Uw9EnJkeJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUWDX+wdWE+4qT6IPuWnw0OM+pH5ewsQlPNY427+g8ggMUC0S/Kh7FG+fcYEO/60P
	 p0EbtyjpK6LsDXT5V/SuDHFgfy0BgZpGlZiCHCiZbXvUMEo8foREbdrJzDNNCsRn8X
	 pOT8jiddQ9Mb+aS1U22qValRQ0w7meP4XbmqViftCdUb18Gej65qvwLQrQmkf1tNji
	 rs1K49lQIxCKU5QpIhDOh8o0oohuDefzlCG3DYi54YKTHkeD63vsypGUsqsKpTom/Q
	 Dak2vHjXTwo/2S+Fsj9v12FjGp7hLzxUllaLsiK0LvpUgqpz/BaMgWQ512sBxiV/Wd
	 OVOVkKZIPJ3Og==
Date: Thu, 19 Dec 2024 17:51:28 +0000
From: Will Deacon <will@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Roxana Bradescu <roxabee@google.com>,
	Trilok Soni <quic_tsoni@quicinc.com>,
	bjorn.andersson@oss.qualcomm.com, stable@vger.kernel.org,
	James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] arm64: errata: Assume that unknown CPUs _are_
 vulnerable to Spectre BHB
Message-ID: <20241219175128.GA25477@willie-the-truck>
References: <20241214005248.198803-1-dianders@chromium.org>
 <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213165201.v2.1.I2040fa004dafe196243f67ebcc647cbedbb516e6@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Dec 13, 2024 at 04:52:02PM -0800, Douglas Anderson wrote:
> The code for detecting CPUs that are vulnerable to Spectre BHB was
> based on a hardcoded list of CPU IDs that were known to be affected.
> Unfortunately, the list mostly only contained the IDs of standard ARM
> cores. The IDs for many cores that are minor variants of the standard
> ARM cores (like many Qualcomm Kyro CPUs) weren't listed. This led the
> code to assume that those variants were not affected.
> 
> Flip the code on its head and instead list CPU IDs for cores that are
> known to be _not_ affected. Now CPUs will be assumed vulnerable until
> added to the list saying that they're safe.
> 
> As of right now, the only CPU IDs added to the "unaffected" list are
> ARM Cortex A35, A53, and A55. This list was created by looking at
> older cores listed in cputype.h that weren't listed in the "affected"
> list previously.

There's a list of affected CPUs from Arm here:

https://developer.arm.com/Arm%20Security%20Center/Spectre-BHB

(obviously only covers their own designs).

So it looks like A510 and A520 should be unaffected too, although I
didn't check exhaustively. It also looks like A715 is affected but the
whitepaper doesn't tell you what version of 'k' to use...

> Unfortunately, while this solution is better than what we had before,
> it's still an imperfect solution. Specifically there are two ways to
> mitigate Spectre BHB and one of those ways is parameterized with a "k"
> value indicating how many loops are needed to mitigate. If we have an
> unknown CPU ID then we've got to guess about how to mitigate it. Since
> more cores seem to be mitigated by looping (and because it's unlikely
> that the needed FW code will be in place for FW mitigation for unknown
> cores), we'll choose looping for unknown CPUs and choose the highest
> "k" value of 32.

I don't think we should guess. Just say vulnerable.

> The downside of our guessing is that some CPUs may now report as
> "mitigated" when in reality they should need a firmware mitigation.
> We'll choose to put a WARN_ON splat in the logs in this case any time
> we had to make a guess since guessing the right mitigation is pretty
> awful. Hopefully this will encourage CPU vendors to add their CPU IDs
> to the list.

Hmm. We shouldn't have to guess here as the firmware mitigation is
discoverable. So if it's unavailable and we're running an a CPU which
needs it, then we're vulnerable.

Will

