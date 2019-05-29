Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4142D943
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 11:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbfE2Jly (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 05:41:54 -0400
Received: from onstation.org ([52.200.56.107]:42284 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725874AbfE2Jly (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 05:41:54 -0400
Received: from localhost (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 9808F3E80A;
        Wed, 29 May 2019 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1559122913;
        bh=fAIT6Gqdt//3ui/hAaGpZ95WCJf2S6gz5J7z91LX3xU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uDwKDHPwA+58QqCzC0Rg04rxThkFy0yaNMhRG8AOoQTAMbnuw/G+EH8RYfMhlJ/Tl
         My9ZVW4LkMPkxL0I/L8wkMl0ZHEwT6cIPFfZXuh5DfzDM+dYTmGaJ7rdL1hF+63oXo
         XTWXWh0Z+N/0W3PuP3A7PWdxXpTsnbRpSdtZq3Xs=
Date:   Wed, 29 May 2019 05:41:52 -0400
From:   Brian Masney <masneyb@onstation.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org, Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH RFC v2 0/6] ARM: qcom: initial Nexus 5 display support
Message-ID: <20190529094152.GB13436@basecamp>
References: <20190509020352.14282-1-masneyb@onstation.org>
 <CACRpkda-7+ggoeMD9=erPX09OWteX0bt+qP60_Yv6=4XLqNDZQ@mail.gmail.com>
 <20190529011705.GA12977@basecamp>
 <CACRpkdZu5KxKTMqAM5rueWbrXbfPNorOOerezCAA3vgAR6cD5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZu5KxKTMqAM5rueWbrXbfPNorOOerezCAA3vgAR6cD5g@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 29, 2019 at 08:23:17AM +0200, Linus Walleij wrote:
> On Wed, May 29, 2019 at 3:17 AM Brian Masney <masneyb@onstation.org> wrote:
> 
> > It's in low speed mode but its usable.
> 
> How low speed is that?

I don't have a number but my test with 4.17 is to run
'cat /etc/passwd > /dev/tty1' over a serial cable. The first 2-3 calls
will fill up the screen and the file contents appear to show up on the
screen immediately to the human eye. The next time that I run it
requires scrolling the entire console and there is a small fraction of
a second where I see the entire framebuffer contents scroll up. I
don't have a graphics background, but I believe that this is the
tearing effect that I'm seeing based on what I've read. I believe that
disp-te-gpios can be used to mitigate this tearing effect. I have a few
questions about this later once we get the basic display working.

> > I assume that it's related to the
> > vblank events not working properly?
> 
> They are only waiting for 50 ms before timing out, I raised it
> to 100ms in the -next kernel. I'm still suspicious about this
> even though I think you said this was not the problem.
> 
> For a command mode panel in LP mode it will nevertheless
> be more than 100ms for sure, the update is visible to the
> naked eye.
> 
> Raise it to 10000 ms or something and see what happens.
> drivers/gpu/drm/drm_atomic_helper.c:
>  msecs_to_jiffies(50)

I previously raised those timeouts as high as 5 seconds and it still
has the same issue. Writing to /dev/tty1 can take anywhere between a few
seconds to 30 seconds or more.

Brian
