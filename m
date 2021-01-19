Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5C22FBD78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 18:25:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729132AbhASRXX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 12:23:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390882AbhASRRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 12:17:30 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D7BFC061574;
        Tue, 19 Jan 2021 09:17:15 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id u14so446133wmq.4;
        Tue, 19 Jan 2021 09:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jDfcg2jk9678vyfqCi9ZzgnTVl/KKx8sZFeEAsCjw7o=;
        b=n6mHkIO//wutRmgNX4lr/ciwWVZy+6JuZYKJ54L0qY7sVfHWbm36v11++Ad5anXmFD
         3oNOk7JyYktLq/I28e2Fxd5Z0H6/ZVgYMdN0+bT660khO0u7FohlpvyK+5t3deGPvj4A
         GBcUDzfshD8u1jZchiNHxqb+EhBym+eqhwBY9UwAcwIJD6bjAqwkQyYD37/gZtxOcpfa
         JLC1vYhK8c2sO7hYFVqg/F0lq4jGl8c8AtCJ3V9h7qP2LyjrM4BLbDbBTvpeq/ze39Le
         4JWZUuPvxbbOo7+oFAp69YBVUWOOJaG7ttadmG5Qjy1U8UH57rxea3WAUVEvqqxfgmto
         jnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jDfcg2jk9678vyfqCi9ZzgnTVl/KKx8sZFeEAsCjw7o=;
        b=sCNjc0igFe0/sZJ7VzC4gkmOvw/+sxCRU6Tp58fj7a+h3N+Zb6u5bXb2GSyT57rm75
         ivqY6N5fHFnaw/X+VrNwV7mJtfalBy1jjFB9xaZ3xSu0bCYAbKX0b8o417JlfRJ8SggC
         IgaDfHy+rsaZGllPqdF1Gzjux2g70rTgKJ3gUc5JVcuRkZJ83ax94ur0jGGbmdSEVyS8
         yuf8wnbSI3m5Jvm93BpRMpi3aqDTipLDOebqvQpCxjl8y7y5v9t5XG8igKeFUx8s4tVu
         HwK5ulKyE/VwcRyrWaaedPzUwxad5164zZ9wuxeC2DXb2TO/YJPGybGGpJXuOfQ8XOBI
         Lm2A==
X-Gm-Message-State: AOAM533gfRsn7E26n032MmzChMPtt7buci5tE/hYlxbtHaBZizNCbYsf
        kr5kyEOSeNiQGeEbcXKnId3eDBZDPNgU0loVS9I=
X-Google-Smtp-Source: ABdhPJz4KcPi8xUUZdVpgsj5Q5Kzuwx0SeRT9GeZatHgWdKcTyuECS3DhM1wGV42sCO5C+PU0ZdZZ/DHYtuXPLe38ks=
X-Received: by 2002:a1c:1b51:: with SMTP id b78mr580821wmb.123.1611076634087;
 Tue, 19 Jan 2021 09:17:14 -0800 (PST)
MIME-Version: 1.0
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-6-git-send-email-isaacm@codeaurora.org> <CAF6AEGunsv5r_DmNsMbYwa4KQxRmK9J+5Bd12LYG4pQ=hrCe4Q@mail.gmail.com>
 <20210118213909.GA17971@willie-the-truck>
In-Reply-To: <20210118213909.GA17971@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 19 Jan 2021 09:19:38 -0800
Message-ID: <CAF6AEGutrOnL6dG41ddK37w_RgyV1HHJE_Hyw1t3DAdMtJZfrQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/msm: Add dependency on io-pgtable-arm format module
To:     Will Deacon <will@kernel.org>
Cc:     "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        pdaly@codeaurora.org,
        Android Kernel Team <kernel-team@android.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 18, 2021 at 1:39 PM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jan 18, 2021 at 01:16:03PM -0800, Rob Clark wrote:
> > On Mon, Dec 21, 2020 at 4:44 PM Isaac J. Manjarres
> > <isaacm@codeaurora.org> wrote:
> > >
> > > The MSM DRM driver depends on the availability of the ARM LPAE io-pgtable
> > > format code to work properly. In preparation for having the io-pgtable
> > > formats as modules, add a "pre" dependency with MODULE_SOFTDEP() to
> > > ensure that the io-pgtable-arm format module is loaded before loading
> > > the MSM DRM driver module.
> > >
> > > Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
> >
> > Thanks, I've queued this up locally
>
> I don't plan to make the io-pgtable code modular, so please drop this patch.
>
> https://lore.kernel.org/r/20210106123428.GA1798@willie-the-truck

Ok, done. Thanks

BR,
-R
