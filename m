Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 310C93DA9D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 19:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229896AbhG2RRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 13:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhG2RRE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 13:17:04 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D296C061765
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 10:17:00 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id k7-20020a4abd870000b029025e4d9b0a3dso1749623oop.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=a1Jpgqpv2djZJsAG0DhOFk0xd5WwpCit+wt+1ShQN3w=;
        b=IbUizu0+FfdESoAU8NUVe9wutrr/sa7srK/lGLGR6WuyGgwFNN9rj9qseZg3c5JZ2X
         Eufd/DoziaUsBlouBYPxXVAoGSs0/gO/pDUgoc/7GcJzr3yvkOoqAkkViqXG2Lcp/YRF
         6DjRLU9tPwM1ZchhAxMbQ1yVgg3bVbSifylTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=a1Jpgqpv2djZJsAG0DhOFk0xd5WwpCit+wt+1ShQN3w=;
        b=GuL8CzJgx5UtP7wAsDOElOoMCjke9Sk/gn3S28h3eRU1Z4Dgo/SVdVNpn+vyCn98AG
         VeGzGnezRL9bHclEyQbUQvrUnQiPn9AaHA8ZzLJl/3KArYU8GH/Ai4rlcDR+zvwnOswK
         WKkxCw1HOs/hiImTbYCUmL9BFWbBJLQXrfA49I+zUifEOW1feDzBTeSkdnC7/BVitkb0
         bD7ykykqBrLFC1ju+4gkGK8SWzfV8IibZs4oR2TAElyylN6kctHHgRTwDTp1T2MjM+4x
         ewoMLQpNMrk+QAZkvfjt/RKm9XTgzLZt7L3YGDld81f2zXnng6cMgD7Ucu8C87sIRrLx
         /Mfw==
X-Gm-Message-State: AOAM5316LdsM2wSaSWvi+LZmYLlu8pFT1tn8Hc5eUUQnlQXjPJjXeSgU
        bCr2SijJKu5PAtH+LLZWYzMSQkmjwK7ZXaxLUEeBKQ==
X-Google-Smtp-Source: ABdhPJxUpkwe41vVtmTrJYV492tkArFcWpTZmO6apTAf5RO4udVotcMW58RvB7J4AJBtKozsIxNZvmHe6s1rATG0IFE=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr3714787oom.92.1627579019804;
 Thu, 29 Jul 2021 10:16:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:16:59 -0500
MIME-Version: 1.0
In-Reply-To: <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com> <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 29 Jul 2021 12:16:59 -0500
Message-ID: <CAE-0n50-1eN3wwDukJi0JoTxCKnYx8NT1Ap2r0WDftQ621iBqQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Andy Gross <agross@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akhil P Oommen (2021-07-28 00:17:45)
> On 7/27/2021 5:46 AM, Stephen Boyd wrote:
> > Quoting Akhil P Oommen (2021-07-24 10:29:00)
> >> Add the necessary dt nodes for gpu support in sc7280.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> ---
> >> This patch has dependency on the GPUCC bindings patch here:
> >> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
> >
> > To avoid the dependency the plain numbers can be used.
>
> But, won't that reduce readability and make things prone to error?

The numbers are not supposed to change so maybe it reduces readability
but I don't see how it is prone to error.

> If
> the other patch doesn't get picked up soon, we should try this option.
> We like to get this patch merged in v5.15.

The clk binding is already picked up but Bjorn would need to merge it
into the qcom tree to use it. I don't know what the plan is there.
