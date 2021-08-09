Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789F13E4F21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Aug 2021 00:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232978AbhHIW0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 18:26:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232881AbhHIW0V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 18:26:21 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F26C0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Aug 2021 15:26:00 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id c130so11914283qkg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 15:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1kSuSdOzpn2BC3hOOiKLl3g0gaz4argQkrrvlL062JE=;
        b=kr9pYlMuV9ECH5XIXkt+0asDJ+giRnj4+5OSL6oQgpR/pvLqhUJJIA7vco8MDpekpg
         JNiiBamDLModZJ3liyKJ5Z/cSkx8a67P7K7Q12+71TEeSlCraUlj5CKRm4h3KFF7i360
         35Eu0UmQtpvg4y7StN2DunBOonRSZiHz90auk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1kSuSdOzpn2BC3hOOiKLl3g0gaz4argQkrrvlL062JE=;
        b=tr7OR5WsNfYTc3A0tfwLTivuiyi4kZcV6o4RWlCagfLtwRKGYkNO2AG9L/jbywJ3ss
         mQwCmjeA6/ZBU8keoBG980BAynu0T5iRiCTa3cFOy0AOm/FOnN17Rt2FiELO88Z+Vl+h
         zZpRD7yH+hVj/yaU6A04DoXpWzRK8RO+sU2Yaj+lF1T/s/g4lThObhPBmdZ1lRlC8M2D
         xhnQaPgLlt2+cL0Q7/X2TUD87dq16OcV3Jav7LwYE8M7kq+6ltgOlFNWmrmVOlEcQnyg
         o3f/l38PdtlYo3q19NmnToJJQjUbvZllEQ4J6Wb/y8/RscuxXXh2ndg1jumqcGBXzX9M
         /bMA==
X-Gm-Message-State: AOAM530zhdnRDDAkMCKpYM6j1aGG8Ka48kcsxOofLsmUfZ9dWmkBGc1O
        eidm9NWa6Ez4Pa+F78ulhASJ/hCFDlNoWg==
X-Google-Smtp-Source: ABdhPJxR/wNoXePeWIYtFYN2k5/j5x0brFSNMwIhjWWRsodOYjAeyYuTx3EKPWLTVaoFR1gMTBc1qw==
X-Received: by 2002:a37:8906:: with SMTP id l6mr25260999qkd.210.1628547959075;
        Mon, 09 Aug 2021 15:25:59 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id l4sm4522614qtr.67.2021.08.09.15.25.58
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 15:25:58 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id z5so30701090ybj.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Aug 2021 15:25:58 -0700 (PDT)
X-Received: by 2002:a25:b845:: with SMTP id b5mr33593609ybm.343.1628547495182;
 Mon, 09 Aug 2021 15:18:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210730212625.3071831-1-dianders@chromium.org> <YQmp3mGpLW+ELxAC@ravnborg.org>
In-Reply-To: <YQmp3mGpLW+ELxAC@ravnborg.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 9 Aug 2021 15:18:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxOXJEgq7SiOVwSo2eWEbekQqutucFP=MmrrtmStXxog@mail.gmail.com>
Message-ID: <CAD=FV=XxOXJEgq7SiOVwSo2eWEbekQqutucFP=MmrrtmStXxog@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] eDP: Support probing eDP panels dynamically
 instead of hardcoding
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 3, 2021 at 1:41 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas,
>
> On Fri, Jul 30, 2021 at 02:26:19PM -0700, Douglas Anderson wrote:
> > The goal of this patch series is to move away from hardcoding exact
> > eDP panels in device tree files. As discussed in the various patches
> > in this series (I'm not repeating everything here), most eDP panels
> > are 99% probable and we can get that last 1% by allowing two "power
> > up" delays to be specified in the device tree file and then using the
> > panel ID (found in the EDID) to look up additional power sequencing
> > delays for the panel.
>
> Have you considered a new driver for edp panels?
> panel-edp.c?
>
> There will be some duplicate code from pnale-simple - but the same can
> be said by the other panel drivers too.
> In the end I think it is better to separate them so we end up with two
> less complex panel drivers rather than one do-it-all panel driver.
>
> I have not looked in detail how this would look like, but my first
> impression is that we should split it out.

I certainly could, but my argument against it is that really it's the
exact same set of eDP panels that would be supported by both drivers.
By definition the "simple" eDP panels are the ones that just have a
regulator/enable GPIO and some timings to turn them off. Those are the
exact same set of panels that can be probed if we just provide the
panel ID that's hardcoded in the EDID. As you can see from the
implementation patch I'm actually sharing the private data structures
(the ones containing the timing) for panels that are supported both as
"probable" and as hardcoded. If we split into two drivers we'd either
need to duplicate the timings for all panels supported by both drivers
or we'd have to somehow export them (maybe hard if things are in
modules). Also, since it's the same set of eDP panels we'd need to
exactly duplicate all the code handling delays / HPD. It just doesn't
feel right to me.


-Doug
