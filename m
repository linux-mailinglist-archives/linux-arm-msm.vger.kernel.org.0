Return-Path: <linux-arm-msm+bounces-93251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDV2BWB0lWnDRgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 09:12:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B1726153E0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 09:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E81A63006821
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Feb 2026 08:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24A43148B3;
	Wed, 18 Feb 2026 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWwSAhWd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D68287263;
	Wed, 18 Feb 2026 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402333; cv=none; b=tm3amNbQXLDRA57iciC3Cxma06eJ0Ujdvb5GoFCKj2laSQRBgn+hokANuCJu5S4n9ql8H3HGvxji7obmY0X8bP8u8A9BUhbwGUMFjfmc98G3JDSU8EqpqfvVBi2d/6Rb7fNlMemcfj2loXmW9ByWkjq5foO5NrLpxYWHRgxTn1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402333; c=relaxed/simple;
	bh=tncM6eitUJUN0H6rXBJ9YikrPEEHKB8O2kAIgl1CwKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UamfxZORcxkDo2Vn+xQGEkZQxhvKI1j+G2XJfxWi/eB+fm7EC6RC1f2FQvXJckb1nE9ssFpU2CI+yqmpnYWkfWiV8jYj0tG5aJye7eM2rS7JzKRHy0E97P+w53JOXmggPxAYGP/54MUVf6LESOxJHMyeteFFQ08b+0zKg+jHWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWwSAhWd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4527FC19421;
	Wed, 18 Feb 2026 08:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771402333;
	bh=tncM6eitUJUN0H6rXBJ9YikrPEEHKB8O2kAIgl1CwKQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cWwSAhWdBONnGX2KJrC3wmO4D5V2UcU6r1esgTl8Xec2rVcZvmUXzKI/4O6DI5BmJ
	 P7nR2gcRNkAdoZb0hYAN3aDb8Jiw9zoSs0wDzdeBMR2WrFUme0fNuJJlhROvE8J04S
	 E6J3nObpJ7RrXaEob3JzAVn3jLlzZpD1BcV6sPJSvkjZRrSGKa9GvhvBLjhhmTSYlA
	 s/9XPXKxv7tvhi8xlNVeAoGxK2H7fCFwaMdt735X3abHVXt/14BKX08+iKZ9NQEMSo
	 N/kn1zsQTa5E8Z3goI52EfgJImi4kjaVP6ZA0NixxI6WHCDBzLq86ijEePn+Exq52R
	 cb2Cm7rkbZ7Jg==
Message-ID: <0cc339f8-5f53-410e-b798-92b0fe46dc9e@kernel.org>
Date: Wed, 18 Feb 2026 09:12:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: dispcc-sdm845: set GENPD_FLAG_NO_STAY_ON
 flag for MDSS domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stable@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260217-sdm845-hdk-v1-1-866f1965fef7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93251-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B1726153E0F
X-Rspamd-Action: no action

On 17/02/2026 22:20, Dmitry Baryshkov wrote:
> Since the commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds
> on until late_initcall_sync") setting of the display clocks is partially
> broken. For example, when on SDM845-HDK the bootloader leaves display
> enabled, later the kernel can't set up DSI clocks, ending up with the
> broken display, blinking blue.
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

Please trim the context/messages - most of above is not needed

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

Nothing below makes sense either

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

And that's the same log.

Best regards,
Krzysztof

