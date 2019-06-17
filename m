Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 897F347777
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 02:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfFQASy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Jun 2019 20:18:54 -0400
Received: from onstation.org ([52.200.56.107]:54760 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727322AbfFQASx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Jun 2019 20:18:53 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 523DC3E956;
        Mon, 17 Jun 2019 00:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1560730732;
        bh=wqA8kfgeU/wUimDPIjCQxIw3A0hNMdWnQpZyfBayxSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k8G3nAUTxcqNgWImzT7xSUUpvFWnN0uIXQY0GSCS5P4TBF3nLsLWog4BZA6HedlLN
         Fe1ps7X05QlQkibypgS1bULvBX066jBkqIn5KG3pWVgoIPG/ZtMEiovQ63Ur8yjS8J
         aVmk4fijaFoLxcWSZedSPwER1/S1LOwGaFbjs4oY=
Date:   Sun, 16 Jun 2019 20:18:51 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        sean@poorly.run, robh+dt@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] drm/msm/gpu: add ocmem init/cleanup functions
Message-ID: <20190617001851.GA19038@onstation.org>
References: <20190616132930.6942-1-masneyb@onstation.org>
 <20190616132930.6942-7-masneyb@onstation.org>
 <20190616180633.GS22737@tuxbook-pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190616180633.GS22737@tuxbook-pro>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Sun, Jun 16, 2019 at 11:06:33AM -0700, Bjorn Andersson wrote:
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > index 6f7f4114afcf..e0a9409c8a32 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > @@ -29,6 +29,10 @@
> >  #include "msm_gem.h"
> >  #include "msm_mmu.h"
> >  
> > +#ifdef CONFIG_QCOM_OCMEM
> > +#  include <soc/qcom/ocmem.h>
> > +#endif
> 
> This file exists (after the previous patch), so no need to make its
> inclusion conditional.
> 
> > +
> >  static bool zap_available = true;
> >  
> >  static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
> > @@ -897,6 +901,43 @@ static int adreno_get_pwrlevels(struct device *dev,
> >  	return 0;
> >  }
> >  
> > +int adreno_gpu_ocmem_init(struct device *dev, struct adreno_gpu *adreno_gpu,
> > +			  struct adreno_ocmem *adreno_ocmem)
> > +{
> > +#ifdef CONFIG_QCOM_OCMEM
> 
> No need to make this conditional.

I have these #ifdefs for the a5xx and a6xx GPUs that don't have ocmem
in the SoC. Without the #ifdefs, those systems would need to have the
ocmem driver in their kernel.

Thanks for the quick review on the patch set!

Brian
