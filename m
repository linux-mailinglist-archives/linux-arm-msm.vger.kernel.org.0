Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3A3E35EF4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 16:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728177AbfFEORI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 10:17:08 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:36272 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728083AbfFEORI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 10:17:08 -0400
Received: by mail-ed1-f65.google.com with SMTP id a8so6059239edx.3;
        Wed, 05 Jun 2019 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DYFO74imdmleJLw5lYkuA6kO6lk6BDNzHYqBpZMjZ8s=;
        b=kvxtMTCZdYLS36jfstozpuwwHILmf0b2bvAMNZXohkogm+c2hPkV+4Z95BmSa+Iqxh
         ZVGQ9C767Mwx8Ubqg7OXp4cc5CZA5jSH642GgtyyWORUHyEr1yHfT+o5w1ktS+0B1E2k
         VE4Q8MtKaqiEo8ZAclw5warQKFbLbRryMg6MMwGAZdzZ0/aXkoolO6+F5v/FVE8PgoRz
         wjDdu3SfUhW1O6EVCML5GIKEDN1vkOd1YFIkqUl0szkdzv18oI0Pfv/hKcA64SRN4QKq
         RO1JzS9ecXpXP+8nLy05iP+IsEluRraqXvXeKhUhfZOANq+Kntu5MISL4uAXjrVMgbTe
         +6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DYFO74imdmleJLw5lYkuA6kO6lk6BDNzHYqBpZMjZ8s=;
        b=gMLwK+UtnG3D0YHfkoAawmZ0YnqD0oJSZGb4hoeJeVFC+EJbDApMRcTCeXXlNA+HBX
         oPrcqed6BjydKk/mjvxn/IvpwJcfIzAOGn0TBDSVd2l2gqmlwb463OAri8aT6gkW+yhp
         mdhTKs+UTE7UNGr7fCKhVe/xXCx7l+MJkP6ElDCsz30OoQZbN8/G/HGo0Blh0VocQZws
         MOx0ffD16YRv7wgbW132hIU/cRBruvPcbigQP/YwatgoxdYYcn8ttUe3x7kOsA5WfM/f
         M88c/6aW6jJuRcnJL6czYPZvl3JBzEg7KOr+oeBpRkN5kOM21fNbwEjhXnhNmTb5oc4D
         h3vw==
X-Gm-Message-State: APjAAAWUUIyfuzaSX62gkF9w30Ur9n35aQvW/oBmlLWdsif/Y0/NEW89
        WDSumJJuL0aykQ67twmNOwmKjP9QOZIdUW/G//k=
X-Google-Smtp-Source: APXvYqz++haK8phyFHbXw+7xx+j+S+xiNW3yfgGMolbWak16tppAeVvpIviRn0GFGAEATK3z185Rfr0/uCa7tvr7S5E=
X-Received: by 2002:a17:906:2ada:: with SMTP id m26mr8080786eje.265.1559744226214;
 Wed, 05 Jun 2019 07:17:06 -0700 (PDT)
MIME-Version: 1.0
References: <20181201165348.24140-1-robdclark@gmail.com> <CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
 <CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
 <CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
 <CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
 <CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
 <CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
 <CGME20190605125734epcas1p43b15cc8c556d917ca71b561791861cec@epcas1p4.samsung.com>
 <CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com> <95d6e963-7f30-1d9c-99d7-0f6cc1589997@samsung.com>
In-Reply-To: <95d6e963-7f30-1d9c-99d7-0f6cc1589997@samsung.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 5 Jun 2019 07:16:51 -0700
Message-ID: <CAF6AEGtb1t4oRXCVvZq_cq1vZCJhgok-Ha+FXrruOOCq4APY_Q@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] of/device: add blacklist for iommu dma_ops
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
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
        Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 5, 2019 at 6:18 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Rob,
>
> On 2019-06-05 14:57, Rob Clark wrote:
> > On Tue, Jun 4, 2019 at 11:58 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >> But first of all, I remember Marek already submitted some patches long
> >> ago that extended struct driver with some flag that means that the
> >> driver doesn't want the IOMMU to be attached before probe. Why
> >> wouldn't that work? Sounds like a perfect opt-out solution.
> > Actually, yeah.. we should do that.  That is the simplest solution.
>
> Tomasz has very good memory. It took me a while to find that old patches:
>
> https://patchwork.kernel.org/patch/4677251/
> https://patchwork.kernel.org/patch/4677941/
> https://patchwork.kernel.org/patch/4677401/
>
> It looks that my idea was a bit ahead of its time ;)
>

if I re-spin this, was their a reason not to just use bitfields, ie:

-    bool suppress_bind_attrs;    /* disables bind/unbind via sysfs */
+    bool suppress_bind_attrs : 1;    /* disables bind/unbind via sysfs */
+    bool has_own_iommu_manager : 1;  /* driver explictly manages IOMMU */

That seems like it would have been a bit less churn and a bit nicer
looking (IMO at least)

BR,
-R
