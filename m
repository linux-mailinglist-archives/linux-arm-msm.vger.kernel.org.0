Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921B93BED29
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 19:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhGGRhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 13:37:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbhGGRhR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 13:37:17 -0400
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3B0C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 10:34:36 -0700 (PDT)
Received: by mail-il1-x135.google.com with SMTP id i13so3671844ilu.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sD13z85XVgoLdSGSEXdyjIhfF8nDl4He7AW/wdIYAPE=;
        b=GMyUr6TlJ9VJExoTQpjFfBsLf6J01HTyZta3543eDwhlqbYEzWxs8GoDpUc1UsSTw4
         l1VVQLqIkdx353vwBODZcBzPc+/pWN2sN4WUmOL2Q2pzqXNGKMgaACFtiLtqRBNiBa9g
         MO2krDbX2BQp90Nsue1zk7vA6Wepr7RZf2O7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sD13z85XVgoLdSGSEXdyjIhfF8nDl4He7AW/wdIYAPE=;
        b=nzf9Bs6pBPCEbUFAXv0J6r1W4ojccZqFYVcMPhb4JvHISkiXPx/ZMPuOWHnahv0S2q
         VxMeslw/nDVoBJOfka+k/QHbiP1DlEd9zgOAiMAQjRM8S50oPcMX7g6U779Gyj49GT6E
         ZBuABL42ckJeT17FbYZptUvtoGpYBHrWFM/MB8e2QxTB15MKouvw3M8my4k520Pmp+S8
         VTrwOtSo2Ziw82hVDGZzDt/htPV4RKtyKUat9za6JT5YOlgf9TLaejDLwsH4/goHPJVA
         ZXwAB5ZVkOSpfDduDOY7HXebGjUUmESTV01DcKXm1yJNeVR+6Zl0l7fJC7JiMP0uCn29
         U2gw==
X-Gm-Message-State: AOAM533CxDUClDP1xSxktXGpVbITQxpjxsoG9HgBULbBjls0b2v5Hj+B
        uR2A+EXfem5R9KGEtd6c6AIF20GNrWui8KCxHHbTXw==
X-Google-Smtp-Source: ABdhPJxjcG9AfhjNI0K88JMDlGt/CX21XaqIJd0EGqm1e9KWBmc9XPZNa/mXbdXJb612yvG28vh3Q4PQfEPrvTUr3HA=
X-Received: by 2002:a92:6f0a:: with SMTP id k10mr18648951ilc.105.1625679275706;
 Wed, 07 Jul 2021 10:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com> <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
 <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com> <CALAqxLWDqQeD-eieHXtePuXpxN1s3=jCNJP2pJD-YswsLP-mJw@mail.gmail.com>
In-Reply-To: <CALAqxLWDqQeD-eieHXtePuXpxN1s3=jCNJP2pJD-YswsLP-mJw@mail.gmail.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Wed, 7 Jul 2021 10:38:38 -0700
Message-ID: <CAJs_Fx4n07yuksL+kmjyKRuqPnFuE1m5PmeqCsoF7Xah=kWxvA@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
To:     John Stultz <john.stultz@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 6, 2021 at 10:12 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Sun, Jul 4, 2021 at 11:16 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > I suspect you are getting a dpu fault, and need:
> >
> > https://lore.kernel.org/linux-arm-msm/CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com/
> >
> > I suppose Bjorn was expecting me to send that patch
>
> If it's helpful, I applied that and it got the db845c booting mainline
> again for me (along with some reverts for a separate ext4 shrinker
> crash).
> Tested-by: John Stultz <john.stultz@linaro.org>
>

Thanks, I'll send a patch shortly

BR,
-R
