Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5470B2D029
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2019 22:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbfE1USA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 May 2019 16:18:00 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37744 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfE1USA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 May 2019 16:18:00 -0400
Received: by mail-pg1-f193.google.com with SMTP id n27so11648188pgm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2019 13:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=KrGikCKu6YlKhTVN010dvA5E5cA05xzkEb5LyNwAY5c=;
        b=NhkEGYmQMXlTxbTpm4Z/689iWHsNAj2BGasi//VAp2KUzZB0JS8M7w6yi4WVe0Qqa2
         /x8Y4MrRqHYvQd9PLlggHKY+Y88hRsokaTs1klNtCunPnbckr2N3E/Zz5j32F8IYj565
         0qvlFFGX3ObrY7T8DRIR+x8gGeJQ5Ms41OY7KVGa55GfQ3fhdS0fx6fRxSOFzXcFt8rk
         DbULApry0bomxem1WAC+UIHOvWGfCb5IyHZpurxV6r+wvep1Mh58+LV5qoETr9G0b+ak
         MMRfFnqYwC0lgoObx86Ct2/NDgoctpL7K6KVZLTnZEDYmJuI0VB1XBMlHZlG1suKs3Ix
         Xx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=KrGikCKu6YlKhTVN010dvA5E5cA05xzkEb5LyNwAY5c=;
        b=NFVRSI84AvMvzs1NCG6CqzzVTaYAwqKOaBYsd7jfQsgtmoyHJWZo6wquM4Rar6J6Qs
         RqAm7WmDdR16NI85CxhKi5LEOl1G0Vu0fB2j9FH/3UTZHxlTp49Xje61etBB3EFbHyNF
         4IpcAYXUA8u2nFgL8mW+zG5zYaV1G127LjdZjN1HzX45heZLeJKR7QkLgafjcZVEi25j
         y/IGIcwBfzBpISiB7QbFiNNQSb2vj5XJNd1BSgRCA+z3pAQ6rOVDD5BofEAhctY2Z0cO
         t/NNwoFmPtiVfzN6+1bdEqkPshdTXO30m11m/dUPNrRtxorre7JatuH5ndSuCsMRKAaS
         +WTw==
X-Gm-Message-State: APjAAAWKY4EPVPHFHs5ex8aUON/ITFbABxhSIwKQoUvbysvjX4oGMyuN
        JZaHLYrLE3aI4OEqfV8HV6DgcA==
X-Google-Smtp-Source: APXvYqxWD+cfTS7O40Zo3XwMSbbJSAl7g7RPXdtLV6e5nllZTQ4Hw/OZELCtS5YVO6icCyWJD6cc4Q==
X-Received: by 2002:a17:90a:9305:: with SMTP id p5mr8108806pjo.33.1559074679481;
        Tue, 28 May 2019 13:17:59 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:15a5:c69f:661c:c4eb])
        by smtp.googlemail.com with ESMTPSA id l3sm24805980pgl.3.2019.05.28.13.17.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2019 13:17:58 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Amit Kucheria <amit.kucheria@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     "kernelci.org bot" <bot@kernelci.org>,
        kernel-build-reports@lists.linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>, andygro@gmail.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: next/pending-fixes boot: 227 boots: 6 failed, 198 passed with 20 offline, 1 untried/unknown, 2 conflicts (v5.2-rc1-375-g3695b18d1e9cd)
In-Reply-To: <CAP245DXkEym=x3vrN2cc2y+uHHx_+z0cW0WsV0dGGXfd+c2mSQ@mail.gmail.com>
References: <5ce71d79.1c69fb81.dd0de.33cf@mx.google.com> <7hv9y01z85.fsf@baylibre.com> <20190524012913.D9BB72168B@mail.kernel.org> <CAP245DXkEym=x3vrN2cc2y+uHHx_+z0cW0WsV0dGGXfd+c2mSQ@mail.gmail.com>
Date:   Tue, 28 May 2019 13:17:58 -0700
Message-ID: <7hef4ipc3t.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Amit Kucheria <amit.kucheria@linaro.org> writes:

> On Fri, May 24, 2019 at 3:29 AM Stephen Boyd <sboyd@kernel.org> wrote:
>>
>> Quoting Kevin Hilman (2019-05-23 17:18:50)
>> > [ + Andy Gross, Stephen Boyd ]
>> >
>> > "kernelci.org bot" <bot@kernelci.org> writes:
>> >
>> > > next/pending-fixes boot: 227 boots: 6 failed, 198 passed with 20 offline, 1 untried/unknown, 2 conflicts (v5.2-rc1-375-g3695b18d1e9cd)
>> > >
>> > > Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fixes/kernel/v5.2-rc1-375-g3695b18d1e9cd/
>> > > Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/kernel/v5.2-rc1-375-g3695b18d1e9cd/
>> > >
>> > > Tree: next
>> > > Branch: pending-fixes
>> > > Git Describe: v5.2-rc1-375-g3695b18d1e9cd
>> > > Git Commit: 3695b18d1e9cd6bb739579e782670518d500839d
>> > > Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> > > Tested: 82 unique boards, 24 SoC families, 19 builds out of 223
>> > >
>> > > Boot Regressions Detected:
>> > >
>> > > arm:
>> > >
>> > >     qcom_defconfig:
>> > >         gcc-8:
>> > >           qcom-apq8064-cm-qs600:
>> > >               lab-baylibre-seattle: failing since 3 days (last pass: v5.1-11016-gf31c9c9ee122 - first fail: v5.1-12956-g8d4b83476a8f)
>> > >           qcom-apq8064-ifc6410:
>> > >               lab-baylibre-seattle: failing since 3 days (last pass: v5.1-11016-gf31c9c9ee122 - first fail: v5.1-12956-g8d4b83476a8f)
>> >
>> > Andy, 8064 not happy in linux-next lately, I haven't had a chance to
>> > look closer.
>> >
>>
>> Looks like some sort of tsens crash with a bad regmap_field or something.
>>
>> [    4.001041] Unable to handle kernel NULL pointer dereference at virtual address 00000000
>> [    4.008631] pgd = (ptrval)
>> [    4.016914] [00000000] *pgd=00000000
>> [    4.019374] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>> [    4.023100] Modules linked in:
>> [    4.028402] CPU: 2 PID: 21 Comm: kworker/2:0 Tainted: G        W         5.2.0-rc1 #1
>> [    4.031259] Hardware name: Generic DT based system
>> [    4.039175] Workqueue: events deferred_probe_work_func
>> [    4.043859] PC is at regmap_field_read+0x1c/0x70
>> [    4.048973] LR is at is_sensor_enabled+0x40/0x74
>> [    4.053743] pc : []    lr : []    psr: 20000013
>> [    4.058340] sp : c02f1dc8  ip : 00000000  fp : 00000007
>> [    4.064332] r10: c0de1534  r9 : c0bb596c  r8 : ee4eda00
>> [    4.068214] usb 1-1: New USB device found, idVendor=04b4, idProduct=6570, bcdDevice=32.99
>> [    4.069539] r7 : c02f0000  r6 : c02f1de0  r5 : 00000000  r4 : c02f0000
>> [    4.069549] r3 : c02f1dc8  r2 : 11403009  r1 : c02f1de0  r0 : 00000000
>> [    4.074838] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
>> [    4.083085] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>> [    4.083096] Control: 10c5787d  Table: 8020406a  DAC: 00000051
>> [    4.083108] Process kworker/2:0 (pid: 21, stack limit = 0x(ptrval))
>> [    4.083118] Stack: (0xc02f1dc8 to 0xc02f2000)
>> [    4.083152] 1dc0:                   c02f0000 c093d93c c02f0000 00000000 00000000 c093dabc
>> [    4.083192] 1de0: 0000000b 11403009 ee39b040 ee39b040 ee39b040 c093d794 00000000 11403009
>> [    4.089507] usb 1-1: Product: USB2.0 Hub
>> [    4.096045] 1e00: 0000000b 11403009 ee4eda10 00000000 c10a2b84 00000000 c10c2f78 00000000
>> [    4.096085] 1e20: c10a2b84 c080b940 c110b37c ee4eda10 c110b380 00000000 c10c2f78 c0809480
>> [    4.096126] 1e40: c02f1ecc ee4eda10 ffffe000 ee4eda10 c10a2b84 c02f1ecc c0809b78 00000001
>> [    4.105168] hub 1-1:1.0: USB hub found
>> [    4.110367] 1e60: c0dbb994 c10c2f78 ffffe000 c0809938 ee4eda10 00000001 00000001 00000000
>> [    4.116581] hub 1-1:1.0: 4 ports detected
>> [    4.122170] 1e80: c02f0000 c02f1ecc c0809b78 00000001 c0dbb994 c10c2f78 ffffe000 c0807718
>> [    4.187285] 1ea0: ffffe000 c028c26c ee20acb8 11403009 ee4eda10 ee4eda10 c02f0000 ee4eda54
>> [    4.195443] 1ec0: c10938a8 c08092d8 ee4eda10 ee4eda10 00000001 11403009 ee4eda10 ee4eda10
>> [    4.203603] 1ee0: c1093b18 c10938a8 c10c2f78 c08084e4 ee4eda10 c1093894 c1093894 c0808a2c
>> [    4.211762] 1f00: c10938cc c0208880 eefc0cc0 eefc3e00 00000000 c10b76b0 00000000 c033c804
>> [    4.219921] 1f20: eefc0cc0 eefc0cc0 eefc0cd8 c0208880 c0208894 eefc0cc0 00000108 c1003d00
>> [    4.228082] 1f40: eefc0cd8 eefc0cc0 ffffe000 c033d6dc c023ed00 c10b70e8 c0d44c58 00000000
>> [    4.236242] 1f60: c023ed1c c023ed00 c023ec80 00000000 c02f0000 c0208880 c033d448 c029bdec
>> [    4.244400] 1f80: c023ed1c c034289c 00000000 c023ec80 c0342754 00000000 00000000 00000000
>> [    4.252559] 1fa0: 00000000 00000000 00000000 c03010e8 00000000 00000000 00000000 00000000
>> [    4.260719] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [    4.268878] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
>> [    4.277031] [] (regmap_field_read) from [] (is_sensor_enabled+0x40/0x74)
>
> Sorry for breaking the boot on 8064. That was one of the platforms
> that I didn't convert over to regmap (needs more refactoring). I had
> hoped kernelci would catch any issues but looks like thermal-soc tree
> entered linux-next quite late and didn't catch this.
>
> Does reverting 3e6a8fb33084 ("drivers: thermal: tsens: Add new
> operation to check if a sensor is enabled") fix the issue? If so,
> reverting that commit might be the best course of action since I've
> started vacations and can't fix this for 8064 in a meaningful amount
> of time (until 3rd week of June). cc'ing Bjorn in case this needs more
> investigation, but I think that patch is fairly self contained and
> reverting it shouldn't have any knock-on effects.

Tested-by: Kevin Hilman <khilman@baylibre.com>

Reverting that commit gets things booting again in my lab.

Kevin
