Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA711E3015
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2020 22:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389339AbgEZUe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 May 2020 16:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390913AbgEZUe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 May 2020 16:34:58 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20172C03E96D
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 13:34:57 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id b18so17469888oti.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xlg1WEt/1KpzYv+/vA9j7Mf3YWi1IPnXCFcohcpUSKM=;
        b=vqBfuJzMnCts3H+g3tzxBLb3DHdb9u8YAPd1Lr4hpr9zPYnd/hQ9htQE4e+QzEUmjl
         7ZrK+oEdm0wLIE7MuIMmiI71OhNKS8oqoG5svb2EehG6CFlmnhdeq9cw6Vf2tq/axJ2H
         ssZdHqJcXZVSLkR/cPGAeFiJSasA4lSnrLDZRpKXHynba/SmCOYCvHWd2hPTm3NCdn4r
         BNzmOO0gWoq0pD+6uFTBvcgyL6jgx7zvs2rGaMsCKa11K7bwAsrXJaOHz3GnLa3znOG5
         YZJKlEQz0ZUmv6xTUjr2n7E5cvEvNuf9zyblA43KWchCM+klzpd5j7n4bXULce1BXFzm
         8BLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xlg1WEt/1KpzYv+/vA9j7Mf3YWi1IPnXCFcohcpUSKM=;
        b=kvshN0G03Strqhfcaor/ZpDyftiVIAXxBHxEfLgqd2ynnKcuJ0isLRKIqu6L2+xwBP
         4z5wFvTLuPx3C1SwSNfe1ODT//BaUpFGmg4Q0dmJkib3rKb88v5Sp2RZvKAdnvPwsmVz
         VnpAeCmV1CEv0ly+B1wrB/wlbBHo7oF9nQ0ZaItBPZ16xIw/G/TcZXADzjfaTehwiscS
         gG9aUxQa0723YW9Hu8UHgXyMlAyOdNEMEhDljWc27hgxlomo4D2wT8+Ddunz42jRWgr1
         MF9eVR+3SiXTvINekXfxY/MCTnNxFK+5SMKjBk+T8y+Sf0AL20jl/7RAW1aw/nwmnxKV
         LvWA==
X-Gm-Message-State: AOAM530HRilbdhspb2J3gkfkRr+wABrb/WwNKP9Rsd9QeWwC6gXdOKfj
        khpB90zQsJ6KQq4vYOfjvVb6jYPhYPxN9q9+QfFE0w==
X-Google-Smtp-Source: ABdhPJwRnLRczAXOAB9YCm7o1K0N3H8lb7+2jzEf7cyls1IaN/ZEhrkFXvBSwAYhJHpTTYYnVbUBS2F8yL7vvHUmhEs=
X-Received: by 2002:a9d:b82:: with SMTP id 2mr2072353oth.221.1590525296383;
 Tue, 26 May 2020 13:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
 <20200228025700.GA856087@builder> <20200514193249.GE279327@builder.lan>
In-Reply-To: <20200514193249.GE279327@builder.lan>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 26 May 2020 13:34:45 -0700
Message-ID: <CALAqxLVmomdKJCwh=e-PX+8-seDX0RXA81FzmG4sEyJmbXBh9A@mail.gmail.com>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Will Deacon <will@kernel.org>, linux-tegra@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 14, 2020 at 12:34 PM <bjorn.andersson@linaro.org> wrote:
>
> On Thu 27 Feb 18:57 PST 2020, Bjorn Andersson wrote:
>
> Rob, Will, we're reaching the point where upstream has enough
> functionality that this is becoming a critical issue for us.
>
> E.g. Lenovo Yoga C630 is lacking this and a single dts patch to boot
> mainline with display, GPU, WiFi and audio working and the story is
> similar on several devboards.
>
> As previously described, the only thing I want is the stream mapping
> related to the display controller in place, either with the CB with
> translation disabled or possibly with a way to specify the framebuffer
> region (although this turns out to mess things up in the display
> driver...)
>
> I did pick this up again recently and concluded that by omitting the
> streams for the USB controllers causes an instability issue seen on one
> of the controller to disappear. So I would prefer if we somehow could
> have a mechanism to only pick the display streams and the context
> allocation for this.
>
>
> Can you please share some pointers/insights/wishes for how we can
> conclude on this subject?

Ping? I just wanted to follow up on this discussion as this small
series is crucial for booting mainline on the Dragonboard 845c
devboard. It would be really valuable to be able to get some solution
upstream so we can test mainline w/o adding additional patches.

The rest of the db845c series has been moving forward smoothly, but
this set seems to be very stuck with no visible progress since Dec.

Are there any pointers for what folks would prefer to see?

thanks
-john
