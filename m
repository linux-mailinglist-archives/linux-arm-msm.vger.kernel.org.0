Return-Path: <linux-arm-msm+bounces-15832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE9892C17
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 17:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE1301C211E0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Mar 2024 16:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5E5EAC6;
	Sat, 30 Mar 2024 16:49:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [5.144.164.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB94D1E894
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Mar 2024 16:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711817349; cv=none; b=gR4d5GIo2KMNVdT/GT7cPTHymcL5sL45Dk8L3afjUkQpCAEVVJW/KrWjRVtv0n3RdtKQO8u0RMMs8tANzZr3mcWpLVHZ/qLcSqUp1RoDC4sN7EX3vpLhk+2mdUHLrwxnrCeRqoO+aPnPx3T80RwrjH8qLUTGtJiMnrT5kVpVv6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711817349; c=relaxed/simple;
	bh=zYTKp1q7DBkIxbIabWFoXnC+vfl7vFg1O+4gQgX4zTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tTDDMDNsIwNpBpO4Pmu0CUK6CG9xqILpgXxaJNOISN5lq6Kh5K4KCYk58AzhSYqqKX0RbMl56oiZZDXUiYVQ89OT9JYPA4vW8E1QRRcSL1r8XfDMRraAe1rJElbShp8ZxwxInY4DTOUjeWQImAAsdI88HaEFq7q3yHU41Z+0MAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r1.th.seeweb.it (Postfix) with ESMTPSA id E863020192;
	Sat, 30 Mar 2024 17:49:01 +0100 (CET)
Date: Sat, 30 Mar 2024 17:49:00 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dpu: fix vblank IRQ handling for command panels
Message-ID: <mxwrvnqth5f2vd4m55ryzqgyj7brykiqynzldelanxkuj2zny3@4pqi6p57c2q2>
References: <20240330-dpu-fix-irqs-v1-1-39b8d4e4e918@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240330-dpu-fix-irqs-v1-1-39b8d4e4e918@linaro.org>

On 2024-03-30 05:52:29, Dmitry Baryshkov wrote:
> In case of CMD DSI panels, the vblank IRQ can be used outside of
> irq_enable/irq_disable pair. This results in the following kind of

Can you clarify when exactly that is?  Is it via ops.control_vblank_irq in
dpu_encoder_toggle_vblank_for_crtc()?

> messages. Move assignment of IRQ indices to atomic_enable /
> atomic_disable callbacks.
> 
> [dpu error]invalid IRQ=[134217727, 31]
> [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
> [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0

You are right that such messages are common, both at random but also seemingly
around toggling the `ACTIVE` property on the CRTC:

	[   45.878300] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_disable
	[   45.909941] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_unprepare
	[   46.093234] [drm:dpu_encoder_helper_wait_for_irq] *ERROR* encoder is disabled id=31, callback=dpu_encoder_phys_cmd_ctl_start_irq, IRQ=[134217727, 31]
	[   46.130421] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_prepare
	[   46.340457] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_enable
	[   65.520323] [dpu error]invalid IRQ=[134217727, 31] irq_cb:dpu_encoder_phys_cmd_te_rd_ptr_irq
	[   65.520463] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
	[   65.630199] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0
	[  166.576465] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_disable
	[  166.609674] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_unprepare
	[  166.781967] [drm:dpu_encoder_helper_wait_for_irq] *ERROR* encoder is disabled id=31, callback=dpu_encoder_phys_cmd_ctl_start_irq, IRQ=[134217727, 31]
	[  166.829805] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_prepare
	[  167.040476] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_enable
	[  337.449827] [dpu error]invalid IRQ=[134217727, 31] irq_cb:dpu_encoder_phys_cmd_te_rd_ptr_irq
	[  337.450434] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
	[  337.569526] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0
	[  354.980357] [dpu error]invalid IRQ=[134217727, 31] irq_cb:dpu_encoder_phys_cmd_te_rd_ptr_irq
	[  354.980495] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable true/0
	[  355.090460] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/0

Unfortunately with this patch, turning the CRTC off via ./modetest -M msm -a
-w 81:ACTIVE:0 immediately triggers a bunch of WARNs (note that the CRTC turns
on immediately again when the command returns, that's probably the framebuffer
console taking over again).  Running it a few times in succession this may or
may not happen, or reboot the phone (Xperia Griffin) entirely:

	[   23.423930] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_disable
	[   23.461013] [dpu error]invalid IRQ=[134217727, 31]
	[   23.461144] [dpu error]invalid IRQ=[134217727, 31]
	[   23.461208] [drm:dpu_encoder_phys_cmd_control_vblank_irq] *ERROR* vblank irq err id:31 pp:0 ret:-22, enable false/1
	[   23.461340] [dpu error]invalid IRQ=[134217727, 31]
	[   23.461406] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_unprepare
	[   23.641721] [drm:dpu_encoder_helper_wait_for_irq] *ERROR* encoder is disabled id=31, callback=dpu_encoder_phys_cmd_ctl_start_irq, IRQ=[134217727, 31]
	[   23.679938] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_prepare
	[   23.900465] ------------[ cut here ]------------
	[   23.900813] WARNING: CPU: 1 PID: 747 at drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:545 dpu_core_irq_register_callback+0x1b4/0x244
	[   23.901450] Modules linked in:
	[   23.901814] CPU: 1 PID: 747 Comm: modetest Tainted: G     U             6.9.0-rc1-next-20240328-SoMainline-02555-g27abbea53b6b #19
	[   23.902402] Hardware name: Sony Xperia 1 (DT)
	[   23.902674] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[   23.903133] pc : dpu_core_irq_register_callback+0x1b4/0x244
	[   23.903455] lr : dpu_encoder_phys_cmd_irq_enable+0x30/0x8c
	[   23.903880] sp : ffff800086833930
	[   23.904123] x29: ffff800086833930 x28: 0000000000000001 x27: ffff0273834522d0
	[   23.904604] x26: ffffd46ebdb5edc8 x25: ffffd46ebe0f1228 x24: ffff02738106b280
	[   23.904973] x23: ffff027383452000 x22: ffffd46ebd086290 x21: 0000000000000000
	[   23.905452] x20: ffff027382712080 x19: 0000000000000008 x18: ffff8000840550d0
	[   23.905820] x17: 000000040044ffff x16: 005000f2b5503510 x15: 00000000000006ce
	[   23.906300] x14: 0000000000000f00 x13: 0000000000000f00 x12: 0000000000000f00
	[   23.906778] x11: 0000000000000040 x10: ffffd46ebe853258 x9 : ffffd46ebe853250
	[   23.907146] x8 : ffffd46ebec30000 x7 : 0000000000000000 x6 : 0000000000000000
	[   23.907621] x5 : 0000000000000000 x4 : ffff027384eac080 x3 : ffff027381a1a080
	[   23.908099] x2 : 0000000000000001 x1 : ffff027384eac140 x0 : ffffd46ebd086290
	[   23.908467] Call trace:
	[   23.908688]  dpu_core_irq_register_callback+0x1b4/0x244
	[   23.909113]  dpu_encoder_phys_cmd_irq_enable+0x30/0x8c
	[   23.909417]  _dpu_encoder_irq_enable+0x58/0xa4
	[   23.909814]  dpu_encoder_resource_control+0x1e8/0x498
	[   23.910116]  dpu_encoder_virt_atomic_enable+0x9c/0x15c
	[   23.910531]  drm_atomic_helper_commit_modeset_enables+0x180/0x26c
	[   23.910871]  msm_atomic_commit_tail+0x1a4/0x510
	[   23.911277]  commit_tail+0xa8/0x19c
	[   23.911544]  drm_atomic_helper_commit+0x188/0x1a0
	[   23.911842]  drm_atomic_commit+0xb4/0xf0
	[   23.912226]  drm_client_modeset_commit_atomic+0x1fc/0x268
	[   23.912540]  drm_client_modeset_commit_locked+0x60/0x178
	[   23.912963]  drm_client_modeset_commit+0x30/0x5c
	[   23.913256]  drm_fb_helper_lastclose+0x64/0xb0
	[   23.913542]  msm_fbdev_client_restore+0x18/0x2c
	[   23.913948]  drm_client_dev_restore+0x8c/0xec
	[   23.914233]  drm_lastclose+0x68/0xac
	[   23.914499]  drm_release+0x128/0x15c
	[   23.914765]  __fput+0x7c/0x2cc
	[   23.915017]  __fput_sync+0x54/0x64
	[   23.915272]  __arm64_sys_close+0x3c/0x84
	[   23.915661]  invoke_syscall+0x4c/0x11c
	[   23.915932]  el0_svc_common.constprop.0+0x44/0xec
	[   23.916230]  do_el0_svc+0x20/0x30
	[   23.916600]  el0_svc+0x38/0xe4
	[   23.916854]  el0t_64_sync_handler+0x128/0x134
	[   23.917139]  el0t_64_sync+0x198/0x19c
	[   23.917515] ---[ end trace 0000000000000000 ]---
	[   23.918007] ------------[ cut here ]------------
	[   23.918324] WARNING: CPU: 1 PID: 747 at drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:545 dpu_core_irq_register_callback+0x1b4/0x244
	[   23.918720] Modules linked in:
	[   23.918878] CPU: 1 PID: 747 Comm: modetest Tainted: G     U  W          6.9.0-rc1-next-20240328-SoMainline-02555-g27abbea53b6b #19
	[   23.919248] Hardware name: Sony Xperia 1 (DT)
	[   23.919424] pstate: 804000c5 (Nzcv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	[   23.919725] pc : dpu_core_irq_register_callback+0x1b4/0x244
	[   23.919934] lr : dpu_encoder_phys_cmd_irq_enable+0x78/0x8c
	[   23.920214] sp : ffff800086833930
	[   23.920373] x29: ffff800086833930 x28: 0000000000000001 x27: ffff0273834522d0
	[   23.920686] x26: ffffd46ebdb5edc8 x25: ffffd46ebe0f1228 x24: ffff02738106b280
	[   23.920922] x23: ffff027383452000 x22: ffffd46ebd086020 x21: 0000000000000000
	[   23.921237] x20: ffff027382712080 x19: 0000000000000029 x18: ffff8000840550d0
	[   23.921545] x17: 000000040044ffff x16: 005000f2b5503510 x15: 00000000000006ce
	[   23.921780] x14: 0000000000000f00 x13: 0000000000000f00 x12: 0000000000000f00
	[   23.922092] x11: 0000000000000040 x10: ffffd46ebe853258 x9 : ffffd46ebe853250
	[   23.922405] x8 : ffffd46ebec30000 x7 : 0000000000000000 x6 : 0000000000000001
	[   23.922640] x5 : ffffd46ebe0878d8 x4 : ffff027384eac080 x3 : ffff027381a1a080
	[   23.922953] x2 : 0000000000000001 x1 : ffff027384eac458 x0 : ffffd46ebd086020
	[   23.923266] Call trace:
	[   23.923411]  dpu_core_irq_register_callback+0x1b4/0x244
	[   23.923616]  dpu_encoder_phys_cmd_irq_enable+0x78/0x8c
	[   23.923893]  _dpu_encoder_irq_enable+0x58/0xa4
	[   23.924078]  dpu_encoder_resource_control+0x1e8/0x498
	[   23.924273]  dpu_encoder_virt_atomic_enable+0x9c/0x15c
	[   23.924547]  drm_atomic_helper_commit_modeset_enables+0x180/0x26c
	[   23.924763]  msm_atomic_commit_tail+0x1a4/0x510
	[   23.925030]  commit_tail+0xa8/0x19c
	[   23.925205]  drm_atomic_helper_commit+0x188/0x1a0
	[   23.925477]  drm_atomic_commit+0xb4/0xf0
	[   23.925653]  drm_client_modeset_commit_atomic+0x1fc/0x268
	[   23.925856]  drm_client_modeset_commit_locked+0x60/0x178
	[   23.926136]  drm_client_modeset_commit+0x30/0x5c
	[   23.926325]  drm_fb_helper_lastclose+0x64/0xb0
	[   23.926585]  msm_fbdev_client_restore+0x18/0x2c
	[   23.926771]  drm_client_dev_restore+0x8c/0xec
	[   23.926956]  drm_lastclose+0x68/0xac
	[   23.927206]  drm_release+0x128/0x15c
	[   23.927379]  __fput+0x7c/0x2cc
	[   23.927541]  __fput_sync+0x54/0x64
	[   23.927785]  __arm64_sys_close+0x3c/0x84
	[   23.927965]  invoke_syscall+0x4c/0x11c
	[   23.928141]  el0_svc_common.constprop.0+0x44/0xec
	[   23.928411]  do_el0_svc+0x20/0x30
	[   23.928582]  el0_svc+0x38/0xe4
	[   23.928746]  el0t_64_sync_handler+0x128/0x134
	[   23.929008]  el0t_64_sync+0x198/0x19c
	[   23.929180] ---[ end trace 0000000000000000 ]---
	[   23.929429] panel-samsung-souxp ae94000.dsi.0: samsung_souxp00_enable

- Marijn

