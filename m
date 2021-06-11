Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0506E3A3C06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jun 2021 08:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFKGbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Jun 2021 02:31:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:55548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229584AbhFKGbr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Jun 2021 02:31:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3189606A5;
        Fri, 11 Jun 2021 06:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623392989;
        bh=cDgjgDCYhInJc42goOaTVPWGytEFGlr7kncIL8hl31o=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KyVXl38DNyH3b0fvA7FiRqZHvBVJTB5Vxn+s+ZMzaU6aafkOetxKk5HA07dzVeTNF
         xSkCGHH7CHrIjE3hkvyN7OGnIfUsSjKXHlny//E0APHlrOp7jcWcaD19wiaxHlNK69
         HQM4MBrnV2jI1Pvqm1TKw1gQBOCrrtfPmDvlR3SJWwHR0sqPWSJ+LuaCBN1dnVa60P
         hhppBAUUX/nBrQDj8cUXuK2ZfpYdSUnkpCTI1JahO1925UOZBWKJlLk2/cH0iK0fin
         1MdeJxLOdfpKAab+MaRvpmTc0Yq4kjnMNSd+Jcjcx2b5S4I2nnPd0xPeSinMLtOYXp
         gnILSsHXjQzQQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>,
        Greg KH <gregkh@linuxfoundation.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jackp@codeaurora.org, Thinh.Nguyen@synopsys.com
Subject: Re: [PATCH v9 0/5] Re-introduce TX FIFO resize for larger EP bursting
In-Reply-To: <e5f231ca-6807-bcea-29c2-ab3926057310@codeaurora.org>
References: <1621410561-32762-1-git-send-email-wcheng@codeaurora.org>
 <YLoUiO8tpRpmvcyU@kroah.com> <87k0n9btnb.fsf@kernel.org>
 <YLo6W5sKaXvy51eW@kroah.com>
 <c2daab34-1b25-7ee3-e203-a414c1e486d5@codeaurora.org>
 <874ke62i0v.fsf@kernel.org>
 <e5f231ca-6807-bcea-29c2-ab3926057310@codeaurora.org>
Date:   Fri, 11 Jun 2021 09:29:18 +0300
Message-ID: <8735to29tt.fsf@kernel.org>
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
>>>>> Greg KH <gregkh@linuxfoundation.org> writes:
>>>>>> On Wed, May 19, 2021 at 12:49:16AM -0700, Wesley Cheng wrote:
>>>>>>> Changes in V9:
>>>>>>>  - Fixed incorrect patch in series.  Removed changes in DTSI, as dw=
c3-qcom will
>>>>>>>    add the property by default from the kernel.
>>>>>>
>>>>>> This patch series has one build failure and one warning added:
>>>>>>
>>>>>> drivers/usb/dwc3/gadget.c: In function =E2=80=98dwc3_gadget_calc_tx_=
fifo_size=E2=80=99:
>>>>>> drivers/usb/dwc3/gadget.c:653:45: warning: passing argument 1 of =E2=
=80=98dwc3_mdwidth=E2=80=99 makes pointer from integer without a cast [-Win=
t-conversion]
>>>>>>   653 |         mdwidth =3D dwc3_mdwidth(dwc->hwparams.hwparams0);
>>>>>>       |                                ~~~~~~~~~~~~~^~~~~~~~~~
>>>>>>       |                                             |
>>>>>>       |                                             u32 {aka unsigne=
d int}
>>>>>> In file included from drivers/usb/dwc3/debug.h:14,
>>>>>>                  from drivers/usb/dwc3/gadget.c:25:
>>>>>> drivers/usb/dwc3/core.h:1493:45: note: expected =E2=80=98struct dwc3=
 *=E2=80=99 but argument is of type =E2=80=98u32=E2=80=99 {aka =E2=80=98uns=
igned int=E2=80=99}
>>>>>>  1493 | static inline u32 dwc3_mdwidth(struct dwc3 *dwc)
>>>>>>       |                                ~~~~~~~~~~~~~^~~
>>>>>>
>>>>>>
>>>>>> drivers/usb/dwc3/dwc3-qcom.c: In function =E2=80=98dwc3_qcom_of_regi=
ster_core=E2=80=99:
>>>>>> drivers/usb/dwc3/dwc3-qcom.c:660:23: error: implicit declaration of =
function =E2=80=98of_add_property=E2=80=99; did you mean =E2=80=98of_get_pr=
operty=E2=80=99? [-Werror=3Dimplicit-function-declaration]
>>>>>>   660 |                 ret =3D of_add_property(dwc3_np, prop);
>>>>>>       |                       ^~~~~~~~~~~~~~~
>>>>>>       |                       of_get_property
>>>>>>
>>>>>>
>>>>>> How did you test these?
>>>
>>> I ran these changes on our internal branches, which were probably
>>> missing some of the recent changes done to the DWC3 drivers.  Will fix
>>> the above compile errors and re-submit.
>>>
>>> In regards to how much these changes have been tested, we've been
>>> maintaining the TX FIFO resize logic downstream for a few years already,
>>> so its being used in end products.  We also verify this with our
>>> internal testing, which has certain benchmarks we need to meet.
>>=20
>> the problem with that is that you *know* which gadget is running
>> there. You know everyone of those is going to run the android
>> gadget. In a sense, all those multiple products are testing the same
>> exact use case :-)
>>=20
>
> Mmmm, the USB gadget has changed from since we've implemented it, such
> as going from Android gadget to Configfs.  Don't forget, we do have
> other business segments that use this feature in other configurations as
> well :).

:)

>>>>> to be honest, I don't think these should go in (apart from the build
>>>>> failure) because it's likely to break instantiations of the core with
>>>>> differing FIFO sizes. Some instantiations even have some endpoints wi=
th
>>>>> dedicated functionality that requires the default FIFO size configured
>>>>> during coreConsultant instantiation. I know of at OMAP5 and some Intel
>>>>> implementations which have dedicated endpoints for processor tracing.
>>>>>
>>>>> With OMAP5, these endpoints are configured at the top of the available
>>>>> endpoints, which means that if a gadget driver gets loaded and takes
>>>>> over most of the FIFO space because of this resizing, processor traci=
ng
>>>>> will have a hard time running. That being said, processor tracing isn=
't
>>>>> supported in upstream at this moment.
>>>>>
>>>
>>> I agree that the application of this logic may differ between vendors,
>>> hence why I wanted to keep this controllable by the DT property, so that
>>> for those which do not support this use case can leave it disabled.  The
>>> logic is there to ensure that for a given USB configuration, for each EP
>>> it would have at least 1 TX FIFO.  For USB configurations which don't
>>> utilize all available IN EPs, it would allow re-allocation of internal
>>> memory to EPs which will actually be in use.
>>=20
>> The feature ends up being all-or-nothing, then :-) It sounds like we can
>> be a little nicer in this regard.
>>=20
>
> Don't get me wrong, I think once those features become available
> upstream, we can improve the logic.  From what I remember when looking

sure, I support that. But I want to make sure the first cut isn't likely
to break things left and right :)

Hence, let's at least get more testing.

> at Andy Shevchenko's Github, the Intel tracer downstream changes were
> just to remove physical EP1 and 2 from the DWC3 endpoint list.  If that

right, that's the reason why we introduced the endpoint feature
flags. The end goal was that the UDC would be able to have custom
feature flags paired with ->validate_endpoint() or whatever before
allowing it to be enabled. Then the UDC driver could tell UDC core to
skip that endpoint on that particular platform without interefering with
everything else.

Of course, we still need to figure out a way to abstract the different
dwc3 instantiations.

> was the change which ended up upstream for the Intel tracer then we
> could improve the logic to avoid re-sizing those particular EPs.

The problem then, just as I mentioned in the previous paragraph, will be
coming up with a solution that's elegant and works for all different
instantiations of dwc3 (or musb, cdns3, etc).

> However, I'm not sure how the changes would look like in the end, so I
> would like to wait later down the line to include that :).

Fair enough, I agree. Can we get some more testing of $subject, though?
Did you test $subject with upstream too? Which gadget drivers did you
use? How did you test

>>>>> I still think this may cause other places to break down. The promise =
the
>>>>> databook makes is that increasing the FIFO size over 2x wMaxPacketSize
>>>>> should bring little to no benefit, if we're not maintaining that, I
>>>>> wonder if the problem is with some of the BUSCFG registers instead,
>>>>> where we configure interconnect bursting and the like.
>>>>
>>>
>>> I've been referring mainly to the DWC3 programming guide for
>>> recommendations on how to improve USB performance in:
>>> Section 3.3.5 System Bus Features to Improve USB Performance
>>=20
>> dwc3 or dwc3.1? Either way, since I left Intel I don't have access to
>> the databook anymore. I have to trust what you guys are telling me and,
>> based on the description so far, I don't think we're doing the right
>> thing (yet).
>>=20
>
> Ah, I see.  DWC3.1 and DWC3 both have that USB performance section.  I
> can explain some of the points I made with a bit more detail.  I thought
> you still had access to it.

I wish :)

If Synopsys wants to give me access for the databook, I would not mind :-)

>> It would be nice if other users would test this patchset with different
>> gadget drivers and different platforms to have some confidence that
>> we're limiting possible regressions.
>>=20
>> I would like for Thinh to comment from Synopsys side here.
>>=20
>>> At least when I ran the initial profiling, adjusting the RX/TX
>>> thresholds brought little to no benefits.  Even in some of the examples,
>>=20
>> right, the FIFO sizes shouldn't help much. At least that's what Paul
>> told me several years ago. Thinh, has the recommendation changed?
>>=20
>
> So when I mention the RX/TX thresholds, this is different than the FIFO
> resize.  The RX/TX threshold is used by the controller to determine when
> to send or receive data based on the number of available FIFOs.  So for

oh right, I remember now :-

> the TX case, if we set the TX threshold, the controller will not start
> transmitting data over the link after X amount of packets are copied to
> the TXFIFO.  So for example, a TXFIFO size of 6 w/ a TX threshold of 3,
> means that the controller will wait for 3 FIFO slots to be filled before
> it sends the data.  So as you can see, with our configuration of TX FIFO

yeah, makes sense.

> size of 2 and TX threshold of 1, this would really be not beneficial to
> us, because we can only change the TX threshold to 2 at max, and at
> least in my observations, once we have to go out to system memory to
> fetch the next data packet, that latency takes enough time for the
> controller to end the current burst.

What I noticed with g_mass_storage is that we can amortize the cost of
fetching data from memory, with a deeper request queue. Whenever I
test(ed) g_mass_storage, I was doing so with 250 requests. And that was
enough to give me very good performance. Never had to poke at TX FIFO
resizing. Did you try something like this too?

I feel that allocating more requests is a far simpler and more generic
method that changing FIFO sizes :)

>>> they have diagrams showing a TXFIFO size of 6 max packets (Figure 3-5).
>>>  I think its difficult to say that the TX fifo resizing won't help in
>>> systems with limited, or shared resources where the bus latencies would
>>> be somewhat larger.  By adjusting the TX FIFO size, the controller would
>>> be able to fetch more data from system memory into the memory within the
>>> controller, leading to less frequent end of bursts, etc... as data is
>>> readily available.
>>>
>>> In terms of adjusting the AXI/AHB bursting, I would think the bandwidth
>>> increase would eventually be constrained based on your system's design.
>>>  We don't touch the GSBUSCFG registers, and leave them as is based off
>>> the recommendations from the HW designers.
>>=20
>> Right, I want to touch those as little as possible too :-) However, to
>> illustrate, the only reason I implemented FIFO resizing was because
>> OMAP5 ES1 had TX FIFOs that were smaller than a full USB3 packet. HW
>> Designer's recommendation can be bogus too ;-)
>>=20
>
> Haha...true, we question their designs only when there's something
> clearly wrong, but the AXI/AHB settings look good.  :)

:)

>>>> Good points.
>>>>
>>>> Wesley, what kind of testing have you done on this on different device=
s?
>>>>
>>>
>>> As mentioned above, these changes are currently present on end user
>>> devices for the past few years, so its been through a lot of testing :).
>>=20
>> all with the same gadget driver. Also, who uses USB on android devices
>> these days? Most of the data transfer goes via WiFi or Bluetooth, anyway
>> :-)
>>=20
>> I guess only developers are using USB during development to flash dev
>> images heh.
>>=20
>
> I used to be a customer facing engineer, so honestly I did see some
> really interesting and crazy designs.  Again, we do have non-Android
> products that use the same code, and it has been working in there for a
> few years as well.  The TXFIFO sizing really has helped with multimedia
> use cases, which use isoc endpoints, since esp. in those lower end CPU
> chips where latencies across the system are much larger, and a missed
> ISOC interval leads to a pop in your ear.

This is good background information. Thanks for bringing this
up. Admitedly, we still have ISOC issues with dwc3. I'm interested in
knowing if a deeper request queue would also help here.

Remember dwc3 can accomodate 255 requests + link for each endpoint. If
our gadget driver uses a low number of requests, we're never really
using the TRB ring in our benefit.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmDDAr4RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUgwygf/dt5i0/DNa7cE5c3b9wWXjhTr4wRZ59vp
xYHRmPWfG1lNtXcVVi6KqtKsCoIcAXig7wvJ6XZboNqUw4PlRb59vXOIebofKmW9
I99TQXcT91IcZTrMsGYIrvKM1kYhrhH4W+qFOhhNwi99gclaucdoTUK0a9u+mqd9
mlRCBbfAXlZbEdtmU46r8GhWud/1lDtupaWi6LLryvs3tdSNlNhb5uFAJTMtmmqP
iZn76pXNQjLfC2pFH10HOpz2y6qHsHpRdTh2VAFt2srhmoGpHyCaW9fMzKNxe/AJ
CmLf/4+EXTC70iqoBA2PGxJ+/FDHWRy6Qv57f3RnUbN1n9W1M6WovA==
=1AxO
-----END PGP SIGNATURE-----
--=-=-=--
