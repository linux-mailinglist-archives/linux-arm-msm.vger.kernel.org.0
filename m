Return-Path: <linux-arm-msm+bounces-19724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ED18C2AD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 21:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63A58B20E55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 19:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59AAC4CB4E;
	Fri, 10 May 2024 19:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B+88HWKj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B454CB28;
	Fri, 10 May 2024 19:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715371165; cv=none; b=auHJwXh9qE8X4pmBpDnYvl4I22ghF+gI5V+qvUyCJzlTRKgyK71GL2wBzKUtReD6RFVw2+NY2vITwkjaQwpeD7Y/l6+gIHgnA0FTPe0m16aZlavwGPyTpVBEuKQU4h6oZUID4TwMV2Hm3nQjAtgXXaLmvSUktJSA4wm5EN5AwWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715371165; c=relaxed/simple;
	bh=HCxYPNqMKmIC9oasAoMTLtVxY87R2ML81RDXDqCIFmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovB1TRlZYjnuIGyqmbyNRwBdUtwaFuGtnKYLwrdpdSpBdAEsFNWiKydT00iZ9oUbcutpJJBjQdkGT2n3u1NLRrIEYswmffHQrwIhG2YNW6qQkVtgjr7VUnWuK1/TF0iuLXXG3YXZ+4S1jDImEmQuOfYljEtKKfCR2jURx5wPngE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B+88HWKj; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715371160;
	bh=HCxYPNqMKmIC9oasAoMTLtVxY87R2ML81RDXDqCIFmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B+88HWKjDf+0+AUiHRWPB3h2QxenCzofYk52o/psGABx4sjTLpYq1kGyLlBYLelLb
	 0G5hLXIw/ICjmEEtJN/l5xIuGi7mkKsdCHLa97TXIoaR4XjA7pW+TBspRkD1qnEsss
	 AnZHiR7HTfbstLI9ev9zb47ZW0bSe/sbuwZSzjqyFlF2Z30xyCxKW3jbrtgBUVqyXr
	 6cZpQ4Gmy+KvwBousO1zBbD1ai3o0c3EV1PxwYWsjqFht+tZ8E6l3fDxThJmBPQwXB
	 QOqDTxHOLv3gcsziSfYnqJzO7Njzhlg+z7Oi/r04SQHa38Trp7MuK1t/qVau3DdS8R
	 +HNWVPuRmvxYA==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A2DFD3782190;
	Fri, 10 May 2024 19:59:17 +0000 (UTC)
Date: Fri, 10 May 2024 15:59:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	patches@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Laura Nao <laura.nao@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Douglas Anderson <dianders@chromium.org>,
	Taniya Das <quic_tdas@quicinc.com>
Subject: Re: [PATCH] clk: qcom: Park shared RCGs upon registration
Message-ID: <43fcbb00-bea2-469b-9942-0e66e74f65e1@notapiano>
References: <20240502224703.103150-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240502224703.103150-1-swboyd@chromium.org>

On Thu, May 02, 2024 at 03:47:02PM -0700, Stephen Boyd wrote:
> There's two problems with shared RCGs.
> 
> The first problem is that they incorrectly report the parent after
> commit 703db1f5da1e ("clk: qcom: rcg2: Cache CFG register updates for
> parked RCGs"). That's because the cached CFG register value needs to be
> populated when the clk is registered. clk_rcg2_shared_enable() writes
> the cached CFG register value 'parked_cfg'. This value is initially zero
> due to static initializers. If a driver calls clk_enable() before
> setting a rate or parent, it will set the parent to '0' which is
> (almost?) always XO, and may not reflect the parent at registration. In
> the worst case, this switches the RCG from sourcing a fast PLL to the
> slow crystal speed.
> 
> The second problem is that the force enable bit isn't cleared. The force
> enable bit is only used during parking and unparking of shared RCGs.
> Otherwise it shouldn't be set because it keeps the RCG enabled even when
> all the branches on the output of the RCG are disabled (the hardware has
> a feedback mechanism so that any child branches keep the RCG enabled
> when the branch enable bit is set). This problem wastes power if the clk
> is unused, and is harmful in the case that the clk framework disables
> the parent of the force enabled RCG. In the latter case, the GDSC the
> shared RCG is associated with will get wedged if the RCG's source clk is
> disabled and the GDSC tries to enable the RCG to do "housekeeping" while
> powering on.
> 
> Both of these problems combined with incorrect runtime PM usage in the
> display driver lead to a black screen on Qualcomm sc7180 Trogdor
> chromebooks. What happens is that the bootloader leaves the
> 'disp_cc_mdss_rot_clk' enabled and the 'disp_cc_mdss_rot_clk_src' force
> enabled and parented to 'disp_cc_pll0'. The mdss driver probes and
> runtime suspends, disabling the mdss_gdsc which uses the
> 'disp_cc_mdss_rot_clk_src' for "housekeeping". The
> 'disp_cc_mdss_rot_clk' is disabled during late init because the clk is
> unused, but the parent 'disp_cc_mdss_rot_clk_src' is still force enabled
> because the force enable bit was never cleared. Then 'disp_cc_pll0' is
> disabled because it is also unused. That's because the clk framework
> believes the parent of the RCG is XO when it isn't. A child device of
> the mdss device (e.g. DSI) runtime resumes mdss which powers on the
> mdss_gdsc. This wedges the GDSC because 'disp_cc_mdss_rot_clk_src' is
> parented to 'disp_cc_pll0' and that PLL is off. With the GDSC wedged,
> mdss_runtime_resume() tries to enable 'disp_cc_mdss_mdp_clk' but it
> can't because the GDSC has wedged all the clks associated with the GDSC
> causing clks to stay stuck off.
> 
> This leads to the following warning seen at boot and a black screen
> because the display driver fails to probe.
> 
>  disp_cc_mdss_mdp_clk status stuck at 'off'
>  WARNING: CPU: 1 PID: 81 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x114/0x168
>  Modules linked in:
>  CPU: 1 PID: 81 Comm: kworker/u16:4 Not tainted 6.7.0-g0dd3ee311255 #1 f5757d475795053fd2ad52247a070cd50dd046f2
>  Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
>  Workqueue: events_unbound deferred_probe_work_func
>  pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>  pc : clk_branch_toggle+0x114/0x168
>  lr : clk_branch_toggle+0x110/0x168
>  sp : ffffffc08084b670
>  pmr_save: 00000060
>  x29: ffffffc08084b680 x28: ffffff808006de00 x27: 0000000000000001
>  x26: ffffff8080dbd4f4 x25: 0000000000000000 x24: 0000000000000000
>  x23: 0000000000000000 x22: ffffffd838461198 x21: ffffffd838007997
>  x20: ffffffd837541d5c x19: 0000000000000001 x18: 0000000000000004
>  x17: 0000000000000000 x16: 0000000000000010 x15: ffffffd837070fac
>  x14: 0000000000000003 x13: 0000000000000004 x12: 0000000000000001
>  x11: c0000000ffffdfff x10: ffffffd838347aa0 x9 : 08dadf92e516c000
>  x8 : 08dadf92e516c000 x7 : 0000000000000000 x6 : 0000000000000027
>  x5 : ffffffd8385a61f2 x4 : 0000000000000000 x3 : ffffffc08084b398
>  x2 : ffffffc08084b3a0 x1 : 00000000ffffdfff x0 : 00000000fffffff0
>  Call trace:
>   clk_branch_toggle+0x114/0x168
>   clk_branch2_enable+0x24/0x30
>   clk_core_enable+0x5c/0x1c8
>   clk_enable+0x38/0x58
>   clk_bulk_enable+0x40/0xb0
>   mdss_runtime_resume+0x68/0x258
>   pm_generic_runtime_resume+0x30/0x44
>   __genpd_runtime_resume+0x30/0x80
>   genpd_runtime_resume+0x124/0x214
>   __rpm_callback+0x7c/0x15c
>   rpm_callback+0x30/0x88
>   rpm_resume+0x390/0x4d8
>   rpm_resume+0x43c/0x4d8
>   __pm_runtime_resume+0x54/0x98
>   __device_attach+0xe0/0x170
>   device_initial_probe+0x1c/0x28
>   bus_probe_device+0x48/0xa4
>   device_add+0x52c/0x6fc
>   mipi_dsi_device_register_full+0x104/0x1a8
>   devm_mipi_dsi_device_register_full+0x28/0x78
>   ti_sn_bridge_probe+0x1dc/0x2bc
>   auxiliary_bus_probe+0x4c/0x94
>   really_probe+0xf8/0x270
>   __driver_probe_device+0xa8/0x130
>   driver_probe_device+0x44/0x104
>   __device_attach_driver+0xa4/0xcc
>   bus_for_each_drv+0x94/0xe8
>   __device_attach+0xf8/0x170
>   device_initial_probe+0x1c/0x28
>   bus_probe_device+0x48/0xa4
>   deferred_probe_work_func+0x9c/0xd8
> 
> Fix these problems by parking shared RCGs at boot. This will properly
> initialize the parked_cfg struct member so that the parent is reported
> properly and ensure that the clk won't get stuck on or off because the
> RCG is parented to the safe source (XO).
> 
> Fixes: 703db1f5da1e ("clk: qcom: rcg2: Cache CFG register updates for parked RCGs")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Closes: https://lore.kernel.org/r/1290a5a0f7f584fcce722eeb2a1fd898.sboyd@kernel.org
> Closes: https://issuetracker.google.com/319956935
> Reported-by: Laura Nao <laura.nao@collabora.com>
> Closes: https://lore.kernel.org/r/20231218091806.7155-1-laura.nao@collabora.com
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
[..]

On the sc7180-trogdor-kingoftown and sc7180-trogdor-lazor-limozeen devices we
have in KernelCI, the issue was not only the warning, but it was also followed
by a kernel panic, which looks to be in the removal path of the msm drm driver
(I've included the trace below).

With this patch applied, those platforms no longer panic, they now boot
perfectly fine. I've tested on next-20240429 with the KernelCI config fragment
[1] applied on top of the defconfig and ran the dt kselftest to verify that no
device related to the display pipeline failed to probe.

Feel free to add

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

[1] https://github.com/kernelci/kernelci-core/blob/a4e885cc673cfbef52f3e664d498af8d53b5abc0/config/core/build-configs.yaml#L159


[   11.298220] disp_cc_mdss_mdp_clk status stuck at 'off'
[   11.298282] WARNING: CPU: 4 PID: 190 at drivers/clk/qcom/clk-branch.c:87 clk_branch_wait+0x144/0x15c
[   11.312967] Modules linked in: venus_dec venus_enc videobuf2_dma_contig cbmem hci_uart qcom_spmi_adc5 qcom_spmi_adc_tm5 ath10k_snoc btqca qcom_vadc_common venus_core uvcvideo uvc btrtl ath10k_core videobuf2_vmalloc v4l2_mem2mem videobuf2_memops cros_ec_lid_angle btbcm videobuf2_v4l2 crct10dif_ce ath cros_ec_sensors_core bluetooth coresight_stm mac80211 qcom_stats stm_core videodev industrialio_triggered_buffer kfifo_buf cros_ec_chardev videobuf2_common onboard_usb_dev sbs_battery libarc4 ecdh_generic elan_i2c elants_i2c panel_edp(+) ecc mc cfg80211 icc_bwmon coresight_etm4x rfkill coresight_tmc coresight_funnel coresight_replicator ramoops coreboot_table coresight reed_solomon pwm_bl backlight
[   11.376284] CPU: 4 PID: 190 Comm: (udev-worker) Not tainted 6.9.0-rc6-next-20240429-00004-g194b5bfc4dd4-dirty #374
[   11.386913] Hardware name: Google Kingoftown (DT)
[   11.391760] pstate: 604000c9 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   11.398926] pc : clk_branch_wait+0x144/0x15c
[   11.403328] lr : clk_branch_wait+0x144/0x15c
[   11.407731] sp : ffff800081fdb0a0
[   11.411144] x29: ffff800081fdb0a0 x28: ffff800081fdbc70 x27: 0000000000000000
[   11.418496] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[   11.425844] x23: ffffc652b6b1b138 x22: 0000000000000001 x21: ffffc652b537d4ac
[   11.433195] x20: 0000000000000000 x19: ffffc652b7a1c1f8 x18: 0000000000000038
[   11.440544] x17: 000000040044ffff x16: 0000000000000000 x15: fffffffffffe9b90
[   11.447894] x14: ffffc652b7802208 x13: 00000000000006d5 x12: 0000000000000247
[   11.452662] usb 2-1.3: new SuperSpeed USB device number 4 using xhci-hcd
[   11.455235] x11: fffffffffffe9b90 x10: fffffffffffe9b58 x9 : 00000000fffff247
[   11.469464] x8 : ffffc652b7802208 x7 : ffffc652b785a208 x6 : 0000000000001b54
[   11.476811] x5 : 40000000fffff247 x4 : 000000000000aff5 x3 : 0000000000000000
[   11.484158] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff394d176f4500
[   11.491501] Call trace:
[   11.494028]  clk_branch_wait+0x144/0x15c
[   11.498081]  clk_branch2_enable+0x30/0x40
[   11.502218]  clk_core_enable+0x6c/0xbc
[   11.506097]  clk_enable+0x2c/0x4c
[   11.509518]  clk_bulk_enable+0x4c/0xd8
[   11.513398]  msm_mdss_enable+0xc8/0x264
[   11.517363]  mdss_runtime_resume+0x34/0x44
[   11.521590]  pm_generic_runtime_resume+0x2c/0x44
[   11.526352]  __genpd_runtime_resume+0x30/0xa8
[   11.530852]  genpd_runtime_resume+0xb4/0x29c
[   11.535257]  __rpm_callback+0x48/0x198
[   11.539133]  rpm_callback+0x68/0x74
[   11.542740]  rpm_resume+0x3cc/0x680
[   11.546350]  rpm_resume+0x24c/0x680
[   11.549959]  __pm_runtime_resume+0x4c/0x90
[   11.554188]  __device_attach+0x90/0x1b0
[   11.558158]  device_initial_probe+0x14/0x20
[   11.562474]  bus_probe_device+0xa8/0xac
[   11.566436]  device_add+0x590/0x750
[   11.570043]  device_register+0x20/0x30
[   11.573905]  i2c_register_adapter+0xe8/0x644
[   11.578311]  i2c_add_adapter+0x78/0xd0
[   11.582172]  drm_dp_aux_register+0x4c/0x104
[   11.586497]  dp_aux_register+0x18/0x78
[   11.590362]  dp_display_bind+0x4c/0x118
[   11.594321]  component_bind_all+0x118/0x248
[   11.598641]  msm_drm_bind+0x1bc/0x3d0
[   11.602423]  try_to_bring_up_aggregate_device+0x168/0x1d4
[   11.607978]  __component_add+0xa4/0x170
[   11.611932]  component_add+0x14/0x20
[   11.615619]  dsi_dev_attach+0x20/0x2c
[   11.619403]  dsi_host_attach+0x9c/0x144
[   11.623360]  devm_mipi_dsi_attach+0x34/0x90
[   11.627688]  ps8640_bridge_link_panel+0x64/0x74
[   11.632363]  dp_aux_ep_probe+0x4c/0xf0
[   11.636232]  really_probe+0xbc/0x2a0
[   11.639926]  __driver_probe_device+0x78/0x12c
[   11.644418]  driver_probe_device+0x40/0x160
[   11.648736]  __driver_attach+0x94/0x19c
[   11.652696]  bus_for_each_dev+0x74/0xd4
[   11.656656]  driver_attach+0x24/0x30
[   11.660347]  bus_add_driver+0xe4/0x208
[   11.664213]  driver_register+0x60/0x128
[   11.668165]  __dp_aux_dp_driver_register+0x24/0x30
[   11.673102]  panel_edp_init+0x44/0x1000 [panel_edp]
[   11.678153]  do_one_initcall+0x6c/0x1b0
[   11.682116]  do_init_module+0x60/0x1f0
[   11.685988]  load_module+0x191c/0x1b04
[   11.689853]  init_module_from_file+0x84/0xc0
[   11.694256]  __arm64_sys_finit_module+0x1b8/0x27c
[   11.699103]  invoke_syscall+0x48/0x118
[   11.702976]  el0_svc_common.constprop.0+0x40/0xe0
[   11.707821]  do_el0_svc+0x1c/0x28
[   11.711244]  el0_svc+0x34/0xdc
[   11.714411]  el0t_64_sync_handler+0xc0/0xc4
[   11.718720]  el0t_64_sync+0x190/0x194
[   11.722504] ---[ end trace 0000000000000000 ]---
[   11.727445] Failed to enable clk 'core': -16
[   11.731997] msm-mdss ae00000.display-subsystem: clock enable failed, ret:-16
[   11.741316] msm_dpu ae01000.display-controller: bound ae90000.displayport-controller (ops dp_display_comp_ops)
[   11.752180] adreno 5000000.gpu: supply vdd not found, using dummy regulator
[   11.759422] adreno 5000000.gpu: supply vddcx not found, using dummy regulator
[   11.768317] platform 506a000.gmu: Adding to iommu group 15
[   11.774827] msm_dpu ae01000.display-controller: bound 5000000.gpu (ops a3xx_ops)
[   11.785298] msm_dpu ae01000.display-controller: [drm:msm_drm_kms_init] *ERROR* kms hw init failed: -16
[   11.794867] Unable to handle kernel paging request at virtual address dead000000000108
[   11.802998] Mem abort info:
[   11.805873]   ESR = 0x0000000096000044
[   11.809724]   EC = 0x25: DABT (current EL), IL = 32 bits
[   11.815177]   SET = 0, FnV = 0
[   11.818321]   EA = 0, S1PTW = 0
[   11.821554]   FSC = 0x04: level 0 translation fault
[   11.826560] Data abort info:
[   11.829524]   ISV = 0, ISS = 0x00000044, ISS2 = 0x00000000
[   11.835156]   CM = 0, WnR = 1, TnD = 0, TagAccess = 0
[   11.840340]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[   11.845795] [dead000000000108] address between user and kernel address ranges
[   11.853120] Internal error: Oops: 0000000096000044 [#1] PREEMPT SMP
[   11.859558] Modules linked in: venus_dec venus_enc videobuf2_dma_contig cbmem hci_uart qcom_spmi_adc5 qcom_spmi_adc_tm5 ath10k_snoc btqca qcom_vadc_common venus_core uvcvideo uvc btrtl ath10k_core videobuf2_vmalloc v4l2_mem2mem videobuf2_memops cros_ec_lid_angle btbcm videobuf2_v4l2 crct10dif_ce ath cros_ec_sensors_core bluetooth coresight_stm mac80211 qcom_stats stm_core videodev industrialio_triggered_buffer kfifo_buf cros_ec_chardev videobuf2_common onboard_usb_dev sbs_battery libarc4 ecdh_generic elan_i2c elants_i2c panel_edp(+) ecc mc cfg80211 icc_bwmon coresight_etm4x rfkill coresight_tmc coresight_funnel coresight_replicator ramoops coreboot_table coresight reed_solomon pwm_bl backlight
[   11.922542] CPU: 7 PID: 190 Comm: (udev-worker) Tainted: G        W          6.9.0-rc6-next-20240429-00004-g194b5bfc4dd4-dirty #374
[   11.934669] Hardware name: Google Kingoftown (DT)
[   11.939505] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   11.946649] pc : drm_atomic_private_obj_fini+0x24/0x70
[   11.951923] lr : _dpu_kms_hw_destroy+0x4c/0x64
[   11.956492] sp : ffff800081fdb5d0
[   11.959892] x29: ffff800081fdb5d0 x28: ffff800081fdbc70 x27: ffff394d055ceec0
[   11.967215] x26: ffffc652b7b86200 x25: ffff394d01978880 x24: ffff394d03bfa080
[   11.974537] x23: ffff394d04f3c800 x22: ffff394d04625810 x21: ffff394d03bfa080
[   11.981860] x20: ffff394d03bfa638 x19: ffff394d03bfa080 x18: 0000000000000030
[   11.989183] x17: 4f5252452a205d74 x16: 696e695f736d6b5f x15: 6d72645f6d736d3a
[   11.996504] x14: ffffc652b7802208 x13: 00000000000007d7 x12: 000000000000029d
[   12.003826] x11: 20776820736d6b20 x10: ffffc652b785a208 x9 : 00000000fffff000
[   12.011147] x8 : ffffc652b7802208 x7 : ffffc652b785a208 x6 : 0000000000000000
[   12.018469] x5 : 80000000fffff000 x4 : dead000000000100 x3 : dead000000000122
[   12.025791] x2 : dead000000000100 x1 : dead000000000122 x0 : ffff394d03bfa6c0
[   12.033114] Call trace:
[   12.035630]  drm_atomic_private_obj_fini+0x24/0x70
[   12.040554]  _dpu_kms_hw_destroy+0x4c/0x64
[   12.044761]  dpu_kms_destroy+0x28/0xa4
[   12.048609]  msm_drm_kms_uninit+0xb8/0xe4
[   12.052727]  msm_drm_uninit.isra.0+0x58/0xd0
[   12.057116]  msm_drm_bind+0x304/0x3d0
[   12.060876]  try_to_bring_up_aggregate_device+0x168/0x1d4
[   12.066418]  __component_add+0xa4/0x170
[   12.070358]  component_add+0x14/0x20
[   12.074028]  dsi_dev_attach+0x20/0x2c
[   12.077789]  dsi_host_attach+0x9c/0x144
[   12.081729]  devm_mipi_dsi_attach+0x34/0x90
[   12.086028]  ps8640_bridge_link_panel+0x64/0x74
[   12.090686]  dp_aux_ep_probe+0x4c/0xf0
[   12.094534]  really_probe+0xbc/0x2a0
[   12.098206]  __driver_probe_device+0x78/0x12c
[   12.102684]  driver_probe_device+0x40/0x160
[   12.106984]  __driver_attach+0x94/0x19c
[   12.110924]  bus_for_each_dev+0x74/0xd4
[   12.114864]  driver_attach+0x24/0x30
[   12.118537]  bus_add_driver+0xe4/0x208
[   12.122386]  driver_register+0x60/0x128
[   12.126326]  __dp_aux_dp_driver_register+0x24/0x30
[   12.131241]  panel_edp_init+0x44/0x1000 [panel_edp]
[   12.136260]  do_one_initcall+0x6c/0x1b0
[   12.140202]  do_init_module+0x60/0x1f0
[   12.144052]  load_module+0x191c/0x1b04
[   12.147900]  init_module_from_file+0x84/0xc0
[   12.152287]  __arm64_sys_finit_module+0x1b8/0x27c
[   12.157123]  invoke_syscall+0x48/0x118
[   12.160973]  el0_svc_common.constprop.0+0x40/0xe0
[   12.165808]  do_el0_svc+0x1c/0x28
[   12.169212]  el0_svc+0x34/0xdc
[   12.172357]  el0t_64_sync_handler+0xc0/0xc4
[   12.176655]  el0t_64_sync+0x190/0x194
[   12.180417] Code: d2802443 f2fbd5a4 f2fbd5a3 a9400402 (f9000441) 
[   12.186675] ---[ end trace 0000000000000000 ]---

