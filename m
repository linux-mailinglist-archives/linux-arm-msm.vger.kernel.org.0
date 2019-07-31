Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2889F7CCF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 21:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbfGaTji (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 15:39:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56132 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfGaTji (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 15:39:38 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1BF22289F21
Message-ID: <869dd8b894883715378ba681c7dd26934284bdff.camel@collabora.com>
Subject: Re: [PATCH v4 14/23] drm/tilcdc: Provide ddc symlink in connector
 sysfs directory
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
        linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, Sean Paul <sean@poorly.run>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        Kukjin Kim <kgene@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dave Airlie <airlied@redhat.com>,
        Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        linux-mediatek@lists.infradead.org,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Vincent Abriou <vincent.abriou@st.com>,
        linux-arm-kernel@lists.infradead.org,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        amd-gfx@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Douglas Anderson <dianders@chromium.org>,
        Todor Tomov <todor.tomov@linaro.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Huang Rui <ray.huang@amd.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        freedreno@lists.freedesktop.org,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Gerd Hoffmann <kraxel@redhat.com>
Date:   Wed, 31 Jul 2019 16:39:13 -0300
In-Reply-To: <acfd895d-ab59-0190-e25c-1827bd8d214b@suse.de>
References: <cover.1562843413.git.andrzej.p@collabora.com>
         <d1d415022c598fb7acd033f0f322dd67250adaa9.1562843413.git.andrzej.p@collabora.com>
         <20190723090532.GA787@ravnborg.org>
         <3ad60be5-49cf-4017-4b74-53a2d6272deb@collabora.com>
         <acfd895d-ab59-0190-e25c-1827bd8d214b@suse.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

I'm glad to see this work moving forward!

On Wed, 2019-07-24 at 10:01 +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.07.19 um 14:44 schrieb Andrzej Pietrasiewicz:
> > Hi Sam,
> > 
> > W dniu 23.07.2019 o 11:05, Sam Ravnborg pisze:
> > > Hi Andrzej
> > > 
> > > On Thu, Jul 11, 2019 at 01:26:41PM +0200, Andrzej Pietrasiewicz wrote:
> > > > Use the ddc pointer provided by the generic connector.
> > > > 
> > > > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> > > > ---
> > > >   drivers/gpu/drm/tilcdc/tilcdc_tfp410.c | 1 +
> > > >   1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
> > > > b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
> > > > index 62d014c20988..c373edb95666 100644
> > > > --- a/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
> > > > +++ b/drivers/gpu/drm/tilcdc/tilcdc_tfp410.c
> > > > @@ -219,6 +219,7 @@ static struct drm_connector
> > > > *tfp410_connector_create(struct drm_device *dev,
> > > >       tfp410_connector->mod = mod;
> > > >         connector = &tfp410_connector->base;
> > > > +    connector->ddc = mod->i2c;
> > > >         drm_connector_init(dev, connector, &tfp410_connector_funcs,
> > > >               DRM_MODE_CONNECTOR_DVID);
> > > 
> > > When reading this code, it looks strange that we set connector->ddc
> > > *before* the call to init the connector.
> > > One could risk that drm_connector_init() used memset(..) to clear all
> > > fields or so, and it would break this order.
> > 
> > I verified the code of drm_connector_init() and cannot find any memset()
> > invocations there. What is your actual concern?
> 
> I think this echoes my concern about the implicit order of operation. It
> seems too easy to get this wrong. If you don't want to add an additional
> interface for setting the ddc field, why not add a dedicated initializer
> function that sets the ddc field? Something like this.
> 
> int drm_connector_init_with_ddc(connector, funcs, ..., ddc)
> {
> 	ret = drm_connector_init(connector, funcs, ...);
> 	if (ret)
> 		return ret;
> 
> 	if (!ddc)
> 		return 0;
> 
> 	connector->ddc = ddc;
> 	/* set up sysfs */
> 

I know this comment comes late to the party, but I'm a slightly
suprised to see the above instead of implementing drm_connector_init
in terms of drm_connector_init_with_ddc, as we typically do.

Namely, something along these lines (code might not even build!):

--------------------------------------8<-----------------------------
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d49e19f3de3a..dbd095933175 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -179,11 +179,12 @@ void drm_connector_free_work_fn(struct work_struct *work)
 }
 
 /**
- * drm_connector_init - Init a preallocated connector
+ * drm_connector_init_with_ddc - Init a preallocated connector
  * @dev: DRM device
  * @connector: the connector to init
  * @funcs: callbacks for this connector
  * @connector_type: user visible type of the connector
+ * @ddc: pointer to the associated ddc adapter (optional)
  *
  * Initialises a preallocated connector. Connectors should be
  * subclassed as part of driver connector objects.
@@ -191,10 +192,11 @@ void drm_connector_free_work_fn(struct work_struct *work)
  * Returns:
  * Zero on success, error code on failure.
  */
-int drm_connector_init(struct drm_device *dev,
-		       struct drm_connector *connector,
-		       const struct drm_connector_funcs *funcs,
-		       int connector_type)
+int drm_connector_init_with_ddc(struct drm_device *dev,
+				struct drm_connector *connector,
+				const struct drm_connector_funcs *funcs,
+				int connector_type,
+				struct i2c_adapter *ddc)
 {
 	struct drm_mode_config *config = &dev->mode_config;
 	int ret;
@@ -215,6 +217,9 @@ int drm_connector_init(struct drm_device *dev,
 	connector->dev = dev;
 	connector->funcs = funcs;
 
+	/* provide ddc symlink in sysfs */
+	connector->ddc = ddc;
+
 	/* connector index is used with 32bit bitmasks */
 	ret = ida_simple_get(&config->connector_ida, 0, 32, GFP_KERNEL);
 	if (ret < 0) {
@@ -295,41 +300,6 @@ int drm_connector_init(struct drm_device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL(drm_connector_init);
-
-/**
- * drm_connector_init_with_ddc - Init a preallocated connector
- * @dev: DRM device
- * @connector: the connector to init
- * @funcs: callbacks for this connector
- * @connector_type: user visible type of the connector
- * @ddc: pointer to the associated ddc adapter
- *
- * Initialises a preallocated connector. Connectors should be
- * subclassed as part of driver connector objects.
- *
- * Ensures that the ddc field of the connector is correctly set.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drm_connector_init_with_ddc(struct drm_device *dev,
-				struct drm_connector *connector,
-				const struct drm_connector_funcs *funcs,
-				int connector_type,
-				struct i2c_adapter *ddc)
-{
-	int ret;
-
-	ret = drm_connector_init(dev, connector, funcs, connector_type);
-	if (ret)
-		return ret;
-
-	/* provide ddc symlink in sysfs */
-	connector->ddc = ddc;
-
-	return ret;
-}
 EXPORT_SYMBOL(drm_connector_init_with_ddc);
 
 /**
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fc5d08438333..1884abf61a86 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1408,10 +1408,6 @@ struct drm_connector {
 
 #define obj_to_connector(x) container_of(x, struct drm_connector, base)
 
-int drm_connector_init(struct drm_device *dev,
-		       struct drm_connector *connector,
-		       const struct drm_connector_funcs *funcs,
-		       int connector_type);
 int drm_connector_init_with_ddc(struct drm_device *dev,
 				struct drm_connector *connector,
 				const struct drm_connector_funcs *funcs,
@@ -1425,6 +1421,16 @@ int drm_connector_attach_encoder(struct drm_connector *connector,
 
 void drm_connector_cleanup(struct drm_connector *connector);
 
+static inline int
+drm_connector_init(struct drm_device *dev,
+		   struct drm_connector *connector,
+		   const struct drm_connector_funcs *funcs,
+		   int connector_type);
+{
+	return drm_connector_init_with_ddc(dev, connector, funcs,
+					   connector_type, NULL);
+}
+
 static inline unsigned int drm_connector_index(const struct drm_connector *connector)
 {
 	return connector->index;
-------------------------------------->8-----------------------------

This might be seen as bikeshed but it seems there's value keeping all the init
code in the same place, as opposed to scattered.

Unless there are reasons for the current code, that I'm missing?

Thanks,
Ezequiel

