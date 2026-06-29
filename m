Return-Path: <linux-arm-msm+bounces-114988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t4eBJpxQQmq64gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:01:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D5ED16D9271
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:01:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=fNBMWNk8;
	dkim=pass header.d=redhat.com header.s=google header.b=dpjNoDlb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114988-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114988-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF1B530008A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CD2346AFD;
	Mon, 29 Jun 2026 11:01:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E004361DBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:01:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730892; cv=none; b=q+qnPKFOQvDyHH8QaJmaNrpwuDi9gamPwZt49d2zAIpyIYoJF0eu1TSdf7Z93c/ptKf9Q4o13C3/ajEGGnhiEAxWZw2kYJggZaf6Rw3zwJ38pqVzIsr8KZFOgYTwZBVe8baa7kAFNA0pUH4LNarArcYT1EkYsOj89hHKBsVPGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730892; c=relaxed/simple;
	bh=nrhYlh257lUgWAkodaZloS8rzPr1GD3c2GGYpEpByC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XMaS3yXVcWoGlCt61DJAGv0kq472s76KjJGJVch/9ei0i/WzvDMMa947gqIrKqj2cqEgn21r4Vl07HCwSV1k+ukOCGugDG4kOOv8JQqRiFsgaMKsLin0Xsq7XdrHIy1d9u7avVPHyJHQ6UFJGVj1vYejAk7hVMOI6nDRUW7dxso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fNBMWNk8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dpjNoDlb; arc=none smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782730887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7RsNfWfMM8uHkHUJ+MzXZP6rjt/1xZO2jL48JX+WEec=;
	b=fNBMWNk8teanrpWw9qqolNqruIxYFgUXbFwQHBvwoq2qszjwdnk5uKgX7ECc+/1TfeSKEk
	6L0v08deUcKoMGNBhL3LLEvPDKPJ1U+McRfiOkTPXSzbWoBBiMpXv94i4odmSffkcAyQWk
	8hc/nFoGbrOx6Aj8IGFWVYUao6v3Jbo=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-OCIQkxM-PMGcyfsKHtIe3A-1; Mon, 29 Jun 2026 07:01:25 -0400
X-MC-Unique: OCIQkxM-PMGcyfsKHtIe3A-1
X-Mimecast-MFC-AGG-ID: OCIQkxM-PMGcyfsKHtIe3A_1782730884
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ec235c7c66so26870706d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782730884; x=1783335684; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RsNfWfMM8uHkHUJ+MzXZP6rjt/1xZO2jL48JX+WEec=;
        b=dpjNoDlbklObWlv+hMHbRKLxUhgtxpTEcu1EO7X0q9hPn1WGPIx8/dI/2ZtyAmvBmJ
         GU44eLYj6uH1TNBIxtGuz2HxnZB9+oB1ZvcjyNx8G0hPoOK31+gAEPnPezw7GVipNqgI
         bjah71INreeqGAZ6k8wRih6/wH3tJzU7Db9tLDVk/LyQpArdAxz+iT51BMBl+9V7Od82
         3ImtsEkVF1+FrEzTDPjDnXwa7OC3rGdPCvjhab4tZ9A3Tz7SsFXSt2lPLAIiDV/OnBiX
         ca7uLlbl8ibNUBtgSOg1xd+ClTRONhSMnv4ZZ/gmjpQ8zb18d10UCvp/gN4rYn1e0+r0
         VAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730884; x=1783335684;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7RsNfWfMM8uHkHUJ+MzXZP6rjt/1xZO2jL48JX+WEec=;
        b=paruf9d2aBJp1RNOcp6N1cw8ceglFzbOsTnqenYGzYJmn4elyYKEWPUe9W8qDs1Zea
         bZ8D3QzidU2K8gCxg4FdxFwTNhboJEu8YtDkd4tdZuu3fUXSm7jCwP6gUxjy77CvczK7
         FV+IJuj3UngYlQ9pWiN6j0ztN35+DstP/4adVTfX/Ov/9TwbKHak8xBMpSPDJLqCKMw2
         nI0MxDx1/D87C4hC3QWtSlyLK0TsjTb9lSDfHFwarNA8J3KrBUpQmSDRtrRftn4ci5kC
         4JObFCt+87h2Uk4uZzW4imKuJyHhBx1K30kMhYyhHW3YPHFLX7nAR+V/SIXkzSU8gRXI
         2eWw==
X-Forwarded-Encrypted: i=1; AHgh+RpUwd/N/rgLajkuil0p836eqxOvnB/YiIOB/HBloTAWMmUHAyLlalSgM/fLyWvYrnUH3HqXakG1KoiCYous@vger.kernel.org
X-Gm-Message-State: AOJu0Yw444O/+i5Qku+E1y7cEML7rFLVRkNtEiy4jDQlWgCEZiKsCCjE
	1GEQ4WyDxoGBxThRSr1EaRWxhNveEo3rbO/HKAzaEroQ3fzTRN6dlrZrZqgqlx864/HhqR7DzQ3
	4hp0ZhzrIZDk1wUJtgOHlDrz88I5BiNQVU5nVLCs+cWGdK8z7b2m5V/tofJ7eqT3ojqM=
X-Gm-Gg: AfdE7cnasBMq2L447zIYpJYmvtCbJmie4b6SPswAX6dOIzjCcFFotKaOrzCCCFFjFJ6
	EJOEDq2dY0W/hOWMA7hHGa4w/T5hN0wCN0HF2d0w5TuIj0lBWDyLQmgZWttA5b2vIbpx+U+7kwG
	roTGhd+VOAfmttnrFHyJVbAiCFwxTexUO3pUghJD9+Tm48bYKt10PZ23HL9kDXqZEaaguo3m5bV
	Ym/ODYtuEYMZIRy+oWNBYnCxllYJvnG5DTEoboP6zocTXjw2dxaRF2RDq9BJ/hj3gx+8/qryluo
	MIsOy8nipBtjCFaR61l6FBFexzYEqwKJ+e+AuHVCf1xZW8gaB1DvVJsAOE/u2O1xfyOrJcf2RlK
	j5smQdG3GT/y8LEerg6kGZsxaOeAszENWamiVdwWHn15ktg==
X-Received: by 2002:a05:6214:8010:b0:8e8:f58a:9a5f with SMTP id 6a1803df08f44-8e8f58a9bdfmr150335486d6.20.1782730882991;
        Mon, 29 Jun 2026 04:01:22 -0700 (PDT)
X-Received: by 2002:a05:6214:8010:b0:8e8:f58a:9a5f with SMTP id 6a1803df08f44-8e8f58a9bdfmr150334776d6.20.1782730881360;
        Mon, 29 Jun 2026 04:01:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7fbdd5f1sm308531596d6.21.2026.06.29.04.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 04:01:19 -0700 (PDT)
Date: Mon, 29 Jun 2026 07:01:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
Message-ID: <akJQfVknZ1-lpMfI@redhat.com>
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
 <556dc88a-42c0-4d5a-8a37-bc4959d72ffa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="U0T/PANy/l6FuuPA"
Content-Disposition: inline
In-Reply-To: <556dc88a-42c0-4d5a-8a37-bc4959d72ffa@linaro.org>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_ATTACHMENT(0.00)[];
	TAGGED_FROM(0.00)[bounces-114988-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bryan.odonoghue@linaro.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5ED16D9271


--U0T/PANy/l6FuuPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bryan and Vladimir,

On Sat, Jun 27, 2026 at 10:51:47AM +0100, Bryan O'Donoghue wrote:
> On 26/06/2026 17:26, Brian Masney wrote:
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
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > Assisted-by: Claude:claude-opus-4-6
> > ---
> >   drivers/clk/qcom/camcc-sc8280xp.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> > index 18f5a3eb313e..52e1a786083f 100644
> > --- a/drivers/clk/qcom/camcc-sc8280xp.c
> > +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> > @@ -2803,7 +2803,7 @@ static struct gdsc titan_top_gdsc = {
> >   	.pd = {
> >   		.name = "titan_top_gdsc",
> >   	},
> > -	.flags = RETAIN_FF_ENABLE,
> > +	.flags = ALWAYS_ON | RETAIN_FF_ENABLE,
> >   	.pwrsts = PWRSTS_OFF_ON,
> >   };
> > 
> > ---
> > base-commit: 6c94b38b83a04c43ea49004275f0391404051093
> > change-id: 20260626-camcc-sc8280xp-titan-top-196cf6757b49
> > 
> > Best regards,
> 
> If it is stuck at on, that is almost certainly because one of the child
> gdscs is still on.
> 
> Hmm, I should probably fix my bootloader on x13s and see if I can repliate
> this bug.

I tried with Vladimir's patch series that he referenced and the issue
still occurs with that. I'll post more details to his message with the change
I had to make.

All of the child gdscs appear to be off:

root@fedora:/home/masneyb# cat /sys/kernel/debug/pm_genpd/titan_top_gdsc/current_state 
on
root@fedora:/home/masneyb# cat /sys/kernel/debug/pm_genpd/titan_top_gdsc/sub_domains 
bps_gdsc
ife_0_gdsc
ife_1_gdsc
ife_2_gdsc
ife_3_gdsc
ipe_0_gdsc
ipe_1_gdsc
root@fedora:/home/masneyb# cat /sys/kernel/debug/pm_genpd/bps_gdsc/current_state 
off-0
root@fedora:/home/masneyb# cat /sys/kernel/debug/pm_genpd/ife_0_gdsc/current_state 
off-0
root@fedora:/home/masneyb# cat /sys/kernel/debug/pm_genpd/ife_1_gdsc/current_state 
off-0
root@fedora:/home/masneyb# cat /sys/kernel/debug/pm_genpd/ife_2_gdsc/current_state 
off-0
root@fedora:/home/masneyb# cat /sys/kernel/debug/pm_genpd/ife_3_gdsc/current_state 
off-0
root@fedora:/home/masneyb# cat /sys/kernel/debug/pm_genpd/ipe_0_gdsc/current_state 
off-0
root@fedora:/home/masneyb# cat /sys/kernel/debug/pm_genpd/ipe_1_gdsc/current_state 
off-0

I also attached the contents of pm_genpd_summary and clk_summary.

Brian

--U0T/PANy/l6FuuPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=clk_summary

                                 enable  prepare  protect                                duty  hardware                            connection
   clock                          count    count    count        rate   accuracy phase  cycle    enable   consumer                         id
---------------------------------------------------------------------------------------------------------------------------------------------
 LPASS_HW_DCODEC                     5       5        0        0           0          0     50000      Y   3240000.codec                   dcodec                   
                                                                                                           3220000.txmacro                 dcodec                   
                                                                                                           3200000.rxmacro                 dcodec                   
                                                                                                           3370000.codec                   dcodec                   
                                                                                                           pinctrl@33c0000                 no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 LPASS_HW_MACRO                      5       5        0        0           0          0     50000      Y   3240000.codec                   macro                    
                                                                                                           3220000.txmacro                 macro                    
                                                                                                           3200000.rxmacro                 macro                    
                                                                                                           3370000.codec                   macro                    
                                                                                                           pinctrl@33c0000                 no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK  0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK   0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_WSA2_CORE_TX_MCLK      0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_WSA_CORE_TX_2X_MCLK    2       2        0        19200000    0          0     50000      Y   3240000.codec                   npl                      
                                                                                                           deviceless                      no_connection_id         
    mclk                             1       1        0        9600000     0          0     50000      Y      3250000.soundwire               iface                    
                                                                                                              deviceless                      no_connection_id         
 LPASS_CLK_ID_WSA_CORE_TX_MCLK       2       2        0        19200000    0          0     50000      Y   3240000.codec                   mclk                     
                                                                                                           deviceless                      no_connection_id         
 LPASS_CLK_ID_RX_CORE_TX_2X_MCLK     1       1        0        19200000    0          0     50000      Y   3200000.rxmacro                 npl                      
                                                                                                           deviceless                      no_connection_id         
    lpass-rx-mclk                    0       0        0        9600000     0          0     50000      N      3210000.soundwire               iface                    
                                                                                                              deviceless                      no_connection_id         
 LPASS_CLK_ID_RX_CORE_TX_MCLK        1       1        0        19200000    0          0     50000      Y   3200000.rxmacro                 mclk                     
                                                                                                           deviceless                      no_connection_id         
 LPASS_CLK_ID_WSA2_CORE_2X_MCLK      0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_WSA2_CORE_MCLK         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_VA_CORE_2X_MCLK        0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_RX_CORE_NPL_MCLK       0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_RX_CORE_MCLK           0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_TX_CORE_NPL_MCLK       3       3        0        19200000    0          0     50000      Y   3220000.txmacro                 npl                      
                                                                                                           3370000.codec                   npl                      
                                                                                                           deviceless                      no_connection_id         
    lpass-tx-mclk                    0       0        0        9600000     0          0     50000      N      3330000.soundwire               iface                    
                                                                                                              deviceless                      no_connection_id         
    fsgen                            3       3        0        19200000    0          0     50000      Y      3240000.codec                   fsgen                    
                                                                                                              3220000.txmacro                 fsgen                    
                                                                                                              3200000.rxmacro                 fsgen                    
                                                                                                              3370000.codec                   fsgen                    
                                                                                                              deviceless                      no_connection_id         
 LPASS_CLK_ID_TX_CORE_MCLK           3       3        0        19200000    0          0     50000      Y   3220000.txmacro                 mclk                     
                                                                                                           3370000.codec                   mclk                     
                                                                                                           deviceless                      no_connection_id         
 LPASS_CLK_ID_VA_CORE_MCLK           0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_WSA_CORE_NPL_MCLK      0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_WSA_CORE_MCLK          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_QUI_MI2S_OSR           0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_INT6_MI2S_IBIT         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_INT5_MI2S_IBIT         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_INT4_MI2S_IBIT         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_INT3_MI2S_IBIT         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_INT2_MI2S_IBIT         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_INT1_MI2S_IBIT         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_INT0_MI2S_IBIT         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_SEN_MI2S_EBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_SEN_MI2S_IBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_QUI_MI2S_EBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_QUI_MI2S_IBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_SPEAKER_I2S_OSR        0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_SPEAKER_I2S_EBIT       0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_SPEAKER_I2S_IBIT       0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_QUAD_MI2S_EBIT         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_QUAD_MI2S_IBIT         0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_TER_MI2S_EBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_TER_MI2S_IBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_SEC_MI2S_EBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_SEC_MI2S_IBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_PRI_MI2S_EBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 LPASS_CLK_ID_PRI_MI2S_IBIT          0       0        0        19200000    0          0     50000      Y   deviceless                      no_connection_id         
 qcom_cpufreq1                       0       0        0        1632000000  0          0     50000      Y   cpu4                            no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 qcom_cpufreq0                       0       0        0        2438400000  0          0     50000      Y   cpu0                            no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 8903000.phy::vco_div_clk            0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    disp0_cc_mdss_dptx1_pixel1_clk_src 0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
       disp0_cc_mdss_dptx1_pixel1_clk 0       0        0        0           0          0     50000      N         deviceless                      no_connection_id         
    disp0_cc_mdss_dptx1_pixel0_clk_src 0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
       disp0_cc_mdss_dptx1_pixel0_clk 0       0        0        0           0          0     50000      N         ae98000.displayport-controller  stream_pixel             
                                                                                                                 deviceless                      no_connection_id         
 8903000.phy::link_clk               0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    disp0_cc_mdss_dptx1_link_clk_src 0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
       disp0_cc_mdss_dptx1_link_div_clk_src 0       0        0        0           0          0     50000      Y         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx1_usb_router_link_intf_clk 0       0        0        0           0          0     50000      N            deviceless                      no_connection_id         
          disp0_cc_mdss_dptx1_link_intf_clk 0       0        0        0           0          0     50000      N            ae98000.displayport-controller  ctrl_link_iface          
                                                                                                                    deviceless                      no_connection_id         
       disp0_cc_mdss_dptx1_link_clk  0       0        0        0           0          0     50000      N         ae98000.displayport-controller  ctrl_link                
                                                                                                                 ae98000.displayport-controller  ctrl_link                
                                                                                                                 deviceless                      no_connection_id         
 8903000.phy::pipe_clk               1       1        0        125000000   0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb3_sec_phy_pipe_clk_src    1       1        0        125000000   0          0     50000      Y      deviceless                      no_connection_id         
       gcc_usb34_sec_phy_pipe_clk_src 1       1        0        125000000   0          0     50000      Y         deviceless                      no_connection_id         
          gcc_usb4_1_phy_usb_pipe_clk 0       0        0        125000000   0          0     50000      N            deviceless                      no_connection_id         
          gcc_usb3_sec_phy_pipe_clk  1       1        0        125000000   0          0     50000      Y            8903000.phy                     usb3_pipe                
                                                                                                                    deviceless                      no_connection_id         
 aec5a00.phy::vco_div_clk            1       1        0        1350000000  0          0     50000      Y   deviceless                      no_connection_id         
    disp0_cc_mdss_dptx3_pixel0_clk_src 1       1        0        76875000    0          0     50000      Y      deviceless                      no_connection_id         
       disp0_cc_mdss_dptx3_pixel0_clk 1       1        0        76875000    0          0     50000      Y         aea0000.displayport-controller  stream_pixel             
                                                                                                                 deviceless                      no_connection_id         
 aec5a00.phy::link_clk               1       1        0        270000000   0          0     50000      Y   deviceless                      no_connection_id         
    disp0_cc_mdss_dptx3_link_clk_src 2       2        0        270000000   0          0     50000      Y      deviceless                      no_connection_id         
       disp0_cc_mdss_dptx3_link_div_clk_src 1       1        0        67500000    0          0     50000      Y         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx3_link_intf_clk 1       1        0        67500000    0          0     50000      Y            aea0000.displayport-controller  ctrl_link_iface          
                                                                                                                    deviceless                      no_connection_id         
       disp0_cc_mdss_dptx3_link_clk  1       1        0        270000000   0          0     50000      Y         aea0000.displayport-controller  ctrl_link                
                                                                                                                 aea0000.displayport-controller  ctrl_link                
                                                                                                                 deviceless                      no_connection_id         
 88eb000.phy::vco_div_clk            0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    disp0_cc_mdss_dptx0_pixel1_clk_src 0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
       disp0_cc_mdss_dptx0_pixel1_clk 0       0        0        0           0          0     50000      N         deviceless                      no_connection_id         
    disp0_cc_mdss_dptx0_pixel0_clk_src 0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
       disp0_cc_mdss_dptx0_pixel0_clk 0       0        0        0           0          0     50000      N         ae90000.displayport-controller  stream_pixel             
                                                                                                                 deviceless                      no_connection_id         
 88eb000.phy::link_clk               0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    disp0_cc_mdss_dptx0_link_clk_src 0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
       disp0_cc_mdss_dptx0_link_div_clk_src 0       0        0        0           0          0     50000      Y         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx0_usb_router_link_intf_clk 0       0        0        0           0          0     50000      N            deviceless                      no_connection_id         
          disp0_cc_mdss_dptx0_link_intf_clk 0       0        0        0           0          0     50000      N            ae90000.displayport-controller  ctrl_link_iface          
                                                                                                                    deviceless                      no_connection_id         
       disp0_cc_mdss_dptx0_link_clk  0       0        0        0           0          0     50000      N         ae90000.displayport-controller  ctrl_link                
                                                                                                                 ae90000.displayport-controller  ctrl_link                
                                                                                                                 deviceless                      no_connection_id         
 88eb000.phy::pipe_clk               1       1        0        125000000   0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb3_prim_phy_pipe_clk_src   1       1        0        125000000   0          0     50000      Y      deviceless                      no_connection_id         
       gcc_usb34_prim_phy_pipe_clk_src 1       1        0        125000000   0          0     50000      Y         deviceless                      no_connection_id         
          gcc_usb4_phy_usb_pipe_clk  0       0        0        125000000   0          0     50000      N            deviceless                      no_connection_id         
          gcc_usb3_prim_phy_pipe_clk 1       1        0        125000000   0          0     50000      Y            88eb000.phy                     usb3_pipe                
                                                                                                                    deviceless                      no_connection_id         
 qdss                                0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 usb2_phy1_pipe_clk                  0       0        0        125000000   0          0     50000      Y   deviceless                      no_connection_id         
 gpu_cc_hlos1_vote_gpu_smmu_clk      2       2        0        0           0          0     50000      Y   gmu@3d6a000                     no_connection_id         
                                                                                                           iommu@3da0000                   no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gpu_cc_sleep_clk                    0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gpu_cc_cxo_aon_clk                  0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gpu_cc_cx_snoc_dvm_clk              0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 usb2_phy0_pipe_clk                  0       0        0        125000000   0          0     50000      Y   deviceless                      no_connection_id         
 pcie_2a_pipe_clk                    1       1        0        125000000   0          0     50000      Y   deviceless                      no_connection_id         
    gcc_pcie_2a_pipe_clk_src         2       2        0        18446744073709551615 0          0     50000      Y      deviceless                      no_connection_id         
       gcc_pcie_2a_pipe_div_clk_src  1       1        0        0           0          0     50000      Y         deviceless                      no_connection_id         
          gcc_pcie_2a_pipediv2_clk   1       1        0        0           0          0     50000      Y            1c24000.phy                     pipediv2                 
                                                                                                                    deviceless                      no_connection_id         
       gcc_pcie_2a_pipe_clk          1       1        0        18446744073709551615 0          0     50000      Y         1c24000.phy                     pipe                     
                                                                                                                 deviceless                      no_connection_id         
 pcie_3a_pipe_clk                    1       1        0        125000000   0          0     50000      Y   deviceless                      no_connection_id         
    gcc_pcie_3a_pipe_clk_src         2       2        0        18446744073709551615 0          0     50000      Y      deviceless                      no_connection_id         
       gcc_pcie_3a_pipe_div_clk_src  1       1        0        0           0          0     50000      Y         deviceless                      no_connection_id         
          gcc_pcie_3a_pipediv2_clk   1       1        0        0           0          0     50000      Y            1c14000.phy                     pipediv2                 
                                                                                                                    deviceless                      no_connection_id         
       gcc_pcie_3a_pipe_clk          1       1        0        18446744073709551615 0          0     50000      Y         1c14000.phy                     pipe                     
                                                                                                                 deviceless                      no_connection_id         
 pcie_4_pipe_clk                     1       1        0        125000000   0          0     50000      Y   deviceless                      no_connection_id         
    gcc_pcie_4_pipe_clk_src          2       2        0        18446744073709551615 0          0     50000      Y      deviceless                      no_connection_id         
       gcc_pcie_4_pipe_div_clk_src   1       1        0        0           0          0     50000      Y         deviceless                      no_connection_id         
          gcc_pcie_4_pipediv2_clk    1       1        0        0           0          0     50000      Y            1c06000.phy                     pipediv2                 
                                                                                                                    deviceless                      no_connection_id         
       gcc_pcie_4_pipe_clk           1       1        0        18446744073709551615 0          0     50000      Y         1c06000.phy                     pipe                     
                                                                                                                 deviceless                      no_connection_id         
 gcc_video_vcodec_throttle_clk       0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_video_cvp_throttle_clk          0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_video_axi1_clk                  0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_video_axi0_clk                  0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_usb4_eud_clkref_clk             1       1        0        0           0          0     50000      Y   88eb000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_usb4_clkref_clk                 1       1        0        0           0          0     50000      Y   8903000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_usb4_cfg_ahb_clk                0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_usb4_1_cfg_ahb_clk              0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_usb3_mp1_clkref_clk             1       1        0        0           0          0     50000      Y   88f1000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_usb3_mp0_clkref_clk             1       1        0        0           0          0     50000      Y   88ef000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_usb30_sec_sleep_clk             1       1        0        0           0          0     50000      Y   usb@a8f8800                     no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_usb30_prim_sleep_clk            1       1        0        0           0          0     50000      Y   usb@a6f8800                     no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_usb30_mp_sleep_clk              1       1        0        0           0          0     50000      Y   usb@a4f8800                     no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_usb2_hs3_clkref_clk             1       1        0        0           0          0     50000      Y   88ea000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_usb2_hs2_clkref_clk             1       1        0        0           0          0     50000      Y   88e9000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_usb2_hs1_clkref_clk             1       1        0        0           0          0     50000      Y   88e8000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_usb2_hs0_clkref_clk             1       1        0        0           0          0     50000      Y   88e7000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_ufs_phy_ahb_clk                 0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_ufs_card_ahb_clk                0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_sys_noc_usb_axi_clk             3       3        0        0           0          0     50000      Y   usb@a8f8800                     no_connection_id         
                                                                                                           usb@a6f8800                     no_connection_id         
                                                                                                           usb@a4f8800                     no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_sdcc4_ahb_clk                   0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_sdcc2_ahb_clk                   0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 gcc_qupv3_wrap_2_s_ahb_clk          1       1        0        0           0          0     50000      Y   8c0000.geniqup                  s-ahb                    
                                                                                                           deviceless                      no_connection_id         
 gcc_qupv3_wrap_2_m_ahb_clk          1       1        0        0           0          0     50000      Y   8c0000.geniqup                  m-ahb                    
                                                                                                           deviceless                      no_connection_id         
 gcc_qupv3_wrap_1_s_ahb_clk          0       0        0        0           0          0     50000      N   ac0000.geniqup                  s-ahb                    
                                                                                                           deviceless                      no_connection_id         
 gcc_qupv3_wrap_1_m_ahb_clk          0       0        0        0           0          0     50000      N   ac0000.geniqup                  m-ahb                    
                                                                                                           deviceless                      no_connection_id         
 gcc_qupv3_wrap_0_s_ahb_clk          1       1        0        0           0          0     50000      Y   9c0000.geniqup                  s-ahb                    
                                                                                                           deviceless                      no_connection_id         
 gcc_qupv3_wrap_0_m_ahb_clk          1       1        0        0           0          0     50000      Y   9c0000.geniqup                  m-ahb                    
                                                                                                           deviceless                      no_connection_id         
 gcc_qupv3_wrap2_core_clk            0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 gcc_qupv3_wrap2_core_2x_clk         0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 gcc_qupv3_wrap1_core_clk            0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 gcc_qupv3_wrap1_core_2x_clk         0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 gcc_qupv3_wrap0_core_clk            0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_qupv3_wrap0_core_2x_clk         0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_qmip_video_vcodec_ahb_clk       0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_qmip_video_cvp_ahb_clk          0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_qmip_disp_rot_ahb_clk           0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_qmip_disp_ahb_clk               0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_qmip_disp1_rot_ahb_clk          0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_qmip_disp1_ahb_clk              0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_qmip_camera_rt_ahb_clk          0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_qmip_camera_nrt_ahb_clk         0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pdm_xo4_clk                     0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pdm_ahb_clk                     0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_throttle_cfg_clk           0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_rscc_ahb_clk               0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 gcc_pcie_4_slv_q2a_axi_clk          1       1        0        0           0          0     50000      Y   pcie@1c00000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_4_slv_axi_clk              1       1        0        0           0          0     50000      Y   pcie@1c00000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_4_mstr_axi_clk             1       1        0        0           0          0     50000      Y   pcie@1c00000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_4_clkref_clk               1       1        0        0           0          0     50000      Y   1c06000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_4_cfg_ahb_clk              2       2        0        0           0          0     50000      Y   pcie@1c00000                    no_connection_id         
                                                                                                           1c06000.phy                     cfg_ahb                  
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_3b_slv_q2a_axi_clk         0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_3b_slv_axi_clk             0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_3b_mstr_axi_clk            0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_3b_cfg_ahb_clk             0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_3a_slv_q2a_axi_clk         1       1        0        0           0          0     50000      Y   pcie@1c10000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_3a_slv_axi_clk             1       1        0        0           0          0     50000      Y   pcie@1c10000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_3a_mstr_axi_clk            1       1        0        0           0          0     50000      Y   pcie@1c10000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_3a_cfg_ahb_clk             2       2        0        0           0          0     50000      Y   pcie@1c10000                    no_connection_id         
                                                                                                           1c14000.phy                     cfg_ahb                  
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_3a3b_clkref_clk            1       1        0        0           0          0     50000      Y   1c14000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_2b_slv_q2a_axi_clk         0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_2b_slv_axi_clk             0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_2b_mstr_axi_clk            0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_2b_cfg_ahb_clk             0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_2a_slv_q2a_axi_clk         1       1        0        0           0          0     50000      Y   pcie@1c20000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_2a_slv_axi_clk             1       1        0        0           0          0     50000      Y   pcie@1c20000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_2a_mstr_axi_clk            1       1        0        0           0          0     50000      Y   pcie@1c20000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_2a_cfg_ahb_clk             2       2        0        0           0          0     50000      Y   pcie@1c20000                    no_connection_id         
                                                                                                           1c24000.phy                     cfg_ahb                  
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_2a2b_clkref_clk            1       1        0        0           0          0     50000      Y   1c24000.phy                     ref                      
                                                                                                           deviceless                      no_connection_id         
 gcc_pcie_1_slv_q2a_axi_clk          0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_1_slv_axi_clk              0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_1_mstr_axi_clk             0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_1_cfg_ahb_clk              0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_0_slv_q2a_axi_clk          0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_0_slv_axi_clk              0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_0_mstr_axi_clk             0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_pcie_0_cfg_ahb_clk              0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_gpu_tcu_throttle_clk            0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_gpu_tcu_throttle_ahb_clk        0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_gpu_snoc_dvm_gfx_clk            1       1        0        0           0          0     50000      Y   iommu@3da0000                   no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_gpu_memnoc_gfx_clk              2       2        0        0           0          0     50000      Y   gmu@3d6a000                     no_connection_id         
                                                                                                           iommu@3da0000                   no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_gpu_iref_en                     0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_emac1_slv_ahb_clk               0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_emac1_axi_clk                   0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_emac0_slv_ahb_clk               0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_emac0_axi_clk                   0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_disp_throttle_rt_axi_clk        0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_disp_throttle_nrt_axi_clk       0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_disp_sf_axi_clk                 1       1        0        0           0          0     50000      Y   display-controller@ae01000      no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_disp_hf_axi_clk                 1       1        0        0           0          0     50000      Y   display-controller@ae01000      no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_disp1_throttle_rt_axi_clk       0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_disp1_throttle_nrt_axi_clk      0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_disp1_sf_axi_clk                0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_disp1_hf_axi_clk                0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_ddrss_pcie_sf_tbu_clk           3       3        0        0           0          0     50000      Y   pcie@1c00000                    no_connection_id         
                                                                                                           pcie@1c20000                    no_connection_id         
                                                                                                           pcie@1c10000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_ddrss_gpu_axi_clk               1       1        0        0           0          0     50000      Y   gmu@3d6a000                     no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_cnoc_pcie4_qx_clk               1       1        0        0           0          0     50000      Y   pcie@1c00000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_cnoc_pcie1_tunnel_clk           0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_cnoc_pcie0_tunnel_clk           0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_camera_throttle_xo_clk          0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_camera_throttle_rt_axi_clk      0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_camera_throttle_nrt_axi_clk     0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_camera_sf_axi_clk               0       0        0        0           0          0     50000      N   ac5a000.camss                   gcc_axi_sf               
                                                                                                           ac5a000.camss                   gcc_axi_sf               
                                                                                                           ac5a000.camss                   gcc_axi_sf               
                                                                                                           ac5a000.camss                   gcc_axi_sf               
                                                                                                           ac5a000.camss                   gcc_axi_sf               
                                                                                                           ac5a000.camss                   gcc_axi_sf               
                                                                                                           ac5a000.camss                   gcc_axi_sf               
                                                                                                           ac5a000.camss                   gcc_axi_sf               
                                                                                                           deviceless                      no_connection_id         
 gcc_camera_hf_axi_clk               0       0        0        0           0          0     50000      N   ac5a000.camss                   gcc_axi_hf               
                                                                                                           ac5a000.camss                   gcc_axi_hf               
                                                                                                           ac5a000.camss                   gcc_axi_hf               
                                                                                                           ac5a000.camss                   gcc_axi_hf               
                                                                                                           ac5a000.camss                   gcc_axi_hf               
                                                                                                           ac5a000.camss                   gcc_axi_hf               
                                                                                                           ac5a000.camss                   gcc_axi_hf               
                                                                                                           ac5a000.camss                   gcc_axi_hf               
                                                                                                           deviceless                      no_connection_id         
 gcc_boot_rom_ahb_clk                0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 gcc_ahb2phy2_clk                    0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 gcc_ahb2phy0_clk                    0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 gcc_aggre_usb_noc_south_axi_clk     3       3        0        0           0          0     50000      Y   usb@a8f8800                     no_connection_id         
                                                                                                           usb@a6f8800                     no_connection_id         
                                                                                                           usb@a4f8800                     no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_aggre_usb_noc_north_axi_clk     3       3        0        0           0          0     50000      Y   usb@a8f8800                     no_connection_id         
                                                                                                           usb@a6f8800                     no_connection_id         
                                                                                                           usb@a4f8800                     no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_aggre_usb_noc_axi_clk           3       3        0        0           0          0     50000      Y   usb@a8f8800                     no_connection_id         
                                                                                                           usb@a6f8800                     no_connection_id         
                                                                                                           usb@a4f8800                     no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_aggre_noc_pcie_south_sf_axi_clk 3       3        0        0           0          0     50000      Y   pcie@1c00000                    no_connection_id         
                                                                                                           pcie@1c20000                    no_connection_id         
                                                                                                           pcie@1c10000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_aggre_noc_pcie_4_axi_clk        3       3        0        0           0          0     50000      Y   pcie@1c00000                    no_connection_id         
                                                                                                           pcie@1c20000                    no_connection_id         
                                                                                                           pcie@1c10000                    no_connection_id         
                                                                                                           deviceless                      no_connection_id         
 gcc_aggre_noc_pcie1_tunnel_axi_clk  0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 gcc_aggre_noc_pcie0_tunnel_axi_clk  0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
 hwkm                                0       0        0        0           0          0     50000      Y   10d3000.rng                     core                     
                                                                                                           deviceless                      no_connection_id         
 pka                                 0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 ipa                                 0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
 sleep-clk                           1       1        0        32764       0          0     50000      Y   17c10000.watchdog               no_connection_id         
                                                                                                           deviceless                      no_connection_id         
    disp0_cc_sleep_clk_src           0       0        0        32764       0          0     50000      N      deviceless                      no_connection_id         
       disp0_cc_sleep_clk            0       0        0        32764       0          0     50000      N         deviceless                      no_connection_id         
 xo-board-clk                        1       1        0        38400000    0          0     50000      Y   deviceless                      no_connection_id         
    ln_bb_clk3_ao                    0       0        0        19200000    0          0     50000      Y      deviceless                      no_connection_id         
    ln_bb_clk3                       0       0        0        19200000    0          0     50000      Y      deviceless                      no_connection_id         
    bi_tcxo_ao                       0       0        0        19200000    0          0     50000      Y      deviceless                      no_connection_id         
    bi_tcxo                          17      17       0        19200000    0          0     50000      Y      1b300000.remoteproc             xo                       
                                                                                                              3000000.remoteproc              xo                       
                                                                                                              2400000.remoteproc              xo                       
                                                                                                              8902000.phy                     ref                      
                                                                                                              88e5000.phy                     ref                      
                                                                                                              deviceless                      no_connection_id         
       camcc_slow_ahb_clk_src        0       0        0        19200000    0          0     50000      Y         cci@ac4c000                     no_connection_id         
                                                                                                                 deviceless                      no_connection_id         
          camcc_bps_ahb_clk          0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_core_ahb_clk         0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_cpas_ahb_clk         0       0        0        19200000    0          0     50000      N            ac5a000.camss                   cpas_ahb                 
                                                                                                                    ac5a000.camss                   cpas_ahb                 
                                                                                                                    ac5a000.camss                   cpas_ahb                 
                                                                                                                    ac5a000.camss                   cpas_ahb                 
                                                                                                                    ac5a000.camss                   cpas_ahb                 
                                                                                                                    ac5a000.camss                   cpas_ahb                 
                                                                                                                    ac5a000.camss                   cpas_ahb                 
                                                                                                                    ac5a000.camss                   cpas_ahb                 
                                                                                                                    cci@ac4c000                     no_connection_id         
                                                                                                                    deviceless                      no_connection_id         
          camcc_icp_ahb_clk          0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ipe_0_ahb_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ipe_1_ahb_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_mclk7_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_mclk7_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_mclk6_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_mclk6_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_mclk5_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_mclk5_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_mclk4_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_mclk4_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_mclk3_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_mclk3_clk            0       0        0        19200000    0          0     50000      N            24-0010                         no_connection_id         
                                                                                                                    deviceless                      no_connection_id         
       camcc_mclk2_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_mclk2_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_mclk1_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_mclk1_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_mclk0_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_mclk0_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_lrme_clk_src            0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_lrme_clk             0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_jpeg_clk_src            0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_jpeg_clk             0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_ipe_0_clk_src           0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ipe_1_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ipe_0_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_ife_lite_3_csid_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_lite_3_csid_clk  0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite3_csid           
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_lite_3_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_lite_3_clk       0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite3                
                                                                                                                    ac5a000.camss                   vfe_lite3                
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_lite_2_csid_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_lite_2_csid_clk  0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite2_csid           
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_lite_2_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_lite_2_clk       0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite2                
                                                                                                                    ac5a000.camss                   vfe_lite2                
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_lite_1_csid_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_lite_1_csid_clk  0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite1_csid           
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_lite_1_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_lite_1_clk       0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite1                
                                                                                                                    ac5a000.camss                   vfe_lite1                
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_lite_0_csid_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_lite_0_csid_clk  0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite0_csid           
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_lite_0_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_lite_0_clk       0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite0                
                                                                                                                    ac5a000.camss                   vfe_lite0                
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_3_csid_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_3_csid_clk       0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe3_csid                
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_3_clk_src           0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_3_dsp_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ife_3_clk            0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe3                     
                                                                                                                    ac5a000.camss                   vfe3                     
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_2_csid_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_2_csid_clk       0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe2_csid                
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_2_clk_src           0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_2_dsp_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ife_2_clk            0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe2                     
                                                                                                                    ac5a000.camss                   vfe2                     
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_1_csid_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_1_csid_clk       0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe1_csid                
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_1_clk_src           0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_1_dsp_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ife_1_clk            0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe1                     
                                                                                                                    ac5a000.camss                   vfe1                     
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_0_csid_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_0_csid_clk       0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe0_csid                
                                                                                                                    deviceless                      no_connection_id         
       camcc_ife_0_clk_src           0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_ife_0_dsp_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ife_0_clk            0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe0                     
                                                                                                                    ac5a000.camss                   vfe0                     
                                                                                                                    deviceless                      no_connection_id         
       camcc_icp_clk_src             0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_icp_clk              0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_fast_ahb_clk_src        0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_ipe_1_areg_clk       0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ipe_0_areg_clk       0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_bps_areg_clk         0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_csi3phytimer_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_csi3phytimer_clk     0       0        0        19200000    0          0     50000      N            ac5a000.camss                   csiphy3_timer            
                                                                                                                    deviceless                      no_connection_id         
       camcc_csi2phytimer_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_csi2phytimer_clk     0       0        0        19200000    0          0     50000      N            ac5a000.camss                   csiphy2_timer            
                                                                                                                    deviceless                      no_connection_id         
       camcc_csi1phytimer_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_csi1phytimer_clk     0       0        0        19200000    0          0     50000      N            ac5a000.camss                   csiphy1_timer            
                                                                                                                    deviceless                      no_connection_id         
       camcc_csi0phytimer_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_csi0phytimer_clk     0       0        0        19200000    0          0     50000      N            ac5a000.camss                   csiphy0_timer            
                                                                                                                    deviceless                      no_connection_id         
       camcc_cphy_rx_clk_src         0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_ife_lite_3_cphy_rx_clk 0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite3_cphy_rx        
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_lite_2_cphy_rx_clk 0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite2_cphy_rx        
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_lite_1_cphy_rx_clk 0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite1_cphy_rx        
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_lite_0_cphy_rx_clk 0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe_lite0_cphy_rx        
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_3_cphy_rx_clk    0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe3_cphy_rx             
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_2_cphy_rx_clk    0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe2_cphy_rx             
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_1_cphy_rx_clk    0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe1_cphy_rx             
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_0_cphy_rx_clk    0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe0_cphy_rx             
                                                                                                                    deviceless                      no_connection_id         
          camcc_csiphy3_clk          0       0        0        19200000    0          0     50000      N            ac5a000.camss                   csiphy3                  
                                                                                                                    deviceless                      no_connection_id         
          camcc_csiphy2_clk          0       0        0        19200000    0          0     50000      N            ac5a000.camss                   csiphy2                  
                                                                                                                    deviceless                      no_connection_id         
          camcc_csiphy1_clk          0       0        0        19200000    0          0     50000      N            ac5a000.camss                   csiphy1                  
                                                                                                                    deviceless                      no_connection_id         
          camcc_csiphy0_clk          0       0        0        19200000    0          0     50000      N            ac5a000.camss                   csiphy0                  
                                                                                                                    deviceless                      no_connection_id         
       camcc_cci_3_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_cci_3_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_cci_2_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_cci_2_clk            0       0        0        19200000    0          0     50000      N            cci@ac4c000                     no_connection_id         
                                                                                                                    deviceless                      no_connection_id         
       camcc_cci_1_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_cci_1_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_cci_0_clk_src           0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_cci_0_clk            0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_camnoc_axi_clk_src      0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          camcc_ipe_1_axi_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ipe_0_axi_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_ife_3_axi_clk        0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe3_axi                 
                                                                                                                    ac5a000.camss                   vfe3_axi                 
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_2_axi_clk        0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe2_axi                 
                                                                                                                    ac5a000.camss                   vfe2_axi                 
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_1_axi_clk        0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe1_axi                 
                                                                                                                    ac5a000.camss                   vfe1_axi                 
                                                                                                                    deviceless                      no_connection_id         
          camcc_ife_0_axi_clk        0       0        0        19200000    0          0     50000      N            ac5a000.camss                   vfe0_axi                 
                                                                                                                    ac5a000.camss                   vfe0_axi                 
                                                                                                                    deviceless                      no_connection_id         
          camcc_bps_axi_clk          0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          camcc_camnoc_axi_clk       0       0        0        19200000    0          0     50000      N            ac5a000.camss                   camnoc_axi               
                                                                                                                    ac5a000.camss                   camnoc_axi               
                                                                                                                    ac5a000.camss                   camnoc_axi               
                                                                                                                    ac5a000.camss                   camnoc_axi               
                                                                                                                    ac5a000.camss                   camnoc_axi               
                                                                                                                    ac5a000.camss                   camnoc_axi               
                                                                                                                    ac5a000.camss                   camnoc_axi               
                                                                                                                    ac5a000.camss                   camnoc_axi               
                                                                                                                    cci@ac4c000                     no_connection_id         
                                                                                                                    deviceless                      no_connection_id         
       camcc_bps_clk_src             0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          camcc_bps_clk              0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       camcc_pll7                    0       0        0        960000000   0          0     50000      N         deviceless                      no_connection_id         
          camcc_pll7_out_odd         0       0        0        320000000   0          0     50000      Y            deviceless                      no_connection_id         
          camcc_pll7_out_even        0       0        0        480000000   0          0     50000      Y            deviceless                      no_connection_id         
       camcc_pll6                    0       0        0        799999804   0          0     50000      N         deviceless                      no_connection_id         
          camcc_pll6_out_even        0       0        0        399999902   0          0     50000      Y            deviceless                      no_connection_id         
       camcc_pll5                    0       0        0        799999804   0          0     50000      N         deviceless                      no_connection_id         
          camcc_pll5_out_even        0       0        0        399999902   0          0     50000      Y            deviceless                      no_connection_id         
       camcc_pll4                    0       0        0        799999804   0          0     50000      N         deviceless                      no_connection_id         
          camcc_pll4_out_even        0       0        0        399999902   0          0     50000      Y            deviceless                      no_connection_id         
       camcc_pll3                    0       0        0        799999804   0          0     50000      N         deviceless                      no_connection_id         
          camcc_pll3_out_even        0       0        0        399999902   0          0     50000      Y            deviceless                      no_connection_id         
       camcc_pll2                    0       0        0        960000000   0          0     50000      N         deviceless                      no_connection_id         
       camcc_pll1                    0       0        0        639999902   0          0     50000      N         deviceless                      no_connection_id         
          camcc_pll1_out_even        0       0        0        319999951   0          0     50000      Y            deviceless                      no_connection_id         
       camcc_pll0                    0       0        0        1200000000  0          0     50000      N         deviceless                      no_connection_id         
          camcc_pll0_out_odd         0       0        0        400000000   0          0     50000      Y            deviceless                      no_connection_id         
          camcc_pll0_out_even        0       0        0        600000000   0          0     50000      Y            deviceless                      no_connection_id         
       disp0_cc_mdss_vsync_clk_src   1       1        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          disp0_cc_mdss_rscc_vsync_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          disp0_cc_mdss_vsync1_clk   0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          disp0_cc_mdss_vsync_clk    1       1        0        19200000    0          0     50000      Y            display-controller@ae01000      no_connection_id         
                                                                                                                    deviceless                      no_connection_id         
       disp0_cc_mdss_rot_clk_src     0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          disp0_cc_mdss_rot1_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          disp0_cc_mdss_rot_clk      0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_pclk1_clk_src   0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_pclk1_clk    0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_pclk0_clk_src   0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_pclk0_clk    0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_esc1_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_esc1_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_esc0_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_esc0_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_dptx3_aux_clk_src 1       1        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx3_aux_clk 2       2        0        19200000    0          0     50000      Y            aea0000.displayport-controller  core_aux                 
                                                                                                                    phy@aec5a00                     no_connection_id         
                                                                                                                    deviceless                      no_connection_id         
       disp0_cc_mdss_dptx2_pixel1_clk_src 0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx2_pixel1_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_dptx2_pixel0_clk_src 0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx2_pixel0_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_dptx2_link_clk_src 0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx2_link_div_clk_src 0       0        0        4800000     0          0     50000      Y            deviceless                      no_connection_id         
             disp0_cc_mdss_dptx2_link_intf_clk 0       0        0        4800000     0          0     50000      N               deviceless                      no_connection_id         
          disp0_cc_mdss_dptx2_link_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_dptx2_aux_clk_src 0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx2_aux_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_dptx1_aux_clk_src 0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx1_aux_clk 0       0        0        19200000    0          0     50000      N            ae98000.displayport-controller  core_aux                 
                                                                                                                    deviceless                      no_connection_id         
       disp0_cc_mdss_dptx0_aux_clk_src 0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_dptx0_aux_clk 0       0        0        19200000    0          0     50000      N            ae90000.displayport-controller  core_aux                 
                                                                                                                    deviceless                      no_connection_id         
       disp0_cc_mdss_byte1_clk_src   0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_byte1_div_clk_src 0       0        0        9600000     0          0     50000      Y            deviceless                      no_connection_id         
             disp0_cc_mdss_byte1_intf_clk 0       0        0        9600000     0          0     50000      N               deviceless                      no_connection_id         
          disp0_cc_mdss_byte1_clk    0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_byte0_clk_src   0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          disp0_cc_mdss_byte0_div_clk_src 0       0        0        9600000     0          0     50000      Y            deviceless                      no_connection_id         
             disp0_cc_mdss_byte0_intf_clk 0       0        0        9600000     0          0     50000      N               deviceless                      no_connection_id         
          disp0_cc_mdss_byte0_clk    0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       disp0_cc_mdss_ahb_clk_src     1       1        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          disp0_cc_mdss_rscc_ahb_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          disp0_cc_mdss_non_gdsc_ahb_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          disp0_cc_mdss_ahb1_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          disp0_cc_mdss_ahb_clk      4       4        0        19200000    0          0     50000      Y            aea0000.displayport-controller  core_iface               
                                                                                                                    ae98000.displayport-controller  core_iface               
                                                                                                                    ae90000.displayport-controller  core_iface               
                                                                                                                    display-controller@ae01000      no_connection_id         
                                                                                                                    display-subsystem@ae00000       no_connection_id         
                                                                                                                    phy@aec5a00                     no_connection_id         
                                                                                                                    deviceless                      no_connection_id         
       disp0_cc_pll2                 0       0        0        1350000000  0          0     50000      N         deviceless                      no_connection_id         
       disp0_cc_pll1                 1       1        0        600000000   0          0     50000      Y         deviceless                      no_connection_id         
          disp0_cc_mdss_mdp_clk_src  2       2        0        150000000   0          0     50000      ?            deviceless                      no_connection_id         
             disp0_cc_mdss_mdp_lut_clk 1       1        0        150000000   0          0     50000      Y               display-controller@ae01000      no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
             disp0_cc_mdss_mdp_lut1_clk 0       0        0        150000000   0          0     50000      N               deviceless                      no_connection_id         
             disp0_cc_mdss_mdp1_clk  0       0        0        150000000   0          0     50000      N               deviceless                      no_connection_id         
             disp0_cc_mdss_mdp_clk   2       2        0        150000000   0          0     50000      Y               display-controller@ae01000      no_connection_id         
                                                                                                                       ae01000.display-controller      core                     
                                                                                                                       display-subsystem@ae00000       no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
          disp0_cc_pll1_out_even     0       0        0        300000000   0          0     50000      Y            deviceless                      no_connection_id         
       disp0_cc_pll0                 0       0        0        1500000000  0          0     50000      N         deviceless                      no_connection_id         
       gpu_cc_pll1                   0       0        0        499999804   0          0     50000      N         deviceless                      no_connection_id         
       gpu_cc_pll0                   0       0        0        549999902   0          0     50000      Y         deviceless                      no_connection_id         
       gcc_usb4_tmu_clk_src          0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb4_tmu_clk           0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb4_sb_if_clk_src        0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb4_sb_if_clk         0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb4_phy_rx1_clk_src      0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_usb4_phy_rx1_clk       0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb4_phy_rx0_clk_src      0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_usb4_phy_rx0_clk       0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb4_phy_pcie_pipe_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
       gcc_usb4_master_clk_src       0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_aggre_usb4_axi_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_usb4_master_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb4_1_tmu_clk_src        0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb4_1_tmu_clk         0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb4_1_sb_if_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb4_1_sb_if_clk       0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb4_1_phy_rx1_clk_src    0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_usb4_1_phy_rx1_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb4_1_phy_rx0_clk_src    0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_usb4_1_phy_rx0_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb4_1_phy_pcie_pipe_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
       gcc_usb4_1_master_clk_src     0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_aggre_usb4_1_axi_clk   0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_usb4_1_master_clk      0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_usb3_sec_phy_aux_clk_src  2       2        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb3_sec_phy_com_aux_clk 1       1        0        19200000    0          0     50000      Y            8903000.phy                     com_aux                  
                                                                                                                    deviceless                      no_connection_id         
          gcc_usb3_sec_phy_aux_clk   1       1        0        19200000    0          0     50000      Y            8903000.phy                     aux                      
                                                                                                                    deviceless                      no_connection_id         
       gcc_usb3_prim_phy_aux_clk_src 2       2        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb3_prim_phy_com_aux_clk 1       1        0        19200000    0          0     50000      Y            88eb000.phy                     com_aux                  
                                                                                                                    deviceless                      no_connection_id         
          gcc_usb3_prim_phy_aux_clk  1       1        0        19200000    0          0     50000      Y            88eb000.phy                     aux                      
                                                                                                                    deviceless                      no_connection_id         
       gcc_usb3_mp_phy_aux_clk_src   2       2        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb3_mp_phy_com_aux_clk 2       2        0        19200000    0          0     50000      Y            88f1000.phy                     com_aux                  
                                                                                                                    88ef000.phy                     com_aux                  
                                                                                                                    deviceless                      no_connection_id         
          gcc_usb3_mp_phy_aux_clk    2       2        0        19200000    0          0     50000      Y            88f1000.phy                     aux                      
                                                                                                                    88ef000.phy                     aux                      
                                                                                                                    deviceless                      no_connection_id         
       gcc_usb30_sec_mock_utmi_clk_src 1       1        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb30_sec_mock_utmi_postdiv_clk_src 1       1        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
             gcc_usb30_sec_mock_utmi_clk 1       1        0        19200000    0          0     50000      Y               usb@a8f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
       gcc_usb30_prim_mock_utmi_clk_src 1       1        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb30_prim_mock_utmi_postdiv_clk_src 1       1        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
             gcc_usb30_prim_mock_utmi_clk 1       1        0        19200000    0          0     50000      Y               usb@a6f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
       gcc_usb30_mp_mock_utmi_clk_src 1       1        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_usb30_mp_mock_utmi_postdiv_clk_src 1       1        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
             gcc_usb30_mp_mock_utmi_clk 1       1        0        19200000    0          0     50000      Y               usb@a4f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
       gcc_ufs_ref_clkref_clk        0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
       gcc_ufs_phy_unipro_core_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_ufs_phy_unipro_core_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_ufs_phy_unipro_core_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_ufs_phy_phy_aux_clk_src   0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_ufs_phy_phy_aux_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_ufs_phy_phy_aux_clk    0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_ufs_phy_ice_core_clk_src  0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_ufs_phy_ice_core_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_ufs_phy_ice_core_clk   0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_ufs_phy_axi_clk_src       0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_ufs_phy_axi_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_aggre_ufs_phy_axi_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_aggre_ufs_phy_axi_clk  0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_ufs_phy_axi_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_ufs_card_unipro_core_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_ufs_card_unipro_core_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_ufs_card_unipro_core_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_ufs_card_phy_aux_clk_src  0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_ufs_card_phy_aux_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_ufs_card_phy_aux_clk   0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_ufs_card_ice_core_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_ufs_card_ice_core_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_ufs_card_ice_core_clk  0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_ufs_card_clkref_clk       0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
       gcc_ufs_card_axi_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_ufs_card_axi_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_aggre_ufs_card_axi_hw_ctl_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_aggre_ufs_card_axi_clk 0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
          gcc_ufs_card_axi_clk       0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_ufs_1_card_clkref_clk     0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
       gcc_sdcc4_apps_clk_src        0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_sdcc4_apps_clk         0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap2_s7_clk_src    0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_qupv3_wrap2_s7_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap2_s6_clk_src    0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_qupv3_wrap2_s6_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap2_s5_clk_src    1       1        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_qupv3_wrap2_s5_clk     1       1        0        19200000    0          0     50000      Y            894000.i2c                      se                       
                                                                                                                    deviceless                      no_connection_id         
       gcc_qupv3_wrap2_s4_clk_src    0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_qupv3_wrap2_s4_div_clk_src 0       0        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
             gcc_qupv3_wrap2_s4_clk  0       0        0        19200000    0          0     50000      N               deviceless                      no_connection_id         
          gcc_qupv3_wrap2_qspi0_clk  0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap2_s3_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap2_s3_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap2_s2_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap2_s2_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap2_s0_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap2_s0_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap1_s7_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap1_s7_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap1_s6_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap1_s6_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap1_s5_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap1_s5_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap1_s4_clk_src    0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_qupv3_wrap1_s4_div_clk_src 0       0        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
             gcc_qupv3_wrap1_s4_clk  0       0        0        19200000    0          0     50000      N               deviceless                      no_connection_id         
          gcc_qupv3_wrap1_qspi0_clk  0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap1_s3_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap1_s3_clk     0       0        0        19200000    0          0     50000      N            a8c000.i2c                      se                       
                                                                                                                    deviceless                      no_connection_id         
       gcc_qupv3_wrap1_s2_clk_src    0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_qupv3_wrap1_s2_clk     0       0        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
       gcc_qupv3_wrap1_s1_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap1_s1_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap1_s0_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap1_s0_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap0_s7_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap0_s7_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap0_s6_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap0_s6_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap0_s5_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap0_s5_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap0_s4_clk_src    0       0        0        19200000    0          0     50000      Y         deviceless                      no_connection_id         
          gcc_qupv3_wrap0_s4_div_clk_src 0       0        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
             gcc_qupv3_wrap0_s4_clk  0       0        0        19200000    0          0     50000      N               990000.i2c                      se                       
                                                                                                                       deviceless                      no_connection_id         
          gcc_qupv3_wrap0_qspi0_clk  0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap0_s3_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap0_s3_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap0_s1_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap0_s1_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_qupv3_wrap0_s0_clk_src    0       0        0        19200000    0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap0_s0_clk     0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_pdm2_clk_src              0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pdm2_clk               0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_pcie_rscc_xo_clk_src      0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie_rscc_xo_clk       0       0        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
       gcc_pcie_4_aux_clk_src        1       1        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie_4_aux_clk         2       2        0        19200000    0          0     50000      Y            pcie@1c00000                    no_connection_id         
                                                                                                                    1c06000.phy                     aux                      
                                                                                                                    deviceless                      no_connection_id         
       gcc_pcie_3b_phy_rchng_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie3b_phy_rchng_clk   0       0        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
       gcc_pcie_3b_aux_clk_src       0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie_3b_aux_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_pcie_3a_aux_clk_src       1       1        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie_3a_aux_clk        2       2        0        19200000    0          0     50000      Y            pcie@1c10000                    no_connection_id         
                                                                                                                    1c14000.phy                     aux                      
                                                                                                                    deviceless                      no_connection_id         
       gcc_pcie_2b_phy_rchng_clk_src 0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie2b_phy_rchng_clk   0       0        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
       gcc_pcie_2b_aux_clk_src       0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie_2b_aux_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_pcie_2a_aux_clk_src       1       1        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie_2a_aux_clk        2       2        0        19200000    0          0     50000      Y            pcie@1c20000                    no_connection_id         
                                                                                                                    1c24000.phy                     aux                      
                                                                                                                    deviceless                      no_connection_id         
       gcc_pcie_1_phy_rchng_clk_src  0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie1_phy_rchng_clk    0       0        0        19200000    0          0     50000      Y            deviceless                      no_connection_id         
       gcc_pcie_1_aux_clk_src        0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie_1_aux_clk         0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_pcie_0_phy_rchng_clk_src  0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie0_phy_rchng_clk    0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_pcie_0_aux_clk_src        0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_pcie_0_aux_clk         0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_gp5_clk_src               0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_gp5_clk                0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_gp4_clk_src               0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_gp4_clk                0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_gp3_clk_src               0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_gp3_clk                0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_gp2_clk_src               0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_gp2_clk                0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_gp1_clk_src               0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_gp1_clk                0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_emac1_rgmii_clk_src       0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_emac1_rgmii_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_emac1_ptp_clk_src         0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_emac1_ptp_clk          0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_emac0_rgmii_clk_src       0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_emac0_rgmii_clk        0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_emac0_ptp_clk_src         0       0        0        19200000    0          0     50000      ?         deviceless                      no_connection_id         
          gcc_emac0_ptp_clk          0       0        0        19200000    0          0     50000      N            deviceless                      no_connection_id         
       gcc_gpll9                     0       0        0        807999902   0          0     50000      N         deviceless                      no_connection_id         
          gcc_sdcc2_apps_clk_src     0       0        0        201999975   0          0     50000      ?            deviceless                      no_connection_id         
             gcc_sdcc2_apps_clk      0       0        0        201999975   0          0     50000      Y               deviceless                      no_connection_id         
       gcc_gpll8                     0       0        0        699999902   0          0     50000      N         deviceless                      no_connection_id         
       gcc_gpll7                     0       0        0        499999804   0          0     50000      N         deviceless                      no_connection_id         
       gcc_gpll4                     0       0        0        806400000   0          0     50000      N         deviceless                      no_connection_id         
       gcc_gpll2                     0       0        0        999999902   0          0     50000      N         deviceless                      no_connection_id         
       gcc_gpll0                     6       6        0        600000000   0          0     50000      N         deviceless                      no_connection_id         
          gcc_qupv3_wrap0_s2_clk_src 1       1        0        100000000   0          0     50003      Y            deviceless                      no_connection_id         
             gcc_qupv3_wrap0_s2_clk  1       1        0        100000000   0          0     50000      Y               988000.serial                   se                       
                                                                                                                       988000.serial                   se                       
                                                                                                                       deviceless                      no_connection_id         
          gcc_usb30_sec_master_clk_src 3       3        0        200000000   0          0     50000      ?            deviceless                      no_connection_id         
             gcc_aggre_usb3_sec_axi_clk 1       1        0        200000000   0          0     50000      Y               usb@a8f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
             gcc_cfg_noc_usb3_sec_axi_clk 1       1        0        200000000   0          0     50000      Y               usb@a8f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
             gcc_usb30_sec_master_clk 1       1        0        200000000   0          0     50000      Y               usb@a8f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
          gcc_usb30_prim_master_clk_src 3       3        0        200000000   0          0     50000      ?            deviceless                      no_connection_id         
             gcc_aggre_usb3_prim_axi_clk 1       1        0        200000000   0          0     50000      Y               usb@a6f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
             gcc_cfg_noc_usb3_prim_axi_clk 1       1        0        200000000   0          0     50000      Y               usb@a6f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
             gcc_usb30_prim_master_clk 1       1        0        200000000   0          0     50000      Y               usb@a6f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
          gcc_usb30_mp_master_clk_src 3       3        0        200000000   0          0     50000      ?            deviceless                      no_connection_id         
             gcc_aggre_usb3_mp_axi_clk 1       1        0        200000000   0          0     50000      Y               usb@a4f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
             gcc_cfg_noc_usb3_mp_axi_clk 1       1        0        200000000   0          0     50000      Y               usb@a4f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
             gcc_usb30_mp_master_clk 1       1        0        200000000   0          0     50000      Y               usb@a4f8800                     no_connection_id         
                                                                                                                       deviceless                      no_connection_id         
          gcc_gpu_gpll0_clk_src      1       1        0        600000000   0          0     50000      Y            deviceless                      no_connection_id         
             gpu_cc_hub_clk_src      3       3        0        200000000   0          0     50000      ?               deviceless                      no_connection_id         
                gpu_cc_hub_cx_int_div_clk_src 1       1        0        200000000   0          0     50000      Y                  deviceless                      no_connection_id         
                   gpu_cc_hub_cx_int_clk 2       2        0        200000000   0          0     50000      Y                     gmu@3d6a000                     no_connection_id         
                                                                                                                             iommu@3da0000                   no_connection_id         
                                                                                                                             deviceless                      no_connection_id         
                gpu_cc_hub_ahb_div_clk_src 1       1        0        200000000   0          0     50000      Y                  deviceless                      no_connection_id         
                   gpu_cc_ahb_clk    2       2        0        200000000   0          0     50000      N                     gmu@3d6a000                     no_connection_id         
                                                                                                                             iommu@3da0000                   no_connection_id         
                                                                                                                             deviceless                      no_connection_id         
                   gpu_cc_crc_ahb_clk 0       0        0        200000000   0          0     50000      N                     deviceless                      no_connection_id         
                gpu_cc_hub_aon_clk   1       1        0        200000000   0          0     50000      Y                  iommu@3da0000                   no_connection_id         
                                                                                                                          deviceless                      no_connection_id         
          gcc_gpll0_out_even         4       4        0        300000000   0          0     50000      Y            deviceless                      no_connection_id         
             gcc_pcie_3a_phy_rchng_clk_src 1       1        0        100000000   0          0     50000      ?               deviceless                      no_connection_id         
                gcc_pcie3a_phy_rchng_clk 1       1        0        100000000   0          0     50000      Y                  1c14000.phy                     rchng                    
                                                                                                                          deviceless                      no_connection_id         
             gcc_qupv3_wrap2_s1_clk_src 0       0        0        7372800     0          0     50003      Y               deviceless                      no_connection_id         
                gcc_qupv3_wrap2_s1_clk 0       0        0        7372800     0          0     50000      Y                  deviceless                      no_connection_id         
             gcc_pcie_4_phy_rchng_clk_src 1       1        0        100000000   0          0     50000      ?               deviceless                      no_connection_id         
                gcc_pcie4_phy_rchng_clk 1       1        0        100000000   0          0     50000      Y                  1c06000.phy                     rchng                    
                                                                                                                          deviceless                      no_connection_id         
             gcc_pcie_2a_phy_rchng_clk_src 1       1        0        100000000   0          0     50000      ?               deviceless                      no_connection_id         
                gcc_pcie2a_phy_rchng_clk 1       1        0        100000000   0          0     50000      Y                  1c24000.phy                     rchng                    
                                                                                                                          deviceless                      no_connection_id         
             gcc_gpu_gpll0_div_clk_src 1       1        0        300000000   0          0     50000      Y               deviceless                      no_connection_id         
                gpu_cc_gmu_clk_src   1       1        0        200000000   0          0     50000      ?                  deviceless                      no_connection_id         
                   gpu_cc_gx_gmu_clk 0       0        0        200000000   0          0     50000      N                     deviceless                      no_connection_id         
                   gpu_cc_cx_gmu_clk 2       2        0        200000000   0          0     50000      Y                     3d6a000.gmu                     no_connection_id         
                                                                                                                             gmu@3d6a000                     no_connection_id         
                                                                                                                             iommu@3da0000                   no_connection_id         
                                                                                                                             deviceless                      no_connection_id         
 camcc_xo_clk_src                    0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
    camcc_camnoc_dcd_xo_clk          0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
    camcc_gdsc_clk                   0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 camcc_sleep_clk_src                 0       0        0        0           0          0     50000      N   deviceless                      no_connection_id         
    camcc_sleep_clk                  0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_usb4_phy_sys_clk_src            0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb4_sys_clk                 0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_usb4_phy_pcie_pipegmux_clk_src  0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb4_phy_pcie_pipe_mux_clk_src 0       0        0        0           0          0     50000      Y      deviceless                      no_connection_id         
       gcc_pcie_0_pipe_clk           0       0        0        0           0          0     50000      N         deviceless                      no_connection_id         
       gcc_usb4_phy_pcie_pipe_clk    0       0        0        0           0          0     50000      N         deviceless                      no_connection_id         
 gcc_usb4_phy_p2rr2p_pipe_clk_src    0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb4_phy_p2rr2p_pipe_clk     0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_usb4_phy_dp_clk_src             0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb4_dp_clk                  0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_usb4_1_phy_sys_clk_src          0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb4_1_sys_clk               0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_usb4_1_phy_pcie_pipegmux_clk_src 0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb4_1_phy_pcie_pipe_mux_clk_src 0       0        0        0           0          0     50000      Y      deviceless                      no_connection_id         
       gcc_pcie_1_pipe_clk           0       0        0        0           0          0     50000      N         deviceless                      no_connection_id         
       gcc_usb4_1_phy_pcie_pipe_clk  0       0        0        0           0          0     50000      N         deviceless                      no_connection_id         
 gcc_usb4_1_phy_p2rr2p_pipe_clk_src  0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb4_1_phy_p2rr2p_pipe_clk   0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_usb4_1_phy_dp_clk_src           0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb4_1_dp_clk                0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_usb3_mp_phy_pipe_1_clk_src      1       1        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb3_mp_phy_pipe_1_clk       1       1        0        0           0          0     50000      Y      88f1000.phy                     pipe                     
                                                                                                              deviceless                      no_connection_id         
 gcc_usb3_mp_phy_pipe_0_clk_src      1       1        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_usb3_mp_phy_pipe_0_clk       1       1        0        0           0          0     50000      Y      88ef000.phy                     pipe                     
                                                                                                              deviceless                      no_connection_id         
 gcc_ufs_phy_tx_symbol_0_clk_src     0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_ufs_phy_tx_symbol_0_clk      0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_ufs_phy_rx_symbol_1_clk_src     0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_ufs_phy_rx_symbol_1_clk      0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_ufs_phy_rx_symbol_0_clk_src     0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_ufs_phy_rx_symbol_0_clk      0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_ufs_card_tx_symbol_0_clk_src    0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_ufs_card_tx_symbol_0_clk     0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_ufs_card_rx_symbol_1_clk_src    0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_ufs_card_rx_symbol_1_clk     0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_ufs_card_rx_symbol_0_clk_src    0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_ufs_card_rx_symbol_0_clk     0       0        0        0           0          0     50000      N      deviceless                      no_connection_id         
 gcc_pcie_3b_pipe_clk_src            0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_pcie_3b_pipe_div_clk_src     0       0        0        0           0          0     50000      Y      deviceless                      no_connection_id         
       gcc_pcie_3b_pipediv2_clk      0       0        0        0           0          0     50000      N         deviceless                      no_connection_id         
    gcc_pcie_3b_pipe_clk             0       0        0        19200000    0          0     50000      N      deviceless                      no_connection_id         
 gcc_pcie_2b_pipe_clk_src            0       0        0        0           0          0     50000      Y   deviceless                      no_connection_id         
    gcc_pcie_2b_pipe_div_clk_src     0       0        0        0           0          0     50000      Y      deviceless                      no_connection_id         
       gcc_pcie_2b_pipediv2_clk      0       0        0        0           0          0     50000      N         deviceless                      no_connection_id         
    gcc_pcie_2b_pipe_clk             0       0        0        19200000    0          0     50000      N      deviceless                      no_connection_id         

--U0T/PANy/l6FuuPA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=pm_genpd_summary

domain                          status          children        performance
    /device                         runtime status                  managed by
------------------------------------------------------------------------------
titan_top_gdsc                  on                              0
                                                bps_gdsc, ife_0_gdsc, ife_1_gdsc, ife_2_gdsc, ife_3_gdsc, ipe_0_gdsc, ipe_1_gdsc
    ac4c000.cci                     suspended                   0           SW
    genpd:4:ac5a000.camss           suspended                   0           SW
ipe_1_gdsc                      off-0                           0
ipe_0_gdsc                      off-0                           0
ife_3_gdsc                      off-0                           0
    genpd:3:ac5a000.camss           suspended                   0           SW
ife_2_gdsc                      off-0                           0
    genpd:2:ac5a000.camss           suspended                   0           SW
ife_1_gdsc                      off-0                           0
    genpd:1:ac5a000.camss           suspended                   0           SW
ife_0_gdsc                      off-0                           0
    genpd:0:ac5a000.camss           suspended                   0           SW
bps_gdsc                        off-0                           0
disp0_mdss_int2_gdsc            off-0                           0
disp0_mdss_gdsc                 on                              0
    ae00000.display-subsystem       active                      0           SW
gx_gdsc                         on                              0
    genpd:1:3d6a000.gmu             active                      0           SW
cx_gdsc                         on                              0
    3da0000.iommu                   active                      0           SW
    genpd:0:3d6a000.gmu             active                      0           SW
hlos1_vote_turing_mmu_tbu3_gdsc  off-0                           0
hlos1_vote_turing_mmu_tbu2_gdsc  off-0                           0
hlos1_vote_turing_mmu_tbu1_gdsc  off-0                           0
hlos1_vote_turing_mmu_tbu0_gdsc  off-0                           0
hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc  on                              0
hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc  on                              0
hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc  on                              0
hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc  on                              0
usb4_gdsc                       off-0                           0
usb4_1_gdsc                     off-0                           0
emac_1_gdsc                     off-0                           0
emac_0_gdsc                     off-0                           0
usb30_sec_gdsc                  on                              256
    a8f8800.usb                     active                      256         SW
    8903000.phy                     active                      0           SW
    aux_bridge.aux_bridge.1         unsupported                 0           SW
usb30_prim_gdsc                 on                              256
    a6f8800.usb                     active                      256         SW
    88eb000.phy                     active                      0           SW
    aux_bridge.aux_bridge.0         unsupported                 0           SW
usb30_mp_gdsc                   on                              256
    88ef000.phy                     active                      0           SW
    88f1000.phy                     active                      0           SW
    a4f8800.usb                     active                      256         SW
ufs_phy_gdsc                    on                              0
ufs_card_gdsc                   on                              0
pcie_4_gdsc                     on                              256
    1c06000.phy                     unsupported                 0           SW
    1c00000.pcie                    active                      256         SW
pcie_3b_gdsc                    off-0                           0
pcie_3a_gdsc                    on                              256
    1c14000.phy                     unsupported                 0           SW
    1c10000.pcie                    active                      256         SW
pcie_2b_gdsc                    off-0                           0
pcie_2a_gdsc                    on                              256
    1c24000.phy                     unsupported                 0           SW
    1c20000.pcie                    active                      256         SW
pcie_1_tunnel_gdsc              off-0                           0
pcie_0_tunnel_gdsc              off-0                           0
mxc_ao                          off-0                           0
qphy                            off-0                           0
nsp                             off-0                           0
    genpd:0:1b300000.remoteproc     suspended                   0           SW
mxc                             off-0                           0
mx_ao                           off-0                           0
mx                              on                              0
    aec5a00.phy                     unsupported                 0           SW
mmcx_ao                         off-0                           0
mmcx                            on                              128
                                                disp0_mdss_gdsc, disp0_mdss_int2_gdsc, titan_top_gdsc
    af00000.clock-controller        active                      0           SW
    ad00000.clock-controller        suspended                   0           SW
    ae01000.display-controller      active                      64          SW
    ae90000.displayport-controller  suspended                   0           SW
    ae98000.displayport-controller  suspended                   0           SW
    aea0000.displayport-controller  active                      128         SW
lmx                             off-0                           0
    genpd:1:2400000.remoteproc      suspended                   0           SW
    genpd:1:3000000.remoteproc      suspended                   0           SW
lcx                             off-0                           0
    genpd:0:2400000.remoteproc      suspended                   0           SW
    genpd:0:3000000.remoteproc      suspended                   0           SW
gfx                             on                              0
                                                cx_gdsc, gx_gdsc
    3d90000.clock-controller        active                      0           SW
ebi                             off-0                           0
cx_ao                           off-0                           0
cx                              on                              256
                                                pcie_0_tunnel_gdsc, pcie_1_tunnel_gdsc, pcie_2a_gdsc, pcie_2b_gdsc, pcie_3a_gdsc, pcie_3b_gdsc, pcie_4_gdsc, ufs_card_gdsc, ufs_phy_gdsc, usb30_mp_gdsc, usb30_prim_gdsc, usb30_sec_gdsc, emac_0_gdsc, emac_1_gdsc, usb4_1_gdsc, usb4_gdsc, hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc, hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc, hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc, hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc, hlos1_vote_turing_mmu_tbu0_gdsc, hlos1_vote_turing_mmu_tbu1_gdsc, hlos1_vote_turing_mmu_tbu2_gdsc, hlos1_vote_turing_mmu_tbu3_gdsc
    100000.clock-controller         active                      0           SW
    894000.i2c                      active                      0           SW
    988000.serial                   active                      128         SW
    990000.i2c                      suspended                   0           SW
    a8c000.i2c                      suspended                   0           SW
power-domain-cpu-cluster0       on                              0
                                                power-domain-cpu0, power-domain-cpu1, power-domain-cpu2, power-domain-cpu3, power-domain-cpu4, power-domain-cpu5, power-domain-cpu6, power-domain-cpu7
    18200000.rsc                    suspended                   0           SW
power-domain-cpu7               on                              0
    genpd:0:cpu7                    active                      0           SW
power-domain-cpu6               on                              0
    genpd:0:cpu6                    active                      0           SW
power-domain-cpu5               on                              0
    genpd:0:cpu5                    active                      0           SW
power-domain-cpu4               on                              0
    genpd:0:cpu4                    active                      0           SW
power-domain-cpu3               on                              0
    genpd:0:cpu3                    active                      0           SW
power-domain-cpu2               on                              0
    genpd:0:cpu2                    active                      0           SW
power-domain-cpu1               on                              0
    genpd:0:cpu1                    active                      0           SW
power-domain-cpu0               on                              0
    genpd:0:cpu0                    active                      0           SW

--U0T/PANy/l6FuuPA--


