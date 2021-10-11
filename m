Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4165C428A3D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 11:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbhJKJ7M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Oct 2021 05:59:12 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:38753 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235608AbhJKJ7M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Oct 2021 05:59:12 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M7sM0-1meprY40LS-0053ld; Mon, 11 Oct 2021 11:57:10 +0200
Received: by mail-wr1-f50.google.com with SMTP id r10so54318641wra.12;
        Mon, 11 Oct 2021 02:57:10 -0700 (PDT)
X-Gm-Message-State: AOAM531KQFaylaynQsx0T9bgDsskPjI96gQ7o0qP/4B0Yw7UgEDJVstP
        6Jc584lj3C4pxF+JkSQydd1SkIQNyqLVsoqwWdc=
X-Google-Smtp-Source: ABdhPJxAE0aTicIaLYe2qnN2pp2cTh2YlBgwyXsBeIGZ6xRxR2Cgvhms/FkNW5VQT+nJ6ErHbjgjqQ/uoPWW1e+ZyE4=
X-Received: by 2002:a05:600c:1548:: with SMTP id f8mr7487209wmg.35.1633946230518;
 Mon, 11 Oct 2021 02:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211010023350.978638-1-dmitry.baryshkov@linaro.org>
 <YWJpJnaQ2Nr4PUwr@yoga> <CAK8P3a3irqEVH2e9wCK4MSSBKRW-n8pFSzYBks9ri-hepewkUw@mail.gmail.com>
 <CAA8EJpoD4Th1tdwYQLnZur2oA0xX0LojSrNFLyJqdi6+rnB3YQ@mail.gmail.com>
 <CAK8P3a3JwQP1b0KeLRN0UCMmzFn3+gY2oexYUwGyt2bOqC0P4A@mail.gmail.com> <CAA8EJppAx_bweNhQuQuA5pQkWpyvtYNqttL-fiKgqpJpRqHMKw@mail.gmail.com>
In-Reply-To: <CAA8EJppAx_bweNhQuQuA5pQkWpyvtYNqttL-fiKgqpJpRqHMKw@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 11 Oct 2021 11:56:54 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3DLP3qPee0us4VZfU7h9ND8vtzA-Lv3a5JVGd=RnxsNg@mail.gmail.com>
Message-ID: <CAK8P3a3DLP3qPee0us4VZfU7h9ND8vtzA-Lv3a5JVGd=RnxsNg@mail.gmail.com>
Subject: Re: [PATCH] iommu: fix ARM_SMMU vs QCOM_SCM compilation
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        Thierry Reding <treding@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:OJpcktUK+3q1MfYvEF4TOG0S4bE5DgsF2wI86U5t9e1/GOwiMST
 TMRwlMvr6vK8gbCK25Jy4eWvv5JUlTI1ZeeOqdEWMzfG0veNdUu7E0diyqxcysKUthS/U0j
 Z+40LKNIGmAmFJhbG0RZ2fhworRbvZXYvNpZZCUXCuGvjN+bDguHxJTIUFJhalZMgvBe5eM
 cdH2hnGxQ/f/1RrCtF2Kw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:e7NJ3ff+BN0=:KAdCZLYI26A5mmtzviLZrv
 PclcHxot8Z9xEalQF7UFc44rFf9doKrYGMsgq/mV4nUn69UIRASfcLUQ9Cg2/RQHwBhEfQCbk
 8AyhFOuV3UL+LPgCIOsZhj112XpWLD6c24F5RjveHNXzVHXU/QZYMTm8/VnggZz2lqSoeFx8e
 cFozdTkDq46n4Nz1KUoCGaOC8it7ufhOraumXbi1LdorTbWo+IJFyVC3v0OtuKRCVLsjtBTSn
 8Kkg346tCyuRcureD6uhCjfUQEpwKA0vaIv620vMMITHyfCXfMuPZ5LWvSLi/mMLn7ebNKtfG
 Vz8KcarvxoXUCnVAbYcpK2udlLo2bGj74zKjpE7Bd7nhFnqRLLcAXqPBsWywLuvswzRVzVS08
 1oM28W11UUWAAqfl3imobC417Q88Z7JUkB9MMPJ+5enamJ53Ooh79kOp9oPP57kdttN628KdX
 RJOCDexSuAeCkM/lY2tStYZ/b5qq4m5C9/U6w8Jym0Vz2I5H18JeULkOnfx52gyUwa/cPHP7M
 89zzhxz0LRVoOspAdo1hdzURC3Y9GSgp2QLXhjSN0xhf/wqgqFoR2zlyTmbfbKG16mfRobvYU
 wI+mBxpiSVVaWFSJ7hf/Vtubd+zE7nt2PE8WK2GGhCalCP0w7V4I3EWLWie6MKQ4lvN0aro48
 chdOIg+kCMSImD0bJz6Upb04V0zK1O+efwZuMo/Y/T7yC8CGUo5JOILY0Io4UdEcHbCkpRz9C
 84RMizk7VABdukXhkZvPkJNzE8BFQHubd5SoSA==
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 11, 2021 at 11:10 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, 11 Oct 2021 at 09:09, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Mon, Oct 11, 2021 at 6:11 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > > On Sun, 10 Oct 2021 at 20:42, Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > The patch seems correct, but it becomes overcomplicated. What about:
> > > - restoring QCOM_SCM stubs
> >
> > The stubs are what has led to the previous bugs in this area to often
> > go unnoticed for too long, as illustrated by your suggestion
> >
> > > - making ARM_SMMU select QCOM_SCM if ARM_SMMU_QCOM
> >
> > I assume you meant "select QCOM_SCM if ARCH_QCOM",
> > after we stop using ARM_SMMU_QCOM?
> >
> > > This would have almost the same result as with your patch, but without
> > > extra ARM_SMMU_QCOM Kconfig symbol.
> >
> > The "almost" is the problem: consider the case of
> >
> > CONFIG_ARM=y
> > CONFIG_COMPILE_TEST=y
> > CONFIG_ARCH_QCOM=n
> > CONFIG_ARM_SMMU=y
> > CONFIG_DRM_MSM=m
> > CONFIG_QCOM_SCM=m (selected by DRM_MSM)
> >
> > The stubs here lead to ARM_SMMU linking against the QCOM_SCM
> > driver from built-in code, which fails because QCOM_SCM itself
> > is a loadable module.
>
> I see. The idealist in me wishes to change my suggestion to
> 'select QCOM_SCM if ARCH_QCOM || COMPILE_TEST'
> but I have the subtle feeling that this also might fail somehow.

I think that would actually work, but it has the nasty side-effect
that simply flipping 'CONFIG_COMPILE_TEST' changes what
the kernel does, rather than just hiding or unhiding additional
options.

> > We can move the "select QCOM_SCM" in the ARM_SMMU_QCOM
> > symbol if we make that a tristate though, if you want to separate it
> > a little more.
>
> This would complicate things a bit, as we would no longer be able to
> use 'arm-smmu-$(CONFIG_ARM_SMMU_QCOM) +=' construct.

I'm fairly sure we could still use that, Kbuild is smart enough
to include both 'file-m +=' and 'file-y += ' in 'file.ko', see
scripts/Makefile.lib:

# If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a
composite object
multi-obj-y := $(call multi-search, $(obj-y), .o, -objs -y)
multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
multi-obj-ym := $(multi-obj-y) $(multi-obj-m)

# Replace multi-part objects by their individual parts,
# including built-in.a from subdirectories
real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)

What doesn't work is having a built-in driver in a directory that is
guarded with a =m symbol, or including a =m object into a =y
module.

        Arnd
