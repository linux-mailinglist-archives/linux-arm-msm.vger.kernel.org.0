Return-Path: <linux-arm-msm+bounces-109259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IM+rFO06EGqeVAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:15:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D85D5B2D33
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1E3B4307079F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 10:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8EE3CEBBD;
	Fri, 22 May 2026 10:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pieb0C7C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0543A7F78
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 10:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446903; cv=none; b=NbM6JeReoF++tZTrrdmBhX2OqtzRe9YyGqC+JxgGYT8oWEUvGS4g/pPpK6JUulmD+TV1dsDRwCJpmEDqrUCe9M91X6/9oNlN/mVMiEUr+v84jZ2ARJXKqW3UUMRvGUjlCINmPKaaTAXok8EfxuYFivQdO2ZZ65EfXrbfyICMd/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446903; c=relaxed/simple;
	bh=CWHKbZXimVFzm0H6K2jkVftQaMnPuDxgdYxbzeyQIXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8i+TWsdUGFYT0CfEwcBsHiema2xKA9cjJn/JSD5ynq31kPTzTA4GhB8FxmYantNQLgfLuuPFpQFaM0LNTKh7uWfzYwHRli6ccY7KddTe1IhF/U3ERdBnzS+daLd0k1HTS/3B9N/ffUACXDsVk3ECMNarCHeQ3s0D3qWsAn2Vxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pieb0C7C; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c1ba7eeb6so7219439d50.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779446901; x=1780051701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QavqAkvNk1HceT8bIYAr95toaxgKAhaHoRrKKXDbiI=;
        b=Pieb0C7C/CqSlbgWb/R6aoj2vuEOYZ/t9ZXwJ8KWljEx11GjluHKHOpJyg6LJBUwbB
         YQAPIP9c8us06uToDMEbfsIOKL6FEufDpJEVxDe5WZytqPkjI3GA4azlL3Uuj6OubnaF
         zJK6dPFG7Svb4yPnQzfrzos/iVPmG1WWVfTs2xiR5gKQWnwafXJu0GiTOjwBLXIRRMR0
         5SseMbN5/m+rTbdXdcvPt2/9KbO79rrfvH8GqduL7/IFWxQdjMHHsHynvDqujWVTvdRi
         2FWRJmIibU/aGlC4DCLmsN6MpYyRPDXDvwjOBbn0cuRx7XJ67OErIwnDk+0A10SGMN42
         W9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446901; x=1780051701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QavqAkvNk1HceT8bIYAr95toaxgKAhaHoRrKKXDbiI=;
        b=VC8+vCg+ieU2xHNT8MVX4Tb4gHK1k10zL9q4nbY82R8/XAnikuD2lNHptK7pKUxnJe
         Wy4vQR/wMnD6l3ct3fU6osfOibHFvesROlm+JGG/Nn5KnzzPbpwuHk+LC1ZEu9xawYp9
         H9REudJpLe4broAfoELiwbIoQ7ZH+9Lg7AydrkX93kViSJsg+bbQ9p+OhrTGMxR6j5tA
         83hNwHJb24KiijzV7ctOYf4hLY8QyAQckhUzNkhbxZQdL3QOsgnS4l57WA7zTAOlX+UN
         2MMPNqmkw+9OmqYdMnlCCT6YWx1/H/VxONZ0K+H0hvlHZ5d1mitc0zr9DqPjgWbaNxQY
         oFzg==
X-Forwarded-Encrypted: i=1; AFNElJ+2RY/pfmtHO91BrbBN7HjKjDnb78sHFbsvTzQMmmc2MsqM0s19JWCjIUf++s/VQRXgTtg7hRhAW/x7Xz7C@vger.kernel.org
X-Gm-Message-State: AOJu0YzTANnpbN7u54fTV/C7wnykOv5mV8csEMIpwnx7lLRyjiNuufEV
	NG3fX90f4MzcoNKyE5XuHdd4gC+FU3L34KQNvXtkWzYo9AW7KU3CrOvn
X-Gm-Gg: Acq92OEYC0S9QXFRSoMiuVsGyXjx/ik1j66pBAb49afoRxfR1vGoLHAPmoP+iU8pNhu
	m28uE3op2pV/XBt6FmlSe7QP8QMSeHD+V7rEsty/zj5Dsgb2FNJoIPZdDgENQcA6OmvepzgZwec
	XhkmHqiIGP1ajji5U617TDE8CSDrLLXAewVwGCo4OFj6ZC8d9DHG2Iyln5yW07GN23jBKz4OCPl
	K6iiN0WvDxbBy1m11FgQ7OsLv5txMC3Cs3WDapuXZ9mM0RtDJtCfGyK4vO+JY4bngt/a75R/MZU
	ymaad7deTfynavTThYtcNySp74X1YYCaqKcUN8/3Z/DChYnrA+SBRnlfsEG91Pzy6g682C/l8pR
	O6an7YWSniicdRGMR9EsjhBtmU/HS+WYb0TZVMKaEaQELQf4s4ZsbFgU+Wfp8NFraMnetMMAYh7
	0sZvypsIXsgzqmO9hLriEewC2rUQ==
X-Received: by 2002:a05:690e:4394:b0:654:5d65:9ff4 with SMTP id 956f58d0204a3-65ec95f142emr2209900d50.10.1779446900633;
        Fri, 22 May 2026 03:48:20 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65ecfd9c82csm559840d50.15.2026.05.22.03.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:48:20 -0700 (PDT)
Message-ID: <01f9a303-846a-4048-8115-c94b9b78078a@gmail.com>
Date: Fri, 22 May 2026 13:48:13 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
To: Taniya Das <taniya.das@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260519-msm8939-venus-rfc-v8-0-542ec7557ebc@gmail.com>
 <e7WD-tbtAA7Bx0uDnXgPHto9hACWxgblhI2eitNHX4VYEgxOOceuY0sOS6KQnGiyTaDYaKudZt4k50z_vJVpnw==@protonmail.internalid>
 <20260519-msm8939-venus-rfc-v8-2-542ec7557ebc@gmail.com>
 <608dc53d-17a8-4230-9ebb-48a94bf03675@kernel.org>
 <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <6ae3a89c-f205-45c5-87c0-5550f78502d6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109259-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4D85D5B2D33
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 12:29 PM, Taniya Das wrote:
> 
> 
> On 5/20/2026 2:02 PM, Bryan O'Donoghue wrote:
>> On 19/05/2026 16:10, Erikas Bitovtas wrote:
>>> Allow Venus core GDSCs to have their control passed to hardware, so they
>>> can be powered on by Venus firmware.
>>>
>>> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
>>> ---
>>>   drivers/clk/qcom/gcc-msm8939.c | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-
>>> msm8939.c
>>> index 45193b3d714b..243d31a32e92 100644
>>> --- a/drivers/clk/qcom/gcc-msm8939.c
>>> +++ b/drivers/clk/qcom/gcc-msm8939.c
>>> @@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
>>>
>>>   static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
>>>       .halt_reg = 0x4c02c,
>>> +    .halt_check = BRANCH_HALT_SKIP,
> 
> please use .halt_check = BRANCH_HALT
> 
If I do that, the clock fails to power on on boot.
[   20.324488] ------------[ cut here ]------------
[   20.324520] gcc_venus0_core0_vcodec0_clk status stuck at 'off'
[   20.324663] WARNING: drivers/clk/qcom/clk-branch.c:88 at
clk_branch_toggle+0x124/0x170, CPU#7: (udev-worker)/1010
[   20.324723] Modules linked in: snd_soc_apq8016_sbc(+)
snd_soc_qcom_common venus_core(+) qcom_q6v5_mss(+) v4l2_mem2mem
qcom_pil_info videobuf2_v4l2 qcom_common qcom_q6v5 videobuf2_common
videodev mc qcom_memshare tun binfmt_misc nft_reject_inet nft_reject
nf_reject_ipv6 nf_reject_ipv4 nft_ct nf_conntrack zram nf_defrag_ipv6
nf_defrag_ipv4 zsmalloc lz4_compress zstd_compress nf_tables uhid uinput
fuse nfnetlink ipv6 xfs usb_f_ncm u_ether panel_asus_z00t_tm5p5_nt35596
edt_ft5x06 pm8916_bms_vm msm ubwc_config mdt_loader gpu_sched drm_gpuvm
drm_exec drm_display_helper cec libcomposite
[   20.325245] CPU: 7 UID: 0 PID: 1010 Comm: (udev-worker) Not tainted
7.0.0-msm8916 #41 PREEMPT
[   20.325273] Hardware name: Asus ZenFone 2 Laser/Selfie (1080p) (DT)
[   20.325290] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS
BTYPE=--)
[   20.325314] pc : clk_branch_toggle+0x124/0x170
[   20.325348] lr : clk_branch_toggle+0x120/0x170
[   20.325377] sp : ffff800082ab3430
[   20.325390] x29: ffff800082ab3440 x28: 0000000000000001 x27:
ffff0000236724c0
[   20.325435] x26: 0000000000000002 x25: ffff0000236724c0 x24:
0000000000000000
[   20.325477] x23: 0000000000000000 x22: ffff800081017b3e x21:
ffff8000813e9f38
[   20.325519] x20: ffff8000806f7f50 x19: 0000000000000001 x18:
0000000000000000
[   20.325560] x17: 0000000000000001 x16: 0000000000000800 x15:
0000000000000003
[   20.325601] x14: ffff800081315120 x13: 0000000000000003 x12:
0000000000000003
[   20.325643] x11: 0000000000000000 x10: 0000000000000027 x9 :
ebcfd48ff0c24800
[   20.325684] x8 : ebcfd48ff0c24800 x7 : 7461206b63757473 x6 :
0000000000000027
[   20.325725] x5 : ffff80008151038a x4 : ffff800080fc8d13 x3 :
0000000000000000
[   20.325766] x2 : 0000000000000000 x1 : ffff800082ab3200 x0 :
00000000fffffff0
[   20.325808] Call trace:
[   20.325821]  clk_branch_toggle+0x124/0x170 (P)
[   20.325859]  clk_branch2_enable+0x20/0x30
[   20.325894]  clk_core_enable+0x6c/0x2c8
[   20.325923]  clk_core_enable_lock+0x8c/0x120
[   20.325960]  clk_enable+0x1c/0x30
[   20.325994]  vcodec_clks_enable+0x4c/0xc8 [venus_core]
[   20.326190]  core_power_v1+0x270/0x2c0 [venus_core]
[   20.326370]  venus_runtime_resume+0x58/0x80 [venus_core]
[   20.326548]  pm_generic_runtime_resume+0x2c/0x48
[   20.326579]  __rpm_callback+0x80/0x470
[   20.326609]  rpm_resume+0x3cc/0x5f8
[   20.326637]  __pm_runtime_resume+0x4c/0x98
[   20.326665]  venus_probe+0x1fc/0x3b8 [venus_core]
[   20.326844]  platform_probe+0x60/0xa8
[   20.326881]  really_probe+0x154/0x448
[   20.326911]  __driver_probe_device+0xa4/0x120
[   20.326943]  driver_probe_device+0x44/0x230
[   20.326973]  __driver_attach+0xf0/0x280
[   20.327003]  bus_for_each_dev+0xf0/0x150
[   20.327031]  driver_attach+0x28/0x38
[   20.327061]  bus_add_driver+0x14c/0x2a8
[   20.327088]  driver_register+0x6c/0x108
[   20.327119]  __platform_driver_register+0x24/0x38
[   20.327154]  init_module+0x24/0xfb8 [venus_core]
[   20.327332]  do_one_initcall+0xe4/0x3e0
[   20.327363]  do_init_module+0x5c/0x248
[   20.327393]  load_module+0x16ac/0x18c0
[   20.327421]  __arm64_sys_finit_module+0x238/0x360
[   20.327449]  invoke_syscall+0x44/0xd8
[   20.327483]  el0_svc_common+0x84/0xe0
[   20.327515]  do_el0_svc+0x20/0x30
[   20.327547]  el0_svc+0x24/0x70
[   20.327582]  el0t_64_sync_handler+0x7c/0x120
[   20.327616]  el0t_64_sync+0x154/0x158
[   20.327643] ---[ end trace 0000000000000000 ]---


