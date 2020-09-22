Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D29E6273813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 03:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbgIVB0r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Sep 2020 21:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729475AbgIVB0q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Sep 2020 21:26:46 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632E7C061755;
        Mon, 21 Sep 2020 18:26:46 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w2so1663709wmi.1;
        Mon, 21 Sep 2020 18:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EwkCPgCitGetW6yWn1orUd/9JWGX18dm0dessM84fGA=;
        b=XJqhwKesgxxoneddVSf20VBkrrsT0ax+8jpxfLfjlaRV9BbhWHgdo7GG11Y0hdcJwU
         3zPmfiFaA0hrmsx/VmHuBH6Ql2NzM+URt5nSUMkkiuLcL+yrdIiYdvKB2ajmf3hzQuZy
         uegahPiyv/X3TGiIIlTydmIdHOWYse8gSIBk+fEaqQVdVidjFBwbfYJA6QnYuaSuBWup
         JpvEWpcxUgC02W/tdj+oOWlcaXFczT0OX2bkigrhVKXN+QfUuVy9fxUta4xEExaYZp/Y
         gTng2uocepGvbf8hwarfezAFrMTVTQoxd03ouptRLZQZy0aiVlx9HhRymXIaPEDFYVLj
         2nBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EwkCPgCitGetW6yWn1orUd/9JWGX18dm0dessM84fGA=;
        b=a/BaTUCk/D9o+ZEs1FttmizT4XqZtVzzPu1IYGEc0NHVbbuujQ+qEn55ardT4mF3Ki
         JNUB8krJ+IiTVLZ5zCOskvS9MOomn7Z6blT1d7NJRkuAMkDt8DbX+GqOuOGMDLyRQ3ql
         4TfkCHdFOcDyTuxOKr0rIjkcFP1Ac/hoEnRgyzE/WCxt4Gk/jPNsWson7+yv8JVlEgg/
         Pgt/rT9hRRmF9Tra3Ayt+T9J1ghnQvazCBWNAIjSrI6kSs58oGpDsvuIffIUX11qMCcu
         FaoeCdd3g+iT0OljSMXPUEqJ/ui9nBF3iZQGWGs81wZPacGwEI6VT8UfwU5hBVW9/p2n
         giKw==
X-Gm-Message-State: AOAM5329ZhSDnc6vJuOXOoM1Kf0dd0JUDaYeyEDdqQEf4t1dTqLpkXJT
        YOh+xkU6y0hAurhiu+8dRr7wh/Ik6kznLQI3bts=
X-Google-Smtp-Source: ABdhPJyX5IceDiEN7uurpddreCAjgBIWneUFzY3pSLOA9oYfNTQAt3JlP4q5FDqc7qs5jSI0oVWF6J0DVzpZ1VTocjE=
X-Received: by 2002:a7b:cf1a:: with SMTP id l26mr1800077wmg.164.1600738004991;
 Mon, 21 Sep 2020 18:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200905200454.240929-1-robdclark@gmail.com> <20200921213054.GA4270@willie-the-truck>
In-Reply-To: <20200921213054.GA4270@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 21 Sep 2020 18:27:45 -0700
Message-ID: <CAF6AEGsMsarDGqYYLtkZMKHxKZKBsfZsByWit=vEsAoKXqs6UQ@mail.gmail.com>
Subject: Re: [PATCH v17 00/20] iommu/arm-smmu + drm/msm: per-process GPU pgtables
To:     Will Deacon <will@kernel.org>
Cc:     "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Brian Masney <masneyb@onstation.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hanna Hawa <hannah@marvell.com>,
        Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Sep 21, 2020 at 2:31 PM Will Deacon <will@kernel.org> wrote:
>
> On Sat, Sep 05, 2020 at 01:04:06PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > NOTE: I have re-ordered the series, and propose that we could merge this
> >       series in the following order:
> >
> >        1) 01-11 - merge via drm / msm-next
> >        2) 12-15 - merge via iommu, no dependency on msm-next pull req
>
> Thanks, I've queued 12-15 in the smmu tree.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/updates
>

Thx, let me know if you are up for trying a post-rc1 pull req for
16-18 (plus Bjorn's series if it is reposted in time).. I can
certainly help rebase/wrangle patches if that helps.. otherwise we can
try for those next cycle

BR,
-R
