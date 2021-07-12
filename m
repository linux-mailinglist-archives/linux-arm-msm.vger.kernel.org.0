Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0D683C5D77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 15:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbhGLNmd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 09:42:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbhGLNmd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 09:42:33 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A5BAC0613DD
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jul 2021 06:39:44 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id s6so15069059qkc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jul 2021 06:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/y3AswAn7xrfStWckKQ4mdfAYQv8LuashoWFVm7wmnI=;
        b=JIUoCU9T0XfyuPyJPuVrcxCa8UoWsH/qeP/iWmQomkfVNKt6Mnzy8lEYTsbBLAjQDY
         qA2lrYcGl7R7GwRo7zb4EcRYe0d2sy5LWLilGAQERXHWRpwcRsU4AXvQl2DgNurV6j9N
         GaO1ghyx3qKRzIY5oEx/5Ib8QbPhKF1MbPyX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/y3AswAn7xrfStWckKQ4mdfAYQv8LuashoWFVm7wmnI=;
        b=rHXQzn4dwAhdZBvPVAP2lIZW8/BnvlXxrFpiYPKdJqRkdvQHcp80LRWQOiS2WisEki
         X8PtsTIBc+TcR7mdc8zKL13BAO7yfgwzemd+O90Wk6seNNUTkAUljz8Mjblyixoc+IZq
         iIJntrC6oY5j8mvWq6sj9YjT396n/A5FwRMBTM7jhExvi4fdQUC7iwymz7x/q+/LJF6F
         pRTT/Ro98btBhQeny1b0THT98/Et2gZn7cVefVEdcES3ZHVjueKjifKGYPskllKGOf/Z
         Z74dRIyWTRPIvUrOn0DswKlqaX1Tu7bM2KCbveBKwnPMDuXx4I85rd5VF74YeyGUHrvQ
         mkBA==
X-Gm-Message-State: AOAM531gduasvS0T2K2fEeUwDLRQ7OiNFZHT0fsR1TqeG1hoZ9eUKOio
        U/KAQ682c7vpDqdYf6D990BMJSonjjKDpg==
X-Google-Smtp-Source: ABdhPJyN0HPtH/WLdWpPpSgbaCx1jgl1Lgo/8M9c68veVXKtKmhC5kFnwu149mSQ2ZcrrUgJj9453Q==
X-Received: by 2002:a37:59c7:: with SMTP id n190mr52063539qkb.146.1626097183323;
        Mon, 12 Jul 2021 06:39:43 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id d200sm2920598qke.95.2021.07.12.06.39.42
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jul 2021 06:39:42 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id g5so28959837ybu.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jul 2021 06:39:42 -0700 (PDT)
X-Received: by 2002:a25:3486:: with SMTP id b128mr71633896yba.523.1626097181672;
 Mon, 12 Jul 2021 06:39:41 -0700 (PDT)
MIME-Version: 1.0
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-2-git-send-email-rajeevny@codeaurora.org> <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
In-Reply-To: <7f8562df-7e1f-dcfb-1c58-f1edd9dcc606@suse.de>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 12 Jul 2021 06:39:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8CaKObbQTCsX2GrP=O8aJUaWLZY3zgBMRATtSn6Be4g@mail.gmail.com>
Message-ID: <CAD=FV=V8CaKObbQTCsX2GrP=O8aJUaWLZY3zgBMRATtSn6Be4g@mail.gmail.com>
Subject: Re: [v8 1/6] drm/panel: add basic DP AUX backlight support
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Rajeev Nandan <rajeevny@codeaurora.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Clark <robdclark@gmail.com>, Lyude Paul <lyude@redhat.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        "Kristian H. Kristensen" <hoegsberg@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 12, 2021 at 2:41 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> > +     ret = drm_dp_dpcd_read(aux, DP_EDP_DPCD_REV, edp_dpcd,
> > +                            EDP_DISPLAY_CTL_CAP_SIZE);
>
> This creates a cyclic dependency between drm_kms_helper-ko and drm.ko.
> drm_panel.c is in the latter, while drm_dp_dpcd_read() in
> drm_dp_helper.c is in the former. Please fix.

Yeah, this was reported Friday and I posted a patch to try to fix it:

https://lore.kernel.org/lkml/20210709152909.1.I23eb4cc5a680341e7b3e791632a635566fa5806a@changeid/

I see Rajeev had some feedback on it. Once I've dug out of my weekend
email hole I'll take a look at plan to post a v2 ASAP.

-Doug
