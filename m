Return-Path: <linux-arm-msm+bounces-59183-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B01F7AC1EE0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E96F4E4F23
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 08:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB6B22B8C8;
	Fri, 23 May 2025 08:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uh5nX+iF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF208212FB7;
	Fri, 23 May 2025 08:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747989724; cv=none; b=gN0DW6pftVeMsMqZd//CP7AYk1AjXdXXa9kf0xAJrlabx5/PPsXwJF6MgPdiT0NYpv/p4jlSfVpZM+PqKmdCU1zZsAZo3UkNYsGMJMawaytKSq5ssGZyeMjfEHE+KcyeMZmStJy72FVqkxcOUVXsjNRYktOC9YkN0d4dumhnokI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747989724; c=relaxed/simple;
	bh=Ge0vUo3iweL/SBw+DVpHfGAAJGT74IYcsdhrQ6AoAiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxyM3w8KwkuT++ve6mWxRWyZVBRel5yJVi+QzVRkybxnVL/QXCICSWzzNcZfxhoEaDzOdHsGKqBTZOgxBUu0jbrfomHRwlg8hGkWPl0G1TBT6e0U1q9B+kqjnNejDiCQzJdyJhlFc5iOSXVyyHpdpl1XOjK7kuVwi9SMCPslCiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uh5nX+iF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B224AC4CEE9;
	Fri, 23 May 2025 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747989724;
	bh=Ge0vUo3iweL/SBw+DVpHfGAAJGT74IYcsdhrQ6AoAiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uh5nX+iFF8tXYLcWdaKY9DPHl8AVO2/UA8qeqouKj7CJnkR1Mw3rpwq/GkAfii9SP
	 vqvlS2K/gjAKP8xOKyAyVZFV1DIDzlNuo4yoPs0i/0cpwcHqIPRgzqLMEDJ/MXg/By
	 BFL2fO0LDayKZFB4/is+Zh85zDpOsFUZWleAXwk28dKOrm1c3F33wXNEJC3Uto+R0L
	 W4FF0Msy/4PhuoXr6r8GLv7G6E9Hkgv5UaqV9Mj1kt6VXZTiKdjO9Q1LGOFBsem+EB
	 CO9mLOag9PgLEsT8mJBdETDdNamZkUSt+nSrMyqMlG85L3gfbni8XAVRYBDDtkwkDf
	 4SyRTvEV4NqVQ==
Date: Fri, 23 May 2025 10:42:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <20250523-curvy-ubiquitous-cicada-eac1a1@kuoka>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org>
 <20250514160841.GA2427890-robh@kernel.org>
 <aCUHTJGktLFhXq4Q@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCUHTJGktLFhXq4Q@linaro.org>

On Wed, May 14, 2025 at 10:12:44PM GMT, Stephan Gerhold wrote:
> On Wed, May 14, 2025 at 11:08:41AM -0500, Rob Herring wrote:
> > On Tue, May 13, 2025 at 02:16:59PM +0100, Stephan Gerhold wrote:
> > > On Sun, May 11, 2025 at 05:48:11PM -0500, Bjorn Andersson wrote:
> > > > On Tue, May 06, 2025 at 03:10:08PM +0200, Stephan Gerhold wrote:
> > > > > APCS "global" is sort of a "miscellaneous" hardware block that combines
> > > > > multiple registers inside the application processor subsystem. Two distinct
> > > > > use cases are currently stuffed together in a single device tree node:
> > > > > 
> > > > >  - Mailbox: to communicate with other remoteprocs in the system.
> > > > >  - Clock: for controlling the CPU frequency.
> > > > > 
> > > > > These two use cases have unavoidable circular dependencies: the mailbox is
> > > > > needed as early as possible during boot to start controlling shared
> > > > > resources like clocks and power domains, while the clock controller needs
> > > > > one of these shared clocks as its parent. Currently, there is no way to
> > > > > distinguish these two use cases for generic mechanisms like fw_devlink.
> > > > > 
> > > > > This is currently blocking conversion of the deprecated custom "qcom,ipc"
> > > > > properties to the standard "mboxes", see e.g. commit d92e9ea2f0f9
> > > > > ("arm64: dts: qcom: msm8939: revert use of APCS mbox for RPM"):
> > > > >   1. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;
> > > > >   2. The clock controller inside &apcs1_mbox needs
> > > > >      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
> > > > >   3. &rpmcc is a child of remoteproc &rpm
> > > > > 
> > > > > The mailbox itself does not need any clocks and should probe early to
> > > > > unblock the rest of the boot process. The "clocks" are only needed for the
> > > > > separate clock controller. In Linux, these are already two separate drivers
> > > > > that can probe independently.
> > > > > 
> > > > 
> > > > Why does this circular dependency need to be broken in the DeviceTree
> > > > representation?
> > > > 
> > > > As you describe, the mailbox probes and register the mailbox controller
> > > > and it registers the clock controller. The mailbox device isn't affected
> > > > by the clock controller failing to find rpmcc...
> > > > 
> > > 
> > > That's right, but the problem is that the probe() function of the
> > > mailbox driver won't be called at all. The device tree *looks* like the
> > > mailbox depends on the clock, so fw_devlink tries to defer probing until
> > > the clock is probed (which won't ever happen, because the mailbox is
> > > needed to make the clock available).
> > > 
> > > I'm not sure why fw_devlink doesn't detect this cycle and tries to probe
> > > them anyway, but fact is that we need to split this up in order to avoid
> > > warnings and have the supplies/consumers set up properly. Those device
> > > links are created based on the device tree and not the drivers.
> > 
> > Does "post-init-providers" providers solve your problem?
> > 
> 
> I would expect that it does, but it feels like the wrong solution to the
> problem to me. The clock is not really a post-init provider: It's not

But the entire node (so the mbox containing clocks) is a provider. This
looks exactly like the case for post-init or do I miss here something.
First, I do not see circular dependencies in the DT.

Best regards,
Krzysztof


