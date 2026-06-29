Return-Path: <linux-arm-msm+bounces-114990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AicDIwpSQmr/4gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:07:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF5B6D930A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:07:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=aguxx8OP;
	dkim=pass header.d=redhat.com header.s=google header.b=ReTihSDN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114990-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114990-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01D5D301DD8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2091338593;
	Mon, 29 Jun 2026 11:07:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D18A346AFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:07:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782731272; cv=none; b=rODRcI7YwI7GCNhQBy/sfx/Q69BzIvDtwPNRZuby2N2uwD4c1imxc15yF3Zl2j/yAIl5jzd77s4riGjr4poKl7WnWGG/YZznQGjs69BCMJyLxbibMAI7VOJWnh8YCFCY7pVO2GP+OnKN3cnggIkcXDbA7WBpkgwoRUIdv95S5hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782731272; c=relaxed/simple;
	bh=Lor7gJ8V8+wxyAWALctRfgBM9XvrQWK9zg2WLSKS7hI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=duZRQ3AQ/uZAuHqsh6bATMzZ1OhSHBcI1PpUNr/mnaV90ue8Cnc/qUjLIDMadR5lijcKbr8/cPntnvyWUNK+y2ak4VIgp49MUaXM3FfJN9l4zsuxYkhGYEJxmN5QWTKPxv8fgJBkSk3z6T38pVZsvbFSr99yCGDQQHU/aqXxTvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aguxx8OP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ReTihSDN; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782731270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pojPlvqxqWoRbloWL+lScPJutLJi6w2eMZlHbjxXR2E=;
	b=aguxx8OPziJku+wanWpJTAdR6LoE3rcrhbsmq6rNMBwwS7BTOr23FtQTOQnRBv1gWXjXNY
	3sb/bfc71XDPY4iY8gjgMw45wdRW6J3BOC20l1pbz8d/KgJZnHLbKFzMJGPFiFjVM1uWNO
	U08OBYC4t56BH0PObJx8Ks3R+CE887k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-KKwRbVJSMwmI4WqBiEJ9-A-1; Mon, 29 Jun 2026 07:07:48 -0400
X-MC-Unique: KKwRbVJSMwmI4WqBiEJ9-A-1
X-Mimecast-MFC-AGG-ID: KKwRbVJSMwmI4WqBiEJ9-A_1782731268
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ec3314f65fso43318586d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782731268; x=1783336068; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pojPlvqxqWoRbloWL+lScPJutLJi6w2eMZlHbjxXR2E=;
        b=ReTihSDN8aKwRNpZ8utFBQyx6A5/1CJumojv9FIt9QmQfPTPM3yw9NtVL7e8tP406K
         OPNWzuGM3CV8wkbCJfNXZqME6/KH96UB8FnHM29i7ikGcYVBuGpbTVe7VZH6VVvhfcLn
         sR4CW4PKR4/RyZtk9D45rDJEo3RqwB4d7+PouSP9R7D+TruSGckj6M3BAljqEzx7Xx33
         gfG2ZfWsBQtgro+VJY5JoRNjt2CuRPzR09jPQMHrpUKrwibsF1xwm6fXvI8bOqIAf9xQ
         BkFxxGAsuup/iwtAMJDJC35tsi//2Li7q//4xGsug2Hp3EZnfAre5fO+kkwHMu920NCg
         a0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782731268; x=1783336068;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pojPlvqxqWoRbloWL+lScPJutLJi6w2eMZlHbjxXR2E=;
        b=Df68LEBZ6Y2Fo3ILTRmSV2gimSIDFxA4+s8tDr4ymLXrwtbZ0Sj7d/f5JLi/T1fLWd
         agU20mpumUDkzyh2GeQOImIPU7KNJJWc4hWLS7smL2BCzRt3uUAc+UMlR2gNTKDTIxWC
         Jy70Mw4CuJM1ekyxH2Cj1fMjQ14BfS4l+rynemA30NUnD25C6DewquysH7Of7CLqJfj9
         pREdAtocgIAPnZq6Z4BwFY7qHCnZKvNvwEd1DIawgFH1qVycf+KKNFW36DfIdOvMq5Vi
         I1bIFOdcnsrudKBMMtf+2EriYGmyvT1vCG/hUSoIuaGKaRKoU4/7R6g1aiiTrkTVxCff
         Kd0g==
X-Forwarded-Encrypted: i=1; AHgh+RqbagGUNCDZYUYYptVgBTz4Mr1P39EdPS670+bakDqzQJWCislDwxXzYjiOmEKKlJdL0wXYFSEXqXku7HcO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IYsp7gbYuyvUKhSbp6tLmSA+s9Y9im5N0G+Tj6QSu4hMTuOw
	1biA5nI8tK8ZwYutRuCVh2pNHLc9dHIUrqU7axM9td9RxmK267nPUbpiSdCHLozCFXo5CXazdei
	M/Wr5MZvzebvOcL05MJJjxpknMLZtTXFPstEekadDdk6wQSZYlkc2vHjtkZgNS75HOuw=
X-Gm-Gg: AfdE7cl3UtR6wZ+BaETAlZjVOArh0DsYk23JAnbDckf6ep1LJqRQN9tadRn5WotsJlX
	DbfRJQ7/PAcdToalUMRwQ5xl2iEHRAvkOryrUbapn5PMEkJXdNIFF03b3kuokK0UX07KfyC3ZET
	87DHMOep51WdUkhxvFixFAnqtj7rREg/MNFVwUdHZsKatVQagyeNWM8zlwhhb9GaBNwNCos7dpQ
	hPoWbpW3A4N/l3Y/Iya0Tvd7fcOMvdFNRyytJ52gvdUoMy6PvAcZFq2CqfBJ6IqbC6nSwnzhIf0
	TJ4D8WkZBWRb4wQGHsuEf2Hb1V8iCmpqqM3A1YRWhLbsMT2I4tR+IwWVA0McbIvzS35psbE5n2h
	LnyVZstukknQ0lc2Qkfz20oZ4io/jptMcRs6o0QW7WKYQdA==
X-Received: by 2002:a05:6214:2465:b0:8ef:aad6:dada with SMTP id 6a1803df08f44-8efaad6dc1amr59166986d6.20.1782731267707;
        Mon, 29 Jun 2026 04:07:47 -0700 (PDT)
X-Received: by 2002:a05:6214:2465:b0:8ef:aad6:dada with SMTP id 6a1803df08f44-8efaad6dc1amr59166266d6.20.1782731267043;
        Mon, 29 Jun 2026 04:07:47 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde21csm303342486d6.26.2026.06.29.04.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:07:46 -0700 (PDT)
Date: Mon, 29 Jun 2026 07:07:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Message-ID: <akJSAHEJXZkLp_0H@redhat.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <c7dca61e-ac37-4d3e-ae4b-c81cca424e0b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7dca61e-ac37-4d3e-ae4b-c81cca424e0b@linaro.org>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114990-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:vladimir.zapolskiy@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bryan.odonoghue@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDF5B6D930A

Hi Vladimir,

On Fri, Jun 26, 2026 at 07:59:53PM +0300, Vladimir Zapolskiy wrote:
> On 6/26/26 19:26, Brian Masney wrote:
> > With the introduction of sync_state support in the clk and pmdomain
> > subsystems, the following warning happens when the unused clocks are
> > shutdown in camcc-sc8280xp:
> > 
> >      [   15.408367] titan_top_gdsc status stuck at 'on'
> >      [   15.408429] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x14c/0x160, CPU#2: kworker/u32:1/14
> >      [   15.408462] Modules linked in: bnep vfat fat ath11k_pci(+) ath11k mac80211 cfg80211 mhi libarc4 snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_wcd_classh hci_uart snd_soc_wcd_common
> >      snd_soc_sc8280xp soundwire_qcom snd_soc_wcd_mbhc snd_soc_qcom_sdw slimbus snd_soc_qcom_common regmap_sdw btqca btrtl qcom_camss soundwire_bus btbcm btintel snd_soc_sdca snd_soc_lpass_wsa_macro
> >      bluetooth snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_rx_macro snd_soc_hdmi_codec snd_soc_lpass_macro_common videobuf2_dma_sg ov5675 v4l2_fwnode videobuf2_memops
> >      qcom_spmi_adc5 snd_soc_core qcom_spmi_adc_tm5 videobuf2_v4l2 snd_seq snd_seq_device videobuf2_common v4l2_async qcom_vadc_common qcom_spmi_temp_alarm pm8941_pwrkey industrialio videodev
> >      snd_compress rfkill ac97_bus snd_pcm_dmaengine qcom_tsens mc qcom_edac snd_pcm pci_pwrctrl_pwrseq qcom_cpufreq_hw snd_timer snd qcomtee soundcore tee leds_gpio joydev binfmt_misc zram
> >      lz4hc_compress governor_simpleondemand panel_edp msm xhci_plat_hcd nvme nvme_core dwc3 qcom_pm8008_regulator
> >      [   15.408688]  ucsi_glink nvme_keyring nvme_auth pmic_glink_altmode udc_core typec_ucsi aux_hpd_bridge qcom_battmgr ulpi ubwc_config socinfo ocmem drm_gpuvm qcom_q6v5_pas drm_exec
> >      qcom_pil_info leds_qcom_lpg gpu_sched led_class_multicolor rtc_pm8xxx qcom_pbs qcom_common drm_display_helper qcom_pon qcom_glink_smem qcom_glink ghash_ce pwrseq_qcom_wcn gpio_sbu_mux
> >      qcom_stats phy_qcom_qmp_combo qcom_q6v5 gf128mul cec dispcc_sc8280xp phy_qcom_edp camcc_sc8280xp i2c_qcom_cci qcom_sysmon drm_dp_aux_bus mdt_loader aux_bridge qcom_pm8008 i2c_hid_of_elan
> >      dwc3_qcom_legacy llcc_qcom icc_bwmon gpi typec qcom_refgen_regulator phy_qcom_qmp_usb nvmem_qfprom qcom_ipcc phy_qcom_snps_femto_v2 gpucc_sc8280xp pinctrl_sc8280xp_lpass_lpi qcom_hwspinlock
> >      pinctrl_lpass_lpi lpasscc_sc8280xp qrtr qcom_aoss pmic_glink pdr_interface phy_qcom_qmp_pcie qcom_smd qcom_pdr_msg icc_osm_l3 qcom_wdt qmi_helpers qcom_rng smp2p rpmsg_core gpio_keys pwm_bl
> >      smem hid_multitouch fuse i2c_dev
> >      [   15.408928] CPU: 2 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted 7.1.0+ #2 PREEMPT(lazy)
> >      [   15.408937] Hardware name: LENOVO 21BX0016US/21BX0016US, BIOS N3HET88W (1.60 ) 03/14/2024
> >      [   15.408942] Workqueue: pm pm_runtime_work
> >      [   15.408959] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> >      [   15.408967] pc : gdsc_toggle_logic+0x14c/0x160
> >      [   15.408978] lr : gdsc_toggle_logic+0x14c/0x160
> >      [   15.408987] sp : ffff8000800f3b40
> >      [   15.408991] x29: ffff8000800f3b40 x28: 0000000000000000 x27: 0000000000000000
> >      [   15.409003] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
> >      [   15.409014] x23: 0000000000000000 x22: 0000000000000001 x21: ffffa33f298fca88
> >      [   15.409024] x20: 0000000000000000 x19: ffffa33f298fc5b0 x18: 00cd15db75dacefd
> >      [   15.409035] x17: 000000040044ffff x16: ffffa33f3b1a3d88 x15: 726f776b80000002
> >      [   15.409045] x14: ffffffffffffffff x13: 0000000000000028 x12: 0101010101010101
> >      [   15.409056] x11: 7f7f7f7f7f7f7f7f x10: fefeff3039313274 x9 : ffffa33f3a5edafc
> >      [   15.409067] x8 : ffff8000800f3780 x7 : 0000000000000001 x6 : 0000000000000001
> >      [   15.409078] x5 : ffff000bf3ca1288 x4 : 0000000000000000 x3 : ffff5cccb6a3f000
> >      [   15.409088] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080ae0000
> >      [   15.409098] Call trace:
> >      [   15.409103]  gdsc_toggle_logic+0x14c/0x160 (P)
> >      [   15.409115]  gdsc_disable+0x4c/0x190
> >      [   15.409126]  _genpd_power_off+0xa0/0x1a8
> >      [   15.409137]  genpd_power_off.part.0+0x180/0x2a0
> >      [   15.409149]  genpd_runtime_suspend+0x218/0x310
> >      [   15.409155]  __rpm_callback+0x50/0x1f8
> >      [   15.409166]  rpm_callback+0x7c/0x90
> >      [   15.409175]  rpm_suspend+0xe8/0x690
> >      [   15.409185]  pm_runtime_work+0xd0/0xe0
> >      [   15.409195]  process_one_work+0x18c/0x518
> >      [   15.409208]  worker_thread+0x190/0x320
> >      [   15.409218]  kthread+0x110/0x130
> >      [   15.409227]  ret_from_fork+0x10/0x20
> > 
> > Let's go ahead and add the flag ALWAYS_ON to titan_top_gdsc so that it
> > is not disabled in the unused clock sweep.
> > 
> > Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> 
> I don't think that the given backtrace (or the analysis) point to some
> problem in the clock controller driver definitely.
> 
> If the problem is caused by "the introduction of sync_state support in
> the clk and pmdomain subsystems", then it would make sense to fix it
> instead, it's unclear that the problem exists beyond this applied series.

This is a separate issue outside of this series. With the current tree,
sc8280xp (Thinpad x13s) needs to be booted with clk_ignore_unused. With
the clk sync_state support, the x13s can be booted without
clk_ignore_used and without pd_ignore_unused.

Brian


