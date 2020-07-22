Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B236229AB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 16:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732773AbgGVOyF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 10:54:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732657AbgGVOyF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 10:54:05 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F333AC0619DC;
        Wed, 22 Jul 2020 07:54:04 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id q74so2869294iod.1;
        Wed, 22 Jul 2020 07:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OADXM0KWhLmqJmz0AqH4iopPYtJqKSmc3a8uf13KWHw=;
        b=dkHfU4piZQZLLU82ppQk6hVZ1uOkXtvbi59PgVcl8jb6Ejh+q9DW36WOjv28VKkqY9
         pD6KJOdK9g5wr8Bf8nxLY5Mv8LL5satch+ApNwHniPPNkwfeG3WTJ9Cg1s2lACEqzEYK
         4YMv2auliqhoEadsIVDN36WHfUvPaVt1VIN1RK9cHiXEV3xbkckBqLV1AipyasoMJ47M
         m8DAovJAtklZO+LJrBfwL8/ANB/XQk6RTKqhxcHnhQHFPFWH+ktkkb0QIPsxPDrVNNxr
         xeexIWsb18SKDnS1HT1OPjjkOPoLXPLxdpblesyzzU+SUu2SaBsO3D0mZv4M9WZEFtkk
         S7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OADXM0KWhLmqJmz0AqH4iopPYtJqKSmc3a8uf13KWHw=;
        b=BaZ0s1DeJrAa4dbYOZ2VnkRaFuBGz+7zeuYFe89uBtncVaRNbI/gQ7cR0g7DclGk7P
         iODEmItPqOXs9rkdT6frRF3uKAbKrndbHUG7JZe1oltXA5ySDZt/JhXB9QAuiMGpnnpq
         X+Nt11VRG/ilu80sL4kjglQSW9gfqlnxyxbd0NDCqrsDLsrC3mPDzi8U0VFK04BCslPZ
         NwyMHP/WGtqaybkQaTqpnCkQejLtT855dHdJHVDoLL6mpRXkdpmAT+p2r3+kJjOrEogI
         KS8T1hYFzhwEjHZ4O13XSLIgsv8swzEkBzXwAJ9hLjHG3tdxodJGOj3tJDF7Qpfc+US+
         QW4g==
X-Gm-Message-State: AOAM533OaEsz5Eg9qL1er1rCt3jKgB6IK3a+1Xx4vjdlGgj8GXqWLOgH
        wXBYL/sjKmcSj4NqT+mqFsirhfx81OnTjdHj9Ux882A7pv0=
X-Google-Smtp-Source: ABdhPJzQJaAbYewU9MA/Ib3Rq2MJiG21mch8BEVHivLJt9xht7ckNEsFHmwyL3Ftc7Y59rl2ChMAE0kzTIm12ZPM8xc=
X-Received: by 2002:a6b:c9c4:: with SMTP id z187mr141353iof.27.1595429644293;
 Wed, 22 Jul 2020 07:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200720155217.274994-1-robdclark@gmail.com> <CA+G9fYtj1RBYcPhXZRm-qm5ygtdLj1jD8vFZSqQvwi_DNJLBwQ@mail.gmail.com>
 <20200722131009.GD27672@8bytes.org>
In-Reply-To: <20200722131009.GD27672@8bytes.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 22 Jul 2020 07:54:40 -0700
Message-ID: <CAF6AEGteY6Mwy+jQaj6Vo0e4bMW6P1q19PMmdOqQrxr-RQxkQg@mail.gmail.com>
Subject: Re: [PATCH] iommu/qcom: Use domain rather than dev as tlb cookie
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        open list <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 22, 2020 at 6:10 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Tue, Jul 21, 2020 at 12:45:17AM +0530, Naresh Kamboju wrote:
> > On Mon, 20 Jul 2020 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > The device may be torn down, but the domain should still be valid.  Lets
> > > use that as the tlb flush ops cookie.
> > >
> > > Fixes a problem reported in [1]
> >
> > This proposed fix patch applied on top of linux mainline master
> > and boot test PASS on db410c.
> >
> > The reported problem got fixed.
>
> Is this needed for v5.8/stable? A fixes tag would be great too.

looks like, yes:

Fixes: 09b5dfff9ad6 ("iommu/qcom: Use accessor functions for iommu
private data")

BR,
-R

>
> Regards,
>
>         Joerg
