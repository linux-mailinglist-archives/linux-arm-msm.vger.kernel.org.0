Return-Path: <linux-arm-msm+bounces-61401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9065EADAB3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 10:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 543573AC583
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 08:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1D626C3B9;
	Mon, 16 Jun 2025 08:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QM/xGn7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E749C2CA6;
	Mon, 16 Jun 2025 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750064254; cv=none; b=Vgi6lyZZrtIji5hy8lLvtT1elqwYqTy1LBNg/q7DS7s3KlHaEI7B0W7eF8hMXjrxUNegOdqcJjfmui6kqJc0FggiS4lhfsccznO5Wi2xOsKvO17y1JhAs2r0nPU+qFyO8U7OF8eKjh6KnLUaY/dEcNGhBRySzGs+SEW0oEBZS+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750064254; c=relaxed/simple;
	bh=qnNf3fYIw3hmwU/97pa+2Ki60fD4diuhaBHLweuaEm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/j+tlo9OTtMqq9zZaN8jnNt8hRgbT7rrExNlbNYi7BstwngK41Xh496yGVZ5dIJqroH07gVxOQMaK++dHigDd3BLV+GGo19gbj882FP7vNkNhUzkSPS7uR7EULFTfw3inFd3v7chngk4m3SfIqWhBx3FPBbxNWzS/Wpd12mAds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QM/xGn7C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81034C4CEEE;
	Mon, 16 Jun 2025 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750064253;
	bh=qnNf3fYIw3hmwU/97pa+2Ki60fD4diuhaBHLweuaEm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QM/xGn7CC+sFWc+9n8sXAve4bTiQGDieRIojRLHT9xm/RL2sytvsVxDLLe0GOuFDu
	 r6zHcpf7BkgUi3ZaAWJE9hfpegYMirSFqWLld0SB5iQqpqezGfSn3EibKrPjevgIjx
	 E7ZD/Pj0upkB89FnlJD7EdZ8mwUXMzl6OHt8X1ZZ8HyYNV8XzjlZt0i8S4rAzhUYRI
	 mRFuGxDDtRhqePajtX7PR6TXc2Cc5M0yYb3Gs05PtL5VGqTnyKoErAj212oz3wHViO
	 Gh9d+N/2TIwW8jKOSuW3TjCKliDqWKHAkqxoXhhoo0C3lKLD5AO8P7e9XWSuzW+UAn
	 bDEOYzj2QKXgg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uR5ek-0000000058L-1DBy;
	Mon, 16 Jun 2025 10:57:30 +0200
Date: Mon, 16 Jun 2025 10:57:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2] dt: arm64: qcom: sc8280xp-x13s: amend usb0-sbu-mux
 enable gpio
Message-ID: <aE_cejDMmmU48jMp@hovoldconsulting.com>
References: <20250610-x13s-usb0-mux-v2-1-598454e6ad64@oldschoolsolutions.biz>
 <aEffYQND8eUgJbua@hovoldconsulting.com>
 <64d963bd-b38c-4f14-bb1d-f7e89dad999a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64d963bd-b38c-4f14-bb1d-f7e89dad999a@oldschoolsolutions.biz>

On Wed, Jun 11, 2025 at 09:25:20PM +0200, Jens Glathe wrote:
> 
> On 6/10/25 09:31, Johan Hovold wrote:
> > On Tue, Jun 10, 2025 at 07:04:46AM +0200, Jens Glathe via B4 Relay wrote:
> > DP alt mode works on both ports of the X13s and "resulted in
> > gpio165" makes little sense so this commit message would need to be
> > extended.
> 
> Well, that was the problem. It didn't on USB0. without and with the 4 
> lanes patch.
> 
> Observed on Windows Dev Kit 2023 and X13s, what prompted me to look deeper.
> 
> > GPIO 101 *is* the OE_N pin, while GPIO 165 is not even connected
> > according to the schematics. The mux may still work after this change,
> > but you'd be relying on it having been enabled by the boot firmware.
> >
> Schematics trump any other data, of course. After a lot of tests and 
> some wild
> results I could narrow it down to the display I used for testing, iiyama 
> XUB2792QSN.
> It works with HDMI adapters on ~all other displays I have - with and 
> without any
> 4-lanes, lttpr patches. And the original GPIO. The issue with the 
> display appears to
> be something linked to how negotiation is done by it on that specific port.
> 
> Do I need to do anything since its already NAK?

No, this patch should not be picked up now.

But you may want to revisit the other related patches for other boards
that you sent in case they too are based on some misunderstanding.

Johan

