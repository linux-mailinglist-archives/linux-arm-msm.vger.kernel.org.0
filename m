Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C953B37142B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 May 2021 13:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbhECLV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 07:21:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:43812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230137AbhECLV1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 07:21:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3EE261221;
        Mon,  3 May 2021 11:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620040834;
        bh=ZUgVwxzi7a3MtB6NcAHEykBjZMzggIkMTLCY+qPK52g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=uKxt34HmYmBfq5vBMhBmz3d/CTySSKuJYU1S0hznPEUkhjS1YP/wt+dsyxrl+QgBd
         0Eowgk6D67u8gbziE5e40OMnDCKhkS6GL6sm047ezS5+y5m/QiIYw5wam0C3jzL/xV
         MTRgJgZ7EIIRb74BNEiBqvRvlIgJBNzSIDQA3yh1YPUrcEDFJGGB6yTgyEKbkMQa3a
         xiAgLmJ89+z6f3TB7XUlMkXMDpIlbUC5A6fmM8QugVrxGUuVbRMzwihu5TMZhuFZ/O
         upJe1zWfc2Xo54st/24h3oloPZFmniV6TD+cgO80wcNYilR0+EZK7pgIjxRris425t
         sMZu9UW8Lmq7g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 2/5] usb: dwc3: core: Host wake up support from
 system suspend
In-Reply-To: <184ddea9-643f-91ea-6d1f-5bdd26373e53@codeaurora.org>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-3-git-send-email-sanm@codeaurora.org>
 <87r1iuk9vs.fsf@kernel.org>
 <184ddea9-643f-91ea-6d1f-5bdd26373e53@codeaurora.org>
Date:   Mon, 03 May 2021 14:20:23 +0300
Message-ID: <87h7jkhxmw.fsf@kernel.org>
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

Sandeep Maheswaram <sanm@codeaurora.org> writes:
>> Sandeep Maheswaram <sanm@codeaurora.org> writes:
>>> Avoiding phy powerdown when wakeup capable devices are connected
>>> by checking phy_power_off flag.
>>> Phy should be on to wake up the device from suspend using wakeup capable
>>> devices such as keyboard and mouse.
>>>
>>> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
>>> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>>> ---
>>>   drivers/usb/dwc3/core.c | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>> index b6e53d8..bb414c3 100644
>>> --- a/drivers/usb/dwc3/core.c
>>> +++ b/drivers/usb/dwc3/core.c
>>> @@ -1738,7 +1738,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, =
pm_message_t msg)
>>>   		dwc3_core_exit(dwc);
>>>   		break;
>>>   	case DWC3_GCTL_PRTCAP_HOST:
>>> -		if (!PMSG_IS_AUTO(msg)) {
>>> +		if (!PMSG_IS_AUTO(msg) && dwc->phy_power_off) {
>> should be able to detect this generically, no? Shouldn't
>> device_may_wakeup() be valid here and give you the answer you want?
>
> I think=C2=A0 device_may_wakeup() gives whether the controller is wake up=
=20
> capable or not.

Yes, but it's a bit more than that. Looking at devices.rst we read:

If :c:func:`device_may_wakeup(dev)` returns ``true``, the device should be
prepared for generating hardware wakeup signals to trigger a system wakeup =
event
when the system is in the sleep state.  For example, :c:func:`enable_irq_wa=
ke()`
might identify GPIO signals hooked up to a switch or other external hardwar=
e,
and :c:func:`pci_enable_wake()` does something similar for the PCI PME sign=
al.

So, if there is a condition where $this device has to, somehow, deal
with wakeup, it should be configured accordingly. This ->phy_power_off
flag is telling us the same thing.

> But we want to keep phy powered on only when some wakeup capable devices=
=20
> (eg:keyboard ,mouse ) are connected to controller.

Understood, it could be that we're missing some method for propagating
that state (i.e. keyboard with PM support) up to the parent device, but
that's no excuse to bypass driver boundaries. Wouldn't you agree?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCP3HcRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjGOQf+KlT69IuS8HqBmJV2X3nhuK2dRhbHPymW
K3GcWSvNnMq0ayGT9JmHUzvAOU/WxWqhLb+WLC4F3q2Tyn1bsfM89lu1GNmUFM+w
kybGYLlNU1c/91LbJfmSyENKgTGSqYNJobi+mu6ggaIu5Q2Vf5bbu+hT4dMPckQU
yxBuY7zrIdXp44EGWz6CImE1Jz8aVSeL98fBbflbgkwFo23zDoXO7Te28CAHg9Hr
c0WeaK+z2b4GxOI8SQeBq2o7T4ZLUPtyk0nL36VDZH00Q5uM/ClsmnoreT/xz4In
IuEKIJOVjvgyLYD9VcQXIt3Vb22EjhkwEGa7Zv8BD4EA1PIg3qLx9g==
=ihYt
-----END PGP SIGNATURE-----
--=-=-=--
