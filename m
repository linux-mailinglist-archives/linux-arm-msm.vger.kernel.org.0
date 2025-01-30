Return-Path: <linux-arm-msm+bounces-46572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDBCA22A9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 10:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E5A23A6D1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2025 09:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67900194096;
	Thu, 30 Jan 2025 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jim7rWKA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A311E4B2;
	Thu, 30 Jan 2025 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738230202; cv=none; b=qv9FAgBBKprcccFOKJD1+uWoAy5gCp+eZDHIrE8aNqObT2cpJZr24GuaJFpGO3mpmH2kN28yoTVJbXU1ipPhiksTW/JzbX2bu24UiUvEN5+NKCH7ts300IUzGn2XGdTU0c031HzfmhOxKXuJtlgK9Rmgt0KboXnK240fXjLvzDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738230202; c=relaxed/simple;
	bh=Jh8+YAuvJJIu4OyYNfZQnGuYQxDeclrUlbe6d+1dbYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=la1AgbP4lMLxJDW+SGASZabnSAD0FFCUNr5Yex6mk4nCEcldFzHzFE4g79vd8r3dZxTtndiEpT2vdu6uwsdyt9PNLPRgbMu5ZOjr0GLG+tREgKyyj+SU8TZjzc5WN2JF+QpgCmUDTzrg2oMKf6ZEL8JlDVKXIfjhHcJ40Xy7nMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jim7rWKA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDA9C4CED2;
	Thu, 30 Jan 2025 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738230201;
	bh=Jh8+YAuvJJIu4OyYNfZQnGuYQxDeclrUlbe6d+1dbYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jim7rWKAMKiD8yu6TpNhepMrk99tflrnrH4XeRZ4tiL2aZwGR4ZOkHF5w803eT8M+
	 K+f96FTkPo1KV2Fh+ZTZbs3di9lPEAQUMqEWkWy4Mt8n0mXtdWKzKb+42/IP5yR+iE
	 02hE+mzL5SfEUJNqYp4OIP6XM7bctdghIH0spYS57iwx7BTug8nSn/fZh+VPtSbWqW
	 SdUgMJlrK66DrKxVbMALTcVUG8NerN+LIOr67KHmo17X3zJ5ywkIEHYDJj1bIYf22b
	 62LsU5Cxysv1Y/EoSuI9QwdjderfQgR3Tfr3n0lKfm29a/qzRXFAYGx4jWOrXwoL07
	 sLZVhh0VA7EnA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tdR54-000000000mz-29dA;
	Thu, 30 Jan 2025 10:43:27 +0100
Date: Thu, 30 Jan 2025 10:43:26 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH RFC v2] soc: qcom: pmic_glink: Fix device access from
 worker during suspend
Message-ID: <Z5tJvgrYS5UoAHRD@hovoldconsulting.com>
References: <20250129-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v2-1-de2a3eca514e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-soc-qcom-pmic-glink-fix-device-access-on-worker-while-suspended-v2-1-de2a3eca514e@linaro.org>

On Wed, Jan 29, 2025 at 01:46:15PM +0200, Abel Vesa wrote:
> For historical reasons, the GLINK smem interrupt is registered with

Please spell out these reasons so that we can determine if they are
still valid or not.

> IRRQF_NO_SUSPEND flag set, which is the underlying problem here, since the
> incoming messages can be delivered during late suspend and early
> resume.
> 
> In this specific case, the pmic_glink_altmode_worker() currently gets
> scheduled on the system_wq which can be scheduled to run while devices
> are still suspended. This proves to be a problem when a Type-C retimer,
> switch or mux that is controlled over a bus like I2C, because the I2C
> controller is suspended.

This is not just an issue with an i2c retimer, this is a plain generic
bug in that the glink code which is calling drivers while their devices
are suspended.

> This has been proven to be the case on the X Elite boards where such
> retimers (ParadeTech PS8830) are used in order to handle Type-C
> orientation and altmode configuration. The following warning is thrown:

> The proper solution here should be to not deliver these kind of messages
> during system suspend at all, or at least make it configurable per glink
> client. But simply dropping the IRQF_NO_SUSPEND flag entirely will break
> other clients.

Which clients? Do we care enough about them to be papering over this
very real bug which can potentially crash the system (e.g. due to
unclocked register accesses)?

> The final shape of the rework of the pmic glink driver in
> order to fulfill both the filtering of the messages that need to be able
> to wake-up the system and the queueing of these messages until the system
> has properly resumed is still being discussed and it is planned as a
> future effort.
> 
> Meanwhile, the stop-gap fix here is to schedule the pmic glink altmode
> worker on the system_freezable_wq instead of the system_wq. This will
> result in the altmode worker not being scheduled to run until the
> devices are resumed first, which will give the controllers like I2C a
> chance to resume before the transfer is requested.

This is incomplete at best, even as a stop gap. I just threw a
dump_stack() in qmp_combo_typec_switch_set() and see that it is being
called four times (don't ask me why) from two different workers on
hotplug.

Even if you use the freezable workqueue for altmode notifications, you
can still end up here via the ucsi notifications, and that now also
seems to generate a warning in the PM code during resume.

[   25.684039] Call trace:
[   25.686633]  show_stack+0x18/0x24 (C)
[   25.690492]  dump_stack_lvl+0xc0/0xd0
[   25.694350]  dump_stack+0x18/0x24
[   25.697851]  qmp_combo_typec_switch_set+0x28/0x210 [phy_qcom_qmp_combo]
[   25.704764]  typec_switch_set+0x58/0x90 [typec]
[   25.709525]  ps883x_sw_set+0x2c/0x98 [ps883x]
[   25.714092]  typec_switch_set+0x58/0x90 [typec]
[   25.718861]  typec_set_orientation+0x24/0x6c [typec]
[   25.724068]  pmic_glink_ucsi_connector_status+0x5c/0x88 [ucsi_glink]
[   25.730726]  ucsi_handle_connector_change+0xc4/0x448 [typec_ucsi]
[   25.737099]  process_one_work+0x20c/0x610
[   25.741322]  worker_thread+0x23c/0x378
[   25.745274]  kthread+0x124/0x128
[   25.748680]  ret_from_fork+0x10/0x20
[   25.753631] typec port4-partner: PM: parent port4 should not be sleeping

When you first brought up the possible workaround of using a freezable
workqueue, I mistakenly thought this would apply to all glink messages
(I realise that would defeat the purpose of allowing some early
notifications).

You've also found that the glink interrupts are waking up the system
unconditionally on battery notifications, which would be yet another
reason for disabling the interrupts (or implementing some kind of
masking).

I'm leaning towards just disabling the glink interrupts during suspend,
but that depends a bit on what (historical?) functionality actually need
them.

Johan

