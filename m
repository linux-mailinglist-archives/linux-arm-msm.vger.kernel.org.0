Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB59F3E54
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 04:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbfKHDS5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 22:18:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:37086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbfKHDS5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 22:18:57 -0500
Received: from localhost (mobile-107-92-63-247.mycingular.net [107.92.63.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 215742084D;
        Fri,  8 Nov 2019 03:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573183136;
        bh=xt29T8BQ5Ybg+79CQWKq0HVKX+jG/2dpLfMwTw9mF7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wneKloIVW1UmK29rzt/FE4sxapyCJkm6HISLK0cVNIPsPbzxiUy467StbawxD+3t6
         r3xCXZesdKLd0jbBCM3I9LVwsGPU3b4hbJadvYXA/jws+bL8Voho5Mu/b1Bh+WQ0Os
         e6GWPdITyDq7XwgsKq0D1OT1KYM0GQnv4vwhA3jo=
Date:   Thu, 7 Nov 2019 21:18:54 -0600
From:   Andy Gross <agross@kernel.org>
To:     Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.5
Message-ID: <20191108031854.GA12993@hector.lan>
Mail-Followup-To: Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <1573068840-13098-2-git-send-email-agross@kernel.org>
 <CAHLCerN7buq82RmmFkoSi_n8g8sSe9VO2utcXuEGM3xG3HcRTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerN7buq82RmmFkoSi_n8g8sSe9VO2utcXuEGM3xG3HcRTg@mail.gmail.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 07, 2019 at 07:36:03PM +0530, Amit Kucheria wrote:
> (Removing arm-soc)
> 
> Hi Andy,
> 
> On Thu, Nov 7, 2019 at 1:04 AM Andy Gross <agross@kernel.org> wrote:
> >
> > Arnd, Olof, and Kevin,
> >
> > I have one slight faux paux in this pull request.  A drivers: soc change got
> > into my arm64 DTS branch and while it is innocuous, it wasn't easy to fix
> > without messing up a lot of people who depend on the SHAs not changing.  So I'm
> > sorry for this inclusion.  I'll scrub this better next time.
> >
> > Andy
> 
> > ----------------------------------------------------------------
> > Amit Kucheria (5):
> >       arm64: dts: qcs404: thermal: Add interrupt support
> >       arm64: dts: msm8998: thermal: Add interrupt support
> >       arm64: dts: msm8996: thermal: Add interrupt support
> >       arm64: dts: sdm845: thermal: Add interrupt support
> >       arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
> 
> One of my patches to add interrupt support to msm8916 tsens is missing
> here. Specifically this one:
> https://patchwork.kernel.org/patch/11201853/
> 
> Will there be a second PR this cycle?

I can work up another and throw it on top.


Andy
