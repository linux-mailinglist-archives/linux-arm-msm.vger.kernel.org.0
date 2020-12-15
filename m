Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABC172DB082
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 16:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730467AbgLOPuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 10:50:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:40652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730417AbgLOPuI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 10:50:08 -0500
X-Gm-Message-State: AOAM533VzvEKppX5x2bg6rGkw/aPGGWnFKdnwkM6FCP3kZPBlUG/IryM
        g9pqRWC7GYUJdWUcPrKd8B0UM7ItKbqYFBJVHyA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608047367;
        bh=vk0DJ0JzWJlteCvdQrm7cTztN3kStbn7sC/CRkgubWQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=CtFESZdADvAexjzxRDg0+RJDwS1bEU4mFWyL6SfeZ+2DucZbqnwUsNNCTL0oc4Qab
         IqgBNcH7SzKOr0po7+b4Co03iExifNCD9cDg2BwBcBEtUDsaLGoky7j/WtlUYOzgkg
         NqX7/GJCaXouRC2WodvKWPN/csUU/rsQ1Fwg82O6AasTIdQHC+wM+bCN8xX1GPASKn
         GYIFblyDkCWPHK9niajlvfdRymaofA08J1nxCgngcoLV1DGwURIMCKz6tfXdJ9Ya8b
         X0Hgew74mexMLfR0YW7R9jfyPwHyLIIN2tXasljBDeHoeuU9VdBFxxA2diiQal6Hhx
         YsN06IKgUKPcA==
X-Google-Smtp-Source: ABdhPJyJGtLwNlqBu0sFHqFIYVIxOoGixNWC7BzEOUK+bNoXIyTS4GJ1xdGFVspEYarTce2m30IYXyONWmLH5MOMFZU=
X-Received: by 2002:a9d:be1:: with SMTP id 88mr23804391oth.210.1608047366643;
 Tue, 15 Dec 2020 07:49:26 -0800 (PST)
MIME-Version: 1.0
References: <20201016090833.1892-1-thunder.leizhen@huawei.com>
 <20201016090833.1892-2-thunder.leizhen@huawei.com> <20201128045328.2411772-1-f.fainelli@gmail.com>
 <CAK8P3a1_5RgcPz+bgo1bbUBk8NTJd=1-Y5-=CsQYkFgLfTE3_A@mail.gmail.com>
 <9c6c6b7e-8c39-8c49-5c87-9b560c027841@broadcom.com> <CAK8P3a2XYk8D80XARrpUSBHk1yye3KHXOdaQge4HNSZZOC=xKw@mail.gmail.com>
 <CACvutz9v+TBUbrCo3X-u5ebbs04nR0y0yQN3qWfSAyZVy9RM2g@mail.gmail.com> <c38cf11a-ed1d-d150-52fb-e3b4a0a30712@gmail.com>
In-Reply-To: <c38cf11a-ed1d-d150-52fb-e3b4a0a30712@gmail.com>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Tue, 15 Dec 2020 16:49:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1TViQopQNFE4+Dtac0v2CneGiy22WYu5BuYv8HX2r8Lg@mail.gmail.com>
Message-ID: <CAK8P3a1TViQopQNFE4+Dtac0v2CneGiy22WYu5BuYv8HX2r8Lg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: broadcom: clear the warnings caused by
 empty dma-ranges
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Bharat Gooty <bharat.gooty@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Scott Branden <sbranden@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Dec 15, 2020 at 4:41 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
> On 12/15/2020 5:19 AM, Bharat Gooty wrote:
> > Since the IOMMU is disabled and DMA engine is on 32-bit bus, We can not
> > give the complete DDR for the USB DMA.
> > So restricting the usable DAM size to 4GB.
>
> Thanks, can you make this a proper patch submission along with a Fixes:
> tag that is:
>
> Fixes: 2013a4b684b6 ("arm64: dts: broadcom: clear the warnings caused by
> empty dma-ranges")

Yes, that would be helpful, though I would appreciate a better description
that explains what is actually going on: is it the device or the bus that
has the 32-bit limitation, and if it is indeed a bug in the device, why do
you pretend that this is a 64-bit device on a 32-bit bus instead (this
could also use a comment in the dts file)?

       Arnd
