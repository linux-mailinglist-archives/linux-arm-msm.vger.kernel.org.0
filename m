Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92AE36D901
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 15:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238846AbhD1N7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 09:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236662AbhD1N7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 09:59:49 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5C9BC061573
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 06:59:04 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id m13so63103429oiw.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Apr 2021 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hkp8JPyq7iKOdx3agaKyk/nZwtc1iq2iKAqgAsmLo9o=;
        b=zkOrRMTj8vr++X/SyozrLDvCSxZvoFs44VJYVqI5/yijoEx0jC6XQpJZiFruyQT8Ah
         6QKKhJ8ox2SRg/T/O6428Iz9lC44qlHr5PTIyvx7Y0K6m4DdRNsnwT2TrdwUuPPwsHkC
         SMXZZmQSUTWS5HjM9vExRNvBxPArcV06t05tGm7WNcPMAsRy+1stb3wY9oxw4oGNIn4y
         rFkc+1MdwDxPW5Qcgve6MZ3GfZpErllMTncvT63GhchY9NGtmkE5ldrVoWKH9VCp0P0I
         e0vQgrWKC2b8ZCPWg4z+StCfsmb5JGE861cc6Hn3OlR1ENpJ8/+sGdHi98MrEuDuhXbm
         MVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hkp8JPyq7iKOdx3agaKyk/nZwtc1iq2iKAqgAsmLo9o=;
        b=TOcIBkcQ7aBfSxceD60XbdfI1aMXyH999OlOlQ1iholqqqjShLRja2cUbZvdgNIbAT
         dWA/sPuYbqUosB479UNGwezRg5QkAzx6fgg1OyQMINw3+3SdoxjTl990yT1EgAqr7wRd
         EdeawVxMTkfqPerDbyr3kOsZAQTrf+GwLbCEVIqqv3xQEatzJgrFvENVPuQkby/eLjmk
         A9G0Czj11bbs+UOhr3PqHnOZzc9+L+OVHtj1uOrWs1HbxY2vNHAvvsnhZXpWuGXoaGG4
         zdLgSKffgyGcx7ZQczsmazOudidOXX6tOucP+odOfX/FSCrji1YCXXmfdNEF2JMN/cVr
         EKFQ==
X-Gm-Message-State: AOAM531BH8KdrR2ZaVrizKC+qnKs8xWGLNtWJn2/8Tm2lqPNNI0t3PSw
        EU+JBy/S2SX05EngmkXoXzpV5Q==
X-Google-Smtp-Source: ABdhPJyvGFX8lyxoyrN/Yr95YZIBqU4KcCqXVw71nLljBeqX2mob8YGKbLikMcFtRl/YDjTPxSs9oA==
X-Received: by 2002:aca:4157:: with SMTP id o84mr2920512oia.65.1619618344263;
        Wed, 28 Apr 2021 06:59:04 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i9sm11330otr.19.2021.04.28.06.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 06:59:03 -0700 (PDT)
Date:   Wed, 28 Apr 2021 08:59:01 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/4] drm/msm: get rid of msm_iomap_size
Message-ID: <20210428135901.GK1908499@yoga>
References: <20210427001828.2375555-1-dmitry.baryshkov@linaro.org>
 <20210427001828.2375555-4-dmitry.baryshkov@linaro.org>
 <20210428024755.GJ1908499@yoga>
 <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80622cc2-5585-abaa-42e0-cc6969ed6ae3@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 28 Apr 08:41 CDT 2021, Dmitry Baryshkov wrote:

> On 28/04/2021 05:47, Bjorn Andersson wrote:
> > On Mon 26 Apr 19:18 CDT 2021, Dmitry Baryshkov wrote:
> > [..]
> > > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > > index 92fe844b517b..be578fc4e54f 100644
> > > --- a/drivers/gpu/drm/msm/msm_drv.c
> > > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > > @@ -124,7 +124,7 @@ struct clk *msm_clk_get(struct platform_device *pdev, const char *name)
> > >   }
> > >   static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name,
> > > -				  const char *dbgname, bool quiet)
> > > +				  const char *dbgname, bool quiet, phys_addr_t *psize)
> > 
> > size_t sounds like a better fit for psize...
> 
> I was trying to select between size_t and phys_addr_t, settling on the
> latter one because it is used for resource size.
> 

I always thought resource_size_t was an alias for size_t, now I know :)

That said, I still think that size_t (in line with resource_size_t)
gives a better hint about what the parameter represents...

Regards,
Bjorn
