Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F61312E05F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jan 2020 21:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727161AbgAAUOb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jan 2020 15:14:31 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:33131 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgAAUOb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jan 2020 15:14:31 -0500
Received: by mail-ed1-f66.google.com with SMTP id r21so37583625edq.0;
        Wed, 01 Jan 2020 12:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dA7p3SwLAkRQTTiidDN3D+F+xkhlU3b/35cKZOnXouk=;
        b=nTOYZsyvitbb3ruPWXF0wLFs8CKRD1vCOR3PKmN/ci3dkmraINCkHqEAwb4S40jSLp
         gDNtrgzTvV8gQcHKUaAEKUXXEQWOpfK69wDRTAX9tabBRgSetlS9GM7C1fbj1Cw2nWL6
         +wxjVznDjsOiLH0YQJdC3g43LX++D3Ujm98wusNoV56LuVFDQT3ptnOJQ50Zdx06R9eY
         huU0W+FMFxuND/j7WoBA25bL+NzPjmLq0MaqIzWAuZXhDN8tLCtcwCnkkjwpogc1EF4V
         LDulo106EM202PSDj2y1mbMlDi7oSypIhPM1ip1f+/W0PnAAdsK2wfDSGPbeqhGtt18A
         S4/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dA7p3SwLAkRQTTiidDN3D+F+xkhlU3b/35cKZOnXouk=;
        b=eupe7eE87co6lGyIcb1ezSG/EC79ZShfLi+/AktCmccIprsXos7bW8gq7OuDDxtv1V
         agjZADQfJ//C4Cc76ovHRYopHmzQhWa/x343/BHMrsdEcaUFIkTLBpjMFK2q6gVF8TRU
         xZUrgu0jt1kvLjcpsxdBkSICrXZcJbhxLKCYTz0HJeclCwiJw1Y937jb/bUJHsiIvAFf
         PO6yj6haNEwTf7dnaHiizaUSc9jOyZxJQLJUx0el2S35wNWz0CY97cDvnBq1P36Yc06Q
         0BJO9bj7h3TcxJ6/TWoUJbpSXUf95Nsyejf9br70ubh3GTJkpML+aLIR7D43chr/oAmO
         CKsw==
X-Gm-Message-State: APjAAAUZzw1uFlKIWEITNb541eRAkK3yL+ufOP3nruypih9pfa6+JTST
        pjv+0Qto6RGpWhry/2wz/FMBrkfKMWgW23jLRwY=
X-Google-Smtp-Source: APXvYqxx6j+Fwe2pFiHwqo/nbBhfSu4TpJZOhN6fBWYrBSf5GHXdmSjH1PkmpZLHyryVqF0d85TTcNsY3PJjne6fEHI=
X-Received: by 2002:a17:906:34d7:: with SMTP id h23mr6207833ejb.90.1577909669737;
 Wed, 01 Jan 2020 12:14:29 -0800 (PST)
MIME-Version: 1.0
References: <20200101033704.32264-1-masneyb@onstation.org> <20200101111521.GA67534@gerhold.net>
In-Reply-To: <20200101111521.GA67534@gerhold.net>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 1 Jan 2020 12:14:35 -0800
Message-ID: <CAF6AEGu=G4x3Kpzm=0x-Mj_VOrkvTGq1WcFr8QNAn6APjevHjA@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: add 32 bit iommu page table support
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Brian Masney <masneyb@onstation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 1, 2020 at 3:16 AM Stephan Gerhold <stephan@gerhold.net> wrote:
>
> On Tue, Dec 31, 2019 at 10:37:04PM -0500, Brian Masney wrote:
> > Add 32 bit implmentations of the functions
> > __qcom_scm_iommu_secure_ptbl_size() and
> > __qcom_scm_iommu_secure_ptbl_init() that are required by the qcom_iommu
> > driver.
> >
> > Signed-off-by: Brian Masney <masneyb@onstation.org>
> > ---
> >  drivers/firmware/qcom_scm-32.c | 32 ++++++++++++++++++++++++++++++--
> >  1 file changed, 30 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
> > index 48e2ef794ea3..f149a85d36b0 100644
> > --- a/drivers/firmware/qcom_scm-32.c
> > +++ b/drivers/firmware/qcom_scm-32.c
> > @@ -638,13 +638,41 @@ int __qcom_scm_restore_sec_cfg(struct device *dev, u32 device_id,
> >  int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
> >                                     size_t *size)
> >  {
> > -     return -ENODEV;
> > +     int psize[2] = { 0, 0 };
>
> I would use an explicit size (i.e. __le32) here.
>
> > +     int ret;
> > +
> > +     ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> > +                         QCOM_SCM_IOMMU_SECURE_PTBL_SIZE,
> > +                         &spare, sizeof(spare), &psize, sizeof(psize));
> > +     if (ret || psize[1])
> > +             return ret ? ret : -EINVAL;
> > +
> > +     *size = psize[0];
> > +
> > +     return 0;
> >  }
> >
> >  int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
> >                                     u32 spare)
> >  {
> > -     return -ENODEV;
> > +     struct msm_scm_ptbl_init {
> > +             __le32 paddr;
> > +             __le32 size;
> > +             __le32 spare;
> > +     } req;
> > +     int ret, scm_ret = 0;
> > +
> > +     req.paddr = addr;
> > +     req.size = size;
> > +     req.spare = spare;
>
> I'm not sure if there is actually anyone using qcom in BE mode (does
> that even work?), but all the other methods in this file explicitly
> convert using cpu_to_le32(), so this method should do the same :)

sboyd used to occasionally fix things related to qcom in BE back in
the day.. not sure if modern snapdragons still support BE.

(I'm willing to just pretend that they don't.. that lessens the chance
that someday someone gets far enough to try the GPU in BE mode, and
realizes they've wasted their time getting that far ;-))

BR,
-R

> > +
> > +     ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> > +                         QCOM_SCM_IOMMU_SECURE_PTBL_INIT,
> > +                         &req, sizeof(req), &scm_ret, sizeof(scm_ret));
> > +     if (ret || scm_ret)
> > +             return ret ? ret : -EINVAL;
> > +
> > +     return 0;
> >  }
> >
> >  int __qcom_scm_io_readl(struct device *dev, phys_addr_t addr,
> > --
> > 2.21.0
> >
