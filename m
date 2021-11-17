Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3180453ECE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 04:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhKQDMe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 22:12:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229910AbhKQDMd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 22:12:33 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E543EC061570
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 19:09:35 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id w33-20020a17090a6ba400b001a722a06212so3486594pjj.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Nov 2021 19:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VmvoAeCR/cKpJy/KpIWyHW81p5clb62jAM8yRialPxQ=;
        b=oFgww1crxVsH/qa57ET49g0LduNTCft2RWnzvOSTkxtJ9WZSxBR0ap7dD7ziGHqYgW
         BwIwaHyKN2BbF1is/Z//5ShHQMTZKIch5suEfGBBkZNQPNn+k7JRUEZhYU3iny2mEN6Y
         t4+cuRhc975g9+wbMR7nuy+YWQ3DVMH/kklcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VmvoAeCR/cKpJy/KpIWyHW81p5clb62jAM8yRialPxQ=;
        b=JpNRoOFecXqQkU50ZzkUi50agDKxBBb3uaUwt+8zrX2V0kCw5t4xafVvE2C2eelVu/
         Y6AuxYboIl+N9LtsOAyiJ35HYuIqoL8fxEynd3nxiMPMC1RquNiNQlVH2XCUwl1thuYc
         Fwr18skAyiknVXvlLOGAv3khL9W23zYLyCts8lcuvsra+0L98p/Z1F8TO3+pne9AziQu
         wiy1CMXUPY4HNVqJ3v/wHT/t6X9xFBVlxwZ3Ph8s5VLExTtWCBv2VpW0Bx/oQqK8/2qy
         Rg0dH/4x2mV9l0nexo2+7QGMOj8opaFSapds8JCr/V6pZi2goIkehQRzciVT+znX4ehF
         oGQA==
X-Gm-Message-State: AOAM5311PT9NGNxq5N+Bl9Le2A6YsymjggRs0dATemn0ZmS1bJFKi+yL
        BdZvow+4titwE/S0mfUe4X1kkPGF9tqGQg==
X-Google-Smtp-Source: ABdhPJynfDNe4qWqH8XSUQUD1rfM+xr+HUqXvJyGSGhPIm9fjkLSWuvgf0RE+Y2w+jUwtgPQdEDeXQ==
X-Received: by 2002:a17:902:6a8a:b0:143:905f:aec7 with SMTP id n10-20020a1709026a8a00b00143905faec7mr52238085plk.8.1637118575504;
        Tue, 16 Nov 2021 19:09:35 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bcd2:b839:9ed:baea])
        by smtp.gmail.com with ESMTPSA id v13sm21743523pfu.38.2021.11.16.19.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 19:09:34 -0800 (PST)
Date:   Tue, 16 Nov 2021 19:09:32 -0800
From:   Brian Norris <briannorris@chromium.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH v9 2/5] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YZRybAkx1YLiVvfl@google.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-3-git-send-email-quic_c_sanm@quicinc.com>
 <YZRMoNEZTy8XimIx@google.com>
 <YZRXZs5B08SaBqMx@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZRXZs5B08SaBqMx@google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Nov 16, 2021 at 05:14:14PM -0800, Matthias Kaehlcke wrote:
> On Tue, Nov 16, 2021 at 04:28:16PM -0800, Brian Norris wrote:
> > On Mon, Nov 01, 2021 at 01:23:41PM +0530, Sandeep Maheswaram wrote:
> > > +		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(&dwc->xhci->dev)) {
> > 
> > I still find it odd to use device_may_wakeup(), since that's something
> > controlled by user space (sysfs) and doesn't fully factor in hardware
> > support. But that's what xhci-plat.c is doing, so I guess I see why
> > you're imitating it...
> > ...still, feels wrong to me. But so does a lot of how dwc3 works.
> 
> device_may_wakeup() actually factors in hardware support, at least if the
> driver does the right thing (TM).

Well in theory, maybe. But the latter half of the sentence is the key :)

In particular, xhci-plat does the Wrong Thing before this series:

	device_set_wakeup_capable(&pdev->dev, true);

i.e., it doesn't factor any "capability" in at all; it just assumes it.

And per your thoughts below, it's still Wrong after this series.

> The (current) implementation is:
> 
> static inline bool device_may_wakeup(struct device *dev)
> {
> 	return dev->power.can_wakeup && !!dev->power.wakeup;
> }
> 
> '.can_wakeup' should describe the hardware capability to wake up and the
> other flag whether wakeup is enabled (which can be altered by userspace).
> 
> What this series currently does with the .can_wakeup flag is still wrong
> though IMO. Patch "[1/5] usb: host: xhci: plat: Add suspend quirk for dwc3
> controller" [1] dynamically sets the flag with a value that depends on what
> is connected to the bus, so it doesn't specify any longer whether the
> hardware supports wakeup or not.
> 
> [1] https://patchwork.kernel.org/project/linux-usb/patch/1635753224-23975-2-git-send-email-quic_c_sanm@quicinc.com/

I'm not sure either your patch nor Sandeep's patch really get at the
heart of my problem here, which is that neither dwc3 nor xhci-plat are
trying to reflect wakeup capability of the host controller at all. (And
if the host controller doesn't suppor wakeup, it doesn't really matter
what any of its children think.) It seems that
drivers/usb/dwc3/dwc3-imx8mp.c is the only one that actually sets the
correct wakeup flag at the level that we _really_ know what's up -- the
platform/"glue" driver.

Maybe we need to do a little of both: teach the glue drivers (e.g.,
dwc3-qcom.c) to reflect their wakeup capability properly, and then look
at *that* capability (as well as any children, recursively, but only if
the glue driver supports it) when trying to make wakeup decisions.

It still feels wrong that there are 3 separate "can wakeup"
determinations for the host controller though: 1 dwc3-{glue}, 1
dwc3(core), and 1 xhci-plat. But maybe we have to hold our noses on that
one.

Brian
