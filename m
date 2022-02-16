Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8BF4B91A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 20:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235752AbiBPTp5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 14:45:57 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238306AbiBPTps (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 14:45:48 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E1922B0B0E
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 11:45:34 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id q8so3578266oiw.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 11:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e6yQe3558orWsQDh5OT0ACtDm6j/DudE1IMag6+wpmU=;
        b=cyEisrUfIYIupzeDc7DssR+Xl1dljHVZGnaXZLOJ0ziRL9XEgpuPaEYsbq7SlI+9ZG
         Ua5Zl1a6J7kqGWvycX7gvk6s15vhFJ9PFMimaQCl21vgdBChejWxlu8gpQPFAE9i077Y
         6woHb+/Pu54ONADW/KcHt9XYwKvRdZjNmkgYuslxYg+6kC/qiS3oDMOLp4iRWVoJ7I45
         oY+Rncu3rJRnMxGMeO3CRQWTnSw5H9g3UWfmw3TjntSAukFkDR03YHncuEhAFKTwpbsv
         CnH8va2j8l1tXNVqLwtOPFNQmGmfFQfD8i7wgpHpP5ZSpDJSvJpbJ76cMSQFvhlG5AVz
         D7Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e6yQe3558orWsQDh5OT0ACtDm6j/DudE1IMag6+wpmU=;
        b=qunHjPBJt43ZD3gt0EREP5NXhBh+DyNtmOQi/QmKLFVW/olF3/aq0uGKxQpWOhZLf6
         pUXQTJQbB+POTiK2NwlTDCm/hreqmpKW8uHSeohnNI2ILy1ykupvHPKEEVPJaJZCcKP0
         bSHzEhRAaOvDeEU4jLquhx9bRiiK2w7/GnMk1HCy9TnibAggtVoYDUlVHxQG0lPbYuWw
         pQLlcaTi5kNa5TW5HN6s+It7Us7OyYJ1q2GQBBTbudd2xYZjmo1ri95pdYijVcFYh1oy
         HUu4uBEkTlulLLPr4paDfustAWnckFlJGo1R5ReaaFtYStZmOXbqeItQdJJttNoxejZh
         DFNg==
X-Gm-Message-State: AOAM533JCWQ1yBfeOrNztlDOg/SVbuzMEJf58hDfv0X8SDrefAJoR4qX
        IlgfJfBMTk50fFK5DLrc/KhPvw==
X-Google-Smtp-Source: ABdhPJyJlq7VFOgJ7PeIDbfRTtmz7YoxDnNxuFCSIuzLyAfTeNEgRv2wIwMRQjwpbTLb9U0w3eCjWw==
X-Received: by 2002:a05:6808:2314:b0:2cd:dc2:3edc with SMTP id bn20-20020a056808231400b002cd0dc23edcmr1395304oib.145.1645040733552;
        Wed, 16 Feb 2022 11:45:33 -0800 (PST)
Received: from yoga (rrcs-97-77-166-58.sw.biz.rr.com. [97.77.166.58])
        by smtp.gmail.com with ESMTPSA id c19sm2666744oaq.0.2022.02.16.11.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 11:45:33 -0800 (PST)
Date:   Wed, 16 Feb 2022 13:45:30 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v20 5/5] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
Message-ID: <Yg1UWjGlmtDbjXVD@yoga>
References: <20220119204345.3769662-1-mka@chromium.org>
 <20220119124327.v20.5.Ie0d2c1214b767bb5551dd4cad38398bd40e4466f@changeid>
 <YgJMkFAxjazkUDZd@kroah.com>
 <YgLCswtX/0THkzXT@google.com>
 <CAD=FV=WMP8M5HTRNv9_scvrytbpE0iBdUack=XaHoypGNLJeVA@mail.gmail.com>
 <Ygv3FSDS/fq1oePy@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ygv3FSDS/fq1oePy@kroah.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Feb 12:55 CST 2022, Greg Kroah-Hartman wrote:

> On Tue, Feb 15, 2022 at 09:54:54AM -0800, Doug Anderson wrote:
> > Hi,
> > 
> > On Tue, Feb 8, 2022 at 11:21 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > On Tue, Feb 08, 2022 at 11:57:20AM +0100, Greg Kroah-Hartman wrote:
> > > > On Wed, Jan 19, 2022 at 12:43:45PM -0800, Matthias Kaehlcke wrote:
> > > > > Add nodes for the onboard USB hub on trogdor devices. Remove the
> > > > > 'always-on' property from the hub regulator, since the regulator
> > > > > is now managed by the onboard_usb_hub driver.
> > > > >
> > > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > > ---
> > > >
> > > > No DT maintainer approval yet?  :(
> > >
> > > Bjorn usually just picks DT changes into the QCOM tree when they are
> > > ready, so I wouldn't interpret anything into the lack of an explicit
> > > Ack.
> > 
> > Right, so the expectation is that this patch wouldn't land through the
> > USB tree but would instead land through the Qualcomm tree, probably a
> > revision after the code lands in the USB tree to avoid dependency
> > problems.
> 
> But our tools pick up the whole series.  I can't just do "i will pick
> patches 1-4 only" easily, and neither can any other maintainer.
> 

Most other maintainers uses -P to selectively pick the patches that
applies to their subsystem. That said, I really do recognize the
inconvenience on your part and the number of patches being sent your
way.

> Why not just get their ack so that I know it can come through the USB
> tree?  That's what normally happens for other changes like this where a
> driver change is required first.
> 

Because while the change looks good I don't think it's fine to take it
through the USB tree - the dts tree typically looks like a shotgun hit
across the dts files. And you and I have already seen several times that
dts changes do conflict when you take some of them in the USB tree.

Unfortunately I see only two ways around this problem, either you start
picking selectively or I manage to convince all contributors that they
must split their series to keep dts changes separate (which isn't a bad
idea in itself).

Regards,
Bjorn
