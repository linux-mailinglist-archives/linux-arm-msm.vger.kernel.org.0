Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D82354230
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 14:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240654AbhDEMup (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 08:50:45 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.54]:36091 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhDEMuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 08:50:44 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617627033; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=o6/6nRqoSEiQHs7anxLscrtDjd5SX1zzlcf3tM5SWcT8ft0tVaUiiFZ8n2Z+Z5fx38
    uLIsG0PYkHENHrA34oRKg85op8AjfMZrJ0E+vEgkuE6YGJySaaggoXOXVxy1Oe3VKZE3
    eWR+DhBgKNt8mfYK8bLTT3i6VrPisHMl4usIcRBttvjQzTtg5hqzRGt2g8MgYnqN2Aqg
    wQ/Bmj6J3nKuiuzSNhnbzUEk0xCotE3XGSfRIFwfu3wry2rN6D0h3oHXkQkMwOvPRau5
    FbISfBDR6pOvLJ0zwlnXD88MWVp2rT26J+mrRAQBu11d7K9A1frBNN0NjEAFQy0dBIiA
    fhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617627033;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=zJVagVFXfJKJUrYqmv9KADc0LD1OoaKGX0WdHTJaSjo=;
    b=HxJA7nI8dxtqqvmJeR+0oIOTwDONZT6hhdoBm37rj0awuSczV8TA+hrFM/3d4/fOe5
    qc8tJEWIdm9qzcMxR7dDftfBx/bEl260xazJs5Naf3KYhIN2rrGHueBoZnUx/XBbN8Zn
    4aX6P4zFysZF+0uRlswCv4JIUFoJtxsVCnccyjOXPdmxyaMWWdPpFYUAQrF4LsCqlw2z
    j+y7r0fAI6aQwlyCx+ZBNjn12WFjqGkdcjHx/nGFN3c0aYuOtxdX3Pb8mdbK5U94txUG
    P3/B0bCwOKbdihzqz/qPn2PqTONd2H7WkBAbvv3JO6fii+N0xOduUvWOHQBLVtPGA5DI
    7vkg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617627033;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=zJVagVFXfJKJUrYqmv9KADc0LD1OoaKGX0WdHTJaSjo=;
    b=EgzdA9HGtAQuE7fgxCxKgzJpleF1WXWbrQ4K+4GpxFtnecG5GTj0C1alYXVoaNDWzq
    0vQVUsp6bUaDoKW+FJjEtFu8zMOtsWWLwy/wpSKjePD0Cq3/0Tz73YzcWpgv+OLts5mt
    nIGYDYmE7MtVXrTJ2aA0QNMT5FhLhQGkfkP+3zvHew3XK4lRCfSNYa/ImWm7AHryEJSy
    iZsAH7CypGp/GOfx5FvqT2mw1HhOPKeP8WUcJ15Am1c2XBndCuYFluOPHd7Fg5VTMsOt
    qFIA5llRv6aE5UBWhb9eICmOduz2TZvUSvaHGeE/YIADUCg7aFZEJwfPrCo9JJv/1nV7
    F87Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IczAaYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.23.1 DYNA|AUTH)
    with ESMTPSA id q0a3c1x35CoWAlX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 5 Apr 2021 14:50:32 +0200 (CEST)
Date:   Mon, 5 Apr 2021 14:50:26 +0200
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
Message-ID: <YGsHkoNEaIvCRdpx@gerhold.net>
References: <20210323224336.1311783-1-swboyd@chromium.org>
 <6ec0ca8d-85c7-53d6-acf2-22c4ac13e805@codeaurora.org>
 <161734672825.2260335.8472441215895199196@swboyd.mtv.corp.google.com>
 <YGbvXFrMg6X7q3qL@gerhold.net>
 <161738411853.2260335.5107124874054215375@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161738411853.2260335.5107124874054215375@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 02, 2021 at 10:21:58AM -0700, Stephen Boyd wrote:
> Quoting Stephan Gerhold (2021-04-02 03:18:04)
> > On Thu, Apr 01, 2021 at 11:58:48PM -0700, Stephen Boyd wrote:
> > > [...]
> > >
> > > Maybe it would be better to catch that problem at the source and force
> > > arm64 calling convention to be safe? I'm thinking of this patch, but it
> > > could be even more fine tuned and probably the sc7180 check could be
> > > removed in the process if the rest of this email makes sense.
> > > 
> > > If I understand correctly CONFIG_ARM64=y should never use legacy
> > > convention (and never the 32-bit one either?), so we can figure that out
> > > pretty easily and just force it to use 64-bit if the architecture is
> > > arm64. If only the 64-bit convention is supported on arm64 then we
> > > really don't even need to call into the firmware to figure it out on
> > > arm64. We can do this convention detection stuff on arm32 (CONFIG_ARM)
> > > and always assume 64-bit convention on CONFIG_ARM64. Is that right?
> > > 
> > 
> > No, the detection is also needed on ARM64. On ARM32 there can be either
> > legacy or SMC32, but on ARM64 there can be either SMC32 or SMC64.
> > You cannot use SMC64 on 32-bit, but you can use SMC32 on ARM64 just
> > fine. SMC32 is used on MSM8916 for example.
> > 
> 
> Ah right, the whole secure world running in 32-bit mode thing. Is
> msm8916 the only SoC that's using that? Or are there more? If only
> msm8916 is affected then we could use a combination of CONFIG_ARM64 and
> the compatible string to differentiate and then if more SoCs use 32-bit
> secure world then we could have a new compatible string like qcom,scm-32
> that tells us this fact. Maybe this was all discussed before and I
> missed it. Either way, I'm trying to get rid of this boot call so that
> we don't have to bounce to the firmware an extra time to figure out
> something we can figure out from the kernel arch and scm compatible
> string.

At least MSM8994 also uses SMC32 from what I heard. Overall it's
probably quite hard to get that right now since all boards were tested
with the dynamic detection so far. I suppose you could do the opposite,
add an optional qcom,scm-64 to skip the detection step and force SMC64.

Also note that this could even be firmware-specific, not necessarily
SoC-specific. There are some ancient MSM8916 firmwares that have legacy
instead of SMC32. I could also imagine that there is also some SoC where
there are different firmware versions with SMC32 or SMC64.

Plus, IMO the overhead for this detection is negligible. At least it
ensures that we always use the right calling convention. The PSCI code
probably does much more firmware calls to figure out all supported
features.

Stephan
