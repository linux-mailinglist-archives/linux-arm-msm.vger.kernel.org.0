Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B025E1F5C06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 21:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730274AbgFJTin (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 15:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730018AbgFJTin (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 15:38:43 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60DDC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 12:38:42 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e18so1420682pgn.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 12:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Td+Hx06E+e9F1O9JIhYF1vMbzyy7ZP3sq7uvC8JK3wg=;
        b=dhG2Q0uTj+7iphhFpEGZ9PWuteEaHz4NrECdrVSSGdffrYMFXVSSnT74UWtAmIOK24
         YCcBpZE2Z7evEd5PAvkn5NPs5ZB4EuRIB7KogEkhWxRp7r9V0t20jYbwjCAdYF660sMV
         B8rQLO7dvBjnLTXyrzzk46jixbsNwddCwLODB1AKJ65TWIbaNhcAkXRU6mTwrT6IEd2K
         LD0xS7Rju4gSW/2BU1JYgH9ie4ALFxjNeBn/nfkjH58MEey/OYoMvv87rzxnTa2vbaCU
         +MU/sUH5O+eWsBggarxtoAVKukHFoxo6GjiwatZy3ESngigltmot2tM0gg5oAbFDBvyh
         gkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Td+Hx06E+e9F1O9JIhYF1vMbzyy7ZP3sq7uvC8JK3wg=;
        b=jykih2UISaf+T1BBEfSpCadihTV4VFTSffHJc/oqJlqQYD3WyEjAdFhNbfmJig+L6N
         i0Ch90AbDBs/JPOKfa/83UkZCFvsN5zhXE53FXx5fQ/ElcOmjV05foYYx7/XpK7qu8Rd
         9DRmUNjJ6h9ajJBL9CpggK0SphsKo4IkJLf9oz/CXSmwjjqUTvEVsjBhSnSq+gcywxK2
         XWwEIIYI7ojtM2400lV4OrcNz17+flBc13SKH7WUBErthSP6w9l6aUJoVuWDop00Vr8H
         77B+YBcTJWseng+k3MEGzA/AXxL6Nqmb7Mj8wIIA6ou7sPfV/AJZKnpouKjHpaOp6g2E
         OetA==
X-Gm-Message-State: AOAM533pMRyTX9c+wAEb4QtK0eE5qZZWjtx43zdHIN2UHJfjDxmaXbNg
        VnpmGeRdEKV8lVBeahHK7D9N6w==
X-Google-Smtp-Source: ABdhPJwNMzK3e5aMgbzRItHsCHFq2d5DaCNeUz6V0o0/Or2vT7bu9rtBfB9dzhC6Ax/6GNC0nPiPJA==
X-Received: by 2002:a62:86cd:: with SMTP id x196mr4080689pfd.158.1591817921979;
        Wed, 10 Jun 2020 12:38:41 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w18sm680040pfq.121.2020.06.10.12.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 12:38:41 -0700 (PDT)
Date:   Wed, 10 Jun 2020 12:37:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jack Pham <jackp@codeaurora.org>
Cc:     Wesley Cheng <wcheng@codeaurora.org>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        mark.rutland@arm.com, robh+dt@kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: Re: [PATCH 1/3] usb: typec: Add QCOM PMIC typec detection driver
Message-ID: <20200610193757.GB1246811@builder.lan>
References: <20200609205851.30113-1-wcheng@codeaurora.org>
 <20200609205851.30113-2-wcheng@codeaurora.org>
 <20200610011837.GA14816@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200610011837.GA14816@jackp-linux.qualcomm.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 09 Jun 18:20 PDT 2020, Jack Pham wrote:

> Hi Wesley,
> 
> On Tue, Jun 09, 2020 at 01:58:49PM -0700, Wesley Cheng wrote:
> > The QCOM SPMI typec driver handles the role and orientation detection, and
> > notifies client drivers using the USB role switch framework.   It registers
> > as a typec port, so orientation can be communicated using the typec switch
> > APIs.  The driver also registers the VBUS output regulator, so client
> 
> Doesn't look like it.. As we discussed in earlier revisions we decided
> to drop the regulator.
> 
> > drivers can enable the VBUS source when acting as a source/host.
> > 
> > Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> > ---
> >  drivers/usb/typec/Kconfig           |  11 ++
> >  drivers/usb/typec/Makefile          |   1 +
> >  drivers/usb/typec/qcom-pmic-typec.c | 278 ++++++++++++++++++++++++++++++++++++
> >  3 files changed, 290 insertions(+)
> >  create mode 100644 drivers/usb/typec/qcom-pmic-typec.c
> > 
> > diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
> > index 559dd06..8de2520 100644
> > --- a/drivers/usb/typec/Kconfig
> > +++ b/drivers/usb/typec/Kconfig
> > @@ -73,6 +73,17 @@ config TYPEC_TPS6598X
> >  	  If you choose to build this driver as a dynamically linked module, the
> >  	  module will be called tps6598x.ko.
> >  
> > +config TYPEC_QCOM_PMIC
> > +	tristate "Qualcomm PMIC USB typec driver"
> > +	depends on ARCH_QCOM
> > +	help
> > +	  Driver for supporting role switch over the Qualcomm PMIC.  This will
> > +	  handle the type C role and orientation detection reported by the QCOM
> > +	  PMIC if the PMIC has the capability to handle type C detection.
> > +
> > +	  It will also enable the VBUS output to connected devices when a
> > +	  DFP connection is made.
> > +
> >  source "drivers/usb/typec/mux/Kconfig"
> >  
> >  source "drivers/usb/typec/altmodes/Kconfig"
> > diff --git a/drivers/usb/typec/Makefile b/drivers/usb/typec/Makefile
> > index 7753a5c3..cceffd9 100644
> > --- a/drivers/usb/typec/Makefile
> > +++ b/drivers/usb/typec/Makefile
> > @@ -6,4 +6,5 @@ obj-$(CONFIG_TYPEC_TCPM)	+= tcpm/
> >  obj-$(CONFIG_TYPEC_UCSI)	+= ucsi/
> >  obj-$(CONFIG_TYPEC_HD3SS3220)	+= hd3ss3220.o
> >  obj-$(CONFIG_TYPEC_TPS6598X)	+= tps6598x.o
> > +obj-$(CONFIG_TYPEC_QCOM_PMIC)	+= qcom-pmic-typec.o
> >  obj-$(CONFIG_TYPEC)		+= mux/
> > diff --git a/drivers/usb/typec/qcom-pmic-typec.c b/drivers/usb/typec/qcom-pmic-typec.c
> > new file mode 100644
> > index 0000000..ce6319c
> > --- /dev/null
> > +++ b/drivers/usb/typec/qcom-pmic-typec.c
> > @@ -0,0 +1,278 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/regmap.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/of_device.h>
> > +#include <linux/usb/role.h>
> > +#include <linux/usb/typec_mux.h>
> > +#include <linux/workqueue.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/regulator/driver.h>
> > +#include <linux/regulator/machine.h>
> > +
> > +#define DCDC_BASE			0x1100
> 
> along with USB_BASE @ 0x1300, is it ok to allow this driver to access
> registers outside of its 'reg' base (0x1500 according to the DT
> bindings)?
> 

Depending on how entangled a future driver for the charger blocks would
be one could either just upstream a dcdc regulator driver to control
vbus today, or a "lite version" of a charging driver exposing just the
vbus regulator.

Either way I would prefer this over poking the register directly from
this driver, as it will make it tricky to migrate to a proper charger
driver later.

Regards,
Bjorn
