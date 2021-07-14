Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA5D3C7EA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 08:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238091AbhGNGnO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 02:43:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238064AbhGNGnO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 02:43:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F6B0613A9;
        Wed, 14 Jul 2021 06:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626244823;
        bh=9Bx9vBoPD5uzTtwmzVBrNtfVfkmNpr6c8EkbHx7wB8Q=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kIKPUGLlKcRUN1II5SBUxh38k+ZGdOTusaV0paftR8s1uYZ2op1Hot+Vk7n1TURTp
         aFG0BnZEWTNQYNKrnnWU/0pEfZmdGS+9d4pyFY4OKEEb3swU9+zDtr4dVaAYu4Xn2Y
         InSTQloEN5hRZOI6owkajV9lHdnCwhpFVQB+1JhclAXsZp5mM0+QJenpAax/5JXx3/
         SWf/9lEgbH8Gya9bWfm2iSBZiU3pqyYFKW9tmLn+zORR5p42MnqoeC+B1q0Etb+PV6
         qgC+jXdZ7MDOyiN385SHIEyBlJZyirosl04EXJUg6punvT7Eme6PPDsQoJFxWKDpKz
         AaTUt6/W2Pvew==
From:   Felipe Balbi <balbi@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <wcheng@codeaurora.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "frowand.list@gmail.com" <frowand.list@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
Subject: Re: [PATCH v14 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
In-Reply-To: <e08dac42-e999-fd97-21ab-34cd70429f03@synopsys.com>
References: <1625908395-5498-1-git-send-email-wcheng@codeaurora.org>
 <1625908395-5498-4-git-send-email-wcheng@codeaurora.org>
 <b65463e9-3a8d-1ee5-3e26-09990aa8ec53@synopsys.com>
 <87czrmzjym.fsf@kernel.org>
 <e08dac42-e999-fd97-21ab-34cd70429f03@synopsys.com>
Date:   Wed, 14 Jul 2021 09:40:13 +0300
Message-ID: <877dhtz9de.fsf@kernel.org>
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

Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>> Thinh Nguyen <Thinh.Nguyen@synopsys.com> writes:
>>> Wesley Cheng wrote:
>>>> Some devices have USB compositions which may require multiple endpoints
>>>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>>>> sufficient for these compositions.  By utilizing flexible TX FIFO
>>>> allocation, this allows for endpoints to request the required FIFO dep=
th to
>>>> achieve higher bandwidth.  With some higher bMaxBurst configurations, =
using
>>>> a larger TX FIFO size results in better TX throughput.
>>>>
>>>> By introducing the check_config() callback, the resizing logic can fet=
ch
>>>> the maximum number of endpoints used in the USB composition (can conta=
in
>>>> multiple configurations), which helps ensure that the resizing logic c=
an
>>>> fulfill the configuration(s), or return an error to the gadget layer
>>>> otherwise during bind time.
>>>>
>>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>>>> ---
>>>>  drivers/usb/dwc3/core.c   |  15 +++
>>>>  drivers/usb/dwc3/core.h   |  16 ++++
>>>>  drivers/usb/dwc3/ep0.c    |   2 +
>>>>  drivers/usb/dwc3/gadget.c | 232 +++++++++++++++++++++++++++++++++++++=
+++++++++
>>>>  4 files changed, 265 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>> index ba74ad7..b194aecd 100644
>>>> --- a/drivers/usb/dwc3/core.c
>>>> +++ b/drivers/usb/dwc3/core.c
>>>> @@ -1267,6 +1267,7 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>>>  	u8			rx_max_burst_prd;
>>>>  	u8			tx_thr_num_pkt_prd;
>>>>  	u8			tx_max_burst_prd;
>>>> +	u8			tx_fifo_resize_max_num;
>>>>  	const char		*usb_psy_name;
>>>>  	int			ret;
>>>>=20=20
>>>> @@ -1282,6 +1283,13 @@ static void dwc3_get_properties(struct dwc3 *dw=
c)
>>>>  	 */
>>>>  	hird_threshold =3D 12;
>>>>=20=20
>>>> +	/*
>>>> +	 * default to a TXFIFO size large enough to fit 6 max packets.  This
>>>> +	 * allows for systems with larger bus latencies to have some headroom
>>>> +	 * for endpoints that have a large bMaxBurst value.
>>>> +	 */
>>>> +	tx_fifo_resize_max_num =3D 6;
>>>> +
>>>>  	dwc->maximum_speed =3D usb_get_maximum_speed(dev);
>>>>  	dwc->max_ssp_rate =3D usb_get_maximum_ssp_rate(dev);
>>>>  	dwc->dr_mode =3D usb_get_dr_mode(dev);
>>>> @@ -1325,6 +1333,11 @@ static void dwc3_get_properties(struct dwc3 *dw=
c)
>>>>  				&tx_thr_num_pkt_prd);
>>>>  	device_property_read_u8(dev, "snps,tx-max-burst-prd",
>>>>  				&tx_max_burst_prd);
>>>> +	dwc->do_fifo_resize =3D device_property_read_bool(dev,
>>>> +							"tx-fifo-resize");
>>>> +	if (dwc->do_fifo_resize)
>>>> +		device_property_read_u8(dev, "tx-fifo-max-num",
>>>> +					&tx_fifo_resize_max_num);
>>>
>>> Why is this check here? The dwc->tx_fifo_resize_max_num should store
>>> whatever property the user sets. Whether the driver wants to use this
>>=20
>> Ack!
>>=20
>>> property should depend on "dwc->do_fifo_resize". Also why don't we have
>>> "snps," prefix to be consistent with the other properties?
>>=20
>> Ack!
>>=20
>>> Can we enforce to a single property? If the designer wants to enable
>>> this feature, he/she can to provide the tx-fifo-max-num. This would
>>> simplify the driver a bit. Since this is to optimize for performance,
>>> the user should know/want/test the specific value if they want to set
>>> for their setup and not hoping that the default setting not break their
>>> setup. So we can remove the "do_fifo_resize" property and just check
>>> whether tx_fifo_resize_max_num is set.
>>=20
>> Ack!
>>=20
>> All very valid points :-)
>>=20
>
> Looks like this series already landed in Greg's testing branch. Not sure
> how we usually handle this to address some of our concerns. Add fix
> patches on top of Greg's testing branch?

yup, no choice anymore :-(

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDuhs0RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUiNVAf/fSuK7IebP/n3bns0cJxXRsVVVcVHZJV5
Wmp9xn9vGwECNnDPHurSubeBDTK22ZTY95xMIPrma99CjfLBJ3VBTwSA5AzUr1sA
OBcYuUG5tpx/eGPvKYDUnjBEvP86QBbKa10iMgufBgMtiSl4s58sI5XFQ3NqWLnx
JEVK2ExtjCrCGZUM+qW/yjKXsP486hxiRcXWhYrE9jeP+q1d+4c9EaelKn2a5EVS
Jook+e3iwv6jYQHOxcLXGLegjjaXn9qLMDNYBC5E7ZyoT/fJJPzz6OO1qLWqjSV/
8XP/6+y5QF3HTe2ByGgvyU4nGbtt5nLN9bHBazJP2r5SC+q8Hp+ovA==
=ayGw
-----END PGP SIGNATURE-----
--=-=-=--
