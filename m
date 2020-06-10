Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B441F5B9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 20:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgFJS6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 14:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgFJS6J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 14:58:09 -0400
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com [IPv6:2607:f8b0:4864:20::a42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19C79C03E96B
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 11:58:09 -0700 (PDT)
Received: by mail-vk1-xa42.google.com with SMTP id f126so842733vkb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 11:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oAuiLS5G9yRr9AdnpqJ+b7J1vIYfSf3q36M8NOV942c=;
        b=ZoFELyV3tBihmyebsCsoJk3lsYw7dHxokZr208+Oi3cjS0rKE47GyTKi/8fqkKgIhj
         5s0cu1ckOGvd4aV4SjB5D5/nJDeMoIjxvt2U2Ccw/Kfve0CtzajVy/w53lYfU6Xu6k7N
         S8PCnMI8f5/e0ChFtq938rNtp430lbPGfI6Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oAuiLS5G9yRr9AdnpqJ+b7J1vIYfSf3q36M8NOV942c=;
        b=MaFlU26d4I80A0EAZ6PyTqtn1eymKgv0iEf5BZBXtw1B7MrCL/Ddq0ieMPdIwoVVVT
         2dPH68U2KQH0TQRuJNuXwWHjj51WQXsbMPBBopOeYZOe08V24xnlAO9rye1fFj74GVz3
         +HFpeqpTRZcX3jiHu5pWd/dguQHKxiiyVr9Oedlhs0xB1VzAy2XYqqNFuzKelS2beDIa
         XsreQGjgPZ9ZykqKfMFHKXtYVmW4bJMCyw2sJREK0ELTtZcPmozCAC0rq1psODr7jLIe
         f77UUziFz9wOsk41Cj7BMod7hJZttQyWCawc0em1jK+C6hxtlq7UviNGOJb31SFHORz0
         d6Gg==
X-Gm-Message-State: AOAM531amnihb8u7KhMrlN7JYiJVT6KV+FDH1OuUwkCLpNpgnRNPwdbr
        QbRJzlRlD+cc6mhsF5/iQrKOLNlwEEU=
X-Google-Smtp-Source: ABdhPJzMF65p+um1Ubm/d2ZCVRLmRiyvkObSinoE+KbNurXcLxcln3HHKKzANJvos13g0qf/LWxWLg==
X-Received: by 2002:a1f:ea82:: with SMTP id i124mr3491834vkh.62.1591815488066;
        Wed, 10 Jun 2020 11:58:08 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id z22sm114283vsi.1.2020.06.10.11.58.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 11:58:07 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id g129so1916422vsc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2020 11:58:07 -0700 (PDT)
X-Received: by 2002:a67:e445:: with SMTP id n5mr3989129vsm.73.1591815486605;
 Wed, 10 Jun 2020 11:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200609120455.20458-1-harigovi@codeaurora.org>
In-Reply-To: <20200609120455.20458-1-harigovi@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 10 Jun 2020 11:57:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UMELcq_-aYdQBW3CuJgTqZWYkE8c5AMKT74Z1Z0QHusg@mail.gmail.com>
Message-ID: <CAD=FV=UMELcq_-aYdQBW3CuJgTqZWYkE8c5AMKT74Z1Z0QHusg@mail.gmail.com>
Subject: Re: [v3] drm/bridge: ti-sn65dsi86: ensure bridge suspend happens
 during PM sleep
To:     Harigovindan P <harigovi@codeaurora.org>
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
        Stephen Boyd <swboyd@chromium.org>
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

The "XO shutdown" concept is a very Qualcomm-specific concept but this
bridge chip could be used on any board.  ...but I think it's fine to
leave it as-is since the meaning is clear enough.


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

Note that it's generally considered nice to CC folks who commented on
previous versions of the patch since they are folks who are almost
certainly interested in it.  In this case that would be me and Stephen
Boyd.

You could also, in theory, carry Stephen's Reviewed-by patch from v1
since you have fixed the subject as he requested and you have now also
fixed the commit message to have some details.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
