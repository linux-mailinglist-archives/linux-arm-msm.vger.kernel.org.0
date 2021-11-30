Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBB4462ED9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Nov 2021 09:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239766AbhK3IvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Nov 2021 03:51:17 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:55962 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235027AbhK3IvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Nov 2021 03:51:16 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 604DBCE181F;
        Tue, 30 Nov 2021 08:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FBEBC53FC1;
        Tue, 30 Nov 2021 08:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638262074;
        bh=psMimz0pO+oQFczoJqzaMemQvUUVjII8gZ43yp8LhvQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tOLQ5yewmzR7mXEZc4ShLH36bFKuom9nP4C9WqF9wRbY6crK3OYEPlNq5SxW5lz4w
         fbQ0S5vUW4wFAC40k4gPqVXQkNEuPjNg82nZGU73d5PWuGYf2Sdp49jnQg1Dq1MWMD
         r3sAyCt9H3tnFU/YAWLk1AbIxjLEnidzDz45RBm6VJy69UCLTKiyFLJT7XFswumQXb
         xBV9oziduzet+pkvGc6oBhlAQkGd7SyqeHlrShTboMflp+xbihBPsXGNRPhKlcEVMs
         4Nvu0Vzd1Q+Yt7AYVr/kZQIvASkBq70L7pOS4usqYJhroiWoRDyktcsueNcH8WREJ8
         kbaog2zG3ZEFQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mryno-008ozq-PH; Tue, 30 Nov 2021 08:47:52 +0000
Date:   Tue, 30 Nov 2021 08:47:52 +0000
Message-ID: <87k0gqm3lz.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Maulik Shah <quic_mkshah@quicinc.com>
Cc:     Shawn Guo <shawn.guo@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] irqchip: Add Qualcomm MPM controller driver
In-Reply-To: <2e821841-a921-3fda-9ee6-3d5127653033@quicinc.com>
References: <20211126093529.31661-1-shawn.guo@linaro.org>
        <20211126093529.31661-3-shawn.guo@linaro.org>
        <87czmmbu8k.wl-maz@kernel.org>
        <20211129133308.GB10105@dragon>
        <87pmqjm1c8.wl-maz@kernel.org>
        <20211130023151.GD10105@dragon>
        <2e821841-a921-3fda-9ee6-3d5127653033@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: quic_mkshah@quicinc.com, shawn.guo@linaro.org, tglx@linutronix.de, bjorn.andersson@linaro.org, robh+dt@kernel.org, loic.poulain@linaro.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Nov 2021 07:49:48 +0000,
Maulik Shah <quic_mkshah@quicinc.com> wrote:
> 
> [1  <text/plain; UTF-8 (7bit)>]
> Hi Shawn,
> 
> On 11/30/2021 8:01 AM, Shawn Guo wrote:
> >>>>> +	do {
> >>>>> +		r_val = readl(priv->base + offset);
> >>>>> +		udelay(5);
> >>>>> +	} while (r_val != val);
> >>>> What? Is this waiting for a bit to clear? Why isn't this one of the
> >>>> read*_poll_timeout*() function instead? Surely you can't wait forever
> >>>> here.
> >>> This is taken from downstream, and it seems to double check the written
> >>> value by reading it back.  But to be honest, I'm not really this is
> >>> necessary.  I will do some testing with the read-back check dropped.
> >> How about asking for specs instead? There are QC people on Cc, and
> >> many more reading the list. Hopefully they can explain what this is
> >> all about.
> > Maulik,
> > 
> > If you have some information about this, that would be great.
> 
> This can be converted to read poll_timeout(). This was introduced in
> place of wmb() to make sure writes are completed.

A string of reads isn't equivalent to a dsb(st). If there is a
requirement for the write to complete, then use the required barrier.

	M.

-- 
Without deviation from the norm, progress is not possible.
