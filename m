Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09879353DC0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 12:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237419AbhDEJCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 05:02:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbhDEJCM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 05:02:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E9FEC0613A7
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 02:01:59 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id C64CF1F44C1D
Received: by earth.universe (Postfix, from userid 1000)
        id 6D6193C0C96; Mon,  5 Apr 2021 11:01:55 +0200 (CEST)
Date:   Mon, 5 Apr 2021 11:01:55 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     Jun Nie <jun.nie@linaro.org>, john.stultz@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        david.brown@linaro.org, amit.pundir@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] power: reset: qcom-pon: Add power on/off reason info
Message-ID: <20210405090155.5jwvp7luhpsp72av@earth.universe>
References: <20210120040602.3966608-1-jun.nie@linaro.org>
 <eab4d683-6a97-7b90-7549-54a940d8b487@somainline.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kdywh2x374mrcoz4"
Content-Disposition: inline
In-Reply-To: <eab4d683-6a97-7b90-7549-54a940d8b487@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--kdywh2x374mrcoz4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

In addition to Angelo's feedback (thanks!),

On Wed, Jan 20, 2021 at 11:19:26AM +0100, AngeloGioacchino Del Regno wrote:
> [...]
> > +static const char * const pm8916_pon_reason[] =3D {
> > +	[0] =3D "Triggered from Hard Reset",
> > +	[1] =3D "Triggered from SMPL (sudden momentary power loss)",
> > +	[2] =3D "Triggered from RTC (RTC alarm expiry)",
> > +	[3] =3D "Triggered from DC (DC charger insertion)",
> > +	[4] =3D "Triggered from USB (USB charger insertion)",
> > +	[5] =3D "Triggered from PON1 (secondary PMIC)",
> > +	[6] =3D "Triggered from CBL (external power supply)",
> > +	[7] =3D "Triggered from KPD (power key press)",
> > +};
>=20
> Triggered from =3D> Triggered by?
>=20
> > +
> > +static const char * const pm8916_poff_reason[] =3D {
> > +	[0] =3D "Triggered from SOFT (Software)",
> > +	[1] =3D "Triggered from PS_HOLD (PS_HOLD/MSM controlled shutdown)",
> > +	[2] =3D "Triggered from PMIC_WD (PMIC watchdog)",
> > +	[3] =3D "Triggered from GP1 (Keypad_Reset1)",
> > +	[4] =3D "Triggered from GP2 (Keypad_Reset2)",
> > +	[5] =3D "Triggered from KPDPWR_AND_RESIN"
> > +		"(Simultaneous power key and reset line)",
> > +	[6] =3D "Triggered from RESIN_N (Reset line/Volume Down Key)",
> > +	[7] =3D "Triggered from KPDPWR_N (Long Power Key hold)",
> > +	[8] =3D "N/A",
> > +	[9] =3D "N/A",
> > +	[10] =3D "N/A",
> > +	[11] =3D "Triggered from CHARGER (Charger ENUM_TIMER, BOOT_DONE)",
> > +	[12] =3D "Triggered from TFT (Thermal Fault Tolerance)",
> > +	[13] =3D "Triggered from UVLO (Under Voltage Lock Out)",
> > +	[14] =3D "Triggered from OTST3 (Overtemp)",
> > +	[15] =3D "Triggered from STAGE3 (Stage 3 reset)",
> >   };
> [...]

Please don't add constant prefix into the reason array. Instead put
the constant part to the message printing as required. E.g.:

static const char * const pm8916_pon_reason[] =3D {
    [0] =3D "Hard Reset",
    [1] =3D "SMPL (sudden momentary power loss)",
    ...
};

and printing looks like this:

dev_info(dev, "Power on reason: %s\n", pm8916_pon_reason[reason]);
dev_info(dev, "Power off reason: %s\n", pm8916_poff_reason[reason]);

Thanks,

-- Sebastian

--kdywh2x374mrcoz4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmBq0f4ACgkQ2O7X88g7
+ppH4RAAof2P+jfUKMmneL+p5NM/tzf6R5wQLvYmce9N64KEOKmfSumlhErqAeRQ
u0ybBjak7Ra/lO+uGk9YxVb07FvcaVN18r+1z2E5qt2DQ07mvjUCdpbUWgmqXryZ
lsbBwdymFSX5a4RIdFmjKPZfhTQWG48WHKasNszbuziwuIiByYOChFz32AE3ZLpf
cPGSUAZHzPmxyj2E5BXbD/JOQXEM6IqW2cwwDGH00s/P+P6Or1LIdfo2RvcPzp8D
N5Kug0ZKO8+Rqi9203aDzrH4Y179FsYiRnHet2jF2JZzSpXtitrSms/PB8/RODo1
eSnrBwrwQH8ghNIOJYiRPuIQbipSHmeLC+qs+Nk+QsKgeGT/tO7nesQP6asftALc
+NBUkoTJ+V4XMkDIeayvWdRMyQXxdnPM1BojILX8rCS1p2nAXniRKKYnFn0xavCR
qv45xwFkiOODvEpoQTKGIvI/KUWQlcHDW3OePffRqCRg/s9eQuwEhywKT/UGsjTp
pGCOUmoBs5DEq3LM1BaJuXMwGtRKf6AKJxoKpe1jYTJPnDl3w/8VKu7xtCF4GBau
sdgf4YbC7lKiROCUJqqDFsOqk/B8LfqVasXs4HUTHUQvNQjMGUvzQozWAlQi0J7U
q88AJ0d4qH6siY5jInMHJiS6qIYZ3/k316pZHBjdUGH9U7BlxsI=
=lSES
-----END PGP SIGNATURE-----

--kdywh2x374mrcoz4--
