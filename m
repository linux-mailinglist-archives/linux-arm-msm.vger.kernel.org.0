Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A28349A14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 20:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhCYTSD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 15:18:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbhCYTRz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 15:17:55 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0AA7C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 12:17:54 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id k8so3428647wrc.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 12:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:mime-version
         :content-disposition;
        bh=QI2vcq9KD+1LmmKJyHO31RXdx3RdhPdjcKD7tlsMmlI=;
        b=lIqpZ+r6WVoTBtORvU3D88F2Ys/uiPtLziur7+LrTHps7Xl2VbQ9MWxWR81ryFPA3F
         nYyn1Lfti1U0Co0oTZUcM/5GCM2neMGmqau4I/cvKnD5WNg0CHXdbhy68re6m9rgmTVF
         mF7vGpIRY78f9aAmBNIOoHilYYRsnkcBp2K+dAno5rZSbFqJrDSLALv4l/J4+FxWxi43
         gXNPzvWOdnyv+YluhQgIrzUvSujqJc3aDSdLz02A+Th6d6sNGfV7wvAs4D1BxTkgqM3w
         0yZBe8isTlO7KvfSj+0BOHK8RffdpOjyTUgqFszEo3utmnHiQ/ld402wi5o9fjOr5AmE
         qbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mime-version:content-disposition;
        bh=QI2vcq9KD+1LmmKJyHO31RXdx3RdhPdjcKD7tlsMmlI=;
        b=Mi2z1Rw43vODPxe7anTZ7zuIYOtLyXKbJ0Fa0jwcyH34Fum6dL5ddANkC0ujSXHogN
         34v7z/5pTdEyWvvh8RMg7B6eZ+ow4ymdu2Q6eViVfGft2nBEJI3zeOfTrpmi6620t8nx
         sWNFovrBO1fcfMrLyrIlOn5RztSYzi4TroP93CIMNRgE9hw27WlSNxWEq7bSqFD0WszJ
         oO+J6WzSC4/Wesee2hIUKAmb1XIsFpAviIIyr1sVY5Up5V2AAX0s4DDqkJYuLftocWB5
         xNEQkKhQxFEhmutFpdwO/cqKsq/lGYAI0QldifZjBqIU/3nVGRtxBIb8dpMEELXG6ykE
         UpmQ==
X-Gm-Message-State: AOAM53053EzLKXKsGN8sWXhNm25oULrrdOt8WLd2NvO9Q+crkiW7wyjk
        12fxr5sQufZoV4aNiHqcERxzVr41kUcuTw==
X-Google-Smtp-Source: ABdhPJyk0OBjZLkKZHZmYSRpZ4N9tT9JeYBAigF0qqmn9u2P39uCWYmJRosnHkupEQ6qYdz1ksOb8Q==
X-Received: by 2002:a05:6000:1819:: with SMTP id m25mr10702261wrh.169.1616699873511;
        Thu, 25 Mar 2021 12:17:53 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id w22sm7319792wmi.22.2021.03.25.12.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 12:17:52 -0700 (PDT)
Date:   Thu, 25 Mar 2021 20:17:50 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Jeremy McNicoll <jeremymc@redhat.com>,
        Michael Scott <michael.scott@linaro.org>,
        Bastian =?iso-8859-2?Q?K=F6cher?= <mail@kchr.de>
Subject: Boot issues with mainline kernel on Huawei Nexus 6P angler (MSM8994)
Message-ID: <YFzh3kV2kfYihQ5n@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

I'm trying to test mainline kernel on Huawei Nexus 6P angler (MSM8994).
In the middle of boot (after "Serial: AMBA PL011 UART driver") phone got reset
Here is log from UART:

[119100] cmdline=console=ttyAMA0 console=ttyAMA1 console=ttyAMA2 console=ttyMSM0 console=ttyMSM1 console=ttyMSM2 keep_bootcon earlycon debug ignore_loglevel PMOS_NO_OUTPUT_REDIRECT
=> PMOS_NO_OUTPUT_REDIRECT is postmarketOS specific, I tested various console setup
...
[119510] boardid:8026
[119520] booting linux @ 0x80000, ramdisk @ 0x2700000 (1314539), tags/device tree @ 0x2500000
[119530] Jumping to kernel via monitor
[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd032]
[    0.000000] Linux version 5.12.0-rc2 (pmos@dell5510) (aarch64-alpine-linux-musl-gcc (Alpine 10.2.1_git20210318) 10.2.1 20210318, GNU ld (GNU Binutils) 2.35.2) #1 SMP PREEMPT Thu Mar 25 14:39:46 UTC 2021
[    0.000000] Machine model: Huawei Nexus 6P
[    0.000000] printk: debug: skip boot console de-registration.
[    0.000000] printk: debug: ignoring loglevel setting.
[    0.000000] efi: UEFI not found.
[    0.000000] [Firmware Bug]: Kernel image misaligned at boot, please fix your bootloader!
[    0.000000] earlycon: msm_serial_dm0 at MMIO 0x00000000f991e000 (options '115200n8')
[    0.000000] printk: bootconsole [msm_serial_dm0] enabled
...
[    0.244277] cpuidle: using governor menu
[    0.252555] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.255958] ASID allocator initialised with 32768 entries
[    0.264414] Serial: AMBA PL011 UART driver
=> phone resets, continue first stage bootloader, Little Kernel and downstream kernel (LineageOS)
D -     15494 - pm_driver_init, Delta
B -    622413 - cpr_init, Start

I'm using original Little kernel bootloader, arm64 defconfig and
msm8994-angler-rev-101.dtb (obviously).

I tried various things:
* test various kernel versions current qcom/for-next, various v5.x versions,
  v4.10 (which brought MSM8994 support)
* keep_bootcon earlycon ignore_loglevel debug kernel parameters
* use various consoles (e.g. ttyMSM[0-2] and downstream ttyHSL0, ttyAMA0 or
  no console defined at all)
* original AOSP boot.img and boot.img from postmarketOS project (with updated
  kernel with abootimg
* although it should not be caused by missing SELinux (AOSP/postmarketOS
  require SELinux enabled), I also tested with SELinux enabled
  (CONFIG_DEFAULT_SECURITY_SELINUX=y, CONFIG_LSM="selinux", ...)

It behaves the same on all. I even tried to remove serial config from DTS
(serial@f991e000 and alias serial0 = &blsp1_uart2), which lead only to
(obviously) disabled UART, but phone still resets.
Unplugging UART didn't help either.

I looked into /sys/fs/pstore/ (rooted phone), but /sys/fs/pstore/console-ramoops
has content of rebooted kernel (LineageOS one), not the mainline.

I have no idea what could be wrong. Whether UART dts definition or something else.
I suppose the problem is with dts, not with code itself.

Any idea what to look for?  I can provide more logs, if needed.

Kind regards,
Petr
