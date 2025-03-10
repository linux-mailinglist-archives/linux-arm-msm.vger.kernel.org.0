Return-Path: <linux-arm-msm+bounces-50838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B7EA5940C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:18:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37459188296B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C6921D3E0;
	Mon, 10 Mar 2025 12:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1ci7D/E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FAD14F11E;
	Mon, 10 Mar 2025 12:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741609105; cv=none; b=LtTj7qdy2DHNDVXvEGrZyXREhCWqy3/qSQKLZSq6l5+FU0JKYtiphJTMV5CGk/kP2Rk5tavL+qkHWqdFBRYh4waNZCylX75pbuYOtNKic73qFGLw9sBm3eO+p3YMjs+J1fc9epBvxTqNdA27VEZ3TC7kKy0SYDq3BiXsElntsWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741609105; c=relaxed/simple;
	bh=Ox13EHmxTz8ZZEEIfXWSE4kfoJqgIPeuM07MzxjfvFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPH7slp6spI0qJzmCqwSfladKM52JCuyFxrO6DDJibm/cJyTqToGTmG7WCC95h3wV+zZO83XKhKIVusZ5oRO0gpK6IsIRh1QQ2b6FRP/OH9RH3sXfbOoRMfZGG/4/50UsqvrTJ96belRWRJVohQ25t5F6uTXge5HLRtcM5Im2y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1ci7D/E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C7DC4CEEA;
	Mon, 10 Mar 2025 12:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609104;
	bh=Ox13EHmxTz8ZZEEIfXWSE4kfoJqgIPeuM07MzxjfvFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F1ci7D/EJF+Tt6RhFp95mg6/iBzSc8913rXGx4pQY6vtAapJda3V/3yQZgqLO4XDS
	 5rK+LL0WHavOfDR24m5uPpzn3aXK5NsqmOFZ4pmPU0SFyifVwZL4LnEmbWQxUo2sFY
	 7OkwLXKKvyQnfrJGqGNTwwrQImSzTk0UzCw/grf08Tr5iAow5cBxRzOoaFYAo09DF8
	 UQa1lR4eV6PT7duqQL1S3/vtgtcwy2jw5OfNWtokLBliNXoeklsTJaGDBZWlQYHlCs
	 kJ5/AEiMAKlnSNZsmExDDq0qyZ+bCbz9hWHiNQjZ5M3m9xs2R3DAMWMsdF+VcAgney
	 P4rczv2ZVjSrg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1trc5L-000000002Ns-1Keq;
	Mon, 10 Mar 2025 13:18:20 +0100
Date: Mon, 10 Mar 2025 13:18:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-crd: add support for
 volume-up key
Message-ID: <Z87Yi6IQEIhqu27O@hovoldconsulting.com>
References: <20250307171036.7276-1-johan+linaro@kernel.org>
 <2aac1aff-694f-41f6-8849-f1dfe802a1f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2aac1aff-694f-41f6-8849-f1dfe802a1f4@oss.qualcomm.com>

On Sat, Mar 08, 2025 at 05:26:26PM +0100, Konrad Dybcio wrote:
> On 7.03.2025 6:10 PM, Johan Hovold wrote:
> > Add support for the keypad volume-up key on the debug extension board.
> > 
> > This is useful to have when testing PMIC interrupt handling, and the key
> > can also be used to wake up from deep suspend states (CX shutdown).
> > 
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> I'm lukewarm about this since there is no "actual" button for that.

There is certainly a physical button on the debug board. And the UEFI
firmware also supports it (e.g. it can be used in GRUB).

> Does the power button not work here?

For wake up, yes, but not for testing PMIC GPIO interrupts.

> If systemd induces a shutdown, try setting
> 
> HandlePowerKey=ignore
> 
> in /etc/systemd/logind.conf

I'm aware of that, but the volume key can be used without updating user
space (possibly also for CI testing if that signal can be controlled
remotely like the power button).

Johan

