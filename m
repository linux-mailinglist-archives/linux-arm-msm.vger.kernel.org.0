Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B0737099A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 03:43:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbhEBBnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 May 2021 21:43:49 -0400
Received: from mail-40133.protonmail.ch ([185.70.40.133]:55190 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231593AbhEBBnt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 May 2021 21:43:49 -0400
Date:   Sun, 02 May 2021 01:42:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1619919776;
        bh=Kl3Jo+OZEZzf10VJacbXDH3A1fF+G/d1ql1pz/OtWqI=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=a29YV91YarPuYd+ZgiO2zQf9fSlWHiDHo8E62fQRNqW4dxw2rUuwV3k27xSeHIJun
         fzVc8h5St4JjOlfqwfIbENSdGZft1O38P3GF9j4iUd65wI8WX/m5R7CxQpp7CTxILR
         acqjI8EZtPl8usqMEeAjOf2ksUxdHtP7JYiAtLlM=
To:     caleb@connolly.tech, Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 2/4] drm: panel: sofef00: remove reset GPIO handling
Message-ID: <20210502014146.85642-3-caleb@connolly.tech>
In-Reply-To: <20210502014146.85642-1-caleb@connolly.tech>
References: <20210502014146.85642-1-caleb@connolly.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Resetting the panel on fajita causes it to never come back, we aren't
quite sure why this is so for now lets remove reset handling as it is
effectively broken. It is also not needed on enchilada.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 26 +++----------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/dr=
m/panel/panel-samsung-sofef00.c
index 8cb1853574bb..cfc8b2a19742 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -23,7 +23,6 @@ struct sofef00_panel {
 =09struct drm_panel panel;
 =09struct mipi_dsi_device *dsi;
 =09struct regulator *supply;
-=09struct gpio_desc *reset_gpio;
 =09const struct drm_display_mode *mode;
 =09bool prepared;
 };
@@ -42,16 +41,6 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel =
*panel)
 =09=09=09return ret;=09=09=09=09=09\
 =09} while (0)
=20
-static void sofef00_panel_reset(struct sofef00_panel *ctx)
-{
-=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-=09usleep_range(5000, 6000);
-=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-=09usleep_range(2000, 3000);
-=09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
-=09usleep_range(12000, 13000);
-}
-
 static int sofef00_panel_on(struct sofef00_panel *ctx)
 {
 =09struct mipi_dsi_device *dsi =3D ctx->dsi;
@@ -132,12 +121,9 @@ static int sofef00_panel_prepare(struct drm_panel *pan=
el)
 =09=09return ret;
 =09}
=20
-=09sofef00_panel_reset(ctx);
-
 =09ret =3D sofef00_panel_on(ctx);
 =09if (ret < 0) {
 =09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
-=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 =09=09return ret;
 =09}
=20
@@ -155,8 +141,11 @@ static int sofef00_panel_unprepare(struct drm_panel *p=
anel)
 =09=09return 0;
=20
 =09ret =3D sofef00_panel_off(ctx);
-=09if (ret < 0)
+
+=09if (ret < 0) {
 =09=09dev_err(dev, "Failed to un-initialize panel: %d\n", ret);
+=09=09return ret;
+=09}
=20
 =09regulator_disable(ctx->supply);
=20
@@ -276,13 +265,6 @@ static int sofef00_panel_probe(struct mipi_dsi_device =
*dsi)
 =09=09return ret;
 =09}
=20
-=09ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
-=09if (IS_ERR(ctx->reset_gpio)) {
-=09=09ret =3D PTR_ERR(ctx->reset_gpio);
-=09=09dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
-=09=09return ret;
-=09}
-
 =09ctx->dsi =3D dsi;
 =09mipi_dsi_set_drvdata(dsi, ctx);
=20
--=20
2.30.2


