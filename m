Return-Path: <linux-arm-msm+bounces-98422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cE58EOGIumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:13:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D02752BA9C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32FB930D73B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC5F3C5DDF;
	Wed, 18 Mar 2026 11:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b="p8CLN+8F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5795B37703A;
	Wed, 18 Mar 2026 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.26.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831801; cv=none; b=HOSyQA/DTelyC4fHTJYjg48tPNquveGx4ibPvvr9dn2XFhgmqebppIUpOKk1gnI3KZ9R6ib9Yitb5NbFslpRvkTTXth+YbxrCUDCcaPB/fyKvL06Xolz6QhfM39x7F2+iei8CXxx4V8bEALb5Jz6SB4lOoTfO6ydSgDCHLVeZno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831801; c=relaxed/simple;
	bh=HYUi5lezWyzzXNzBGCQtTWHkockAR26Kostc1Ad1Q9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d3HZR6zDvOxclqK/sG/6gAIFni/Fh2Svc4KhkqTavEIFrW8DBy3EjgvXul45QkN5tr+K+OLvoZMMvzvbdyDywHbPMscanCP4qSmH/XMfQ6bSdMBkW4cPxPoDim2yYfCfvAPvdFqG78TkrivBPZbA4TsbSXrdco+JMF3gkxfmf28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org; spf=pass smtp.mailfrom=adishatz.org; dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b=p8CLN+8F; arc=none smtp.client-ip=37.187.26.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Received: from p-si-bellegarde.ad.iut-nantes.univ-nantes.prive (235.33.83.79.rev.sfr.net [79.83.33.235])
	by adishatz.org (Postfix) with ESMTPSA id D10344C01D7;
	Wed, 18 Mar 2026 11:56:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1773831418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BGfJw6XwE9tAljPxpX4xQiqwZDvXpIL/LNmJcXZ1cQw=;
	b=p8CLN+8FZxrOpaurp3R9Q+94Tc7Jek+VWcLxwoWpAYcFa8WQ+jXO2aDaAm9mgnwhV6gEj7
	igx/Eavip08P41dMHnmGLYeTbq2oZAEo7Fr6MDOpS4bXsb8sfRhA/0HpHF7uScoP7wY5/F
	wLQ74urq4Z1AjEAfliX2t+Tp7xCAlqSW22eTYL7Cm1L/FwugwZdPQi9vsT9eAWeN611JpY
	AsWwaV4Oh0M+1q9m8uy37mJiE00BgpL3GI0JH7M8UB9SVhKvIzfFpk7aTXUO7Zk7lfx7OU
	nYrnNvduKomgZpksOuHx6ijOKE8+NWDxsisDG7j/PqQBO4EVQwRT3mMBABrdEQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
From: =?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
To: robin.clark@oss.qualcomm.com
Cc: lumag@kernel.org,
	abhinav.kumar@linux.dev,
	jesszhan0024@gmail.com,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	antomani103@gmail.com,
	mitltlatltl@gmail.com,
	krzk@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?C=C3=A9dric=20Bellegarde?= <cedric.bellegarde@adishatz.org>
Subject: [PATCH] drm/msm/dsi: fix race between cmd transfer and host power off
Date: Wed, 18 Mar 2026 11:56:35 +0100
Message-ID: <20260318105635.270949-1-cedric.bellegarde@adishatz.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[adishatz.org,reject];
	R_DKIM_ALLOW(-0.20)[adishatz.org:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,adishatz.org];
	TAGGED_FROM(0.00)[bounces-98422-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cedric.bellegarde@adishatz.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[adishatz.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,adishatz.org:dkim,adishatz.org:email,adishatz.org:mid]
X-Rspamd-Queue-Id: D02752BA9C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The transfer function dsi_host_transfer() guards against the DSI host
being inactive by checking msm_host->power_on. However, power_on is
cleared at the end of msm_dsi_host_power_off(), after clocks have
already been disabled. This creates a window where a concurrent DCS
command (e.g. a brightness update from the backlight driver) can pass
the power_on check, call xfer_prepare()/xfer_restore(), and toggle
link clocks that are already being torn down, leaving
disp_cc_mdss_byte0_clk stuck in the 'on' state.

Checking enabled instead of power_on closes the race by rejecting
transfers as soon as the bridge starts tearing down, before any clocks
are touched.

[11816.846734] disp_cc_mdss_byte0_clk status stuck at 'on'
[11816.846752] WARNING: CPU: 4 PID: 26399 at drivers/clk/qcom/clk-branch.c:=
88 clk_branch_toggle+0x128/0x178
[11816.861715] Modules linked in: rfcomm rmnet algif_hash algif_skcipher q6=
asm_dai q6voice_dai q6routing q6afe_dai q6voice q6adm q6cvp q6afe q6asm q6m=
vm q6cvs q6voice_common snd_q6dsp_common q6core bnep gpio_wcd934x snd_soc_w=
cd934x snd_soc_wcd_mbhc soundwire_qcom snd_soc_wcd_classh venus_enc venus_d=
ec imx371 wcd934x regmap_slimbus imx376 lc898217xc videobuf2_dma_contig fas=
trpc v4l2_cci qrtr_smd rpmsg_ctrl hci_uart btqca btbcm bluetooth ecdh_gener=
ic ecc pwrseq_core snd_soc_max98927 qcom_camss ath10k_snoc videobuf2_dma_sg=
 snd_soc_sdm845 videobuf2_memops venus_core ath10k_core qcom_smbx leds_qcom=
_flash snd_soc_rt5663 leds_qcom_lpg ath v4l2_mem2mem snd_soc_qcom_sdw video=
buf2_v4l2 v4l2_fwnode videobuf2_common v4l2_async snd_soc_qcom_common bq27x=
xx_battery_i2c qcom_pbs bq27xxx_battery led_class_multicolor mac80211 snd_s=
oc_rl6231 rtc_pm8xxx libarc4 soundwire_bus videodev qcom_stats qcom_spmi_rr=
adc reset_qcom_pdc i2c_qcom_cci cfg80211 camcc_sdm845 rfkill mc qcom_rng ip=
a qcom_q6v5_mss slim_qcom_ngd_ctrl qcom_wdt icc_bwmon qrtr
[11816.861812]  qcom_q6v5_pas qcom_pil_info qcom_q6v5 qcom_sysmon qcom_comm=
on qcom_glink_smem joydev zram zsmalloc uhid uinput nft_reject_inet nft_rej=
ect nf_reject_ipv6 nf_reject_ipv4 nft_ct nf_conntrack nf_defrag_ipv6 nf_def=
rag_ipv4 nf_tables fuse nfnetlink ipv6 qcom_spmi_haptics rmi_i2c rmi_core
[11816.978965] CPU: 4 UID: 0 PID: 26399 Comm: (sd-bright) Tainted: G       =
 W           6.16.7-sdm845 #1000-postmarketos-qcom-sdm845 PREEMPT
[11816.991580] Tainted: [W]=3DWARN
[11816.994637] Hardware name: OnePlus 6 (DT)
[11816.998735] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[11817.005844] pc : clk_branch_toggle+0x128/0x178
[11817.010384] lr : clk_branch_toggle+0x124/0x178
[11817.014956] sp : ffff8000991f3970
[11817.018358] x29: ffff8000991f3980 x28: ffff0000dad38000 x27: 00000000000=
00000
[11817.025634] x26: 0000000000000000 x25: 0000000000000000 x24: 00000000000=
00000
[11817.032887] x23: 0000000000000000 x22: ffffa63e2af42178 x21: ffffa63e2b5=
6e128
[11817.040169] x20: ffffa63e29da5a90 x19: 0000000000000000 x18: 00000000000=
00003
[11817.047451] x17: 0000000000000000 x16: 000000000000000c x15: 00000000000=
00003
[11817.054701] x14: ffffa63e2b2f6a10 x13: 0000000000000003 x12: 00000000000=
00003
[11817.061982] x11: 00000000ffffefff x10: c0000000ffffefff x9 : e43cc05c499=
6c100
[11817.069260] x8 : e43cc05c4996c100 x7 : 7461206b63757473 x6 : 00000000000=
00027
[11817.076511] x5 : ffffa63e2b8726d3 x4 : ffffa63e2ae146c4 x3 : 00000000000=
00000
[11817.083792] x2 : 0000000000000000 x1 : ffff8000991f3710 x0 : 00000000fff=
ffff0
[11817.091042] Call trace:
[11817.093572]  clk_branch_toggle+0x128/0x178 (P)
[11817.098112]  clk_branch2_disable+0x28/0x40
[11817.102308]  clk_core_disable+0x64/0x1b8
[11817.106358]  clk_core_disable_lock+0x90/0x120
[11817.110810]  clk_disable+0x2c/0x40
[11817.114298]  dsi_link_clk_disable_6g+0x78/0x98
[11817.118871]  msm_dsi_host_xfer_restore+0xf0/0x120
[11817.123667]  msm_dsi_manager_cmd_xfer+0xfc/0x178
[11817.128411]  dsi_host_transfer+0x48/0x110
[11817.132509]  mipi_dsi_dcs_set_display_brightness_large+0x8c/0xd0
[11817.138651]  sofef00_panel_bl_update_status+0x3c/0x60
[11817.143802]  backlight_device_set_brightness+0x88/0x128
[11817.149124]  brightness_store+0x64/0xa8
[11817.153082]  dev_attr_store+0x24/0x40
[11817.156835]  sysfs_kf_write+0x8c/0xb8
[11817.160591]  kernfs_fop_write_iter+0xe4/0x190
[11817.165073]  do_iter_readv_writev+0x168/0x1c8
[11817.169515]  vfs_writev+0x16c/0x378
[11817.173122]  do_writev+0x84/0x130
[11817.176523]  __arm64_sys_writev+0x2c/0x40
[11817.180618]  invoke_syscall+0x48/0x100
[11817.184460]  el0_svc_common+0x88/0xe8
[11817.188217]  do_el0_svc+0x28/0x40
[11817.191621]  el0_svc+0x38/0x88
[11817.194766]  el0t_64_sync_handler+0x78/0x108
[11817.199161]  el0t_64_sync+0x198/0x1a0

Signed-off-by: C=C3=A9dric Bellegarde <cedric.bellegarde@adishatz.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/d=
si_host.c
index 4d75529c0e85..f66f138cfba0 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1652,7 +1652,7 @@ static ssize_t dsi_host_transfer(struct mipi_dsi_host=
 *host,
 	struct msm_dsi_host *msm_host =3D to_msm_dsi_host(host);
 	int ret;
=20
-	if (!msg || !msm_host->power_on)
+	if (!msg || !msm_host->enabled)
 		return -EINVAL;
=20
 	mutex_lock(&msm_host->cmd_mutex);
--=20
2.53.0


