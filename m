Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 883D81185A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2019 11:57:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727211AbfLJK5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Dec 2019 05:57:49 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:28733 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726915AbfLJK5t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Dec 2019 05:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575975467;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=4pjbgURYLvqlQ7ltYz5xKfqYhTsVzR2Sa6bq4aJbjsg=;
        b=M1/xWbAfMuy9qLylRa8SNr4XtgPlc8U1PF3Md0NDtrywqKNurmzEbYhBQkIstIbEdS
        tYHwR73A7/Sr2noa9cuXGZsOU0ABsYcN+yAQ/u8rj0OXGbdfO+F0KWnYMB7fvx7SFvBB
        RZU/yUmqAsC+CsyjQZjeLiFRRAIS/+MKCjpNirMIjGC4Tr5V7IsMBJ6XWt9Lkexo63wo
        /pPP1PrDB+35VpBLOjb6eul29p0zuz5WiCltstba2VlWpkKu/yL9Ji5rgeJAqst96zz8
        hxx9f/Wf0W/ttX2lZc4aFHxfojJ2zvjtnR0GbCUzJyXYhuT3wI6ekO6+4asPjCo4Rlai
        mTAw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u266EZF6ORJGV8vHxv6O"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.0.2 AUTH)
        with ESMTPSA id R01a59vBAAvdeDj
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 10 Dec 2019 11:57:39 +0100 (CET)
Date:   Tue, 10 Dec 2019 11:57:37 +0100
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.5
Message-ID: <20191210105737.GB228968@gerhold.net>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
 <1573068840-13098-2-git-send-email-agross@kernel.org>
 <CAHLCerN7buq82RmmFkoSi_n8g8sSe9VO2utcXuEGM3xG3HcRTg@mail.gmail.com>
 <20191108031854.GA12993@hector.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191108031854.GA12993@hector.lan>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 07, 2019 at 09:18:54PM -0600, Andy Gross wrote:
> On Thu, Nov 07, 2019 at 07:36:03PM +0530, Amit Kucheria wrote:
> > (Removing arm-soc)
> > 
> > Hi Andy,
> > 
> > On Thu, Nov 7, 2019 at 1:04 AM Andy Gross <agross@kernel.org> wrote:
> > >
> > > Arnd, Olof, and Kevin,
> > >
> > > I have one slight faux paux in this pull request.  A drivers: soc change got
> > > into my arm64 DTS branch and while it is innocuous, it wasn't easy to fix
> > > without messing up a lot of people who depend on the SHAs not changing.  So I'm
> > > sorry for this inclusion.  I'll scrub this better next time.
> > >
> > > Andy
> > 
> > > ----------------------------------------------------------------
> > > Amit Kucheria (5):
> > >       arm64: dts: qcs404: thermal: Add interrupt support
> > >       arm64: dts: msm8998: thermal: Add interrupt support
> > >       arm64: dts: msm8996: thermal: Add interrupt support
> > >       arm64: dts: sdm845: thermal: Add interrupt support
> > >       arm64: dts: msm8916: thermal: Fixup HW ids for cpu sensors
> > 
> > One of my patches to add interrupt support to msm8916 tsens is missing
> > here. Specifically this one:
> > https://patchwork.kernel.org/patch/11201853/
> > 
> > Will there be a second PR this cycle?
> 
> I can work up another and throw it on top.
> 

FYI, the patch seems to be still missing in 5.5-rc1.
tsens now fails to probe on MSM8916 with:

  qcom-tsens 4a9000.thermal-sensor: IRQ uplow not found

Can you queue up the patch as fix for 5.5?

Thanks,
Stephan
