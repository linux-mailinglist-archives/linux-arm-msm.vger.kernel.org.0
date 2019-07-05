Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D41CB60BC2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2019 21:24:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfGETYt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jul 2019 15:24:49 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:33631 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725884AbfGETYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jul 2019 15:24:48 -0400
Received: by mail-io1-f67.google.com with SMTP id z3so6310360iog.0;
        Fri, 05 Jul 2019 12:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zRb65W3CSh6kt4Vgzb6vItxrEN29lrJAYQzpEQzbVII=;
        b=VBwKZc9v6eG+kEN6cYdqeUM8TLOB0E4CdynlREvI2S6FYkq015fmIZjeB680Av4quX
         GTY/G8e/miWfQ/DbeDV8WRsL6DzzEqjH7s8TmsZyiQrkilyYliTWJZFJkwpwEb95VuaH
         MRyPFaIkHOAehbOLR2EwoagnYUmM2jdan5yq1m1SxOlEdfIEvh21U+PKDYuP0DlgdIdd
         eReyvta7q++lyFlUY0XWJr6bY2JcjiimWY8v8xdMd+fStaOp6ZLY4ZbENlUqLvlj44Xd
         L/Sfm91Xzsrz46gi2/GvxsJWRa+oy4YV3iSn1UtY2V86A3Gji/0wm9GdnPRNNnweoEs3
         sbdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zRb65W3CSh6kt4Vgzb6vItxrEN29lrJAYQzpEQzbVII=;
        b=NRy4JVSVVTodguLwRuf9vEAGd0ViL/YQsbeG1gJMqm+xXVqUqPkAKB2nBWDx2BIKbt
         eVpygcKiQvGTq2HUR5fa6YneeWzpiCo3+n8MAv4Wko9syL2T6X2j0PaqV9VXQQOhH7by
         xnsJK46MuCvX2vOh6sS/1GO+H4kWiIjaJNVTSGw1hjbcCETNa4PwPM+ViIckk7mSj1tP
         590Nz6tqBYnshjyjW5pJvG9xu5DBNozEZzqVVVSd0BG7N+3IQuBTo+xoO5LAu1cfFNwi
         0g0LTkGXKn7dF9+0oHEISswXqrBYxon8XlnnP+2cVzbq+si73W7zTgdDq9iR1ngd8vTA
         fLaA==
X-Gm-Message-State: APjAAAVuwiSMpjRNfHxTMO/XGXjVK2dBX+1FQt/5+wkpzVsfO84GwRZK
        R2EvxCIHiSHiVDafRvZOgbpWh4cPVKA/QHV+VUU=
X-Google-Smtp-Source: APXvYqzBIuakKtxq8PhyT5SD6ZKgdCKGE0KpmSS7hRvQNo8wkQr2muelU6+8A9w9N+1CFSl0An79Y6QAV/ejkoJl1QA=
X-Received: by 2002:a6b:f607:: with SMTP id n7mr4367876ioh.263.1562354687930;
 Fri, 05 Jul 2019 12:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190701174120.15551-1-jeffrey.l.hugo@gmail.com> <CAF6AEGsGRcuk3xnWG8KspW4wzG38o-Xg8tybnND9Lb24PWP5dw@mail.gmail.com>
In-Reply-To: <CAF6AEGsGRcuk3xnWG8KspW4wzG38o-Xg8tybnND9Lb24PWP5dw@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Fri, 5 Jul 2019 13:24:37 -0600
Message-ID: <CAOCk7Nrxhf7YNkmtM1G-TE=rNC=L2zk4AJcGNvvcHpOMEMW6Tg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/mdp5: Use eariler mixers when possible
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 1, 2019 at 1:55 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Jul 1, 2019 at 10:41 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > When assigning a mixer, we will iterate through the entire list looking for
> > a suitable match.  This results in selecting the last match.  We should
> > stop at the first match, since lower numbered mixers will typically have
> > more capabilities, and are likely to be what the bootloader used, if we
> > are looking to reuse the bootloader config in future.
>
> I think for matching bootloader config, we need to read it out of the
> hw and do it the hard way, rather than making assumptions.
>
> For picking hwpipe for a plane, I made an effort to pick the available
> hwpipe w/ the *least* capabilities that fit the requirements (ie.
> scaling/yuv/etc) in order to leave the more capable hwpipe available
> for future use.  Not sure if same approach would make sense for
> mixers?  But not sure if picking something that bootloader probably
> also would have picked is a great argument.
>
> I do have some (now ancient) code from db410/mdp5 to read out he hw
> state.. I *think* that might have post-dated dynamically picking
> mixers.  (The older mdp5 on db410c also had to deal with figuring out
> SMP block config, iirc.. thankfully newer mdp5 doesn't have to deal
> with that.)

So I ripped this out and retested as I was looking back at it.  Things
still work.  I probably saw a need for this in the middle of my
hacking, but its clearly not needed anymore so lets drop it for now.
