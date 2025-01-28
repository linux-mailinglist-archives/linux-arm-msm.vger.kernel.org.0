Return-Path: <linux-arm-msm+bounces-46406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFC5A20E3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 17:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA58161EF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 16:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34BC1D5AAD;
	Tue, 28 Jan 2025 16:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+qjE8gX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75CF1A8F79;
	Tue, 28 Jan 2025 16:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738080975; cv=none; b=KsM5oqSz4u2r88Rl2kP8BOXJ/eRBC9nsD9Kj8EqB7edqxlpwrzwB85pHncJ9UuXrsCgsaFs+wHYPu8EjFO+0hJ3i5SLIq9IzWkX6r7sgUEPYJl84FOO7sBz2FJXfWMO+hl+EwKD0DFlYDrl3B76ZwEHS8iVJ178XDTvlyuyOegE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738080975; c=relaxed/simple;
	bh=QOM4i6GUL2MHb3m5mTtV7vnp81GN9S+tKlZ3rMO9zyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Sr/Tc995b/F2PU4LNNlSx5ppEB8Lxd5BCZ67a6v3iDTjUcK0loIHFF9snsHWE0kqvnqO39E6euSEaSD9MUsmP4glmeOpjRnjZtC9VU5GuHLVBXHnKmNztBmKTpLBkB17AY7oGMMEVtHe5FDO1mVtcCTxQLC899Ptg0/daD0ixHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+qjE8gX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF5B7C4CED3;
	Tue, 28 Jan 2025 16:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738080974;
	bh=QOM4i6GUL2MHb3m5mTtV7vnp81GN9S+tKlZ3rMO9zyM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=r+qjE8gXRl3vJybXHZ3oebEVfKiqPvXpTw1Rn+rblFqaZzvGZAoTgzBNjkEG7gO8V
	 Rts+FXz7amXzzaiklWOU6oHHOvbC6CjS9VzJK0kRhhgwl8xqZPTxTNhBwr44VtDK91
	 mlioLj4hrQtSqHfySsF5y6bwV5LCfGoOaroA39wRdAu1VN/ZBdA2B6HV/JnwLmpp46
	 jBTHJ3YqgGN18dcZHZ4/AThdr/LpWtaX0Rg67zmY6M++FAsZ5cYPw3t4lbb5oQwyko
	 Rnm8CZLziGlprvwDycbkxPUa+zMBUw9ClxH2yKl1dNYAWScSmDDXYIRI7WKLgVttYM
	 CATboix/QzJ9Q==
Date: Tue, 28 Jan 2025 10:16:12 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH v2 01/21] arm64: dts: qcom: sm8250: Add PCIe bridge node
Message-ID: <20250128161612.GA319610@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128134514.u7mgxzwxqohzy5oj@thinkpad>

On Tue, Jan 28, 2025 at 07:15:14PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Jan 21, 2025 at 05:11:31PM -0600, Bjorn Helgaas wrote:
> ...

> > Let me back up; I don't think we're understanding each other.  This
> > DT:
> > 
> >   pcie@0 {
> >     bus-range = <0x01 0xff>;
> > 
> >     &pcieport0 {
> >       wifi@0 {
> > 	reg = <0x10000 0x0 0x0 0x0 0x0>;
> > 
> > says that wifi@0 is at 01:00.0, which is only true if the pcie@0
> > secondary bus number is 01.  The power-up default is 00, so it's
> > only 01 if either firmware or Linux has programmed it that way.
> > 
> > I claim this DT assumes the pcie@0 secondary bus number is
> > programmed either by firmware or Linux.  This makes me a bit
> > nervous because AFAIK there's nothing that guarantees Linux would
> > choose bus 01.
> 
> Why do you think so? PCI devices are scanned in a depth-first
> manner, so the bus number should match the DT order. Like, while
> scanning the bus under pcie@0, it should use 01 as the secondary bus
> number as it is going to be the first bus after the root bus. I
> don't know how linux or any other OS would end up using a different
> bus number.

In this case of the first bridge on the root bus, it's very likely
that the secondary bus will be 01.

If there are more bridges, it's dangerous to make assumptions about
their secondary bus numbers because those bus numbers depend on what
hierarchies have already been enumerated and any additional space
assigned in anticipation of hotplug.

I don't know of any spec that requires the OS to assign bus numbers in
a certain way, and it feels kind of subtle if this kind of DT
description is only reliable for things below the first bridge on a
root bus.

Bjorn

