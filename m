Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A32849A6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 09:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbfFRHX2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 03:23:28 -0400
Received: from mga07.intel.com ([134.134.136.100]:5733 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfFRHX2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 03:23:28 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 00:23:27 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga007.jf.intel.com with ESMTP; 18 Jun 2019 00:23:24 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v4 0/4] I2C: DWC3 USB: Add support for ACPI based AArch64 Laptops
In-Reply-To: <20190617132349.GI16364@dell>
References: <20190617125105.6186-1-lee.jones@linaro.org> <87lfy0gym0.fsf@linux.intel.com> <20190617132349.GI16364@dell>
Date:   Tue, 18 Jun 2019 10:23:20 +0300
Message-ID: <87a7efgxw7.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Lee Jones <lee.jones@linaro.org> writes:
> On Mon, 17 Jun 2019, Felipe Balbi wrote:
>
>> Lee Jones <lee.jones@linaro.org> writes:
>>=20
>> > This patch-set ensures the kernel is bootable on the newly released
>> > AArch64 based Laptops using ACPI configuration tables.  The Pinctrl
>> > changes have been accepted, leaving only I2C (keyboard, touchpad,
>> > touchscreen, fingerprint, etc, HID device) and USB (root filesystem,
>> > camera, networking, etc) enablement.
>> >
>> > RESEND: Stripped I2C patches as they have also been merged into
>> >         their respective subsystem.
>> >
>> > v4:
>> >  * Collecting Acks
>> >  * Adding Andy Gross' new email
>> >  * Removing applied Pinctrl patches
>> >
>> > Lee Jones (4):
>> >   soc: qcom: geni: Add support for ACPI
>> >   usb: dwc3: qcom: Add support for booting with ACPI
>> >   usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
>> >   usb: dwc3: qcom: Improve error handling
>>=20
>> pushed to testing/next
>
> Sounds promising, thanks Felipe.
>
> OOI, what is your process?
>
> How does do the patches typically sit in there?

I'll probably merge to my 'next' branch today. I leave them in
testing/next for a couple days, usually, so 0-day can run its thing and
I get a chance of at least boot testing on our machines in the lab here.

Since this doesn't touch anything "generic", I don't _have_ to boot
test, so I'll probably merge to 'next' today.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0IkWgACgkQzL64meEa
mQZfuBAAuQZcnBloj3LoF6OISK9Br5hFTGB0GgLw0eVC0w8VavE1eR4HWJYAD9HU
OtpJSw049QWg5tdam9Se6Vuz6vxi3Hsd0ALTLxaSscinMd1YoMmpnmnX83uSbINn
V9OhiWwV7WmbGKSGAyvO9v+2tYsopxDyoFQr7uleNEF53w8hP4FEHY0BXmd7ZGqR
X5zr6hA03V/7huGC6zqQgtWzrqif3quk/dns882qvNsb5KbsF6nHvbpmYj/50ytn
jRJUG9XdqBgSKx9n4qdQNwtD1eJmpRm+Oa/M9MFwWMw/RZOciS0sfhcl7gHMJaGD
x328NQj80cTs+jq0OiqqYdnKy8R+x7UuKdnNgZW7QvENVJwmEUOwFjU1Btyz4TYH
FORe9XJiVXRUy9ytCykWNgj3jhlYeocnr9ZWGks5wTJkMKER+fUvMJfMSrW0PHDQ
dn1Rs/orlx3rdJ1TnpfBTgqMBWqtxSPaYTqd0gHMPkUSoLm1ion1et7QlGUnteYb
bsave1+35O6UT5b1hf6vUGWICU7zUdfMoQUD0pq+A6QlnvkpK7IBZhfvR0Z+5kNl
1F+ut0O8O+PCE93AKYyhIGKDhy/dZYIR26/0ukGhGwtk8fbS4FfaYEYQYsr0fJuV
myZ3TiG0YZXqgOKo8qauXRj0kZUw85lkzyeBCvpj3EgGzbtze28=
=UaAI
-----END PGP SIGNATURE-----
--=-=-=--
