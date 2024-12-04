Return-Path: <linux-arm-msm+bounces-40204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B190F9E37D5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76CA1281092
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB331AC88B;
	Wed,  4 Dec 2024 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ivCy/Ze/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DCDD63D;
	Wed,  4 Dec 2024 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733309289; cv=none; b=kuQylYjwAMsdb4qAYTUb0Q17Yryc/PrnvJnTkST3x/fK7ISR+eD1GCAXh+k5oGme1/chzEEBoUn9mQrCUpN7MUVi2ZO7r2a9l28a7JOw1EGrpf+tUwHTZK5XDbqsZND22ONfsEy+WcVbL6Khb31Ndr7M1pXO/NU+rh9cez0AXHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733309289; c=relaxed/simple;
	bh=RhyhbvWtrFu1WfWv9PS18MiKCuQ8ygSq0c0oQWbb+e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bnZjaQLxbdGrLDXnlXA9lyY9UR5EcGe1OIjw9IeQ6hrtzl7K5mvj+oB6LaoOrrylf2ZtZhyDrHrYqDU2rVdvhLjYkOPlJymGbxXWnjkF+WynawRiRK7QIyUBF78TAAY6aR9/wARRSwy6QLDvkFQAFOaIxFVpcrypBGCsnyrceBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ivCy/Ze/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48287C4CED1;
	Wed,  4 Dec 2024 10:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733309289;
	bh=RhyhbvWtrFu1WfWv9PS18MiKCuQ8ygSq0c0oQWbb+e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivCy/Ze/ggHWESdhwTKar5t8+0vD14yikx68MaBW4lAxo0UTJn927lwdRIawDDue8
	 WJuWELkHtsqA/RR6qdssrFm5ZfsoHQgzz0mr4T78GdNjkaIwQ45waiMVurIJC43xyV
	 muV/Qeb/NNKHz6uFCKV/14nbZ51MXFUw0nvwjs6GvafmnGDmjfIDB+Nj4HbF9/l94k
	 RONJwCukehI6p1gSES+VdzPcO9b7tTXu2PG+RJ7LCxeErmMBKKO3brOK60LzOBMsj/
	 x2b9U1WDK5FgLQHR7g3Ty/uYVQ2zyYtHav9AAXUkZUIgsvo/1SMIfNbCwikQdnKZzR
	 iVcPL+ZV8zhsg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tImvN-000000001I3-47HM;
	Wed, 04 Dec 2024 11:48:06 +0100
Date: Wed, 4 Dec 2024 11:48:05 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: x1e78100-t14s: Enable support
 for both Type-A USB ports
Message-ID: <Z1AzZbNc_9tTgiDs@hovoldconsulting.com>
References: <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-0-7360ed65c769@linaro.org>
 <20241202-x1e80100-qcp-t14-enable-usb-type-a-ports-v2-1-7360ed65c769@linaro.org>
 <Z03PzTsTi3EwaXcE@hovoldconsulting.com>
 <Z1AZW/ZXzCOVi1Zy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1AZW/ZXzCOVi1Zy@linaro.org>

On Wed, Dec 04, 2024 at 10:56:59AM +0200, Abel Vesa wrote:
> On 24-12-02 16:18:37, Johan Hovold wrote:
> > On Mon, Dec 02, 2024 at 11:23:17AM +0200, Abel Vesa wrote:

> > > +&i2c5 {
> > > +	clock-frequency = <400000>;
> > > +
> > > +	status = "okay";
> > > +
> > > +	eusb3_repeater: redriver@47 {
> > > +		compatible = "nxp,ptn3222";
> > > +		reg = <0x47>;
> > 
> > The driver doesn't seem to actually communicate with these devices
> > currently and the addresses you specify here do not match what the
> > schematics says.
> 
> Schematics have the addressess left shifted for the wr/rd bit.
> 
> > Have you verified that these addresses are correct?
> 
> Reading the chip id regs confirms the addresses are correct.

Thanks for confirming.

> > And last, but not least, the T14s may hard reset if you disconnect a
> > thumb drive connected to one of these ports while suspended (6.13-rc1).
> 
> Wasn't able to reproduce this issue yet. Will spend some more time on it
> in the following days.

Just triggered what appears to be a deadlock in the block layer by
disconnecting a thumb drive while suspended. Not sure if that could
have triggered the reset, but it is likely related to the lockdep splat
I mentioned below.

> > Once it survived with a lockdep splat indicating a circular locking
> > dependency. I see that on the CRD as well, so possibly not related to
> > the hard reset.
> 
> This is most definitely the same splat triggered by the repeater PHY ops
> being called from the eUSB2 PHY driver. We are already in discussion
> with Vinod on how to handle multi PHY levels in the generic framework.

No, if it was the false-positive PHY splat I would have said so. This
appears to be a new block-layer splat with 6.13-rc1. Don't see it with
6.12.

I'll send a report.

Johan

