Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D5F051546D7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 15:52:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgBFOv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 09:51:57 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:37537 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbgBFOv5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 09:51:57 -0500
Received: by mail-io1-f67.google.com with SMTP id k24so6609888ioc.4;
        Thu, 06 Feb 2020 06:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TqCXQKOBDXFQJVKGddlbc8pIiQ4q9FZiH/HTbC2xQy4=;
        b=Ew8kBRM3/hL/4Kf0D2cwaTyLQ6Ds0xowkyP1rL4Mhrj2e8N3BvOyoJpmVJRJuDzbxE
         s+hwyF6pkxXoHwciWNdtQEFg1Zt6H4WfNMD4RB/uxNxeFhiufi7/2w1e7V0qqw3p0xex
         mU0w7qRdmzggpIIt9oPTIhmRIoobsnW6ubrnRSZQm4kKc3dNcSUdKfT5634rn5Nj4iMr
         aD/4ESSeySiZl6MAyZEGer5u6rpziqyIDXkamz3sYoJB0FYdmeMv196F+IKFFWGFkWm1
         ALPxipRfzvs+MoPHrnnLO2hry7+sVUdWldEZ1kjYadAWKbvVNhV/XGtjkB0mMCWp8ENA
         jVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TqCXQKOBDXFQJVKGddlbc8pIiQ4q9FZiH/HTbC2xQy4=;
        b=cOY1kcreBqKC6Y1qZBomC+SOcEdmLcBev0koN/D06+/o/WnGMeZqJG4ZQPB9Hhl0Yp
         6utYSuZzladNh7RjJi3liHBoiv0Hs7Dk9N+YL+tzgwjLt55RFbZhnzkHQlom7PkfuiwB
         riPZWI0tQ87NmAMITFoC5NCd5OqTQSG/i5JNFfjbHd5oej1czF2/TNGapsWVs3lJGaPI
         fshB3UoCCTNTbFyjV+boV3tANTIRdEnmxXc7djR7C9t+DS0hYPNQqWkx9y4GITjNYQfJ
         2a0DyI3E3i+QNU2zmdrxBYcJw2/W89nVj9qbmun7r4TsIO+wNRF5Ne2cSe1LLKjcb5gy
         uyag==
X-Gm-Message-State: APjAAAXB2ISGRFyIty7dykmggPxQtrQ+sqxUyjOlUbE1AG9TJHyknLNi
        WH55iAsERa3M2Ytmwow2gGNRxxaK8FDWTVY8ACc=
X-Google-Smtp-Source: APXvYqwZYxfalpMvjr4USAwpdtFeqzts07iNxgJWdvTv/0SPzfTizDCBhbfM18KUA+AWxFcUyEZ7fepmukSqkbODuyE=
X-Received: by 2002:a02:a50f:: with SMTP id e15mr35226468jam.48.1581000715561;
 Thu, 06 Feb 2020 06:51:55 -0800 (PST)
MIME-Version: 1.0
References: <1580979114-16447-1-git-send-email-harigovi@codeaurora.org>
In-Reply-To: <1580979114-16447-1-git-send-email-harigovi@codeaurora.org>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 6 Feb 2020 07:51:44 -0700
Message-ID: <CAOCk7NqEaJsbTwWgieXbGNN-eGFH3X0i=umMpLaLrPcB4GQzEw@mail.gmail.com>
Subject: Re: [Freedreno] [v1] drm/msm/dsi: save pll state before dsi host is
 powered off
To:     Harigovindan P <harigovi@codeaurora.org>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        DTML <devicetree@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>, nganji@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>, kalyan_t@codeaurora.org,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 6, 2020 at 1:52 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> Save pll state before dsi host is powered off. Without this change
> some register values gets resetted.

The phy driver already does this.  Why is the current implementation
insufficient?

>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v1:
>         - Saving pll state before dsi host is powered off.
>         - Removed calling of save state in post_disable since everything
>         would be resetted and it would save only resetted values.

Removed from post_disable?  Thats not what I see in the change since
you are adding code to dsi_mgr_bridge_post_disable()
