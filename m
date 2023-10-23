Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5773A7D2AB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Oct 2023 08:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbjJWGwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Oct 2023 02:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjJWGwO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Oct 2023 02:52:14 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9FA1DF;
        Sun, 22 Oct 2023 23:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1698043932; x=1729579932;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MTPB2jyLF8V6rKHNJMHWPgMnNtHctSiwV100Mn8tRLU=;
  b=IHQX1V34xhV3xZkO5DkRjQafpBQ5J/3uzEa0Un3BobKd3XEKtel/ctUv
   wZUoTAcSWwSaqZEnCiiQWtjywwUW7SVz9uKKE5RXCD08bbpduMOjpszjE
   8RYZQrFDiZ74YsDUdGBTzXu73JD8JXoQQtm2hDYS3dSxPHmNx4oXqhr82
   HHMnlFtpq5hgaGTQCjHj7waFO/WM4hQx/5LuNhxIxxBV34eY/eX6C4DO1
   oAaAYK/YsDRKIZkN5coEmpWWbf8yfoU6AGMmTGzoF3sLLW36ybpnzkUYO
   bo6qsSJNgTF5StRC7W9v1of5hcOCAcSXs7GuEQtfwlk0REzeiO/Dprjuq
   A==;
X-IronPort-AV: E=Sophos;i="6.03,244,1694728800"; 
   d="scan'208";a="33590902"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 23 Oct 2023 08:52:10 +0200
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 8636228007F;
        Mon, 23 Oct 2023 08:52:09 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Maxime Ripard <mripard@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Marek Vasut <marex@denx.de>, Robert Foss <rfoss@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        freedreno@lists.freedesktop.org
Subject: Re: [RFC PATCH 03/10] drm/mipi-dsi: add API for manual control over the DSI link power state
Date:   Mon, 23 Oct 2023 08:52:12 +0200
Message-ID: <1871104.tdWV9SEqCh@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAA8EJpoN36PHoZH=Osfn_wr7kO-dypius2ae_FuJ4Hk+gjeBtQ@mail.gmail.com>
References: <20231016165355.1327217-1-dmitry.baryshkov@linaro.org> <1907377.IobQ9Gjlxr@steina-w> <CAA8EJpoN36PHoZH=Osfn_wr7kO-dypius2ae_FuJ4Hk+gjeBtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

Am Sonntag, 22. Oktober 2023, 12:49:41 CEST schrieb Dmitry Baryshkov:
> On Thu, 19 Oct 2023 at 14:42, Alexander Stein
>=20
> <alexander.stein@ew.tq-group.com> wrote:
> > Hi,
> >=20
> > Am Donnerstag, 19. Oktober 2023, 13:19:51 CEST schrieb Dmitry Baryshkov:
> > > On Thu, 19 Oct 2023 at 12:26, Maxime Ripard <mripard@kernel.org> wrot=
e:
> > > > On Mon, Oct 16, 2023 at 07:53:48PM +0300, Dmitry Baryshkov wrote:
> > > > > The MIPI DSI links do not fully fall into the DRM callbacks model.
> > > >=20
> > > > Explaining why would help
> > >=20
> > > A kind of explanation comes afterwards, but probably I should change
> > > the order of the phrases and expand it:
> > >=20
> > > The atomic_pre_enable / atomic_enable and correspondingly
> > > atomic_disable / atomic_post_disable expect that the bridge links
> > > follow a simple paradigm: either it is off, or it is on and streaming
> > > video. Thus, it is fine to just enable the link at the enable time,
> > > doing some preparations during the pre_enable.
> > >=20
> > > But then it causes several issues with DSI. First, some of the DSI
> > > bridges and most of the DSI panels would like to send commands over
> > > the DSI link to setup the device. Next, some of the DSI hosts have
> > > limitations on sending the commands. The proverbial sunxi DSI host can
> > > not send DSI commands after the video stream has started. Thus most of
> > > the panels have opted to send all DSI commands from pre_enable (or
> > > prepare) callback (before the video stream has started).
> > >=20
> > > However this leaves no good place for the DSI host to power up the DSI
> > > link. By default the host's pre_enable callback is called after the
> > > DSI bridge's pre_enable. For quite some time we were powering up the
> > > DSI link from mode_set. This doesn't look fully correct. And also we
> > > got into the issue with ps8640 bridge, which requires for the DSI link
> > > to be quiet / unpowered at the bridge's reset time.
> >=20
> > There are also bridges (e.g. tc358767) which require DSI-LP11 upon brid=
ge
> > reset. And additionally this DSI-(e)DP bridge requires LP11 while
> > accessing
> > DP-AUX channel, e.g. reading EDID. So bridges need at least some control
> > over DSI line state.
>=20
> For sending commands in LP11 it is typical to toggle the
> MIPI_DSI_MODE_LPM flag, for example see panel-=3Djdi-lt070me05000.c or
> some other drives. It might be a good idea to make that more explicit.
> All suggestions here would be appreciated.

The biggest difference between that display and the tc358767 bridge is that=
=20
the display uses DSI commands, while the bridge is using i2c transfer to is=
sue=20
DP-AUX commands. There is no host_transfer [1] which would enable LP-11.
It seems this DSI-DP bridge requires LP-11/HS on DSI lanes all times. This=
=20
contradicts current Linux behaviour.

Best regards,
Alexander

[1] https://www.kernel.org/doc/html/latest/gpu/drm-kms-helpers.html#mipi-ds=
i-bridge-operation

>=20
> > > Dave has come with the idea of pre_enable_prev_first /
> > > prepare_prev_first flags, which attempt to solve the issue by
> > > reversing the order of pre_enable callbacks. This mostly solves the
> > > issue. However during this cycle it became obvious that this approach
> > > is not ideal too. There is no way for the DSI host to know whether the
> > > DSI panel / bridge has been updated to use this flag or not, see the
> > > discussion at [1].
> > >=20
> > > Thus comes this proposal. It allows for the panels to explicitly bring
> > > the link up and down at the correct time, it supports automatic use
> > > case, where no special handling is required. And last, but not least,
> > > it allows the DSI host to note that the bridge / panel were not
> > > updated to follow new protocol and thus the link should be powered on
> > > at the mode_set time. This leaves us with the possibility of dropping
> > > support for this workaround once all in-kernel drivers are updated.
> >=20
> > I want to use this series to support tc358767 properly, because
> > pre_enable_prev_first is not enough, see AUX channel above. I hope I'll
> > find any time soon.
> >=20
> > Best regards,
> > Alexander
> >=20
> > > > > The drm_bridge_funcs abstraction.
> > > >=20
> > > > Is there a typo or missing words?
> > >=20
> > > missing comma in front of The
> > >=20
> > > > > Instead of having just two states (off and on) the DSI hosts have
> > > > > separate LP-11 state. In this state the host is on, but the video
> > > > > stream is not yet enabled.
> > > > >=20
> > > > > Introduce API that allows DSI bridges / panels to control the DSI
> > > > > host
> > > > > power up state.
> > >=20
> > > [1]
> > > https://lore.kernel.org/dri-devel/6c0dd9fd-5d8e-537c-804f-7a03d5899a0=
7@l
> > > ina
> > > ro.org/
> > >=20
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > ---
> > > > >=20
> > > > >  drivers/gpu/drm/drm_mipi_dsi.c | 31 ++++++++++++++++++++++++++++=
+++
> > > > >  include/drm/drm_mipi_dsi.h     | 29 +++++++++++++++++++++++++----
> > > > >  2 files changed, 56 insertions(+), 4 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/drm_mipi_dsi.c
> > > > > b/drivers/gpu/drm/drm_mipi_dsi.c index 14201f73aab1..c467162cb7d8
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/drm_mipi_dsi.c
> > > > > +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> > > > > @@ -428,6 +428,37 @@ int devm_mipi_dsi_attach(struct device *dev,
> > > > >=20
> > > > >  }
> > > > >  EXPORT_SYMBOL_GPL(devm_mipi_dsi_attach);
> > > > >=20
> > > > > +bool mipi_dsi_host_power_control_available(struct mipi_dsi_host
> > > > > *host)
> > > > > +{
> > > > > +     const struct mipi_dsi_host_ops *ops =3D host->ops;
> > > > > +
> > > > > +     return ops && ops->power_up;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_control_available);
> > > > > +
> > > > > +int mipi_dsi_host_power_up(struct mipi_dsi_host *host)
> > > > > +{
> > > > > +     const struct mipi_dsi_host_ops *ops =3D host->ops;
> > > > > +
> > > > > +     if (!mipi_dsi_host_power_control_available(host))
> > > > > +             return -EOPNOTSUPP;
> > > > > +
> > > > > +     return ops->power_up ? ops->power_up(host) : 0;
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_up);
> > > > > +
> > > > > +void mipi_dsi_host_power_down(struct mipi_dsi_host *host)
> > > > > +{
> > > > > +     const struct mipi_dsi_host_ops *ops =3D host->ops;
> > > > > +
> > > > > +     if (!mipi_dsi_host_power_control_available(host))
> > > > > +             return;
> > > > > +
> > > > > +     if (ops->power_down)
> > > > > +             ops->power_down(host);
> > > > > +}
> > > > > +EXPORT_SYMBOL_GPL(mipi_dsi_host_power_down);
> > > > > +
> > > >=20
> > > > If this API is supposed to be used by DSI devices, it should probab=
ly
> > > > take a mipi_dsi_device pointer as a parameter?
> > >=20
> > > Ack.
> > >=20
> > > > We should probably make sure it hasn't been powered on already too?
> > >=20
> > > Ack, I can add an atomic count there and a WARN_ON. However I don't
> > > think that it is a real problem.
> > >=20
> > > > Maxime
> > >=20
> > > --
> > > With best wishes
> > >=20
> > > Dmitry
> >=20
> > --
> > TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
> > Amtsgericht M=FCnchen, HRB 105018
> > Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
> > http://www.tq-group.com/


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


