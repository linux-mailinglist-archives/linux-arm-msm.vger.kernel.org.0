Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBD52F8A1F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Jan 2021 01:59:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbhAPA62 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 19:58:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbhAPA60 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 19:58:26 -0500
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4542CC0613D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 16:57:46 -0800 (PST)
Received: by mail-vs1-xe29.google.com with SMTP id x26so6042417vsq.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 16:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cuO5xo5F20WS2U3YFOHP5hzwzCcypzAVBEVyMj1tuRs=;
        b=OB+wZUB9YCSSH8DkArXCN8GMeoKn9Ss4CIXEwJEz/SZ1dyA/ZpeQox+8u1nKtY+EKN
         IjzOkD69Egtm6f+ow9+DVBsJXUwIe6AFicqRZY41ChVfu06/rWn8lNBrsCSpSPB9dOMz
         RBbIGXAhO3E6WzR6Eat8ofB3SBNrJfJ2d20Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cuO5xo5F20WS2U3YFOHP5hzwzCcypzAVBEVyMj1tuRs=;
        b=Zg5dVfI3uF5xxa72schW1N+JjmII4f3NZ8eii5EtEDu3B4Jv/TbCAMisfUUChELKv7
         BtFv9JC9WFdejzR4y9nCnYV0AP98Tuz2LDGOijYacsRYQXV2W4AgLwLbarWckBiKAqPP
         WkKQHnGIDj6WFJuKN9+KbuU0A1r3ha+5tmN7ESLR73aX8K9RRyRimDI0SQV6UbV3NJbD
         PvT3li2K2PIebPryOLimbsD/Dpxhz94PfmFkp1ljHv2r8qtVEvLUvzk+rpg0JXPr+mIf
         nN2oDGRb4EcljqszMV4l3gA/HIKipyVm4Vux9hAzfZOH1/LggHl/9T/93rqt9PJ0zKct
         ccLA==
X-Gm-Message-State: AOAM533l1cEHsIZogW1vYCyUSCwfv7nO6OrSkOAbJWRw8Qb/+ysdbHUO
        cJFpJRPHrmwx2n6bANU3FyjIcz607HtPTg==
X-Google-Smtp-Source: ABdhPJw4RZdULQAGFiiQOjeZAaO+1fWaTDR+zESi45AHvjbWC2abmJyKqyNT2e08HM/6Z5X0lWJtwA==
X-Received: by 2002:a67:7d01:: with SMTP id y1mr13606657vsc.18.1610758664942;
        Fri, 15 Jan 2021 16:57:44 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id v12sm1140510vsp.3.2021.01.15.16.57.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 16:57:44 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id u27so44841uaa.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jan 2021 16:57:44 -0800 (PST)
X-Received: by 2002:ab0:2e99:: with SMTP id f25mr12091635uaa.104.1610758663654;
 Fri, 15 Jan 2021 16:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20210115203951.850873-1-swboyd@chromium.org>
In-Reply-To: <20210115203951.850873-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 15 Jan 2021 16:57:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XGajtxTo1wNk1iDj_17F0Ris1A5fdwtJkYRUSjMkXb7A@mail.gmail.com>
Message-ID: <CAD=FV=XGajtxTo1wNk1iDj_17F0Ris1A5fdwtJkYRUSjMkXb7A@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: socinfo: Don't print anything if nothing found
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jan 15, 2021 at 12:39 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Let's skip printing anything if there's nothing to see. This makes it so
> the file length is 0 instead of 1, for the newline, and helps scripts
> figure out if there's anything to see in these files.
>
> Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/soc/qcom/socinfo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
