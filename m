Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F040C3CFE13
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 17:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239729AbhGTPFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 11:05:10 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:26743 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241745AbhGTOxZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 10:53:25 -0400
Date:   Tue, 20 Jul 2021 15:33:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1626795229;
        bh=d9Q3moj/2J34xlyehWoq/C7zP8ek1tDX6NiP55RbvIw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Xg4qOYPUk793e8ucsxhhTPL54VmfiqV/0bzSeQbgFfxV8qKVM5NUA24rdBHPJ4e5Y
         AaGfTk2+TPzflGIxx6u7Ij+n1ruwAtqH0fHGQMD7onBeH5v7m0g34KQTLuSHtczYBI
         0n95i5OOHJpze7akWJI1R8Gm0UHmMU53ssJeinMs=
To:     Caleb Connolly <caleb@connolly.tech>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: [PATCH 3/5] drm/panel/samsung-sofef00: make gpio optional
Message-ID: <20210720153125.43389-4-caleb@connolly.tech>
In-Reply-To: <20210720153125.43389-1-caleb@connolly.tech>
References: <20210720153125.43389-1-caleb@connolly.tech>
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

The OnePlus 6T panel fails to initialise if it has been reset,
workaround this by allowing panels to not specify a reset GPIO.

Signed-off-by: Caleb Connolly <caleb@connolly.tech>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/dr=
m/panel/panel-samsung-sofef00.c
index 8cb1853574bb..a20a5af14653 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -44,6 +44,8 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *=
panel)

 static void sofef00_panel_reset(struct sofef00_panel *ctx)
 {
+=09if (!ctx->reset_gpio)
+=09=09return;
 =09gpiod_set_value_cansleep(ctx->reset_gpio, 0);
 =09usleep_range(5000, 6000);
 =09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
@@ -137,7 +139,8 @@ static int sofef00_panel_prepare(struct drm_panel *pane=
l)
 =09ret =3D sofef00_panel_on(ctx);
 =09if (ret < 0) {
 =09=09dev_err(dev, "Failed to initialize panel: %d\n", ret);
-=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+=09=09if (ctx->reset_gpio)
+=09=09=09gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 =09=09return ret;
 =09}

@@ -276,7 +279,7 @@ static int sofef00_panel_probe(struct mipi_dsi_device *=
dsi)
 =09=09return ret;
 =09}

-=09ctx->reset_gpio =3D devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
+=09ctx->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIG=
H);
 =09if (IS_ERR(ctx->reset_gpio)) {
 =09=09ret =3D PTR_ERR(ctx->reset_gpio);
 =09=09dev_warn(dev, "Failed to get reset-gpios: %d\n", ret);
--
2.32.0


