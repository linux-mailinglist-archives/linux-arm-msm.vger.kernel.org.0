Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50F19B5939
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2019 03:22:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbfIRBWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Sep 2019 21:22:21 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36118 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbfIRBWV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Sep 2019 21:22:21 -0400
Received: by mail-ed1-f66.google.com with SMTP id f2so5088846edw.3;
        Tue, 17 Sep 2019 18:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jmVlm1jUulhRNDWUAIDhxEV+UjKaBeH5ZgS3p3eH2ow=;
        b=O67gS0zNNb8AG6ODEGN1OqAHrHAVixyyp79QI70EvE0Mpcom7nT8hlTFb3xh8Waekp
         Kamy8iwHkC+j8VfD47sRSZ8jeTbKa7J9hZ4+2hZXtJzr06YsrHb48h5IIidbdP9ndnzE
         ARzB1fGVVCCsSWutrt8/Csnqwe0ONOvnp+x8g9sxUIzqpnWiCj3U5e1csb+kPMSzV9o2
         hudZldSg0qndlVl9qfldI4mOcdWOm1orjNzZwsV4wu6YUxUkPn8WSozxskq+NDgxNqRG
         aaFB+QAanF7yaWNGbmsLVDMUJSaSk1NiY25ElsbPsSzGeJxCYMjClfAmgjj2JOYxwLUT
         mCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jmVlm1jUulhRNDWUAIDhxEV+UjKaBeH5ZgS3p3eH2ow=;
        b=WFdnJxN8TIQB+viPmGzgce/yOopWC3SbQZT24Z4UhQ1v1WX0yMeGab3AAzSAioK67O
         5Y3yHuQKgB/dDZHV41Y/gY8Us1HXkcNkCBvdfMHgWijGn/6jjgogCr3lZmqnWzbhCTc3
         NhMcsmVHIunrsbnTM1YSO7QhCSWvLZQtXIbd1RkwHBVMLHBRuAPNEdaABmOL5lNnhNTz
         JOYbXXpRBIkrErJlVEbAmUBOJz99Iw20EkWSKiSQWyiTFLfOn+oy6IDGij/cKm9nbBHk
         2YRtnkdY5JYOZH6e/1Ckso6SLv9BDPQIkck8CZd3RpFI8/sGzuS4/KjrPjf+f5IKQ7PZ
         CEVQ==
X-Gm-Message-State: APjAAAWuGwcjyia3pTC1uuaBAPRC5fal69mzTwCEidBqGJVhdwZkYBbE
        x0Dbye3mP3Tj4dTDZ7v3TrQEw43xe3nltmzBznw=
X-Google-Smtp-Source: APXvYqwhWXpzktRd+5vRWfk9UpsttS+IpYu81FG1a3dXaB1RHhj8YAh4LwU6mfV0UMe9SGhJOT6fCHKgk1AqdPdkgZ4=
X-Received: by 2002:a17:906:c79a:: with SMTP id cw26mr7214469ejb.265.1568769739678;
 Tue, 17 Sep 2019 18:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190916201154.212465-1-ddavenport@chromium.org>
 <CAF6AEGurXuCMj=bc5=9CwBqzNM_BKEaJupk+-V7=aYou=wgmDQ@mail.gmail.com> <20190917171420.GB25762@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20190917171420.GB25762@jcrouse1-lnx.qualcomm.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 17 Sep 2019 18:22:06 -0700
Message-ID: <CAF6AEGt_isMOiC6NL_xorUSnAEK5YnrzGanQrPV0YP=E5hV0VQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Remove unused function arguments
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     Drew Davenport <ddavenport@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Enrico Weigelt <info@metux.net>,
        Bruce Wang <bzwang@chromium.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Brian Masney <masneyb@onstation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 17, 2019 at 10:14 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Mon, Sep 16, 2019 at 01:34:55PM -0700, Rob Clark wrote:
> > On Mon, Sep 16, 2019 at 1:12 PM Drew Davenport <ddavenport@chromium.org> wrote:
> > >
> > > The arguments related to IOMMU port name have been unused since
> > > commit 944fc36c31ed ("drm/msm: use upstream iommu") and can be removed.
> > >
> > > Signed-off-by: Drew Davenport <ddavenport@chromium.org>
> > > ---
> > > Rob, in the original commit the port name stuff was left intentionally.
> > > Would it be alright to remove it now?
> >
> > Upstream support for snapdragon has improved considerably since then,
> > it's been at least a couple years since I've had to backport drm to a
> > downstream android vendor kernel.  (And I think the downstream vendor
> > kernel is getting closer to upstream.)  So I think we can drop things
> > that were originally left in place to simplify backporting to vendor
> > kernel.
>
> Downstream has gotten close enough to the IOMMU API over the last few LTS
> cycles and nearly everything outside of a2xx that can work on a modern
> kernel will likely be using a arm-smmu-v2 or a MMU-500.  This code can happily
> go.
>
> > (Also, some of the regulator usage falls into this category.. at one
> > point the downstream kernel modeled gdsc's as regulators, but upstream
> > uses genpd.)
>
> Downstream still uses regulators. If we ever needed to use a downstream kernel
> for whatever reason we could easily hack them back in but I don't feel like this
> is a likely scenario.

ok, maybe we can keep the regulator cruft for a bit longer until
downstream moves to genpd.. with dummy-regulator, it doesn't really
hurt anything.

Do let me know if future downstream rebase moves to genpd, I suppose
after the next LTS after that would be a good time to garbage-collect
the regulator related gdsc management

BR,
-R
