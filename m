Return-Path: <linux-arm-msm+bounces-117812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7rYKDqDPTmpAUgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 00:30:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F06172AE30
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 00:30:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=WJAUSl7h;
	dkim=pass header.d=redhat.com header.s=google header.b=jjZYWs9H;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117812-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117812-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 96BF1301E9B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 22:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6382F366048;
	Wed,  8 Jul 2026 22:30:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655572F3C19
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 22:30:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783549854; cv=none; b=cJKMCnk8txI48wqWXzeUDSKrVypwWnEqc6+S/MBk9N7ta1KGLtplNqolDYb/WuxWk/zMz0F6eQYlmJWnL3RUdM7jrCbGVlQeHSf84Get54C/a3QuDw1S6+mDJQ7wry9IVhJdEM0qIl259+WJiZpH21SmQHc0E9UGvp/BJjg2EME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783549854; c=relaxed/simple;
	bh=CicQyZukAr1bOyR4J1Ki8KsjKmc57u5OX69GJAZ6hdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=F1NXqD4IFsryetiFSdWsCM/MAFe2KhzzwRe81l+k5cTmqU2LsPj03VdLJlZtth9sUrz8nIK+6nY/i5uqG0FMLohw4amXo93UuG+A0t/5fIHf26UrJj3uukG8vSyA8nJbZPe36LPRWxiRnlRk4fFhJ/p5/dBFSXnDsD1FrtC03BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WJAUSl7h; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jjZYWs9H; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783549850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U0HDtTpCFmCmrzcBfITI34cIpujgNRwJlyCVd0LpRlc=;
	b=WJAUSl7h8Hh/KKicnCrsk70jrY2VSWyhS33kAwOved/3PStQ6HbWpHFCfu078EGWe/042G
	9otd09oyZ8tw5ImfG+0pOdhuo95WOY+XhwP70b9/4ZT1KV/o0AEMPA/l9lD+8Fh8i5I6Lx
	VhUuXJnlh8bqMYtbGb7ITJYiuhfbhJo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-NOCWTPIaMoaHt1BnLRzBRg-1; Wed, 08 Jul 2026 18:30:49 -0400
X-MC-Unique: NOCWTPIaMoaHt1BnLRzBRg-1
X-Mimecast-MFC-AGG-ID: NOCWTPIaMoaHt1BnLRzBRg_1783549849
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso13484741cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783549849; x=1784154649; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U0HDtTpCFmCmrzcBfITI34cIpujgNRwJlyCVd0LpRlc=;
        b=jjZYWs9HDoXYjjv4PvICkQ5h3Ak4YcEiyv2dUSyprDxUiF0svlsO3MtJXAHdjWWcJM
         GDBYRriojWLqWz4b3fdvJ7wI29YzDi4S+kS0Z7m+NdRyQiylmI3RvWCh5+nMqyfJtTUB
         kzAFcQE8WkJnl3fNYgEyccCtZmwrW7xbqx6EuQsS2q63VfKIyu+7gWTxmbRgZxzqWTG2
         QrsmebbnyTlURJ+4RmOotaWDjrosnxJH8Fxa24sTo6xyVH163c4Nulk4Wm1Edb4JZTDB
         Q2L9pIBZLUnjivz0OyNw02VZ1iMFypWEABVJf9K10Yvs0+EdtF1YAfqNmDFTxvmVs8LY
         L4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783549849; x=1784154649;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U0HDtTpCFmCmrzcBfITI34cIpujgNRwJlyCVd0LpRlc=;
        b=jtvg+bGNewYli7gq+rXLmEoSjvpwE5dyFwPEuFae9zNiD78qwdKzymCk/dh8CDpC16
         shE1bdC/+DmB8ciRs8QDlP3XuyL+3uAusgKVCR2XiuRZhOdmfhSwntLLMxNtgqnmoUgU
         /Vptu+99gfoS8uPJIVObKABEZeWEmVRXny8MUKfWao67dDzxwqzmyjn/3lgaOlEGyAvw
         qGYU2ceUBfxELHtTMGacr7OWlBrk1kSLMcugX1db/GUSvjECkQET/kyHtcK2es+igc0y
         geVdzUMnCxuRmyJpbtPFQLOiPpXOgaaxICPSWTpDbtj99se5X7tP4e8XbxJL3VTN7JRb
         C1LQ==
X-Gm-Message-State: AOJu0Ywis6Y1IUefzY+or0xtM5KjskBh/4ZF61lKxHHx+HwuTj+vXy0H
	A0Y/f/WuVvevg/N1YGH4eL4geFHpQIWl6vCCGuyHfUXbD+w1aE7XlCLSmQP6fVC+tqlFqvAZDLB
	+sibmafhAV2IUrF1Z0mKvWzHo12/zDPx/GYgrRqU8Fpbeujm63FsOovy+Qon/SFSCC5c=
X-Gm-Gg: AfdE7cnFl0Jxj15bDSRJFlZ713xuuPNrDwuGMdHqJaSQ3SOBw7RHgKbZR4IeoJXP7jd
	PZCpwU+gwiZYi/WLVa4eAJuw8oZ/Ut3iJRXC8crQAgyJKY36FzYHJZtDcPrhw2GJxrYOvfBvJsa
	Q39wgPJ84WLzNzwHD59SoZN7CgHnL2NCcBk0dyFAyT+9XOPDjdqHy4UULevY6ngwpWQuQH6GCkV
	zGRox5mxYXlGxes5pvY6XO7dqxzrXF4KEAjeMWMw50Auc7zyOSrvJLyq4T7ddEA7nLWkLksFm7Q
	WBjftokRNvMGci+nYJxKjlKSexqOeI0aeHSIeFXCnwNbjkSIxJuIQPiY9YyQHefsPARPt75mIEj
	9vjjUWIiDX+bY
X-Received: by 2002:a05:622a:1911:b0:51b:f563:f613 with SMTP id d75a77b69052e-51c8b450a23mr45656001cf.35.1783549848723;
        Wed, 08 Jul 2026 15:30:48 -0700 (PDT)
X-Received: by 2002:a05:622a:1911:b0:51b:f563:f613 with SMTP id d75a77b69052e-51c8b450a23mr45655311cf.35.1783549848180;
        Wed, 08 Jul 2026 15:30:48 -0700 (PDT)
Received: from [10.239.101.46] ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41d2ac6esm145819461cf.19.2026.07.08.15.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 15:30:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 08 Jul 2026 18:30:06 -0400
Subject: [PATCH] clk: qcom: camcc-sc8280xp: unregister CAMCC_GDSC_CLK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-camcc-sc8280xp-remove-gdsc-v1-1-dfaab98a3bf5@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqEMAwG0KtI1gZikbHMVQYXNX5qFv7QgAji3
 S2zfJt3kyMbnL7VTRmnue1bQVNXpEvaZrCNxRQkfKSTyJpWVXaNIcp1cMa6n+B5dOUhQZqpFYl
 oqQRHxmTXP//1z/MCuoapvGwAAAA=
X-Change-ID: 20260708-camcc-sc8280xp-remove-gdsc-bae01f4008e4
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6600; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=CicQyZukAr1bOyR4J1Ki8KsjKmc57u5OX69GJAZ6hdI=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL8zk9yVXywiX1pnNyfF1xTpqWY+ZgbvL5x5+cURatDx
 k2hF1Q2dZSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARwx0Mf+V/F//ujHC6/tNx
 zc1zXxc3LBFZEpCnslXu/xwZY5t6KzmG/wUfdG6VWk96V8gYe+3F9Kjrb+yWKldvinp44Ex9xrs
 /O/kB
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:bmasney@redhat.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F06172AE30

With the introduction of sync_state support in the clk and pmdomain
subsystems, the following warning happens when the unused clocks are
shutdown in camcc-sc8280xp:

    [   15.408367] titan_top_gdsc status stuck at 'on'
    [   15.408429] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x14c/0x160, CPU#2: kworker/u32:1/14
    [   15.408462] Modules linked in: bnep vfat fat ath11k_pci(+) ath11k mac80211 cfg80211 mhi libarc4 snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_wcd_classh hci_uart snd_soc_wcd_common
    snd_soc_sc8280xp soundwire_qcom snd_soc_wcd_mbhc snd_soc_qcom_sdw slimbus snd_soc_qcom_common regmap_sdw btqca btrtl qcom_camss soundwire_bus btbcm btintel snd_soc_sdca snd_soc_lpass_wsa_macro
    bluetooth snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_rx_macro snd_soc_hdmi_codec snd_soc_lpass_macro_common videobuf2_dma_sg ov5675 v4l2_fwnode videobuf2_memops
    qcom_spmi_adc5 snd_soc_core qcom_spmi_adc_tm5 videobuf2_v4l2 snd_seq snd_seq_device videobuf2_common v4l2_async qcom_vadc_common qcom_spmi_temp_alarm pm8941_pwrkey industrialio videodev
    snd_compress rfkill ac97_bus snd_pcm_dmaengine qcom_tsens mc qcom_edac snd_pcm pci_pwrctrl_pwrseq qcom_cpufreq_hw snd_timer snd qcomtee soundcore tee leds_gpio joydev binfmt_misc zram
    lz4hc_compress governor_simpleondemand panel_edp msm xhci_plat_hcd nvme nvme_core dwc3 qcom_pm8008_regulator
    [   15.408688]  ucsi_glink nvme_keyring nvme_auth pmic_glink_altmode udc_core typec_ucsi aux_hpd_bridge qcom_battmgr ulpi ubwc_config socinfo ocmem drm_gpuvm qcom_q6v5_pas drm_exec
    qcom_pil_info leds_qcom_lpg gpu_sched led_class_multicolor rtc_pm8xxx qcom_pbs qcom_common drm_display_helper qcom_pon qcom_glink_smem qcom_glink ghash_ce pwrseq_qcom_wcn gpio_sbu_mux
    qcom_stats phy_qcom_qmp_combo qcom_q6v5 gf128mul cec dispcc_sc8280xp phy_qcom_edp camcc_sc8280xp i2c_qcom_cci qcom_sysmon drm_dp_aux_bus mdt_loader aux_bridge qcom_pm8008 i2c_hid_of_elan
    dwc3_qcom_legacy llcc_qcom icc_bwmon gpi typec qcom_refgen_regulator phy_qcom_qmp_usb nvmem_qfprom qcom_ipcc phy_qcom_snps_femto_v2 gpucc_sc8280xp pinctrl_sc8280xp_lpass_lpi qcom_hwspinlock
    pinctrl_lpass_lpi lpasscc_sc8280xp qrtr qcom_aoss pmic_glink pdr_interface phy_qcom_qmp_pcie qcom_smd qcom_pdr_msg icc_osm_l3 qcom_wdt qmi_helpers qcom_rng smp2p rpmsg_core gpio_keys pwm_bl
    smem hid_multitouch fuse i2c_dev
    [   15.408928] CPU: 2 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted 7.1.0+ #2 PREEMPT(lazy)
    [   15.408937] Hardware name: LENOVO 21BX0016US/21BX0016US, BIOS N3HET88W (1.60 ) 03/14/2024
    [   15.408942] Workqueue: pm pm_runtime_work
    [   15.408959] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    [   15.408967] pc : gdsc_toggle_logic+0x14c/0x160
    [   15.408978] lr : gdsc_toggle_logic+0x14c/0x160
    [   15.408987] sp : ffff8000800f3b40
    [   15.408991] x29: ffff8000800f3b40 x28: 0000000000000000 x27: 0000000000000000
    [   15.409003] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
    [   15.409014] x23: 0000000000000000 x22: 0000000000000001 x21: ffffa33f298fca88
    [   15.409024] x20: 0000000000000000 x19: ffffa33f298fc5b0 x18: 00cd15db75dacefd
    [   15.409035] x17: 000000040044ffff x16: ffffa33f3b1a3d88 x15: 726f776b80000002
    [   15.409045] x14: ffffffffffffffff x13: 0000000000000028 x12: 0101010101010101
    [   15.409056] x11: 7f7f7f7f7f7f7f7f x10: fefeff3039313274 x9 : ffffa33f3a5edafc
    [   15.409067] x8 : ffff8000800f3780 x7 : 0000000000000001 x6 : 0000000000000001
    [   15.409078] x5 : ffff000bf3ca1288 x4 : 0000000000000000 x3 : ffff5cccb6a3f000
    [   15.409088] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080ae0000
    [   15.409098] Call trace:
    [   15.409103]  gdsc_toggle_logic+0x14c/0x160 (P)
    [   15.409115]  gdsc_disable+0x4c/0x190
    [   15.409126]  _genpd_power_off+0xa0/0x1a8
    [   15.409137]  genpd_power_off.part.0+0x180/0x2a0
    [   15.409149]  genpd_runtime_suspend+0x218/0x310
    [   15.409155]  __rpm_callback+0x50/0x1f8
    [   15.409166]  rpm_callback+0x7c/0x90
    [   15.409175]  rpm_suspend+0xe8/0x690
    [   15.409185]  pm_runtime_work+0xd0/0xe0
    [   15.409195]  process_one_work+0x18c/0x518
    [   15.409208]  worker_thread+0x190/0x320
    [   15.409218]  kthread+0x110/0x130
    [   15.409227]  ret_from_fork+0x10/0x20

This clock is force enabled to be on in the probe, and registered with
the Common Clk Framework, resulting in them being toggled off after
unused clocks are shutdown. This clock is required for the GDSC
transitions.

Similar to the fix in commit b60521eff227 ("clk: qcom: gcc-x1e80100:
Unregister GCC_GPU_CFG_AHB_CLK/GCC_DISP_XO_CLK"), let's just unregister
this clock.

Link: https://lore.kernel.org/linux-clk/20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com/
Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
Suggested-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index e97b8d4f3c84..660d8655d391 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -1753,24 +1753,6 @@ static struct clk_branch camcc_csiphy3_clk = {
 	},
 };
 
-static struct clk_branch camcc_gdsc_clk = {
-	.halt_reg = 0xc1e4,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0xc1e4,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "camcc_gdsc_clk",
-			.parent_hws = (const struct clk_hw*[]){
-				&camcc_xo_clk_src.clkr.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch camcc_icp_ahb_clk = {
 	.halt_reg = 0xc0d8,
 	.halt_check = BRANCH_HALT,
@@ -2839,7 +2821,6 @@ static struct clk_regmap *camcc_sc8280xp_clocks[] = {
 	[CAMCC_CSIPHY2_CLK] = &camcc_csiphy2_clk.clkr,
 	[CAMCC_CSIPHY3_CLK] = &camcc_csiphy3_clk.clkr,
 	[CAMCC_FAST_AHB_CLK_SRC] = &camcc_fast_ahb_clk_src.clkr,
-	[CAMCC_GDSC_CLK] = &camcc_gdsc_clk.clkr,
 	[CAMCC_ICP_AHB_CLK] = &camcc_icp_ahb_clk.clkr,
 	[CAMCC_ICP_CLK] = &camcc_icp_clk.clkr,
 	[CAMCC_ICP_CLK_SRC] = &camcc_icp_clk_src.clkr,

---
base-commit: b9810cd75b9fb56a3425d391cba3f608502bd474
change-id: 20260708-camcc-sc8280xp-remove-gdsc-bae01f4008e4

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


