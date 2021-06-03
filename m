Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B77B399ECB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 12:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhFCKU6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 06:20:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:54412 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229761AbhFCKU5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 06:20:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D703613AA;
        Thu,  3 Jun 2021 10:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622715553;
        bh=AJLMjOpulfXisHx8XvaX9KBnrpGJ8zLCdtiymRlbsRI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MttiUo4LMbwGgEcsHCDge4f3eT8H8HrE9WiQQAM8TbgI8FH3CVTPThkpLjg/wcg8L
         raBTKFITQSLAPh7AVt9/ObzCE+EHycA2DHuv/q+3zHX9ksej4B1o9UrgPo5I1mX0BL
         B76QWeDM4MDqLhB6MR8c7P995V7F4Eq9EgKh7kO7htftjufmykpEP3O2c43bDqLrfs
         LtviGwbbu3R6fNWqQwZK0CFhBZRzZKMz2tXYyiDIkhlUVEZmrx5vXrda76ZoXa4uhh
         6pQat6eGt6W8r265tgiYC6xH9+WkAgA1K10NSaP1Sa2HCps/WBE9+dyDNa/l0vo3UI
         AJqhuAz83MC/w==
From:   Felipe Balbi <balbi@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
In-Reply-To: <YLJyVEOhd+r2p+Qm@builder.lan>
References: <20210510120547.1315536-1-balbi@kernel.org>
 <20210511044312.GK2484@yoga> <87wns5g0c6.fsf@kernel.org>
 <YK00sn1fvCrtVQaJ@builder.lan> <874kenb2p7.fsf@kernel.org>
 <87v9739ibk.fsf@kernel.org> <YLJyVEOhd+r2p+Qm@builder.lan>
Date:   Thu, 03 Jun 2021 13:19:05 +0300
Message-ID: <87o8cnckti.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Bjorn Andersson <bjorn.andersson@linaro.org> writes:

> On Fri 28 May 07:03 CDT 2021, Felipe Balbi wrote:
>
>> Felipe Balbi <balbi@kernel.org> writes:
>>=20
>> > Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>> >
>> >> On Tue 11 May 03:07 CDT 2021, Felipe Balbi wrote:
>> >>> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>> >>> >> diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-du=
o.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
>> >> [..]
>> >>> >> +&remoteproc_adsp {
>> >>> >> +	status =3D "okay";
>> >>> >> +	firmware-name =3D "qcom/sm8150/adsp.mdt";
>> >>> >
>> >>> > For platforms where we have a Dragonboard or similar we push the
>> >>> > test-signed firmware to qcom/<platform>/. I presume that the Duo
>> >>> > wouldn't run on the test-signed firmware.
>> >>> >
>> >>> > So I think it's better to make this qcom/sm8150/ms-duo/adsp.mdt...=
from
>> >>> > the start.
>> >>>=20
>> >>> ms-duo would look odd. How about qcom/sm8150/microsoft/adsp.mdt?
>> >>>=20
>> >>
>> >> Sounds good to me.
>> >>
>> >> I do prefer using the non-split firmware package though (i.e. .mbn), =
if
>> >> you don't have it you can repack the .mdt + .bNN files using
>> >>
>> >> https://github.com/andersson/pil-squasher
>> >
>> > Cool, I'll check if we have the non-split version and rename the FW
>> > files.
>>=20
>> doesn't seem like pil-squasher works with our slpi image. Gives me a
>> 0-byte image :-)
>>=20
>
> If your files are available somewhere I'd be happy to take a look, if
> not patches are definitely welcome :)
>
>> I would rather not touch the binaries if I can avoid it, though. Is this
>> a strong requirement to use mbn rather than mdt?
>>=20
>
> I've had numerous problems with things such as people upgrading N-1
> files and having issues with the signature check just indicating that
> "something" is wrong. Squashing the files avoid these kind of problems.
>
> But it's not a requirement!

fair enough, I'll send a v2 as soon as I test everything on top of -rc4.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC4rJkRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUhI+Qf/ZvLYSaNSpLiO3jftQ1D/Lgv8VEBMprI9
7iug4Y27LHolQeXP16pFmuDrq76z6oNF6DF/rZTsW8jRsyT5RMHS/DaxwYwddaOU
saeAyRdcvA0fbPk31RFOX7B1O0FxXF+SbBaXLLbd+OO6ERvjvYbPZ+kaje9ivSfo
vVTfEMkcriy+pFPKZa4uzB4V6pp7k8AcpkSlBrsGfxrpCX84tq7M91dzUa50LVpb
MYCek8LZKV3ZkspfYrM18mXLoZRNfjJXDX+xz4wADnyM8p50kv0j0oMoaD8NOFJz
Mg6qZhLlgaYOn1f0sRrRhoKyXOk9sBjbBh/57duqU+OQP0s+UDyUIQ==
=VT70
-----END PGP SIGNATURE-----
--=-=-=--
