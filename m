Return-Path: <linux-arm-msm+bounces-41258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC49EAE2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 11:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4992D2835F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 10:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BE8A1DC988;
	Tue, 10 Dec 2024 10:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIBPsBdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F6178F55;
	Tue, 10 Dec 2024 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733827528; cv=none; b=WcqF6B+Lwfyq7HRK3CTpI61aFmmp1ZhnaL86nbBD3oRTrHQWNj4U7JZCW0Lf7Zq3RrBqftAB+XI6umorrGZRsB+hsmx8/tyiVSrobPeMov6d1bHDzEc7R+U//hrHqoN+rimw1xKpD3vy1cZch9nmsP/I9TgvvcZBFkSwJ2bJUE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733827528; c=relaxed/simple;
	bh=l7fBF8yvaA8NA8poiu32Gw7o8kTZtL24RhNPjNqxYwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bo80v7m7r2L6R4TJjL0z8n1MVVRoZiWhafVK8AjdgkF3iGO3tKAJADjj03q4b5Nl9cKYKoz0FJ5WcY2DBjtC/aXGKubS4mswJzNxrKoRsFT76QgE9SeNgg2nc5EilSCyAXIcykRWi22ZaY33FUGnRseuBTRlt/dWZ2SYjOAYpgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIBPsBdw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B422BC4CED6;
	Tue, 10 Dec 2024 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733827527;
	bh=l7fBF8yvaA8NA8poiu32Gw7o8kTZtL24RhNPjNqxYwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KIBPsBdwLX0jx+tKoF8ZtEhhttiLaFsv4VKShxS41Ugn8o/y7pWkg7fJiff263Hw/
	 6f+FmcqsNAaOfyT8Hnz96MdBvPxZsViYtiHTwTgHeQ4vquPZCC7Tss70kW0SQJrtsA
	 sdBdsFMhr1ugWTzYCU0mCEF+GbJWUcEX3HdsZNAsTNgNknFHlV54P/Xpx5f0tj//rE
	 gR8ekN+m3XJKxeTtwfrOpjI5HgB8zrCEtLncpZiojlLrwsyiAiUk8Ck3QdAMXeRkrZ
	 M/EOV5iM90L8tj2pxRAV/2Wc7OlQXD4bk8UvqmX0iTvP9nVaOR4NlNTMh0LM5FVVUM
	 wgokuo2Is4dyw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tKxk9-000000004tl-10rO;
	Tue, 10 Dec 2024 11:45:29 +0100
Date: Tue, 10 Dec 2024 11:45:29 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: x1e80100: fix USB OTG
 regressions
Message-ID: <Z1gbyXk-SktGjL6-@hovoldconsulting.com>
References: <20241209111905.31017-1-johan+linaro@kernel.org>
 <iw2c4fceyppf2w2gueevsqsz2z7hatbqo33vufx3veatprczu5@u4k3j2igy6ee>
 <Z1cNHOqlRk2Cxwvd@hovoldconsulting.com>
 <CAA8EJppcQrJkZe1ft_PLaB1C5d6vTke6BOSDZXJuNwrxy3kJKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppcQrJkZe1ft_PLaB1C5d6vTke6BOSDZXJuNwrxy3kJKQ@mail.gmail.com>

On Mon, Dec 09, 2024 at 06:00:21PM +0200, Dmitry Baryshkov wrote:
> On Mon, 9 Dec 2024 at 17:30, Johan Hovold <johan@kernel.org> wrote:
> > On Mon, Dec 09, 2024 at 03:23:05PM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Dec 09, 2024 at 12:19:03PM +0100, Johan Hovold wrote:
> > > > A recent change enabling OTG mode on the Lenovo ThinkPad T14s USB-C
> > > > ports can break SuperSpeed device hotplugging.
> > > >
> > > > Abel noticed that the corresponding commit for the CRD also triggers a
> > > > hard reset during resume from suspend.
> > > >
> > > > With retimer (and orientation detection) support not even merged yet,
> > > > let's revert at least until we have stable host mode in mainline.
> > > >
> > > > Note that Stephan and Dmitry have already identified other problems with
> > > > the offending commits here:
> > > >
> > > >     https://lore.kernel.org/all/ZxZO6Prrm2ITUZMQ@linaro.org/
> > > >     https://lore.kernel.org/all/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef
> >
> > > > Changes in v2
> > > >  - revert also the corresponding patch for the CRD which breaks suspend
> > >
> > > As you are reverting two commits, please revert the third one too, it
> > > breaks pmic-glink.
> >
> > Can you be more specific?
> >
> > I was gonna say that pmic_glink works since hotplug and orientation
> > detection still works, but I tested now with DP altmode and that is
> > indeed broken unless I revert the third commit (f042bc234c2e ("arm64:
> > dts: qcom: x1e80100: enable OTG on USB-C controllers")).
> >
> > Was that what you had in mind? Can you explain why that breaks?
> 
> See https://linux-regtracking.leemhuis.info/regzbot/regression/lore/hw2pdof4ajadjsjrb44f2q4cz4yh5qcqz5d3l7gjt2koycqs3k@xx5xvd26uyef/
> 
> For some reason commit f042bc234c2e ("arm64: dts: qcom: x1e80100: enable
> OTG on USB-C controllers") seems to break UCSI on X1E80100 CRD:
> 
> [   34.479352] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init
> failed, stop trying

Ok, so you're referring to your UCSI report that I linked to above.

With the full series applied, I typically do *not* see the PPM init
error message, so it does not seem directly related to the regressions I
reported. DP still works even when SS hotplug does not.

With only the first patch applied, I do see the PPM init error on every
boot and DP is broken. Hotplug and orientation detection still works
though:

[   19.698560] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: PPM init failed, stop trying
[   45.100142] r8152-cfgselector 4-1: USB disconnect, device number 2
[   47.380999] usb 4-1: new SuperSpeed USB device number 3 using xhci-hcd
[   47.549862] r8152-cfgselector 4-1: reset SuperSpeed USB device number 3 using xhci-hcd
[   47.630710] r8152 4-1:1.0 eth0: v1.12.13
[   50.591050] r8152 4-1:1.0 eth0: carrier on
[   50.892296] r8152-cfgselector 4-1: USB disconnect, device number 3
[   55.517111] usb 4-1: new SuperSpeed USB device number 4 using xhci-hcd
[   55.694021] r8152-cfgselector 4-1: reset SuperSpeed USB device number 4 using xhci-hcd

> > I'll respin with a v3, but please answer the above first.

I'll revert the first patch as well.

Johan

