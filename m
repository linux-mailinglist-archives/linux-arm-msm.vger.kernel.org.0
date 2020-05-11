Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60CBD1CD145
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 07:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgEKF3E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 01:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725916AbgEKF3E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 01:29:04 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D10AC061A0C
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2020 22:29:04 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id hi11so7280374pjb.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2020 22:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=pnWjpI2HZoB7egROoPywdAvISX8a3wpWqZxbYcZah50=;
        b=K3CuEQRS9GJA7CFCxX2sO1PzOSPOcnTC/fsP7WCbuotLjwO3DyzaG3fnNmIBsqh4FK
         v4HylMvofLvpHa1/N7WbgvQS4nkWdxLM63eVnBFYgxeTLzMRs93i48bSZiNcCG35u3ST
         8lx/oravI78kfSjiWLQ42JLDyCFN55Ys+I/Zk0m+qKr2kodU5+JjOpUTuAohxZzC6owU
         JsQrE/1l+tAqQNMI9okEuyEfzQB3zYmU6QrjIQC3Kano/M+zYEQx3iAOvXhRKYIY3Byh
         RKLteLPDuRCM+aBicPGXOv22pCEbGH4MEEEjP2qOxwv8DRvQGjoa0CgOk0fc3zpJ9To8
         V9nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pnWjpI2HZoB7egROoPywdAvISX8a3wpWqZxbYcZah50=;
        b=ZQJuaJRG9DP16O2ZWRgZkgFMV8MNQx+OvXQgAVmE4DcelpEqXa2yoxYRf1ks8JCvHg
         YGvzUlzbIU0R4lAxYHosQfhvnYNFjEtU7zReNR/q/7S7QmcuvHqgFO5sjzsGPA5CYHHl
         fJNJDZF5Qq3ri12qanexmvYEsggTQasMbf6pNW7lDaucnAxvpPtfN+lPj/ptbHh6nsQ6
         LlqwMjf56/2FZghZJPCQu//xViP+TaU34sfpg7ccNOTHygJUo/1BAxGpIRaCJhc7ZigI
         T+06uBjltyEgAfVUOv5mQXXRRGCjOWbr0auytC45yckUpnmA+rovMdRcFEFqnN9IIBCW
         C3kg==
X-Gm-Message-State: AGi0PuZhikgdEPcIFGpF5Wgbs21cTuPtXp2NbryP70brpDuxikeHHcUI
        snCDw41cdhKx8yygdcvb17CcMw==
X-Google-Smtp-Source: APiQypKfYKTz4bAJ45zCiyx319AtlPqmTqr+KnLBj6SEwv1lLSCeD1hyO5nOGhu4rnt7BuLXCA1+/w==
X-Received: by 2002:a17:902:d70f:: with SMTP id w15mr13986176ply.55.1589174943717;
        Sun, 10 May 2020 22:29:03 -0700 (PDT)
Received: from localhost ([122.167.130.103])
        by smtp.gmail.com with ESMTPSA id ev5sm22505078pjb.1.2020.05.10.22.29.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 10 May 2020 22:29:03 -0700 (PDT)
Date:   Mon, 11 May 2020 10:59:01 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Loic Poulain <loic.poulain@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH] arch: arm64: dts: apq8016-dbc: Add missing cpu opps
Message-ID: <20200511052901.tfjpjawhca7w3tun@vireshk-i7>
References: <1585763459-21484-1-git-send-email-loic.poulain@linaro.org>
 <20200402081349.GA932@gerhold.net>
 <20200403013119.GB20625@builder.lan>
 <20200403100923.GB2652@gerhold.net>
 <20200403175934.GA96064@gerhold.net>
 <20200423045506.GJ987656@yoga>
 <20200426123140.GA190483@gerhold.net>
 <20200506211801.GA165066@gerhold.net>
 <20200507053435.GC3236072@builder.lan>
 <CAPDyKFohjoY0rsTwVGQY_csDRfvxF0RiU+d12EpC+mk6BC95gA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFohjoY0rsTwVGQY_csDRfvxF0RiU+d12EpC+mk6BC95gA@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08-05-20, 14:08, Ulf Hansson wrote:
> + Lina
> 
> On Thu, 7 May 2020 at 07:33, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 06 May 14:18 PDT 2020, Stephan Gerhold wrote:
> >
> > Viresh, Ulf,
> >
> > Stephan is trying to describe the relationship between the CPU rail and
> > the memory rail on db410c (where the performance state of the memory
> > rail needs to be kept above the performance state of the CPU supply.
> >
> > The latter is modelled as a power-domain and the performance state
> > changes as expected, but no one enables the power-domain.
> 
> Just to make one thing clear, from a genpd framework point of view,
> power on/off of a genpd is orthogonal to setting/aggregating
> performance states for it.
> 
> It's instead up to the genpd provider to deal with this (as I
> understand, that seems to be the issue from the below discussions).
> 
> >
> > What's the appropriate method for ensuring the power-domain is
> > enabled/disabled as needed? Should it be referenced in the hierarchical
> > power domain for the CPUs perhaps?
> 
> If I understand the dependency correctly, perhaps you are right that
> there needs to be a subdomain assigned. Although, I don't know if this
> ever has been tested to work for a real use case, when it comes to
> performance state propagations upwards in the hierarchy.
> 
> Viresh?

I have modeled that with a fake system, and yes it was tested. But not on real
hardware but it should work nevertheless.

-- 
viresh
