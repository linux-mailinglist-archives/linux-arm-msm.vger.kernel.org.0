Return-Path: <linux-arm-msm+bounces-93294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBGBC4XRlWllVAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:49:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 784EB15729A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 15:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09392300CE6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 14:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E9D334C0A;
	Wed, 18 Feb 2026 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnHWOx3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474C2D8762;
	Wed, 18 Feb 2026 14:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771426178; cv=none; b=cmjfpVq/AwtfREzo9TaHAW2H5gDXBUZiM33a2xpiBhTew39RvshzcthKROPhVOy6FSgKrnTH1tXWruzozUM1HOb/eaVK1kMJCGX4etZ7cuA1Tk0KiL5ehE9iMprL41B2fZmDG7byltXlnnbC1sFi2BQ9O/8xR87x5to1Cn7sDvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771426178; c=relaxed/simple;
	bh=MqCsBAeeKLYKSCL8IplZux6VI1NuB4kGl35kBbiVAl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTIXzTCDGIbo/67QJvX+LZ2DHNg5tOUtYbJuSyUxwCnV1jeAArgbsE9WC/n28VYj8VWSyZu3pdafU3Kcp4w4KtuCgOwxROExAPawpa20ouyF7VaOGCyqUjS+wIDvVCKLGjjWpS64K8deZr23SrIYpFSCtpgeMuJkKPcE3UwjOxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnHWOx3K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F198C116D0;
	Wed, 18 Feb 2026 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771426177;
	bh=MqCsBAeeKLYKSCL8IplZux6VI1NuB4kGl35kBbiVAl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gnHWOx3K1WCN5jacfryWt6ZFrfRiSy3MK2GQ6P+xBX/TNtUkhEExGfVA+HBD1FTih
	 TQkHj+/UuthLrMOFiXYH9AnrCOXd66UTPmeWoPPYt8wx8ZfZSqmNYz9TXkll/UxpY1
	 qhAEoVq5RRRqx8N96k9IjVNGcFxgILXb46GJR05Qof6h26C/cWNHkPpozkmAyrQv0M
	 Gbh4vJm3xkrJWdEr1FIsFON7zyol4N5oBymL4YNm0yevTDpGoz2CXC74St3+sBtHkx
	 fElMd8RbZW2xqApF1I2GSs0t/Wf2kAu9RZ/U9Z53czstq7Qs8n5XmhJs+UZUsBs0ej
	 Zt0OHvU1T2x5g==
Date: Wed, 18 Feb 2026 08:49:34 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON
 flag for MDSS domain
Message-ID: <vbmo6qvepw5sjmtrffkdiaqulgqrhxlo3lrlzxhjz6i252efvg@uyhzdskc3jut>
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93294-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 784EB15729A
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 11:20:42PM +0200, Dmitry Baryshkov wrote:
> Since the commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds
> on until late_initcall_sync") setting of the display clocks is partially
> broken. For example, when on SDM845-HDK the bootloader leaves display
> enabled, later the kernel can't set up DSI clocks, ending up with the
> broken display, blinking blue.

This describes how the problem manifest itself. Can you please document
why clocks are partially broken and how that relate to the GDSC state,
and why setting GENPD_FLAG_NO_STAY_ON solves this?

Regards,
Bjorn

> 
>  ------------[ cut here ]------------
>  disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration.
>  WARNING: CPU: 7 PID: 81 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xf0
>  Modules linked in:
>  CPU: 7 UID: 0 PID: 81 Comm: kworker/u32:3 Not tainted 6.16.0-rc2-00040-ga3f36de2f3ba #4236 PREEMPT
>  Hardware name: Qualcomm Technologies, Inc. SDM845 HDK (DT)
>  Workqueue: events_unbound deferred_probe_work_func
>  pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  pc : update_config+0xd4/0xf0
>  lr : update_config+0xd4/0xf0
>  sp : ffff800080992a30
>  x29: ffff800080992a40 x28: 0000000000000001 x27: ffff00008db49080
>  x26: ffff00008db49220 x25: 0000000000000000 x24: 0000000008d9ee20
>  x23: ffffd6f1bf1f6cd8 x22: 0000000008d9ee20 x21: ffffd6f1becadfa8
>  x20: ffffd6f1bf1f6cc0 x19: 0000000000000000 x18: fffffffffffef3f0
>  x17: 0000000000000004 x16: 0000000000000024 x15: 0000000000000005
>  x14: fffffffffffcf3ef x13: 2e6e6f6974617275 x12: 6769666e6f632073
>  x11: 7469206574616470 x10: 752074276e646964 x9 : 72756769666e6f63
>  x8 : ffff800080992790 x7 : ffff8000809928c0 x6 : ffff800080992850
>  x5 : ffff8000809927d0 x4 : ffff800080994000 x3 : 0000000000000000
>  x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000808d1b00
>  Call trace:
>   update_config+0xd4/0xf0 (P)
>   clk_rcg2_configure+0xb8/0xc0
>   clk_pixel_set_rate+0x138/0x180
>   clk_change_rate+0x124/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_core_set_rate_nolock+0x230/0x2b0
>   clk_set_rate+0x38/0x90
>   _opp_config_clk_single+0x30/0x98
>   _set_opp+0x11c/0x530
>   dev_pm_opp_set_rate+0x18c/0x280
>   dsi_link_clk_set_rate_6g+0x44/0x100
>   msm_dsi_host_power_on+0xc4/0x988
>   dsi_mgr_bridge_pre_enable+0x194/0x3e0
>   drm_atomic_bridge_call_pre_enable+0x40/0x58
>   drm_atomic_bridge_chain_pre_enable+0x50/0x130
>   drm_atomic_helper_commit_modeset_enables+0x15c/0x26c
>   msm_atomic_commit_tail+0x214/0xb18
>   commit_tail+0xa0/0x1a0
>   drm_atomic_helper_commit+0x1a8/0x1d0
>   drm_atomic_commit+0x8c/0xcc
>   drm_client_modeset_commit_atomic+0x258/0x2d0
>   drm_client_modeset_commit_locked+0x60/0x1b8
>   drm_client_modeset_commit+0x2c/0x58
>   __drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xe8
>   drm_fb_helper_set_par+0x30/0x58
>   fbcon_init+0x3cc/0x530
>   visual_init+0x8c/0xe0
>   do_bind_con_driver.isra.0+0x18c/0x320
>   do_take_over_console+0x13c/0x1d4
>   do_fbcon_takeover+0x6c/0xe0
>   fbcon_fb_registered+0x1dc/0x1e0
>   do_register_framebuffer+0x1bc/0x278
>   register_framebuffer+0x30/0x5c
>   __drm_fb_helper_initial_config_and_unlock+0x2dc/0x5a8
>   drm_fb_helper_initial_config+0x48/0x58
>   drm_fbdev_client_hotplug+0x7c/0xe0
>   drm_client_register+0x5c/0xa0
>   drm_fbdev_client_setup+0xa4/0x1c0
>   drm_client_setup+0x58/0xa0
>   msm_drm_bind+0x3b4/0x460
>   try_to_bring_up_aggregate_device+0x16c/0x1e0
>   __component_add+0xa8/0x170
>   component_add+0x14/0x20
>   dsi_dev_attach+0x20/0x38
>   dsi_host_attach+0x58/0x98
>   devm_mipi_dsi_attach+0x34/0x90
>   lt9611_attach_dsi+0x98/0x120
>   lt9611_probe+0x3f8/0x4a0
>   i2c_device_probe+0x154/0x340
>   really_probe+0xbc/0x2c0
>   __driver_probe_device+0x78/0x120
>   driver_probe_device+0x3c/0x160
>   __device_attach_driver+0xb8/0x140
>   bus_for_each_drv+0x88/0xe8
>   __device_attach+0xa0/0x198
>   device_initial_probe+0x14/0x20
>   bus_probe_device+0xb4/0xc0
>   deferred_probe_work_func+0x90/0xcc
>   process_one_work+0x214/0x64c
>   worker_thread+0x1c0/0x364
>   kthread+0x14c/0x220
>   ret_from_fork+0x10/0x20
>  irq event stamp: 110949
>  hardirqs last  enabled at (110949): [<ffffd6f1be502d78>] _raw_spin_unlock_irqrestore+0x6c/0x74
>  hardirqs last disabled at (110948): [<ffffd6f1be502268>] _raw_spin_lock_irqsave+0x84/0x88
>  softirqs last  enabled at (109450): [<ffffd6f1be1b9ff0>] release_sock+0x90/0xa4
>  softirqs last disabled at (109448): [<ffffd6f1be1b9f88>] release_sock+0x28/0xa4
>  ---[ end trace 0000000000000000 ]---
>  ------------[ cut here ]------------
>  disp_cc_mdss_pclk1_clk_src: rcg didn't update its configuration.
>  WARNING: CPU: 7 PID: 81 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xf0
>  Modules linked in:
>  CPU: 7 UID: 0 PID: 81 Comm: kworker/u32:3 Tainted: G        W           6.16.0-rc2-00040-ga3f36de2f3ba #4236 PREEMPT
>  Tainted: [W]=WARN
>  Hardware name: Qualcomm Technologies, Inc. SDM845 HDK (DT)
>  Workqueue: events_unbound deferred_probe_work_func
>  pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  pc : update_config+0xd4/0xf0
>  lr : update_config+0xd4/0xf0
>  sp : ffff800080992a30
>  x29: ffff800080992a40 x28: 0000000000000001 x27: ffff00008db49080
>  x26: ffff00008db49220 x25: 0000000000000000 x24: 0000000008d9ee20
>  x23: ffffd6f1bf1f6c48 x22: 0000000008d9ee20 x21: ffffd6f1becb1b50
>  x20: ffffd6f1bf1f6c30 x19: 0000000000000000 x18: ffffffffffff0790
>  x17: 0000000000000004 x16: 0000000000000024 x15: 0000000000000005
>  x14: fffffffffffd078f x13: 2e6e6f6974617275 x12: 6769666e6f632073
>  x11: 7469206574616470 x10: 752074276e646964 x9 : 72756769666e6f63
>  x8 : ffff800080992790 x7 : ffff8000809928c0 x6 : ffff800080992850
>  x5 : ffff8000809927d0 x4 : ffff800080994000 x3 : 0000000000000000
>  x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000808d1b00
>  Call trace:
>   update_config+0xd4/0xf0 (P)
>   clk_rcg2_configure+0xb8/0xc0
>   clk_pixel_set_rate+0x138/0x180
>   clk_change_rate+0x124/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_change_rate+0x1b4/0x620
>   clk_core_set_rate_nolock+0x230/0x2b0
>   clk_set_rate+0x38/0x90
>   _opp_config_clk_single+0x30/0x98
>   _set_opp+0x11c/0x530
>   dev_pm_opp_set_rate+0x18c/0x280
>   dsi_link_clk_set_rate_6g+0x44/0x100
>   msm_dsi_host_power_on+0xc4/0x988
>   dsi_mgr_bridge_pre_enable+0x194/0x3e0
>   drm_atomic_bridge_call_pre_enable+0x40/0x58
>   drm_atomic_bridge_chain_pre_enable+0x50/0x130
>   drm_atomic_helper_commit_modeset_enables+0x15c/0x26c
>   msm_atomic_commit_tail+0x214/0xb18
>   commit_tail+0xa0/0x1a0
>   drm_atomic_helper_commit+0x1a8/0x1d0
>   drm_atomic_commit+0x8c/0xcc
>   drm_client_modeset_commit_atomic+0x258/0x2d0
>   drm_client_modeset_commit_locked+0x60/0x1b8
>   drm_client_modeset_commit+0x2c/0x58
>   __drm_fb_helper_restore_fbdev_mode_unlocked+0xbc/0xe8
>   drm_fb_helper_set_par+0x30/0x58
>   fbcon_init+0x3cc/0x530
>   visual_init+0x8c/0xe0
>   do_bind_con_driver.isra.0+0x18c/0x320
>   do_take_over_console+0x13c/0x1d4
>   do_fbcon_takeover+0x6c/0xe0
>   fbcon_fb_registered+0x1dc/0x1e0
>   do_register_framebuffer+0x1bc/0x278
>   register_framebuffer+0x30/0x5c
>   __drm_fb_helper_initial_config_and_unlock+0x2dc/0x5a8
>   drm_fb_helper_initial_config+0x48/0x58
>   drm_fbdev_client_hotplug+0x7c/0xe0
>   drm_client_register+0x5c/0xa0
>   drm_fbdev_client_setup+0xa4/0x1c0
>   drm_client_setup+0x58/0xa0
>   msm_drm_bind+0x3b4/0x460
>   try_to_bring_up_aggregate_device+0x16c/0x1e0
>   __component_add+0xa8/0x170
>   component_add+0x14/0x20
>   dsi_dev_attach+0x20/0x38
>   dsi_host_attach+0x58/0x98
>   devm_mipi_dsi_attach+0x34/0x90
>   lt9611_attach_dsi+0x98/0x120
>   lt9611_probe+0x3f8/0x4a0
>   i2c_device_probe+0x154/0x340
>   really_probe+0xbc/0x2c0
>   __driver_probe_device+0x78/0x120
>   driver_probe_device+0x3c/0x160
>   __device_attach_driver+0xb8/0x140
>   bus_for_each_drv+0x88/0xe8
>   __device_attach+0xa0/0x198
>   device_initial_probe+0x14/0x20
>   bus_probe_device+0xb4/0xc0
>   deferred_probe_work_func+0x90/0xcc
>   process_one_work+0x214/0x64c
>   worker_thread+0x1c0/0x364
>   kthread+0x14c/0x220
>   ret_from_fork+0x10/0x20
>  irq event stamp: 110949
>  hardirqs last  enabled at (110949): [<ffffd6f1be502d78>] _raw_spin_unlock_irqrestore+0x6c/0x74
>  hardirqs last disabled at (110948): [<ffffd6f1be502268>] _raw_spin_lock_irqsave+0x84/0x88
>  softirqs last  enabled at (109450): [<ffffd6f1be1b9ff0>] release_sock+0x90/0xa4
>  softirqs last disabled at (109448): [<ffffd6f1be1b9f88>] release_sock+0x28/0xa4
>  ---[ end trace 0000000000000000 ]---
>  lt9611 3-003b: video check: hactive_a=0, hactive_b=0, vactive=0, v_total=0, h_total_sysclk=0
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:540] [dpu error]vblank timeout: 2
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  fb0: sys_imageblit: framebuffer is not in virtual address space.
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:540] [dpu error]vblank timeout: 2
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:540] [dpu error]vblank timeout: 2
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  Console: switching to colour frame buffer device 480x135
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:540] [dpu error]vblank timeout: 2
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
>  [drm:dpu_encoder_phys_vid_wait_for_commit_done:540] [dpu error]vblank timeout: 2
>  [drm:dpu_kms_wait_for_commit_done:524] [dpu error]wait for commit done returned -110
> 
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Cc: stable@vger.kernel.org
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/dispcc-sdm845.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> index 78e43f6d7502..468b30497746 100644
> --- a/drivers/clk/qcom/dispcc-sdm845.c
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -763,6 +763,7 @@ static struct gdsc mdss_gdsc = {
>  	.en_rest_wait_val = 0x5,
>  	.pd = {
>  		.name = "mdss_gdsc",
> +		.flags = GENPD_FLAG_NO_STAY_ON,
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.flags = HW_CTRL | POLL_CFG_GDSCR,
> 
> -- 
> 2.47.3
> 

