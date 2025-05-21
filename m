Return-Path: <linux-arm-msm+bounces-58865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 353B7ABEF75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8D8993BD145
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E35423C506;
	Wed, 21 May 2025 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDZ2oNeb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDC723956E;
	Wed, 21 May 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819245; cv=none; b=HBrIxBV+4vUNXWDO8HD2G9wJDjppeJwMy/n2M8gcu/KKiQP9A9qNOSqeldVr6mKqKBOvVUhTxXv879fAQg11Tmb41LnnVsf4FV0eMu1Vf7I/d4Y2Z27uhj8RG6f4O7oGMq9dyKt0DXKhCx0aq7FsUFq7nER41x9PWEJWbFqTA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819245; c=relaxed/simple;
	bh=Ec1SR/A/c7W9CqJYy89gTyF0+TqmM03iz7rQQvPqJvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9Nyvs/KbInebr9QkOmoLenmSiXAZn8o0gtnuCYH99LDXNsBEb16/GcWjdPPSgEqHH/IQr1TGJ4s7b16we2WKule8f1OKPO0H3Wdrwhk7QolP1wrKScLml21HSUWwaY86IWgaZyZA9sQmhzefEDoDkgCwurLDG1nxnTXkUPvkCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDZ2oNeb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B920BC4CEE4;
	Wed, 21 May 2025 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747819243;
	bh=Ec1SR/A/c7W9CqJYy89gTyF0+TqmM03iz7rQQvPqJvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDZ2oNebNYdAYBjiQL9c+pYZ4rDW3dN3kdZyHlyRkulnuT2Mbg0nu0th4/ztcY3+v
	 mHMIbpqGxZbpGSWVEKnNlk8VQRcmVk3CwHviN1/Z8T8GhdGcC+W+obsHl0nYIuIqOF
	 +imjiQTnqFjYJo57PUI4PerTw3nQB7qj23uyJtJtkl6BMkX8rr+RqNZbas4jTiBt5V
	 9kitEG+uiGTxuNumjJutDENDlFmOG0qL2rfl/JFGif968N+7lJKF6+MNNYuKLJv8/D
	 I77+9rIofpBkHc5FJQtjBrmo+fZ6dtCfYDExdgQVaDdNUnIC0c//xBdFqH5YrRoRRE
	 KS/DNuOqlOabg==
Date: Wed, 21 May 2025 11:20:40 +0200
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
Message-ID: <20250521-psychedelic-cute-grouse-ee1291@kuoka>
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
> > > > > The mailbox itself does not need any clocks and should probe early to

... so probe it early.

> > > > > unblock the rest of the boot process. The "clocks" are only needed for the
> > > > > separate clock controller. In Linux, these are already two separate drivers
> > > > > that can probe independently.

They can probe later, no problem and DT does not stop that. Linux, not
DT, controls the ways of probing of devices and their children.

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
> consumed at all by the mailbox and needed immediately to initialize the
> clock controller. The real problem in my opinion is that we're
> describing two essentially distinct devices/drivers in a single device
> node, and there is no way to distinguish that.
> 
> By splitting up the two distinct components into separate device tree
> nodes, the relation between the providers/consumers is clearly
> described.

You can split devices without splitting the nodes. I do not see reason
why the DT is the problem here.

Best regards,
Krzysztof


