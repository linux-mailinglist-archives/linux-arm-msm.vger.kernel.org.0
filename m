Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97904130659
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jan 2020 07:57:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726029AbgAEG5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Jan 2020 01:57:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:36718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725785AbgAEG5B (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Jan 2020 01:57:01 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A1292207FD;
        Sun,  5 Jan 2020 06:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578207420;
        bh=jPcU/Bcq9WdEzhf/t7zr0YO26CiHBAfIo7kaL16gGe4=;
        h=In-Reply-To:References:Cc:Subject:To:From:Date:From;
        b=oS6hjrDTCFiVmjbbM87CCOuCyieEZwWwTvtJsRVqlY+Cl5T97yH3OEC2cVp/KiOwI
         c8umeEu7wkDUqO87Ql0p+S/vGk4wa8Ydpxcb8RhS/ZWwYgt/jZTnTPs5o43u4Ka4M5
         bc61eUoCdek/JM1xG5UCOuD0iw7ath030hUw3dSU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGu=G4x3Kpzm=0x-Mj_VOrkvTGq1WcFr8QNAn6APjevHjA@mail.gmail.com>
References: <20200101033704.32264-1-masneyb@onstation.org> <20200101111521.GA67534@gerhold.net> <CAF6AEGu=G4x3Kpzm=0x-Mj_VOrkvTGq1WcFr8QNAn6APjevHjA@mail.gmail.com>
Cc:     Brian Masney <masneyb@onstation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: qcom: scm: add 32 bit iommu page table support
To:     Rob Clark <robdclark@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Sat, 04 Jan 2020 22:56:59 -0800
Message-Id: <20200105065700.A1292207FD@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2020-01-01 12:14:35)
> On Wed, Jan 1, 2020 at 3:16 AM Stephan Gerhold <stephan@gerhold.net> wrot=
e:
> >
> > On Tue, Dec 31, 2019 at 10:37:04PM -0500, Brian Masney wrote:
> > > Add 32 bit implmentations of the functions
> > > __qcom_scm_iommu_secure_ptbl_size() and
> > > __qcom_scm_iommu_secure_ptbl_init() that are required by the qcom_iom=
mu
> > > driver.
> > >
> > > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > > ---
> > >  drivers/firmware/qcom_scm-32.c | 32 ++++++++++++++++++++++++++++++--
> > >  1 file changed, 30 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_s=
cm-32.c
> > > index 48e2ef794ea3..f149a85d36b0 100644
> > > --- a/drivers/firmware/qcom_scm-32.c
> > > +++ b/drivers/firmware/qcom_scm-32.c
> > > @@ -638,13 +638,41 @@ int __qcom_scm_restore_sec_cfg(struct device *d=
ev, u32 device_id,
> > >  int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
> > >                                     size_t *size)
> > >  {
> > > -     return -ENODEV;
> > > +     int psize[2] =3D { 0, 0 };
> >
> > I would use an explicit size (i.e. __le32) here.
> >
> > > +     int ret;
> > > +
> > > +     ret =3D qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> > > +                         QCOM_SCM_IOMMU_SECURE_PTBL_SIZE,
> > > +                         &spare, sizeof(spare), &psize, sizeof(psize=
));
> > > +     if (ret || psize[1])
> > > +             return ret ? ret : -EINVAL;
> > > +
> > > +     *size =3D psize[0];
> > > +
> > > +     return 0;
> > >  }
> > >
> > >  int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, =
u32 size,
> > >                                     u32 spare)
> > >  {
> > > -     return -ENODEV;
> > > +     struct msm_scm_ptbl_init {
> > > +             __le32 paddr;
> > > +             __le32 size;
> > > +             __le32 spare;
> > > +     } req;
> > > +     int ret, scm_ret =3D 0;
> > > +
> > > +     req.paddr =3D addr;
> > > +     req.size =3D size;
> > > +     req.spare =3D spare;
> >
> > I'm not sure if there is actually anyone using qcom in BE mode (does
> > that even work?), but all the other methods in this file explicitly
> > convert using cpu_to_le32(), so this method should do the same :)
>=20
> sboyd used to occasionally fix things related to qcom in BE back in
> the day.. not sure if modern snapdragons still support BE.
>=20
> (I'm willing to just pretend that they don't.. that lessens the chance
> that someday someone gets far enough to try the GPU in BE mode, and
> realizes they've wasted their time getting that far ;-))
>=20

Yeah it used to work many ages ago, but I don't think anyone besides me
tested it, except maybe for the folks working in QCA back then.

