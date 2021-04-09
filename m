Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCE435A660
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 20:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234746AbhDIS4p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 14:56:45 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:46604 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234613AbhDIS4o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 14:56:44 -0400
Received: by mail-ot1-f43.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso4741208otb.13;
        Fri, 09 Apr 2021 11:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6T+M3NoD5td0wQAw6hyiN+qgaPpFpsrDduJt8kVUpUk=;
        b=HkJGmm+8qW7Tri5icmtL38gd2NbeznSSf+DWACrffA68w+V2I6YH4CJrfgxdtVwVT9
         9r9OkMQ6VJtdjard5ClDQ/iU/M/EYVi6cjcdxOlc/IFSIC9cbRe/HCwEFGArpy1TKGaH
         5X5bDn0YDgtA671L4wiqUbTFhdq9dXUxjLGxXdI9qw8O9eXc0JkdrLYuG3ipE2ZvLEjX
         GezJ+SIIj6c3x+Fo2VlgjfqYjvqqclcXw/Wo3mwkn6DoavW7gT94+74qOpnx+MGeWEN+
         lR3kM8y8bvVrcc9wUbCPnfBiVwy9gz7HJzz945q6UINE0+cmPplvBgL/W+7OMf0qoNd7
         gitw==
X-Gm-Message-State: AOAM531s19b5Vzz2f/rQqs7disOmdGPu/rH8dzBSNmISinnZzs7lqytV
        lF4d43gVQo9Fywyspr1YDA==
X-Google-Smtp-Source: ABdhPJw9x4V0s5tlyS/Oyje1TX6KemXPcS6jRpSbsNlcqRp+FtaeDsKA83P6Q80KHyff/p6UdbAazA==
X-Received: by 2002:a9d:ec4:: with SMTP id 62mr13564169otj.277.1617994590117;
        Fri, 09 Apr 2021 11:56:30 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w199sm671232oif.41.2021.04.09.11.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:56:29 -0700 (PDT)
Received: (nullmailer pid 3958423 invoked by uid 1000);
        Fri, 09 Apr 2021 18:56:27 -0000
Date:   Fri, 9 Apr 2021 13:56:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Guru Das Srinagesh <gurus@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: pm8008: Add IRQ listing
Message-ID: <20210409185627.GA3956543@robh.at.kernel.org>
References: <cover.1617927259.git.gurus@codeaurora.org>
 <2607ca31fce40ecdb1e8c96dac0fb688c26ad722.1617927259.git.gurus@codeaurora.org>
 <20210409155519.GX904837@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210409155519.GX904837@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 09, 2021 at 10:55:19AM -0500, Bjorn Andersson wrote:
> On Thu 08 Apr 19:38 CDT 2021, Guru Das Srinagesh wrote:
> 
> > Add a header file listing all of the IRQs that Qualcomm Technologies,
> > Inc. PM8008 supports. The constants defined in this file may be used in
> > the client device tree node to specify interrupts.
> > 
> > Change-Id: I13fb096da54458f2882e8d853a3ad9c379e7d5a9
> 
> Please remember to drop the Change-Id when posting to the mailing lists.
> 
> 
> We typically don't have defines for the IRQ numbers, but I don't mind.

But I do because then others will think it's a good idea.

> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn
> 
> > Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
> > ---
> >  include/dt-bindings/mfd/qcom-pm8008.h | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 include/dt-bindings/mfd/qcom-pm8008.h
> > 
> > diff --git a/include/dt-bindings/mfd/qcom-pm8008.h b/include/dt-bindings/mfd/qcom-pm8008.h
> > new file mode 100644
> > index 0000000..eca9448
> > --- /dev/null
> > +++ b/include/dt-bindings/mfd/qcom-pm8008.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2021 The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#ifndef __DT_BINDINGS_MFD_QCOM_PM8008_H
> > +#define __DT_BINDINGS_MFD_QCOM_PM8008_H
> > +
> > +/* PM8008 IRQ numbers */
> > +#define PM8008_IRQ_MISC_UVLO	0
> > +#define PM8008_IRQ_MISC_OVLO	1
> > +#define PM8008_IRQ_MISC_OTST2	2
> > +#define PM8008_IRQ_MISC_OTST3	3
> > +#define PM8008_IRQ_MISC_LDO_OCP	4
> > +#define PM8008_IRQ_TEMP_ALARM	5
> > +#define PM8008_IRQ_GPIO1	6
> > +#define PM8008_IRQ_GPIO2	7
> > +
> > +#endif
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > a Linux Foundation Collaborative Project
> > 
