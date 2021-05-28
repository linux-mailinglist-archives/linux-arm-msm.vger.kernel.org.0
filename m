Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB244394078
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 11:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235672AbhE1J7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 05:59:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhE1J7Y (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 05:59:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D7216613E6;
        Fri, 28 May 2021 09:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622195870;
        bh=JZB5ZGJUUVFCrjpj6tVdxAUSESNltnfj1yHiHN5+qjk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Dn9lOF0ArukJex1uUEzZ77t9F+o2PQIwPTZ8gcc0EONaS0sTQeNdL1LTdy3HixfgD
         +VoAZgoipvBgf1RyQeCKhYVloXQINbasa/OXv07sQZp1aAUtNJhFSmg5fLMq9R9/Je
         wk2usEQ87JxeHc1vUATiKvgq/ABr6Uhne/nVnZo7grqiBDiPhYY3+1heIVYQuwZ7bf
         gzZ5ZuBmHwMjf61BvMvTVyG93hGDj9ZmScqLFk5xYRvdTy6waVTF1BFaSrWGZkI3tf
         V26aW7T3SzbFq8sXHXLtiYBdiRm1RC3D96wxe0WlCwI/Uy9SK9G/EjDTqU6MThvqgL
         TaJ2sQ2xmtW2g==
From:   Felipe Balbi <balbi@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
In-Reply-To: <YK00sn1fvCrtVQaJ@builder.lan>
References: <20210510120547.1315536-1-balbi@kernel.org>
 <20210511044312.GK2484@yoga> <87wns5g0c6.fsf@kernel.org>
 <YK00sn1fvCrtVQaJ@builder.lan>
Date:   Fri, 28 May 2021 12:57:40 +0300
Message-ID: <874kenb2p7.fsf@kernel.org>
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

> On Tue 11 May 03:07 CDT 2021, Felipe Balbi wrote:
>> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>> >> diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dt=
s b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
> [..]
>> >> +&remoteproc_adsp {
>> >> +	status =3D "okay";
>> >> +	firmware-name =3D "qcom/sm8150/adsp.mdt";
>> >
>> > For platforms where we have a Dragonboard or similar we push the
>> > test-signed firmware to qcom/<platform>/. I presume that the Duo
>> > wouldn't run on the test-signed firmware.
>> >
>> > So I think it's better to make this qcom/sm8150/ms-duo/adsp.mdt...from
>> > the start.
>>=20
>> ms-duo would look odd. How about qcom/sm8150/microsoft/adsp.mdt?
>>=20
>
> Sounds good to me.
>
> I do prefer using the non-split firmware package though (i.e. .mbn), if
> you don't have it you can repack the .mdt + .bNN files using
>
> https://github.com/andersson/pil-squasher

Cool, I'll check if we have the non-split version and rename the FW
files.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCwvpQRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjirwf/TAXN72it0OJQbvXTzW0+g6H8zMlYTzsH
O0zBo70sU5UqgiVqnok/xG3XNLyZpa7SpywVSaeOcmDLv817v41TbKq2h5scjNj3
wtKl1Sdpfyb2VdRhhnuAkp42WYHiLfFWcqO4jGOiy1FwMvTm3nGz2b7xPw1/KZ4k
PKg/gkrNXA8BffIlUuRwT5PPMvOE368893RjTA07NbER+zwuYioVMbMF2z2I54Wg
iM78R7VG4x3ZnpddXOKb0gV2Pzkvb9zM1BgACXliqGxuSCZNeqbEkPAicoSe1uny
/f1X6Blnweonw+7+AxOq7pFcxbazl4vnwwLFV+Sf2j8y9X1Z9v9uPg==
=exXR
-----END PGP SIGNATURE-----
--=-=-=--
