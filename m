Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0573E8E20
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 12:08:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236993AbhHKKIa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 06:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237057AbhHKKIX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 06:08:23 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40012C0617BE
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 03:07:53 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id k2so1958516plk.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tzsS7AZHN5hyd5i/vgo5pHazU+FL6RQAhM9b4mH3Hqc=;
        b=xrg/dN5zYbriK5itgrKCFqwpt+tinhh9L15HeF9ETxBRpzawjZhN+vtNwQXjjaR8v0
         MNMTTN+tXhlSPNM8qipa7OYd60SCVukCgd0Y6YJLdEAQw3VYCHFYOqwIUIhhFtERSGZ/
         wlA8jJ5WT34nwiSSC65FuuGPkxZ9bA4KNM+Q8SJO2JRhovDhAfFR4AWh2MROFe+zVRxN
         aEHMrJoEpBX3wkLBg1QHKRci/W0t6cSqweFGSE5mbCv9WeypUmZOLaXsntY1KcZfoTnU
         2S01vgFvBZ82jQ2RvEyU1O+qWzGWsFL7pdIRnc8M2GQWJhVQ/QQxiM0I3dKAh2Xp4Wvc
         vzqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tzsS7AZHN5hyd5i/vgo5pHazU+FL6RQAhM9b4mH3Hqc=;
        b=Kg9Yq7VZSFwQvvkkP+O6KoBaujedX74lQ13teAK9V1J+DirX/9Y20zf2sJ241zsDSp
         r1WhIgkKbIbCUs/kX50aenFmXfOB1ZYiKnOML+svffDrxwEsjtj6BDpN0ZJd74YK8Vf+
         vFi+VobCBq19nvuWCtx6MN/2iw0wjgT3zGzbdhs9zqrCN6Y4dp/XfyTTd1Uaf9AkGjT/
         yYamn1+yjE0x6xAl5WeO9gNNDrSa4lwrYCGwEDg7LR3vaVJULlaXXyCfbPRS+mF56HRJ
         Z6ExdJhLDtTJ8MbYEfn++W0DiXcFjT+QwFX3VhqQOHuAzNGS4SYUZ8BEJo9skBgA1l/+
         NNPQ==
X-Gm-Message-State: AOAM5307QynlGYWtCW8PYe5p5E0fwsmzjSIYcNuBlAhggP8tC0GUZ8yX
        uyuOoCSD4CFAhu+b/bAIEPBw2w==
X-Google-Smtp-Source: ABdhPJxRiSSMq+j2y9GrkjclfC8eCBy4HeC/eBdFwjlqBgsbEfhh24xzyew4tdnIOtXaJlSnoDnklw==
X-Received: by 2002:a17:902:8301:b029:12c:d401:1b52 with SMTP id bd1-20020a1709028301b029012cd4011b52mr259440plb.10.1628676471746;
        Wed, 11 Aug 2021 03:07:51 -0700 (PDT)
Received: from localhost ([122.172.201.85])
        by smtp.gmail.com with ESMTPSA id ci23sm24633791pjb.47.2021.08.11.03.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 03:07:51 -0700 (PDT)
Date:   Wed, 11 Aug 2021 15:37:49 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v6 1/2] PM / Domains: Add support for 'required-opps' to
 set default perf state
Message-ID: <20210811100749.kwg6435m7xj7ulwa@vireshk-i7>
References: <1628074696-7979-1-git-send-email-rnayak@codeaurora.org>
 <1628074696-7979-2-git-send-email-rnayak@codeaurora.org>
 <CAPDyKFrebwt5=S7hqXvcqRvt+-EXLcVmRSRZt1uPf-9n7_pRDg@mail.gmail.com>
 <2afd0fac-ed28-c090-a345-3fd4284b4125@codeaurora.org>
 <20210810024308.gurvzpbe2bc2bhky@vireshk-i7>
 <e452c0b5-5555-d6e2-40da-6aa21a26766d@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e452c0b5-5555-d6e2-40da-6aa21a26766d@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11-08-21, 15:30, Rajendra Nayak wrote:
> In my case I don't want to error out if the property is missing, I want to error out
> only when the property exists but can't be translated into a performance state.
> 
> So currently I check if the property exists and *only then* try to translate it, Ulf asked
> me to skip the check. If I do that and I call of_get_required_opp_performance_state()
> unconditionally, and if it errors out I will need to put in additional logic (check for
> return value of ENODEV) to distinguish between the property-does-not-exist vs
> property-exists-but-cannot-be-translated case.
> It just seems more straight-forward to call this only when the property exists, Ulf?

The same check will be done by OPP core as well, so it is better to
optimize for the success case here. I will say, don't error out on
ENODEV, rest you know well.

-- 
viresh
