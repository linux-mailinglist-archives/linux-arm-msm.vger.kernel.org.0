Return-Path: <linux-arm-msm+bounces-115729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IKKiHEchRWoZ7goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:16:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 082F86EE97E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:16:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=PIr9Pz56;
	dkim=pass header.d=redhat.com header.s=google header.b=B5nz2LWN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115729-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115729-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BD82300CE90
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 14:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E931A33B6E3;
	Wed,  1 Jul 2026 14:16:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E0C33A6F2
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 14:16:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915396; cv=none; b=aqwKnews0OUWApFjHFs1t23yNFzNeYa6gjx+sFRGTfUvdoAEYhcGKTNvhp9HsPFbStJ0IIcSdCjhTsWi805vHTAl/B8uj0urqgYV1yICcJkmQd5BApoqERiI4gf/XtU+9nIpvProzQ2U2kqS5afqPgMfnpwktU9eycFP5xYgP8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915396; c=relaxed/simple;
	bh=RpauZrEucFKlazf2uI7VX0Q7EoNWI1WAXPiXtwCOLeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gJ74lHvbKX+Upew9R/Xjot4V13cNaERZrkmzpX3JvYErzPhqx6N0ZIKDERM/Pk9GMwQFt9qfYbSfIL3eoFPap1CQhls69r3rA2eyLMltcG/EBmO5DH/w+/ikpeGJHgfmeCpv2SbuPO7nOAZxBmuT9brMysNqSxh0P2Ldd4tVMsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PIr9Pz56; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=B5nz2LWN; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782915391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/JWBbuPH+JoxQjIqcAckt9LCjRBqaw7vRzjjWYDDti8=;
	b=PIr9Pz566WBXVsbrFAOYv7AY+wyx4UVs9X2j0dSuKMzMScbMRmgroXI+Aa7Mg/d8Mv1ohQ
	vW8sziJHiq4BVcBHY6zgkImhdVF+MQ0+iMeI1utIVTBwPbcKx8tWbOGSbCzbqTIePtVC7Z
	6xFtDjoYRAwxHkwQiNrsij4VOkvOu7E=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-hL9f9c4DN2G9xnOi0391nQ-1; Wed, 01 Jul 2026 10:16:30 -0400
X-MC-Unique: hL9f9c4DN2G9xnOi0391nQ-1
X-Mimecast-MFC-AGG-ID: hL9f9c4DN2G9xnOi0391nQ_1782915390
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e62e3459fso95584985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782915390; x=1783520190; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JWBbuPH+JoxQjIqcAckt9LCjRBqaw7vRzjjWYDDti8=;
        b=B5nz2LWNivmTWzXzUWlJAAuJQkIVJsOrsQd+VYJRfONDYrdft4PTJD+Wp92wzteSCH
         W90qgpxNWSyWOf1cx2lLsTb7vbEf2xxsK7SI2/aNoWNrzUz0o7QfODRuXCxyIU/3gfsl
         hEoJNNI0ikQD5wNpiOlTBh1nzYNOvL7aMdk0ecjSs/xzJ/8L418Wxo8AHiQ3PEmYi2L6
         6CXw6o349xDJsPM4mvrPk9SkMbpigyfpefiMkbIA/2aHOQKtUqqLmijiUfHhuX6etSxt
         0DXTvSWeCm+t7HrIN6w9R0VW1tLzQ+NnYGHSYCok/88hZX60vr79Hlp38ouXAKdJdeGy
         xpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915390; x=1783520190;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JWBbuPH+JoxQjIqcAckt9LCjRBqaw7vRzjjWYDDti8=;
        b=H07RFT8jErb9LFRnVzzW4DofEWsyhWHbXMoZYR/IoDLBy3Pk5cGvB/7c4GeaIq8/fy
         17MUptS5mYNM3VNYvXd7pvYHe4JuBhqOtxdmOBBqxFmPFNVmFCUcKIQq9IcD4ESLSg0c
         eJxAkrq41icmWpqK1kFbzGHHgIpcqHEPbLIXvnPTn2uh9QA4PSQND8Pc0DchXR7WNik0
         l87iGmKrJhW2Bqm0rOmqUHjRWKRC4TsyiLXXhqa8+OxOOFu0LAAnSBDx6r1fqcSCThJ/
         xtYW16wnSkAiB5LYpde1RDwmmsgeBk8uf5VKAEaDOyaWITAItl7rSk/48g5KW26uj5AP
         6Reg==
X-Gm-Message-State: AOJu0YwLeA9mrolH0DP5PDqJU2PwK3xStK9i+movNNfANd/v1fIMCpSz
	O9FZYfYrouuJ1BwSX7XG9dFZAaz/19CqsKCurva05kk1mQ+vLVc3GuIFi8JWgTEL25bPBOk1DKq
	NIo524DdwvptQqlzbxkw6P7n7KBgej1JAznw/hlqfan9US2d0wTFt7Y5rEMH+7fQCVNQ=
X-Gm-Gg: AfdE7cn1CEz5CzcHh9jL5j2ev2cIdLrkGmrOcMKpZXGGyxxxJHdxcev34S4EYyidop+
	lVqiiLOwAKI1NedkjL/hYjNlj38FPgEQ73UDGAy8E1PbFDea0tB8Dxa4jnoGD9p9Qv0y/85/QbI
	6wYmXYOz428viO7rS1nGCCui1dIaLBFSiBtjTl314biTqfLHhwmnprPgaNftPu/oeHqMODnLWiB
	82lSPcGjAWkDDEtGfomYW1zvsCc89PJusN50TL6HFnw4dlyVulNxgwVIfvitn/BP9Vh1KuokGCQ
	+tqJrkPL6T9RsgMXalt+c0soo9qBxez+1y2hcx2uCPdq7VX67R9W9sapnSS11yKW1ZSqk1QfWq6
	D3p98Rjn5ZE7gaO2pVrDTo5yVtxg3Ebl3uvOfv5d/X2GsWkAAFA==
X-Received: by 2002:a05:620a:1986:b0:92c:3086:6d50 with SMTP id af79cd13be357-92e781f13b5mr264301085a.2.1782915389596;
        Wed, 01 Jul 2026 07:16:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1986:b0:92c:3086:6d50 with SMTP id af79cd13be357-92e781f13b5mr264291885a.2.1782915388400;
        Wed, 01 Jul 2026 07:16:28 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e622e87a7sm598871485a.28.2026.07.01.07.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:16:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 01 Jul 2026 10:16:05 -0400
Subject: [PATCH] clk: qcom: camcc-sc8280xp: add CLK_IGNORE_UNUSED to
 camcc_gdsc_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqEMAxA4atI1gbazqDWq4iLElMN/tKACMW7T
 5nlt3gvg3ISVuirDIlvUTmPAltXQEs4ZkaZisEZ15jWWFTqXGeeCynsRDhPSkjbitZ+vr4N3sc
 mQqmvxFGe/3kY3/cHuUEeF2kAAAA=
X-Change-ID: 20260701-sc8280xp-camcc-gdsc-clk-113497a99f6f
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, 
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5612; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=RpauZrEucFKlazf2uI7VX0Q7EoNWI1WAXPiXtwCOLeQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJcFc3SjnPcDY3bsYP7Fe8N3+Wpa+OP2fk/i4l0/8jaK
 95020C2o5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkwL2Fk2C0g7Zg62T5SrM/u
 0qFjFib7Te4nPpg6S0HAvyT5YqFqDyPDNw4LTn0BFSetCSdv3ajuEG2o4A1efCh29f0P+Qp6XZv
 5AA==
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-115729-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bmasney@redhat.com,m:jagadeesh.kona@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 082F86EE97E

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

camcc_sc8280xp_probe() has the following snippet:

    /* Keep some clocks always-on */
    qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */

This clock is required for GDSC transitions, so let's add the
CLK_IGNORE_UNUSED flag so that it is not shutdown during the unused
clock sweep.

This was tested on a Lenovo Thinkpad x13s.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Suggested-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e..9a525347fb2a 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -1766,7 +1766,7 @@ static struct clk_branch camcc_gdsc_clk = {
 				&camcc_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
+			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
 			.ops = &clk_branch2_ops,
 		},
 	},

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260701-sc8280xp-camcc-gdsc-clk-113497a99f6f

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


