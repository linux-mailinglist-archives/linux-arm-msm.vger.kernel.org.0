Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F6C3E8F0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 12:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237221AbhHKKxL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 06:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231143AbhHKKxJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 06:53:09 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8095C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 03:52:45 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id p142so293371vkp.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Aug 2021 03:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sY3RpgyWHBy4W+/+RqTX6YRD6atJotbsjKLoIW0AnuM=;
        b=SjhJcaaQaR3bgI6mINR8blfMfqZUZQAmUCU/WQ3q81hg9P2cOxROif/hBHMm6/9ceY
         dRziTDc9JhsHP61z3/Jxr5j4z7IAq7winn/bK3O8hhZwEddB7EXGz8OB3L6DfHOoZ3AT
         n6zZoxUuMoth29rN8nl303/N7OnapqmZrvtYm+RD7HemcoGCoFADnCvRw70rqcb5USsj
         uyN4mtHOby1fW5sYY5edXmV38mPNVhZKa99iyHwwPFFZKQM825yMi/LT6u48ICnn1mqJ
         O3OTqZmGpdEiDRoNnUVAMsNpkeY4PQPd8n2FjrlJRMJtqW5OXI+/X8XebO+zNsdT31hk
         BE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sY3RpgyWHBy4W+/+RqTX6YRD6atJotbsjKLoIW0AnuM=;
        b=fu36z+2t5sBMiM1G+CluqJ1NusVViQsXdAvZ9A8wTtfkrjJAKAfmyBjUXtI0G5UClY
         dQnqVrEMRMdmouZl600XkeIRgUCHDfh+Ll/K+oVGvoeGibucU9nJs7GFQ+mEgCTwCQTE
         sGlQfHVnrGRRom6HDtljUP4cy5EjFI4EB/pLueQLzJbMv9Hxgq8NQ877lkEGgb0rsN6H
         dSV1LtrLl36s+fhoYsT/5mxxA7m1/n2Qj+p8FfRy1cjgJuqnUGq6nU7s3Sv22VuwzLcJ
         UXGxGr7VC8oG4qcVRy02WcAgoptHd+jo5IPPR7EmpdCG4SOinhV53TCeJ8xCqjMnJwOn
         g38g==
X-Gm-Message-State: AOAM5318jCPHUDrapGwnZnr4kRVQKtXBm6ON3VGEQRfGWRjHwFONDYgr
        6tyxpBA7Z+Ua9V6hKhSHKYZvlrfWvy36hdSa2WJBxQ==
X-Google-Smtp-Source: ABdhPJw6de1+RpQzyeap5euW6di99KHadH4LfFdealqxrDMNt6WlC/H44W7aFvJAgVPTTMVBqd7cMsH+ul3pmXnd/Xc=
X-Received: by 2002:a1f:1d94:: with SMTP id d142mr22071649vkd.6.1628679164996;
 Wed, 11 Aug 2021 03:52:44 -0700 (PDT)
MIME-Version: 1.0
References: <1628074696-7979-1-git-send-email-rnayak@codeaurora.org>
 <1628074696-7979-2-git-send-email-rnayak@codeaurora.org> <CAPDyKFrebwt5=S7hqXvcqRvt+-EXLcVmRSRZt1uPf-9n7_pRDg@mail.gmail.com>
 <2afd0fac-ed28-c090-a345-3fd4284b4125@codeaurora.org> <20210810024308.gurvzpbe2bc2bhky@vireshk-i7>
 <e452c0b5-5555-d6e2-40da-6aa21a26766d@codeaurora.org> <20210811100749.kwg6435m7xj7ulwa@vireshk-i7>
In-Reply-To: <20210811100749.kwg6435m7xj7ulwa@vireshk-i7>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 11 Aug 2021 12:52:08 +0200
Message-ID: <CAPDyKFp3xmx1r_2SCbrVcT-CcyUkTUoNgiUMWoyuWw5jE6WLrA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] PM / Domains: Add support for 'required-opps' to
 set default perf state
To:     Viresh Kumar <viresh.kumar@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 11 Aug 2021 at 12:07, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 11-08-21, 15:30, Rajendra Nayak wrote:
> > In my case I don't want to error out if the property is missing, I want to error out
> > only when the property exists but can't be translated into a performance state.
> >
> > So currently I check if the property exists and *only then* try to translate it, Ulf asked
> > me to skip the check. If I do that and I call of_get_required_opp_performance_state()
> > unconditionally, and if it errors out I will need to put in additional logic (check for
> > return value of ENODEV) to distinguish between the property-does-not-exist vs
> > property-exists-but-cannot-be-translated case.
> > It just seems more straight-forward to call this only when the property exists, Ulf?
>
> The same check will be done by OPP core as well, so it is better to
> optimize for the success case here. I will say, don't error out on
> ENODEV, rest you know well.

This should work, while I generally favor not having to parse for
specific return codes.

Another option is to add a new OPP OF helperfunction that just informs
the caller whether the required-opps property exists (instead of
open-coding that part), and if so, the caller can continue with
of_get_required_opp_performance_state() and then expect it to succeed.

I have no strong opinion though! Whatever works for me.

Kind regards
Uffe
