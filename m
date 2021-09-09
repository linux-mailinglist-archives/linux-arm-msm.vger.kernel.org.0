Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA228405E36
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 22:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345722AbhIIUtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 16:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345658AbhIIUtw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 16:49:52 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD2FC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Sep 2021 13:48:42 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id z2so3373149iln.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 13:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FTXjmRnVh0AWFmD0C2i93mdE+aZFUcGRZVLlt4s8n9Y=;
        b=OhG+pWKst3E+Zw2mm2Uo8a8KMFQHCgO3R4jnMcjUih6JySF2ZFiRErhvUxZnuAJeXL
         nKjfbx9KitEtX2Y/fw4VacFgmEiuATD0w/3bVvTLI953fbyet2G/v6ZcKKb3tZgtvpNx
         m4R+dXz/Qa4SeGnhthj47CHw7d5Qbp8Ba0apo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FTXjmRnVh0AWFmD0C2i93mdE+aZFUcGRZVLlt4s8n9Y=;
        b=DhFSw+1OmUI/INHlS3OmI/EGuTbTyZQUtpRWrWlRX6wFBC+tT+n77QJemYaV84Akpb
         WkH8Kj/LNNv77Bs5DmmeJeW/L2rvoSHf3S7ZtW2N+W+H/ZkYy0bv/6RtYcISDrAndnUm
         iI/2CZtEDfXDEjsY+hA2CyB7WAmkh80Ag5B3SyktOh0g0HlA/1qA3e9F9bv9OSEFvEJ1
         0ZQ9SpRRlA+/zNmmqFDzWbCFj2Z5GnbGyBOPfwjTTkPflz1tmEeMchJXJO5GhISIcDdm
         i9AdLBfdJ/ljAaOPFWc46KHjCJyyB66rsx1oXHJtpi9+szOFULp7FDhBP2AwF4Cr230d
         0ICA==
X-Gm-Message-State: AOAM532+WKOAtsPsNMutQzuhCKVrAFst/rqroxy1YPaQNVRv3kUT8c6a
        Oc1WctSXAnWSqQE0MlKqHBSBshMXID2nQw==
X-Google-Smtp-Source: ABdhPJxxVUzaGk3JXPmMXAj6J5iZvmfpc3hi9PIFibqzM6h5lF/AO5+tcxOgsT2TjCSCcXwF+axHKw==
X-Received: by 2002:a05:6e02:154e:: with SMTP id j14mr3823075ilu.226.1631220521818;
        Thu, 09 Sep 2021 13:48:41 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id m5sm1474511ila.10.2021.09.09.13.48.40
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Sep 2021 13:48:40 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id a22so4068553iok.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Sep 2021 13:48:40 -0700 (PDT)
X-Received: by 2002:a05:6602:1346:: with SMTP id i6mr4202804iov.128.1631220520134;
 Thu, 09 Sep 2021 13:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210901201934.1084250-1-dianders@chromium.org> <20210901131531.v3.4.Ib2bdeceb8ce45d36c09f5d1ae62a2263276a0605@changeid>
In-Reply-To: <20210901131531.v3.4.Ib2bdeceb8ce45d36c09f5d1ae62a2263276a0605@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 9 Sep 2021 13:48:28 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XuABPeHXaCrSb+KDX-5CEgnmZFJSJF8nGg5b58-ySWkw@mail.gmail.com>
Message-ID: <CAD=FV=XuABPeHXaCrSb+KDX-5CEgnmZFJSJF8nGg5b58-ySWkw@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] drm/panel-simple: Reorder logicpd_type_28 / mitsubishi_aa070mc01
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Sep 1, 2021 at 1:20 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The "logicpd_type_28" panel data was splitting up the
> mitsubishi_aa070mc01 panel data. Reorganize it so that the panel descs
> and modes are kept together.
>
> This is a no-op code-cleanup change, found by code inspection.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v3:
> - ("Reorder logicpd_type_28...") patch new for v3.
>
>  drivers/gpu/drm/panel/panel-simple.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

I've pushed just this one patch (with Sam's Ack from the cover letter)
just to simplify future posts. It's pretty much a no-brainer patch and
there are no dependencies anywhere for it.

c8527b9ad3cf (drm-misc/drm-misc-next) drm/panel-simple: Reorder
logicpd_type_28 / mitsubishi_aa070mc01


-Doug
