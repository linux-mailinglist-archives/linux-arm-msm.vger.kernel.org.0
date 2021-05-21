Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96ACE38D057
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 23:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbhEUV5j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 17:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhEUV5i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 17:57:38 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12F2CC0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:56:14 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id v22so21038630oic.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 May 2021 14:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=EZmyDabN3hOTcpj4naZ+cZ/b9gf93PvDS23AI6xYe4c=;
        b=cPBVT0ifSVUFR1izGTb+sffRmg+26NqMLywpEHiLlckjtQJb3tLTsSaiPSH/NpjgMe
         7GaPhUaflL05DW/o5GXI059ApnWvXURWnsatGEImzjH1wol1MQy9FbRVSOneSj9KUHiJ
         EtVVWJ8EZ5AKCQ8SLlQqi9qAVZHHTfub00n3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=EZmyDabN3hOTcpj4naZ+cZ/b9gf93PvDS23AI6xYe4c=;
        b=AKOH2ljCsh4yY2HjAeBOorWVVZjNYa6AMT94LG5RvDnqmhUlFKjCS5GSJA0zkD79Br
         I14xJfDJj2N0fRABhrn4Q6pOOr6y5Arwli2Yyb/n08Ow/RLho40s+W/swfwslnc2Hndv
         W5qVHCVGyTWcp41d8ng1jzKvyOORIiMABAkgeE7e2LmnSEfOV2RuBhIsCETzdybF3V8o
         sWsPa2KN879CH9EijNbAOujI0qhiioqPqvk+AziLTOcH6LcyQyqaB5ZLeMrERR8qbKng
         6QbRMYtgIItwUEGXdbIVs+bfBxetw8+rZGUHqp0dgBfbWXG6cGN9kG3StZBzGw38W/vh
         nnEQ==
X-Gm-Message-State: AOAM5309X83xtScaI7hnDIFH8bqanlUEjQs2UY4XS+OjfliLko5ID3/B
        IEpCGd76vpq6YswW2k6l2I7S4xYJ+2K3zb/lm3L+lg==
X-Google-Smtp-Source: ABdhPJysDKVUU7DFJvnwkX9aokBDwCJJlkC4zdeGIRL3E1EdGE6tYOBoopnxXzvN5ViV2dw/dkOUTdrY42b0dQcypxg=
X-Received: by 2002:a54:4501:: with SMTP id l1mr3700527oil.19.1621634173394;
 Fri, 21 May 2021 14:56:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 May 2021 14:56:12 -0700
MIME-Version: 1.0
In-Reply-To: <1621455753-28966-1-git-send-email-khsieh@codeaurora.org>
References: <1621455753-28966-1-git-send-email-khsieh@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 21 May 2021 14:56:12 -0700
Message-ID: <CAE-0n53WW0jqorW2MPaTczmJP+d+_qaRBcwmoJBP2dL4x8_DqA@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] drm/msm/dp: handle irq_hpd with sink_count = 0 correctly
To:     Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robdclark@gmail.com, sean@poorly.run,
        vkoul@kernel.org
Cc:     abhinavk@codeaurora.org, aravindh@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-05-19 13:22:33)
> irq_hpd interrupt should be handled after dongle plugged in and
> before dongle unplugged. Hence irq_hpd interrupt is enabled at
> the end of the plugin handle and disabled at the beginning of
> unplugged handle. Current irq_hpd with sink_count = 0 is wrongly
> handled same as the dongle unplugged which tears down the mainlink
> and disables the phy. This patch fixes this problem by only tearing
> down the mainlink but keeping phy enabled at irq_hpd with
> sink_count = 0 handle so that next irq_hpd with sink_count =1 can be
> handled by setup mainlink only. This patch also set dongle into D3
> (power off) state at end of handling irq_hpd with sink_count = 0.
>
> Changes in v2:
> -- add ctrl->phy_Power_count
>
> Changes in v3:
> -- del ctrl->phy_Power_count
> -- add phy_power_off to dp_ctrl_off_link_stream()
>
> Changes in v4:
> -- return immediately if clock disable failed at dp_ctrl_off_link_stream()
>
> Changes in v5:
> -- set dongle to D3 (power off) state at dp_ctrl_off_link_stream()
>
> Changes in v6:
> -- add Fixes tag
>
> Fixes: 94e58e2d06e3 ("drm/msm/dp: reset dp controller only at boot up and pm_resume")
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>

We can resolve the lingering dual irq issue later on if you don't want
to send another round of this. Also, the title says 1/2 so I wonder if
there's another patch? Doesn't look like there is but I have to ask. If
not, please generate patches with the right -<N> argument or revision
range.
