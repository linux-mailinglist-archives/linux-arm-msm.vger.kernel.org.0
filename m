Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F77735477
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 12:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232382AbjFSK4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 06:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbjFSKz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 06:55:59 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AABE21FD7
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 03:54:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qBCW3-0002p5-95; Mon, 19 Jun 2023 12:53:47 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qBCVz-008UH6-GY; Mon, 19 Jun 2023 12:53:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qBCVy-00FYHN-RS; Mon, 19 Jun 2023 12:53:42 +0200
Date:   Mon, 19 Jun 2023 12:53:42 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Raymond Tan <raymond.tan@intel.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Samuel Holland <samuel@sholland.org>,
        Kevin Hilman <khilman@baylibre.com>,
        =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Danilo Krummrich <dakr@redhat.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-sunxi@lists.linux.dev, Rahul T R <r-ravikumar@ti.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        etnaviv@lists.freedesktop.org, Yuan Can <yuancan@huawei.com>,
        Inki Dae <inki.dae@samsung.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Johan Hovold <johan+linaro@kernel.org>,
        Hyun Kwon <hyun.kwon@xilinx.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jingoo Han <jingoohan1@gmail.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-aspeed@lists.ozlabs.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        John Stultz <jstultz@google.com>,
        Mihail Atanassov <mihail.atanassov@arm.com>,
        Liang He <windhl@126.com>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        lima@lists.freedesktop.org, Chunyan Zhang <zhang.lyra@gmail.com>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Minghao Chi <chi.minghao@zte.com.cn>,
        Steven Price <steven.price@arm.com>,
        linux-rockchip@lists.infradead.org,
        Ben Skeggs <bskeggs@redhat.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Liu Ying <victor.liu@nxp.com>, linux-arm-msm@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Wang Jianzheng <wangjianzheng@vivo.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Brian Starkey <brian.starkey@arm.com>,
        Karol Herbst <kherbst@redhat.com>,
        Miaoqian Lin <linmq006@gmail.com>,
        Stefan Agner <stefan@agner.ch>,
        Michal Simek <michal.simek@xilinx.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Mali DP Maintainers <malidp@foss.arm.com>,
        Joel Stanley <joel@jms.id.au>, nouveau@lists.freedesktop.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alison Wang <alison.wang@nxp.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Tomi Valkeinen <tomba@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Karol Wachowski <karol.wachowski@linux.intel.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Emma Anholt <emma@anholt.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Doug Anderson <dianders@chromium.org>,
        Liu Shixin <liushixin2@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Laura Nao <laura.nao@collabora.com>,
        David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
        linux-renesas-soc@vger.kernel.org,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Jayshri Pawar <jpawar@cadence.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Russell King <linux@armlinux.org.uk>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Qiang Yu <yuq825@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Melissa Wen <mwen@igalia.com>,
        linux-mediatek@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        linux-tegra@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        linux-mips@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: patches dropped from drm-misc-next [Was: Re: [PATCH 00/53] drm:
 Convert to platform remove callback returning] void
Message-ID: <20230619105342.ugf5gz26gcalcsi6@pengutronix.de>
References: <20230507162616.1368908-1-u.kleine-koenig@pengutronix.de>
 <20230601154002.uv2wfatpb7b45duz@pengutronix.de>
 <CAD=FV=WvP--wJwBQtnSoW_xb57R1Wf9dH0XzWxe+NorczXfeAw@mail.gmail.com>
 <20230617161222.wy55pbomnrrlfy5u@pengutronix.de>
 <CAD=FV=U5gbMUNteyyFcTvHVBDWzfthM0aDirJC+yXGovDwMOBA@mail.gmail.com>
 <20230618123915.hmy66z7e532jhwgk@pengutronix.de>
 <jlq2xayh4dxfigfsh2fms2kt4hlrqcwxblffmqq7czbhqhhvz7@hsvol72f5i3y>
 <20230618162950.6th2yo66baqay5mv@pengutronix.de>
 <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mvpkprqqq4uvoixx"
Content-Disposition: inline
In-Reply-To: <vxjp5c4wojcvbnp3ghsspwkgrc4mjmskzl56jkuxlgfhcji7kx@m3hg525p7y6a>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


--mvpkprqqq4uvoixx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 11:45:37AM +0200, Maxime Ripard wrote:
> On Sun, Jun 18, 2023 at 06:29:50PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > Hello Maxime,
> >=20
> > On Sun, Jun 18, 2023 at 04:32:55PM +0200, Maxime Ripard wrote:
> > > On Sun, Jun 18, 2023 at 02:39:15PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > > On Sat, Jun 17, 2023 at 10:57:23AM -0700, Doug Anderson wrote:
> > > > > On Sat, Jun 17, 2023 at 9:15=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > > > > <u.kleine-koenig@pengutronix.de> wrote:
> > > > > > Together with the patches that were applied later the topmost c=
ommit
> > > > > > from this series is c2807ecb5290 ("drm/omap: Convert to platfor=
m remove
> > > > > > callback returning void"). This commit was part for the followi=
ng next
> > > > > > tags:
> > > > > >
> > > > > >         $ git tag -l --contains c2807ecb5290
> > > > > >         next-20230609
> > > > > >         next-20230613
> > > > > >         next-20230614
> > > > > >         next-20230615
> > > > > >
> > > > > > However in next-20230616 they are missing. In next-20230616
> > > > > > drm-misc/for-linux-next was cf683e8870bd4be0fd6b98639286700a350=
88660.
> > > > > > Compared to c2807ecb5290 this adds 1149 patches but drops 37 (t=
hat are
> > > > > > also not included with a different commit id). The 37 patches d=
ropped
> > > > > > are 13cdd12a9f934158f4ec817cf048fcb4384aa9dc..c2807ecb5290:
> > > > > >
> > > > > >         $ git shortlog -s 13cdd12a9f934158f4ec817cf048fcb4384aa=
9dc..c2807ecb5290
> > > > > >              1  Christophe JAILLET
> > > > > >              2  Jessica Zhang
> > > > > >              5  Karol Wachowski
> > > > > >              1  Laura Nao
> > > > > >             27  Uwe Kleine-K=C3=B6nig
> > > > > >              1  Wang Jianzheng
> > > > > >
> > > > > >
> > > > > > I guess this was done by mistake because nobody told me about d=
ropping
> > > > > > my/these patches? Can c2807ecb5290 please be merged into drm-mi=
sc-next
> > > > > > again?
> > > > >=20
> > > > > Actually, it was probably a mistake that these patches got merged=
 to
> > > > > linuxnext during the 4 days that you noticed. However, your patch=
es
> > > > > aren't dropped and are still present in drm-misc-next.
> > > > >=20
> > > > > drm-misc has a bit of a unique model and it's documented fairly w=
ell here:
> > > > >=20
> > > > > https://drm.pages.freedesktop.org/maintainer-tools/drm-misc.html
> > > >=20
> > > > Is there a flaw then in this unique model (or its implementation) w=
hen
> > > > drm-misc/for-linux-next moves in a non-fast-forward manner? This is=
n't
> > > > expected, is it?
> > >=20
> > > There's no expectation afaik. Any tree merged in linux-next can be
> > > rebased, drop a patch, amend one, etc. without any concern.
> >=20
> > I agree that there are no rules broken for a tree that is included in
> > next and a maintainer is free to rewrite their tree independant of the
> > tree being included in next.
> >=20
> > Still I think that shouldn't be used as an excuse.
>=20
> As an excuse for what?

Just because the rules for trees in next allow the merged branch to be
rewritten, shouldn't be used to justify rewriting the branch.

IMHO you still should ensure that only commits make it into any next
snapshot via your tree before X-rc1 for some X (e.g. v6.5) that you
intend to be included in X-rc1.

> > For me, if a maintainer puts some patch into next that's a statement
> > saying (approximately) "I think this patch is fine and I intend to
> > send it to Linus during the next merge window.".
>=20
> I mean, that's what we're saying and doing?

No, on 2023-06-09 I assumed that my patches will go into v6.5-rc1 (as it
was part of next-20230609). A few days later however the patches were
dropped.

The two options that would have made the experience smoother for me are:

 a) keep c2807ecb5290 in next and send it for v6.5-rc1; or
 b) keep c2807ecb5290 in a branch that doesn't result it entering next
    before v6.5-rc1.

> > So my expectation is that if a patch is dropped again from next, there
> > was a problem and it would be fair if the maintainer tells the
> > author/submitter about this problem and that the patch was dropped.
>=20
> But it wasn't dropped,

=46rom my POV it was dropped from next as it was part of next between
next-20230609 and next-20230615 but not any more since next-20230616.
You talk about (not) being dropped from some branch in drm-misc, that's
irrelevant for the thing I'm complaining about.

> it's still very much to be sent to Linus during the next merge window.

"next merge window" as in the one leading to 6.5-rc1? Either we mean
different things when we say "next merge window", or there is a
misunderstanding I don't see yet.

Best regards
Uwe




--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mvpkprqqq4uvoixx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSQM7UACgkQj4D7WH0S
/k5Ixgf/Xgm0USxBI9N1ZZCA+kshTeAUthayxBg8SxLjieh642COZiY1XJeafq5D
0q+p03nZWDIWbfX9/OZIucjSM5yqLBSowvH88x8xpTpy7byu7BmMV4T+EJ5LGQk2
lgV8cjYF0QrYmMs2A3ALwGahaSL+rI+rv7EMepAYh5ZYrQ1QuNXOTUAGt8Km25fq
RGjQnUIMJOaB+24HEkSDBpFBFa1J8I/HbUH2udU8HWJ1rDJrlEk6frRM3tEi3rSk
CBOLLDzPWGGdPr4kOZrMoga8GnB0dLbjzVigb4kXbTYjfMHQtY2LX2d7pH45Snqs
rrU3Nu2sd/iPuOusJaoyii8/117yjA==
=SAIF
-----END PGP SIGNATURE-----

--mvpkprqqq4uvoixx--
