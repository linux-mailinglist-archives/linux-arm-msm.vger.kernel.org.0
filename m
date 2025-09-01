Return-Path: <linux-arm-msm+bounces-71411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AA6B3E76C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 16:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA68C167194
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Sep 2025 14:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B95631B124;
	Mon,  1 Sep 2025 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b="YTI5spLH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E66C33CE81
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Sep 2025 14:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756737657; cv=none; b=icOPFIrh0+yIVYq1DLwTXdnoLPXmgEYgzYHOn4dRD/V95Pcyp1EH78faFlOW0VmB8rC6qSbxMgNvTYjjXkfpnzaLtWszbQos5o2drjJlwM2fgXyTzDRcR+G/9s+CVeNcisueTOuaqC3FXUfSWLCTtNwnGxSHzm9M/2EYYb7cffI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756737657; c=relaxed/simple;
	bh=LTmf4g5EKHIqjdApsEp4MvWbFJM2ZuxYprDG+zknpL8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZQj/VWIsQvlCWGsQMEeAihEZ7sVN3blen44z8BzeajRmwAQntI001/4yx/vEIajOtcAcf0pE5UM6wUi5LY7+QPcgxVF6Ej7yNaVmx6aPzSdGPKIKXuhi2lsf0gpgvwMkyEI3XiCAHpQsgvG7oTwReQEZFBftzlmdc0Ids116Dpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com; spf=pass smtp.mailfrom=citymesh.com; dkim=pass (2048-bit key) header.d=citymesh.com header.i=@citymesh.com header.b=YTI5spLH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citymesh.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=citymesh.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-61d3d622a2bso1883440a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Sep 2025 07:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citymesh.com; s=google; t=1756737653; x=1757342453; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vmto5euJaY+RG9gZNxyPo3BrUabJTuhM4OWC4TA1V7Q=;
        b=YTI5spLHB52mISlCmM16VMZEhyr8QNxHkRNQzLNqJF/hVwtPLlSqH1a/vr2dA8dqvu
         xeYy69ZWfbxr+wbKCJXZXUBnB88iAUuUhfN4wsU7/liH71GrmUOLW+AngOm43A9pAkm8
         00a/0M0SIgjPVvpi4YoLFFlWGncme7pzvoxffDPe2LOqCWILGA/of30ZciTjqKnhOHUf
         4ALjTj4of57Fayqa8qWrkJoXT9Mk6Se6FXaKnlo0kGeavHHD81lyUwNWBp5Pb1PWEAKw
         L5lngGERXREseASGMvPOCjyBNBkFGgtpUT4RkD0tk/ZKTz7EhsPrfJlp+DXO4Ajm2eI3
         C2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756737653; x=1757342453;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vmto5euJaY+RG9gZNxyPo3BrUabJTuhM4OWC4TA1V7Q=;
        b=FrM/SHA3U6LjMDasA4Fkl+y0DB7Y95r5Acl5yP5AIf9XwE7OLtQ/hhNR+7mdQkLTSv
         lXFmHKp4D7FvUua5vwntqfUCaGITpI8u9WMZmfEoszbObGyU6CWVNjIgEQ2RlSKgfTQE
         wEFaJN7izuY7zlocgUxLjpK7cduvp3Q4gDvrjkp29m3GuW2Mym+cd1ZEfThw3sFAwJiI
         SnEP/Sz3tDUK8cREMSNkrDvNqh5N1f/YP2Toha2ZL0B6MA3egydVqdnXoiw8F1tR3JsQ
         cdwXdViLkUhr1zQH4fvjMKZTV+snzd9ceqgk7hmc5mOM0wOq0OqIvNZsTf9epbZvpWIJ
         R05w==
X-Gm-Message-State: AOJu0Yyl9Y62KSCvwBsZf4mXwk8xcI7dBcKNp2QAbFOP0t4486cMqD4o
	KQ7cN/Avc4cFZIOxUvutC15KtTMk6wycMnLIa8pTISrDAFhd3AITeF5Ynm5FL2AHoy1UFAbGzas
	yZKOmdk6lkihrrCr9pZ3ISB3JlNf7EtL+pBGvavZwIERxIbUwG10s7ofxeQ==
X-Gm-Gg: ASbGncvbLnzMchcZCL5qp8oyoWetVbnXtZuVrMQUzfkw0kVOM39Y8DPy9AzMdUusewC
	sMfsdra9gPIlXbHg7yCGH12gn6cZRXcP1tnZE224EilXhlBOAkDlLjkJ/m2B8Gkp20X5hjwgql+
	0E7Qh0yjx9Nc1hVw87VctI2ew7FRfJEBZeLMCFijvuGOTW7uML1TXdZ0aO22uS+HI36cA1wRr4P
	vL0NtpXp1l5bGhcpYxzAKDLeBWqEVbJBlI=
X-Google-Smtp-Source: AGHT+IH0r7ujniAZ9Uf+6yq16NIK67pHKG21617U7SP1UqjS+EAeX0HQpIuYckATKjNckApzC5tsjfMJJXgz+fykCsY=
X-Received: by 2002:a17:907:d2a:b0:ad2:e08:e9e2 with SMTP id
 a640c23a62f3a-b01d979f53amr774078366b.27.1756737653217; Mon, 01 Sep 2025
 07:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Koen Vandeputte <koen.vandeputte@citymesh.com>
Date: Mon, 1 Sep 2025 16:40:42 +0200
X-Gm-Features: Ac12FXxRA4jYFba739-yMdA6LZuM3S357nykes56n7Oc1X3iKrJoMOhdUOAva2M
Message-ID: <CAPh3n81TECn_LRKrsKS4qS3-CQsVTf8LSSiCdn+uNYdnO7h9AQ@mail.gmail.com>
Subject: Crash in msm serial on kernel 6.12
To: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, jirislaby@kernel.org, 
	neil.armstrong@linaro.org, stephan.gerhold@linaro.org, 
	Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi all,

I just updated my ipq4019 boards on OpenWRT from kernel 6.6 to 6.12.

When using the serial port (/dev/ttyMSM1) I notice that it keeps
crashing while using that port.

Going through the commit history, I noticed that not much changed at
all compared to kernel 6.6:

f6ae572683d4 serial: msm: Configure correct working mode before
starting earlycon
f70f95b485d7 serial: msm: check dma_map_sg() return value properly
1788cf6a91d9 tty: serial: switch from circ_buf to kfifo
f8fef2fa419f tty: msm_serial: use dmaengine_prep_slave_sg()
4e5788c0993c serial: msm: Use uart_prepare_sysrq_char().
173ebdedcd84 serial: msm: Use OPP table for DVFS support
a63e5a49d596 serial: msm: Convert to platform remove callback returning void
6cbd979080c7 serial: msm: Use port lock wrappers

As the crash indicates, it has got something to do with DMA transfers,
which was altered in these 3 commits:

f70f95b485d7 serial: msm: check dma_map_sg() return value properly
1788cf6a91d9 tty: serial: switch from circ_buf to kfifo
f8fef2fa419f tty: msm_serial: use dmaengine_prep_slave_sg()


file:  ./drivers/tty/serial/msm_serial.c
crashing function: msm_start_rx_dma()


Does someone have a clue what could be the culprit here?



Splat:

[    0.000000] Linux version 6.12.43 (koen@csbeokps13sv03)
(arm-openwrt-linux-muslgnueabi-gcc (OpenWrt GCC 14.3.0
r30901+28-f324bd9e34) 14.3.0, GNU ld (GNU Binutils) 2.44) #0 SMP Fri
Aug 29 11:31:37 2025
[    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=10c5387d
[    0.000000] CPU: div instructions available: patching division code
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
instruction cache
[    0.000000] OF: fdt: Machine model: Wallystech DR40X9
...
'Opening Serial port'
...
[   83.717008] 8<--- cut here ---
[   83.717063] Unable to handle kernel paging request at virtual
address e2d49000 when write
[   83.718986] [e2d49000] *pgd=83dcf811, *pte=00000000, *ppte=00000000
[   83.727233] Internal error: Oops: 807 [#1] SMP ARM
[   83.733304] Modules linked in: ath9k(O) ath9k_common(O) qcserial
option nft_fib_inet nf_flow_table_inet ebtable_nat ebtable_filter
ebtable_broute ath9k_hw(O) ath11k_pci(O) ath11k(O) ath10k_pci(O)
ath10k_core(O) ath(O) wireguard usb_wwan sierra_t
[   83.733891]  xt_length xt_hl xt_helper xt_ecn xt_dscp xt_conntrack
xt_connmark xt_connlimit xt_connbytes xt_comment xt_TCPMSS xt_REDIRECT
xt_MASQUERADE xt_LOG xt_HL xt_FLOWOFFLOAD xt_DSCP xt_CT xt_CLASSIFY
x_tables wwan usbserial usbnet usbhid m
[   83.806410]  sd_mod scsi_mod scsi_common gpio_button_hotplug(O)
vfat fat ext4 mbcache jbd2 mii crc32c_generic
[   83.917691] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G
  O       6.12.43 #0
[   83.927759] Tainted: [O]=OOT_MODULE
[   83.935903] Hardware name: Generic DT based system
[   83.939121] PC is at mmiocpy+0xb4/0x334
[   83.943976] LR is at 0x40000400
[   83.947709] pc : [<c0a42b14>]    lr : [<40000400>]    psr: 00000193
[   83.950839] sp : c1011e60  ip : 00000018  fp : c1011e70
[   83.957087] r10: 00100101  r9 : 82addc00  r8 : 00000002
[   83.962294] r7 : 00000000  r6 : 00000000  r5 : c10cf304  r4 : c115f900
[   83.967506] r3 : 00000001  r2 : ffffffe8  r1 : c115f968  r0 : e2d49000
[   83.974104] Flags: nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
Segment user
[   83.980616] Control: 10c5387d  Table: 8346006a  DAC: 00000055
[   83.987816] Register r0 information: vmalloc memory
[   83.993631] Register r1 information: slab kmalloc-128 start
c115f900 pointer offset 104 size 128
[   83.998327] Register r2 information: non-paged memory
[   84.007346] Register r3 information: non-paged memory
[   84.012294] Register r4 information: slab kmalloc-128 start
c115f900 pointer offset 0 size 128
[   84.017334] Register r5 information: slab kmalloc-4k start c10cf000
pointer offset 772 size 4096
[   84.025842] Register r6 information: NULL pointer
[   84.034776] Register r7 information: NULL pointer
[   84.039376] Register r8 information: non-paged memory
[   84.044064] Register r9 information: non-paged memory
[   84.049100] Register r10 information: non-paged memory
[   84.054135] Register r11 information: non-slab/vmalloc memory
[   84.059170] Register r12 information: non-paged memory
[   84.064986] Process swapper/0 (pid: 0, stack limit = 0x5a960252)
[   84.070023] Stack: (0xc1011e60 to 0xc1012000)
[   84.076193] 1e60: c10cf304 00000000 00000002 c115f960 e2d49000
c115f900 e2d49000 c06ef0ec
[   84.080449] 1e80: c1011ed0 c10cf374 ffff8000 c1234840 00000002
c10cf304 20000193 c10cf360
[   84.088610] 1ea0: c10cf304 00000002 a0000113 00000001 c12ea104
c06ef244 c0e85000 00000400
[   84.096769] 1ec0: c06ee290 c071c450 00000001 00000000 00000002
00000000 00000400 82addc00
[   84.104929] 1ee0: c0e85000 00000001 c12ea104 00000001 00000000
c071e5f4 00000000 c0e99010
[   84.113092] 1f00: c0e01f28 0000f244 c0e85000 c15d7980 c15d79b8
c1011f04 dfbb10c8 00000000
[   84.121249] 1f20: c1011f3c 00000122 00000100 c06ed858 00000001
00000000 c1234954 c1011f3c
[   84.129410] 1f40: c1011f3c 00000000 00000000 c071e4ac 00000000
c0e85000 000002c4 c10cf344
[   84.137567] 1f60: c1234954 c10cf348 dfbb10c8 c0d49c00 00000006
00000001 c0e0d4c0 c03260e8
[   84.145729] 1f80: 00000007 00000040 c0e03080 40000006 c0e03098
00000018 00000100 c0326368
[   84.153886] 1fa0: c0e99010 c037242c c0e03080 c1011fa0 c0d45140
0000000a 00000000 c0d49c00
[   84.162047] 1fc0: c0d49c00 ffffab84 c0e03d40 04200002 c0d49bc4
c0e0d4c0 60000013 ffffffff
[   84.170210] 1fe0: c0e01f64 00000000 c0e0d4c0 c0e99010 c0e01f28
c03267a4 c0a6c0a0 c0a40acc
[   84.178362] Call trace:
[   84.178377]  mmiocpy from bam_start_dma+0x220/0x2e8
[   84.189124]  bam_start_dma from bam_issue_pending+0x90/0xa0
[   84.193722]  bam_issue_pending from msm_start_rx_dma.part.0+0x134/0x258
[   84.199279]  msm_start_rx_dma.part.0 from msm_complete_rx_dma+0x148/0x394
[   84.205879]  msm_complete_rx_dma from vchan_complete+0x1ec/0x228
[   84.212821]  vchan_complete from tasklet_action_common+0xe0/0x108
[   84.218897]  tasklet_action_common from handle_softirqs+0xf0/0x250
[   84.224885]  handle_softirqs from irq_exit+0x8c/0xb8
[   84.230958]  irq_exit from call_with_stack+0x18/0x20
[   84.236084]  call_with_stack from __irq_svc+0x6c/0x7c
[   84.241027] Exception stack(0xc0e01f30 to 0xc0e01f78)
[   84.245980] 1f20:                                     00000003
00000001 00063174 40000000
[   84.251023] 1f40: 00000000 c0e0a0ac c0e0d4c0 c0e0a0c4 00000000
00000000 c0e99010 c0e0a048
[   84.259181] 1f60: 00000037 c0e01f80 c0a6b938 c0a6c0a0 60000013 ffffffff
[   84.267336]  __irq_svc from default_idle_call+0x2c/0x30
[   84.273757]  default_idle_call from do_idle+0x1d4/0x224
[   84.278965]  do_idle from cpu_startup_entry+0x28/0x2c
[   84.284170]  cpu_startup_entry from kernel_init+0x0/0x12c
[   84.289380]  kernel_init from start_kernel+0x6cc/0x6d0
[   84.294830] Code: e4804004 e4805004 e4806004 e4808004 (e4809004)
[   84.299800] ---[ end trace 0000000000000000 ]---
[   84.305960] Kernel panic - not syncing: Fatal exception in interrupt
[   85.401617] SMP: failed to stop secondary CPUs
[   85.401652] Rebooting in 3 seconds..


Thanks all,

Koen

