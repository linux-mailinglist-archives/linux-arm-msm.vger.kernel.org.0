Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B72563A2829
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 11:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhFJJWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 05:22:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:51338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229937AbhFJJWG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 05:22:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3F8BE613ED;
        Thu, 10 Jun 2021 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623316810;
        bh=5QUE2fV7YVY3lmtCURdzCKjum7famf+vdxyCaBUzw8Q=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=JWEWgpPzZPby7um9izGpK1UxUyZhkmgR6pSUEyQWepXwoofG6/+iiz0xgrnPXIDFj
         vXW4UTuH2StNzLgHRZU5oeVwuKIKOQ081c4s55uMF71tkD4zZHjUN0LzZmdRj33kJu
         0JR38Y00+JMIF+nDHfnrZh0qmrQkwn4ZwwEQUiABJuug/ZNEBTCMhRvpdTM7tYjWk3
         IeKR2+CsWXmamgMoz57Z916rLty5iaobMmVQHS9lshEu10SSf4CrQZzxLED+MiCJWL
         zZYldzRso+fKs8vcQzgmflSSCDaoVc0y+IlKUSL7vLRVYYYSCNgrzHAhKmmQE+ELMx
         uwifB5d+WdIMQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
In-Reply-To: <c2daab34-1b25-7ee3-e203-a414c1e486d5@codeaurora.org>
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com> <87k0n9btnb.fsf@kernel.org>
 <YLo6W5sKaXvy51eW@kroah.com>
 <c2daab34-1b25-7ee3-e203-a414c1e486d5@codeaurora.org>
Date:   Thu, 10 Jun 2021 12:20:00 +0300
Message-ID: <874ke62i0v.fsf@kernel.org>
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

Wesley Cheng <wcheng@codeaurora.org> writes:

> Hi Greg/Felipe,
>
> On 6/4/2021 7:36 AM, Greg KH wrote:
>> On Fri, Jun 04, 2021 at 05:18:16PM +0300, Felipe Balbi wrote:
>>>
>>> Hi,
>>>
>>> Greg KH <gregkh@linuxfoundation.org> writes:
>>>> On Wed, May 19, 2021 at 12:49:16AM -0700, Wesley Cheng wrote:
>>>>> Changes in V9:
>>>>>  - Fixed incorrect patch in series.  Removed changes in DTSI, as dwc3=
-qcom will
>>>>>    add the property by default from the kernel.
>>>>
>>>> This patch series has one build failure and one warning added:
>>>>
>>>> drivers/usb/dwc3/gadget.c: In function =E2=80=98dwc3_gadget_calc_tx_fi=
fo_size=E2=80=99:
>>>> drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of =E2=
=80=98dwc3_mdwidth=E2=80=99 makes pointer from integer without a cast [-Win=
t-conversion]
>>>>   653 |         mdwidth =3D dwc3_mdwidth(dwc->hwparams.hwparams0);
>>>>       |                                ~~~~~~~~~~~~~^~~~~~~~~~
>>>>       |                                             |
>>>>       |                                             u32 {aka unsigned =
int}
>>>> In file included from drivers/usb/dwc3/debug.h:14,
>>>>                  from drivers/usb/dwc3/gadget.c:25:
>>>> drivers/usb/dwc3/core.h:1493:45: note: expected =E2=80=98struct dwc3 *=
=E2=80=99 but argument is of type =E2=80=98u32=E2=80=99 {aka =E2=80=98unsig=
ned int=E2=80=99}
>>>>  1493 | static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
>>>>       |                                ~~~~~~~~~~~~~^~~
>>>>
>>>>
>>>> drivers/usb/dwc3/dwc3-qcom.c: In function =E2=80=98dwc3_qcom_of_regist=
er_core=E2=80=99:
>>>> drivers/usb/dwc3/dwc3-qcom.c:660:23: error: implicit declaration of fu=
nction =E2=80=98of_add_property=E2=80=99; did you mean =E2=80=98of_get_prop=
erty=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>>>>   660 |                 ret =3D of_add_property(dwc3_np, prop);
>>>>       |                       ^~~~~~~~~~~~~~~
>>>>       |                       of_get_property
>>>>
>>>>
>>>> How did you test these?
>
> I ran these changes on our internal branches, which were probably
> missing some of the recent changes done to the DWC3 drivers.  Will fix
> the above compile errors and re-submit.
>
> In regards to how much these changes have been tested, we've been
> maintaining the TX FIFO resize logic downstream for a few years already,
> so its being used in end products.  We also verify this with our
> internal testing, which has certain benchmarks we need to meet.

the problem with that is that you *know* which gadget is running
there. You know everyone of those is going to run the android
gadget. In a sense, all those multiple products are testing the same
exact use case :-)

>>> to be honest, I don't think these should go in (apart from the build
>>> failure) because it's likely to break instantiations of the core with
>>> differing FIFO sizes. Some instantiations even have some endpoints with
>>> dedicated functionality that requires the default FIFO size configured
>>> during coreConsultant instantiation. I know of at OMAP5 and some Intel
>>> implementations which have dedicated endpoints for processor tracing.
>>>
>>> With OMAP5, these endpoints are configured at the top of the available
>>> endpoints, which means that if a gadget driver gets loaded and takes
>>> over most of the FIFO space because of this resizing, processor tracing
>>> will have a hard time running. That being said, processor tracing isn't
>>> supported in upstream at this moment.
>>>
>
> I agree that the application of this logic may differ between vendors,
> hence why I wanted to keep this controllable by the DT property, so that
> for those which do not support this use case can leave it disabled.  The
> logic is there to ensure that for a given USB configuration, for each EP
> it would have at least 1 TX FIFO.  For USB configurations which don't
> utilize all available IN EPs, it would allow re-allocation of internal
> memory to EPs which will actually be in use.

The feature ends up being all-or-nothing, then :-) It sounds like we can
be a little nicer in this regard.

>>> I still think this may cause other places to break down. The promise the
>>> databook makes is that increasing the FIFO size over 2x wMaxPacketSize
>>> should bring little to no benefit, if we're not maintaining that, I
>>> wonder if the problem is with some of the BUSCFG registers instead,
>>> where we configure interconnect bursting and the like.
>>=20
>
> I've been referring mainly to the DWC3 programming guide for
> recommendations on how to improve USB performance in:
> Section 3.3.5 System Bus Features to Improve USB Performance

dwc3 or dwc3.1? Either way, since I left Intel I don't have access to
the databook anymore. I have to trust what you guys are telling me and,
based on the description so far, I don't think we're doing the right
thing (yet).

It would be nice if other users would test this patchset with different
gadget drivers and different platforms to have some confidence that
we're limiting possible regressions.

I would like for Thinh to comment from Synopsys side here.

> At least when I ran the initial profiling, adjusting the RX/TX
> thresholds brought little to no benefits.  Even in some of the examples,

right, the FIFO sizes shouldn't help much. At least that's what Paul
told me several years ago. Thinh, has the recommendation changed?

> they have diagrams showing a TXFIFO size of 6 max packets (Figure 3-5).
>  I think its difficult to say that the TX fifo resizing won't help in
> systems with limited, or shared resources where the bus latencies would
> be somewhat larger.  By adjusting the TX FIFO size, the controller would
> be able to fetch more data from system memory into the memory within the
> controller, leading to less frequent end of bursts, etc... as data is
> readily available.
>
> In terms of adjusting the AXI/AHB bursting, I would think the bandwidth
> increase would eventually be constrained based on your system's design.
>  We don't touch the GSBUSCFG registers, and leave them as is based off
> the recommendations from the HW designers.

Right, I want to touch those as little as possible too :-) However, to
illustrate, the only reason I implemented FIFO resizing was because
OMAP5 ES1 had TX FIFOs that were smaller than a full USB3 packet. HW
Designer's recommendation can be bogus too ;-)

>> Good points.
>>=20
>> Wesley, what kind of testing have you done on this on different devices?
>>=20
>
> As mentioned above, these changes are currently present on end user
> devices for the past few years, so its been through a lot of testing :).

all with the same gadget driver. Also, who uses USB on android devices
these days? Most of the data transfer goes via WiFi or Bluetooth, anyway
:-)

I guess only developers are using USB during development to flash dev
images heh.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDB2UARHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhh6wf5ASkHs6fqBzDQD1V1D6i2+upsmXEEii9P
rbbYCPi6wR/GN3RqO1gXvxtGOYF2GrSmFcxrk5wmTgsIDKInctwhZvj7K+V/NnV7
kBxkM6vF4w1gwjbFRAV7SMeuIQB1uqBQdwMQpWlOOlZ67oGLJX6rl6C/u7e8dwvu
fEP1n4SxZO9tPlxXFPg0CLE5QI6mcTisOPcGBRR02f/DTb7rY0xq8EdDg4m62Atg
1Sux19GlPFG0kRA2F1+d7E//yZcLc2ukOPkGmAP3W2dg5XqEErBZXpm8Ca6N9oA6
Q8MMLl1xwoImIm0TRwn7SGDQV7av5KN3LndA3m8lNROHqx1+EyDQjQ==
=RWpj
-----END PGP SIGNATURE-----
--=-=-=--
