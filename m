Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 510DE435180
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 19:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbhJTRnT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 13:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhJTRnT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 13:43:19 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD7FC06161C
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 10:41:04 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id a8so22931630ilj.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 10:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=09x1oRFaTKDmQrhlhOb9jy+N6hL8DwJNbTkF0zphjoE=;
        b=mnQOVOqgdt1WuKAT8iYksqfZizblzHqHQ0ZpeyU/Tr7i35LtYOojJ16b518ll9ZQop
         mSXIV/ojivDGtUBOWZKJAjqQpyiuL6uYQv8P1dwI4WVCWO4wf9sJhg+9F4yd4Opbq1HD
         yzO3c7Ha5/V2RuTtNP0UfuMMt6qwM6HdXnzJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=09x1oRFaTKDmQrhlhOb9jy+N6hL8DwJNbTkF0zphjoE=;
        b=FNLrELrnzfwG7sc0hspuHQ+wud/Ub6nDjxZNtchIN1TFWr3at8UOYb4LJyUiLhBTd/
         qSglSVoXXah7+PxWNYn+25jvIonXMu0yRgDMzYAhNd4kPFFwo6OAOH7O08+fTZiZ9VYe
         ahsQs4udoLu9O9CHRea/D0Z/UlCfTsOp1kXamxFbw2Wz5AxzJePYPq6zgiZecKlGSfMH
         W1DJgVf1qzcgk7mQynxiAjoRmdoPqsQfbapUL9y+oLZch8goMcTNJOF5fyfAwz6wIzQr
         7FbjJu+MEpzBEFAAxOcsDy9i3JMowtfPO1EhpbFxoaCTleWnoae/+MVtCKPqlv3w1CGj
         Mlfw==
X-Gm-Message-State: AOAM533CGt3vu72uVw6gusxZlNSNsbrbXC/W7HgpT7dS69QGgcQAfKVR
        ljuUFKeJiaSUjtoPh1IujTjn0Uz8ZBbrBA==
X-Google-Smtp-Source: ABdhPJwOqf9z9O1HSEoe1hMYIGoEmfqhxe62XfRNpbLyD3FOx8vRYurvKF3bcNVH+mwR0UChMdjmZA==
X-Received: by 2002:a92:cd82:: with SMTP id r2mr342650ilb.198.1634751663739;
        Wed, 20 Oct 2021 10:41:03 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id f4sm1416912ioc.15.2021.10.20.10.41.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 10:41:03 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id o184so13667811iof.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Oct 2021 10:41:03 -0700 (PDT)
X-Received: by 2002:a05:6638:2510:: with SMTP id v16mr514672jat.68.1634751662770;
 Wed, 20 Oct 2021 10:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <1634732051-31282-1-git-send-email-quic_sbillaka@quicinc.com> <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1634732051-31282-3-git-send-email-quic_sbillaka@quicinc.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 20 Oct 2021 10:40:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U9==zFpYtiU1S=n+Ygy5Qa4xfA6GFMpHJUtkpjpNfcyw@mail.gmail.com>
Message-ID: <CAD=FV=U9==zFpYtiU1S=n+Ygy5Qa4xfA6GFMpHJUtkpjpNfcyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: Add SC7280 compatible string
To:     Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Sankeerth Billakanti <sbillaka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Oct 20, 2021 at 5:14 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> From: Sankeerth Billakanti <sbillaka@codeaurora.org>
>
> The Qualcomm SC7280 platform supports an eDP controller, add
> compatible string for it to dp-controller.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)

I think you ignored some of the feedback that was given on v1. Perhaps
you could go back and re-read that feedback? See the replies to:

https://lore.kernel.org/r/1628726882-27841-3-git-send-email-sbillaka@codeaurora.org/

For one, ${SUBJECT} needs updating. It's probably as simple as adding
the "msm/dp" tag, like:

dt-bindings: msm/dp: Add SC7280 compatible string

For another, Stephen requested that you add "sc7280-dp" too.
