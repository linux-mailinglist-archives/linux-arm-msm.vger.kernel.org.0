Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E714C3A292D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 12:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230201AbhFJKS6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 06:18:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:52274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230196AbhFJKS5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 06:18:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7A3FC613E9;
        Thu, 10 Jun 2021 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623320221;
        bh=/aIpC1FstLWlWF3NH/yW0VxMrUiuut5VKmUgwVjhzR0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=f/A9rQWZjmkoFvw0ujjfWmUTL1JsUCNyZBpri4OZZ0OCLekSjPKrmz7fKXjaRTuam
         ogNn1CSik6El9Q/hE1c7kPIaC0++RQ+jzHXzVKw5JSj4RfJ/HskHE6OnQRoD8XjTki
         mK9ZgDP3aWGhpcWFL7AGzH7aL46PafsBqX/qFx+pR2f87BmiWMnkB04MzogKobToak
         pnxVbuCaeRCXNCM11PFExXa2Iv50I8Ev1v/0xd5JLgar9upI/lyAI4V7Q+ZVpCetPX
         rr4QsrimLzjPToK21YpqtTiNNIkszm7iacugL84nIlnCJGUl4u3jHkkdiTSsD2x6UJ
         Nzm7+ZThUpvpA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
In-Reply-To: <YMHjctQsGttUJ1QJ@kroah.com>
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com> <87k0n9btnb.fsf@kernel.org>
 <YLo6W5sKaXvy51eW@kroah.com>
 <c2daab34-1b25-7ee3-e203-a414c1e486d5@codeaurora.org>
 <874ke62i0v.fsf@kernel.org> <YMHjctQsGttUJ1QJ@kroah.com>
Date:   Thu, 10 Jun 2021 13:16:51 +0300
Message-ID: <87mtry10to.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Greg KH <gregkh@linuxfoundation.org> writes:
> On Thu, Jun 10, 2021 at 12:20:00PM +0300, Felipe Balbi wrote:
>> > As mentioned above, these changes are currently present on end user
>> > devices for the past few years, so its been through a lot of testing :=
).
>>=20
>> all with the same gadget driver. Also, who uses USB on android devices
>> these days? Most of the data transfer goes via WiFi or Bluetooth, anyway
>> :-)
>
> I used to think that too, until I saw some of the new crazy designs
> where lots of SoC connections internally to the device run on USB.  Also
> look at the USB offload stuff as one example of how the voice sound path
> goes through the USB controller on the SoC on the latest Samsung Galaxy
> phones that are shipping now :(

yeah, that's one reason NOT to touch the FIFO sizes :-) OMAP5 has, as
mentioned before, processor trace offload via USB too. If we modify the
FIFO configuration set by the HW designer we risk loosing those features.

> There's also devices with the modem/network connection going over USB,
> along with other device types as well.  Android Auto is crazy with

yeah, and there will be more coming. USB Debug class is already
integrated in some SoCs, that gives us jtag-like access over USB.

> almost everything hooked up directly with a USB connection to the host
> system running Linux.

that's running against USB host, though, right? Android is the host, not
the gadget :-)

The FIFO sizes here are for the gadget side.

>> I guess only developers are using USB during development to flash dev
>> images heh.
>
> I wish, we are reaching the point where the stability of the overall
> Android system depends on how well the USB controller works.  We are a
> product of our success...
>
> thanks,
>
> greg k-h

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDB5pMRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjw2wf/crhEH0ndZUqRm7jaTsBxQg7pcZNB5IIa
B8VUxk/3eGa1Yi7EfiKnoHtxSUDMDKYnyT58C7OdrPZOX1I32NkDWqiLY64k+lSt
IZn5DcEPYg2m14IfJvz7MYgrWZy2Inz1XKB4iVJodQaVq7ayYa7OqhVrB3ScJ46s
TYsf+9UtXE53HFNNk/bR8LIUMFxGYn+jTyv3Y3YoOOqqHRyCgH11jI/XbWdEtpbb
7B7F70ZihlF1lxEuOyzmKdbp713+kFrnZTvqqt90PVfdGDLGCVip06ZoiGigpTZE
V9iEXnpTaXwcj8d4GXDuSdg9RLQCW/mNJr09zkbQ7a/6UtN62x1pVA==
=87B3
-----END PGP SIGNATURE-----
--=-=-=--
