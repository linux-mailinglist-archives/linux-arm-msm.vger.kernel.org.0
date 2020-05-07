Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A258A1C9D88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2020 23:39:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbgEGVj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 May 2020 17:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726495AbgEGVj3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 May 2020 17:39:29 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48489C05BD09
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2020 14:39:29 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id x6so4480879vso.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 14:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M2REwmdOVymRYBMV7tQ7oOUCRpm+a0YhGPMvLHsCvKk=;
        b=dQ4tCio6irYP1q8bcUw+D4VKuUlm3btWo/5PTC4DAYF8EMw5Nq218WChyhlWlpgQlS
         LbygcAsZM3d8etC+ufLui8iRcw2Yt1L5GRs/b/QZ6rR04xDKfZOl0U6nS2BPJhgsYv9U
         9ac6paiz82cow2WGFoVPucwq70z58Ck4VpjcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M2REwmdOVymRYBMV7tQ7oOUCRpm+a0YhGPMvLHsCvKk=;
        b=f6yO8PBUomrg5ua+O837J4Qw+0CVkPVy3lvrc8NuIGu0SnEg+IkPtk5SnNp15s/APf
         kGqBlIRLC+0renZ4GePZTh66lnX1lT8rnGvPVFqNk5NnXvCxFHJ9O9ZjnGQPKxL8PYbi
         meU2WnotiEaiht4/d6IRTckc/VPJQaVcDJVJayHOsK3GkM78JeO2MPcr0+8j5wS164d8
         tG/IWx/nDiuOzmBo57kCz7Jz80k27JE+YnIGF5tuZ1nQRhEeZqhM5r3H84UJh9DVFUe4
         H3uFxnHcE1WPNuKdiSkzGR924jno4PmJtPModo2j5EGTO5aU3JD5f8Qjny3QztbFbi4+
         GgxQ==
X-Gm-Message-State: AGi0PuYZWbK8N6s6UUSzkrKxDA2dQFZLFg+zdMne5wxNXGj4lR7TQ4dO
        rXIZDdrs1cucTEp1kZW+arxI6GsIQ1I=
X-Google-Smtp-Source: APiQypI0xPul7n6RxDGpvuhDh1/fAjmaWrsRpTQU9dhGLCJh1OVUrPyBt8uC2vVAovSfThafuX8W4w==
X-Received: by 2002:a67:2e04:: with SMTP id u4mr14087071vsu.208.1588887568030;
        Thu, 07 May 2020 14:39:28 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id x124sm3841656vkb.34.2020.05.07.14.39.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 14:39:27 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id m24so4358043vsq.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2020 14:39:27 -0700 (PDT)
X-Received: by 2002:a67:fc46:: with SMTP id p6mr15561029vsq.169.1588887566823;
 Thu, 07 May 2020 14:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200506140208.v2.1.Ibc8eeddcee94984a608d6900b46f9ffde4045da4@changeid>
 <20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid>
In-Reply-To: <20200506140208.v2.2.I0a2bca02b09c1fcb6b09479b489736d600b3e57f@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 May 2020 14:39:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xp6m_MdnrxGG5S1YyateAkHua7iQ1EU5iftH0kYxTO5A@mail.gmail.com>
Message-ID: <CAD=FV=Xp6m_MdnrxGG5S1YyateAkHua7iQ1EU5iftH0kYxTO5A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: drm/bridge: ti-sn65dsi86: Improve the
 yaml validation
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc:     Rob Clark <robdclark@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, May 6, 2020 at 2:03 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> This patch adds the following checks to the yaml:
> - Remapping of the eDP output lanes is now limited to the subset of
>   remappings that the hardware supports.
> - No more additional properties can be added under 'ports'.
>
> This patch fixes the following bugs in the original yaml conversion:
> - Fixed dependency between 'data-lanes' and 'lane-polarities', which
>   was backwards.  Now you can only specify 'lane-polarities' if you
>   specified 'data-lanes'.  I could have sworn I tried this before.
> - We can't remap input lanes in this hardware.
>
> This patch doesn't do, but if someone knew how I'd love to:
> - Make sure if we have both 'lane-polarities' and 'data-lanes' that
>   they have the same number of elements.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> This patch could be squashed atop the patch adding the yaml [1].  I'm
> sending separately for now to avoid churning the series another time.
>
> [1] https://lore.kernel.org/r/20200430124442.v4.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid
>
> Changes in v2:
> - ("... Improve the yaml validation") new for v2.
>
>  .../bindings/display/bridge/ti,sn65dsi86.yaml | 74 ++++++++++---------
>  1 file changed, 40 insertions(+), 34 deletions(-)

Please consider this patch abandoned.  Since I had other reasons to
send out a v5 of the original series this is now squashed in.  See:

https://lore.kernel.org/r/20200507143354.v5.4.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid

NOTE that patch #1 in this series, AKA ("drm/bridge: ti-sn65dsi86:
Implement lane reordering + polarity") is still sane/valid and still
applies just fine atop my v5 series.

-Doug
