Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE072111F5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 19:31:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732536AbgGARbl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 13:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726432AbgGARbk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 13:31:40 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3499C08C5C1
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2020 10:31:39 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j19so5183350pgm.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2020 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4fNzrypwA+h6/cDmXnWYSRWs2TnExn3KjSMmEODDS5k=;
        b=eij/r8Vh/rQed6wZTqGpOc18VEuPZcxNJDWCztfwt/yJl5o9O50Y0Kioeg4lEoOUYf
         b5COS9gDdoCUd6jRHA4b8V3qeWtiUT35a4EVNWIv1kVBLT60wpQew/R3aqshKT3jEnh2
         6uh9PjDzwpNLFb86pW5QGPdxBz12d7V2eGx48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4fNzrypwA+h6/cDmXnWYSRWs2TnExn3KjSMmEODDS5k=;
        b=At19/dcdBm4sLt4Rjzkup1a5NBkQpzc2R+40beNXDogd6NGODRy3Hg5oJTh4B86Vqm
         Ii2QyPHfuvJew4qBA9wdDl17BqbydB3VDSnh770MG7CRt1A4vndkp95y+cSSAP3eoieu
         ACUr1iqsaxNk5IwRBR71FcKwFbI9AhMSNLZa5qDFXBHLUBkGSyXGBtz2WAwu9TlxmZkO
         GuJJbYkX9ARUtlS2ev+xVcstl8+ETN/suRuLNYjUGfH01xHfD6wGybJhJPCc7iFMnw/m
         GOqVeRIAmtrvbPU4AT5Bt9+NhMuGho9vKpjWcf7LZpsopOz5NOEdTrnnVf6zfT5OgeBT
         uagw==
X-Gm-Message-State: AOAM5337SJZgtSU9eKb6xabpsEgBXGyBl4wf2d+qqv+Pxk8EWRiB41yS
        7x060a/0pCZA+LiAtGFWKAp9zw==
X-Google-Smtp-Source: ABdhPJxDxBe8JvlXms+W1hWSshtDpF7DzlWzhcD8TjKp0cMR4Tp3lor5DHtOOMRLn11J3GiOW8kXnQ==
X-Received: by 2002:a63:fc43:: with SMTP id r3mr20981507pgk.423.1593624699558;
        Wed, 01 Jul 2020 10:31:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id 21sm6435524pfu.124.2020.07.01.10.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2020 10:31:38 -0700 (PDT)
Date:   Wed, 1 Jul 2020 10:31:37 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: handle for EPROBE_DEFER for of_icc_get
Message-ID: <20200701173137.GD3191083@google.com>
References: <20200701030842.24395-1-jonathan@marek.ca>
 <20200701171228.GC3191083@google.com>
 <49af8f44-51d4-aded-a34e-55c7c5780008@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <49af8f44-51d4-aded-a34e-55c7c5780008@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 01, 2020 at 01:13:34PM -0400, Jonathan Marek wrote:
> On 7/1/20 1:12 PM, Matthias Kaehlcke wrote:
> > Hi Jonathan,
> > 
> > On Tue, Jun 30, 2020 at 11:08:41PM -0400, Jonathan Marek wrote:
> > > Check for EPROBE_DEFER instead of silently not using icc if the msm driver
> > > probes before the interconnect driver.
> > 
> > Agreed with supporting deferred ICC probing.
> > 
> > > Only check for EPROBE_DEFER because of_icc_get can return other errors that
> > > we want to ignore (ENODATA).
> > 
> > What would be the -ENODATA case?
> > 
> 
> The of_icc_get for the ocmem_icc_path can return -ENODATA when the ocmem
> path is not specified (it is optional and only relevant for a3xx/a4xx).

Thanks for the clarification!

In this case it seems reasonable to me to return any error for the
'gfx-mem' path and all errors except -ENODATA for 'ocmem'.
