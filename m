Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C946358F82
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 23:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232754AbhDHVxj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 17:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232350AbhDHVxi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 17:53:38 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23128C061760
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 14:53:24 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id s2so2674901qtx.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i5g1l8xifarnGFKZcfnX8WD2aF8Apzj6HD5egcyeUh8=;
        b=vaG2KBh189d7TZmUuvPHgxCJvrL7amxUPUc71iQ/utCzeDOi1HhJnVZZ1eT4/aKxQq
         LcDpwKA/93MWV5MLbATVwcP9LygPP3KGNBj5JkRSvfCvqDpOQK9YnLIkrv4EkYlecESb
         8eVkj882/feUO1nOujrywbsC+RxU5IGYfzzQOKNgf1YhjYSLBtN8ahzLXmhb2ib4s/G+
         iz8LSf+gJeD92JDc1U0cSgXROYw7dx170PtdpH0hidMSm6GzWkzFa3h8U/9PmhE/M7Mr
         bkcAGXSejjfmyxLMa9Y/9qBdrpLrOb03V+MzLUeyaouqBnRPsp/obm1EpL67KKT6/99M
         /vhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i5g1l8xifarnGFKZcfnX8WD2aF8Apzj6HD5egcyeUh8=;
        b=RMtBNh2awQ1Zt7d2CaaRG5FY0dlv6d2YkZ+68K+mYib3oVMHeuXUUvtikGFPjO5QJl
         r3gN/jBYeHITc4yew4ITxWS7qPxLMfI87PE9UHseGlbCfY0GgXjfM2JQlga8ZLDO/xhE
         k7LGNY3SrYcZCVCcpG+hDRZM7lPwlPwjUiX1Dy2cxNfMwscCtkGix9ypW3VABqWmhVBw
         5mC1Q9mfq+Qlc6meuGp86k+4OhbvNAA6CYfQD37fLFvxGa9351ARn23NNaaUugkmJU3A
         GSYLw0bG67WNeXX2GQlOCEPUQbeBljH5jhlYVqAyjAp/YcYK3KkG+be59e9d9/vn4rWC
         Iu9A==
X-Gm-Message-State: AOAM531Ax3dh4syYqDoWJEBP0WjEgIa6n8K9O+jW67Gq5P4odHTYsjD+
        KDLePHuQR67wWkO+KVnsgBmLf/uON5Zn259um2aKkw==
X-Google-Smtp-Source: ABdhPJwazj9FWuSPV9bHxG8ukv+3bBFs/5s4EePYj0/79a4vdUFo+2UxV8RU8gK+M9NIUTF1Ek/hqPP1sKhPeo53OuM=
X-Received: by 2002:ac8:5f87:: with SMTP id j7mr9398597qta.135.1617918803348;
 Thu, 08 Apr 2021 14:53:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210404164914.712946-1-bjorn.andersson@linaro.org>
 <161789462034.1629934.2631576576205147984.b4-ty@arndb.de> <YG8qIfFdY+As5tye@builder.lan>
 <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
In-Reply-To: <CAK8P3a2v6yUVi395ixJRer2wyNVNXB-uypCqw5ts327ST=fHPg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 9 Apr 2021 00:53:12 +0300
Message-ID: <CAA8EJpq4r0-XTouJTxnNdO8tgydenb+LjDykWORSNeLb3vSqMg@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm ARM64 DT updates for 5.13
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jack Pham <jackp@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Robert Foss <robert.foss@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        satya priya <skakit@codeaurora.org>,
        Abhishek Kumar <kuabhs@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 8 Apr 2021 at 23:05, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Thu, Apr 8, 2021 at 6:06 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Thu 08 Apr 10:24 CDT 2021, Arnd Bergmann wrote:
> > > Maybe see if you can address these in a follow-up, to avoid regressions.
> > >
> >
> > I'm about to send you a another set of pull requests with some more
> > goodies that was lingering on the list. I will take a look to see if I
> > can follow up on that with some fixes for above warnings - and take
> > another look at incorporating dtbs_check in my workflow.
>
> Ok, sounds good. As I mentioned, I'm also just learning how to use
> dtbs_check properly. Unfortunately, it takes ages to run on a
> non-parallel build,
> and using 'make -j32' as I normally do means the output gets reordered
> with every run.
>
> It's probably ok if you figure out how to only run it for the files you
> actually change in the Qualcomm tree.

Disabling all non-Qualcomm arches makes `make dtbs_check` a little bit
less painful.

-- 
With best wishes
Dmitry
