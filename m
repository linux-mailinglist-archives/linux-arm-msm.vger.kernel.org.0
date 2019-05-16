Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9EE9206EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2019 14:31:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbfEPMbH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 May 2019 08:31:07 -0400
Received: from narfation.org ([79.140.41.39]:53394 "EHLO v3-1039.vlinux.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726427AbfEPMbH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 May 2019 08:31:07 -0400
X-Greylist: delayed 520 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 May 2019 08:31:06 EDT
Received: from bentobox.localnet (p200300C5971012EA00000000000003ED.dip0.t-ipconnect.de [IPv6:2003:c5:9710:12ea::3ed])
        by v3-1039.vlinux.de (Postfix) with ESMTPSA id 365CD1100B2;
        Thu, 16 May 2019 14:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
        s=20121; t=1558009345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8PgTS1MhnufKSOyyGNQFDC0OlFGKAZBvMOhNMAikqFI=;
        b=iTdoHsEibNFS2MWXq+B2jqTZwDXU+ZPShM2e1hhjSpj6MncTjuLYcnEgvGoAMugB9wsPJt
        HhBWtOzJkOfom9ujGlBzLn4e2x4KYVbd5JbavuTujbLhES/SjxKG8Q3aMxDL8pc5yRFIIf
        JbFGUPiZrC/dKvalkW5i9OG5+MF0278=
From:   Sven Eckelmann <sven@narfation.org>
To:     openwrt-devel@lists.openwrt.org
Cc:     =?utf-8?B?0J/QsNCy0LXQuw==?= <be.dissent@gmail.com>,
        Petr =?utf-8?B?xaB0ZXRpYXI=?= <ynezz@true.cz>,
        Christian Lamparter <chunkeey@gmail.com>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Varadarajan Narayanan <varada@codeaurora.org>,
        Gopinath Sekar <gsekar@codeaurora.org>
Subject: Re: [OpenWrt-Devel] [PATCH 2/4] ipq40xx: fix sleep clock
Date:   Thu, 16 May 2019 14:22:14 +0200
Message-ID: <5064672.lGSt0B6DOn@bentobox>
In-Reply-To: <CAEdN=pFJ_AoNftsHySvZU6Vsf+L8tP7gccfABms-X6GMz0TFoA@mail.gmail.com>
References: <20190514134220.3626-1-be.dissent@gmail.com> <2125930.tk2zk5hxM4@bentobox> <CAEdN=pFJ_AoNftsHySvZU6Vsf+L8tP7gccfABms-X6GMz0TFoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2231928.jJf2JWvJPP"; micalg="pgp-sha512"; protocol="application/pgp-signature"
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
        s=20121; t=1558009345;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8PgTS1MhnufKSOyyGNQFDC0OlFGKAZBvMOhNMAikqFI=;
        b=u4sY754Y6yN3TZngIPtALDXWZ8hfF+QGmbWNR+k2/e69OnK9Aehy+bSGSHKX62wYIOSH6Z
        F7q0IP+BH8AUzEFPg0PTYUlsH3RGisAbjoHdZxVDSLAExSUVS9rCoadkIa9DcWKx0wZblZ
        MHfWMuklORb6Cl2qTkUApbu1hLxE8To=
ARC-Seal: i=1; s=20121; d=narfation.org; t=1558009345; a=rsa-sha256;
        cv=none;
        b=eYrXL/z6EHAwPmcUIm9tkocsl0Q5kJcaKjzMzoouGjdAuDOkS5biz/Sfar9UC0uV37I6Hl
        1gBmS688Os6Iv4JXRvWslf+zNmeVV7IfwlZ1Bo9XVKBDbx03zgx89Stv/AqbJbvJ5DoNWy
        lt0+uVPKOhV5R6z5smW3Db8Krd1vEfc=
ARC-Authentication-Results: i=1;
        v3-1039.vlinux.de;
        auth=pass smtp.auth=sven smtp.mailfrom=sven@narfation.org
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

--nextPart2231928.jJf2JWvJPP
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Tuesday, 14 May 2019 15:42:18 CEST Pavel Kubelun wrote:
> +--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> ++++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +@@ -141,9 +141,9 @@
> +       };
> +=20
> +       clocks {
> +-              sleep_clk: sleep_clk {
> ++              sleep_clk: gcc_sleep_clk_src {
> +                       compatible =3D "fixed-clock";
> +-                      clock-frequency =3D <32768>;
> ++                      clock-frequency =3D <32000>;
> +                       #clock-cells =3D <0>;
> +               };

On Thursday, 16 May 2019 13:18:14 CEST =D0=9F=D0=B0=D0=B2=D0=B5=D0=BB wrote:
[...]
> > And maybe some of these guys also know how to find the ipq40xx clock
> > controller reference or hardware reference. Because I was only able to
> > verify
> > for IPQ8072 that it had a 32.768 KHz sleep clock. But the
> >
>=20
> If you are completely sure about that, then I guess that they have
> (un)intentionally messed with the clock in QSDK, because they state that
> ipq807x has the same 32000 khz crystal.
> https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/tree/arch/ar=
m64/boot/dts/qcom/qcom-ipq807x-soc.dtsi?h=3Deggplant#n2055

Confidence is the wrong word. I can only state that this is written in=20
80-YA727-13 Rev. D (IPQ8072.AP.HK07). Same for other devices like=20
IPQ8078 AP.HK02, IPQ8074 AP.HK01, ...

But I found in the same document that they call it the "32 KHz sleep clock =
in"=20
in one section and and in another table "32.768 KHz sleep clock input to th=
e=20
IPQ8072" (next to the name "...32K..."). So it is now to the reader to find=
=20
out what they meant here in which reference document. So maybe they also me=
ant=20
32.768 KHz when in the IPQ4019 Watchdog document when they wrote 32 Khz sle=
ep=20
clock... who knows.

My gut feeling (sorry, not an HW guy) tell me that they are just using a=20
32.768 KHz clock (from a standard 32.768 KHz oscillator) in all these produ=
cts=20
and just shortened it to 32K at some point in the document. And now Gopinat=
h=20
Sekar wrote 32000 instead of 32768. But I absolutely don't know what actual=
ly=20
is there in HW.

Kind regards,
	Sven

[1] https://source.codeaurora.org/quic/qsdk/oss/kernel/linux-msm/commit/?id=
=3Dd92ec59973484acc86dd24b67f10f8911b4b4b7d
--nextPart2231928.jJf2JWvJPP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlzdVfYACgkQXYcKB8Em
e0argw/7B5HjA5QTmEnaTIGNOCGAJitwNry9ad68hIkc/42XYrD0a+lQ07hbhd3g
uT80OrP+Goo0l8SPsEUtsJtP4422bR3wpew7FaNbLBbyS+ztmTblNLX+xgbhP7Xu
8C2xLVkZaEndFMAzJSEy26OjdeQtoZQQH13FTBvhZvtcU9tWvrSgUwIOoCnDRCvG
dG3sux89bP78XMpEfzi7jnQsKHo/g125j5YVnTCZRWXV9iKgM3x0iHQPk9wzBfoI
UtS9ShooUaFbpiYydf0JxyXfnqs9xWnZsba3fMnsQdGwTF96ZFgVN5UjgvxKuUPg
1SLtQ/ZTzuxw3iBXidYbl8ZE9Y60JmFiQdg388IufCbwYCO3Ek0fUCdMTqgigNDm
cC6UlH5Ggq+8hvutmr4P4HYZMy+3e6vZYmPj8JX26sSOKPdY5WZkt04K4EQLzYMu
utBud0FFp0MT3o3LUczj1S3Y2nDhCXv5/QirnvkxweawvOWR23v4APi+SziBcdk7
5qJKk8xJ8Ewz4pm2+2m045yF0utMfrv59qo9/HesZbRP70AdgoMVTIKBM6yLVdok
bYEmRIYYCXFMZe+QTwasqeQhBvwdqfb+5v/HdUTk2Nsf5RBOCA83XjDB3olcUKSG
PLu5YE64ex5uxGF2wBAMCPDyKI87WsOP2vsYJ13MD8geQ8s4gdQ=
=fHKg
-----END PGP SIGNATURE-----

--nextPart2231928.jJf2JWvJPP--



