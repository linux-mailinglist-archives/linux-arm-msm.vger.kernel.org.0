Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 389E975257D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 16:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbjGMOtO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 10:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbjGMOtD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 10:49:03 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DBDD271E
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 07:48:58 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-55af0a816e4so476001a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 07:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689259737; x=1691851737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKItIj72hAMISxrHuiptAazhKs3+4zy1JRueUjGy5Ew=;
        b=Lvde23Te+GFT0orVoR/P+JhRQnexaWNX8EOgVrjUleu3E01MUg+kGWaqPxkNsc7wxp
         WkHs6A1ISVofl842kC9uzkxWkIdBz+UeNE+68YTBp5Pai7/ZdELw82UHkfJV+hD6ef5B
         dSOPXJ/Q8C8lGS02jNM6U1QYscbZiz8lO28nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689259737; x=1691851737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKItIj72hAMISxrHuiptAazhKs3+4zy1JRueUjGy5Ew=;
        b=cQdshkl3A7dJduPAufv/iXzj/65y1B03Xj1XI4VN+NGnk4Ef8sL3jUSJm1PP6J/zcj
         FVzX7BZfklD9KHtxAkdJimJ3YUV2AOzzhYOZjt9eM5NYNYLI9luNKI/q5N2YGamy+g8o
         9J7Sqny1DfCkKaQzGk5o7srnwdTX1Ou9exWHWUs65jArLGE4ptwIFuaMClsXOWyrKAoU
         ny0xv1dZMvSdwHdMuYeP6xtOdEyqn8/FbAIyeOadmP6WnwaIsjUV0omt0+hEYZ+2YDn4
         GTnXT8Mypi1qw9Uo+VMYBvMTI1sMIPJ5PeljoIbgoCwTJ13CqQj2Iz7qU1tJXueq6Eu4
         pQ9Q==
X-Gm-Message-State: ABy/qLai+8FUpP5JDDIGIhGY6A6EIVj0BLOoLxuEds5qTY/DvozYoiqS
        zBGYp78o4HgNqplsR1UHfO4es8DwMHDNj35inIIZlQ==
X-Google-Smtp-Source: APBJJlGRDUb4dkb2klmqZPNRwlr8B9ztRjhUncoux8EAGQwQNzj5yoxJIlIHA2YcUgN3wR0d6Vekaw==
X-Received: by 2002:a17:903:228b:b0:1b8:3590:358a with SMTP id b11-20020a170903228b00b001b83590358amr1343307plh.19.1689259737236;
        Thu, 13 Jul 2023 07:48:57 -0700 (PDT)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com. [209.85.210.172])
        by smtp.gmail.com with ESMTPSA id bc1-20020a170902930100b001b3fb2f0296sm6030398plb.120.2023.07.13.07.48.56
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jul 2023 07:48:56 -0700 (PDT)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6687096c6ddso561385b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 07:48:56 -0700 (PDT)
X-Received: by 2002:a05:6902:211:b0:c8b:3:e399 with SMTP id
 j17-20020a056902021100b00c8b0003e399mr1398441ybs.44.1689259342555; Thu, 13
 Jul 2023 07:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
 <87fs5tgpvv.fsf@intel.com> <CAOw6vbLO_UaXDbTCtAQJgthXOUMPqEV+c2MQhP-1DuK44OhGxw@mail.gmail.com>
 <20230713130337.fd2l67r23g2irifx@pengutronix.de>
In-Reply-To: <20230713130337.fd2l67r23g2irifx@pengutronix.de>
From:   Sean Paul <seanpaul@chromium.org>
Date:   Thu, 13 Jul 2023 10:41:45 -0400
X-Gmail-Original-Message-ID: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
Message-ID: <CAOw6vbKtjyUm+OqO7LSV1hDOMQATwkEWP4GzBbbXib0i5EviUQ@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH RFC v1 00/52] drm/crtc: Rename struct
 drm_crtc::dev to drm_dev
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Alexey Kodanev <aleksei.kodanev@bell-sw.com>,
        dri-devel@lists.freedesktop.org,
        Vandita Kulkarni <vandita.kulkarni@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Arun R Murthy <arun.r.murthy@intel.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Liu Shixin <liushixin2@huawei.com>,
        linux-samsung-soc@vger.kernel.org,
        Samuel Holland <samuel@sholland.org>,
        Matt Roper <matthew.d.roper@intel.com>,
        Wenjing Liu <wenjing.liu@amd.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Danilo Krummrich <dakr@redhat.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        spice-devel@lists.freedesktop.org,
        Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
        linux-sunxi@lists.linux.dev, Stylon Wang <stylon.wang@amd.com>,
        Tim Huang <Tim.Huang@amd.com>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
        Andi Shyti <andi.shyti@linux.intel.com>,
        Yifan Zhang <yifan1.zhang@amd.com>,
        Leo Li <sunpeng.li@amd.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Hersen Wu <hersenxs.wu@amd.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
        Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
        =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>,
        Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        kernel@pengutronix.de, Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Zack Rusin <zackr@vmware.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
        Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
        =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
        virtualization@lists.linux-foundation.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Yongqin Liu <yongqin.liu@linaro.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Fei Yang <fei.yang@intel.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        David Lechner <david@lechnology.com>,
        Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
        "Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
        David Francis <David.Francis@amd.com>,
        Aaron Liu <aaron.liu@amd.com>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        linux-rockchip@lists.infradead.org,
        Fangzhi Zuo <jerry.zuo@amd.com>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        VMware Graphics Reviewers 
        <linux-graphics-maintainer@vmware.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        =?UTF-8?Q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>,
        Dave Airlie <airlied@redhat.com>, linux-mips@vger.kernel.org,
        Gurchetan Singh <gurchetansingh@chromium.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-arm-msm@vger.kernel.org,
        Animesh Manna <animesh.manna@intel.com>,
        linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <mripard@kernel.org>,
        Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-amlogic@lists.infradead.org, Evan Quan <evan.quan@amd.com>,
        Michal Simek <michal.simek@amd.com>,
        linux-arm-kernel@lists.infradead.org, Sean Paul <sean@poorly.run>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Sandy Huang <hjc@rock-chips.com>,
        Swati Sharma <swati2.sharma@intel.com>,
        John Stultz <jstultz@google.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Drew Davenport <ddavenport@chromium.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Hawking Zhang <Hawking.Zhang@amd.com>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Anusha Srivatsa <anusha.srivatsa@intel.com>,
        Dan Carpenter <error27@gmail.com>,
        Karol Herbst <kherbst@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        linux-hyperv@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
        Melissa Wen <melissa.srw@gmail.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
        Luca Coelho <luciano.coelho@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Likun Gao <Likun.Gao@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Deepak Rawat <drawat.floss@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>, Joel Stanley <joel@jms.id.au>,
        Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Alan Liu <haoping.liu@amd.com>,
        Philip Yang <Philip.Yang@amd.com>,
        Lyude Paul <lyude@redhat.com>, intel-gfx@lists.freedesktop.org,
        Alison Wang <alison.wang@nxp.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Gustavo Sousa <gustavo.sousa@intel.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
        Tomi Valkeinen <tomba@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Chia-I Wu <olvaffe@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        Shawn Guo <shawnguo@kernel.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Khaled Almahallawy <khaled.almahallawy@intel.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Emma Anholt <emma@anholt.net>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Imre Deak <imre.deak@intel.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Roman Li <roman.li@amd.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Rob Clark <robdclark@gmail.com>,
        Hamza Mahfooz <hamza.mahfooz@amd.com>,
        David Airlie <airlied@gmail.com>, Marek Vasut <marex@denx.de>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        xen-devel@lists.xenproject.org, Guchun Chen <guchun.chen@amd.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Russell King <linux@armlinux.org.uk>,
        Uma Shankar <uma.shankar@intel.com>,
        Mika Kahola <mika.kahola@intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Vinod Govindapillai <vinod.govindapillai@intel.com>,
        linux-tegra@vger.kernel.org,
        =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= 
        <samsagax@gmail.com>, Melissa Wen <mwen@igalia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-mediatek@lists.infradead.org,
        Fabio Estevam <festevam@gmail.com>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        David Tadokoro <davidbtadokoro@usp.br>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        amd-gfx@lists.freedesktop.org, Jyri Sarha <jyri.sarha@iki.fi>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Daniel Vetter <daniel@ffwll.ch>, Wayne Lin <Wayne.Lin@amd.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
        Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 13, 2023 at 9:04=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> hello Sean,
>
> On Wed, Jul 12, 2023 at 02:31:02PM -0400, Sean Paul wrote:
> > I'd really prefer this patch (series or single) is not accepted. This
> > will cause problems for everyone cherry-picking patches to a
> > downstream kernel (LTS or distro tree). I usually wouldn't expect
> > sympathy here, but the questionable benefit does not outweigh the cost
> > IM[biased]O.
>
> I agree that for backports this isn't so nice. However with the split
> approach (that was argumented against here) it's not soo bad. Patch #1
> (and similar changes for the other affected structures) could be
> trivially backported and with that it doesn't matter if you write dev or
> drm (or whatever name is chosen in the end); both work in the same way.

Patch #1 avoids the need to backport the entire set, however every
change occuring after the rename patches will cause conflicts on
future cherry-picks. Downstream kernels will have to backport the
whole set. Backporting the entire set will create an epoch in
downstream kernels where cherry-picking patches preceding this set
will need to undergo conflict resolution as well. As mentioned in my
previous email, I don't expect sympathy here, it's part of maintaining
a downstream kernel, but there is a real cost to kernel consumers.

>
> But even with the one-patch-per-rename approach I'd consider the
> renaming a net win, because ease of understanding code has a big value.
> It's value is not so easy measurable as "conflicts when backporting",
> but it also matters in say two years from now, while backporting
> shouldn't be an issue then any more.

You've rightly identified the conjecture in your statement. I've been
on both sides of the argument, having written/maintained drm code
upstream and cherry-picked changes to a downstream kernel. Perhaps
it's because drm's definition of dev is ingrained in my muscle memory,
or maybe it's because I don't do a lot of upstream development these
days, but I just have a hard time seeing the benefit here.

I appreciate your engagement on the topic, thank you!

Sean

>
> Thanks for your input, best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|
