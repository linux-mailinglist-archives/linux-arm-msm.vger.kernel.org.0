Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C63849C4B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 10:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbfFRIo4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 04:44:56 -0400
Received: from mga04.intel.com ([192.55.52.120]:56891 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbfFRIoz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 04:44:55 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Jun 2019 01:44:55 -0700
X-ExtLoop1: 1
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jun 2019 01:44:52 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     alokc@codeaurora.org, agross@kernel.org, david.brown@linaro.org,
        bjorn.andersson@linaro.org, gregkh@linuxfoundation.org,
        ard.biesheuvel@linaro.org, jlhugo@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND v4 0/4] I2C: DWC3 USB: Add support for ACPI based AArch64 Laptops
In-Reply-To: <20190618080828.GJ16364@dell>
References: <20190617125105.6186-1-lee.jones@linaro.org> <87lfy0gym0.fsf@linux.intel.com> <20190617132349.GI16364@dell> <87a7efgxw7.fsf@linux.intel.com> <20190618080828.GJ16364@dell>
Date:   Tue, 18 Jun 2019 11:44:48 +0300
Message-ID: <87wohjffjz.fsf@linux.intel.com>
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
> On Tue, 18 Jun 2019, Felipe Balbi wrote:
>> Lee Jones <lee.jones@linaro.org> writes:
>> > On Mon, 17 Jun 2019, Felipe Balbi wrote:
>> >
>> >> Lee Jones <lee.jones@linaro.org> writes:
>> >>=20
>> >> > This patch-set ensures the kernel is bootable on the newly released
>> >> > AArch64 based Laptops using ACPI configuration tables.  The Pinctrl
>> >> > changes have been accepted, leaving only I2C (keyboard, touchpad,
>> >> > touchscreen, fingerprint, etc, HID device) and USB (root filesystem,
>> >> > camera, networking, etc) enablement.
>> >> >
>> >> > RESEND: Stripped I2C patches as they have also been merged into
>> >> >         their respective subsystem.
>> >> >
>> >> > v4:
>> >> >  * Collecting Acks
>> >> >  * Adding Andy Gross' new email
>> >> >  * Removing applied Pinctrl patches
>> >> >
>> >> > Lee Jones (4):
>> >> >   soc: qcom: geni: Add support for ACPI
>> >> >   usb: dwc3: qcom: Add support for booting with ACPI
>> >> >   usb: dwc3: qcom: Start USB in 'host mode' on the SDM845
>> >> >   usb: dwc3: qcom: Improve error handling
>> >>=20
>> >> pushed to testing/next
>> >
>> > Sounds promising, thanks Felipe.
>> >
>> > OOI, what is your process?
>> >
>> > How does do the patches typically sit in there?
>>=20
>> I'll probably merge to my 'next' branch today. I leave them in
>> testing/next for a couple days, usually, so 0-day can run its thing and
>> I get a chance of at least boot testing on our machines in the lab here.
>>=20
>> Since this doesn't touch anything "generic", I don't _have_ to boot
>> test, so I'll probably merge to 'next' today.
>
> You're a star.  Thanks Felipe.

it's in my 'next' now. Should be in tomorrow's linux next.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl0IpIAACgkQzL64meEa
mQbfwxAAiJetJXp+PQT5+Erhw0RVJLt2IbC6/mEQKg82EfTN4MVOBIRu0W3HIl6O
4dCCBxcDa2YvpSIZZTyxfx/2uyrxQo1qctq5GW2uXCutmMBndc6+c3ttvROphyO5
GYwhzp2bey9uGAO0FsDxXLoeIhJ2wOt30/cgslh2E4a6ql4RHRbCGaTGqQAh+snG
RT5cZeGCvFtwj0R7NEqutqIqDkXAjf3NmHR5vzeNATpaM9WruHUu1kElsMxpDUhb
1lK7GS/4KnRqkKnR3SSTGHiAq4XrVl58BGzPFrj/v9Km/C+XYhClb5m3Tr6yQl07
fIGMmi5oQ3ylEUStFu1aA7U2xWpotPVQak8skMBxTQPGPyZWW6CAOA2dNcYvtJPl
1SV7PSWppLi66p8ienUDmZWhIa5kXW+p79p5kssnsU9yNy6aR7RCnUR9BInr+siq
6vZszRKkdcvadUTYS+yTvMGtxDegzPgetX8SI3jnvWpcxwkMSyCh6Dqa8rtKu8fN
QMzl8eaKXOWCxOPGf87r9irnC+KagFRlKIdpSLJKu2UEHZvLVHCjyEKwwINzyMMz
f21PMcHPZ/WBsiVqgHiiOC3mV6ELT0wioOI1kSSLC0nvMS8zaIALtt19QonF88uW
bg1mNfyOz4mqbwn3up4axpMwLnUUgGy+bvuVtWDP3dPcA/LE1TU=
=iXuK
-----END PGP SIGNATURE-----
--=-=-=--
