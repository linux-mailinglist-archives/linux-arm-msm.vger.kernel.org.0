Return-Path: <linux-arm-msm+bounces-25171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FEE926328
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 16:17:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E869C28D6CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1156F18410F;
	Wed,  3 Jul 2024 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lav3DobJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BD61836F0;
	Wed,  3 Jul 2024 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720016015; cv=none; b=ggge3CXFVSpYzPS4TR/dVVf8CJCVQ59/r3yQuA24T0SY2rgmqeBiQHN65BSQ4rJpAGOO/7eiHgZmVWXvTKtfBDw975xaDUoV3rxaytY3reSrH7GDSg3q2NYTbj/gWuh/JF/QHxFfSGFuYZbE7vMJ4AMtCUX2luCBsxylCYecl00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720016015; c=relaxed/simple;
	bh=m5kRBzNvuVQihwlIdSe2O1KJm1VxODSBS7k4s/7Re+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuH+xPUBwWHKX7l4iAIDFkw5EyETqnFLwLLwE0lstYcbW+OKZHbtb1jU0XybYmLOAheROPZaBORp4rOY4a58eRxGZHs23eWyyxyc7jHRsTCKH8ViEZCqIi4YCkg3gq89DvkjUJoZW2+3wBKhn+0YqdfwGrEU8OGJZ9fivKjRik0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lav3DobJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48132C2BD10;
	Wed,  3 Jul 2024 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720016015;
	bh=m5kRBzNvuVQihwlIdSe2O1KJm1VxODSBS7k4s/7Re+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lav3DobJskVXAYLQquBqUn2oQCSKfgSGL97d3UEWNOcpRuVRYiT+uLRYp6jmuE8gN
	 16hSacg1Cr9/RzQ7TZtzaORClSB6aPg6okLcl6jn540eNJxdBowyEPcNU3tPZrhZL7
	 gZ/nSFcmu7F2j1DXJrap4vPcgKxxONponmTioObP2WsOKpEfIMBzdQN2lNttLxEA0Y
	 iovrtHBLITYdQrHayp0ivA4PDx5OneWh7r+O3Bia3GmRFZX83RCRfLMJYKC/PeeHn/
	 m/jOJifzciapDlI7BczP+yCfTxWkbJSU2awJwsDZH6SQhwnhx2rBMOoiVlSKvaxQGo
	 EpCqppXDuVLBg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sP0jk-0000000050s-0qlf;
	Wed, 03 Jul 2024 16:13:32 +0200
Date: Wed, 3 Jul 2024 16:13:32 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] serial: qcom-geni: fix lockups
Message-ID: <ZoVcjP3BLcqU05D4@hovoldconsulting.com>
References: <20240624133135.7445-1-johan+linaro@kernel.org>
 <2024070326-stability-glamorous-fcc1@gregkh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024070326-stability-glamorous-fcc1@gregkh>

On Wed, Jul 03, 2024 at 04:09:22PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jun 24, 2024 at 03:31:32PM +0200, Johan Hovold wrote:
> > Since 6.10-rc1, Qualcomm machines with a serial port can easily lock up
> > hard, for example, when stopping a getty on reboot.
> > 
> > The first patch in this series fixes this severe regression by restoring
> > the pre-6.10-rc1 behaviour of printing additional characters when
> > flushing the tx buffer.
> > 
> > The second patch fixes a long-standing issue in the GENI driver which
> > can lead to a soft lock up when using software flow control and on
> > suspend.
> > 
> > The third patch, addresses the old issue with additional characters
> > being printing when flushing the buffer.
> > 
> > Note that timeouts used when clearing the tx fifo are a bit excessive
> > since I'm reusing the current qcom_geni_serial_poll_bit() helper for
> > now.
> > 
> > I think at least the first patch should be merged for rc6 while we
> > consider the best way forward to address the remaining issues.
> > 
> > Doug has posted an alternative series of fixes here that depends on
> > reworking the driver a fair bit here:
> > 
> > 	https://lore.kernel.org/lkml/20240610222515.3023730-1-dianders@chromium.org/
> 
> I'm confused.  Should I take this series, or Doug's, or Doug's single
> patch that they say resolve the immediate issue?  I can't tell what was
> agreed on here at all, so I'm going to drop all of these patches and
> wait for a resubmission that everyone agrees should be what is taken...

Yes, sorry about the confusion. I'm preparing a v2 of this series which
fixes the regression without downsides of Doug's first series or minimal
fix. I should be able to post it tomorrow.

Johan

