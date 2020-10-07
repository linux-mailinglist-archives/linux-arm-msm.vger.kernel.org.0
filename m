Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3722864C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Oct 2020 18:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgJGQoX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Oct 2020 12:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgJGQoX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Oct 2020 12:44:23 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18737C061755;
        Wed,  7 Oct 2020 09:44:23 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g12so2966342wrp.10;
        Wed, 07 Oct 2020 09:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1mE5Gwn7xDIbM4htDyTfJFvStSh1Kg9XYcxXUrf4KUg=;
        b=qIM+Yh3y1tTEMLEhGgZdsvlJJLqbxVhsnJEIVoxm1EkKMcNXPsUH55jARR3ezgWKDx
         9DBnk7oaNMu1GJOG7a7oTNnS9Hu4/W0MpHuo8a5rgSgM5MeIEPUrmXEpy4hy3Vu4aT4j
         QkWouP/erWGYyvTE5hHKbdxlGcsla3Ne/q2GCp5u7MQ8DQWFn4PxZDxffFXIWaFc+ECE
         dy8nO2lF/XFRfNJoDknZW5CKKKGvBwwf8bsgVftP/ALcXwfGWj3CG6hS8RMrcpbDkMIJ
         dcj/vTtBzXmFC+52hmFHX4tS76Zum9doFKeHuICoAifeljMVT5FNF7iEnFHU5UJS+dI1
         aIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1mE5Gwn7xDIbM4htDyTfJFvStSh1Kg9XYcxXUrf4KUg=;
        b=ExxZafcEvIKhc3lkCcTr8vTi2Bi8O2Sznlz9YINhyYYpoiFPkZH4EtL/jEe2yFTnsJ
         kg2r9QAhJikmYEogUOJSilIl48P219/4j+3DQgswYZaeRWh9JwIQLNVL3McirAoud08z
         jp4KBwyWMufNtYd9jHm1c/4lzunuze29hvfXeQZZaVqtHnst2l/ynbeO/0+To1K7/5AP
         P4EF3gYjgXhYbwdt5VO1pSoltxQAWsdjcXmHYfvhLiiPbsZEzIFcItORoWVV4VuDQv8j
         +lo/kDjppGj4SDy06jge80SRL92x4lPKGtkMMf8Xcbi42WiATOzRaCmqpg0kngJa3qNf
         tVBQ==
X-Gm-Message-State: AOAM530seaS3Afv9tJqBnhB2ywv9+X5EDRq47WWKAX9NUwPnlXQw+wl9
        OEn7CsnXro0vs88ztYVeUqbFrQHeVpuWinAJiP0=
X-Google-Smtp-Source: ABdhPJz5HXnIE07xhxeYYE0PvUFLfABD/NJndXH7Tzk3cKxWEGnk9LZL0h8rgo1bVNUoAUGvaOwZEIX4OPrvF4gLutw=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr4568520wrg.83.1602089061296;
 Wed, 07 Oct 2020 09:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200930211723.3028059-1-robdclark@gmail.com> <CAKMK7uHHPWE3h7ssG-dpb3czwbP5VtZYztMA=CpvQ4HV4LQTXA@mail.gmail.com>
 <CAF6AEGszF60dWn37m63wujjtuObqkz2ZqEN3LHaPhCkKa1cdmA@mail.gmail.com>
 <CAKMK7uEd853irzdBMCcaNEMAeOZKVFcFpgNtcYrgQkmHxdT3-w@mail.gmail.com>
 <20201002105256.GA6112@intel.com> <20201002110544.GB6112@intel.com>
 <CAF6AEGv+UnZJoBj_ELRVr4sQeMs52vAgyw2g+wtabLPBrYDKvw@mail.gmail.com> <20201005121524.GI6112@intel.com>
In-Reply-To: <20201005121524.GI6112@intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 7 Oct 2020 09:44:09 -0700
Message-ID: <CAF6AEGtgTb-1YQpL4CV2A=CQxkSxjn-FxDybrzSitTDSmCY_GA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm: commit_work scheduling
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Tejun Heo <tj@kernel.org>, Qais Yousef <qais.yousef@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 5, 2020 at 5:15 AM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Fri, Oct 02, 2020 at 10:55:52AM -0700, Rob Clark wrote:
> > On Fri, Oct 2, 2020 at 4:05 AM Ville Syrj=C3=A4l=C3=A4
> > <ville.syrjala@linux.intel.com> wrote:
> > >
> > > On Fri, Oct 02, 2020 at 01:52:56PM +0300, Ville Syrj=C3=A4l=C3=A4 wro=
te:
> > > > On Thu, Oct 01, 2020 at 05:25:55PM +0200, Daniel Vetter wrote:
> > > > > On Thu, Oct 1, 2020 at 5:15 PM Rob Clark <robdclark@gmail.com> wr=
ote:
> > > > > >
> > > > > > I'm leaning towards converting the other drivers over to use th=
e
> > > > > > per-crtc kwork, and then dropping the 'commit_work` from atomic=
 state.
> > > > > > I can add a patch to that, but figured I could postpone that ch=
urn
> > > > > > until there is some by-in on this whole idea.
> > > > >
> > > > > i915 has its own commit code, it's not even using the current com=
mit
> > > > > helpers (nor the commit_work). Not sure how much other fun there =
is.
> > > >
> > > > I don't think we want per-crtc threads for this in i915. Seems
> > > > to me easier to guarantee atomicity across multiple crtcs if
> > > > we just commit them from the same thread.
> > >
> > > Oh, and we may have to commit things in a very specific order
> > > to guarantee the hw doesn't fall over, so yeah definitely per-crtc
> > > thread is a no go.
> >
> > If I'm understanding the i915 code, this is only the case for modeset
> > commits?  I suppose we could achieve the same result by just deciding
> > to pick the kthread of the first CRTC for modeset commits.  I'm not
> > really so much concerned about parallelism for modeset.
>
> I'm not entirely happy about the random differences between modesets
> and other commits. Ideally we wouldn't need any.
>
> Anyways, even if we ignore modesets we still have the issue with
> atomicity guarantees across multiple crtcs. So I think we still
> don't want per-crtc threads, rather it should be thread for each
> commit.

I don't really see any other way to solve the priority inversion other
than per-CRTC kthreads.  I've been thinking about it a bit more, and
my conclusion is:

(1) There isn't really any use for the N+1'th commit to start running
before the kthread_work for the N'th commit completes, so I don't mind
losing the unbound aspect of the workqueue approach
(2) For cases where there does need to be serialization between
commits on different CRTCs, since there is a per-CRTC kthread, you
could achieve this with locking

Since i915 isn't using the atomic helpers here, I suppose it is an
option for i915 to just continue doing what it is doing.

And I could ofc just stop using the atomic commit helper and do the
kthreads thing in msm. But my first preference would be that the
commit helper does generally the right thing.

BR,
-R
