Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0844B24381A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 11:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHMJ6d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 05:58:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:35862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbgHMJ6d (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 05:58:33 -0400
Received: from coco.lan (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8385206A4;
        Thu, 13 Aug 2020 09:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597312712;
        bh=9RgQzuhqlRmtPEcH71/uI/W3vda4Hj2yojosYlaMzQc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XfTzQarbNsyDPeTzjsFu2xl1etxDXCqda8LvDEXpdjegidj0Xgsr2kj27WVGm6slM
         o8qXDSNIz8t27fK7IrRxoLEY5xrWvi+vTNigaxxqamJKt4vRAGMO9Ag7XojLkptG8B
         OIGlea/1wskhl5ANMK5MBT5wraJ2/dxIfgFnj16o=
Date:   Thu, 13 Aug 2020 11:58:23 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linuxarm@huawei.com, mauro.chehab@huawei.com,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wei Xu <xuwei5@hisilicon.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devel@driverdev.osuosl.org,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 00/44] SPMI patches needed by Hikey 970
Message-ID: <20200813115823.70f9016a@coco.lan>
In-Reply-To: <20200813075827.GH4354@dell>
References: <cover.1597247164.git.mchehab+huawei@kernel.org>
        <20200813075827.GH4354@dell>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Lee,

Em Thu, 13 Aug 2020 08:58:27 +0100
Lee Jones <lee.jones@linaro.org> escreveu:

> On Wed, 12 Aug 2020, Mauro Carvalho Chehab wrote:
>=20
> > Hi Greg,
> >=20
> > This patch series is part of a work I'm doing in order to be able to su=
pport
> > a HiKey 970 board that I recently got on my hands.
> >=20
> > I received some freedback from Mark and from Jonathan on a first
> > attempt I made to upstream this.
> >=20
> > I'm opting to submit it via staging, because I had to start from the
> > patch that originally added this driver on a 4.9 Kernel tree:
> >=20
> > 	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9
> >=20
> > In order to preserve the original SOB from the driver's author.
> >=20
> > The patches following it are on the standard way: one patch per
> > logical change.
> >=20
> > This is part of a bigger work whose goal is to have upstream support
> > for USB and DRM/KMS on such boards.=20
> >=20
> > I suspect that, maybe except for the DT part, those 3 specific drivers
> > are more or less ready to be moved from staging, but the other
> > drivers that are also part of this attempt aren't ready. Specially the
> > DRM driver has some bugs that came from the OOT version.
> >=20
> > So, my current plan is to submit those drivers to staging for 5.9
> > and move the ones that are ok out of staging on Kernel 5.10. =20
>=20
> What a mess.  This is no way to upstream a new driver.
>=20
> Firstly, could you please add versioning to your submissions.  I know
> this at least version 2.  Were there previous submissions?  Is this
> the latest?

Yeah, that's the second attempt. The first one was:

	https://lore.kernel.org/lkml/176043f329dfa9889f014feec04e7e1553077873.1597=
160086.git.mchehab+huawei@kernel.org/T/#u

I was in doubt about adding a v2 in this specific case or not,=20
since I ended submitting it to the staging tree.

> Secondly and more importantly, you have submitted what looks like a
> new driver (bearing in mind that I'm only concerning myself with the
> MFD related changes), then in the same submission you are adding and
> removing large chunks.  Please just submit the new driver, on its own
> as a single patch, complete with its associated Makefile and Kconfig
> changes.

I can't do like that because I'm not the author of the original patch that
added the driver.

The original patch came from the 96board's android-kernel based 4.9 tree:

	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9

> What are your reasons for submitting this via Staging?=20

The main reason is to preserve both the patch authorship and its
history.

After the original patch, I wrote several incremental changes cleaning
up the original driver and stripping parts of it that aren't needed.

By preserving the history, if someone wants to restore some removed
functionality, it is just a matter of reverting a patch.

For example, the original driver had its own sysfs interface for
debugging the regulator driver.=20

This is not needed for it to work. Also, the right interface for such=20
things is via configfs. Yet, someone could think on restoring such=20
feat and start from the existing code, instead of coming with=20
something else from scratch.

> Is it not ready yet?=20

=46rom my side, I believe that, after my changes, the code now meets
upstream requirements, maybe except for DT (and the parsing code).
There are a few things at the DT properties on this driver that could=20
be named on a different (more standard way).=20

Yet, I'm not a regular contributor for mfd/regulator/spmi. So,
I may have missed something.

> Are the resultant components not at a high enough level of
> quality or enablement to go straight into the subsystems, which is
> more typical?  From an MFD perspective, I would be reviewing the
> driver as a whole when (if) it moves from Staging into MFD anyway, so
> why are you jumping through hoops with this additional, seemingly
> superfluous step?

I'm OK if this gets reviewed by MFD people only after moving it out of
staging. Assuming that this would be merged for Kernel 5.10, I'll
likely send a patch moving it out of staging for 5.11. Then,
you can do a comprehensive review.

> Finally, the subject of authorship is often a contentious one, but
> this is a problem you need to work out with the original author, not
> something that should require special handing by upstream.  You have a
> couple of choices, but bear in mind that upstreaming a non-suitable
> driver then bringing it up to standard is not one of them.
>=20
> 1. Keep the original author's authorship and SoB, make your changes
>    and get them to review to ensure they are still happy about being
>    associated with the resultant code.  Ensure you mention all of the
>    changes you make in the commit message and follow-up by adding your
>    own SoB.
>=20
> 2. This is the contentious bit.  If you've made enough changes, there
>    is an argument for you to adopt authorship.  You should discuss
>    with the original author whether they are happy for you to retain
>    their SoB.  My suggestion is always try to keep the SoB as a bare
>    minimum to preserve patch history and out of pure courtesy.

It is not only the above. Both the original author and anyone
touching the code should comply with applicable internal policies.

=46rom my experience, dealing with such things takes a lot more of time
then coding, as it require talking with legal departments on different
continents, and with developers and with their bosses in order to be
able to do things like that.=20

This can also be a very frustrating process. During almost 20 years of
being the media maintainer, I've seen several cases where trying to
enforce a folded initial patch caused devs to receive NACKS, preventing=20
them so submit otherwise good stuff.

So, at the media subsystem, I'm perfectly fine if someone starts from=20
the original OOT driver, preserving its original authorships. We're
also dealing there with the patches sent to drivers/staging/media.

I'm not saying that other subsystem maintainers should do the same.
Dealing with staging is time consuming, and I completely understand
that most maintainers prefer to stay out of it ;-)

-=20

Since when staging tree started, if someone has to start from the
original patch, such things can be merged at staging. Then,
incremental patches are applied at the top until it reaches what's
required to be promoted.

That's said, there's no hush to have those drivers out of staging.
My end goal is to have DRM/KMS and USB support for Hikey 970.=20

The patchsets I have so far are at:

	https://github.com/mchehab/linux/commits/hikey970/to_upstream-2.0-v1.1

(this branch has the v1 of my patchset)

Porting this driver is part of such effort. While this driver is
on a good situation, the other ones may require some time to
mature.

The DRM/KMS driver for example, is not ready to be merged outside=20
staging, as it carries several bugs that came from the original
driver and are present at the official tree at 96boards. For example,
there is a a very dirty hack that enforces the HDMI chipset to
only work with a limited set of resolutions that are known to work:

	https://github.com/96boards-hikey/linux/blob/hikey970-v4.9/drivers/gpu/drm=
/hisilicon/kirin9xx/hdmi/adv7535.c#L869

It also has problems reading the frequencies via EDID interface.
Due to that, the driver fakes an EDID table:

	https://github.com/96boards-hikey/linux/blob/hikey970-v4.9/drivers/gpu/drm=
/hisilicon/kirin9xx/hdmi/adv7535.c#L463

It sounds to me that some clocks are not properly set for a random
resolution, but fixing it is not trivial and requires deep knowledge
about how the display registers should be tuned to better support
resolutions. The current settings cause underflows with 1080p,
which in turn makes the display driver to (silently) stop working.

So, in summary, I believe that some drivers from my port will
require being at staging for a while. While I was planning to
do that on my next patch submission, placing the PM drivers
there won't make much difference from my side, as I'll need to
be submitting patches anyway moving drivers out of staging as
they become ready.

Thanks,
Mauro
