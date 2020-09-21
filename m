Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56B62731E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Sep 2020 20:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgIUS03 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 14:26:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726950AbgIUS03 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 14:26:29 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20C8BC061755;
        Mon, 21 Sep 2020 11:26:29 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id a9so449737wmm.2;
        Mon, 21 Sep 2020 11:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dCyVGQnUk6ak00juGQ9+yACcUsal+k0T/j693sv4Hqk=;
        b=TeSTWsCb05am1AJpbQCGox72w+6ceI/7ZQ4Q5G9x6OAAMtrWnCUZqKIzZPiuZNk3Tj
         akTwi4T3BrR/9q05kzQVDy8WmA91CaQTp89lcHpeDNQGUs7lm6hmB4W1oZw2+iofsu2V
         NXUtiHmAD+cNAQw8RhZThPZCo01a83BiOlv1aAt6++BmatJ5Ph/9JM/N/rUlkpJFyeVB
         gu7ICRkgaq48/jDqPQT0QJYqQ6qHUjgd16qoMko1NazzUUYLBUnE6JUlvTMkt5N6yvBc
         jl+4HGqL/CJuTns4LaEg3JGoaAgkgJy2FODS6MsMwpsusgs0JvayWEeW4MvWVJl26b4W
         JrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dCyVGQnUk6ak00juGQ9+yACcUsal+k0T/j693sv4Hqk=;
        b=KYR9aNz3JnfLv1nmxQBb3z/I3deTkr3aXZg+CKLyKPMCNuhIieeG7pQ6i66QaDhTNz
         ytYddq5MYDON17bdS5SS0wiUnHQ7WJ5PAAXTHz9VRhDmdCs7vamMx6ucePx/VYEJQRBW
         /Loymf2KtpC8liIqo35uuugSzERORfsVTHiV6+JqulIZ2N7nk4Xi2PCxkEvOt0OWVKCl
         GE0OWM3IDDVB3o9kXiTPMcgz5RNiHcdojvA8uyNNceelLWqIbDuZDLB1YduMxpXHZw6K
         lyCPURzmcJi55EZnucExDG2gx5gsnXsSiD67eEg94C8zb25ukbWnHHAopi+9UChYMBZQ
         +kWQ==
X-Gm-Message-State: AOAM532jisl46v7Ud7f+58a65e7Odg62IhB/JbQFL6RQpL3pgonECxAB
        lfQ72wTRoMg/wLhwUskUL20yZqDmwIV2bfjmeOU=
X-Google-Smtp-Source: ABdhPJy10JC7GG2vBuLqwf7HeTFtBCCb5okaQN7XbyNtkj6P64TfuA5s2cA8qT66l6yk4Le7xT9u55Q7ijqN5brOKu0=
X-Received: by 2002:a05:600c:2183:: with SMTP id e3mr663676wme.49.1600712787792;
 Mon, 21 Sep 2020 11:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200918011357.909335-1-yukuai3@huawei.com> <20200921175048.GD3141@willie-the-truck>
In-Reply-To: <20200921175048.GD3141@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 11:27:28 -0700
Message-ID: <CAF6AEGuVsuOxhFONDpJF4EsY-KWQu+Vna_CM9dPhrFS_9FQsqA@mail.gmail.com>
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

On Mon, Sep 21, 2020 at 10:50 AM Will Deacon <will@kernel.org> wrote:
>
> On Fri, Sep 18, 2020 at 09:13:57AM +0800, Yu Kuai wrote:
> > if of_find_device_by_node() succeed, qcom_iommu_of_xlate() doesn't have
> > a corresponding put_device(). Thus add put_device() to fix the exception
> > handling for this function implementation.
> >
> > Fixes: e86d1aa8b60f ("iommu/arm-smmu: Move Arm SMMU drivers into their own subdirectory")
>
> That's probably not accurate, in that this driver used to live under
> drivers/iommu/ and assumedly had this bug there as well.
>
> > Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
>
> I guess Rob will pick this up.

Probably overkill for me to send a pull req for a single patch, if you
want to pick it up:

Acked-by: Rob Clark <robdclark@gmail.com>
