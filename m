Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EDDD2CA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 16:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfJJOgh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 10:36:37 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46141 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfJJOgh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 10:36:37 -0400
Received: by mail-io1-f68.google.com with SMTP id c6so14080928ioo.13;
        Thu, 10 Oct 2019 07:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GXkAkj9HAvSrJatYfKDZjO99QwezjU6uUgWiJir34Vc=;
        b=bw0sjYmp+dLZlFlbGE3VgPVQC40HZjwr9iD6oAQUFOrAqYWOf8YnhtGRHy0/H6hr4+
         oWeymG5LCwtzWwV/r6nYAvb579w3rcPC3psvwLd9vg7aW59FFMtZgmx3XdIdiBNsQXT7
         ug/ys741vBe80UV1arYQasYjpmys63+esdO7iWo9ywswy/I996O+cx7ws1LxztzTbI7u
         AV3cycm/0O9BxhG467FRFF4zmazuBODvnZakIEeTP+77srTXorBedDb1pZmLUUQpiZix
         CORIa2c/a/+DoBCsi7AhRRTVSpedyx1Plt4i61kMkgixCoBukiqR8InC0VKgppG1dk9O
         bExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GXkAkj9HAvSrJatYfKDZjO99QwezjU6uUgWiJir34Vc=;
        b=RFsQl8KIUilyWb3QKUuHRToPGr2rjanlGekF0Ew9uCsIkMaV6zkxrJ49VkyfTYw2ug
         GxeGDu/6Lk96tlKF76r32PYYvmuV3hXSpgRN5b9cJOekw3t4zTTtGMAlMngi9cjlhpVd
         KFPJNgSAuh80HkeONZT2BG49cmGCnlLOo2plx8uCnFUnrwp3hIe6VlBlCBolljW5+LMN
         sXKyyKxZDxvK0TC+nQD7+J+j10X1uC2nMiM2TjRyyr8yH5cfdM30isIMnjq4izHHk/sH
         HEg/pO3y0JHUjWT6mVfYzAnOOK5MpsBUUBNmrdMUqo+X8Dx67jPcXd88mxop9yj9DIWV
         tzMw==
X-Gm-Message-State: APjAAAWJ2wsAcEOjXaHi85BnOvt+KwCt80l9gcR4vCVploXl03fpMu2J
        fcK6tZcErlFpYsU7yEfFg8s4UzSlXp2Jj/U2GtE=
X-Google-Smtp-Source: APXvYqy9NVW0r9H7ZYmdpNgnXdt8QMiKQ+g5LiZ7N77rbG935nVI/HDbP+c2s+cG4OV4V053cSJovL51j8ForlPNmUY=
X-Received: by 2002:a6b:4f03:: with SMTP id d3mr11402437iob.199.1570718196875;
 Thu, 10 Oct 2019 07:36:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191010143232.GA13560@harukaze>
In-Reply-To: <20191010143232.GA13560@harukaze>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 10 Oct 2019 08:36:25 -0600
Message-ID: <CAOCk7Nrs5W-saDLAovHP_cZbFf8sp7zA=V0iz3VkFjttv=BEmA@mail.gmail.com>
Subject: Re: msm8996: sdhci-msm: apq8096-db820c sdhci fails to init - "Timeout
 waiting for hardware interrupt."
To:     Paolo Pisati <p.pisati@gmail.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I'm using sdhci-msm on msm8998, so its not completely broken upstream.

What speed card are you trying to use?

On Thu, Oct 10, 2019 at 8:33 AM Paolo Pisati <p.pisati@gmail.com> wrote:
>
> Sdhci consistenlty fails to initialize (and thus work) on my apq8096-db820c.
>
> The issue is present since v5.0[*] mainline up to latest v5.4-rc2, using defconfig and:
>
> CONFIG_SCSI_UFS_QCOM=y
> CONFIG_PHY_QCOM_QMP=y
> CONFIG_PHY_QCOM_UFS=y
> CONFIG_ATL1C=y
>
> but can be 100% reproduced with a clean defconfig too.
>
> During boot, when it's time to mount the sdcard, mmc0 spits out a lot of:
>
> ...
> [   13.683059] mmc0: Timeout waiting for hardware interrupt.
> [   13.683095] mmc0: sdhci: ============ SDHCI REGISTER DUMP ===========
> [   13.687441] mmc0: sdhci: Sys addr:  0x00000000 | Version:  0x00004902
> [   13.693861] mmc0: sdhci: Blk size:  0x00004200 | Blk cnt:  0x00000000
> [   13.700285] mmc0: sdhci: Argument:  0x00012444 | Trn mode: 0x00000033
> [   13.706707] mmc0: sdhci: Present:   0x01680206 | Host ctl: 0x0000001f
> [   13.713131] mmc0: sdhci: Power:     0x00000001 | Blk gap:  0x00000000
> [   13.719555] mmc0: sdhci: Wake-up:   0x00000000 | Clock:    0x00000007
> [   13.725979] mmc0: sdhci: Timeout:   0x0000000a | Int stat: 0x00000000
> [   13.732403] mmc0: sdhci: Int enab:  0x03ff900b | Sig enab: 0x03ff100b
> [   13.738824] mmc0: sdhci: ACmd stat: 0x00000000 | Slot int: 0x00000000
> [   13.745249] mmc0: sdhci: Caps:      0x322dc8b2 | Caps_1:   0x00008007
> [   13.751673] mmc0: sdhci: Cmd:       0x0000123a | Max curr: 0x00000000
> [   13.758097] mmc0: sdhci: Resp[0]:   0x00000900 | Resp[1]:  0x5b590000
> [   13.764519] mmc0: sdhci: Resp[2]:   0x76b27f80 | Resp[3]:  0x0a404012
> [   13.770944] mmc0: sdhci: Host ctl2: 0x00000000
> [   13.777365] mmc0: sdhci: ADMA Err:  0x00000000 | ADMA Ptr: 0x00000001588be200
> [   13.781708] mmc0: sdhci: ============================================
> [   13.888927] mmc0: Reset 0x4 never completed.
> ...
> [   14.004327] mmc0: Controller never released inhibit bit(s).
>
> in between several sdhci register dumps.
>
> Has anyone seen that before? Is sdhci-msm support broken upstream or am i missing
> something config-wise?
>
> Full boot logs here: https://pastebin.ubuntu.com/p/BtRrgnjV7J/
>
> *: nothing earlier then v5.0 boots on this board, so i couldn't test it.
> --
> bye,
> p.
