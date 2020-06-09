Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA811F3D87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 16:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbgFIOE3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 10:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730359AbgFIOEY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 10:04:24 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4DEAC03E97C
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 07:04:22 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id r2so22885495ioo.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M11TlZ8BCkkiyM14zjB6SRMJjOFPdi0sycPDLMDZtzg=;
        b=WcKt86PI06koGDiMZklr+HDKxwBnBrf72EEYGJhlLB2eLfI7DuOgfRzmxlQpnDf3P+
         xcqPS5N2kWZzPQLjpuC6LQTeBJYkCixcYSwseGmp3ZHoktGwLwjZDAryXzofcxVTm7tI
         +ZeDAoYJLmTSokrxd3haNf0dUpgnAdHtIhxPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M11TlZ8BCkkiyM14zjB6SRMJjOFPdi0sycPDLMDZtzg=;
        b=jn8qmJmwB9K5PQ8H576N2y6lcrpEhf/XVilh66L+mDfcOAiDG9lXVe4j+ogo3i8vwp
         oBKz35Lq6+SfcKxRgoTgKT5gpWFNr1BmjSZIoknVsnDlzEot1PEZKev6A5Za4OzOfXUq
         iUT1EgDt5WggW2mEG6lLq/fGE0SNTaqrx84oU8AmRSCgw9w0tUWg0LROLtpSuQnBb+x/
         xZ8QanmSo9+N2rVQy9y8tl1qbauRCK5ntqakO3K9R7NgCPiXZOcYbzxDIjJcMv8ObOTr
         oNdHIhkQhrLSC1p17/rNN2iQP0vPqVgFIj/FQJ4IR5VTwYYufUrQO36v8L4Ha+fDiG5W
         jn3w==
X-Gm-Message-State: AOAM5331ON/z1CXwh3uWqy/M9lD2buzgb6XDdZwMakt9C/zM455yB8PO
        CccLlYk/1+BEvL8kLdZAV+OGLuMWdXHOewhUVQkYwg==
X-Google-Smtp-Source: ABdhPJyG91jHkheJimS86A26g34xw4jYgUCjF+/j9VS/jduQO60MV/ip1Uo+HQrXE9vAcZ0eYj2cAUokFLTwKjv6VUk=
X-Received: by 2002:a5d:858a:: with SMTP id f10mr27458957ioj.184.1591711462114;
 Tue, 09 Jun 2020 07:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de> <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
 <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
In-Reply-To: <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
From:   Rob Clark <robdclark@chromium.org>
Date:   Tue, 9 Jun 2020 07:04:49 -0700
Message-ID: <CAJs_Fx4V9JkwATGeY8eV=Z1khr6z=OVd+B=YRJ1RY7xxxM47_Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: fix link error without CONFIG_DEBUG_FS
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 9, 2020 at 5:48 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, May 5, 2020 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > > I ran into a randconfig link error with debugfs disabled:
> > >
> > > arm-linux-gnueabi-ld:
> > > drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
> > >
> > > Change the helper to only look at this variable if debugfs is present.
> > >
> > > Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > This fixes a compilation error for me on the APQ8060.
> > Tested-by: Linus Walleij <linus.walleij@linaro.org>
>
> Could someone be so kind and apply this fix to the MSM DRM tree?
>

This should be fixed by 20aebe83698feb107d5a66b6cfd1d54459ccdfcf in
msm-next/drm-next, are you still seeing this issue?

BR,
-R
