Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436153E3ECA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 06:20:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231607AbhHIEUs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 00:20:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhHIEUq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 00:20:46 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082A7C061760
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Aug 2021 21:20:27 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id nt11so2739241pjb.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Aug 2021 21:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sCRNReZaLDOQvPH4KjWdDvX5jH3hpYmDMhYSFZyyI+4=;
        b=Y2cgxiqH5ucNbGsSAAImYyUocfH0pYvQ/coZ86iqCrsJkzlYSWBx9tWk+1NJaVnNV2
         hQvTaDaiMT1AtbVhZH1MeUdyfYKcUgIJr4GqqxvL4RUGLOCTseH1Ztae8tRkA81HhuWZ
         9M4m1GSf5oXE71XG2tpY3yFNX/KfI0M7YpkAhOBlROHeD3w6m3R5rG2zXdbvu6fXSYZz
         7Endw//3IknW/uOq95mGC8mbGd2212mbqesZ542mHDDzBVM5TQaYKTwNUsyD+URf3hzf
         LtMKFVSGfyJBo+PCFWJfCRfzwbKwQ7OKeRBkD44kvXAIEGl9W3IXExeJBvI/59b6GhD8
         KRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sCRNReZaLDOQvPH4KjWdDvX5jH3hpYmDMhYSFZyyI+4=;
        b=G58/6cNt+7VbUkfb8yx9L7Cb5fWnkyT19bJ93BYSyHAvx7sMs58jlvFDv++/PPfMwk
         xUGPtsENL/7OrnIv0RS7QbIjlcZq/11CzitRHpbKoPkocjwQ0NneJsSrO5ulTHyCsR7S
         MP5j1gIMrYXTjcCyjHqCB2cs+lK497wAJSA7Ew9Iwy2sLgXYJhvBO1ekd1p5tEndYbg9
         wbciNZPyhZGRtj2MxZtNdB7bQCyZwgmf2zBJZKgnPlokfn4cnw1j+yvTqvjA0TRFy6rb
         pzHZZqWYYsZ7hh2sdIGhp5xecfVayepKTowERLKKtGwfCx2NVehWj8u0krUGa8hMvWBS
         YIng==
X-Gm-Message-State: AOAM530UxrK4aCguAPtp2iMsZBWD0U0o3uVMpCmG4L3al7J7quroGqig
        dVbT1C1pYZ2QP2AQtnElY6/yZQ==
X-Google-Smtp-Source: ABdhPJw45E670g4FSxxD+rVM8EYpeAPwFPVtdr+ur4PMyAaH0Tk3nJXWf7iYnvPpAzNVE33FMf5Gkw==
X-Received: by 2002:a17:902:8648:b029:129:dda4:ddc2 with SMTP id y8-20020a1709028648b0290129dda4ddc2mr10796851plt.4.1628482826555;
        Sun, 08 Aug 2021 21:20:26 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id q19sm17263736pfk.49.2021.08.08.21.20.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Aug 2021 21:20:26 -0700 (PDT)
Date:   Mon, 9 Aug 2021 12:20:19 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/panel: Add Truly NT35521 panel driver
Message-ID: <20210809042018.GD6795@dragon>
References: <20210804081352.30595-1-shawn.guo@linaro.org>
 <20210804081352.30595-3-shawn.guo@linaro.org>
 <YQqDb5eFqIx8tvAL@gerhold.net>
 <20210808134456.GB6795@dragon>
 <YQ/4WkA9ajpQx06A@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YQ/4WkA9ajpQx06A@gerhold.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Aug 08, 2021 at 05:29:30PM +0200, Stephan Gerhold wrote:
> > 2) The driver works good, if the kernel is launched via "fastboot boot".
> >    But if the kernel is flashed to eMMC and launched by bootloader with
> >    splash screen, kernel will fail to bring up the panel.  After kernel
> >    boots up, a blank & unblank cycle can get panel work though.
> > 
> > The problem 2) is not driver generator related.  @Konrad, did you see
> > it on asus-z00t-tm5p5-n35596 driver?
> > 
> 
> Do you have CONFIG_DRM_MSM=y (built-in) instead of =m (module) maybe?
> I think a similar issue exists on MSM8916 but it does not happen
> for some reason if CONFIG_DRM_MSM=m instead of =y. Somehow having it
> load later during the boot process fixes some things there.

Indeed!  I have CONFIG_DRM_MSM=y in my build, and changing it to module
removes the problem.  Thanks much for the hint, Stephan!

Shawn
