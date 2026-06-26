Return-Path: <linux-arm-msm+bounces-114699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jX8DJSSqPmrLJwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:34:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A636CF25C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:34:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=Si852O2O;
	dkim=pass header.d=redhat.com header.s=google header.b=llJEw0Lp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114699-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114699-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6E2E30D6978
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7983FAE1A;
	Fri, 26 Jun 2026 16:27:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A033F9F26
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:27:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782491237; cv=none; b=qCtUCxO45M5xSG38vVbm/kJtPLxCk3OVbyqPoKF9Ve+MgCSiOl+PTOGspSAUjq6HUHY6STYvMBvem+ePVCLAsTYieZA4eVbLgOlQqf3u46ofH60nc6Y6hnULUd2i+/3Mt2dnItqOuZMdrhuSmYKVdz2+5cEUDjcZGR8knMrkB58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782491237; c=relaxed/simple;
	bh=/xPtRf9h640L0st1kQdoPeLkZA5DWVw0vwvLxaUC1z8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h6GyOuj/NEQX40mnWaDYGE+9kO1Ekabz+fn8WCJuDr/RNaSjQKMe3MKfAdnaBEcK6JK/jV6LIu7FN2qO4wCyCssaaGrtjTrk9n+xS/21zo1xIBA1ANryuCZfLsQntMN1DtxI0/X57/0Pm0i3HcRWrNsiRuXRI4bSHtEXvFBC8Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Si852O2O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=llJEw0Lp; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782491234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OH9AgO5IGQm1EQUN9NPt6bY+A8mHbJkrvaUgy5yBKLY=;
	b=Si852O2OSmQ7Q087q4IGXVWQfnnfWLlkCCUGPaC/Z1DtRobeAlA+XBx2KMFf2Z3CMmdZ7I
	PGFWksWnxW117wEZ021b5mpIbDdutgUnHv4aNgIBdUTOBPCXqYNnf8vNvJren8m1yYvs+K
	bt+KgInz/V5cU/ho5+y8NXbT1PGDx5o=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-E-wQFrDFOi-NG4459dutPQ-1; Fri, 26 Jun 2026 12:27:10 -0400
X-MC-Unique: E-wQFrDFOi-NG4459dutPQ-1
X-Mimecast-MFC-AGG-ID: E-wQFrDFOi-NG4459dutPQ_1782491230
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92b447639d3so40926685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782491230; x=1783096030; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OH9AgO5IGQm1EQUN9NPt6bY+A8mHbJkrvaUgy5yBKLY=;
        b=llJEw0LpVhKzWaacuJPj6dRfIDzpsStMoUEbzjfsGUrPy2H29dl5AYOtszx3Yt+h+Z
         VhJ6lo8f3fZsiqDsTgX1XbKhD7rBNEudZ7ZYMzpYIKIm1XkGgUEF9pfLuKQCzL6Rw30x
         pUGdy97LWQ9l8GVo7FGAwFJ1mMnqHI8uNZidbRCwJNE8WhULs75kbalRmwxjkM9dK6pm
         daOCxoVKPxgiDabiswaQBSIWuRnCl+UzfBgXPsDBTXejYoEKtwyfMGYTl5batx9oKaN5
         Hk4UyLkCPtgp5pSvHFlca+WPy0ddiL4qYIEBqXLFNuK6RdN2qbTxp4Iji3jx3rzJWseR
         E/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782491230; x=1783096030;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH9AgO5IGQm1EQUN9NPt6bY+A8mHbJkrvaUgy5yBKLY=;
        b=aXgbkz0xoKN/Ay4v2iPZyG2tgMZ+dY3i4JGACgIHVmXwta8R6rvBKWcZXJbuETKZWU
         o1t/lyy5DDJf6AQ+SrAWPTLPwm8744iOxznn1ysDWsB9XZX8MMmA+a8kpxlnpY/Et+Dd
         2QjyEdhoLgG7x8nymEswA9lvxbraX/uufjAp5Gzkre5pWqvEbs/GZVDulZDgLDXh9P+p
         b5d/2DK5qLkfKPORA4MUaPhCReibpEAbesDPEvD6xiM0k39Dk/uYIQi63GV2e/99hRGR
         6ks7ep6rqUC7IfAVeAzyDgVe5fUBIOjNi6wiEG+pU1UIKfPPFDgy/OQZSyX0ZHrpEB7f
         W9hA==
X-Gm-Message-State: AOJu0Yw4DI2Dp0ZLZHrN+Gzh4uAGPKiAU5nhhJygAP3U7EK9czHkDV1l
	4vqZCjyqUEqnl7Es1epv4uLCS2IY5z4cgJj0Gmxem5UAyReZV197hob5z5p02Enbkfn5AwMBW+u
	SBpWbToyvlg+lw3r9jYqgDGvTQkvEqKJBKy/vFLuoLdqO7cSUDotxsdmv7nbFIvwfQVM=
X-Gm-Gg: AfdE7ckD12jLdUIaIWT9E7t15pb4ZUcJnYKA8a6kJRJmmOS6ct3AKbkqZsBV2OisQuN
	DzywGHy9i7pLnqxKimHnPGt4m8xSWuF9jkuD/VWbsYWSy5pv0oMIgmL5eW46XEq6Svmjj0DDh/O
	nUYbu0cJO/qird9c4q3CZ1dB0NwkDqsyYaq/UJQJfoKMnhNEuHruUORd+F2fJPcuQ3aX9YbDiyE
	HGQAkLkMmcsX7Q02DVqLIk3WjwFCr1URHV83ReeWtVi68XZJZAiSiJTzrHdPPVTRU49YU8GhB4M
	cm9hRS96hkSN8APwQgU+z1p3+Gi+J08hPBUxgA1iDr7+76g4YmY/ctUnbXY989aPUsSUK42PIju
	SVHUI22eXD0jDTC0ep6jhGOOu7tiDY4YPy+OTEZpB9mF5NYFM4A==
X-Received: by 2002:a05:620a:2783:b0:915:675d:a2d with SMTP id af79cd13be357-9293e3beed4mr1155259285a.51.1782491229833;
        Fri, 26 Jun 2026 09:27:09 -0700 (PDT)
X-Received: by 2002:a05:620a:2783:b0:915:675d:a2d with SMTP id af79cd13be357-9293e3beed4mr1155231685a.51.1782491226646;
        Fri, 26 Jun 2026 09:27:06 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-925fd390e76sm1199391485a.3.2026.06.26.09.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 09:27:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 26 Jun 2026 12:26:41 -0400
Subject: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqEMAxA0atI1gZq0ahzFZlFjVGzmFraMgji3
 S0u3+L/C5JElQSf6oIof016+IKmroB35zdBXYrBGkuGLCG7HzMmHuxgzoBZs/OYj4DNSLxS3/V
 zO0LJQ5RVz3c9fe/7AW7pJMVqAAAA
X-Change-ID: 20260626-camcc-sc8280xp-titan-top-196cf6757b49
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5375; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=/xPtRf9h640L0st1kQdoPeLkZA5DWVw0vwvLxaUC1z8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLsVoQVzfz/dKOg1EPWdUqccqtDPb+EXkuNW7jwmr/3/
 +knWqM2dpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARjWCG/57CEp35hUXX/m07
 +nu6M9uHS7kKCwPqDE9PNpjv+GXXLm5GhmcnNM/zidyTSdo6p+5s2akZaRI7Hu3L/3as6kwk03G
 Pfg4A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[vger.kernel.org:server fail,tor.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-114699-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bmasney@redhat.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 27A636CF25C

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

Let's go ahead and add the flag ALWAYS_ON to titan_top_gdsc so that it
is not disabled in the unused clock sweep.

Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-6
---
 drivers/clk/qcom/camcc-sc8280xp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
index 18f5a3eb313e..52e1a786083f 100644
--- a/drivers/clk/qcom/camcc-sc8280xp.c
+++ b/drivers/clk/qcom/camcc-sc8280xp.c
@@ -2803,7 +2803,7 @@ static struct gdsc titan_top_gdsc = {
 	.pd = {
 		.name = "titan_top_gdsc",
 	},
-	.flags = RETAIN_FF_ENABLE,
+	.flags = ALWAYS_ON | RETAIN_FF_ENABLE,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

---
base-commit: 6c94b38b83a04c43ea49004275f0391404051093
change-id: 20260626-camcc-sc8280xp-titan-top-196cf6757b49

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


