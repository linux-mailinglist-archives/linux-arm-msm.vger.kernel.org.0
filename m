Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 452DD357D34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 09:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhDHHUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 03:20:04 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:19285 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbhDHHUE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 03:20:04 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617866390; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=VRgBCmLpmZTxEUnaRLpVLPBHmBGcMvRL0C3bwbSOi7kufhYuxMR0newxpdwd8CQcqE
    m/BLUZx4myP/pKS3U8QkCVXuGP7N776yp9kFTHGQS7T9GgKoDnNdUOFtymU02Vh8Pui9
    iinAzx/8tcPBwnghnWTm0Hl+J5omEmROx8V7eQzwWXBjZf26tM0JlPs+iEFHNcDhVDQj
    mhAZln/VRtOpkpwpVo78rD7orZyLx0q4FuvCrfWRnDVMTPt9hqaxLaZEoTmufTuMpqgw
    7zN2B9CwnIyJ9yh+bi+drmb39+yD4xy4xOFYgtEJz9/Y5ql1qsISBqHKsyErBU3Dq9Qq
    f6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617866390;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=2h6hM5h3fRJGo2XlRQdFdnB1OZxCAvmjY32yw7u4HuQ=;
    b=dwf8BIrfbfhI+LK0QZaoHWultPPDT2ur0gmkb0JK+ktrc13OKsRL6LaXLYa2sYTNdp
    uk9jYUi+iTUCmF/r4VmcqhjynzYUDFbOe+oKxvzhndwzG6k4dRCtb9JON1UspZtnzqs3
    C9jXkHSa2//f9Ovww0CR8BCR+iTCHqzXD47BXCbqqOxAIC9EpiymUsTSZsdig3m4AZQR
    UaE8KzWM7VrNP/FNuBrsdeF+LCrWtYPBK2snbStIMGrQ2qm9xQ/doylLamX/SaEoWWiN
    GSIpaXcKHU42Gy/tyAOzBTlVA2isxWC10q1I3CIRPz6xGpJ1xjdZCYEDgCWQcI43ECJB
    8zwQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617866390;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=2h6hM5h3fRJGo2XlRQdFdnB1OZxCAvmjY32yw7u4HuQ=;
    b=D/4m3EBlwfBNIjqCkD5cwenLJ58iQYf8aJEP0Y3vV+z6BEOUMMqYpM5vWmO80P/74N
    GdE/qSt2vwyX6gNjvKL5ISG7KMAinVrA9Nc3RijUzH+vk+Bfr+zmyFl62iJ4tTG4McXB
    Thai3Zd8825ltOsv+jvz68ahwlkQF19HSL+t+IE3FrgcKLVTCDIXDEuV3zqtL3JqiLpC
    Iq+0w0B8WK0fIonxWBt04HgSbd8NcC4ruyHmuNNbwiIX2OlLZMAxJc9eepRPFRGCjZqK
    Y0an24JDVKaA72K6+fVRHC2wqNNwinCQPFo2aKZRCN9xfQF4sl7JLEdxec2flz7O7dnG
    vpTA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j6IczAaYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.24.0 DYNA|AUTH)
    with ESMTPSA id 409abax387Jo55Q
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Thu, 8 Apr 2021 09:19:50 +0200 (CEST)
Date:   Thu, 8 Apr 2021 09:19:44 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] firmware: qcom_scm: Only compile legacy calls on ARM
Message-ID: <YG6ukFxSMAZ7biYh@gerhold.net>
References: <20210323224336.1311783-1-swboyd@chromium.org>
 <6ec0ca8d-85c7-53d6-acf2-22c4ac13e805@codeaurora.org>
 <161734672825.2260335.8472441215895199196@swboyd.mtv.corp.google.com>
 <YGbvXFrMg6X7q3qL@gerhold.net>
 <161738411853.2260335.5107124874054215375@swboyd.mtv.corp.google.com>
 <YGsHkoNEaIvCRdpx@gerhold.net>
 <161784072681.3790633.7665111601750934002@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161784072681.3790633.7665111601750934002@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 07, 2021 at 05:12:06PM -0700, Stephen Boyd wrote:
> Quoting Stephan Gerhold (2021-04-05 05:50:26)
> > On Fri, Apr 02, 2021 at 10:21:58AM -0700, Stephen Boyd wrote:
> > > 
> > > Ah right, the whole secure world running in 32-bit mode thing. Is
> > > msm8916 the only SoC that's using that? Or are there more? If only
> > > msm8916 is affected then we could use a combination of CONFIG_ARM64 and
> > > the compatible string to differentiate and then if more SoCs use 32-bit
> > > secure world then we could have a new compatible string like qcom,scm-32
> > > that tells us this fact. Maybe this was all discussed before and I
> > > missed it. Either way, I'm trying to get rid of this boot call so that
> > > we don't have to bounce to the firmware an extra time to figure out
> > > something we can figure out from the kernel arch and scm compatible
> > > string.
> > 
> > At least MSM8994 also uses SMC32 from what I heard. Overall it's
> > probably quite hard to get that right now since all boards were tested
> > with the dynamic detection so far. I suppose you could do the opposite,
> > add an optional qcom,scm-64 to skip the detection step and force SMC64.
> 
> Isn't SMC64 going to be the overall majority going forward? Legacy
> convention is for sure limited to CONFIG_ARM so I'll send another
> follow-up patch to add a warning if we find legacy on CONFIG_ARM64.
> SMC32 is hopefully no longer being produced given that it was introduced
> at the time that the bootloader team wasn't supporting PSCI and didn't
> want to support it. So we're making all new boards/SoCs/firmwares do
> this calling convention probing to figure out something they already
> know?
> 
> Maybe we should probe the calling convention on msm8994/msm8916 and
> otherwise assume SMC64 on CONFIG_ARM64 kernels. I'd expect the exception
> list to be smaller that way.
> 

Personally, I think it would be best to introduce a new, SMC64 only
compatible (e.g. "qcom,scm-64" like I mentioned). Then you can skip the
detection check for the boards that opt-in by adding the compatible.
You can then use it on all newer boards/SoCs/firmwares where you know
exactly that there is SMC64.

I would just like to avoid breaking any existing boards where we don't
know exactly if they have SMC32 or SMC64.

> > 
> > Also note that this could even be firmware-specific, not necessarily
> > SoC-specific. There are some ancient MSM8916 firmwares that have legacy
> > instead of SMC32. I could also imagine that there is also some SoC where
> > there are different firmware versions with SMC32 or SMC64.
> 
> Sure but in theory the firmware would update the DT to indicate what
> sort of firmware is there.
> 

In a perfect world the firmware would do that, but there is certainly
no such mechanism on any of the old SoCs :/

> > 
> > Plus, IMO the overhead for this detection is negligible. At least it
> > ensures that we always use the right calling convention. The PSCI code
> > probably does much more firmware calls to figure out all supported
> > features.
> > 
> 
> Heh, it tried to ensure we use the right calling convention but broke
> things in the process, because the way of detecting the convention isn't
> always there. I wouldn't be surprised if this comes up again for other
> boards that use TF-A.

Ah okay, this sounds like a better reason than just trying to avoid the
"overhead" of the detection step. :) I still think it should work if you
just start marking all newer boards/SoCs/... as "qcom,scm-64" or
something like that, right?

Thanks,
Stephan
