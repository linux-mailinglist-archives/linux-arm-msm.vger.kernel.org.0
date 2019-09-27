Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13FEAC0B02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2019 20:26:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbfI0S0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Sep 2019 14:26:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:34548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726594AbfI0S0F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Sep 2019 14:26:05 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 79F3E217D7;
        Fri, 27 Sep 2019 18:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569608764;
        bh=x/UIYEQwL6SSBf/v1qfn+5Y2erbWQyc0RtTT8mI06Ic=;
        h=In-Reply-To:References:Cc:To:From:Subject:Date:From;
        b=M/IfmBf0RVUEtwWgaRQz7fvVevhqk/ue6ba5RxUQgucoHSoo1h+jGW87kpHNQVn75
         UTXcrAKUxEXlPMjFmgzENG6lAmsQ8TNSOv0uu70/h9w2kwmaxcatYBG/qkYQOO0ZjW
         MK7Xu+pBUTztPqE0fMHLkefNV+oct916eBmSDZ7I=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAMuHMdWqCQD+3dzn8orUjDcXn123VujNgPQz20hLOF3=F2BP5w@mail.gmail.com>
References: <20190920145543.1732316-1-arnd@arndb.de> <20190920164545.68FFB20717@mail.kernel.org> <CAK8P3a2j6QG19i3YtRPh7qD4Zr5TiHmK_5=s9mSD2pHVmE99HA@mail.gmail.com> <20190920210622.51382205F4@mail.kernel.org> <CAMuHMdWqCQD+3dzn8orUjDcXn123VujNgPQz20hLOF3=F2BP5w@mail.gmail.com>
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
To:     Geert Uytterhoeven <geert@linux-m68k.org>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] mbox: qcom: avoid unused-variable warning
User-Agent: alot/0.8.1
Date:   Fri, 27 Sep 2019 11:26:03 -0700
Message-Id: <20190927182604.79F3E217D7@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Geert Uytterhoeven (2019-09-26 06:07:13)
> Hi Stephen,
>=20
> On Fri, Sep 20, 2019 at 11:06 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > Quoting Arnd Bergmann (2019-09-20 12:27:50)
> > > On Fri, Sep 20, 2019 at 6:45 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > > > @@ -54,11 +60,6 @@ static int qcom_apcs_ipc_probe(struct platform=
_device *pdev)
> > > > >         void __iomem *base;
> > > > >         unsigned long i;
> > > > >         int ret;
> > > > > -       const struct of_device_id apcs_clk_match_table[] =3D {
> > > >
> > > > Does marking it static here work too? It would be nice to limit the
> > > > scope of this variable to this function instead of making it a glob=
al.
> > > > Also, it might be slightly smaller code size if that works.
> > >
> > > No, I just tried and the warning returned.
>=20
> It's there for the convenience for the user, so he doesn't have to add it
> himself explicitly.
>=20
> > ("of/device: Nullify match table in of_match_device() for CONFIG_OF=3Dn=
"),
> > but it's been 5 years! Surely we can revert this change now that commit
> > 219a7bc577e6 ("spi: rspi: Use of_device_get_match_data() helper") is
> > merged.
>=20
> Right, the particular error case in the RSPI driver can no longer happen.
>=20
> Calling of_device_get_match_data() is the better solution anyway, as
> that uses the match table stored in dev->driver->of_match_table, so
> there's no need to pass the table explicitly, and conditionally.
>=20
> Hence...
>=20
> > --- a/drivers/leds/leds-pca9532.c
> > +++ b/drivers/leds/leds-pca9532.c
> > @@ -472,7 +472,7 @@ pca9532_of_populate_pdata(struct device *dev, struc=
t device_node *np)
> >         int i =3D 0;
> >         const char *state;
> >
> > -       match =3D of_match_device(of_pca9532_leds_match, dev);
> > +       match =3D of_match_device(of_match_ptr(of_pca9532_leds_match), =
dev);
> >         if (!match)
> >                 return ERR_PTR(-ENODEV);
>=20
> Please convert to of_device_get_match_data() instead of adding
> of_match_ptr() invocations...

How is this workable? I left it as of_match_device() because the value
returned may be 0 for the enum and that looks the same as NULL.

>=20
> > @@ -525,7 +525,7 @@ static int pca9532_probe(struct i2c_client *client,
> >                         dev_err(&client->dev, "no platform data\n");
> >                         return -EINVAL;
> >                 }
> > -               of_id =3D of_match_device(of_pca9532_leds_match,
> > +               of_id =3D of_match_device(of_match_ptr(of_pca9532_leds_=
match),
>=20
> Likewise.
>=20
> > --- a/sound/soc/jz4740/jz4740-i2s.c
> > +++ b/sound/soc/jz4740/jz4740-i2s.c
> > @@ -503,7 +503,7 @@ static int jz4740_i2s_dev_probe(struct platform_dev=
ice *pdev)
> >         if (!i2s)
> >                 return -ENOMEM;
> >
> > -       match =3D of_match_device(jz4740_of_matches, &pdev->dev);
> > +       match =3D of_match_device(of_match_ptr(jz4740_of_matches), &pde=
v->dev);
>=20
> Given of_device_get_match_data() returns NULL, not an error code, even
> this one could use of_device_get_match_data().
>=20
