Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EF871FFDBB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 00:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731678AbgFRWJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 18:09:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbgFRWJb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 18:09:31 -0400
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com [IPv6:2607:f8b0:4864:20::a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3137CC06174E
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 15:09:28 -0700 (PDT)
Received: by mail-vk1-xa41.google.com with SMTP id e1so1832599vkd.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 15:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rIJ2X6dOzoq0wY6kg8iKEYYmkTTN8+C1IDuvViUAAlw=;
        b=lVrFJvl5mDjocLA105kchQDYwRR/Mq9nlcXy/owwADieAZYgAuGsjK3xpftm0NXclu
         BDh1QPoJU1TPpXMWq0DmrgoRSIGzBPlrIy8he0In3LWP8m83XqE+r0HZadf/sXAFVj2e
         IayO8IVxHmcZK2mLywOzCBqLmikiRhPA0Z8ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rIJ2X6dOzoq0wY6kg8iKEYYmkTTN8+C1IDuvViUAAlw=;
        b=saHeORgKinbFuefQroQb0gVgVzuPMXmp1HjvtMp5LA5vDSmqHo6bp0JK8Wwc5MFEKF
         7y/rrJz0t7/Gs31VgVq/W7lRey0/oDhA56So6M0+Klxoo/sGdoraNOog4iU+fXsAOtTV
         gblawH1n+qvy/vvkaBW9mOYlcfL+BqegTUqps2jtQhQklGuOYcrKugKrylMfDgMa/ic9
         i6AA9/uKhxe3QzP+L+AYaEa9j1fQGMtQW/4ouCzK7LKEPJgAK79k6Cv/ZEuMdvT4urwb
         TenZLygK0czdOZEsBWDcP8qcpVrHtYCoLOX+XeSzS0YIShVGiKEyq6zKLhvRAc1imM2w
         a2Vg==
X-Gm-Message-State: AOAM530eOC2cunVuANvaSbG1yClYkdTzI1CiFEF0lXBSCbIu3nGcVa60
        GW2QGn9alLAufV+iO1E2z13r1zUt2mQ=
X-Google-Smtp-Source: ABdhPJz2oHCnUx5k8SXk4YLGYttDpsvdnMN/Q32aOgPeoQFkdxyvTs3bAZ9YnpgzolphLC70+Di1tw==
X-Received: by 2002:a1f:9444:: with SMTP id w65mr5357466vkd.50.1592518166950;
        Thu, 18 Jun 2020 15:09:26 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id g5sm492975vsp.26.2020.06.18.15.09.25
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 15:09:25 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id t26so2519305ual.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 15:09:25 -0700 (PDT)
X-Received: by 2002:a9f:3b1c:: with SMTP id i28mr501831uah.22.1592518164952;
 Thu, 18 Jun 2020 15:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200609120455.20458-1-harigovi@codeaurora.org>
In-Reply-To: <20200609120455.20458-1-harigovi@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 18 Jun 2020 15:09:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
Message-ID: <CAD=FV=XHHAAWNkJGMJESf4C=hcbaswFamGVeyMJ9eRd6dWAy8Q@mail.gmail.com>
Subject: Re: [v3] drm/bridge: ti-sn65dsi86: ensure bridge suspend happens
 during PM sleep
To:     Harigovindan P <harigovi@codeaurora.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>, nganji@codeaurora.org,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Jun 9, 2020 at 5:05 AM Harigovindan P <harigovi@codeaurora.org> wrote:
>
> ti-sn65dsi86 bridge is enumerated as a runtime device. When
> suspend is triggered, PM core adds a refcount on all the
> devices and calls device suspend, since usage count is
> already incremented, runtime suspend will not be called
> and it kept the bridge regulators and gpios ON which resulted
> in platform not entering into XO shutdown.
>
> Add changes to force suspend on the runtime device during pm sleep.
>
> Signed-off-by: Harigovindan P <harigovi@codeaurora.org>
> ---
>
> Changes in v2:
>         - Include bridge name in the commit message and
>         remove dependent patchwork link from the commit
>         text as bridge is independent of OEM(Stephen Boyd)
>
> Changes in v3:
>         - Updating changelog to explain the need for patch
>
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 ++
>  1 file changed, 2 insertions(+)

I think this patch is good to go now (has both Stephen's and my
reviews).  I noticed that Neil landed my other patches to this driver
recently (thanks!) and wondered why he didn't land this one.  Then, I
realized that you didn't send it to him or the other bridge
maintainer.  :(  Have you tried running get_maintainer?

$ ./scripts/get_maintainer.pl -f drivers/gpu/drm/bridge/ti-sn65dsi86.c
Andrzej Hajda <a.hajda@samsung.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Neil Armstrong <narmstrong@baylibre.com> (maintainer:DRM DRIVERS FOR
BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM
DRIVERS FOR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@siol.net> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
David Airlie <airlied@linux.ie> (maintainer:DRM DRIVERS)
Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
dri-devel@lists.freedesktop.org (open list:DRM DRIVERS)
linux-kernel@vger.kernel.org (open list)

In any case, unless someone has extra feedback on this patch I think
it's ready to land.

Neil: If you're willing to land this patch too, can you let
Harigovindan know if it needs to be re-sent with you in the "To:" list
or if you can find it on the dri-devel list?

Thanks!

-Doug
