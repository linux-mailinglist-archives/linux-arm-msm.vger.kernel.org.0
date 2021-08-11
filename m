Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AABD3E92E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 15:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230479AbhHKNmt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 09:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbhHKNmr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 09:42:47 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AF9C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 06:42:23 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id cp15-20020a17090afb8fb029017891959dcbso9611311pjb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 06:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qTSWaVbeCk9kDBuSPcoRWHMShMuhgNRVM5qTKrrI18E=;
        b=hkZ8mJsmh1d7pmXI76Eh5bxrUjFbaM4KcYCfsgHfIbVqsbhgbA3npV+QuHkky9rOMD
         yNPsBk5Ou6GntRw6KK5kGUl21jqdm4v2muHgfFh2pB9BlCDsU7tTYPlwrmvAKKGGMV5H
         ESkLjWML5Lx68F2A32wTiS7UyPAt3aTyT0lHV1bAOfD1faW7vsE1Ua+fWBVMLVFHJm6m
         a7KRLWe41fAnvhvAl6MsI+P6UWm5yN4d2uAsz0gpK6TXuwrOBNuCzvjAM8RZrJWndiDh
         laW82y9BkU0+wvzUSiLBLsx3CG/rnI29xGLN152Xy5u0mmC/Vej8hKwLxFmBDpVuPaZt
         GnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qTSWaVbeCk9kDBuSPcoRWHMShMuhgNRVM5qTKrrI18E=;
        b=kMBNcjZWrGwZljG+3wyjJ56MwJicS183GNA5ClghchKe7ehOE2PATKYlyZVnxa4RAx
         3mQEz4Zrj3jIwDJ31f1a7LM7rJrPXb+mMKmFFD/o1dHDL7KPSP791SR1mPFff+fc/eUA
         3FVEprcXdVMBg14CAYIeNBNyijhzgiukyRr/5Ov0Hi6TuxPZo5vbbt9T0uEY/XeQCQc4
         /gAtcSjlL9+E/l0sxpeXu0mj7yDziEtvKRW5C6pdV4SWW/WD15MYq9fKd4Dn3teABR4+
         y/YlRRUnm8fvKjH82llEfKpgkBbrZxBT3LKvaujL9ZE8B48crHpetcuc0V1H26DA7ZTj
         w+lg==
X-Gm-Message-State: AOAM532Kwo8xz0pUo2OtPDikyo147G9yG45jzGYc+RFnXhfSzlcCWWUH
        oIarlDm9qBdjK8epCG8Dihq5SBhAYrr1MIMRu0aOoA==
X-Google-Smtp-Source: ABdhPJwa0qt6q8xfIUkPhYYs1kMWCSIee8KzujW+Gz6HydkP/DwEnrJtwhJrukPC+FSMH9jxMsBMvW3+GEXjH/GmIXw=
X-Received: by 2002:a62:78d0:0:b029:3dd:8fc1:2797 with SMTP id
 t199-20020a6278d00000b02903dd8fc12797mr4256520pfc.65.1628689343429; Wed, 11
 Aug 2021 06:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20210811074838eucas1p2a0e8625af27c10209d9bcfc732254ae7@eucas1p2.samsung.com>
 <20210810103336.114077-1-robert.foss@linaro.org> <0b694e24-5cc8-4944-d3a2-115306ae7b89@samsung.com>
 <CAG3jFys+ch86Y7338-DH1+8Q4w5eK83revVsNwoVCugwXeqjmQ@mail.gmail.com>
In-Reply-To: <CAG3jFys+ch86Y7338-DH1+8Q4w5eK83revVsNwoVCugwXeqjmQ@mail.gmail.com>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Wed, 11 Aug 2021 15:42:12 +0200
Message-ID: <CAG3jFytOQQBnnJQU9qDdQedrrcPz=SQPeXHX1HJQ8c5U94feCg@mail.gmail.com>
Subject: Re: [PATCH v1] media: camss: vfe: Don't use vfe->base before it's assigned
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Todor Tomov <todor.too@gmail.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Kernel Functional Testing <lkft@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 11 Aug 2021 at 11:41, Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Marek,
>
> Thanks for testing this.
>
> On Wed, 11 Aug 2021 at 09:48, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >
> > On 10.08.2021 12:33, Robert Foss wrote:
> > > vfe->ops->hw_version(vfe) being called before vfe->base has been assigned
> > > is incorrect and causes crashes.
> > >
> > > Fixes: b10b5334528a9 ("media: camss: vfe: Don't read hardware version needlessly")
> > >
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> >
> > With this patch applied on top of linux next-20210810 instead of the
> > NULL pointer dereference I get following error on DragonBoard410c while
> > loading kernel modules:
> >
> > [   18.480608] qcom-venus 1d00000.video-codec: Adding to iommu group 1
> > [   18.536167] qcom-camss 1b0ac00.camss: Adding to iommu group 2
> > [   18.600373] Internal error: synchronous external abort: 96000010 [#1]
> > PREEMPT SMP
>

After testing this patch + linux-next[1] I'm not able to replicate the
'Internal error' above on the db410c. And I don't think it is related
to this patch.

Are you seeing the same error on [1]? And are you seeing it before the
b10b5334528a9 ("media: camss: vfe: Don't read hardware version
needlessly") patch?

[1] https://git.linaro.org/people/robert.foss/linux.git/log/?h=camss_print_fix_v1


Rob
