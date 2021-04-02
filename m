Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B182C3529A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 12:18:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234448AbhDBKST (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 06:18:19 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:21038 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229605AbhDBKSQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 06:18:16 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1617358690; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=lbhEVOyiP1K0Ai25xiA0D/u/eExjq+tLmls4X/2C1zWFup7ZFh2oqnwaujjvpx7RbC
    6Uf84xdDOUMET/qZkfGfERIi8FjZ2gcpzCujZMQQTrsLoeNn/lyYH3qvlXxlnnsb0CaA
    NElTU1Sq7cup82S/ADeeOoquzP/DZUNjgFtLD2JLjNYnYENCYIXW/R28O/4++rXM38RQ
    jKDFixqpfs8iXmB85cFAUGxRp0cPCB8PCZHIZgz9qLWzDsKw2GcpwyiOYl9MfzgzU/v6
    0tCPqQQ9KyY8xRJETKfjFezTgvAwC0XbKYhni1OjlJZAGP+b2sAlZLnxTD8fhn0pj2AP
    yXGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1617358690;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Xis9t6GR3U5PdxpwNv74+ch9cRR+3YlXApYu66KrVdY=;
    b=mQWpM6zBDlJYQIy4uYviT+GOpHXPUvLS38DqVlXVQnp3LjcyvoGRDEGZwx3x1Zkzth
    si4tpEtSbyKJztGbY42ffTH81F7T48ByzAMYjJXEI4C7CrNw5x6GfcfOJwL8LoRLKSmD
    9bAVFRoiQNXg9Cu+G19C4IqU8yDb3V9wPWWmPvxNc05+bu62rlbNLbSPlCL7PL1O5o77
    l8XB+CieQMOiozPba060osbET+k2EJEAls9iAzLFniCYr/Uyy4hcQkZSUvrXMmqMRzdG
    3y3Lx9RWNOxsmFhVvoO2Y5XQfDdgYR8syi6Dy7CJuGQxivsiVzXoZ91DjOk9oYw2VPmt
    vncw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1617358690;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Xis9t6GR3U5PdxpwNv74+ch9cRR+3YlXApYu66KrVdY=;
    b=XqiKXhYzxIGyi8lZ+iFKDgpf3/CPDz1XtvpLdslWAp/KkbHJjIzRSexFyUgkgMFuzI
    iGMVAvq2qdyocGgiOleHKOa5TlRFHi6JjL7EXsZnDHco/M+oM09op9CnZ2r+DhnRXKT+
    ppZ1Jsf7/AdCY5pSFD32ztLx/O4wYJfAwQaRNdu1awrYf6Yby9/FpIXXXvdDEW1peqpa
    oeEqfqxfwyvchb3YQF1sGpvYSuhtEp5R8ZRuJ/8+Q8gSHtYFBFWfB77/9zYkjrCJKbg1
    OLDEi6inVHWrNyqt/SF+3Hu60fEmWEMV5o9gWwjwvQIE4ETpa74F4D0C77DEVY+XhgDP
    pfwg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Ic/GaYo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.23.1 DYNA|AUTH)
    with ESMTPSA id q0a3c1x32AIAzbE
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 2 Apr 2021 12:18:10 +0200 (CEST)
Date:   Fri, 2 Apr 2021 12:18:04 +0200
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
Message-ID: <YGbvXFrMg6X7q3qL@gerhold.net>
References: <20210323224336.1311783-1-swboyd@chromium.org>
 <6ec0ca8d-85c7-53d6-acf2-22c4ac13e805@codeaurora.org>
 <161734672825.2260335.8472441215895199196@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161734672825.2260335.8472441215895199196@swboyd.mtv.corp.google.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 01, 2021 at 11:58:48PM -0700, Stephen Boyd wrote:
> Quoting Elliot Berman (2021-04-01 18:12:14)
> > 
> > It might be a good idea to wrap these lines from qcom_scm_call with #if 
> > IS_ENABLED(CONFIG_ARM), and the corresponding ones in qcom_scm_call_atomic:
> > 
> >    case SMC_CONVENTION_LEGACY:
> >        return scm_legacy_call(dev, desc, res);
> > 
> > If something is wrong with loaded firmware and LEGACY convention is 
> > incorrectly selected, you would get a better hint about the problem: 
> > "Unknown current SCM calling convention." You would still get the hint 
> > earlier from __get_convention, but that may not be obvious to someone 
> > unfamiliar with the SCM driver.
> > 
> > I'll defer to your/Bjorn's preference:
> > 
> > Acked-by: Elliot Berman <eberman@codeaurora.org>
> > 
> > with or without modifying qcom_scm_call{_atomic}.
> > 
> 
> Maybe it would be better to catch that problem at the source and force
> arm64 calling convention to be safe? I'm thinking of this patch, but it
> could be even more fine tuned and probably the sc7180 check could be
> removed in the process if the rest of this email makes sense.
> 
> If I understand correctly CONFIG_ARM64=y should never use legacy
> convention (and never the 32-bit one either?), so we can figure that out
> pretty easily and just force it to use 64-bit if the architecture is
> arm64. If only the 64-bit convention is supported on arm64 then we
> really don't even need to call into the firmware to figure it out on
> arm64. We can do this convention detection stuff on arm32 (CONFIG_ARM)
> and always assume 64-bit convention on CONFIG_ARM64. Is that right?
> 

No, the detection is also needed on ARM64. On ARM32 there can be either
legacy or SMC32, but on ARM64 there can be either SMC32 or SMC64.
You cannot use SMC64 on 32-bit, but you can use SMC32 on ARM64 just
fine. SMC32 is used on MSM8916 for example.

Stephan
