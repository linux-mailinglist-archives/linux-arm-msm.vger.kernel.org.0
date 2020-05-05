Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14CE1C5478
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2020 13:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbgEELdt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 May 2020 07:33:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728868AbgEELdj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 May 2020 07:33:39 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2854AC061A41
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2020 04:33:39 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id g35so286167uad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2020 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=166ZI2PQYttk8mUuPjh9fJHZKXnQuSqSXt1RrZvFtpA=;
        b=SbmAUPviBr80iF1qScxhl5zJVFA3V7xs4iTOq1msRXtlVS5Z9A1FelEaA5QOQUWqSn
         Gciu/AaBzFBmE9zsnvklJwgF+se1u3nj/rAckeZ5e5cdWv6G/dnbkbVhbAILnHgR8ESS
         0RJNI/xujs7FxJsLMC8nNRkZLo0PDbWYVPfHWPg2m1CApz8MmMYfQf4zmiPiVH+2qRQS
         KpJhx0xg/64TubUQdiVtwLaCC/RxcIr8uKxVm8m4N4Lz4ee+Ce2Si7BmBh+ccTDUf2Ok
         cWulD+4LSCa2nf0nb8Ruoidn+kZRLzCVPbwfVcgMFxE3RM0EQsHaWeDgVB2/Rns/tTD9
         Y36Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=166ZI2PQYttk8mUuPjh9fJHZKXnQuSqSXt1RrZvFtpA=;
        b=f8hmtyyaSPQmbyBPvardo89mxqyuSrGxPrrgsX9DyHnKiiHOXw3FgsMr3/69W+w6uL
         xyj2TuRrXOCFHIrF3sQGpVV6kopyHLJCg7XsJ9X5o+Y1PsbmJpi99PQO9JR/7QU/9R9N
         +zAE5lSBsaINSuxUmYe5cVGbGqAIMdeqRcdKdtTkpdY8vWyZAJuA6T6N86sYoQ6aHc2N
         yijA5m6rMtCTRCN7xf6tRy0AdjwXhAoXqIy0W7jYF2eDtp4lkkp1nyufuveQd1jJ7fj/
         G/y10lZ9t4LdDYCEJFKXMi/RypKnObFsEmSrEdRJ43up67a9o/hAn/4JzthpvBkSkHqQ
         9gcw==
X-Gm-Message-State: AGi0PubFjKcLpKUDQwSZ+E09xSTDbvK8opC/REaVhWdStQzAia3T3wh0
        InltnSqZ0sRFZzkvfO1oEDxp1budFGZTvnWyi7RdTLOL
X-Google-Smtp-Source: APiQypIVXSv4Xz1Q8pgiALwOrIbs+TbqKGJBWZAvFSYtSethZHtLnwLnQoOS0qNKX6URobh8SNfeXpV8uZemzz1NRmg=
X-Received: by 2002:ab0:3343:: with SMTP id h3mr1749214uap.19.1588678418386;
 Tue, 05 May 2020 04:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-10-git-send-email-rnayak@codeaurora.org> <CAPDyKFrGQvcCB1wfv=iqk66uja3faMRF1gGMSE2VhB8gJcO=sg@mail.gmail.com>
 <15efa375-cf1e-b793-1d3e-29ca0a547522@codeaurora.org>
In-Reply-To: <15efa375-cf1e-b793-1d3e-29ca0a547522@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 5 May 2020 13:33:01 +0200
Message-ID: <CAPDyKFoaJTXq2qN+HXoSUovun9+4gzLeVJ-88FKbZCSCKjByLw@mail.gmail.com>
Subject: Re: [PATCH v3 09/17] mmc: sdhci-msm: Fix error handling for dev_pm_opp_of_add_table()
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Pradeep P V K <ppvk@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 29 Apr 2020 at 16:09, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
> On 4/28/2020 11:59 PM, Ulf Hansson wrote:
> > On Tue, 28 Apr 2020 at 15:39, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >>
> >> Even though specifying OPP's in device tree is optional, ignoring all errors
> >> reported by dev_pm_opp_of_add_table() means we can't distinguish between a
> >> missing OPP table and a wrong/buggy OPP table. While missing OPP table
> >> (dev_pm_opp_of_add_table() returns a -ENODEV in such case) can be ignored,
> >> a wrong/buggy OPP table in device tree should make the driver error out.
> >>
> >> while we fix that, lets also fix the variable names for opp/opp_table to
> >> avoid confusion and name them opp_table/has_opp_table instead.
> >>
> >> Suggested-by: Matthias Kaehlcke <matthias@chromium.org>
> >> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> >> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> >> Cc: Pradeep P V K <ppvk@codeaurora.org>
> >> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> >> Cc: linux-mmc@vger.kernel.org
> >
> > Is this a standalone patch that I queue up via my mmc tree?
>
> Hi Ulf, yes, its a standalone patch which applies on top of the one
> you already have in your tree. No other dependencies.

Thanks for confirming! Perhaps next time you could add this
information as part of a description to the patch (where we usually
add patch version information).

Anyway, applied for next!

[...]

Kind regards
Uffe
