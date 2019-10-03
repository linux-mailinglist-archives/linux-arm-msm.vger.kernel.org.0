Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5704ACB0E5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 23:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730799AbfJCVQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 17:16:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:52040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727789AbfJCVQC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 17:16:02 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56450207FF;
        Thu,  3 Oct 2019 21:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570137361;
        bh=nU5/9sxnZfCBjmZCuEDJn4v3UWczs4jazAfzPd+ufgE=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=iEZbEfYhRbioScGQHxtNaJUfDSnBLeXoJu9K5Ug5f5KMuU8fddOn7rupwb4RivbT1
         p3TQXt9loDxzuK2IFaWolKXn2zKe+1IiCkFbDn3O5MZbQxMcvVym/leYEVMbe0k0j/
         0RMwweWNr8U1cnQMIu1L0dxmFoOzOYac2FEcyKFw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdUW0UcPDJcw8A4imPfVc5ywbMGuORungaeSk9j0omAjfQ@mail.gmail.com>
References: <20190920145543.1732316-1-arnd@arndb.de> <20190920164545.68FFB20717@mail.kernel.org> <CAK8P3a2j6QG19i3YtRPh7qD4Zr5TiHmK_5=s9mSD2pHVmE99HA@mail.gmail.com> <20190920210622.51382205F4@mail.kernel.org> <CAMuHMdWqCQD+3dzn8orUjDcXn123VujNgPQz20hLOF3=F2BP5w@mail.gmail.com> <20190927182604.79F3E217D7@mail.kernel.org> <CAMuHMdUW0UcPDJcw8A4imPfVc5ywbMGuORungaeSk9j0omAjfQ@mail.gmail.com>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Gross <agross@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mbox: qcom: avoid unused-variable warning
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 14:16:00 -0700
Message-Id: <20191003211601.56450207FF@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Geert Uytterhoeven (2019-09-27 12:10:13)
> On Fri, Sep 27, 2019 at 8:26 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Geert Uytterhoeven (2019-09-26 06:07:13)
> > > On Fri, Sep 20, 2019 at 11:06 PM Stephen Boyd <sboyd@kernel.org> wrot=
e:
> > > > Quoting Arnd Bergmann (2019-09-20 12:27:50)
> > > > > On Fri, Sep 20, 2019 at 6:45 PM Stephen Boyd <sboyd@kernel.org> w=
rote:
> > >
> > > > --- a/drivers/leds/leds-pca9532.c
> > > > +++ b/drivers/leds/leds-pca9532.c
> > > > @@ -472,7 +472,7 @@ pca9532_of_populate_pdata(struct device *dev, s=
truct device_node *np)
> > > >         int i =3D 0;
> > > >         const char *state;
> > > >
> > > > -       match =3D of_match_device(of_pca9532_leds_match, dev);
> > > > +       match =3D of_match_device(of_match_ptr(of_pca9532_leds_matc=
h), dev);
> > > >         if (!match)
> > > >                 return ERR_PTR(-ENODEV);
> > >
> > > Please convert to of_device_get_match_data() instead of adding
> > > of_match_ptr() invocations...
> >
> > How is this workable? I left it as of_match_device() because the value
> > returned may be 0 for the enum and that looks the same as NULL.
>=20
> This function is used for the DT case only, so there will always be a mat=
ch.
> Hence you can do devid =3D (int)(uintptr_t)of_device_get_match_data(dev).
>=20

Ok. Let me send out a pile of patches.

