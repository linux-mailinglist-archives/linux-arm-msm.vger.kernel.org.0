Return-Path: <linux-arm-msm+bounces-86892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0737CE849E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 23:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D96930028BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 22:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E97310620;
	Mon, 29 Dec 2025 22:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R278fY6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B8F2765C4
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 22:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767047208; cv=none; b=W/8mcPHNp7iL2HfSLUb0rgIdJ8dBmBYhs4UPHAQOwE8hUYyTBNZlp5HDDhTfUOdrlPML7Xs78TKRGisMOdZ7tcNAbIY1ObUmxo1Vnlzg6QJaZ5DpRFors47EBvuY7yYchOPjBs2yMC+Mnmoy3f+4LeS0plgUyp89JZaFaG8ldlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767047208; c=relaxed/simple;
	bh=SDBuUYCKUK0OTnPthLSArMmIwMWLoZrj2U+3wZtOZqA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=m4y572AWV6GpsMCXFPqr2tZtep3ocVlk2DmqXn7D5Cg7uDX86qE8lgQsT5J8uYZqY6gC7RDSNM6enWOLQUqwMxKZ2a9fKkqz4oYMVzj/kEDxdUkCE5i+RYgxvYsOMtsyVTixS8mtOkf18F2uMTnib9bLy6H+ZDQnkyu996yIKw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R278fY6O; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7277324054so1518067466b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 14:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767047205; x=1767652005; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4W74jbHr2pviqw2mzr8A5oUSnQu9j98cEJ8cgpB8VVA=;
        b=R278fY6OGZqvCFHZBEKjQ+I+z1x9274n3nSwlZbkp0R9aFbuWE2hsNtmMNpypqPR6S
         R3RUzRJKq/SooM4OYSyVChv22n1THZ0PHSpaFpZopCEBtIaA0rET2LmmOVMS4Hc/vzFD
         TvcgpMQYzAeQuhOgaNlwTpO7qGZrYEjCSIb0xJvRuJYGhV7K8YNjBG3OOvWOb2tdDWj6
         CWKlqsjzIhaX9H0FH3oaGaZsswjzhrmIwPW62PItymIYr0ARX2OHx/tXvqFTQET4ME5M
         hJg29wVxkYzOSliCUEms9qEnoYcYWSBResXq3B6fv/KIvvaabQleEBdeeGckkzGN2Bn3
         E6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767047205; x=1767652005;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4W74jbHr2pviqw2mzr8A5oUSnQu9j98cEJ8cgpB8VVA=;
        b=ouYS1tH8o7CkW5SYebfDeRPBlZf5UWyVK/p2U2QwWuhHekze21n5aqleiUbDbePpDf
         YHCM+EykTQOj/i/J0SUUZSsIQR1k0GjhI5Y5btWPOfwUbF0hbRO9mu1fV/m9XPQSIqHk
         7C6INjaLwXW9TGb7XrYy/PVv3CanmXv53RLcGvOKrmU8fXGNCK2BMg7Y4YVr5w97vVt1
         iU6rboBEYf7HL/c9Gfk93d27G4bB4sVZdCbce6PX+OD/UPAWMYv/1ULDjYbtgtGr47/Q
         XxHclDSJa/fPoJChNToXdh5kTWSa8FyK1fXmIkPeGnE2788x2J5pS9LNVK8DFom+fKOP
         MnJg==
X-Forwarded-Encrypted: i=1; AJvYcCXm0ze8J313hoCT9ntT6YIuJl8UYJhKW2NSRCdneQyjLCga4IAJeOxmYIkMxnrLv4eHi9P0ELsTdhUdTMOn@vger.kernel.org
X-Gm-Message-State: AOJu0YxkND8Qn+yxQTYufWJ5c1XzFFYL5ASYDmN3acJ+Jx7RM4klWgFc
	TqFeKP0PdSdFisuGy8ml5x6iumbrBj74nFj04vq947xMBhjaqwuOm/4O
X-Gm-Gg: AY/fxX6WYkQAADx3iTCVlGTVT6CaaWjEqyARwR0OmBuB/aqgflraohnP77csN1xVDQZ
	zaeAojI2qszh+9CBaeWpFaojw+gC6ZD+MX9h9PjttazsmXH4zW2RJoW6B6p8HgDr59eCD5JRjwg
	11ZeWxXET5K5ONlwxqRV/qFFCId5rXxYD7cZNXUYlqCUiyniKceNzIVZXkHFXXPt6pEsg8dIYpA
	HhFxI/Muy/bjb2C70SFHQS73kgIm2Y+d1Zeuflbb/w+w5a0mxInNJG/diZwsbDbj/sn0rRLlw/6
	z5AIhGrT8MVwuJ5+VgWn2E6vbJWBknV5dra7gOXAEYMFnlLehLqJBkqfeIZTOrx5yRJvKt0Dlpt
	ADwM4cCNIMJ7fJlgrx8UUGQNvXcy2S8ddjpL39dm8nTzoovWcr2toVB2ytICzUnEGBQ7CUrUdLk
	fLth6r30CbcK47wHD7UNGXupAH
X-Google-Smtp-Source: AGHT+IFoBOtTedjMi7Z7tBcDd3IGNyzGxvSNvidAURllHBfVoxLIOJyPfd4WRhsXUOUzeRpl1fTX6g==
X-Received: by 2002:a17:907:3da8:b0:b7a:1be1:983 with SMTP id a640c23a62f3a-b80372699eemr3475948966b.63.1767047204706;
        Mon, 29 Dec 2025 14:26:44 -0800 (PST)
Received: from ?IPV6:2001:871:22a:693f::1ad1? ([2001:871:22a:693f::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0cea9sm3385912866b.50.2025.12.29.14.26.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 14:26:44 -0800 (PST)
Message-ID: <569d7de2-cfcd-4d28-8bbf-14a0179f665e@gmail.com>
Date: Mon, 29 Dec 2025 23:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Christian Schrefl <chrisi.schrefl@gmail.com>
Subject: [REGRESSION] qcom: iommu: nullpointer dereference on boot on apq8064
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 linux-arm-msm@vger.kernel.org
Cc: Rudraksha Gupta <guptarud@gmail.com>
Content-Language: en-US, de-DE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi everyone,

I've found a panic on boot with v6.19-rc3 on the asus-nexus7-flo tablet with a APQ8064 CPU.

I've bisected it down to commit bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper 
probe path"). Reverting the drivers/iommu/iommu.c changes (removing the added if block)
fixes the crash, but that presumably exists for a reason.
The diff for the fix:
```
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 2ca990dfbb88..9f32d70b207d 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -453,14 +453,6 @@ static int iommu_init_device(struct device *dev)
         * already having a driver bound means dma_configure has already run and
         * found no IOMMU to wait for, so there's no point calling it again.
         */
-       if (!dev->iommu->fwspec && !dev->driver && dev->bus->dma_configure) {
-               mutex_unlock(&iommu_probe_device_lock);
-               dev->bus->dma_configure(dev);
-               mutex_lock(&iommu_probe_device_lock);
-               /* If another instance finished the job for us, skip it */
-               if (!dev->iommu || dev->iommu_group)
-                       return -ENODEV;
-       }
        /*
         * At this point, relevant devices either now have a fwspec which will
         * match ops registered with a non-NULL fwnode, or we can reasonably
```

The panic message is (without the diff applied):
```
[    5.458266] msm_iommu: device mapped at (ptrval), irq 33 with 2 ctx banks
[    5.460667] 8<--- cut here ---
[    5.464071] Unable to handle kernel NULL pointer dereference at virtual address 00000088 when read
[    5.467033] [00000088] *pgd=00000000
[    5.475971] Internal error: Oops: 5 [#1] SMP ARM
[    5.479703] Modules linked in:
[    5.484300] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.19.0-rc3-dirty #41 PREEMPT
[    5.487168] Hardware name: Generic DT based system
[    5.495410] PC is at qcom_iommu_of_xlate+0x84/0x174
[    5.500187] LR is at qcom_iommu_of_xlate+0x1c/0x174
[    5.504956] pc : [<c0810840>]    lr : [<c08107d8>]    psr: 80000093
[    5.509824] sp : f081dc20  ip : 00000002  fp : c1268ae8
[    5.516068] r10: c1268ad8  r9 : 00000000  r8 : f081dc64
[    5.521278] r7 : 20000013  r6 : c208f428  r5 : f081dc64  r4 : c2198c10
[    5.526488] r3 : c208f400  r2 : c208f50c  r1 : 00000000  r0 : eeff2024
[    5.533089] Flags: Nzcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment none
[    5.539601] Control: 10c5787d  Table: 8000406a  DAC: 00000051
[    5.546803] Register r0 information: non-slab/vmalloc memory
[    5.552616] Register r1 information: NULL pointer
[    5.558344] Register r2 information: slab kmalloc-192 start c208f480 pointer offset 140 size 192
[    5.562955] Register r3 information: slab kmalloc-192 start c208f3c0 pointer offset 64 size 192
[    5.571804] Register r4 information: slab kmalloc-1k start c2198c00 pointer offset 16 size 1024
[    5.580229] Register r5 information: 2-page vmalloc region starting at 0xf081c000 allocated at copy_process+0x154/0x11a0
[    5.588911] Register r6 information: slab kmalloc-192 start c208f3c0 pointer offset 104 size 192
[    5.600019] Register r7 information: non-paged memory
[    5.608778] Register r8 information: 2-page vmalloc region starting at 0xf081c000 allocated at copy_process+0x154/0x11a0
[    5.613737] Register r9 information: NULL pointer
[    5.624664] Register r10 information: non-slab/vmalloc memory
[    5.629265] Register r11 information: non-slab/vmalloc memory
[    5.634994] Register r12 information: non-paged memory
[    5.640727] Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
[    5.645760] Stack: (0xf081dc20 to 0xf081e000)
[    5.651937] dc20: c1268ae8 c0809060 c208f440 f081dc64 c2198c10 c1a4dca0 c214dfc0 c080f558
[    5.656195] dc40: ffffffed eeff39c8 c2198c10 c080fb1c 00000000 f081dc64 c2198d80 c0ae6cc0
[    5.664357] dc60: eeff39c8 eeff2024 00000001 00000000 00000000 00000000 00000000 00000000
[    5.672514] dc80: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    5.680675] dca0: 00000000 00000000 00000000 c6f787fa 00000000 c2198c10 c1ab3900 eeff39c8
[    5.688837] dcc0: ffffffff 00000000 00000000 00000020 00000000 c0ae03b8 00000000 00000000
[    5.696995] dce0: c22b8171 00000007 00000000 c6f787fa 00001402 c2198c10 00000000 c2198c10
[    5.705154] dd00: c080aa54 f081ddb8 c0edd194 c080aa54 c1464a64 c088a720 c080aa54 f081ddb8
[    5.713315] dd20: c0edd194 00000000 c2198c10 c08099f4 00000000 c6f787fa c22b8000 c2198c10
[    5.721477] dd40: c205c900 c2198c10 c080aa54 c080a880 c214dfc0 00000000 00000000 c230b400
[    5.729634] dd60: c2198c10 c205c900 f081ddb8 c080aa54 c208f5c0 c080aa78 c205c900 f081ddb8
[    5.737795] dd80: 00000000 c0885280 c21e5c00 c205c958 c2162734 c6f787fa c2197410 c1a4dca0
[    5.745955] dda0: c2197410 f081ddb8 c2197410 c080a514 c1268d70 c2197410 f081ddb8 f081ddb8
[    5.754114] ddc0: c12f2e98 c6f787fa f0c01004 c208f580 00000000 c1a4dc30 c2197410 f081de04
[    5.762272] dde0: c12f2e98 c1447854 c1464a64 c0810548 f081de04 c1268d20 c208f580 c6f787fa
[    5.770431] de00: c2197410 07600000 00000002 c6f787fa c1a4dc4c c2197410 c1a4dc4c c1aaa6a8
[    5.778590] de20: c1a4dc4c 00000000 c12f2e98 c088a798 c2197410 00000000 c1aaa6a8 c088765c
[    5.786749] de40: c2197510 c2197410 c2197410 c1a4dc4c c1aaa6a8 00000000 c236bcb8 c0887a34
[    5.794909] de60: 60000013 c12f2e98 c1af34fc c1a4dc4c c2197410 c236bcb8 c12f2e98 c0887c58
[    5.803070] de80: c2197410 c1a4dc4c c1a4dc4c c0887e60 c236bcb8 c0887f54 c1447854 c2197454
[    5.811230] dea0: 00000000 c205c900 c1a4dc4c c0885280 00000000 c205c958 c2162434 c6f787fa
[    5.819389] dec0: c205c900 c236bc80 00000000 c1a4dc4c c205c900 c08866f4 c1268f80 c1425a74
[    5.827550] dee0: c1a4dc4c cf7e8000 00000006 c1425a74 00000000 c0889060 00000126 cf7e8000
[    5.835713] df00: c1a95c80 c0119b18 00000126 c0162cec 00000126 00000000 00000000 00000000
[    5.843871] df20: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    5.852028] df40: 00000000 00000000 00000000 00000000 00000000 c6f787fa 00000126 c205cd00
[    5.860189] df60: 00000006 c1447834 c1a95c80 c1401488 00000006 00000006 00000000 c14004cc
[    5.868348] df80: 00000000 00000000 c0d0b5bc 00000000 00000000 00000000 00000000 00000000
[    5.876509] dfa0: 00000000 c0d0b5cc 00000000 c010014c 00000000 00000000 00000000 00000000
[    5.884665] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    5.892824] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
[    5.900971] Call trace:
[    5.900999]  qcom_iommu_of_xlate from of_iommu_xlate+0x7c/0x9c
[    5.911734]  of_iommu_xlate from of_iommu_configure+0x238/0x290
[    5.917377]  of_iommu_configure from of_dma_configure_id+0xe8/0x400
[    5.923203]  of_dma_configure_id from platform_dma_configure+0xb0/0xcc
[    5.929446]  platform_dma_configure from iommu_init_device+0x1f4/0x2ec
[    5.936044]  iommu_init_device from __iommu_probe_device+0x30/0x204
[    5.942551]  __iommu_probe_device from probe_iommu_group+0x24/0x48
[    5.948714]  probe_iommu_group from bus_for_each_dev+0x7c/0xcc
[    5.954963]  bus_for_each_dev from iommu_device_register+0xb4/0x20c
[    5.960778]  iommu_device_register from msm_iommu_probe+0x248/0x344
[    5.966944]  msm_iommu_probe from platform_probe+0x5c/0x90
[    5.973191]  platform_probe from really_probe+0xe0/0x41c
[    5.978748]  really_probe from __driver_probe_device+0x9c/0x1f4
[    5.984215]  __driver_probe_device from driver_probe_device+0x34/0xd0
[    5.989861]  driver_probe_device from __driver_attach+0xf4/0x228
[    5.996456]  __driver_attach from bus_for_each_dev+0x7c/0xcc
[    6.002531]  bus_for_each_dev from bus_add_driver+0xe0/0x230
[    6.008176]  bus_add_driver from driver_register+0x84/0x130
[    6.013817]  driver_register from do_one_initcall+0x58/0x260 	
[    6.019116]  do_one_initcall from kernel_init_freeable+0x1cc/0x238
[    6.025019]  kernel_init_freeable from kernel_init+0x10/0x130
[    6.031007]  kernel_init from ret_from_fork+0x14/0x28
[    6.036817] Exception stack(0xf081dfb0 to 0xf081dff8)
[    6.041861] dfa0:                                     00000000 00000000 00000000 00000000
[    6.046904] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    6.055059] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    6.063225] Code: e2836028 15911020 e1560002 0a000019 (e591c088)
[    6.069635] ---[ end trace 0000000000000000 ]---
[    6.075883] note: swapper/0[1] exited with irqs disabled
[    6.080766] note: swapper/0[1] exited with preempt_count 1
[    6.085969] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
[    6.091452] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
```

To build the kernel and bootable image I've used the rootfs CPIO and makefile from 
https://dflund.se/~triad/krad/nexus7-flo/

The makefile was adapted slightly to work on a modern kernel
it can be found at: https://pastebin.com/cC4knWDf

In order to build and run it I'm using the following commands:
```
make -f nexus7.mak config
make -f nexus7.mak build
fastboot --base 0x80200000 --cmdline "xxxxxxxxxxxxxxxxxxxxxxxxxxconsole=ttyMSM0,115200,n8 debug earlycon" boot ~/zImage
```

The full output on the serial console:
https://pastebin.com/mZDCtTg2
It is only dirty because of the nexus7.mak file.
The apq8064-pinctrl probe failure is unrelated, it starts occurring from somewhere between 6.17.0 and 6.18,
I'll need to investigate that later.


The full resulting .config: https://pastebin.com/GsiHrxhq

Cheers,
Christian

