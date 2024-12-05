Return-Path: <linux-arm-msm+bounces-40627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F69E6107
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 00:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41DDE188571A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 23:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E55D51B412A;
	Thu,  5 Dec 2024 23:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="strs9CvE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1D22391A4;
	Thu,  5 Dec 2024 23:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733439922; cv=none; b=Rhm8h2OdpUU2HCA/yb7fL83q99YIM7QEEaDieQCE9jjIpMQ7AkBeK2iMOUwQv+u9Z38MFQcBlyatYe8ugQrph1fvBt5UVjBoYcBW9WJ2mcREJWX5tPdBJErFg3rBJhMPC62QkZPUVZsBGes05v5Uh2ZzvNXhSZ1A3HU45bcv09A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733439922; c=relaxed/simple;
	bh=YxxvZyCyPZW1PHoEXXxQ+L2aEKSBLXubdvbpt/NIXQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=luoZxDy62X5aDr9hytHBqFPI1xub11Rsf7ScUx10iy8RmoUJTwO5JeOTlnywTM4FuD09DIOdpG8yBIU97J+J5D5k/vdoJEUvVg2kM6MjrYG43sudxwgp8UZfGToKXbYrjNAl0Yu1fxUdHzq7APCVPUBlZCLIn4tVcYWos+fjSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=strs9CvE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AEFC4CED1;
	Thu,  5 Dec 2024 23:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733439922;
	bh=YxxvZyCyPZW1PHoEXXxQ+L2aEKSBLXubdvbpt/NIXQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=strs9CvEKK3oKlvnFiZS9Mc2t/wyf5BqP6YdrO5TjkOSSnboV6Jmwu5ooi2hCLrAm
	 tSBWlivVanYFiYHBfyzvQ6ikTgFY+JRwpuz5EAzZxtYJxx6hRTtM7jeRPtQ8GWBfpJ
	 t7Vb/zUaDOxnBtubY+yUWHgUxn1BQer5MEu3WvoVJk+xMVbUWuCqJkGgE9sLyTDMx6
	 sll1SshDtEu1uiapPKqnhkmKmkZVwBXZ4/f4jqqb+dNp/0/FkjmeNPEVILHN+/zMyh
	 eHQdotfYJvg+yXC/IbHC9/2DR9ZGFHRF//UOI7g6RbO0uK+BECH1PiVJqfBMA/QXFl
	 Sy9DlXZYFxe7g==
Date: Thu, 5 Dec 2024 17:05:17 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rajendra Nayak <quic_rjendra@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 2/6] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <v7konhz4x7fzfseyeyiazcw35zqmpjb6tjv5ukdlttzs74ykgb@lpftcociq257>
References: <20241112-x1e80100-ps8830-v5-0-4ad83af4d162@linaro.org>
 <20241112-x1e80100-ps8830-v5-2-4ad83af4d162@linaro.org>
 <Z1CCVjEZMQ6hJ-wK@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1CCVjEZMQ6hJ-wK@hovoldconsulting.com>

On Wed, Dec 04, 2024 at 05:24:54PM +0100, Johan Hovold wrote:
> On Tue, Nov 12, 2024 at 07:01:11PM +0200, Abel Vesa wrote:
> > The Parade PS8830 is a USB4, DisplayPort and Thunderbolt 4 retimer,
> > controlled over I2C. It usually sits between a USB/DisplayPort PHY
> > and the Type-C connector, and provides orientation and altmode handling.
> > 
> > The boards that use this retimer are the ones featuring the Qualcomm
> > Snapdragon X Elite SoCs.
> 
> > +static int ps883x_sw_set(struct typec_switch_dev *sw,
> > +			 enum typec_orientation orientation)
> > +{
> > +	struct ps883x_retimer *retimer = typec_switch_get_drvdata(sw);
> > +	int ret = 0;
> > +
> > +	ret = typec_switch_set(retimer->typec_switch, orientation);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mutex_lock(&retimer->lock);
> > +
> > +	if (retimer->orientation != orientation) {
> > +		retimer->orientation = orientation;
> > +
> > +		ret = ps883x_set(retimer);
> > +	}
> > +
> > +	mutex_unlock(&retimer->lock);
> > +
> > +	return ret;
> > +}
> 
> This seems to indicate a bigger problem, but I see this function called
> during early resume while the i2c controller is suspended:
> 
> [   54.213900] ------------[ cut here ]------------
> [   54.213942] i2c i2c-2: Transfer while suspended
> [   54.214125] WARNING: CPU: 0 PID: 126 at drivers/i2c/i2c-core.h:56 __i2c_transfer+0x874/0x968 [i2c_core]
> ...
> [   54.214833] CPU: 0 UID: 0 PID: 126 Comm: kworker/0:2 Not tainted 6.13.0-rc1 #11
> [   54.214844] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
> [   54.214852] Workqueue: events pmic_glink_altmode_worker [pmic_glink_altmode]
> ...
> [   54.215090] Call trace:
> [   54.215097]  __i2c_transfer+0x874/0x968 [i2c_core] (P)
> [   54.215112]  __i2c_transfer+0x874/0x968 [i2c_core] (L)
> [   54.215126]  i2c_transfer+0x94/0xf0 [i2c_core]
> [   54.215140]  i2c_transfer_buffer_flags+0x5c/0x90 [i2c_core]
> [   54.215153]  regmap_i2c_write+0x20/0x58 [regmap_i2c]
> [   54.215166]  _regmap_raw_write_impl+0x740/0x894
> [   54.215184]  _regmap_bus_raw_write+0x60/0x7c
> [   54.215192]  _regmap_write+0x60/0x1b4
> [   54.215200]  regmap_write+0x4c/0x78
> [   54.215207]  ps883x_set+0xb0/0x10c [ps883x]
> [   54.215219]  ps883x_sw_set+0x74/0x98 [ps883x]
> [   54.215227]  typec_switch_set+0x58/0x90 [typec]
> [   54.215248]  pmic_glink_altmode_worker+0x3c/0x23c [pmic_glink_altmode]
> [   54.215257]  process_one_work+0x20c/0x610
> [   54.215274]  worker_thread+0x23c/0x378
> [   54.215283]  kthread+0x124/0x128
> [   54.215291]  ret_from_fork+0x10/0x20
> [   54.215303] irq event stamp: 28140
> [   54.215309] hardirqs last  enabled at (28139): [<ffffd15e3bc2a434>] __up_console_sem+0x6c/0x80
> [   54.215325] hardirqs last disabled at (28140): [<ffffd15e3c596aa4>] el1_dbg+0x24/0x8c
> [   54.215341] softirqs last  enabled at (28120): [<ffffd15e3bb9b82c>] handle_softirqs+0x4c4/0x4dc
> [   54.215355] softirqs last disabled at (27961): [<ffffd15e3bb501ec>] __do_softirq+0x14/0x20
> [   54.215363] ---[ end trace 0000000000000000 ]---
> [   54.216889] Enabling non-boot CPUs ...
> 
> This can be reproduced on the CRD (or T14s) by disconnecting, for
> example, a mass storage device while the laptop is suspended.
> 

I wonder if this is because drivers/rpmsg/qcom_glink_smem.c line 309
registers the GLINK interrupt as IRQF_NO_SUSPEND as a remnant from being
used for rpm communication...

This is no longer needed (glink/rpm code path is now different), but
iirc the cleanup got stuck in the question of dealing with wakeup
capabilities (and priorities).

Regards,
Bjorn

