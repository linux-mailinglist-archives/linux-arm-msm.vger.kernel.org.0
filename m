Return-Path: <linux-arm-msm+bounces-2142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC777FA6BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 17:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6C9EB2102A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 16:46:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1783D1A73E;
	Mon, 27 Nov 2023 16:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wwin34v/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D237155;
	Mon, 27 Nov 2023 16:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3125C433C8;
	Mon, 27 Nov 2023 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701103600;
	bh=mLe0gFKTqc2ujYOMWLzEWOwtQZ7yEtsKOX/Y3ZtEMag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Wwin34v/rl5inaqew20VFCHFgxSa6Qt9c8J8qo0GJjHmEnoW5QaxK4lVbkHvWbcgz
	 fu8MIvmt8oWoJDDn6vj0EmPXWzL3JiN3lxC1i3Ny98TsmLDOSRFujU3ArdsZcL9z2d
	 jDYWBRglHz+hqXxgdXEAljEbc3M3GpYGSO02/sw08F1Pu/URQ699q3Z3PRa+p4U+J6
	 JIk8OliHVqMQ/NxgKNLxBGv2cRXM4Cj1sru2SYGXPR05xu8ZMKPzMJAgZ3/9XZGfJA
	 DEPLk8ONqHa3OZo4aFMU7ZgPipPEZOfNynOjDQE6iQnoZcwAcTkYDXvE5pG3cQkRuw
	 WDEhCsYD+mTjA==
Date: Mon, 27 Nov 2023 08:46:39 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, loic.poulain@linaro.org
Subject: Re: [PATCH v2 0/2] Add MHI Endpoint network driver
Message-ID: <20231127084639.6be47207@kernel.org>
In-Reply-To: <20231127060439.GA2505@thinkpad>
References: <20230607152427.108607-1-manivannan.sadhasivam@linaro.org>
	<20230607094922.43106896@kernel.org>
	<20230607171153.GA109456@thinkpad>
	<20230607104350.03a51711@kernel.org>
	<20230608123720.GC5672@thinkpad>
	<20231117070602.GA10361@thinkpad>
	<20231117162638.7cdb3e7d@kernel.org>
	<20231127060439.GA2505@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Nov 2023 11:34:39 +0530 Manivannan Sadhasivam wrote:
> I think you made up your mind that this driver is exposing the network interface
> to the firmware on the device. I ought to clearify that the device running this
> driver doesn't necessarily be a modem but a PCIe endpoint instance that uses the
> netdev exposed by this driver to share data connectivity with another device.

Doesn't matter how many legit use cases you can come up with.
Using netdev as a device comm channel is something I am
fundamentally opposed to.

> This concept is not new and being supported by other protocols such as Virtio
> etc...

Yes. Use virtio, please.

