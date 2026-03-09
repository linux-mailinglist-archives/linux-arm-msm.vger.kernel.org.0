Return-Path: <linux-arm-msm+bounces-96196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKqdGNmgrmm2GwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:28:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D722D2370D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4C07303011C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81B634F47E;
	Mon,  9 Mar 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3aSE+L+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F5238F947
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052084; cv=pass; b=WM5A1SopeJ8sN7JtpQI6CLN04T6RiP8hmOVAPbEqOB9gP2KE9TCQlDDpasx4xPaGU8vo5HUEIkYegE7Bc1z+y07a7KQ2QJD+0YG/y6mW7OhFFwgJj0aUA40vIQ8qe5l+x/otHsjeluXNA+cjrPXDveZSX0ykK6zD9OihrYDJUE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052084; c=relaxed/simple;
	bh=6f14elA8IIirriRdqQ4qpy+0nJEZrJZL2kf6Ne8X864=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=r3t6x3ejfSMzwLy9ZppfzsmdWU60VYmkEc6i3e86bjovY2Ey8OVNmi2PQ4otlTvd14HCZON7nS7CJoo8AkkZQW88YvgxjfMysAbz6h3xjS8Uh5V07tV5LIlICaWg0z3lMVjSaZ99+pgrucLXlVwJWgcW+4OgSivpy999ccGREnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3aSE+L+; arc=pass smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94de63dea9aso7071526241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 03:28:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773052082; cv=none;
        d=google.com; s=arc-20240605;
        b=TXcvFEnhjKVgiojwCvZC1ERzEqzsL2gnnQgHvtLakzDqbN+I/Xm6daD9qso18u2at3
         NUZs9ZTlr7gWO6br2O/pulRNl3N4mKTQDyIlxQnWBZubIHYQeUwhK51JSQV3DCI0N+zM
         xoPRwXO0I29Bc4sihXJeLakcOhRkI7EOXFQaknbscOmpvCHHBRLDEzg/MfrqXIW7MvLi
         1VwHZpv7fVF+/TiHm6VqrxW6w8WuD/Z6lfp08Isu1WCB8QB90N7PeBormEBtd9OtGwnC
         /XrmqtI79gGvBCVBDvfkQjmb0EUY80qr7Ao91aeifUdVNEjJhAcaLTM4D1ypUigZmAlc
         pMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=47FvQEMiG9H1DdZUcvw6rDThxg0r8NhOMc8DeHXZ1bg=;
        fh=ubDufhPiiEVnV6Bu7Ms5MheVSXRSgx/yLfK7wc110Z8=;
        b=l11uhcp8AIgI1KT7uahVjFwrcWpb/KbIN235jJuvj+wYT1Kb8Jak7hAo3xnKXx8vMW
         dDbopWIOrntpAwcws1Zo2pPOfnIMue9KbX2LnvG1i2jNLHaHRo5zCvi3CUsHxDT3QMCu
         Rlpkc8oJ87PtwGHZGrWBzaeVGhcNGKcDF0x93Z475QqrkBNBGBLR5RtEQKebuyApm69F
         E1WWzmyY8XIn8tGudgW69K1FiIT0dCbdbEiXrauA5tlqO1IrmnqT8xLp+bhuYEtLL2Rh
         5ESJ1eUodjNAYMP7DL1Z8qm2/F13N6tCTH9OW+rSt28YowNClgurjtOovHJxmp/0JXCT
         E0rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052082; x=1773656882; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47FvQEMiG9H1DdZUcvw6rDThxg0r8NhOMc8DeHXZ1bg=;
        b=d3aSE+L+Nv/30Fp7G6KsCXcMzHtTYr/77eC/KOeAaPRtmSI1NLtJrZHR37FdQbdWTi
         G5xSFFwK1z6/EF/pz9nSIbBbGkNPodOoNTQm+yXZmMdNUzW30jhBiCG8jFhe/s+MOWVw
         ydauJeB/YWK/6El/r+QJUNi2RLW/cfaioC/F+qr49ZMS+HKLOH1j/lCOvWMONDVBVAt4
         OaZkq+uYL5f2/Wy1DvMBXm0eEFQ0czrvkyhLaMPRC0XGVQ33HSZyJ3CyyamRMBsZ3HgS
         bX9C14rYlEevX5ROtOTrW4WkXMywUfNwzNmA0GjAEl5qz0w+msMleDJLcFvboCgcozAe
         hGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052082; x=1773656882;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47FvQEMiG9H1DdZUcvw6rDThxg0r8NhOMc8DeHXZ1bg=;
        b=AjcACWv8eYPKMboiABEcvRoy7NJ3VENzDDeLxFkvvjGgBOfuzWFlGBDcNUXHem4ei8
         UIfbRsz/tG0Sle/A9DlaAUXN0mg1rmqhKEr5r7MYAJlNLOlUzkgb+P/lIs5wRSlZ4LTv
         xE9JpmOZ2sAzICdLtaTU4OWHyrJTz5HhZDfBHla6K/LuZWcAL83mdkR3VIUg3Iy5AmMy
         ZGSBDepbBZT4/Ieja0eRuiKpnW3Vv1oC7Mv1SJciql6UVb1YZpfwzCOhyHcO/JW+El2O
         BstmpM4F55VB/QJVAs4XdIiBRfDYG5mHUzZtHV3iGNXAFBbFtkeX1218PucPTxB2mUH7
         VtiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQGIrpde8uMmrFUiu4f9vTT8OXwoPzOHQBh2mi4OIrQypL9CLWBo+vEKF8ejsoNiT26v2DC3FvJ5Hk+KiA@vger.kernel.org
X-Gm-Message-State: AOJu0YxybLXBwtiH/6STk5mzOy10TBLpKpzbE7VzD9WGn3Gol9Lmzxkj
	8TOybXySjg9SUleFSMhXsC8cbyl9YMBqTbM/rqCwvuOlIvsjkcAVVYT4f2ulQJki9AoBem6K/ox
	v2t+ceaFamGOceE2aIJwhej8nybiG3/T5++ESCfYztA==
X-Gm-Gg: ATEYQzxEOJOcfaAXH99iKkHpvJVShgeL8MVI5F2nPhRiAwAPo9JlkdvVyNeoObMkFcz
	TKfgQgR6vPqv6aw10ACQDygJiMC8DBABrgTc6kRCfU4rh7YDxOIyHtdYnZiJjqbjsVCzwUsGXgS
	lQ9jIk7BlW00bPqJ68+gHZSJ2hgfFFcH0rzNq/sjpXmtYHCTTF4fWqVPwPZk/FEtr+GcfWyzj1/
	p1QlPKk+BHzmmzo0oL2PZ80L1y7/UZk5GXHbprUEhkH+CIh/1qcmDadgt3/wn7MmCtP91QYcOYY
	+6BDMNxh
X-Received: by 2002:a05:6102:32c1:b0:5ff:ba2d:17ab with SMTP id
 ada2fe7eead31-5ffe5ecf73emr4058677137.8.1773052082024; Mon, 09 Mar 2026
 03:28:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 9 Mar 2026 18:27:40 +0800
X-Gm-Features: AaiRm52n0mEqkIkAfJNxnqmAil_gDRCCcRZGE1BviAPFVckHxkj84uxVGDCdZzk
Message-ID: <CAH2e8h4R-nF+eV+OnkSySKSY5_H-V8Ndyfhac3=VNQ-bMaBeFg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: sm8750: Add GPU clock & IOMMU nodes
To: taniya.das@oss.qualcomm.com
Cc: abel.vesa@oss.qualcomm.com, ajit.pandey@oss.qualcomm.com, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	imran.shaik@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D722D2370D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96196-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.875];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, Mar 5, 2026 6:40 PM Taniya Das <taniya.das@oss.qualcomm.com> wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Add the GPU_CC and GX_CC (brand new! as far as we're concerned, this
> is simply a separate block housing the GX GDSC) nodes, required to
> power up the graphics-related hardware.
>
> Make use of it by enabling the associated IOMMU as well. The GPU itself
> needs some more work and will be enabled later.
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>

Hi Taniya and Konrad, GX GDSC stuck at 'on' on my device
the raw register values are

0x3d68024: 0x00000000
0x3d68028: 0x00000000

[    0.593882] msm_dpu ae01000.display-controller: bound 3d00000.gpu
(ops a3xx_ops)
[    0.594237] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0xc0000000
[    0.598140] [drm] Initialized msm 1.13.0 for
ae01000.display-controller on minor 0
[    0.598213] msm_dpu ae01000.display-controller:
[drm:adreno_request_fw] loaded qcom/gen80000_sqe.fw from new location
[    0.598267] msm_dpu ae01000.display-controller:
[drm:adreno_request_fw] loaded qcom/gen80000_gmu.bin from new location
[    0.598288] msm_dpu ae01000.display-controller:
[drm:adreno_request_fw] loaded qcom/gen80000_aqe.fw from new location
[    0.600620] [drm] Loaded GMU firmware v5.1.25
[    0.698366] ------------[ cut here ]------------
[    0.698368] gx_clkctl_gx_gdsc status stuck at 'on'
[    0.698385] WARNING: drivers/clk/qcom/gdsc.c:178 at
gdsc_toggle_logic+0x140/0x160, CPU#3: kworker/u33:3/84
[    0.698394] Modules linked in: fastrpc qrtr_smd rpmsg_ctrl
panel_nt36536(+) joydev mousedev qcom_pd_mapper ucsi_glink
pmic_glink_altmode typec_ucsi aux_hpd_bridge qcom_battmgr aw99706
nvmem_qcom_spmi_sdam nt36532_ts qcom_spmi_temp_alarm fsa4480
regmap_i2c phy_nxp_ptn3222 industrialio rtc_pm8xxx qcom_stats
phy_qcom_qmp_combo aux_bridge typec qcom_q6v5_pas qcom_pil_info
qcom_common phy_qcom_m31_eusb2 qcom_q6v5 qcom_sysmon icc_bwmon
qcom_rng sm3_ce qrtr nvmem_reboot_mode arm_smccc_trng pmic_glink
rng_core
[    0.698445] CPU: 3 UID: 0 PID: 84 Comm: kworker/u33:3 Not tainted
6.19.6-sm8750+ #5 PREEMPT
[    0.698450] Hardware name: LENOVO TB322FC (DT)
[    0.698452] Workqueue: pm pm_runtime_work
[    0.698457] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    0.698462] pc : gdsc_toggle_logic+0x140/0x160
[    0.698466] lr : gdsc_toggle_logic+0x140/0x160
[    0.698469] sp : ffff8000810bb920
[    0.698471] x29: ffff8000810bb920 x28: 0000000000000000 x27: 0000000000000000
[    0.698477] x26: ffff000800065428 x25: 0000000000000008 x24: 0000000000000000
[    0.698482] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000001
[    0.698487] x20: 0000000000000000 x19: ffffa3c20a6abb98 x18: ffff5c4963eb2000
[    0.698492] x17: ffff000800a062c0 x16: ffffa3c20a71a510 x15: ffffa3c20a56d230
[    0.698497] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
[    0.698502] x11: 0000000000000058 x10: 0000000000000027 x9 : ffffa3c208f81e50
[    0.698507] x8 : 0000000000000027 x7 : 7461206b63757473 x6 : 0000000000000000
[    0.698512] x5 : 0000000000000001 x4 : 00000000fffc025b x3 : 00000000ffffffff
[    0.698517] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000802511f80
[    0.698522] Call trace:
[    0.698524]  gdsc_toggle_logic+0x140/0x160 (P)
[    0.698528]  gdsc_disable+0x4c/0x190
[    0.698533]  _genpd_power_off+0xa4/0x1a8
[    0.698538]  genpd_power_off.part.0+0x170/0x270
[    0.698543]  genpd_power_off+0x50/0x68
[    0.698548]  genpd_runtime_suspend+0x1e4/0x2e8
[    0.698553]  __rpm_callback+0x50/0x220
[    0.698560]  rpm_callback+0x7c/0x90
[    0.698567]  rpm_suspend+0xe8/0x590
[    0.698573]  rpm_idle+0x128/0x3c0
[    0.698580]  __pm_runtime_idle+0x58/0x100
[    0.698587]  a6xx_gmu_stop+0x74/0x3e0
[    0.698592]  a6xx_gmu_pm_suspend+0x48/0x118
[    0.698597]  adreno_runtime_suspend+0x38/0x68
[    0.698604]  pm_generic_runtime_suspend+0x34/0x60
[    0.698609]  __rpm_callback+0x50/0x220
[    0.698616]  rpm_callback+0x7c/0x90
[    0.698622]  rpm_suspend+0xe8/0x590
[    0.698629]  pm_runtime_work+0xcc/0xe0
[    0.698632]  process_one_work+0x15c/0x3c0
[    0.698638]  worker_thread+0x18c/0x320
[    0.698642]  kthread+0x148/0x208
[    0.698646]  ret_from_fork+0x10/0x20
[    0.698653] ---[ end trace 0000000000000000 ]---

[    6.710781] ------------[ cut here ]------------
[    6.710786] gx_clkctl_gx_gdsc status stuck at 'on'
[    6.710793] WARNING: drivers/clk/qcom/gdsc.c:178 at
gdsc_toggle_logic+0x140/0x160, CPU#5: kworker/u33:5/143
[    6.710799] Modules linked in: snd_q6apm snd_soc_core snd_compress
snd_pcm snd_timer snd soundcore fastrpc qrtr_smd rpmsg_ctrl
panel_nt36536 joydev mousedev qcom_pd_mapper ucsi_glink
pmic_glink_altmode typec_ucsi aux_hpd_bridge qcom_battmgr aw99706
nvmem_qcom_spmi_sdam nt36532_ts qcom_spmi_temp_alarm fsa4480
regmap_i2c phy_nxp_ptn3222 industrialio rtc_pm8xxx qcom_stats
phy_qcom_qmp_combo aux_bridge typec qcom_q6v5_pas qcom_pil_info
qcom_common phy_qcom_m31_eusb2 qcom_q6v5 qcom_sysmon icc_bwmon
qcom_rng sm3_ce qrtr nvmem_reboot_mode arm_smccc_trng pmic_glink
rng_core
[    6.710831] CPU: 5 UID: 0 PID: 143 Comm: kworker/u33:5 Tainted: G
     W           6.19.6-sm8750+ #5 PREEMPT
[    6.710833] Tainted: [W]=WARN
[    6.710834] Hardware name: LENOVO TB322FC (DT)
[    6.710835] Workqueue: pm pm_runtime_work
[    6.710837] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    6.710839] pc : gdsc_toggle_logic+0x140/0x160
[    6.710840] lr : gdsc_toggle_logic+0x140/0x160
[    6.710842] sp : ffff80008205b920
[    6.710842] x29: ffff80008205b920 x28: 0000000000000000 x27: 0000000000000000
[    6.710845] x26: ffff000800065428 x25: 0000000000000008 x24: 0000000000000000
[    6.710847] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000001
[    6.710849] x20: 0000000000000000 x19: ffffa3c20a6abb98 x18: 000000000000000a
[    6.710851] x17: 0000000006000000 x16: 0000000000000000 x15: 0000000000000000
[    6.710853] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
[    6.710856] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffa3c208f81e50
[    6.710858] x8 : 00000000015fffa8 x7 : 0000000000000316 x6 : 0000000000000001
[    6.710860] x5 : ffff000b6e3a17c8 x4 : ffff5c4963ef2000 x3 : ffff000807c95e80
[    6.710862] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000807c95e80
[    6.710864] Call trace:
[    6.710865]  gdsc_toggle_logic+0x140/0x160 (P)
[    6.710867]  gdsc_disable+0x4c/0x190
[    6.710869]  _genpd_power_off+0xa4/0x1a8
[    6.710871]  genpd_power_off.part.0+0x170/0x270
[    6.710873]  genpd_power_off+0x50/0x68
[    6.710874]  genpd_runtime_suspend+0x1e4/0x2e8
[    6.710876]  __rpm_callback+0x50/0x220
[    6.710879]  rpm_callback+0x7c/0x90
[    6.710881]  rpm_suspend+0xe8/0x590
[    6.710883]  rpm_idle+0x128/0x3c0
[    6.710885]  __pm_runtime_idle+0x58/0x100
[    6.710887]  a6xx_gmu_stop+0x74/0x3e0
[    6.710890]  a6xx_gmu_pm_suspend+0x48/0x118
[    6.710892]  adreno_runtime_suspend+0x38/0x68
[    6.710894]  pm_generic_runtime_suspend+0x34/0x60
[    6.710896]  __rpm_callback+0x50/0x220
[    6.710898]  rpm_callback+0x7c/0x90
[    6.710900]  rpm_suspend+0xe8/0x590
[    6.710902]  pm_runtime_work+0xcc/0xe0
[    6.710903]  process_one_work+0x15c/0x3c0
[    6.710906]  worker_thread+0x18c/0x320
[    6.710908]  kthread+0x148/0x208
[    6.710909]  ret_from_fork+0x10/0x20
[    6.710912] ---[ end trace 0000000000000000 ]---
[    6.726652] adreno 3d00000.gpu: CP Fault Global INT status: 0x10000
[    6.726659] adreno 3d00000.gpu: CP SW FAULT pipe: 1 status: 0x400
[    6.726661] adreno 3d00000.gpu: CP REG PROTECT error, status=0x608212
[    6.726736] msm_dpu ae01000.display-controller:
[drm:recover_worker] *ERROR* 68.5.0.1: hangcheck recover!
[    6.726748] msm_dpu ae01000.display-controller:
[drm:recover_worker] *ERROR* 68.5.0.1: offending task: kwin_wayland
(/usr/bin/kwin_wayland --wayland-fd 7 --socket wayland-0 --xwayland-fd
8 --xwayland-fd 9 --xwayland-display :0 --xwayland-xauthority
/run/user/1000/xauth_UWXqvr --xwayland)
[    6.726754] revision: 0 (68.5.0.1)
[    6.726756] rb 0: fence:    -255/-254
[    6.726757] rptr:     64
[    6.726758] rb wptr:  168
[    6.728919] ------------[ cut here ]------------
[    6.728921] gx_clkctl_gx_gdsc status stuck at 'on'
[    6.728927] WARNING: drivers/clk/qcom/gdsc.c:178 at
gdsc_toggle_logic+0x140/0x160, CPU#2: gpu-worker/230
[    6.728931] Modules linked in: snd_q6apm snd_soc_core snd_compress
snd_pcm snd_timer snd soundcore fastrpc qrtr_smd rpmsg_ctrl
panel_nt36536 joydev mousedev qcom_pd_mapper ucsi_glink
pmic_glink_altmode typec_ucsi aux_hpd_bridge qcom_battmgr aw99706
nvmem_qcom_spmi_sdam nt36532_ts qcom_spmi_temp_alarm fsa4480
regmap_i2c phy_nxp_ptn3222 industrialio rtc_pm8xxx qcom_stats
phy_qcom_qmp_combo aux_bridge typec qcom_q6v5_pas qcom_pil_info
qcom_common phy_qcom_m31_eusb2 qcom_q6v5 qcom_sysmon icc_bwmon
qcom_rng sm3_ce qrtr nvmem_reboot_mode arm_smccc_trng pmic_glink
rng_core
[    6.728963] CPU: 2 UID: 0 PID: 230 Comm: gpu-worker Tainted: G
  W           6.19.6-sm8750+ #5 PREEMPT
[    6.728965] Tainted: [W]=WARN
[    6.728966] Hardware name: LENOVO TB322FC (DT)
[    6.728967] pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
[    6.728969] pc : gdsc_toggle_logic+0x140/0x160
[    6.728970] lr : gdsc_toggle_logic+0x140/0x160
[    6.728971] sp : ffff800080f7b880
[    6.728972] x29: ffff800080f7b880 x28: 0000000000000000 x27: ffff000802674b70
[    6.728975] x26: ffff00080db71080 x25: 0000000000000008 x24: 0000000000000000
[    6.728977] x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000001
[    6.728979] x20: 0000000000000000 x19: ffffa3c20a6abb98 x18: 000000000000000a
[    6.728981] x17: 0005004800000000 x16: 0000000000050040 x15: 0000000000000000
[    6.728983] x14: 0000000000000000 x13: 6f27207461206b63 x12: 7574732073757461
[    6.728985] x11: 0000000000000058 x10: 0000000000000018 x9 : ffffa3c208f81e50
[    6.728988] x8 : 00000000015fffa8 x7 : 000000000000034e x6 : 0000000000000001
[    6.728990] x5 : ffff000b6e3417c8 x4 : ffff5c4963e92000 x3 : ffff0008089a2f40
[    6.728992] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0008089a2f40
[    6.728994] Call trace:
[    6.728995]  gdsc_toggle_logic+0x140/0x160 (P)
[    6.728997]  gdsc_disable+0x4c/0x190
[    6.728999]  _genpd_power_off+0xa4/0x1a8
[    6.729001]  genpd_power_off.part.0+0x170/0x270
[    6.729003]  genpd_power_off+0x50/0x68
[    6.729005]  genpd_runtime_suspend+0x1e4/0x2e8
[    6.729007]  __rpm_callback+0x50/0x220
[    6.729009]  rpm_callback+0x7c/0x90
[    6.729011]  rpm_suspend+0xe8/0x590
[    6.729014]  rpm_idle+0x128/0x3c0
[    6.729016]  __pm_runtime_idle+0x58/0x100
[    6.729018]  a6xx_gmu_stop+0x74/0x3e0
[    6.729020]  a6xx_gmu_pm_suspend+0x48/0x118
[    6.729022]  adreno_runtime_suspend+0x38/0x68
[    6.729024]  pm_generic_runtime_suspend+0x34/0x60
[    6.729026]  __rpm_callback+0x50/0x220
[    6.729028]  rpm_callback+0x7c/0x90
[    6.729030]  rpm_suspend+0xe8/0x590
[    6.729032]  rpm_idle+0x128/0x3c0
[    6.729034]  __pm_runtime_idle+0x58/0x100
[    6.729037]  a8xx_recover+0x1a0/0x2c0
[    6.729039]  recover_worker+0x244/0x390
[    6.729041]  kthread_worker_fn+0xe0/0x2a0
[    6.729044]  kthread+0x148/0x208
[    6.729045]  ret_from_fork+0x10/0x20
[    6.729047] ---[ end trace 0000000000000000 ]---

Best wishes,
Pengyu

