Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6264228EA04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 03:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388666AbgJOB3q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Oct 2020 21:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732281AbgJOB3j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Oct 2020 21:29:39 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4997EC00215E
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 17:10:38 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id x185so483101vsb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 17:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yNVbwBUlc8xHfj5dGGUid3sUj8ZlijbrpDXeVgVJXrI=;
        b=U84wn4IxrbhrL0RT2hXQbW3knYBWBZbRGv71UK8XNw/IJjfDX3nKflFtDK5ewY9+v0
         JXQo/o5eAqYzysT4O4KYn8Xyt9EgE0HJN8aHHXqYwv4UHaFyXBu9rTpYJKiF/ll33E2d
         SSaKz5fzA+kudRu1ykZxpDTHC4XvSYIj//NRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yNVbwBUlc8xHfj5dGGUid3sUj8ZlijbrpDXeVgVJXrI=;
        b=QvBPnS7YcThxou8CUgvpEEZbkIhWEzmU0c7UufAIYkheTq9/jGeN2jfi4Ua8aKE0H0
         Pdc3NfD2rG4DEAt3t8569xMquwwrenVALsbQ5bZ9n5V1ZLOubCzSbwnGOd8NwaxGbcYb
         xcgefprIEEfKifsU7ceSQHOOc4QMsodewF7GQ80urHfMhLi3spY4JHL4e36GwRh3Bas3
         CzRw6BeLbQAAeLbLxhwzrLtjIRWkPO+3DLfcLzMqPwKMvXc5RwM/iIXYEuyZgdARWaZw
         v27Fp4gRd8AbjmBks4tkCHc8rZHzelhm4RTUzlSLx/wE2hGul7EhKqytYH1RimwsDnwm
         TdmQ==
X-Gm-Message-State: AOAM533DWNivEZ89GZnCW0iB3G7yyaxTW4xhgeDquGo/+iowNgmNwSk4
        taPg1+RAuDeqITcVG4TCebcEv23FkON99A==
X-Google-Smtp-Source: ABdhPJycw0wXaTG9YzhtpXGyxFskW7v1Am7pl1DaFTBvd3dJceH5ADubGk/+ShPD9Yta506939tsdw==
X-Received: by 2002:a67:ffd8:: with SMTP id w24mr1343778vsq.18.1602720637161;
        Wed, 14 Oct 2020 17:10:37 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 67sm183510vkr.24.2020.10.14.17.10.36
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 17:10:36 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id l6so463715vsr.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2020 17:10:36 -0700 (PDT)
X-Received: by 2002:a67:e3b9:: with SMTP id j25mr998543vsm.37.1602720635942;
 Wed, 14 Oct 2020 17:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20201014140507.v3.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid>
 <20201014140507.v3.3.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid> <160271877655.884498.7099344361539095621@swboyd.mtv.corp.google.com>
In-Reply-To: <160271877655.884498.7099344361539095621@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 14 Oct 2020 17:10:24 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XedSbZ_HQK5KBw4ba1j7Ow6rn-GT0dLzsPrTtLrh+LWQ@mail.gmail.com>
Message-ID: <CAD=FV=XedSbZ_HQK5KBw4ba1j7Ow6rn-GT0dLzsPrTtLrh+LWQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] clk: qcom: lpasscc-sc7180: Re-configure the PLL in
 case lost
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Taniya Das <tdas@codeaurora.org>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Oct 14, 2020 at 4:39 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Douglas Anderson (2020-10-14 14:05:23)
> > diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > index 48d370e2108e..e12d4c2b1b70 100644
> > --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> > +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> > @@ -388,6 +388,25 @@ static int lpass_create_pm_clks(struct platform_device *pdev)
> >         return ret;
> >  }
> >
> > +static int lpass_core_cc_pm_clk_resume(struct device *dev)
> > +{
> > +       struct regmap *regmap = dev_get_regmap(dev, "lpass_core_cc");
>
> Please make "lpass_core_cc" a static const pointer in this driver so
> that it can be used here and when the regmap is made so that we're
> certain they match.

Sure.  In theory the compiler ought to use string constant pooling so
they would have pointed to the same place, but you're right that it
wouldn't catch typos or other cases where they don't match.  I'll do
both regmap names just for symmetry.  Hopefully that's OK.

-Doug
