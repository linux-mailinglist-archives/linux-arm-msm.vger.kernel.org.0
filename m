Return-Path: <linux-arm-msm+bounces-114721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N2x8LTqdP2oPVAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 11:51:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3366D1AD9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 11:51:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=QncM65aG;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114721-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114721-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BEA75301546D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 09:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C693396B73;
	Sat, 27 Jun 2026 09:51:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC36391E51
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 09:51:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782553912; cv=none; b=tTnOHhRrM8BaQ6shpnFFGgl1SIvJr2Itei1nfpXvc3H47ku1tjGfPRKiObLEYduLkAgGX92LmOx7yhcdsvRpMYc9X0vQBYf8R0UFuKTyWsw9miswRwsJMCAkqUAKHcXOgGJ99/Vlc07lIowEXEP/5orwYGAXBHSOp62mZ2wtxjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782553912; c=relaxed/simple;
	bh=qxBTjKasMHqvbqtN1gvUmV8p7xZ0oZADgXOJVLPl7As=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfUVP2X/nt58AM+E6lcaVl342IwCJHuqFNXGere6jCHQlwrA7nCZ5xXvgeXH0Mf68Q+CGv+PpHMeQcR36yzP+TgoIe8CIIx7TzeT+xAVw68Q8pW6ZqGcs1msCC1yK87zIkIUGXfNiBCk4LeA8tedT200k69QPearpIb1JciBfJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QncM65aG; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4926d6b177eso6876185e9.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 02:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782553909; x=1783158709; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQ5hBcDFXzdMMWhKi4/R32A+an3Job3dVyCIe2d2DCE=;
        b=QncM65aGq1zsZDAFH0F3kQGGtYFxCr4pf5a+Tu8cXVwqKqRZiXBNOLp2oZlDMfx1Dq
         crq6IJRuZedcxDSoGx07ByUYQ9VRUNgaui/6oDTvQjJXQ8MxrQGzJYpBcDR9j0f2ofSL
         +3PIfqds79wj8Mm2wMAR5Hwsq4ZqWhwJb/7tIBpD0sQ9yGTNpnK2wukaXRC0cqwAamcA
         ChZrl5CI69BJ5xIh8MGxOJYbj3e4H6dKvc+mLfudQjRmsLv5kQl4aydCpRAYeGpk0GMo
         uygEKVLuxdIEcU64QYx0c0yckAh1YkBUFXvB2qChcNiRPjJzXYc0LCR8ZAG2dwLckysz
         /U0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782553909; x=1783158709;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eQ5hBcDFXzdMMWhKi4/R32A+an3Job3dVyCIe2d2DCE=;
        b=iVBLgtmVponB9uGNNIA4L9knc0ZneDPt835oKIyE7eoIHjeTi1jmGcxs2PhGigeB7h
         wEtq+lf4r3ZKye7ITItfLdSY13HyUYbMNJfeHMm/znCApkx9NZiCDCCwZ7HnevLh351l
         6lfksOFUGFMtNYdBK9rNl/uRVW1I4u7r9FcHvUt4K09cP6VUzYnomCl5qPYvHrhuCUhm
         SS4xh92b/7C8Qz6J84GNxQTPrLAC1eVqEmAM5+eIATuIH/kHbAN/qU4OlfqPsl6OHsSN
         meu80+gDd9wijYm5ZF4rvH4bjEcmcgGSpkRuyeRVQmLzNooDCEsg78xKU6CbwM5I0rFC
         dchQ==
X-Gm-Message-State: AOJu0YwJv+r4NXqZwFaoMQm0Wd8LSEaKCHFWxWgO7GQUB3LhqY/i986d
	rkhMcrNtCJiP3T6X/w89nz4fJG2ksOvQgiw/2tdiaupNGAE/4DTT4Hy5/ryHNedfBE4=
X-Gm-Gg: AfdE7cl6euCPBFlFU8umNF7URRynwnSKb68DKYRQHzz9ezEo/5v58gWl2JNcNuMoNy5
	3kiDslui6sZbcmqocDytZIrtvXxfIfT59ahviC+MxXnVHmwd3TTRCS8C3Dtj5juSPWR1K7u31RI
	ppqFQ4OsZUunVBo6wxrwflkDEH0aLcv8I37sEZHH7fStfS5YQS3/lIsaAHYZRbpKvIMgwhTryG2
	/7xc2JA3MUDyYnOnVm3XKaMGexfA4q7n9VBhINOFtLhnKmsnidqFS+BuONdMlPWBqe0JP34EJg7
	3h4KkjNKollI55S3vs6U4ua2aQUtOCjNTqpo/HzzxLhA+KmLh25oZXpJ97TRhNG21Ixg2EDw1YD
	oNQCVmKCrZi3xICs+KrxjCFzwGE+jUhyO/pEQCc8MD50TCNVxBgJI1nwHQDWDgCGNRnuSlvcgjC
	XGbkBo0M18mAkQOxV3+smjyCs=
X-Received: by 2002:a05:600c:1f91:b0:490:b724:507d with SMTP id 5b1f17b1804b1-4926684a61fmr138221645e9.11.1782553909003;
        Sat, 27 Jun 2026 02:51:49 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.8.183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269086ab7sm223569085e9.13.2026.06.27.02.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 02:51:48 -0700 (PDT)
Message-ID: <556dc88a-42c0-4d5a-8a37-bc4959d72ffa@linaro.org>
Date: Sat, 27 Jun 2026 10:51:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: enable ALWAYS_ON for titan_top_gdsc
To: Brian Masney <bmasney@redhat.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260626-camcc-sc8280xp-titan-top-v1-1-2ca246886493@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114721-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0D3366D1AD9

On 26/06/2026 17:26, Brian Masney wrote:
> With the introduction of sync_state support in the clk and pmdomain
> subsystems, the following warning happens when the unused clocks are
> shutdown in camcc-sc8280xp:
> 
>      [   15.408367] titan_top_gdsc status stuck at 'on'
>      [   15.408429] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x14c/0x160, CPU#2: kworker/u32:1/14
>      [   15.408462] Modules linked in: bnep vfat fat ath11k_pci(+) ath11k mac80211 cfg80211 mhi libarc4 snd_soc_wcd938x snd_soc_wcd938x_sdw snd_soc_wcd_classh hci_uart snd_soc_wcd_common
>      snd_soc_sc8280xp soundwire_qcom snd_soc_wcd_mbhc snd_soc_qcom_sdw slimbus snd_soc_qcom_common regmap_sdw btqca btrtl qcom_camss soundwire_bus btbcm btintel snd_soc_sdca snd_soc_lpass_wsa_macro
>      bluetooth snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_rx_macro snd_soc_hdmi_codec snd_soc_lpass_macro_common videobuf2_dma_sg ov5675 v4l2_fwnode videobuf2_memops
>      qcom_spmi_adc5 snd_soc_core qcom_spmi_adc_tm5 videobuf2_v4l2 snd_seq snd_seq_device videobuf2_common v4l2_async qcom_vadc_common qcom_spmi_temp_alarm pm8941_pwrkey industrialio videodev
>      snd_compress rfkill ac97_bus snd_pcm_dmaengine qcom_tsens mc qcom_edac snd_pcm pci_pwrctrl_pwrseq qcom_cpufreq_hw snd_timer snd qcomtee soundcore tee leds_gpio joydev binfmt_misc zram
>      lz4hc_compress governor_simpleondemand panel_edp msm xhci_plat_hcd nvme nvme_core dwc3 qcom_pm8008_regulator
>      [   15.408688]  ucsi_glink nvme_keyring nvme_auth pmic_glink_altmode udc_core typec_ucsi aux_hpd_bridge qcom_battmgr ulpi ubwc_config socinfo ocmem drm_gpuvm qcom_q6v5_pas drm_exec
>      qcom_pil_info leds_qcom_lpg gpu_sched led_class_multicolor rtc_pm8xxx qcom_pbs qcom_common drm_display_helper qcom_pon qcom_glink_smem qcom_glink ghash_ce pwrseq_qcom_wcn gpio_sbu_mux
>      qcom_stats phy_qcom_qmp_combo qcom_q6v5 gf128mul cec dispcc_sc8280xp phy_qcom_edp camcc_sc8280xp i2c_qcom_cci qcom_sysmon drm_dp_aux_bus mdt_loader aux_bridge qcom_pm8008 i2c_hid_of_elan
>      dwc3_qcom_legacy llcc_qcom icc_bwmon gpi typec qcom_refgen_regulator phy_qcom_qmp_usb nvmem_qfprom qcom_ipcc phy_qcom_snps_femto_v2 gpucc_sc8280xp pinctrl_sc8280xp_lpass_lpi qcom_hwspinlock
>      pinctrl_lpass_lpi lpasscc_sc8280xp qrtr qcom_aoss pmic_glink pdr_interface phy_qcom_qmp_pcie qcom_smd qcom_pdr_msg icc_osm_l3 qcom_wdt qmi_helpers qcom_rng smp2p rpmsg_core gpio_keys pwm_bl
>      smem hid_multitouch fuse i2c_dev
>      [   15.408928] CPU: 2 UID: 0 PID: 14 Comm: kworker/u32:1 Not tainted 7.1.0+ #2 PREEMPT(lazy)
>      [   15.408937] Hardware name: LENOVO 21BX0016US/21BX0016US, BIOS N3HET88W (1.60 ) 03/14/2024
>      [   15.408942] Workqueue: pm pm_runtime_work
>      [   15.408959] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>      [   15.408967] pc : gdsc_toggle_logic+0x14c/0x160
>      [   15.408978] lr : gdsc_toggle_logic+0x14c/0x160
>      [   15.408987] sp : ffff8000800f3b40
>      [   15.408991] x29: ffff8000800f3b40 x28: 0000000000000000 x27: 0000000000000000
>      [   15.409003] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
>      [   15.409014] x23: 0000000000000000 x22: 0000000000000001 x21: ffffa33f298fca88
>      [   15.409024] x20: 0000000000000000 x19: ffffa33f298fc5b0 x18: 00cd15db75dacefd
>      [   15.409035] x17: 000000040044ffff x16: ffffa33f3b1a3d88 x15: 726f776b80000002
>      [   15.409045] x14: ffffffffffffffff x13: 0000000000000028 x12: 0101010101010101
>      [   15.409056] x11: 7f7f7f7f7f7f7f7f x10: fefeff3039313274 x9 : ffffa33f3a5edafc
>      [   15.409067] x8 : ffff8000800f3780 x7 : 0000000000000001 x6 : 0000000000000001
>      [   15.409078] x5 : ffff000bf3ca1288 x4 : 0000000000000000 x3 : ffff5cccb6a3f000
>      [   15.409088] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080ae0000
>      [   15.409098] Call trace:
>      [   15.409103]  gdsc_toggle_logic+0x14c/0x160 (P)
>      [   15.409115]  gdsc_disable+0x4c/0x190
>      [   15.409126]  _genpd_power_off+0xa0/0x1a8
>      [   15.409137]  genpd_power_off.part.0+0x180/0x2a0
>      [   15.409149]  genpd_runtime_suspend+0x218/0x310
>      [   15.409155]  __rpm_callback+0x50/0x1f8
>      [   15.409166]  rpm_callback+0x7c/0x90
>      [   15.409175]  rpm_suspend+0xe8/0x690
>      [   15.409185]  pm_runtime_work+0xd0/0xe0
>      [   15.409195]  process_one_work+0x18c/0x518
>      [   15.409208]  worker_thread+0x190/0x320
>      [   15.409218]  kthread+0x110/0x130
>      [   15.409227]  ret_from_fork+0x10/0x20
> 
> Let's go ahead and add the flag ALWAYS_ON to titan_top_gdsc so that it
> is not disabled in the unused clock sweep.
> 
> Fixes: ff93872a9c616 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-6
> ---
>   drivers/clk/qcom/camcc-sc8280xp.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c b/drivers/clk/qcom/camcc-sc8280xp.c
> index 18f5a3eb313e..52e1a786083f 100644
> --- a/drivers/clk/qcom/camcc-sc8280xp.c
> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
> @@ -2803,7 +2803,7 @@ static struct gdsc titan_top_gdsc = {
>   	.pd = {
>   		.name = "titan_top_gdsc",
>   	},
> -	.flags = RETAIN_FF_ENABLE,
> +	.flags = ALWAYS_ON | RETAIN_FF_ENABLE,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
>   
> 
> ---
> base-commit: 6c94b38b83a04c43ea49004275f0391404051093
> change-id: 20260626-camcc-sc8280xp-titan-top-196cf6757b49
> 
> Best regards,

If it is stuck at on, that is almost certainly because one of the child 
gdscs is still on.

Hmm, I should probably fix my bootloader on x13s and see if I can 
repliate this bug.

---
bod

