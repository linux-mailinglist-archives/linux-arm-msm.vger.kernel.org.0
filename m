Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C20C3198460
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2020 21:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbgC3TZR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Mar 2020 15:25:17 -0400
Received: from asavdk3.altibox.net ([109.247.116.14]:48062 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbgC3TZR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Mar 2020 15:25:17 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 5F9AB20024;
        Mon, 30 Mar 2020 21:25:13 +0200 (CEST)
Date:   Mon, 30 Mar 2020 21:25:11 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Harigovindan P <harigovi@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        sean@poorly.run, seanpaul@chromium.org
Subject: Re: [PATCH v10 0/2] Add support for rm69299 Visionox panel driver
 and add devicetree bindings for visionox panel
Message-ID: <20200330192511.GG7594@ravnborg.org>
References: <20200327073636.13823-1-harigovi@codeaurora.org>
 <20200328204047.GG32230@ravnborg.org>
 <20200329174417.GB199755@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200329174417.GB199755@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=VwQbUJbxAAAA:8
        a=-x4TflB_B6iPNPREh9QA:9 a=CjuIK1q_8ugA:10 a=AjGcO6oz07-iQ99wixmX:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Matthias.

On Sun, Mar 29, 2020 at 10:44:17AM -0700, Matthias Kaehlcke wrote:
> Hi Sam,
> 
> On Sat, Mar 28, 2020 at 09:40:47PM +0100, Sam Ravnborg wrote:
> > Hi Harigovindan
> > 
> > On Fri, Mar 27, 2020 at 01:06:34PM +0530, Harigovindan P wrote:
> > > Adding support for visionox rm69299 panel driver and adding bindings for the same panel.
> > > 
> > > Harigovindan P (2):
> > >   dt-bindings: display: add visionox rm69299 panel variant
> > >   drm/panel: add support for rm69299 visionox panel driver
> > 
> > I have only the first patch, which is now applied.
> > Please resend second patch as it is lost somewhere.
> 
> Yes, it seems for v8, v9 and v10 only the bindings were sent, even
> though the cover letter and subject say it's a series of two patches.
> 
> To my knowledge the latest version of the driver patch is this:
> 
> https://patchwork.kernel.org/patch/11439689/

I did not go back and check, but I recall there was
review feedback that is not yet addressed.

I applied the patch here and checkpatch was not happy:
total: 14 errors, 22 warnings, 11 checks, 314 lines checked

Many of these are trivial indent or spaces used where tabs should be
used.
These needs to be fixed before the driver will be applied.

And there was too much that I just did it while applying.

	Sam
