Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A56C45F83B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 14:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727700AbfGDMfe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 08:35:34 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53630 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbfGDMfe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 08:35:34 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 69B8E24B;
        Thu,  4 Jul 2019 14:35:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1562243731;
        bh=Qy9c/09MoK7SKFzpRxhQz3bdVH0WPLajOMka0caqEwE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D1iCIfxwE6MEBVnRGgssAZK9cHdcIL5jUXXBTcisAWjBswdN3fLX6KsiirANkTaja
         R10vuXCMHzidW0cyVoFyl+0k8hqBHIvvox06FKf5bA3w6MvEIEE/RahqHQWVmxSLuk
         QN6R33ivSnFPkHRMLENdMKrpT/hmLxucTNhb3NC0=
Date:   Thu, 4 Jul 2019 15:35:11 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
Message-ID: <20190704123511.GG6569@pendragon.ideasonboard.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
 <CGME20190702154441epcas2p2cba89e3a84216d9a8da43438a9648e03@epcas2p2.samsung.com>
 <20190702154419.20812-3-robdclark@gmail.com>
 <1b56a11c-194d-0eca-4dd1-48e91820eafb@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1b56a11c-194d-0eca-4dd1-48e91820eafb@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

On Thu, Jul 04, 2019 at 02:31:20PM +0200, Andrzej Hajda wrote:
> On 02.07.2019 17:44, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Add a debugfs file to show status registers.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 42 +++++++++++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index f1a2493b86d9..a6f27648c015 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -5,6 +5,7 @@
> >   */
> >  
> >  #include <linux/clk.h>
> > +#include <linux/debugfs.h>
> >  #include <linux/gpio/consumer.h>
> >  #include <linux/i2c.h>
> >  #include <linux/iopoll.h>
> > @@ -109,6 +110,7 @@ struct ti_sn_bridge {
> >  	struct drm_dp_aux		aux;
> >  	struct drm_bridge		bridge;
> >  	struct drm_connector		connector;
> > +	struct dentry			*debugfs;
> >  	struct device_node		*host_node;
> >  	struct mipi_dsi_device		*dsi;
> >  	struct clk			*refclk;
> > @@ -178,6 +180,42 @@ static const struct dev_pm_ops ti_sn_bridge_pm_ops = {
> >  	SET_RUNTIME_PM_OPS(ti_sn_bridge_suspend, ti_sn_bridge_resume, NULL)
> >  };
> >  
> > +static int status_show(struct seq_file *s, void *data)
> > +{
> > +	struct ti_sn_bridge *pdata = s->private;
> > +	unsigned int reg, val;
> > +
> > +	seq_puts(s, "STATUS REGISTERS:\n");

NO NEED TO SHOUT :-)

> > +
> > +	pm_runtime_get_sync(pdata->dev);
> > +
> > +	/* IRQ Status Registers, see Table 31 in datasheet */
> > +	for (reg = 0xf0; reg <= 0xf8; reg++) {
> > +		regmap_read(pdata->regmap, reg, &val);
> > +		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
> > +	}
> > +
> > +	pm_runtime_put(pdata->dev);
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_SHOW_ATTRIBUTE(status);
> > +
> > +static void ti_sn_debugfs_init(struct ti_sn_bridge *pdata)
> > +{
> > +	pdata->debugfs = debugfs_create_dir("ti_sn65dsi86", NULL);
> 
> If some day we will have board with two such bridges there will be a
> problem.

Could we use the platform device name for this ?

> Anyway:
> 
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> 
> > +
> > +	debugfs_create_file("status", 0600, pdata->debugfs, pdata,
> > +			&status_fops);
> > +}
> > +
> > +static void ti_sn_debugfs_remove(struct ti_sn_bridge *pdata)
> > +{
> > +	debugfs_remove_recursive(pdata->debugfs);
> > +	pdata->debugfs = NULL;
> > +}
> > +

You need to conditionally-compile this based on CONFIG_DEBUG_FS.

> >  /* Connector funcs */
> >  static struct ti_sn_bridge *
> >  connector_to_ti_sn_bridge(struct drm_connector *connector)
> > @@ -869,6 +907,8 @@ static int ti_sn_bridge_probe(struct i2c_client *client,
> >  
> >  	drm_bridge_add(&pdata->bridge);
> >  
> > +	ti_sn_debugfs_init(pdata);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -879,6 +919,8 @@ static int ti_sn_bridge_remove(struct i2c_client *client)
> >  	if (!pdata)
> >  		return -EINVAL;
> >  
> > +	ti_sn_debugfs_remove(pdata);
> > +
> >  	of_node_put(pdata->host_node);
> >  
> >  	pm_runtime_disable(pdata->dev);

-- 
Regards,

Laurent Pinchart
