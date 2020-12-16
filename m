Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 603E72DC6A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 19:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731227AbgLPSk5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 13:40:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731442AbgLPSk5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 13:40:57 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D4E5C0617A6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 10:40:16 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id p126so28615970oif.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Dec 2020 10:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HX05UPZbfakFNT6esS7y3dkO3JZ1/EyRxqvrW/rwkR0=;
        b=Id04pE4Gmxa9hBuBqHwF8Xbry18NqejeslL5cyHb6hce0goJ400yI9vdlvE+V15keZ
         WP2j2syjVqDSpvFPkcpTd/GoAMxvp+MX9muiMBc2qb1qToKQl6ziCmkN0epXCUlM+Z1m
         Z43Dc7XI1U9P9jrmJq1c0cAX7tSgbappxv4JzElnZMNXObJPhftw2tJWP1Qx2pqmgoj/
         1ciRv2EY1s7O1OIzspukAox5chn9O3pNeCBtEjG/rhj9U/KLcE/DzJbJFjMV4fcZql04
         C7IPfm+ZY8YPPfjhkTxMjvCqRlyvtMO10XjIKda/6cgDY/tG5nT3LMIQ9HOzzrBE6Plo
         tjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HX05UPZbfakFNT6esS7y3dkO3JZ1/EyRxqvrW/rwkR0=;
        b=hjYeYDOkvPZbzwPLScqQB/I8a66TVRbIW3aYtODf/qn2gKDeJsujJGRMmE8i1jUbTK
         /YRKGd2fDs0ACNsw+VlCRtkloaAq55+6IAouKWkQjhX7VZaTNNf0o/0AXfztMoxYN3iK
         zbNWqu/VisGOk/R75haMvmY2RGzI2OE0nCzH/veBttiyULuFBYsylrD/+0Eys9HnPMvv
         VnDFrx1h8yFs2RFbHxBAzRxOAi8mZAbSHy88oTnBzC0HpSKjZtj1UocAoBHvDFeAYpiW
         BU55bluLTrLCvN/yfnIbQrtYAZkdiO/W86oG1wqGXbSYmewk50aJfiZEQZ/M7tXIXPuL
         t7kg==
X-Gm-Message-State: AOAM533vjf5Rno8WhrXeZBvjFwj+qvobeuMALt7vveA1e3Utqj4jrCjD
        9G6QmALNEbQsVkF+kDTIDZy+XQ==
X-Google-Smtp-Source: ABdhPJwCWVwMv4ymBqD9ZXT8j0l8JfNX+uns7F5dvspx+SMuq1kGfuY/gyqCID5dDV52iAV35xBF4w==
X-Received: by 2002:aca:54d8:: with SMTP id i207mr2694795oib.101.1608144015474;
        Wed, 16 Dec 2020 10:40:15 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o135sm642714ooo.38.2020.12.16.10.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Dec 2020 10:40:14 -0800 (PST)
Date:   Wed, 16 Dec 2020 12:40:13 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] gpiolib: Allow name duplicates of "" and "NC"
Message-ID: <X9pUjU6hPI1cKS3H@builder.lan>
References: <20201215170308.2037624-1-bjorn.andersson@linaro.org>
 <CACRpkdZKKetFFm8AanVnzV9SyZhuurLHT_ZTak27-vGEdqVgEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZKKetFFm8AanVnzV9SyZhuurLHT_ZTak27-vGEdqVgEw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 16 Dec 06:46 CST 2020, Linus Walleij wrote:

> On Tue, Dec 15, 2020 at 6:02 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> 
> > Not all GPIO pins are exposed to the world and this is typically
> > described by not giving these lines particular names, commonly "" or
> > "NC".
> >
> > With the recent introduction of '2cd64ae98f35 ("gpiolib: Disallow
> > identical line names in the same chip")' any gpiochip with multiple such
> > pins will refuse to probe.
> >
> > Fix this by treating "" and "NC" as "no name specified" in
> > gpio_name_to_desc()
> >
> > Fixes: 2cd64ae98f35 ("gpiolib: Disallow identical line names in the same chip")
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> >
> > The introduction of 2cd64ae98f35 breaks pretty much all Qualcomm boards and
> > grepping the DT tree indicates that other vendors will have the same problem.
> >
> > In addition to this the am335x-* boards will also needs "[NC]", "[ethernet]",
> > "[emmc"], "[i2c0]", "[SYSBOOT]" and "[JTAG]" added to this list to allow
> > booting v5.11 with the past and present dtb/dts files.
> 
> I pushed this patch yesterday that fixes the obvious "(empty string)" problem:
> https://lore.kernel.org/linux-gpio/20201215123755.438369-1-linus.walleij@linaro.org/T/#u
> 

Unfortunately we've almost consistently used "NC" for the Qualcomm
platforms, so that seems to fix only a single platform :(

> But I see this is for device tree line naming only, right?
> 

Yes.

> I think I will conjure a patch allowing identical naming only for
> device property naming (like from device tree) but emitting a
> warning so that people fix it to something unique moving
> forward.
> 

I'm not against emitting a dev_err() when we hit duplicates, remove the
return and then update the various dts files to use "" for things that
doesn't have a name.

Regarding special handling of the DT case, I think (beyond making all
these boards boot again) it would be nice to make
gpiochip_set_desc_names() take the list of names and a length and use
the same function in both code paths...


PS. strlen(names[i]) is O(N), strcmp(names[i], "") is O(1).

Regards,
Bjorn
