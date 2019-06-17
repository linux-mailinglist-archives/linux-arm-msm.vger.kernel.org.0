Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA6B478CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 05:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbfFQDnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 23:43:04 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:46121 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727647AbfFQDnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 23:43:04 -0400
Received: by mail-pf1-f193.google.com with SMTP id 81so4858413pfy.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Jun 2019 20:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=taZZTmqZDJ/thPE/pxrihvxmQccJO4Nc9IvueiEvDBc=;
        b=LizGSr8PfLFiYmns24CLOA6uq9rPTN5J9LMubsnAbQe9RV6tkwJrBNTXdptYXq5mw6
         2vnAvivFmjogvwYbXezf+fKUXJcvI0ecCe2WwoN+nfbyRhMIXvBOmBsgZXZt3TBt/2fj
         2bHdNuQrZjAK3MXJeXs7UjYdTfWqIl3/vAdFohqW2i07pgBld5KNgDuU+Y7o/0NxgqMZ
         7Oh3ewUcSgElC1cHriL60uKCNP919CvPmoBjHYgMoQydxVUWR5Og1bbD6uU7nkS8isH4
         /0119BZ4/nBZy7YDTKG+phwyoX7Ze8Npbz4FRbVFGK964mxOh8Yds774GqIya6KgN5uK
         zQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=taZZTmqZDJ/thPE/pxrihvxmQccJO4Nc9IvueiEvDBc=;
        b=l9++HzV6fYna4nJu0BvPC7W4aoKwPOfHvXaAFxbI4DbKMMzz7BVUFKkrjNKTBEKFCR
         GCQFxthUDtvj1hiZMp5CjcB8TqG99Ds1Mt54PBAMfQnJ2FEx6UIkEwt5/N4nUDScHz/B
         1IrFg4wEZsLett0uBG3bHTFD9JCVI9OTT9d7vXnX688rShstwoJkePFXydO4fb6rTUHU
         pepjG86aWocdgKzvafxBUIJo4myQ3hhsoFW/sHQXqLrTwzS9PEYrRMlGo3oVKk+DNfkC
         4JJoB/CARC5NsBg5N8LemoiX8ikDgF+owvxKFdfUUaT2+C4HqsmHqcJ0JE8ILGnO0LU6
         qKMQ==
X-Gm-Message-State: APjAAAUfgkgl2U5eMPGEjWVKlhqDMn32K0vYqvCyUuFDacUyDrbJtU7H
        HZ5BEk49ijX5p8318e+Lh5wsBA==
X-Google-Smtp-Source: APXvYqxi14hXWZ21/68Cghl+12pHyJ8hnJvsh96H3bdcGwm+nFCpyQijLNQF3h2LfUM4gAlDChUV4A==
X-Received: by 2002:aa7:9ad2:: with SMTP id x18mr31710822pfp.192.1560742983352;
        Sun, 16 Jun 2019 20:43:03 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f7sm8791031pfd.43.2019.06.16.20.43.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 16 Jun 2019 20:43:02 -0700 (PDT)
Date:   Sun, 16 Jun 2019 20:43:51 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/gpu: add ocmem init/cleanup functions
Message-ID: <20190617034351.GA750@tuxbook-pro>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-7-masneyb@onstation.org>
 <20190616180633.GS22737@tuxbook-pro>
 <20190617001851.GA19038@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617001851.GA19038@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 16 Jun 17:18 PDT 2019, Brian Masney wrote:

> Hi Bjorn,
> 
> On Sun, Jun 16, 2019 at 11:06:33AM -0700, Bjorn Andersson wrote:
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > index 6f7f4114afcf..e0a9409c8a32 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -29,6 +29,10 @@
> > >  #include "msm_gem.h"
> > >  #include "msm_mmu.h"
> > >  
> > > +#ifdef CONFIG_QCOM_OCMEM
> > > +#  include <soc/qcom/ocmem.h>
> > > +#endif
> > 
> > This file exists (after the previous patch), so no need to make its
> > inclusion conditional.
> > 
> > > +
> > >  static bool zap_available = true;
> > >  
> > >  static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> > > @@ -897,6 +901,43 @@ static int adreno_get_pwrlevels(struct device *dev,
> > >  	return 0;
> > >  }
> > >  
> > > +int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
> > > +			  struct adreno_ocmem *adreno_ocmem)
> > > +{
> > > +#ifdef CONFIG_QCOM_OCMEM
> > 
> > No need to make this conditional.
> 
> I have these #ifdefs for the a5xx and a6xx GPUs that don't have ocmem
> in the SoC. Without the #ifdefs, those systems would need to have the
> ocmem driver in their kernel.
> 

In order to provide the means for compiling a kernel for a[56]xx without
having to compile ocmem you should move these #ifdef to the ocmem
header file and provide static inline dummies for the case when it's
not.

(and use #if IS_ENABLED(CONFIG_FOO))

Don't forget to add
	depends on QCOM_OCMEM || QCOM_OCMEM=n

to the DRM_MSM config option, to allow the driver pair to be selected in
all possible ways.

> Thanks for the quick review on the patch set!
> 

Regards,
Bjorn
