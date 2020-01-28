Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E43EF14B032
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2020 08:20:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725927AbgA1HUK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jan 2020 02:20:10 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:45179 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgA1HUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jan 2020 02:20:09 -0500
Received: by mail-pl1-f195.google.com with SMTP id b22so4735138pls.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 23:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7R7YtpG8iVvXfn7CvZ3qb+2BCwVHp1MVbsIwr3CIt7Q=;
        b=ljX5mrxIF1ZgYCJRaEmepMhjGMSLKTxqg3WjItfw21BRuepVZGSVw74dHUNe8k/dul
         8NeoJ2+VQXvgdZFw8LMMvcyemSB3I80F/KzZPegh+lzOB6B2scEWWGEaC2A8NXL4dCpB
         p+RdY1H0mx+sLkl76foxuGRmbpMsHmv1WcAT3+kCv3x4XTg2qgx2UBjhC+3HM/PtPen6
         F7v60dtGgX4tqfxOZOhvNUNHYU0UD7CmFNw3pPqYMEnFdGUmbrAKZ/12bSYdCr6xQeey
         pDTVWV7E7Dn13tYivNF3HTH7xMsInxN/rFxgcD88h6BS44dycyedRUFMix41fV7v0Jdo
         t/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7R7YtpG8iVvXfn7CvZ3qb+2BCwVHp1MVbsIwr3CIt7Q=;
        b=GHQCEM4KOUoU6sbr5sL3zNV1XpgnquZcjdQQAjgwyO2Kb9+U1zsdTJMnoWnSyjU0ME
         2JO5/ZY8ctyCrrPGyzH3V1C0Y0PSklqBpSYVp/cl0+g9SWlc7lteiAHoIdJJWEO/ZQCT
         vMY5tBmOejxsaGdYt0+jkyfQ1RUEB/AB583FcPUcL0hbmWmBCweUw07Ahik2lvpQqonr
         1+PBxrxXKhAkO2vvLwtH0ks2DUa0a9yxcle/sDAPqfq4Ph+6AjaN35O4r/7cF2LpFl1k
         F/EshZJYJyz8BW6o1vZEVDDMjzGggff85+SbJtbB3UN0z4v+YFebgDdBafh5MWsrrGXW
         uUAw==
X-Gm-Message-State: APjAAAUkbOQkW9L9A3KnETrCeeBlCb6xomWyBzBgxdckZeW6vuOBjy8q
        J3hDpyMNFq2G7KmAaMpwQWFn
X-Google-Smtp-Source: APXvYqxZSZMsIrRUa3idAW0J8qdykkZa9oER8BCtyuJZMpUvfQ+lezhc8VzPqxff31SE/INFXVJJgQ==
X-Received: by 2002:a17:902:d205:: with SMTP id t5mr21692999ply.138.1580196007900;
        Mon, 27 Jan 2020 23:20:07 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:51b:fd92:c4d8:fa98:b986:266d])
        by smtp.gmail.com with ESMTPSA id x22sm19627975pgc.2.2020.01.27.23.20.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2020 23:20:06 -0800 (PST)
Date:   Tue, 28 Jan 2020 12:49:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     gregkh@linuxfoundation.org, arnd@arndb.de, smohanad@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200128071957.GB27811@Mani-XPS-13-9360>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <c8fdf0b0-eaec-9672-4f43-f0254d6dbf0e@codeaurora.org>
 <e65a43a0-b737-a2cd-5cfe-f150e0831d84@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e65a43a0-b737-a2cd-5cfe-f150e0831d84@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jan 26, 2020 at 04:58:49PM -0700, Jeffrey Hugo wrote:
> On 1/23/2020 10:05 AM, Jeffrey Hugo wrote:
> > On 1/23/2020 4:18 AM, Manivannan Sadhasivam wrote:
> > > This commit adds support for registering MHI controller drivers with
> > > the MHI stack. MHI controller drivers manages the interaction with the
> > > MHI client devices such as the external modems and WiFi chipsets. They
> > > are also the MHI bus master in charge of managing the physical link
> > > between the host and client device.
> > > 
> > > This is based on the patch submitted by Sujeev Dias:
> > > https://lkml.org/lkml/2018/7/9/987
> > > 
> > > Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> > > Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> > > [jhugo: added static config for controllers and fixed several bugs]
> > > Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > [mani: removed DT dependency, splitted and cleaned up for upstream]
> > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > ---
> > >   drivers/bus/Kconfig             |   1 +
> > >   drivers/bus/Makefile            |   3 +
> > >   drivers/bus/mhi/Kconfig         |  14 +
> > >   drivers/bus/mhi/Makefile        |   2 +
> > >   drivers/bus/mhi/core/Makefile   |   3 +
> > >   drivers/bus/mhi/core/init.c     | 404 +++++++++++++++++++++++++++++
> > >   drivers/bus/mhi/core/internal.h | 169 ++++++++++++
> > >   include/linux/mhi.h             | 438 ++++++++++++++++++++++++++++++++
> > >   include/linux/mod_devicetable.h |  12 +
> > >   9 files changed, 1046 insertions(+)
> > >   create mode 100644 drivers/bus/mhi/Kconfig
> > >   create mode 100644 drivers/bus/mhi/Makefile
> > >   create mode 100644 drivers/bus/mhi/core/Makefile
> > >   create mode 100644 drivers/bus/mhi/core/init.c
> > >   create mode 100644 drivers/bus/mhi/core/internal.h
> > >   create mode 100644 include/linux/mhi.h
> > > 
> > > diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
> > > index 50200d1c06ea..383934e54786 100644
> > > --- a/drivers/bus/Kconfig
> > > +++ b/drivers/bus/Kconfig
> > > @@ -202,5 +202,6 @@ config DA8XX_MSTPRI
> > >         peripherals.
> > >   source "drivers/bus/fsl-mc/Kconfig"
> > > +source "drivers/bus/mhi/Kconfig"
> > >   endmenu
> > > diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
> > > index 1320bcf9fa9d..05f32cd694a4 100644
> > > --- a/drivers/bus/Makefile
> > > +++ b/drivers/bus/Makefile
> > > @@ -34,3 +34,6 @@ obj-$(CONFIG_UNIPHIER_SYSTEM_BUS)    +=
> > > uniphier-system-bus.o
> > >   obj-$(CONFIG_VEXPRESS_CONFIG)    += vexpress-config.o
> > >   obj-$(CONFIG_DA8XX_MSTPRI)    += da8xx-mstpri.o
> > > +
> > > +# MHI
> > > +obj-$(CONFIG_MHI_BUS)        += mhi/
> > > diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
> > > new file mode 100644
> > > index 000000000000..a8bd9bd7db7c
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/Kconfig
> > > @@ -0,0 +1,14 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > 
> > first time I noticed this, although I suspect this will need to be
> > corrected "everywhere" -
> > Per the SPDX website, the "GPL-2.0" label is deprecated.  It's
> > replacement is "GPL-2.0-only".
> > I think all instances should be updated to "GPL-2.0-only"
> > 
> > > +#
> > > +# MHI bus
> > > +#
> > > +# Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> > > +#
> > > +
> > > +config MHI_BUS
> > > +       tristate "Modem Host Interface (MHI) bus"
> > > +       help
> > > +     Bus driver for MHI protocol. Modem Host Interface (MHI) is a
> > > +     communication protocol used by the host processors to control
> > > +     and communicate with modem devices over a high speed peripheral
> > > +     bus or shared memory.
> > > diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
> > > new file mode 100644
> > > index 000000000000..19e6443b72df
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/Makefile
> > > @@ -0,0 +1,2 @@
> > > +# core layer
> > > +obj-y += core/
> > > diff --git a/drivers/bus/mhi/core/Makefile
> > > b/drivers/bus/mhi/core/Makefile
> > > new file mode 100644
> > > index 000000000000..2db32697c67f
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/core/Makefile
> > > @@ -0,0 +1,3 @@
> > > +obj-$(CONFIG_MHI_BUS) := mhi.o
> > > +
> > > +mhi-y := init.o
> > > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > > new file mode 100644
> > > index 000000000000..5b817ec250e0
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/core/init.c
> > > @@ -0,0 +1,404 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> > > + *
> > > + */
> > > +
> > > +#define dev_fmt(fmt) "MHI: " fmt
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/dma-direction.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/list.h>
> > > +#include <linux/mhi.h>
> > > +#include <linux/mod_devicetable.h>
> > > +#include <linux/module.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/vmalloc.h>
> > > +#include <linux/wait.h>
> > > +#include "internal.h"
> > > +
> > > +static int parse_ev_cfg(struct mhi_controller *mhi_cntrl,
> > > +            struct mhi_controller_config *config)
> > > +{
> > > +    int i, num;
> > > +    struct mhi_event *mhi_event;
> > > +    struct mhi_event_config *event_cfg;
> > > +
> > > +    num = config->num_events;
> > > +    mhi_cntrl->total_ev_rings = num;
> > > +    mhi_cntrl->mhi_event = kcalloc(num, sizeof(*mhi_cntrl->mhi_event),
> > > +                       GFP_KERNEL);
> > > +    if (!mhi_cntrl->mhi_event)
> > > +        return -ENOMEM;
> > > +
> > > +    /* Populate event ring */
> > > +    mhi_event = mhi_cntrl->mhi_event;
> > > +    for (i = 0; i < num; i++) {
> > > +        event_cfg = &config->event_cfg[i];
> > > +
> > > +        mhi_event->er_index = i;
> > > +        mhi_event->ring.elements = event_cfg->num_elements;
> > > +        mhi_event->intmod = event_cfg->irq_moderation_ms;
> > > +        mhi_event->irq = event_cfg->irq;
> > > +
> > > +        if (event_cfg->channel != U32_MAX) {
> > > +            /* This event ring has a dedicated channel */
> > > +            mhi_event->chan = event_cfg->channel;
> > > +            if (mhi_event->chan >= mhi_cntrl->max_chan) {
> > > +                dev_err(mhi_cntrl->dev,
> > > +                    "Event Ring channel not available\n");
> > > +                goto error_ev_cfg;
> > > +            }
> > > +
> > > +            mhi_event->mhi_chan =
> > > +                &mhi_cntrl->mhi_chan[mhi_event->chan];
> > > +        }
> > > +
> > > +        /* Priority is fixed to 1 for now */
> > > +        mhi_event->priority = 1;
> > > +
> > > +        mhi_event->db_cfg.brstmode = event_cfg->mode;
> > > +        if (MHI_INVALID_BRSTMODE(mhi_event->db_cfg.brstmode))
> > > +            goto error_ev_cfg;
> > > +
> > > +        mhi_event->data_type = event_cfg->data_type;
> > > +
> > > +        mhi_event->hw_ring = event_cfg->hardware_event;
> > > +        if (mhi_event->hw_ring)
> > > +            mhi_cntrl->hw_ev_rings++;
> > > +        else
> > > +            mhi_cntrl->sw_ev_rings++;
> > > +
> > > +        mhi_event->cl_manage = event_cfg->client_managed;
> > > +        mhi_event->offload_ev = event_cfg->offload_channel;
> > > +        mhi_event++;
> > > +    }
> > > +
> > > +    /* We need IRQ for each event ring + additional one for BHI */
> > > +    mhi_cntrl->nr_irqs_req = mhi_cntrl->total_ev_rings + 1;
> > > +
> > > +    return 0;
> > > +
> > > +error_ev_cfg:
> > > +
> > > +    kfree(mhi_cntrl->mhi_event);
> > > +    return -EINVAL;
> > > +}
> > > +
> > > +static int parse_ch_cfg(struct mhi_controller *mhi_cntrl,
> > > +            struct mhi_controller_config *config)
> > > +{
> > > +    int i;
> > > +    u32 chan;
> > > +    struct mhi_channel_config *ch_cfg;
> > > +
> > > +    mhi_cntrl->max_chan = config->max_channels;
> > > +
> > > +    /*
> > > +     * The allocation of MHI channels can exceed 32KB in some scenarios,
> > > +     * so to avoid any memory possible allocation failures, vzalloc is
> > > +     * used here
> > > +     */
> > > +    mhi_cntrl->mhi_chan = vzalloc(mhi_cntrl->max_chan *
> > > +                      sizeof(*mhi_cntrl->mhi_chan));
> > > +    if (!mhi_cntrl->mhi_chan)
> > > +        return -ENOMEM;
> > > +
> > > +    INIT_LIST_HEAD(&mhi_cntrl->lpm_chans);
> > > +
> > > +    /* Populate channel configurations */
> > > +    for (i = 0; i < config->num_channels; i++) {
> > > +        struct mhi_chan *mhi_chan;
> > > +
> > > +        ch_cfg = &config->ch_cfg[i];
> > > +
> > > +        chan = ch_cfg->num;
> > > +        if (chan >= mhi_cntrl->max_chan) {
> > > +            dev_err(mhi_cntrl->dev,
> > > +                "Channel %d not available\n", chan);
> > > +            goto error_chan_cfg;
> > > +        }
> > > +
> > > +        mhi_chan = &mhi_cntrl->mhi_chan[chan];
> > > +        mhi_chan->name = ch_cfg->name;
> > > +        mhi_chan->chan = chan;
> > > +
> > > +        mhi_chan->tre_ring.elements = ch_cfg->num_elements;
> > > +        if (!mhi_chan->tre_ring.elements)
> > > +            goto error_chan_cfg;
> > > +
> > > +        /*
> > > +         * For some channels, local ring length should be bigger than
> > > +         * the transfer ring length due to internal logical channels
> > > +         * in device. So host can queue much more buffers than transfer
> > > +         * ring length. Example, RSC channels should have a larger local
> > > +         * channel length than transfer ring length.
> > > +         */
> > > +        mhi_chan->buf_ring.elements = ch_cfg->local_elements;
> > > +        if (!mhi_chan->buf_ring.elements)
> > > +            mhi_chan->buf_ring.elements = mhi_chan->tre_ring.elements;
> > > +        mhi_chan->er_index = ch_cfg->event_ring;
> > > +        mhi_chan->dir = ch_cfg->dir;
> > > +
> > > +        /*
> > > +         * For most channels, chtype is identical to channel directions.
> > > +         * So, if it is not defined then assign channel direction to
> > > +         * chtype
> > > +         */
> > > +        mhi_chan->type = ch_cfg->type;
> > > +        if (!mhi_chan->type)
> > > +            mhi_chan->type = (enum mhi_ch_type)mhi_chan->dir;
> > > +
> > > +        mhi_chan->ee_mask = ch_cfg->ee_mask;
> > > +
> > > +        mhi_chan->db_cfg.pollcfg = ch_cfg->pollcfg;
> > > +        mhi_chan->xfer_type = ch_cfg->data_type;
> > > +
> > > +        mhi_chan->lpm_notify = ch_cfg->lpm_notify;
> > > +        mhi_chan->offload_ch = ch_cfg->offload_channel;
> > > +        mhi_chan->db_cfg.reset_req = ch_cfg->doorbell_mode_switch;
> > > +        mhi_chan->pre_alloc = ch_cfg->auto_queue;
> > > +        mhi_chan->auto_start = ch_cfg->auto_start;
> > > +
> > > +        /*
> > > +         * If MHI host allocates buffers, then the channel direction
> > > +         * should be DMA_FROM_DEVICE and the buffer type should be
> > > +         * MHI_BUF_RAW
> > > +         */
> > > +        if (mhi_chan->pre_alloc && (mhi_chan->dir != DMA_FROM_DEVICE ||
> > > +                mhi_chan->xfer_type != MHI_BUF_RAW)) {
> > > +            dev_err(mhi_cntrl->dev,
> > > +                "Invalid channel configuration\n");
> > > +            goto error_chan_cfg;
> > > +        }
> > > +
> > > +        /*
> > > +         * Bi-directional and direction less channel must be an
> > > +         * offload channel
> > > +         */
> > > +        if ((mhi_chan->dir == DMA_BIDIRECTIONAL ||
> > > +             mhi_chan->dir == DMA_NONE) && !mhi_chan->offload_ch) {
> > > +            dev_err(mhi_cntrl->dev,
> > > +                "Invalid channel configuration\n");
> > > +            goto error_chan_cfg;
> > > +        }
> > > +
> > > +        if (!mhi_chan->offload_ch) {
> > > +            mhi_chan->db_cfg.brstmode = ch_cfg->doorbell;
> > > +            if (MHI_INVALID_BRSTMODE(mhi_chan->db_cfg.brstmode)) {
> > > +                dev_err(mhi_cntrl->dev,
> > > +                    "Invalid Door bell mode\n");
> > > +                goto error_chan_cfg;
> > > +            }
> > > +        }
> > > +
> > > +        mhi_chan->configured = true;
> > > +
> > > +        if (mhi_chan->lpm_notify)
> > > +            list_add_tail(&mhi_chan->node, &mhi_cntrl->lpm_chans);
> > > +    }
> > > +
> > > +    return 0;
> > > +
> > > +error_chan_cfg:
> > > +    vfree(mhi_cntrl->mhi_chan);
> > > +
> > > +    return -EINVAL;
> > > +}
> > > +
> > > +static int parse_config(struct mhi_controller *mhi_cntrl,
> > > +            struct mhi_controller_config *config)
> > > +{
> > > +    int ret;
> > > +
> > > +    /* Parse MHI channel configuration */
> > > +    ret = parse_ch_cfg(mhi_cntrl, config);
> > > +    if (ret)
> > > +        return ret;
> > > +
> > > +    /* Parse MHI event configuration */
> > > +    ret = parse_ev_cfg(mhi_cntrl, config);
> > > +    if (ret)
> > > +        goto error_ev_cfg;
> > > +
> > > +    mhi_cntrl->timeout_ms = config->timeout_ms;
> > > +    if (!mhi_cntrl->timeout_ms)
> > > +        mhi_cntrl->timeout_ms = MHI_TIMEOUT_MS;
> > > +
> > > +    mhi_cntrl->bounce_buf = config->use_bounce_buf;
> > > +    mhi_cntrl->buffer_len = config->buf_len;
> > > +    if (!mhi_cntrl->buffer_len)
> > > +        mhi_cntrl->buffer_len = MHI_MAX_MTU;
> > > +
> > > +    return 0;
> > > +
> > > +error_ev_cfg:
> > > +    vfree(mhi_cntrl->mhi_chan);
> > > +
> > > +    return ret;
> > > +}
> > > +
> > > +int mhi_register_controller(struct mhi_controller *mhi_cntrl,
> > > +                struct mhi_controller_config *config)
> > > +{
> > > +    int ret;
> > > +    int i;
> > > +    struct mhi_event *mhi_event;
> > > +    struct mhi_chan *mhi_chan;
> > > +    struct mhi_cmd *mhi_cmd;
> > > +    struct mhi_device *mhi_dev;
> > > +
> 
> You need a null check on mhi_cntrl right here, otherwise you could cause a
> panic with the following if.
> 

Ack.

> > > +    if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put)
> > > +        return -EINVAL;
> > > +
> > > +    if (!mhi_cntrl->status_cb || !mhi_cntrl->link_status)
> > > +        return -EINVAL;
> > > +
> > > +    ret = parse_config(mhi_cntrl, config);
> > > +    if (ret)
> > > +        return -EINVAL;
> > > +
> > > +    mhi_cntrl->mhi_cmd = kcalloc(NR_OF_CMD_RINGS,
> > > +                     sizeof(*mhi_cntrl->mhi_cmd), GFP_KERNEL);
> > > +    if (!mhi_cntrl->mhi_cmd) {
> > > +        ret = -ENOMEM;
> > > +        goto error_alloc_cmd;
> > > +    }
> > > +
> > > +    INIT_LIST_HEAD(&mhi_cntrl->transition_list);
> > > +    spin_lock_init(&mhi_cntrl->transition_lock);
> > > +    spin_lock_init(&mhi_cntrl->wlock);
> > > +    init_waitqueue_head(&mhi_cntrl->state_event);
> > > +
> > > +    mhi_cmd = mhi_cntrl->mhi_cmd;
> > > +    for (i = 0; i < NR_OF_CMD_RINGS; i++, mhi_cmd++)
> > > +        spin_lock_init(&mhi_cmd->lock);
> > > +
> > > +    mhi_event = mhi_cntrl->mhi_event;
> > > +    for (i = 0; i < mhi_cntrl->total_ev_rings; i++, mhi_event++) {
> > > +        /* Skip for offload events */
> > > +        if (mhi_event->offload_ev)
> > > +            continue;
> > > +
> > > +        mhi_event->mhi_cntrl = mhi_cntrl;
> > > +        spin_lock_init(&mhi_event->lock);
> > > +    }
> > > +
> > > +    mhi_chan = mhi_cntrl->mhi_chan;
> > > +    for (i = 0; i < mhi_cntrl->max_chan; i++, mhi_chan++) {
> > > +        mutex_init(&mhi_chan->mutex);
> > > +        init_completion(&mhi_chan->completion);
> > > +        rwlock_init(&mhi_chan->lock);
> > > +    }
> > > +
> > > +    /* Register controller with MHI bus */
> > > +    mhi_dev = mhi_alloc_device(mhi_cntrl);
> > > +    if (IS_ERR(mhi_dev)) {
> > > +        dev_err(mhi_cntrl->dev, "Failed to allocate device\n");
> > > +        ret = PTR_ERR(mhi_dev);
> > > +        goto error_alloc_dev;
> > > +    }
> > > +
> > > +    mhi_dev->dev_type = MHI_DEVICE_CONTROLLER;
> > > +    mhi_dev->mhi_cntrl = mhi_cntrl;
> > > +    dev_set_name(&mhi_dev->dev, "%s", mhi_cntrl->name);
> > > +
> > > +    /* Init wakeup source */
> > > +    device_init_wakeup(&mhi_dev->dev, true);
> > > +
> > > +    ret = device_add(&mhi_dev->dev);
> > > +    if (ret)
> > > +        goto error_add_dev;
> > > +
> > > +    mhi_cntrl->mhi_dev = mhi_dev;
> > > +
> > > +    return 0;
> > > +
> > > +error_add_dev:
> > > +    mhi_dealloc_device(mhi_cntrl, mhi_dev);
> > > +
> > > +error_alloc_dev:
> > > +    kfree(mhi_cntrl->mhi_cmd);
> > > +
> > > +error_alloc_cmd:
> > > +    vfree(mhi_cntrl->mhi_chan);
> > > +    kfree(mhi_cntrl->mhi_event);
> > > +
> > > +    return ret;
> > > +}
> > > +EXPORT_SYMBOL_GPL(mhi_register_controller);
> > > +
> > > +void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
> > > +{
> > > +    struct mhi_device *mhi_dev = mhi_cntrl->mhi_dev;
> > > +
> > > +    kfree(mhi_cntrl->mhi_cmd);
> > > +    kfree(mhi_cntrl->mhi_event);
> > > +    vfree(mhi_cntrl->mhi_chan);
> > > +
> > > +    device_del(&mhi_dev->dev);
> > > +    put_device(&mhi_dev->dev);
> > > +}
> > > +EXPORT_SYMBOL_GPL(mhi_unregister_controller);
> > > +
> > > +static void mhi_release_device(struct device *dev)
> > > +{
> > > +    struct mhi_device *mhi_dev = to_mhi_device(dev);
> > > +
> > > +    if (mhi_dev->ul_chan)
> > > +        mhi_dev->ul_chan->mhi_dev = NULL;
> > > +
> > > +    if (mhi_dev->dl_chan)
> > > +        mhi_dev->dl_chan->mhi_dev = NULL;
> > > +
> > > +    kfree(mhi_dev);
> > > +}
> > > +
> > > +struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
> > > +{
> > > +    struct mhi_device *mhi_dev;
> > > +    struct device *dev;
> > > +
> > > +    mhi_dev = kzalloc(sizeof(*mhi_dev), GFP_KERNEL);
> > > +    if (!mhi_dev)
> > > +        return ERR_PTR(-ENOMEM);
> > > +
> > > +    dev = &mhi_dev->dev;
> > > +    device_initialize(dev);
> > > +    dev->bus = &mhi_bus_type;
> > > +    dev->release = mhi_release_device;
> > > +    dev->parent = mhi_cntrl->dev;
> > > +    mhi_dev->mhi_cntrl = mhi_cntrl;
> > > +    atomic_set(&mhi_dev->dev_wake, 0);
> > > +
> > > +    return mhi_dev;
> > > +}
> > > +
> > > +static int mhi_match(struct device *dev, struct device_driver *drv)
> > > +{
> > > +    return 0;
> > > +};
> > > +
> > > +struct bus_type mhi_bus_type = {
> > > +    .name = "mhi",
> > > +    .dev_name = "mhi",
> > > +    .match = mhi_match,
> > > +};
> > > +
> > > +static int __init mhi_init(void)
> > > +{
> > > +    return bus_register(&mhi_bus_type);
> > > +}
> > > +
> > > +static void __exit mhi_exit(void)
> > > +{
> > > +    bus_unregister(&mhi_bus_type);
> > > +}
> > > +
> > > +postcore_initcall(mhi_init);
> > > +module_exit(mhi_exit);
> > > +
> > > +MODULE_LICENSE("GPL v2");
> > > +MODULE_DESCRIPTION("MHI Host Interface");
> > > diff --git a/drivers/bus/mhi/core/internal.h
> > > b/drivers/bus/mhi/core/internal.h
> > > new file mode 100644
> > > index 000000000000..21f686d3a140
> > > --- /dev/null
> > > +++ b/drivers/bus/mhi/core/internal.h
> > > @@ -0,0 +1,169 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> > > + *
> > > + */
> > > +
> > > +#ifndef _MHI_INT_H
> > > +#define _MHI_INT_H
> > > +
> > > +extern struct bus_type mhi_bus_type;
> > > +
> > > +/* MHI transfer completion events */
> > > +enum mhi_ev_ccs {
> > > +    MHI_EV_CC_INVALID = 0x0,
> > > +    MHI_EV_CC_SUCCESS = 0x1,
> > > +    MHI_EV_CC_EOT = 0x2,
> > > +    MHI_EV_CC_OVERFLOW = 0x3,
> > > +    MHI_EV_CC_EOB = 0x4,
> > > +    MHI_EV_CC_OOB = 0x5,
> > > +    MHI_EV_CC_DB_MODE = 0x6,
> > > +    MHI_EV_CC_UNDEFINED_ERR = 0x10,
> > > +    MHI_EV_CC_BAD_TRE = 0x11,
> > 
> > Perhaps a quick comment expanding the "EOT", "EOB", "OOB" acronyms?  I
> > feel like those might not be obvious to someone not familiar with the
> > protocol.
> > 
> > > +};
> > > +
> > > +enum mhi_ch_state {
> > > +    MHI_CH_STATE_DISABLED = 0x0,
> > > +    MHI_CH_STATE_ENABLED = 0x1,
> > > +    MHI_CH_STATE_RUNNING = 0x2,
> > > +    MHI_CH_STATE_SUSPENDED = 0x3,
> > > +    MHI_CH_STATE_STOP = 0x4,
> > > +    MHI_CH_STATE_ERROR = 0x5,
> > > +};
> > > +
> > > +#define MHI_INVALID_BRSTMODE(mode) (mode != MHI_DB_BRST_DISABLE && \
> > > +                    mode != MHI_DB_BRST_ENABLE)
> > > +
> > > +#define NR_OF_CMD_RINGS            1
> > > +#define CMD_EL_PER_RING            128
> > > +#define PRIMARY_CMD_RING        0
> > > +#define MHI_MAX_MTU            0xffff
> > > +
> > > +enum mhi_er_type {
> > > +    MHI_ER_TYPE_INVALID = 0x0,
> > > +    MHI_ER_TYPE_VALID = 0x1,
> > > +};
> > > +
> > > +enum mhi_ch_ee_mask {
> > > +    MHI_CH_EE_PBL = BIT(MHI_EE_PBL),
> > 
> > MHI_EE_PBL does not appear to be defined.  Are you perhaps missing an
> > include?
> > 

Answered in other thread.

> > > +    MHI_CH_EE_SBL = BIT(MHI_EE_SBL),
> > > +    MHI_CH_EE_AMSS = BIT(MHI_EE_AMSS),
> > > +    MHI_CH_EE_RDDM = BIT(MHI_EE_RDDM),
> > > +    MHI_CH_EE_PTHRU = BIT(MHI_EE_PTHRU),
> > > +    MHI_CH_EE_WFW = BIT(MHI_EE_WFW),
> > > +    MHI_CH_EE_EDL = BIT(MHI_EE_EDL),
> > > +};
> > > +
> > > +struct db_cfg {
> > > +    bool reset_req;
> > > +    bool db_mode;
> > > +    u32 pollcfg;
> > > +    enum mhi_db_brst_mode brstmode;
> > > +    dma_addr_t db_val;
> > > +    void (*process_db)(struct mhi_controller *mhi_cntrl,
> > > +               struct db_cfg *db_cfg, void __iomem *io_addr,
> > > +               dma_addr_t db_val);
> > > +};
> > > +
> > > +struct mhi_ring {
> > > +    dma_addr_t dma_handle;
> > > +    dma_addr_t iommu_base;
> > > +    u64 *ctxt_wp; /* point to ctxt wp */
> > > +    void *pre_aligned;
> > > +    void *base;
> > > +    void *rp;
> > > +    void *wp;
> > > +    size_t el_size;
> > > +    size_t len;
> > > +    size_t elements;
> > > +    size_t alloc_size;
> > > +    void __iomem *db_addr;
> > > +};
> > > +
> > > +struct mhi_cmd {
> > > +    struct mhi_ring ring;
> > > +    spinlock_t lock;
> > > +};
> > > +
> > > +struct mhi_buf_info {
> > > +    dma_addr_t p_addr;
> > > +    void *v_addr;
> > > +    void *bb_addr;
> > > +    void *wp;
> > > +    size_t len;
> > > +    void *cb_buf;
> > > +    enum dma_data_direction dir;
> > > +};
> > > +
> > > +struct mhi_event {
> > > +    u32 er_index;
> > > +    u32 intmod;
> > > +    u32 irq;
> > > +    int chan; /* this event ring is dedicated to a channel (optional) */
> > > +    u32 priority;
> > > +    enum mhi_er_data_type data_type;
> > > +    struct mhi_ring ring;
> > > +    struct db_cfg db_cfg;
> > > +    bool hw_ring;
> > > +    bool cl_manage;
> > > +    bool offload_ev; /* managed by a device driver */
> > > +    spinlock_t lock;
> > > +    struct mhi_chan *mhi_chan; /* dedicated to channel */
> > > +    struct tasklet_struct task;
> > > +    int (*process_event)(struct mhi_controller *mhi_cntrl,
> > > +                 struct mhi_event *mhi_event,
> > > +                 u32 event_quota);
> > > +    struct mhi_controller *mhi_cntrl;
> > > +};
> > > +
> > > +struct mhi_chan {
> > > +    u32 chan;
> > > +    const char *name;
> > > +    /*
> > > +     * Important: When consuming, increment tre_ring first and when
> > > +     * releasing, decrement buf_ring first. If tre_ring has space,
> > > buf_ring
> > > +     * is guranteed to have space so we do not need to check both rings.
> > > +     */
> > > +    struct mhi_ring buf_ring;
> > > +    struct mhi_ring tre_ring;
> > > +    u32 er_index;
> > > +    u32 intmod;
> > > +    enum mhi_ch_type type;
> > > +    enum dma_data_direction dir;
> > > +    struct db_cfg db_cfg;
> > > +    enum mhi_ch_ee_mask ee_mask;
> > > +    enum mhi_buf_type xfer_type;
> > > +    enum mhi_ch_state ch_state;
> > > +    enum mhi_ev_ccs ccs;
> > > +    bool lpm_notify;
> > > +    bool configured;
> > > +    bool offload_ch;
> > > +    bool pre_alloc;
> > > +    bool auto_start;
> > > +    int (*gen_tre)(struct mhi_controller *mhi_cntrl,
> > > +               struct mhi_chan *mhi_chan, void *buf, void *cb,
> > > +               size_t len, enum mhi_flags flags);
> > > +    int (*queue_xfer)(struct mhi_device *mhi_dev, struct mhi_chan
> > > *mhi_chan,
> > > +              void *buf, size_t len, enum mhi_flags mflags);
> > > +    struct mhi_device *mhi_dev;
> > > +    void (*xfer_cb)(struct mhi_device *mhi_dev, struct mhi_result
> > > *result);
> > > +    struct mutex mutex;
> > > +    struct completion completion;
> > > +    rwlock_t lock;
> > > +    struct list_head node;
> > > +};
> > > +
> > > +/* Default MHI timeout */
> > > +#define MHI_TIMEOUT_MS (1000)
> > > +
> > > +struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl);
> > > +static inline void mhi_dealloc_device(struct mhi_controller *mhi_cntrl,
> > > +                      struct mhi_device *mhi_dev)
> > > +{
> > > +    kfree(mhi_dev);
> > > +}
> > > +
> > > +int mhi_destroy_device(struct device *dev, void *data);
> > > +void mhi_create_devices(struct mhi_controller *mhi_cntrl);
> > > +
> > > +#endif /* _MHI_INT_H */
> > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > new file mode 100644
> > > index 000000000000..69cf9a4b06c7
> > > --- /dev/null
> > > +++ b/include/linux/mhi.h
> > > @@ -0,0 +1,438 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> > > + *
> > > + */
> > > +#ifndef _MHI_H_
> > > +#define _MHI_H_
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/dma-direction.h>
> > > +#include <linux/mutex.h>
> > > +#include <linux/rwlock_types.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/spinlock_types.h>
> > > +#include <linux/wait.h>
> > > +#include <linux/workqueue.h>
> > > +
> > > +struct mhi_chan;
> > > +struct mhi_event;
> > > +struct mhi_ctxt;
> > > +struct mhi_cmd;
> > > +struct mhi_buf_info;
> > > +
> > > +/**
> > > + * enum mhi_callback - MHI callback
> > > + * @MHI_CB_IDLE: MHI entered idle state
> > > + * @MHI_CB_PENDING_DATA: New data available for client to process
> > > + * @MHI_CB_LPM_ENTER: MHI host entered low power mode
> > > + * @MHI_CB_LPM_EXIT: MHI host about to exit low power mode
> > > + * @MHI_CB_EE_RDDM: MHI device entered RDDM exec env
> > > + * @MHI_CB_EE_MISSION_MODE: MHI device entered Mission Mode exec env
> > > + * @MHI_CB_SYS_ERROR: MHI device entered error state (may recover)
> > > + * @MHI_CB_FATAL_ERROR: MHI device entered fatal error state
> > > + */
> > > +enum mhi_callback {
> > > +    MHI_CB_IDLE,
> > > +    MHI_CB_PENDING_DATA,
> > > +    MHI_CB_LPM_ENTER,
> > > +    MHI_CB_LPM_EXIT,
> > > +    MHI_CB_EE_RDDM,
> > > +    MHI_CB_EE_MISSION_MODE,
> > > +    MHI_CB_SYS_ERROR,
> > > +    MHI_CB_FATAL_ERROR,
> > > +};
> > > +
> > > +/**
> > > + * enum mhi_flags - Transfer flags
> > > + * @MHI_EOB: End of buffer for bulk transfer
> > > + * @MHI_EOT: End of transfer
> > > + * @MHI_CHAIN: Linked transfer
> > > + */
> > > +enum mhi_flags {
> > > +    MHI_EOB,
> > > +    MHI_EOT,
> > > +    MHI_CHAIN,
> > > +};
> > > +
> > > +/**
> > > + * enum mhi_device_type - Device types
> > > + * @MHI_DEVICE_XFER: Handles data transfer
> > > + * @MHI_DEVICE_TIMESYNC: Use for timesync feature
> > > + * @MHI_DEVICE_CONTROLLER: Control device
> > > + */
> > > +enum mhi_device_type {
> > > +    MHI_DEVICE_XFER,
> > > +    MHI_DEVICE_TIMESYNC,
> > > +    MHI_DEVICE_CONTROLLER,
> > > +};
> > > +
> > > +/**
> > > + * enum mhi_ch_type - Channel types
> > > + * @MHI_CH_TYPE_INVALID: Invalid channel type
> > > + * @MHI_CH_TYPE_OUTBOUND: Outbound channel to the device
> > > + * @MHI_CH_TYPE_INBOUND: Inbound channel from the device
> > > + * @MHI_CH_TYPE_INBOUND_COALESCED: Coalesced channel for the device
> > > to combine
> > > + *                   multiple packets and send them as a single
> > > + *                   large packet to reduce CPU consumption
> > > + */
> > > +enum mhi_ch_type {
> > > +    MHI_CH_TYPE_INVALID = 0,
> > > +    MHI_CH_TYPE_OUTBOUND = DMA_TO_DEVICE,
> > > +    MHI_CH_TYPE_INBOUND = DMA_FROM_DEVICE,
> > > +    MHI_CH_TYPE_INBOUND_COALESCED = 3,
> > > +};
> > > +
> > > +/**
> > > + * enum mhi_ee_type - Execution environment types
> > > + * @MHI_EE_PBL: Primary Bootloader
> > > + * @MHI_EE_SBL: Secondary Bootloader
> > > + * @MHI_EE_AMSS: Modem, aka the primary runtime EE
> > > + * @MHI_EE_RDDM: Ram dump download mode
> > > + * @MHI_EE_WFW: WLAN firmware mode
> > > + * @MHI_EE_PTHRU: Passthrough
> > > + * @MHI_EE_EDL: Embedded downloader
> > > + */
> > > +enum mhi_ee_type {
> > > +    MHI_EE_PBL,
> > > +    MHI_EE_SBL,
> > > +    MHI_EE_AMSS,
> > > +    MHI_EE_RDDM,
> > > +    MHI_EE_WFW,
> > > +    MHI_EE_PTHRU,
> > > +    MHI_EE_EDL,
> > > +    MHI_EE_MAX_SUPPORTED = MHI_EE_EDL,
> > > +    MHI_EE_DISABLE_TRANSITION, /* local EE, not related to mhi spec */
> > > +    MHI_EE_NOT_SUPPORTED,
> > > +    MHI_EE_MAX,
> > > +};
> > > +
> > > +/**
> > > + * enum mhi_buf_type - Accepted buffer type for the channel
> > > + * @MHI_BUF_RAW: Raw buffer
> > > + * @MHI_BUF_SKB: SKB struct
> > > + * @MHI_BUF_SCLIST: Scatter-gather list
> > > + * @MHI_BUF_NOP: CPU offload channel, host does not accept transfer
> > > + * @MHI_BUF_DMA: Receive DMA address mapped by client
> > > + * @MHI_BUF_RSC_DMA: RSC type premapped buffer
> > 
> > Maybe its just me, but what is "RSC"?
> > 
> > > + */
> > > +enum mhi_buf_type {
> > > +    MHI_BUF_RAW,
> > > +    MHI_BUF_SKB,
> > > +    MHI_BUF_SCLIST,
> > > +    MHI_BUF_NOP,
> > > +    MHI_BUF_DMA,
> > > +    MHI_BUF_RSC_DMA,
> > > +};
> > > +
> > > +/**
> > > + * enum mhi_er_data_type - Event ring data types
> > > + * @MHI_ER_DATA: Only client data over this ring
> > > + * @MHI_ER_CTRL: MHI control data and client data
> > > + * @MHI_ER_TSYNC: Time sync events
> > > + */
> > > +enum mhi_er_data_type {
> > > +    MHI_ER_DATA,
> > > +    MHI_ER_CTRL,
> > > +    MHI_ER_TSYNC,
> > > +};
> > > +
> > > +/**
> > > + * enum mhi_db_brst_mode - Doorbell mode
> > > + * @MHI_DB_BRST_DISABLE: Burst mode disable
> > > + * @MHI_DB_BRST_ENABLE: Burst mode enable
> > > + */
> > > +enum mhi_db_brst_mode {
> > > +    MHI_DB_BRST_DISABLE = 0x2,
> > > +    MHI_DB_BRST_ENABLE = 0x3,
> > > +};
> > > +
> > > +/**
> > > + * struct mhi_channel_config - Channel configuration structure for
> > > controller
> > > + * @num: The number assigned to this channel
> > > + * @name: The name of this channel
> > > + * @num_elements: The number of elements that can be queued to this
> > > channel
> > > + * @local_elements: The local ring length of the channel
> > > + * @event_ring: The event rung index that services this channel
> > > + * @dir: Direction that data may flow on this channel
> > > + * @type: Channel type
> > > + * @ee_mask: Execution Environment mask for this channel
> > 
> > But the mask defines are in internal.h, so how is a client suposed to
> > know what they are?
> > 
> > > + * @pollcfg: Polling configuration for burst mode.  0 is default.
> > > milliseconds
> > > +         for UL channels, multiple of 8 ring elements for DL channels
> > > + * @data_type: Data type accepted by this channel
> > > + * @doorbell: Doorbell mode
> > > + * @lpm_notify: The channel master requires low power mode notifications
> > > + * @offload_channel: The client manages the channel completely
> > > + * @doorbell_mode_switch: Channel switches to doorbell mode on M0
> > > transition
> > > + * @auto_queue: Framework will automatically queue buffers for DL
> > > traffic
> > > + * @auto_start: Automatically start (open) this channel
> > > + */
> > > +struct mhi_channel_config {
> > > +    u32 num;
> > > +    char *name;
> > > +    u32 num_elements;
> > > +    u32 local_elements;
> > > +    u32 event_ring;
> > > +    enum dma_data_direction dir;
> > > +    enum mhi_ch_type type;
> 
> Why do we have "dir" and "type" when they are the same thing?
> 

The motive of mhi_ch_type is to define additional channel specific
properties apart from channel direction. Right now, we don't make
use of it fully but it is kept for future use.

> > > +    u32 ee_mask;
> > > +    u32 pollcfg;
> > > +    enum mhi_buf_type data_type;
> > > +    enum mhi_db_brst_mode doorbell;
> > > +    bool lpm_notify;
> > > +    bool offload_channel;
> > > +    bool doorbell_mode_switch;
> > > +    bool auto_queue;
> > > +    bool auto_start;
> > > +};
> > > +
> > > +/**
> > > + * struct mhi_event_config - Event ring configuration structure for
> > > controller
> > > + * @num_elements: The number of elements that can be queued to this ring
> > > + * @irq_moderation_ms: Delay irq for additional events to be aggregated
> > > + * @irq: IRQ associated with this ring
> > > + * @channel: Dedicated channel number. U32_MAX indicates a
> > > non-dedicated ring
> > > + * @mode: Doorbell mode
> > > + * @data_type: Type of data this ring will process
> > > + * @hardware_event: This ring is associated with hardware channels
> > > + * @client_managed: This ring is client managed
> > > + * @offload_channel: This ring is associated with an offloaded channel
> > > + * @priority: Priority of this ring. Use 1 for now
> > > + */
> > > +struct mhi_event_config {
> > > +    u32 num_elements;
> > > +    u32 irq_moderation_ms;
> > > +    u32 irq;
> > > +    u32 channel;
> > > +    enum mhi_db_brst_mode mode;
> > > +    enum mhi_er_data_type data_type;
> > > +    bool hardware_event;
> > > +    bool client_managed;
> > > +    bool offload_channel;
> > > +    u32 priority;
> > > +};
> > > +
> > > +/**
> > > + * struct mhi_controller_config - Root MHI controller configuration
> > > + * @max_channels: Maximum number of channels supported
> > > + * @timeout_ms: Timeout value for operations. 0 means use default
> > > + * @use_bounce_buf: Use a bounce buffer pool due to limited DDR access
> > > + * @m2_no_db: Host is not allowed to ring DB in M2 state
> > > + * @buf_len: Size of automatically allocated buffers. 0 means use
> > > default
> > > + * @num_channels: Number of channels defined in @ch_cfg
> > > + * @ch_cfg: Array of defined channels
> > > + * @num_events: Number of event rings defined in @event_cfg
> > > + * @event_cfg: Array of defined event rings
> > > + */
> > > +struct mhi_controller_config {
> > > +    u32 max_channels;
> > > +    u32 timeout_ms;
> > > +    bool use_bounce_buf;
> > > +    bool m2_no_db;
> > > +    u32 buf_len;
> > > +    u32 num_channels;
> > > +    struct mhi_channel_config *ch_cfg;
> > > +    u32 num_events;
> > > +    struct mhi_event_config *event_cfg;
> > > +};
> > > +
> > > +/**
> > > + * struct mhi_controller - Master MHI controller structure
> 
> Quite a bit of this needs to be initialized by the entity calling
> mhi_register_controller(), but its not clear what.  I'm thinking that since
> we have a config structure, all of that should be copied/moved into the
> config so that the caller of mhi_register_controller() provides an empty
> mhi_controller struct / a populated config struct and receives an
> initialized mhi_controller instance.
> 

Agree. The problem with moving these configurable fields to a separate
struct is the usage of `dev` pointer. It doesn't make sense to have the
dev pointer in the config structure. So, I've decided to mark the members
which were required/optional to be provided by the controller driver.

The change is here FYI: https://git.kernel.org/pub/scm/linux/kernel/git/mani/mhi.git/commit/?h=mhi-v1&id=997dc05ae2ffa787e3948c34c50f3ea7b6cecb67

Thanks,
Mani

> > > + * @name: Name of the controller
> > > + * @dev: Driver model device node for the controller
> > > + * @mhi_dev: MHI device instance for the controller
> > > + * @dev_id: Device ID of the controller
> > > + * @bus_id: Physical bus instance used by the controller
> > > + * @regs: Base address of MHI MMIO register space
> > > + * @iova_start: IOMMU starting address for data
> > > + * @iova_stop: IOMMU stop address for data
> > > + * @fw_image: Firmware image name for normal booting
> > > + * @edl_image: Firmware image name for emergency download mode
> > > + * @fbc_download: MHI host needs to do complete image transfer
> > > + * @sbl_size: SBL image size
> > > + * @seg_len: BHIe vector size
> > > + * @max_chan: Maximum number of channels the controller supports
> > > + * @mhi_chan: Points to the channel configuration table
> > > + * @lpm_chans: List of channels that require LPM notifications
> > > + * @total_ev_rings: Total # of event rings allocated
> > > + * @hw_ev_rings: Number of hardware event rings
> > > + * @sw_ev_rings: Number of software event rings
> > > + * @nr_irqs_req: Number of IRQs required to operate
> > > + * @nr_irqs: Number of IRQ allocated by bus master
> > > + * @irq: base irq # to request
> > > + * @mhi_event: MHI event ring configurations table
> > > + * @mhi_cmd: MHI command ring configurations table
> > > + * @mhi_ctxt: MHI device context, shared memory between host and device
> > > + * @timeout_ms: Timeout in ms for state transitions
> > > + * @pm_mutex: Mutex for suspend/resume operation
> > > + * @pre_init: MHI host needs to do pre-initialization before power up
> > > + * @pm_lock: Lock for protecting MHI power management state
> > > + * @pm_state: MHI power management state
> > > + * @db_access: DB access states
> > > + * @ee: MHI device execution environment
> > > + * @wake_set: Device wakeup set flag
> > > + * @dev_wake: Device wakeup count
> > > + * @alloc_size: Total memory allocations size of the controller
> > > + * @pending_pkts: Pending packets for the controller
> > > + * @transition_list: List of MHI state transitions
> > > + * @wlock: Lock for protecting device wakeup
> > > + * @M0: M0 state counter for debugging
> > > + * @M2: M2 state counter for debugging
> > > + * @M3: M3 state counter for debugging
> > > + * @M3_FAST: M3 Fast state counter for debugging
> > > + * @st_worker: State transition worker
> > > + * @fw_worker: Firmware download worker
> > > + * @syserr_worker: System error worker
> > > + * @state_event: State change event
> > > + * @status_cb: CB function to notify various power states to bus master
> > > + * @link_status: CB function to query link status of the device
> > > + * @wake_get: CB function to assert device wake
> > > + * @wake_put: CB function to de-assert device wake
> > > + * @wake_toggle: CB function to assert and deasset (toggle) device wake
> > > + * @runtime_get: CB function to controller runtime resume
> > > + * @runtimet_put: CB function to decrement pm usage
> > > + * @lpm_disable: CB function to request disable link level low
> > > power modes
> > > + * @lpm_enable: CB function to request enable link level low power
> > > modes again
> > > + * @bounce_buf: Use of bounce buffer
> > > + * @buffer_len: Bounce buffer length
> > > + * @priv_data: Points to bus master's private data
> > > + */
> > > +struct mhi_controller {
> > > +    const char *name;
> > > +    struct device *dev;
> > > +    struct mhi_device *mhi_dev;
> > > +    u32 dev_id;
> > > +    u32 bus_id;
> > > +    void __iomem *regs;
> > > +    dma_addr_t iova_start;
> > > +    dma_addr_t iova_stop;
> > > +    const char *fw_image;
> > > +    const char *edl_image;
> > > +    bool fbc_download;
> > > +    size_t sbl_size;
> > > +    size_t seg_len;
> > > +    u32 max_chan;
> > > +    struct mhi_chan *mhi_chan;
> > > +    struct list_head lpm_chans;
> > > +    u32 total_ev_rings;
> > > +    u32 hw_ev_rings;
> > > +    u32 sw_ev_rings;
> > > +    u32 nr_irqs_req;
> > > +    u32 nr_irqs;
> > > +    int *irq;
> > > +
> > > +    struct mhi_event *mhi_event;
> > > +    struct mhi_cmd *mhi_cmd;
> > > +    struct mhi_ctxt *mhi_ctxt;
> > > +
> > > +    u32 timeout_ms;
> > > +    struct mutex pm_mutex;
> > > +    bool pre_init;
> > > +    rwlock_t pm_lock;
> > > +    u32 pm_state;
> > > +    u32 db_access;
> > > +    enum mhi_ee_type ee;
> > > +    bool wake_set;
> > > +    atomic_t dev_wake;
> > > +    atomic_t alloc_size;
> > > +    atomic_t pending_pkts;
> > > +    struct list_head transition_list;
> > > +    spinlock_t transition_lock;
> > > +    spinlock_t wlock;
> > > +    u32 M0, M2, M3, M3_FAST;
> > > +    struct work_struct st_worker;
> > > +    struct work_struct fw_worker;
> > > +    struct work_struct syserr_worker;
> > > +    wait_queue_head_t state_event;
> > > +
> > > +    void (*status_cb)(struct mhi_controller *mhi_cntrl, void *priv,
> > > +              enum mhi_callback cb);
> > > +    int (*link_status)(struct mhi_controller *mhi_cntrl, void *priv);
> > > +    void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
> > > +    void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
> > > +    void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
> > > +    int (*runtime_get)(struct mhi_controller *mhi_cntrl, void *priv);
> > > +    void (*runtime_put)(struct mhi_controller *mhi_cntrl, void *priv);
> > > +    void (*lpm_disable)(struct mhi_controller *mhi_cntrl, void *priv);
> > > +    void (*lpm_enable)(struct mhi_controller *mhi_cntrl, void *priv);
> > > +
> > > +    bool bounce_buf;
> > > +    size_t buffer_len;
> > > +    void *priv_data;
> > > +};
> > > +
> > > +/**
> > > + * struct mhi_device - Structure representing a MHI device which binds
> > > + *                     to channels
> > > + * @dev: Driver model device node for the MHI device
> > > + * @tiocm: Device current terminal settings
> > > + * @id: Pointer to MHI device ID struct
> > > + * @chan_name: Name of the channel to which the device binds
> > > + * @mhi_cntrl: Controller the device belongs to
> > > + * @ul_chan: UL channel for the device
> > > + * @dl_chan: DL channel for the device
> > > + * @dev_wake: Device wakeup counter
> > > + * @dev_type: MHI device type
> > > + */
> > > +struct mhi_device {
> > > +    struct device dev;
> > > +    u32 tiocm;
> > > +    const struct mhi_device_id *id;
> > > +    const char *chan_name;
> > > +    struct mhi_controller *mhi_cntrl;
> > > +    struct mhi_chan *ul_chan;
> > > +    struct mhi_chan *dl_chan;
> > > +    atomic_t dev_wake;
> > > +    enum mhi_device_type dev_type;
> > > +};
> > > +
> > > +/**
> > > + * struct mhi_result - Completed buffer information
> > > + * @buf_addr: Address of data buffer
> > > + * @dir: Channel direction
> > > + * @bytes_xfer: # of bytes transferred
> > > + * @transaction_status: Status of last transaction
> > > + */
> > > +struct mhi_result {
> > > +    void *buf_addr;
> > > +    enum dma_data_direction dir;
> > > +    size_t bytes_xferd;
> > 
> > Desription says this is named "bytes_xfer"
> > 
> > > +    int transaction_status;
> > > +};
> > > +
> > > +#define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
> > > +
> > > +/**
> > > + * mhi_controller_set_devdata - Set MHI controller private data
> > > + * @mhi_cntrl: MHI controller to set data
> > > + */
> > > +static inline void mhi_controller_set_devdata(struct mhi_controller
> > > *mhi_cntrl,
> > > +                     void *priv)
> > > +{
> > > +    mhi_cntrl->priv_data = priv;
> > > +}
> > > +
> > > +/**
> > > + * mhi_controller_get_devdata - Get MHI controller private data
> > > + * @mhi_cntrl: MHI controller to get data
> > > + */
> > > +static inline void *mhi_controller_get_devdata(struct
> > > mhi_controller *mhi_cntrl)
> > > +{
> > > +    return mhi_cntrl->priv_data;
> > > +}
> > > +
> > > +/**
> > > + * mhi_register_controller - Register MHI controller
> > > + * @mhi_cntrl: MHI controller to register
> > > + * @config: Configuration to use for the controller
> > > + */
> > > +int mhi_register_controller(struct mhi_controller *mhi_cntrl,
> > > +                struct mhi_controller_config *config);
> > > +
> > > +/**
> > > + * mhi_unregister_controller - Unregister MHI controller
> > > + * @mhi_cntrl: MHI controller to unregister
> > > + */
> > > +void mhi_unregister_controller(struct mhi_controller *mhi_cntrl);
> > > +
> > > +#endif /* _MHI_H_ */
> > > diff --git a/include/linux/mod_devicetable.h
> > > b/include/linux/mod_devicetable.h
> > > index e3596db077dc..be15e997fe39 100644
> > > --- a/include/linux/mod_devicetable.h
> > > +++ b/include/linux/mod_devicetable.h
> > > @@ -821,4 +821,16 @@ struct wmi_device_id {
> > >       const void *context;
> > >   };
> > > +#define MHI_NAME_SIZE 32
> > > +
> > > +/**
> > > + * struct mhi_device_id - MHI device identification
> > > + * @chan: MHI channel name
> > > + * @driver_data: driver data;
> > > + */
> > > +struct mhi_device_id {
> > > +    const char chan[MHI_NAME_SIZE];
> > > +    kernel_ulong_t driver_data;
> > > +};
> > > +
> > >   #endif /* LINUX_MOD_DEVICETABLE_H */
> > > 
> > 
> > 
> 
> 
> -- 
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
