Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C4E224206
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 19:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727953AbgGQRj3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jul 2020 13:39:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727932AbgGQRjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jul 2020 13:39:22 -0400
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5CBAC0619D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 10:39:21 -0700 (PDT)
Received: by mail-ua1-x943.google.com with SMTP id p6so3111464uaq.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=oOIi1T3qSHBH51MzlGC0XDR/RneCxeHWL3lEOGZbKJY=;
        b=h50OyDj1X58pC7yEJMwCHYam/5JpjacNj4lnzko/r7vN8UfLwGNHM+oCutt8YGlrWX
         sPZ3WG4CgGPiEsti7uJRLIjgLGclvu+gWYfbmNJlNQmexUpO+essviBd/mlHsE8bWYcQ
         XyzSByoFKpUZu/3vuZVc8VRbmooB91m5COMos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=oOIi1T3qSHBH51MzlGC0XDR/RneCxeHWL3lEOGZbKJY=;
        b=Twb5CCRhFySKDCA9iRnKKDXoxyLJAhJjyNRhvUWHfupFnt8OLbf0EEtnQwWe0EsSXl
         HbB7o2zQMsutmruRMeh4A6ZfWNXKl14CWMpH3JFHd5iLuHVroTDHaIbMUhdsfhdiDx7Z
         s/FEueTBD4kwezJlRjR5GTG/NlfdR0cHreRc8XwhFElUywkCGikj83kYb/LI1CVU58Sf
         qVVkPxfOkx6pcfau1heC+AxOymlYvIcKZx9eOIifeOj0BA+18AaIA7hNG7hb1gZ/3km7
         AfeDH8WeB1OtCBzz0HX3eThiovFAeANNXekiEWsnC9vUKiHnBEYob9xefq3In8YCFg7M
         WOiw==
X-Gm-Message-State: AOAM532cUwBreU1oXTw4gApIFDUseGpHx0ccd0+pgkL+Jqr8nqgE/XtJ
        KfS/3x1is+KJFuXfCj8Cnnan12AZdao=
X-Google-Smtp-Source: ABdhPJxgt6rIUzHs5MIp6snEVDi+g6XtP53uqX5MmmhheHtk9S5l3BTDo5RhlRVGwBGbNs89kVHvnQ==
X-Received: by 2002:a9f:3b0e:: with SMTP id i14mr8279289uah.138.1595007560374;
        Fri, 17 Jul 2020 10:39:20 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id i4sm1327660vkg.55.2020.07.17.10.39.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2020 10:39:19 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id s20so5267477vsq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2020 10:39:19 -0700 (PDT)
X-Received: by 2002:a67:69c1:: with SMTP id e184mr8687935vsc.119.1595007558792;
 Fri, 17 Jul 2020 10:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <1594996458-15529-1-git-send-email-akhilpo@codeaurora.org> <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200717144607.GA16703@jcrouse1-lnx.qualcomm.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 17 Jul 2020 10:39:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
Message-ID: <CAD=FV=Vdg36wBJiYM9bxGy-8hjxEf85aYAGuqR=Xh_oM0pLt0g@mail.gmail.com>
Subject: Re: [PATCH v2] drm: msm: a6xx: fix gpu failure after system resume
To:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Doug Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 17, 2020 at 7:46 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Fri, Jul 17, 2020 at 08:04:18PM +0530, Akhil P Oommen wrote:
> > On targets where GMU is available, GMU takes over the ownership of GX GDSC
> > during its initialization. So, move the refcount-get on GX PD before we
> > initialize the GMU. This ensures that nobody can collapse the GX GDSC
> > once GMU owns the GX GDSC. This patch fixes some GMU OOB errors seen
> > during GPU wake up during a system resume.
>
> > Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > Reported-by: Matthias Kaehlcke <mka@chromium.org>
> > Tested-by: Matthias Kaehlcke <mka@chromium.org>
>
> The Signed-off-by needs to be at the end but I think Rob can do that for you.

It does?  I've always been told that this is supposed to be roughly a
log of what happens.  In that sense you added your SoB before the
review/test happened so it should come before.  I know some
maintainers seem to do things differently but that seems to be the
most common.  In that sense, I think the order that Akhil has is
correct.  ...but, obviously, it's up to the maintainer.  ;-)
