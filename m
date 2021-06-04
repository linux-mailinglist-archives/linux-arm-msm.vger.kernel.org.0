Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AFC39BACD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 16:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhFDOUM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Jun 2021 10:20:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:40892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230122AbhFDOUM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Jun 2021 10:20:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAEC8611C1;
        Fri,  4 Jun 2021 14:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622816306;
        bh=IIapIA1KWkd10LMiSluOWzb9ezVWcMq76P0df/51EJI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=C83Lt6aPoYYFS1mWk1VGn/wrc+OfTmgIEPAqnh2qfT2oVa2PrUcahpcwjJ8uPLysj
         ASoPcp1raYr4Uwhgn+thxgAcYlqbM8ayc8wKFeG40snPKaEwYVde37SV+nHGgogSH5
         vEHfSwCPV6uvHyUh99yuEjEzLyGs6kOofoc5IAfZLsHX5RybR1jlYaw8i7Rv9snLlx
         t+MH1Ko4LrQgW907BwAO8sVDuJPWaRF8YMfxHBNnu9mfeYWbn+HpWuWSir+Laep29x
         3m9u2xL6PkZovdLxbXeSnBOxziyHwX9XUti6sBNRkiPin1K3JTbSp5lrgxbmqNvBu8
         fq1gb4ZEEt5Bg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Wesley Cheng <wcheng@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
In-Reply-To: <YLoUiO8tpRpmvcyU@kroah.com>
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com>
Date:   Fri, 04 Jun 2021 17:18:16 +0300
Message-ID: <87k0n9btnb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi,

Greg KH <gregkh@linuxfoundation.org> writes:
> On Wed, May 19, 2021 at 12:49:16AM -0700, Wesley Cheng wrote:
>> Changes in V9:
>>  - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3-qc=
om will
>>    add the property by default from the kernel.
>
> This patch series has one build failure and one warning added:
>
> drivers/usb/dwc3/gadget.c: In function =E2=80=98dwc3_gadget_calc_tx_fifo_=
size=E2=80=99:
> drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of =E2=80=
=98dwc3_mdwidth=E2=80=99 makes pointer from integer without a cast [-Wint-c=
onversion]
>   653 |         mdwidth =3D dwc3_mdwidth(dwc->hwparams.hwparams0);
>       |                                ~~~~~~~~~~~~~^~~~~~~~~~
>       |                                             |
>       |                                             u32 {aka unsigned int}
> In file included from drivers/usb/dwc3/debug.h:14,
>                  from drivers/usb/dwc3/gadget.c:25:
> drivers/usb/dwc3/core.h:1493:45: note: expected =E2=80=98struct dwc3 *=E2=
=80=99 but argument is of type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsigned=
 int=E2=80=99}
>  1493 | static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
>       |                                ~~~~~~~~~~~~~^~~
>
>
> drivers/usb/dwc3/dwc3-qcom.c: In function =E2=80=98dwc3_qcom_of_register_=
core=E2=80=99:
> drivers/usb/dwc3/dwc3-qcom.c:660:23: error: implicit declaration of funct=
ion =E2=80=98of_add_property=E2=80=99; did you mean =E2=80=98of_get_propert=
y=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>   660 |                 ret =3D of_add_property(dwc3_np, prop);
>       |                       ^~~~~~~~~~~~~~~
>       |                       of_get_property
>
>
> How did you test these?

to be honest, I don't think these should go in (apart from the build
failure) because it's likely to break instantiations of the core with
differing FIFO sizes. Some instantiations even have some endpoints with
dedicated functionality that requires the default FIFO size configured
during coreConsultant instantiation. I know of at OMAP5 and some Intel
implementations which have dedicated endpoints for processor tracing.

With OMAP5, these endpoints are configured at the top of the available
endpoints, which means that if a gadget driver gets loaded and takes
over most of the FIFO space because of this resizing, processor tracing
will have a hard time running. That being said, processor tracing isn't
supported in upstream at this moment.

I still think this may cause other places to break down. The promise the
databook makes is that increasing the FIFO size over 2x wMaxPacketSize
should bring little to no benefit, if we're not maintaining that, I
wonder if the problem is with some of the BUSCFG registers instead,
where we configure interconnect bursting and the like.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC6NigRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhNqQf/UCW+L+1PHl0Ok7a8lYNNq1k7hu8Du6Ag
qMT+Szz1a4oERmjWyUJr7xNc1dnv78QlCb9SuDx+c6guInJTCEEV0NjwEZbjlv+q
YQzg6S0kSz2Yrm6u0SylqAwGRyi3VmEmjX9aKUjxJCgblY+bGXHLrfXxFz67UGcv
c1jQGYVfP2iMMHrWthNfqFnDYA7btpGw/e1wQVn4l3JkldIzkCdtJqPzTpNoVjB4
Ze89LWaFodsy6PbMFsay3bpHQq9cjzeA7o/kSOuY4bIiLwgao2+Ob0PW3JSdl7oH
CVkXk3faTTz6QgBnO8sb77xHv282SqIbeaKdTPwtbyGUaqU/R3lWPg==
=KUe1
-----END PGP SIGNATURE-----
--=-=-=--
