Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1298B1FA65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 May 2019 21:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbfEOTYO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 15:24:14 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:41148 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbfEOTYN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 15:24:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3B3926087A; Wed, 15 May 2019 19:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557948252;
        bh=IhMSDG5a5N0dL5eqitoSAgF0GjbDpoPuc54UFkEWmSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iOG/8mNjRXLkM0rBqsyyQIiRTecWHPhZPWxeULXedlF5fejT5FWLj1ph2vkHUa9kA
         ORmhjFsSttyn0Kq1dWGsCyjCxBKx2GCP2odvEa1v4DKrtcLYy6yJPZ7JWaMd9JFNrp
         5V05iR/GFnIKU6NI+24EzTXwSTl0hiJuQMSiCYPQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6709360592;
        Wed, 15 May 2019 19:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557948251;
        bh=IhMSDG5a5N0dL5eqitoSAgF0GjbDpoPuc54UFkEWmSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OV7VyfmBMxvleNQtJng1Lv6XGtvld6L5TIzlbWqdtSjf5WUElLykidfhqPPR1xL/0
         qjlFI0l1CyL6I1xubXnaaQ76ORsDEPNc1bu6ny8fRd63UFyWl+b0kbgqxGv0aYslUn
         oENiYl4/sMEIww6gtOGGE52lqUjJ89ijC4sWcFV8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6709360592
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 15 May 2019 13:24:08 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@chromium.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC 2/3] arm64: dts: qcom: sdm845-cheza: Re-add reserved memory
Message-ID: <20190515192408.GD24137@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <20190509184415.11592-1-robdclark@gmail.com>
 <20190509184415.11592-3-robdclark@gmail.com>
 <CAD=FV=WXW3aApS=c7baxhtfr1Nf-UnBN2s=rEBBkjj4=TCdT+g@mail.gmail.com>
 <CAJs_Fx5PDj+T+DVixzHjun_wCG5fhZsxH8xUqRwmkfwN87UP_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJs_Fx5PDj+T+DVixzHjun_wCG5fhZsxH8xUqRwmkfwN87UP_A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 14, 2019 at 09:09:55PM -0700, Rob Clark wrote:
> On Mon, May 13, 2019 at 3:48 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, May 9, 2019 at 11:44 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > > From: Douglas Anderson <dianders@chromium.org>
> > >
> > > Let's fixup the reserved memory to re-add the things we deleted in
> > > ("CHROMIUM: arm64: dts: qcom: sdm845-cheza: Temporarily delete
> > > reserved-mem changes") in a way that plays nicely with the new
> > > upstream definitions.
> >
> > The message above makes no sense since that commit you reference isn't
> > in upstream.
> >
> > ...but in any case, why not squash this in with the previous commit?
> 
> Yeah, I should have mentioned this was my intention, I just left it
> unsquashed since (at the time) it was something I had cherry-picked on
> top of current 4.19 cros kernel..
> 
> anyways, I pushed an (unsquashed, converted to fixup!'s) update to:
> 
> https://github.com/freedreno/kernel-msm/commits/wip/cheza-dtb-upstreaming
> 
> which has updates based on you're review comments (at least assuming I
> understood them correctly).. plus some unrelated to cheza-dt patches
> on top to get things actually working (ie. ignore everything on top of
> the fixup!'s)
> 
> I didn't see any comments on the 'delete zap-shader' patch, so
> hopefully that means what I did there was a sane (or at least not
> insane) way to handle android/linux tz vs what we have on cheza?

Yeah. In a world where all the 845 firmware is in linux-firmware the best
differentiating factor would be the absence of the reserved memory or the
zap-shader node in the device tree. Otherwise we would have to try and fail to
execute the scm call and then make some sort of educated guess as to if it
failed for the "right" reasons.

Jordan

> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> >
> > Remove Stephen's Reviewed-by.  In general reviews that happen in the
> > Chrome OS gerrit shouldn't be carried over when things are posted
> > upstream.
> >
> >
> > > +/* Increase the size from 2MB to 8MB */
> > > +&rmtfs_mem {
> > > +       reg = <0 0x88f00000 0 0x800000>;
> > > +};
> > > +
> > > +/ {
> > > +       reserved-memory {
> > > +               venus_mem: memory@96000000 {
> > > +                       reg = <0 0x96000000 0 0x500000>;
> > > +                       no-map;
> > > +               };
> > > +       };
> > > +};
> >
> > nit: blank line?
> >
> > -Doug

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
