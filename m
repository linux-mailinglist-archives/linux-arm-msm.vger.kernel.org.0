Return-Path: <linux-arm-msm+bounces-115730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jsYJL1sjRWqs7goAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:25:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4596EEB30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:25:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=OUAB2fG9;
	dkim=pass header.d=redhat.com header.s=google header.b=rtnxOSoQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115730-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115730-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2409C30CA8EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 14:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8BA349AEA;
	Wed,  1 Jul 2026 14:19:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545D33438B0
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 14:19:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782915589; cv=pass; b=ifrsy024d76nME8HGi+DMmLc2TM/FIPPg6/12/iVw4DXrpfMlxSp7Qk5aHVTf7v/q+Fq84gVgmF2sLdQu0pckUs3HSF39uyA9/bBgccnEJzfuxZO7gxEFpZYvAKxWDQHHC8BvorRRaDVIFk8Cj8UDl0v2BchMG9CQLJGfDaSzzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782915589; c=relaxed/simple;
	bh=Dr2QbTXzGUsrz8PscbfBXdq0EUt9WfhBru9tOtPMlfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JDtGKj9EfUmMbCji46Q+BytTFAEFNwLNvN9itUgVhNogtcUPxaBwxvSYWRaGxivsnPtYTrogpfYqJLMgDnHhyRHQ9o/q3AzezFVnTOLN0nCs3cvqaeqGlXpfT8jXLIsXjIDWnpMrWAO+QmtLo8j2GRXMO0VtyXnaF2reK0dLdFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OUAB2fG9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rtnxOSoQ; arc=pass smtp.client-ip=170.10.129.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782915587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxUIqRckuJTUeIQE7s8OWJi+e0vZjCym/RMS7ZkEbCU=;
	b=OUAB2fG9w9W0Nyis9ygj+0QjEMF+lnp5Ovp6r7gWH0uLIrNiBAgh+HEAgvfAVMaB4H3/OL
	QXHths6pcGE5pK56hb9NIsEhtHz3kQpzowh48j31yIuiajsV3g6uEUM4XtGMTvK79u8JV8
	GFvff6DM1OwtHgcyZT/sGKwtiYTfOuQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-nThJLfsgOq6sZbPF6odIVQ-1; Wed, 01 Jul 2026 10:19:44 -0400
X-MC-Unique: nThJLfsgOq6sZbPF6odIVQ-1
X-Mimecast-MFC-AGG-ID: nThJLfsgOq6sZbPF6odIVQ_1782915583
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c125ef89f4eso61623466b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782915583; cv=none;
        d=google.com; s=arc-20260327;
        b=Vedndo1r+itna3PC7yoiVudlkothECtXTdSjKeGALYLSM5+UHNES7kHadbQxg+yZzh
         Ki0mOhQ/YHf8r2SINQ8P6wClgBaefjy9K2tVgK/vYiF1r3G37/KKtqcKUxf8m1jlbF2w
         sGPHVLrnXjKJiXZlWi4d2i1TvBPSIO6LNIn3LAB8OUeGz80FaXSoK+rPdLSSGmo/vAnb
         IwixAcFEc/oEjUNas3jYFO5E9/s6cUN2KFEzopK9uDAmdjepdTUosjhAoyvptzOuE4HL
         Nx91bUmLhLL9WC8a/rdfhQJ66vuC1DHcKJOfk+NpffbmMmCQo2KPb8AuIi9XlbfSqXzK
         DYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LxUIqRckuJTUeIQE7s8OWJi+e0vZjCym/RMS7ZkEbCU=;
        fh=DPunGApB+66d8v3Ehu6+7kOo+oNmzVwGYMV1yRCDM9s=;
        b=VU86JNG/mdHuHVQ/sngU3WNrQAYHUzMmKsB/Z41UAtgghzuoht/g6gkHgQLT7xm2qH
         9TWw/ocK+CqmSvyHDl+XPZVXJMsRdKqZ2ZMA9XCcgBCIZvm/8oxPKIuCTq1Xp6UqOVBZ
         Z0v8RuBMH/yJCM7C31L5byJXoN/ZRF/+yEDV/Vxv1bBA4jSDvqu1blNFzQlRD22uTz36
         crgqC9SS0GSZQjEgGBq8I+DqHaxynR4qVFglay2GiUMD3+Eh/PHvSvqhFt9/PL4s9N27
         pNI4H+38F+4d6J24qGXNXHo5SXDkVUJX5YKrWwixnirssuYu8aPAZszV6bHPgTWH4A4U
         h+Gg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782915583; x=1783520383; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxUIqRckuJTUeIQE7s8OWJi+e0vZjCym/RMS7ZkEbCU=;
        b=rtnxOSoQJZusrn1vIUgtjGz8dYZ4Yz4+xxa97/gPCEn5KapiA/EqLo8JKkCyr3iUvS
         AhaB3GZCuGh0WUOu6A7KdZ2FDNPjth4O8UtVpYIP2gAHFaDoOGAMUrq9GblzKdu9QmZw
         rbcPIn+tY0aFMvRC/pT24Xx03f3t2kVpBul4/Yz+B8lHrGC8yqHPKpJNSwQmS4xGqdr5
         ipmDesOHvEawfb7+UWisLwZ2g/8/O/MVh5DH0nxTE02/7depKg55JcewAJhemMTOVMV9
         gWjcaedAahvgsO0+4Uw8lQej7S9rDURJH+d33F/+1kihKq/bVkCxAGIBpsMY+a5Dlngt
         dBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782915583; x=1783520383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxUIqRckuJTUeIQE7s8OWJi+e0vZjCym/RMS7ZkEbCU=;
        b=e7RerjMczzhY8g412pCOXTefll5OYSVclyq8LSNGjzCmrFTBSDBW5xm3zpdFnlhNaN
         K7fvRbwNtOSvHiAsUZVa6u1GGAChFDQXHx1Uz45ggMT8ZQxyK6LjsxjYl+T7qCk6qWuy
         zC1CIrYGHv7GP2znH0zDMkCxmqbMizaKfj5Ald37FQs+3+S47jsLZdcgrOoFvVDZtbEP
         iIfc6iwAZ/I2OV8NfUhUDRAHyUfFVAwfjxvVjyZIrPNkHcPITo1JpqJ0bdleB2c8MD/h
         R4u4pMiZST45v2UL3mboK04BuC2rYL+neILEjPBfAumiCze8ZdLUn37Z8CdIEHNAyp/o
         YnPQ==
X-Gm-Message-State: AOJu0YynFk3Uj9InhnDM6inD7zny5feFA8NCZteJlQ/Chvuv1jSl5elp
	FTuJ1fWGodk9w1MPO1WpXlGRrPp+ogIUny3iATeERoQq1hEmGr+Ym4B/MX9N2/k0E1FK0j4fGMs
	uyUOyqKABv0G5u14505Btc8z95zPSz5feofk5dMqDSBNXRx5Rn+Gz83okLp4uZEpzx6YREVULmb
	TrdU0ECiXuSLIYrOpCU9ZMY+D1gVb8ul26rY/xiKwbGg==
X-Gm-Gg: AfdE7ckZuQRq+fi4csL8itirTVA0rB8/rutOC51T5xtOovPOdiMlK+SNipf7xevGT76
	3w1zxWUweOvDds5DMjrKEa+73yeDuOi5+thdS5cpMDXQeSheYAHRwjrIvQnQMCvUS/QD0pE+JFX
	lWRhf/s8lX/9Mz37pnrGOqYVUtsg88cQZnkm0H22m/JxqPiEU5OSE/0FumRJ3R/gG0l38=
X-Received: by 2002:a17:907:3f85:b0:bfd:6cf6:1952 with SMTP id a640c23a62f3a-c12aa121813mr103022366b.28.1782915582722;
        Wed, 01 Jul 2026 07:19:42 -0700 (PDT)
X-Received: by 2002:a17:907:3f85:b0:bfd:6cf6:1952 with SMTP id
 a640c23a62f3a-c12aa121813mr103019266b.28.1782915582251; Wed, 01 Jul 2026
 07:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
In-Reply-To: <20260701-sc8280xp-camcc-gdsc-clk-v1-1-ee28be1e8508@redhat.com>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 1 Jul 2026 10:19:29 -0400
X-Gm-Features: AVVi8CfCGnf-KThjG1Nb4ovigZ-th2kHNShcT0J5gP_7f9NEYeNnXTxLVCsszj0
Message-ID: <CABx5tqLPM6wjYkwrnT7hKOrY+WoL_J=2kfLuBkV48OPLmOXpFQ@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: add CLK_IGNORE_UNUSED to camcc_gdsc_clk
To: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115730-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jagadeesh.kona@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A4596EEB30

On Wed, Jul 1, 2026 at 10:16=E2=80=AFAM Brian Masney <bmasney@redhat.com> w=
rote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:
>
>     [   15.408367] titan_top_gdsc status stuck at 'on'
>     [   15.408429] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_lo=
gic+0x14c/0x160, CPU#2: kworker/u32:1/14
>     [   15.408462] Modules linked in: bnep vfat fat ath11k_pci(+) ath11k =
mac80211 cfg80211 mhi libarc4 snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_w=
cd_classh hci_uart snd_soc_wcd_common
>     snd_soc_sc8280xp soundwire_qcom snd_soc_wcd_mbhc snd_soc_qcom_sdw sli=
mbus snd_soc_qcom_common regmap_sdw btqca btrtl qcom_camss soundwire_bus bt=
bcm btintel snd_soc_sdca snd_soc_lpass_wsa_macro
>     bluetooth snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass=
_rx_macro snd_soc_hdmi_codec snd_soc_lpass_macro_common videobuf2_dma_sg ov=
5675 v4l2_fwnode videobuf2_memops
>     qcom_spmi_adc5 snd_soc_core qcom_spmi_adc_tm5 videobuf2_v4l2 snd_seq =
snd_seq_device videobuf2_common v4l2_async qcom_vadc_common qcom_spmi_temp_=
alarm pm8941_pwrkey industrialio videodev
>     snd_compress rfkill ac97_bus snd_pcm_dmaengine qcom_tsens mc qcom_eda=
c snd_pcm pci_pwrctrl_pwrseq qcom_cpufreq_hw snd_timer snd qcomtee soundcor=
e tee leds_gpio joydev binfmt_misc zram
>     lz4hc_compress governor_simpleondemand panel_edp msm xhci_plat_hcd nv=
me nvme_core dwc3 qcom_pm8008_regulator
>     [   15.408688]  ucsi_glink nvme_keyring nvme_auth pmic_glink_altmode =
udc_core typec_ucsi aux_hpd_bridge qcom_battmgr ulpi ubwc_config socinfo oc=
mem drm_gpuvm qcom_q6v5_pas drm_exec
>     qcom_pil_info leds_qcom_lpg gpu_sched led_class_multicolor rtc_pm8xxx=
 qcom_pbs qcom_common drm_display_helper qcom_pon qcom_glink_smem qcom_glin=
k ghash_ce pwrseq_qcom_wcn gpio_sbu_mux
>     qcom_stats phy_qcom_qmp_combo qcom_q6v5 gf128mul cec dispcc_sc8280xp =
phy_qcom_edp camcc_sc8280xp i2c_qcom_cci qcom_sysmon drm_dp_aux_bus mdt_loa=
der aux_bridge qcom_pm8008 i2c_hid_of_elan
>     dwc3_qcom_legacy llcc_qcom icc_bwmon gpi typec qcom_refgen_regulator =
phy_qcom_qmp_usb nvmem_qfprom qcom_ipcc phy_qcom_snps_femto_v2 gpucc_sc8280=
xp pinctrl_sc8280xp_lpass_lpi qcom_hwspinlock
>     pinctrl_lpass_lpi lpasscc_sc8280xp qrtr qcom_aoss pmic_glink pdr_inte=
rface phy_qcom_qmp_pcie qcom_smd qcom_pdr_msg icc_osm_l3 qcom_wdt qmi_helpe=
rs qcom_rng smp2p rpmsg_core gpio_keys pwm_bl
>     smem hid_multitouch fuse i2c_dev
>     [   15.408928] CPU: 2 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted =
7.1.0+ #2 PREEMPT(lazy)
>     [   15.408937] Hardware name: LENOVO 21BX0016US/21BX0016US, BIOS N3HE=
T88W (1.60 ) 03/14/2024
>     [   15.408942] Workqueue: pm pm_runtime_work
>     [   15.408959] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
>     [   15.408967] pc : gdsc_toggle_logic+0x14c/0x160
>     [   15.408978] lr : gdsc_toggle_logic+0x14c/0x160
>     [   15.408987] sp : ffff8000800f3b40
>     [   15.408991] x29: ffff8000800f3b40 x28: 0000000000000000 x27: 00000=
00000000000
>     [   15.409003] x26: 0000000000000000 x25: 0000000000000000 x24: 00000=
00000000000
>     [   15.409014] x23: 0000000000000000 x22: 0000000000000001 x21: ffffa=
33f298fca88
>     [   15.409024] x20: 0000000000000000 x19: ffffa33f298fc5b0 x18: 00cd1=
5db75dacefd
>     [   15.409035] x17: 000000040044ffff x16: ffffa33f3b1a3d88 x15: 726f7=
76b80000002
>     [   15.409045] x14: ffffffffffffffff x13: 0000000000000028 x12: 01010=
10101010101
>     [   15.409056] x11: 7f7f7f7f7f7f7f7f x10: fefeff3039313274 x9 : ffffa=
33f3a5edafc
>     [   15.409067] x8 : ffff8000800f3780 x7 : 0000000000000001 x6 : 00000=
00000000001
>     [   15.409078] x5 : ffff000bf3ca1288 x4 : 0000000000000000 x3 : ffff5=
cccb6a3f000
>     [   15.409088] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0=
00080ae0000
>     [   15.409098] Call trace:
>     [   15.409103]  gdsc_toggle_logic+0x14c/0x160 (P)
>     [   15.409115]  gdsc_disable+0x4c/0x190
>     [   15.409126]  _genpd_power_off+0xa0/0x1a8
>     [   15.409137]  genpd_power_off.part.0+0x180/0x2a0
>     [   15.409149]  genpd_runtime_suspend+0x218/0x310
>     [   15.409155]  __rpm_callback+0x50/0x1f8
>     [   15.409166]  rpm_callback+0x7c/0x90
>     [   15.409175]  rpm_suspend+0xe8/0x690
>     [   15.409185]  pm_runtime_work+0xd0/0xe0
>     [   15.409195]  process_one_work+0x18c/0x518
>     [   15.409208]  worker_thread+0x190/0x320
>     [   15.409218]  kthread+0x110/0x130
>     [   15.409227]  ret_from_fork+0x10/0x20
>
> camcc_sc8280xp_probe() has the following snippet:
>
>     /* Keep some clocks always-on */
>     qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
>
> This clock is required for GDSC transitions, so let's add the
> CLK_IGNORE_UNUSED flag so that it is not shutdown during the unused
> clock sweep.
>
> This was tested on a Lenovo Thinkpad x13s.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Suggested-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")

Sorry, noticed this literally as soon as I hit send. Plus CCed Bryan...

Brian


