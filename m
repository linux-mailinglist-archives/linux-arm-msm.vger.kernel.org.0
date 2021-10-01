Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5774541E873
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 09:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352578AbhJAHit (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 03:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352534AbhJAHis (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 03:38:48 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A39C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 00:37:05 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id m21so8604995pgu.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 00:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hgVhHWVUu08DXtFCRHboJq5v6mJIO8cklYq5x1GQ77U=;
        b=wWYh3TDjn4Uqqzpc5Qkw5TdYYEXdp/cq3tfsR7q1NxSkBdLuh/fCyGsJjtwviPeCIy
         cvZB14KTl6kMkZsS9unzMAjABtztlcAihzc+OyWXGfT3Pn+dAntDqG9fOCjjk9fBXxzL
         o1oOzsyQV0IEF8icxakhsJ1jmF3LPqcFRtpRPrpjUHG8jpF4KAlzTFzHg/Bzx7kq627w
         +zJmDsE9Ju6ILsW7zZipkm88KOfs/4+lOZTfN7DtbGxONwk9tCO5Mgplcp/bHBFc/LKE
         6UzYAUp43cTFEeyrOvuVplsWWu0S17SpEpG/+xQ3UltHCJSIqyQbX5cTjU6hBE7hSDLn
         Nvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hgVhHWVUu08DXtFCRHboJq5v6mJIO8cklYq5x1GQ77U=;
        b=w2zj7LBnchHtjQMp+xzpAS3Dj9dh4ZWSp2myVMZ50m6hgShcTAeznrGL1sVYKTRjEI
         eQ04h7nsmjTBV+QzyoXE/ixzLnAZRnUDOaG9Hs4IXNBxtPsgMrDzOkKoTA/MiTIr7Be+
         c0ooSlmeSl3RTWtwRCxEF4l+7kGyEubUccily+u6MpJhac3Qer4IrJg+mY9+z3nmC/0T
         cNiiWLBAD9CUuO86l8KlCVuPd2DPBKdmrwrNWinTkKS+vZqJlBoo4817VhYlQwtyF8ne
         eUGETQKqvV5BSuMwh5++hIbCc4C8ODZ8Rlm8Es63CE3mxi7IwP+nu1x53NjuojdCCG9R
         IF1w==
X-Gm-Message-State: AOAM531YsBAEI5aIsFkD7R5bfrSGFLjWTYqE8G6FkTNivcq7jftA8jD/
        rUmEGUoRUjnm+2UQjWVt5tma
X-Google-Smtp-Source: ABdhPJy2wvrjI4EW4a4QluGSUZXC5JWNkQWWMAUPQxHVeK0jD1ceK83WZzgQL62XdUlBc9iNNZ9rEw==
X-Received: by 2002:a63:2b03:: with SMTP id r3mr8673151pgr.188.1633073824445;
        Fri, 01 Oct 2021 00:37:04 -0700 (PDT)
Received: from thinkpad ([117.193.209.206])
        by smtp.gmail.com with ESMTPSA id w185sm2655580pfd.113.2021.10.01.00.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 00:37:03 -0700 (PDT)
Date:   Fri, 1 Oct 2021 13:06:59 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Thomas Perrot <thomas.perrot@bootlin.com>
Cc:     Aleksander Morgado <aleksander@aleksander.es>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>,
        stable <stable@vger.kernel.org>
Subject: Re: [PATCH] bus: mhi: pci_generic: increase timeout value for
 operations to 24000ms
Message-ID: <20211001073659.GC5821@thinkpad>
References: <20210805140231.268273-1-thomas.perrot@bootlin.com>
 <f358044a-78d0-ad63-a777-87b4b9d94745@aleksander.es>
 <73A52D61-FCAB-4A2B-BA96-0117F6942842@linaro.org>
 <CAAP7ucL1Zv6g8G0SWAjEAjr6OSVTyDmvmFkH+vMmmBwOH2=ZUQ@mail.gmail.com>
 <54c063613fe63282a1c26b312c772e89b662eae6.camel@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54c063613fe63282a1c26b312c772e89b662eae6.camel@bootlin.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 30, 2021 at 10:07:57AM +0200, Thomas Perrot wrote:
> Hello,
> 

[...]

> I made experimentation on a Sierra EM9190 (SDX55) engineering sample,
> using a old development firmware.
> 
> So, I agree that setting the same timeout of 24000ms for all modems, is
> not necessarily relevant.
> However, the current default value seems too low, in view of timeouts
> used on vendor-branded, then using a higher value seems relevant.
> 
> Moreover, Sierra EM919x modems use a custom controller configuration,
> we are currently working on it. As our tests not being sufficiently
> conclusive, so we have not yet submitted.
> 

Okay. Then please add a separate config for this device when you have it. It
makes more sense to have the longer timeout only for devices that need it.

Thanks,
Mani

> Best regards,
> Thomas
> 
> > > 
> > > It was derived from testing I believe.
> > 
> > Following your reasoning above, shouldn't this 24000ms timeout be
> > applied only to the Sierra Wireless EM91xx devices (which may have
> > custom firmware bits delaying the initialization a bit longer), and
> > not to the generic SDX24, SDX55 and SDX65?
> > 
> > If I'm not mistaken, Thomas is testing with a custom mhi_pci_generic
> > entry for the EM91xx; as in
> > https://forum.sierrawireless.com/t/sierra-wireless-airprime-em919x-pcie-support/24927
> > .
> > I'm also playing with that same entry on my own setup, but have other
> > problems of my own :)
> > 
> > 
> > --
> > Aleksander
> > https://aleksander.es
> 
> -- 
> Thomas Perrot, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
> 


