Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F15DF338160
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 00:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhCKXXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 18:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbhCKXW4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 18:22:56 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F644C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:22:56 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id y131so22104065oia.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 15:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PyNoaK/SfNfXNK50hLCIkKpqRzcLYWyG2KnpZv/ZhAE=;
        b=jic1z4WkFBhsPZmyMNuhmd6uxncF8ngqFQbeNVA7MtGO/DJXCQT71EG/ZIYJ7tzkAq
         3bUY3uR/KRdDZf2l2dstpz0ujYtj9qec/apWxk0DUPMdMi2hCCV8i/IStimd8oaL6RvY
         iy/LMoVRSwoFzE3wXWtDpJpUZdmCt6rOlNv+3P/I8rTnlJn4uquiHQ5+xvcwor740CY1
         IJnGwgLzWqhxu2z1ABMJr0eVeROk7fUVkgpoyrarFf+3rc7CAuLm+cB3SnCf1miWgxVb
         VEwZnn6nFPgBaQ+AB2OqBtYZHClNlVsQAHWlO1rerk+avF1j2WC9ybMh0R9yguvEzv3t
         nKyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PyNoaK/SfNfXNK50hLCIkKpqRzcLYWyG2KnpZv/ZhAE=;
        b=nFDxjRfXImQ2V5INrf1Aa26GzIHsUcXj5/+5BgHLR3r/fBivBkLeIsl+OBPkoehCV+
         hnoyOmC7XKK091RIPep4CWbKgIW4u8+WqNn5Cauy8HFB3VJ9Z0e02WzeOD+LAur4xX+K
         +lBBJQ9ag8d4ueRtP3Pj8NiMOXCzbfA/qwNPS2Dh2g50jxZB/b2o3FmYKXhtnmdMMB9Z
         0T8HCpLJT4DygfipAx3LUSPm7bPfVQjkx+pXu+x+wmhPhYFt8jQ0gFg8oQ8KrQqMmEia
         bG6JEL3OZs4epvl3oXZvZ4ZsynwRqr+y2rUrkwp5yDQH53Pz7sJlFlXKTG3w9WtvY8J1
         jgGQ==
X-Gm-Message-State: AOAM531tI+5fq8gw9dTnrqfVaE760gQQ6gmgfAWnrx7pkEVXSmXGR1vL
        q+gSOzKIcUZAIn+tHJwEYTIfIQ==
X-Google-Smtp-Source: ABdhPJxXxWCBlLBF1TLedRj6F84xxFyJFjXEX2r5uDQP+4D6ZVwSFsX4OwYZzRf7J571fK74M++cyg==
X-Received: by 2002:aca:31d7:: with SMTP id x206mr7758847oix.178.1615504975424;
        Thu, 11 Mar 2021 15:22:55 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i3sm793159oov.2.2021.03.11.15.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 15:22:55 -0800 (PST)
Date:   Thu, 11 Mar 2021 17:22:53 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v2] pinctrl: qcom: support gpio_chip .set_config call
Message-ID: <YEqmTUXbn0T2dqla@builder.lan>
References: <20210303131858.3976-1-shawn.guo@linaro.org>
 <CACRpkdZp7m0s+6Fgzq4ScftAr-CtEPtAbz3jGCvKTzdqXJtfAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZp7m0s+6Fgzq4ScftAr-CtEPtAbz3jGCvKTzdqXJtfAA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Mar 17:03 CST 2021, Linus Walleij wrote:

> On Wed, Mar 3, 2021 at 2:19 PM Shawn Guo <shawn.guo@linaro.org> wrote:
> 
> > In case of ACPI boot, GPIO core does the right thing to parse GPIO pin
> > configs from ACPI table, and call into gpio_chip's .set_config hook for
> > setting them up.  It enables such support on qcom platform by using
> > generic config function, which in turn calls into .pin_config_set of
> > pinconf for setting up hardware.  For qcom platform, it's possible to
> > reuse pin group config functions for pin config hooks, because every pin
> > is maintained as a single group.
> >
> > This change fixes the problem that Touchpad of Lenovo Flex 5G laptop
> > doesn't work with ACPI boot, because PullUp config of Touchpad GpioInt
> > pin is not set up by the kernel.
> >
> > Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> > ---
> > Changes for v2:
> > - Add pin config functions that simply call into group config ones.
> 
> Patch applied!
> 

As discussed in [1]; several key Qualcomm platforms have a gpio-ranges
representing the number of real GPIOs, but we then expose the UFS reset
GPO (no input) pin as a GPIO as well - making the two numbers differ.

I've moved ahead and merged the update to gpio-ranges, to make the two
match, but Shawn reports that with the introduction of .set_config() all
existing DTBs fail to probe storage because of the UFS code getting
EPROBE_DEFER back on its gpiod_get_optional().

I don't know how to make the transition, but can you please revert this
patch, to avoid breaking compatibility with DTBs out there?

[1] https://lore.kernel.org/linux-arm-msm/20210311230924.GX17424@dragon/#t

Regards,
Bjorn
