Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE2FA35D5B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 14:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfFEM5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 08:57:32 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:39145 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727769AbfFEM5c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 08:57:32 -0400
Received: by mail-ed1-f65.google.com with SMTP id m10so5661074edv.6;
        Wed, 05 Jun 2019 05:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mNwmQAhzOwQjP+3QJ9Qyx716sV+MvZek24hV7EIWuEc=;
        b=MQwC6cZRlpJp8S8gEeUy0yt/YY6pRXiNx3qhhdxZz9mLO9tFistVEu7HCQyTCKskfV
         QpilpgNDrSsy0SJeh+jsSnNea/tjgHTWFNws8h4ueQKU5kh1xYGg9Q1gyK3vv6zxAnHw
         sU97TDHpfGjxnf2hgH7zC8Dfg2zLXJcMhil+tT/laN5pH5eVwjNqHpydN74VC65OcIlw
         L9iWQeysiJXDLU7R9xRH0J9WW7JcL5/NzkTplwLoLIL+Gsgnwi27Fh8B4Fb74VRhZPAc
         I5l9I4aOJVWnaQQ8y39Ju17r1ll91KBxJFYq3FZblaRbSz0Nr10NIb77Pp/mAXG0FHCq
         9YUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mNwmQAhzOwQjP+3QJ9Qyx716sV+MvZek24hV7EIWuEc=;
        b=r/J9CKrdWOqN1ykRMM8Fm/4RbD4ma+Epaf6pu9o44ILGCqYcsBbDKdAMvIgw7z3Xzr
         pjSwdfVqe8clVZ9iOfpft5aIdRQV5yscPnrGsN0ofDcB9IyaQzjSZVRcaus1zVjgWzcr
         Gdlw8ZIxE19b+LyZXdjcdxti6O33+jIC2YCi6+nQwBdEJpS9eHbgY8gFRvunDJIthJ5i
         7Ln5qgwaAVAwH6mbxYJcdal4jJsg94sIHBVqNhqRZps0Hs3aaZIgcjizDCU9BsuKCLU2
         2htTvMcEdwP3MSfMZ4uqSZbBI8b48irggHsi9kNGU64ZXRV3aZn0pOwJI6iteydbIdzF
         +r5Q==
X-Gm-Message-State: APjAAAXQiQvHFzVyKyjgybVOVj/k1iVDfVG1H+YW+ECx4f1BauUXRb5t
        1EJwymW/eNxQ3Xc2aE8/0aa7ekMRxA/sZUnK9gg=
X-Google-Smtp-Source: APXvYqz1vxq2jyAjvwPKAI30zCoOlIgNefzBtyYxFxTl0wx0mcMOz/q43eVDTS2eLaVvoero3Qx6Gl/7d2TUyTJ/Pns=
X-Received: by 2002:a17:906:85d4:: with SMTP id i20mr20270754ejy.256.1559739450124;
 Wed, 05 Jun 2019 05:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20181201165348.24140-1-robdclark@gmail.com> <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com> <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
In-Reply-To: <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 5 Jun 2019 05:57:16 -0700
Message-ID: <CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] of/device: add blacklist for iommu dma_ops
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Paul <seanpaul@chromium.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 4, 2019 at 11:58 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> But first of all, I remember Marek already submitted some patches long
> ago that extended struct driver with some flag that means that the
> driver doesn't want the IOMMU to be attached before probe. Why
> wouldn't that work? Sounds like a perfect opt-out solution.

Actually, yeah.. we should do that.  That is the simplest solution.

BR,
-R
