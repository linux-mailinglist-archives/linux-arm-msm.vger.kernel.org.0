Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8057A22A2C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 01:01:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733008AbgGVXBj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 19:01:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729198AbgGVXBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 19:01:38 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 296EDC0619E1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 16:01:38 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id e90so3073419ote.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2020 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zMYtvDBeGfcQxAGCAdsv13lRzxlc7JtBvhHF/yrjphQ=;
        b=LDgxRU0PPlOqe+jIyOjiUKQdehMfoZWAjfvZ25p0KPl8vFDDdOtUj3vbuWcx1d2HiM
         bsCRH9MS1l8LDU98iOSE7GPEolaslu2fkxDb1T3PBTgCR24VzMdTGS6k/iPRG3QEztNe
         Em9GsZq+bVr765qjSjudsYKVBDe/BWvUycBl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zMYtvDBeGfcQxAGCAdsv13lRzxlc7JtBvhHF/yrjphQ=;
        b=Vp23WCnwExp5FQfX1nIdyM/zZZYUVlhsdZmeWN/v2tad9q2x4gfcQ4fBZKqLfEjXT+
         EJIKbUzX9ANFSCrqKdfuBlylq2FAAuYHGsnTsmUQSJdowJ5Wf0J2gzHZIceAUfTW48BI
         /p78Y/GgkTM/6ASYqftsedHL07LL4sqH9JPiArPC7P3SjNrK1h0p/rW6olqnjbzWupDD
         yai2pBF+Jfmar7V4MwKrhubiZrs6m+Rvo97ha4XkbnqZQ5YotvFD/pQDBg6pNukHjeZQ
         C7abgQUZ2GY6ZzT/iSmrKIsZDZxXGweQ3bIwtXLMEctaIjqy/VKjol5ydN1z1re4I2+4
         hlXw==
X-Gm-Message-State: AOAM533j28F8yXv8p0VaUnJQ9fVMSTXZDnBXNEHTf5jv+LyayNt6gDXL
        XGGlah2OuWqk7SJk88Zh+ERnDs3uok5ikrqwk/ed+g==
X-Google-Smtp-Source: ABdhPJzMRGNhyEWDrKRLOE3infJnLErmNB6h5FHJQExFCTQdMa95a4Z/n+l6f4RR6YJ3xa3qMPCPWE5qcULyrQPYc4Y=
X-Received: by 2002:a9d:d55:: with SMTP id 79mr2018905oti.281.1595458897417;
 Wed, 22 Jul 2020 16:01:37 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu> <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu> <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu> <CAF6AEGsOZshgBUnUKUF_hOLNHmvrvsDwPzX24-RKos6MZEeusg@mail.gmail.com>
In-Reply-To: <CAF6AEGsOZshgBUnUKUF_hOLNHmvrvsDwPzX24-RKos6MZEeusg@mail.gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 23 Jul 2020 01:01:25 +0200
Message-ID: <CAKMK7uF=vhzZSKuy6XV=R7roabxMt104Vg_w8axNmLi4EE6+0g@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add support for GPU DDR BW scaling
To:     Rob Clark <robdclark@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
        saravanak@google.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        dri-devel@freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 22, 2020 at 5:47 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Tue, Jul 21, 2020 at 10:30 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 21-07-20, 07:28, Rob Clark wrote:
> > > With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> > > tree and merge it via msm-next -> drm-next -> linus
> >
> > I wanted to send it via my tree, but its okay. Pick this patch from
> > linux-next and add my Ack, I will drop it after that.
> >
> > a8351c12c6c7 OPP: Add and export helper to set bandwidth
>
> Thanks, I'll do that
>
> >
> > > Otherwise I can send a second later pull req that adds the final patch
> > > after has rebased to 5.9-rc1 (by which point the opp next tree will
> > > have presumably been merged
> >
> > The PM stuff gets pushed fairly early and so I was asking you to
> > rebase just on my tree, so you could have sent the pull request right
> > after the PM tree landed there instead of waiting for rc1.
>
> I guess I should have explained that my tree gets pulled first into
> drm-next, which then gets pulled by Linus.

Yeah either topic tree or acks for merging in the other branch. No
rebasing in the middle of the merge window, that's rather uncool.
-Daniel

>
> BR,
> -R
>
> > But its fine now.
> >
> > --
> > viresh
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
