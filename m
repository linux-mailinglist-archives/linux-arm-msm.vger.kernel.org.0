Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C195C3545EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 19:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237365AbhDERVS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 13:21:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbhDERVS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 13:21:18 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CB3C061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 10:21:11 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id d13so18461091lfg.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 10:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p/WjUWRXo+IDe/y+mKCTfQrTSTm3mkNsX9WTYOWOW3s=;
        b=lcPVlijF9oCVJyDvCuZq2rr1utg018XwqSJXnD12WyGEjGeNuCf+6oMoDHXEpTgD4H
         wAdg8ybhnDFNe1swhnJdMsptZJCkD2UV3EhTkB+h394vDWlOwQC4DOYWtRglgen0rWwl
         TtwOXYwnl6w2k8Hsmh4K0ltIVSeyruJ5EaerIAid40B1jeZoAiZ+jCGz/tnAVAG85XPq
         UdErIE9XJVhq133xdygBPh5h8+MxmjQk5Li+I/K2gdhGofjfD/T23mK3ND2onc5PEjOl
         JqHwWmaVzl5bD8iw5boeASm2un5suAh8wyXK7fEtYdDx4YKfknRfRJe6hSDJjvpd1fTC
         qRWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p/WjUWRXo+IDe/y+mKCTfQrTSTm3mkNsX9WTYOWOW3s=;
        b=aYPVJl15LtvK6ULwZ/uT9llwePywR+3I8KBc40lXlkhhBEpIrM2hkiFiFoayme9DAI
         HZ/L7kUgrfpPDuh0Mdh65Tm0tf9dYfB9Tv0K0oZavTLZfM2KS+j+TciKOKC7XEh1wkdm
         99p0/6ft4jrXF5NY97UlInz9TrvVo6HLCkHOud7GxnPJHmI7TRcJwyihDnpX+1g4qoo6
         x9UjBtS/vi1tEJLsmU/RIInB2mMQT9LClmfzRq9Rs+qDoHqyKy59DlxdF5OxpsKz+739
         v/zj3lBPji2I/wJDwdy47yt8+PyeWX1Ska9SwWdPmQQ4vyrALP05EVZRA0CjpD+tUG8d
         naBw==
X-Gm-Message-State: AOAM532Yr5fx9CpO7UjmBpOI7f+GGrQb5J3QJaH3X4Vvpka7k019keYh
        J2bBJJFPUiep2QzY6jRzabzEmmflB8OnBt6PSc1i2A==
X-Google-Smtp-Source: ABdhPJzpa/Qv4TAxznqUz7EKeGVdks1XIH+m58fd/U23qQHvjXNXxBChZn6kXkZNUfGgqeNN7Kpp3vt6qoVGRuJAIRM=
X-Received: by 2002:ac2:549c:: with SMTP id t28mr17791532lfk.7.1617643270361;
 Mon, 05 Apr 2021 10:21:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210330013408.2532048-1-john.stultz@linaro.org>
In-Reply-To: <20210330013408.2532048-1-john.stultz@linaro.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 5 Apr 2021 10:21:01 -0700
Message-ID: <CALAqxLXBjTO4b01BJnboVKWZVyqLM1pXRv3M-rOYq6tMXaHozA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix removal of valid error case when checking speed_bin
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 29, 2021 at 6:34 PM John Stultz <john.stultz@linaro.org> wrote:
>
> Commit 7bf168c8fe8c  ("drm/msm: Fix speed-bin support not to
> access outside valid memory"), reworked the nvmem reading of
> "speed_bin", but in doing so dropped handling of the -ENOENT
> case which was previously documented as "fine".
>
> That change resulted in the db845c board display to fail to
> start, with the following error:
>
> adreno 5000000.gpu: [drm:a6xx_gpu_init] *ERROR* failed to read speed-bin (-2). Some OPPs may not be supported by hardware
>
> Thus, this patch simply re-adds the ENOENT handling so the lack
> of the speed_bin entry isn't fatal for display, and gets things
> working on db845c.

Hey Folks,
  Just wanted to re-ping you on this, as it resolves a regression
introduced in 5.12-rc5 and I'm not yet seeing this in -next. Would be
nice to have this in place before 5.12 final.

thanks
-john
