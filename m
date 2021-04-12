Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E30A35CFC4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 19:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244710AbhDLRsb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 13:48:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244739AbhDLRsZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 13:48:25 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B48CC061574;
        Mon, 12 Apr 2021 10:48:06 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id p6so7109155wrn.9;
        Mon, 12 Apr 2021 10:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7aCHD5WDPm5c82C8ZlURJklHVLxiB31MS7u9uRdey/A=;
        b=q8AzcbnjP6y+/B3dqxMSnrIqZKukfZsMpBWmRViFvjNkSCP7JJ6HvnppUzwgMBdcWL
         KnvXfpaNodpBD8Qqj4BDgX84+xvVqZC/PH7nwPiig+vBI+EiTeoc9yfUd5JO+Af5NJS2
         PtpJHRWgjot6n8Nju1/rnpFzc0D2n7H/SzgH5EpEp4XD1QCiNrkCos/LFL7SuleCZHcg
         l/5FD2oqftZ0a2jgKF95y4KtehGyuN9I/vubqa01hDMPtudJbFincZ76BOKibzaZs4mT
         Q86L4vz0y2ZS6rxietVxlvPYrXSK3d59T6VEhU2JPjMJKIbLSnRCHw0KibV27SDiSQSI
         5S0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=7aCHD5WDPm5c82C8ZlURJklHVLxiB31MS7u9uRdey/A=;
        b=OTJIp/RFgBk2FlNifT9bugR2HZGYBY/1aDirUoF4e2pe8PK+nqzNNHyOrs+eCMt6mQ
         5jwO2HWsJW8Na/+39isRBOmUVwoZePG26MERRddt4UsdIjbGndKv5+G/Ck4NfGHZynQJ
         e9pVTPNJhY1wnJpQLke8BVepG6xrSIu8Yo8VfiCZPPXIQf8E09nfyTJJoWDA2cZbFWqi
         QMFK4YoqpYHRmXqUj4gb9tHv6FQst5NjVh0dbhnyTNAeTov7MN9D+3J3+yl83Xse3KY7
         KhS7pH84Apd6OrMwQ+shXeQKptzt9Irl5JGtmIuBNwZuCCytHU+2eA+klftsEELwWy1x
         9C1Q==
X-Gm-Message-State: AOAM533aYpkmB2tS7YPNZOMvlCIXTxqhtYJh5k7PB0oQYJELI27a6zZf
        1pwLNACc2DLODovXHvnepmM=
X-Google-Smtp-Source: ABdhPJwur3aGWPQUt6Y/wj75hygTF4BHTQTNWucvxrpJantiBrpBK6J4+OmvMSCNbebmjE8fTnq5Ug==
X-Received: by 2002:a5d:5642:: with SMTP id j2mr32398121wrw.172.1618249685081;
        Mon, 12 Apr 2021 10:48:05 -0700 (PDT)
Received: from pevik ([62.201.25.198])
        by smtp.gmail.com with ESMTPSA id w7sm18882289wru.74.2021.04.12.10.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 10:48:04 -0700 (PDT)
Date:   Mon, 12 Apr 2021 19:48:02 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Konrad Dybcio <konradybcio@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ricardo Ribalda <ribalda@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Cc:     KarimAllah Ahmed <karahmed@amazon.de>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: msm8994: Reserve gpio ranges
Message-ID: <YHSH0gLow2g3AQNu@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210405200259.23525-1-petr.vorel@gmail.com>
 <20210405225222.GD904837@yoga>
 <CACRpkdZQ8qiqFPa0X8deVjZ7nLn_E6s8fmJdr5Ji8AuyJms1ug@mail.gmail.com>
 <YG9TWEJlpDmNeeit@pevik>
 <ea376d51-cd6c-0028-9602-d007c2bba71e@gmail.com>
 <YG/HwrzRcm7bwgFe@pevik>
 <20210409033726.GT904837@yoga>
 <YHE9Df/Ztq7VaoK2@pevik>
 <10d2cd96-3c35-2b06-82f7-98800888e244@gmail.com>
 <YHHeRfAWrrusE/gB@pevik>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YHHeRfAWrrusE/gB@pevik>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

[ Cc KarimAllah Ahmed, as the author of 86588296acbf; Rob merged it ]

> > > Konrad, is there any public docs about GPIOs on this secure peripherals?
> > > It it somehow related to Chain of Trust? [1].  I guess it's not, because once we
> > > boot Linux all bootloader stuff is over.

> > No, Qualcomm pretty much does security through obscurity. It's *probably* not even that very secure considering how big in size their TZ+HYP stack is - number of bugs rises exponentially with code size. But not many people tried breaking into it considering the complexity and QCOM's legal team size.

> > There is no public documentation on that, and even if there were - you are not allowed to flash the "secure" partitions on *your device that you unlocked the bootloader of by choice* (which is absurd).

> > Also, while "all bootloader stuff is over", the platform is still under control of the proprietary hypervisor and the "Trust Zone". For example if you try to write to some IOMMU registers on certain platforms, the hypervisor will treat that as a security violation and shut down the entire device. 

> > This is essentially the same as your issue. You're trying to poke a thing that Qualcomm *really* doesn't want you to (the fingerprint SPI pins) and since *they* are in control, they say "nonono" and your device dies. All you can do is comply with that (or find a way to replace the blobs or politely ask Google to release a set of unsecure binaries for your Nexus - which they won't do).

> Again, thanks a lot for info. I looked into downstream sources to see that
> really pins 85-88 (which I've sent a patch to add into gpio-reserved-ranges) are
> used for fingerprint. I also wonder if downstream commit d45c35c7b586 ("angler:
> fingerprint: remove all the code about spi") [1] confirms that also downstream
> kernel would reset or it's a security (it would not reset, thus they removed
> the access). It's probably aosp issue tracker [2], but "Access denied" for me.

> I also did some testing and this is maximum range which can be disabled:
> gpio-reserved-ranges = <0 4>, <6 139> and it does not help to solve second
> reset (in loop_init() or later when starting initramfs).
> Removing access to GPIO 4 or 5 causes reset right immediately (no message from
> kernel).

> I still don't understand what changed in a99163e9e708 ("Merge tag
> 'devicetree-for-5.12' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux")
> I checked both 882d6edfc45c cb8be8b4b27f, which it merges and they're ok.

I've found the other problem preventing booting. Appart from v2 [3] is also needed
to revert 86588296acbf ("fdt: Properly handle "no-map" field in the memory region").

I'm pretty sure, that this commit is needed, but what should I change in
arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts in order to get my angler
booting again? With it it reset again after loop_init:

[   12.077756] initcall devcoredump_init+0x0/0x30 returned 0 after 22 usecs
[   12.082425] calling  loop_init+0x0/0x158 @ 1

And with disabled CONFIG_BLK_DEV_LOOP it get's reset before reaching initramfs:
~/tmp/hackweek/loop_init.debug.a99163e9e708.disabled-CONFIG_BLK_DEV_LOOP/2021-04-07_21-01-34.log
[   17.383267] calling  regulator_init_complete+0x0/0x4c @ 1
[   17.390129] initcall regulator_init_complete+0x0/0x4c returned 0 after 6 usecs
[   17.395682] calling  of_platform_sync_state_init+0x0/0x18 @ 1
[   17.402800] initcall of_platform_sync_state_init+0x0/0x18 returned 0 after 3 usecs
[   17.408616] calling  alsa_sound_last_init+0x0/0x88 @ 1
[   17.416077] ALSA device list:
[   17.421198]   No soundcardû[   17.431360] Freeing unused kernel memory: 5824K
[   17.431633] Run /init as init process
[   17.434700]   with arguments:
[   17.438535]     /init
[   17.441477]     PMOS_NO_OUTPUT_REDIRECT
[   17.443737]   with environment:
[   17.447381]     HOME=/
[   17.450496]     TERM=linux
D -     15494 - pm_driver_init, Delta

Kind regards,
Petr

> Kind regards,
> Petr

> [1] https://android.googlesource.com/kernel/msm/+/d45c35c7b586711e757eb7e3239db5c88d114e0e
> [2] https://issuetracker.google.com/issues/23756466
[3] https://lore.kernel.org/linux-arm-msm/20210406202936.22500-1-petr.vorel@gmail.com/T/#u

> > Konrad
