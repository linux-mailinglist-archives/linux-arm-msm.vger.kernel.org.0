Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B372D73595
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jul 2019 19:33:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbfGXRdq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jul 2019 13:33:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:55890 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726158AbfGXRdp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jul 2019 13:33:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id BDE9BAC18;
        Wed, 24 Jul 2019 17:17:35 +0000 (UTC)
Subject: Re: [PATCH v5 18/24] drm/ast: Provide ddc symlink in connector sysfs
 directory
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        dri-devel@lists.freedesktop.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Douglas Anderson <dianders@chromium.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        kernel@collabora.com, linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Vincent Abriou <vincent.abriou@st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dave Airlie <airlied@redhat.com>,
        intel-gfx@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
        linux-arm-msm@vger.kernel.org,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-mediatek@lists.infradead.org, Jyri Sarha <jsarha@ti.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sean Paul <sean@poorly.run>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Allison Randal <allison@lohutok.net>,
        linux-arm-kernel@lists.infradead.org,
        Enrico Weigelt <info@metux.net>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        amd-gfx@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Huang Rui <ray.huang@amd.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
 <0afab6e2f61907409ba13a0ba91b8ee701eb7d74.1563960855.git.andrzej.p@collabora.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNKFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwJQEEwEIAD4W
 IQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznTtgIbAwUJA8JnAAULCQgHAgYVCgkICwIEFgID
 AQIeAQIXgAAKCRBoDcEdUwt6I7D7CACBK42XW+7mCiK8ioXMEy1NzGbXC51RzGea8N83oEJS
 1KVUtQxrkDxgrW/WLSl/TfqHFsJpdEFOv1XubWbleun3uKPy0e5vZCd5UjZPkeNjnqfCYTDy
 hVVsdOuFbtWDppJyJrThLqr9AgSFmoCNNUt1SVpYEEOLNE6C32BhlnSq21VLC+YXTgO/ZHTa
 YXkq54hHj63jwrcjkBSCkXLh37kHeqnl++GHpN+3R+o3w2OpwHAlvVjdKPT27v1tVkiydsFG
 65Vd0n3m/ft+IOrGgxQM1C20uqKvsZGB4r3OGR50ekAybO7sjEJJ1Obl4ge/6RRqcvKz4LMb
 tGs85D6tPIeFzsBNBFs50uABCADGJj+DP1fk+UWOWrf4O61HTbC4Vr9QD2K4fUUHnzg2B6zU
 R1BPXqLGG0+lzK8kfYU/F5RjmEcClsIkAaFkg4kzKP14tvY1J5+AV3yNqcdg018HNtiyrSwI
 E0Yz/qm1Ot2NMZ0DdvVBg22IMsiudQ1tx9CH9mtyTbIXgACvl3PW2o9CxiHPE/bohFhwZwh/
 kXYYAE51lhinQ3oFEeQZA3w4OTvxSEspiQR8dg8qJJb+YOAc5IKk6sJmmM7JfFMWSr22satM
 23oQ3WvJb4RV6HTRTAIEyyZS7g2DhiytgMG60t0qdABG5KXSQW+OKlZRpuWwKWaLh3if/p/u
 69dvpanbABEBAAHCwHwEGAEIACYWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCWznS4AIbDAUJ
 A8JnAAAKCRBoDcEdUwt6I6X3CACJ8D+TpXBCqJE5xwog08+Dp8uBpx0T9n1wE0GQisZruACW
 NofYn8PTX9k4wmegDLwt7YQDdKxQ4+eTfZeLNQqWg6OCftH5Kx7sjWnJ09tOgniVdROzWJ7c
 VJ/i0okazncsJ+nq48UYvRGE1Swh3A4QRIyphWX4OADOBmTFl9ZYNPnh23eaC9WrNvFr7yP7
 iGjMlfEW8l6Lda//EC5VpXVNza0xeae0zFNst2R9pn+bLkihwDLWxOIyifGRxTqNxoS4I1aw
 VhxPSVztPMSpIA/sOr/N/p6JrBLn+gui2K6mP7bGb8hF+szfArYqz3T1rv1VzUWAJf5Wre5U
 iNx9uqqx
Message-ID: <f4c0432e-9223-54bc-c995-e0704555fc6e@suse.de>
Date:   Wed, 24 Jul 2019 19:17:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0afab6e2f61907409ba13a0ba91b8ee701eb7d74.1563960855.git.andrzej.p@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rQW7V0pPHkAw2NNiWp7qw2pJTEuWVVZkI"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rQW7V0pPHkAw2NNiWp7qw2pJTEuWVVZkI
Content-Type: multipart/mixed; boundary="1nTmnYcXxxfxqvFKU3qpyJbp2Ylpbb6UI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong
 <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Vincent Abriou <vincent.abriou@st.com>, Krzysztof Kozlowski
 <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <f4c0432e-9223-54bc-c995-e0704555fc6e@suse.de>
Subject: Re: [PATCH v5 18/24] drm/ast: Provide ddc symlink in connector sysfs
 directory
References: <cover.1563960855.git.andrzej.p@collabora.com>
 <0afab6e2f61907409ba13a0ba91b8ee701eb7d74.1563960855.git.andrzej.p@collabora.com>
In-Reply-To: <0afab6e2f61907409ba13a0ba91b8ee701eb7d74.1563960855.git.andrzej.p@collabora.com>

--1nTmnYcXxxfxqvFKU3qpyJbp2Ylpbb6UI
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 24.07.19 um 15:59 schrieb Andrzej Pietrasiewicz:
> Use the ddc pointer provided by the generic connector.
>=20
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_m=
ode.c
> index c792362024a5..1c899a6e87b7 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -867,7 +867,14 @@ static int ast_connector_init(struct drm_device *d=
ev)
>  		return -ENOMEM;
> =20
>  	connector =3D &ast_connector->base;
> -	drm_connector_init(dev, connector, &ast_connector_funcs, DRM_MODE_CON=
NECTOR_VGA);
> +	ast_connector->i2c =3D ast_i2c_create(dev);
> +	if (!ast_connector->i2c)
> +		DRM_ERROR("failed to add ddc bus for connector\n");
> +
> +	drm_connector_init_with_ddc(dev, connector,
> +				    &ast_connector_funcs,
> +				    DRM_MODE_CONNECTOR_VGA,
> +				    &ast_connector->i2c->adapter);
> =20
>  	drm_connector_helper_add(connector, &ast_connector_helper_funcs);
> =20
> @@ -881,10 +888,6 @@ static int ast_connector_init(struct drm_device *d=
ev)
>  	encoder =3D list_first_entry(&dev->mode_config.encoder_list, struct d=
rm_encoder, head);
>  	drm_connector_attach_encoder(connector, encoder);
> =20
> -	ast_connector->i2c =3D ast_i2c_create(dev);
> -	if (!ast_connector->i2c)
> -		DRM_ERROR("failed to add ddc bus for connector\n");
> -
>  	return 0;
>  }
> =20
>=20

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Linux GmbH, Maxfeldstrasse 5, 90409 Nuernberg, Germany
GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG N=C3=BCrnberg)


--1nTmnYcXxxfxqvFKU3qpyJbp2Ylpbb6UI--

--rQW7V0pPHkAw2NNiWp7qw2pJTEuWVVZkI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl04kq0ACgkQaA3BHVML
eiOVlgf9G4jOeCy2mr53PWbrCulWova4UboUrbdUc7gRFOmPd+B+OzGYuSRcUnlg
kOVXCeSAueui+sQ0IbNuz/aH/ObT+dZzXd5gkLN9J6jj1WoLQ8Wyn4apJy13rnsE
mHtW7wjvJ8kq5Yool9NZApYN9aD6ZTxZQwt4YokeS7Kfryf+vQN3pweb8XGBW3d4
FuLKHRSrgcqTY1XUMAbXlEC5A0DfBo4wfar1q7u045ggLL84yMQcw3SJ9WyiPbpf
k2v9fkgpwy60HTlNaTBxlzm4KBoRVXfYqIynlK3QMf7GF2sz0RiBF2RmzgG96f0I
UqpER9GagpcIV5uY52PywoarGEUWuA==
=lXB9
-----END PGP SIGNATURE-----

--rQW7V0pPHkAw2NNiWp7qw2pJTEuWVVZkI--
