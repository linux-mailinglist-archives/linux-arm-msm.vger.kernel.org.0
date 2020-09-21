Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D93273201
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 20:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgIUSdf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 14:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgIUSdf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 14:33:35 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02484C061755;
        Mon, 21 Sep 2020 11:33:34 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id d4so450859wmd.5;
        Mon, 21 Sep 2020 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2pljieOa3zqVRg/nGCsqWTPIMVj9a7ObD+5hzvK2Z0I=;
        b=s/2lSfECPbjLHM2LdhQLNaMh78qvA/Uu+BsbwbIwRyEVeTA30UJJJ26rlr0/UdPmIj
         q6EtpiecmC2cTci+sv0gqZhFfHO0H9VgrYQ/YF7xuti1+alXMRMily9jWUq/lvLQ9b9G
         SpcGH6rlbNgPOBVhfYQK1JE5JfKgj4cLpi2MYoRmZbY/f1VzAD55/ZBfiqWlqi+W8QK2
         2fsbgcim3qo9fRXr77t63uZtuqi4MJmRs/vywjq3keI9xP9xz9HwvGNlGjs8XKZZFF33
         /tOeYdh+UaFxmA6mb9Jb3PdX7yYd2lRr3gUz9pzyjPXpriHZQ2Hiw4klgPs/5bo/ObzN
         wspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2pljieOa3zqVRg/nGCsqWTPIMVj9a7ObD+5hzvK2Z0I=;
        b=L++N3wECfXSCYujHkVuP4xB3RuxMSHNMAy4s7skoa5jxqBW8kIXThskN8X3Easegls
         SROdns4e9isKUf5IgfQOueggmmDU/fAiXrQd21VP/YBb3rQV24vYwqg5hS9sv/0s3IyY
         chGIY1LNRZ46bf+eBBThiMjJ/XbeqrCXijalQyEfQo2GY8UmFZbYkEEjjVHFMXrApW5d
         AMt3YzHNCj4MyTQGCboWleMELz6hmF73poI49wU1YL0Hk+JnYwTP/NwYJSmayHbDNNRi
         JDSFF9/XzdSijgnXPFRWRsaorip2vJJyXhulxSm7CYJmuCFOipEacEYSU5ss4/IXEXgZ
         gS1w==
X-Gm-Message-State: AOAM533vU2cKrJO82T6taNUHyRsp0EjWIJa1j6Qashv+2Nb5LSAZaGKI
        o72zsyiB5z1Bva9hGoaUmHQA+q1AYGzvJOXN7CCYDthyhjc=
X-Google-Smtp-Source: ABdhPJwOdkyX2T0nNsDtEYqTQPWOnuWTEliEywfKgd/Kd/kkmsATU6V+QmG/OrZNm2joFQfWrCrOoKg8VsCqThpuZIU=
X-Received: by 2002:a7b:c345:: with SMTP id l5mr630045wmj.123.1600713213466;
 Mon, 21 Sep 2020 11:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200918011357.909335-1-yukuai3@huawei.com> <20200921175048.GD3141@willie-the-truck>
 <CAF6AEGuVsuOxhFONDpJF4EsY-KWQu+Vna_CM9dPhrFS_9FQsqA@mail.gmail.com>
In-Reply-To: <CAF6AEGuVsuOxhFONDpJF4EsY-KWQu+Vna_CM9dPhrFS_9FQsqA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 11:33:21 -0700
Message-ID: <CAF6AEGu1CLqQcowTz+V8E5fj2FLFKLmUMchz1hDP1niM8QDkPQ@mail.gmail.com>
Subject: Re: [PATCH] iommu/qcom: add missing put_device() call in qcom_iommu_of_xlate()
To:     Will Deacon <will@kernel.org>
Cc:     Yu Kuai <yukuai3@huawei.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        yi.zhang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 11:27 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Sep 21, 2020 at 10:50 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Fri, Sep 18, 2020 at 09:13:57AM +0800, Yu Kuai wrote:
> > > if of_find_device_by_node() succeed, qcom_iommu_of_xlate() doesn't have
> > > a corresponding put_device(). Thus add put_device() to fix the exception
> > > handling for this function implementation.
> > >
> > > Fixes: e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own subdirectory")
> >
> > That's probably not accurate, in that this driver used to live under
> > drivers/iommu/ and assumedly had this bug there as well.
> >

and fwiw, that looks like it should be:

Fixes: 0ae349a0f33fb ("iommu/qcom: Add qcom_iommu")

> > > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++++-
> > >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > I guess Rob will pick this up.
>
> Probably overkill for me to send a pull req for a single patch, if you
> want to pick it up:
>
> Acked-by: Rob Clark <robdclark@gmail.com>
