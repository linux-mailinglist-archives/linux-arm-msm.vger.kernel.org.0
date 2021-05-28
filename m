Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D11BE394246
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 14:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbhE1ME7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 08:04:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:33242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236258AbhE1MEz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 08:04:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8080A61186;
        Fri, 28 May 2021 12:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622203400;
        bh=5OzrrDDSpnkdil7DVdkqBRXpyEYgnEAiPkXEiSeWUVk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=W/JPWL0O5HhSGWnonUD7bQZzXdvARN1CwDJ1uHCAcS8A5VXsjQJr9yg8DP8tzve4Y
         9pneemZTPiNUmX6vu+N81YYC30eSlEkLoY5OWTYX0C7GMD01X85VAlX44D+2ngnVij
         NZpXwdrt0ILF/Vm+CT2poCrb5IPVY7dOO8hDwyFn1Nc85OYlY7/9l9U/gzdvtHdPnQ
         AXkYjVuFHxp5mFM8xEHU50UtgXybtiUFZ4aYgyOZ3fqZouMnwQUgm24vlHnzmO5z6e
         6oXeJF3pJZ8GElmwV481i8EB6MwZXUUnkdfyFCXz33SPmrKdWHfUJivPcbibDip0Qv
         S6yL/sj4p2kJg==
From:   Felipe Balbi <balbi@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH] arm64: dts: qcom: add initial device-tree for Microsoft
 Surface Duo
In-Reply-To: <874kenb2p7.fsf@kernel.org>
References: <20210510120547.1315536-1-balbi@kernel.org>
 <20210511044312.GK2484@yoga> <87wns5g0c6.fsf@kernel.org>
 <YK00sn1fvCrtVQaJ@builder.lan> <874kenb2p7.fsf@kernel.org>
Date:   Fri, 28 May 2021 15:03:11 +0300
Message-ID: <87v9739ibk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Felipe Balbi <balbi@kernel.org> writes:

> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>
>> On Tue 11 May 03:07 CDT 2021, Felipe Balbi wrote:
>>> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
>>> >> diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.d=
ts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
>> [..]
>>> >> +&remoteproc_adsp {
>>> >> +	status =3D "okay";
>>> >> +	firmware-name =3D "qcom/sm8150/adsp.mdt";
>>> >
>>> > For platforms where we have a Dragonboard or similar we push the
>>> > test-signed firmware to qcom/<platform>/. I presume that the Duo
>>> > wouldn't run on the test-signed firmware.
>>> >
>>> > So I think it's better to make this qcom/sm8150/ms-duo/adsp.mdt...from
>>> > the start.
>>>=20
>>> ms-duo would look odd. How about qcom/sm8150/microsoft/adsp.mdt?
>>>=20
>>
>> Sounds good to me.
>>
>> I do prefer using the non-split firmware package though (i.e. .mbn), if
>> you don't have it you can repack the .mdt + .bNN files using
>>
>> https://github.com/andersson/pil-squasher
>
> Cool, I'll check if we have the non-split version and rename the FW
> files.

doesn't seem like pil-squasher works with our slpi image. Gives me a
0-byte image :-)

I would rather not touch the binaries if I can avoid it, though. Is this
a strong requirement to use mbn rather than mdt?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmCw2/8RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUjrfAgApuDkuo7ilM35jjM+zYZqYsV63T0fUFGs
DOqVIq6GmIoJdFBSrmuaqS4Xx5MjTA2ZwytylWzlpDVnir6seGgAG+ohGCAZ4kXT
D8r6/l+ca47kn3q97enaTynb4adtfQfik0wVurmR2lB/jccLAK1nbVp4bhELl/35
/joCYr+wYRf0sS3zwY7INzQiok9qXbWwfE5uRgthbO/fIzfewSyW3bZVHcNkYWpz
aWw0J/ZCn+EwssfW1zqkG6H05lmMDvCVymG/i+sDtyHwppFGREArBdJwwu3qprXt
l8C/HoCdnAAOYdEMsabgcyeMiPOvtVm7rXqGHBA+IyiFkcMvhgmsiw==
=Q6Jz
-----END PGP SIGNATURE-----
--=-=-=--
