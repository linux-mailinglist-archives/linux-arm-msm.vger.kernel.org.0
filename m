Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B176361DEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Apr 2021 12:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229719AbhDPKbo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 06:31:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:60746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235120AbhDPKbm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 06:31:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC97361057;
        Fri, 16 Apr 2021 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618569077;
        bh=IAMiD6nBsSIw9U5SztB8TquDBM0SKr9SYSO2C7hnHLg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=dajUMQubS1Rd3xCtncjVycZYn6VltlZ3DqNOdcizpL/oN53VeJiFt3Mqo+DLEFHf9
         5I8aMK2yHwz7gpnjHExOq+u0dIlmr07oyPxbhJ8Qex8k7prQtqhfFOXJwz7SbvrH8o
         RPPZBGxIiSw2PUhDfSFGIFULi03oQ9Gomy736OwNgvHXsikn7UxyPZa5PLV9Oe79h5
         +AgvpulMNawKpfhRhmcEL3nKtEWQbAadKZtxLi0G8J5BzjVyn2N9yBhY089KabgRHx
         M51hpR0tT4h/f0fq8YN+0r7mUjint0C2S4+WwWmT/K+ffMO/T2CnorT6Ygt3Zm4Ua5
         FPLF6AlIGuwYA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Caleb Connolly <caleb@connolly.tech>,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: Re: [PATCH v2] arm64: boot: dts: qcom: sm8150: add SPI nodes
In-Reply-To: <6d861c1b-76e3-5572-8ee9-ca2c803eeac5@somainline.org>
References: <20210415104159.1811077-1-balbi@kernel.org>
 <6d861c1b-76e3-5572-8ee9-ca2c803eeac5@somainline.org>
Date:   Fri, 16 Apr 2021 13:31:10 +0300
Message-ID: <875z0mo70x.fsf@kernel.org>
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

Konrad Dybcio <konrad.dybcio@somainline.org> writes:
> Hi!
>
>
>> Tested on Microsoft Surface Duo (DTS will be sent after -rc1).=20
>
> Cool, along with the Lumias we'll now have all the MSFT arm64 qcom device=
s supported :)

:)

>> +			qup_spi0_default: qup-spi0-default {
>> +				mux {
>> +					pins =3D "gpio0", "gpio1", "gpio2", "gpio3";
>> +					function =3D "qup0";
>> +				};
>> +
>> +				config {
>> +					pins =3D "gpio0", "gpio1", "gpio2", "gpio3";
>> +					drive-strength =3D <6>;
>> +					bias-disable;
>> +				};
>> +			};
>> +
>
> This format - while technically still correct - is now considered
> obsolete. Please move the pin definitions into a more concise one,
> like so:
>
>
> qup_spi0_default: qup-spi0-default {
> =C2=A0=C2=A0=C2=A0 pins =3D "gpio0", "gpio1", "gpio2", "gpio3";
> =C2=A0=C2=A0=C2=A0 function =3D "qup0";
> =C2=A0=C2=A0=C2=A0 drive-strength =3D <6>;
> =C2=A0=C2=A0=C2=A0 bias-disable;
> };

aaa, pretty cool. I'll send v3 shortly.

> (hopefully Thunderbird didn't mess up newlines here..)

heh, it did :)

> Overall, the patch - while on the large side - looks correct to
> me. Thanks!

thanks

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJFBAEBCAAvFiEElLzh7wn96CXwjh2IzL64meEamQYFAmB5Z24RHGJhbGJpQGtl
cm5lbC5vcmcACgkQzL64meEamQZ+Xw//XO0uAbFdQHL/3IsFG2Z51yV6NXt1Mm2n
yVWIJRCp2mF3iWQYBIkAxcLawdKP4WIbWleEXU/4G2+eQXxs58KTqIoLPRJhOm16
0A03cTvgjPx2cI3U7ILAxbGbUDUEMfJcG/aEWPCeh/0XEA/BJdyoyq5BRCxUpQjA
lj6YCdVLawUf4i4GuVsGI9BCSVkuBDUKz8fGABSClA1PcgEXGAXpXEuiJAzdXLPr
qzL55+tcpcOOg9uUWyoae/GB3WRXtQtrz75AAPCRTqgltcFbD0M0WjA4wlhC8yxB
wwb+tOveqb7h2Ex3XdgeRnZcw/IlG6hdxujwAYgDnVyMp1fNu0BPqfd5LsmBJNRW
xiSPfI6sZteT89vruJ+07GbKvQ6CfVxPjwl76tO8Qp/SOavdbH5VCCeNAFxG7vWm
KzOp7oUPALrhcs7nSXqKuQBwF8RPAfoJSm55Mt58gc58hPmBpOL2JAiFoITS3403
NK+ADXmHfZL+J2GzAH74d3IpaXYJEUxVKrovV0/7iSVcfTAztDN2uxoHRvyObn+9
E0d84z/jDEq5ubVhqkuvYwM0xP4fCSSB/W3APQq07iQnApRFe1af+SKuOIAs8hWI
3zRplMo42GqBxa5y+rdCbWoTp2N3z52UM/9ys/GRAkXV8MDkTub0A14VvUSxHNLr
FKp+CvqUuzs=
=DeQj
-----END PGP SIGNATURE-----
--=-=-=--
