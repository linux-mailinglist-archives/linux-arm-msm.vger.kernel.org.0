Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50B6D215AAC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 17:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729316AbgGFPYl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 11:24:41 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:59795 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729301AbgGFPYl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 11:24:41 -0400
Received: from mail-qk1-f178.google.com ([209.85.222.178]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M1YxX-1jtqhB3Oup-0036rS; Mon, 06 Jul 2020 17:24:39 +0200
Received: by mail-qk1-f178.google.com with SMTP id b4so35074517qkn.11;
        Mon, 06 Jul 2020 08:24:38 -0700 (PDT)
X-Gm-Message-State: AOAM5330UEpXtYtNDoXI3w+P6w9NnINufJZHYeIfIUFdJYchByr0+Rpw
        Og6mHqodTGwheTWKUtOUBPvp6pOGi/7V+ppiD58=
X-Google-Smtp-Source: ABdhPJx/kQ8tGLZ80uMQBf/V4GcRLK5qTEQ5SfwL2lBdncwT+o1fz7jO0ykG/E9TJYvaujgh9Qc4ADjh9rnT+ZYCKEs=
X-Received: by 2002:a05:620a:1654:: with SMTP id c20mr40649731qko.138.1594049077399;
 Mon, 06 Jul 2020 08:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
 <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com> <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd@intel.com>
In-Reply-To: <51d6e5bb-3de1-36dc-15a4-c341b23ca8cd@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 6 Jul 2020 17:24:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2LmUVj-yhwxXeCpqdxqJpp0m-q9q9SKQpfh3tFgMXPQA@mail.gmail.com>
Message-ID: <CAK8P3a2LmUVj-yhwxXeCpqdxqJpp0m-q9q9SKQpfh3tFgMXPQA@mail.gmail.com>
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
To:     Dave Jiang <dave.jiang@intel.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-serial@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>, jirislaby@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ldewangan@nvidia.com, Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, Qian Cai <cai@lca.pw>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:l2TiyyKexT2QsitKsQrJvF7YNB4SJ+BqAFAp52Us8tv4D7mFq0q
 aLaiiXYwBBDj3UjVOSjR9rw4TzguFVlHg9gPsbBJcaCxMIcOEq2olwC/cwcJUr2EWamxrEO
 nTuh/tFvS8yeqEP7MfmwHHhTFmg/6d0sjR1rlRCghQnCSdhSVmnMTwqv8l4qcnLA72qv7lN
 Y+6vKUODqFDTRmTsv/v6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QDdRKvb6+k4=:NRqLc2O3zBJWrtUw/LZgPS
 4lasJqUco858TjH4BesQcKk1/85A3/ny2nUH6U9hGyDylaYEPjtMLg5sq6Gsho2DiILL1uzGl
 yujyqVal5vEnztENqINXKjg8m7pWdQA82aIm3YJmIc+iuCgwQEU/xe+6hmOs7iAlogLh7BuS5
 g55F5jFjhghqJcc6rKXO54uHM548nTTk3u1gpBTVy8R9lrSOWkgwoePUZyqOzKuG978AnhCFs
 kPMRvFLvGUXMdZtYhokRkzyzt3ChIrIHiyBID6WNmXlv427snLomCBUFB42i6RseFKImI4d1X
 6UOzMmvIclUplVSVAJZ8nvJfTzZnsVV7V0vafcy/yFSgOrahRzyMWNUFIwhwvlh1UwogYEK8m
 7z7HnRUwVwpZtAW9r6CHWKOZPG+UCyOYxstnamM8g/kHCSx3HS5BcEr5Y7rbU90JeSR5vMNcA
 C/55XbqDvM1nKKxLBCQRGnfxsGBgUye/7h0+2RjQHumoLfqjqQtTt7bDsGwzS/m3M/r+Ey6j2
 ceuJr3pkn016Lblt7cP1V8NFOamQBLd4Adys/yooyDXFqc6gPo/8aBJok1O9cBKZVFAMDfdKL
 3GNXPMpBWh59XHICQ5nSVi3qMmZ1CwgcGxI4THBiHynyA+ALYtzXtzb2A7E6vMYo+Bi2Uix5i
 s78aSdqMTu0RXW8U/J4c/zlyEkIhW9og8KkSWmbsJtoUMkJSYMm5HP6ncIbZAVq7+y2taP3WD
 +S9uWG8Xop//gNeJzSBkVhe39jtn3I1gjbZ8ofThZB8Xzol68a7oCBc6kT/pBZu5+oURjWUWZ
 AJ0C8cvvu/gQXvlxZIKsJWCiyvw4scMhWOR1cI02iON3HKqcilDH9c6LoHLXSlDGbtk3T7kmb
 SkQBhw5lli5EK9x8AfMynpP0VyOB1Ep2dhIvJ1r23TBDaHh84wO5Cud5fTKbowYlpcW1mBsBw
 DiPQQhv/bEgBHMi1JcsiYNgLA3DQV2H/Rsz798+3OLt1hmL9b9eap
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 6, 2020 at 5:01 PM Dave Jiang <dave.jiang@intel.com> wrote:
> On 7/6/2020 5:53 AM, Arnd Bergmann wrote:
> > On Mon, Jul 6, 2020 at 1:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Arnd,
> I'm looking at the pl001_dma_probe(), I think we could make it more robust if it
> uses IS_ERR_OR_NULL(chan) instead of IS_ERR(). Should I send a patch for it? I
> suppose looking at the comment header for dma_request_chan() it does say return
> chan ptr or error ptr. Sorry I missed that.

No. IS_ERR_OR_NULL() is almost always a mistake. A function should either
return NULL on error, or it should return an error code, but should not be
able to return either.

Have you checked all the other 'return NULL' statements in your patch to
ensure that they never return error pointers?

       Arnd
