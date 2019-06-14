Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5670B467EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 20:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726046AbfFNS4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 14:56:04 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45395 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfFNS4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 14:56:04 -0400
Received: by mail-pg1-f194.google.com with SMTP id s21so2019760pga.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 11:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vi9HOqhVGYAs7GQ1RGU6Au5JJxjAyVHZ1t3+UITLDWM=;
        b=KcCX5mU37AGn3G3Wc0liG/jc8GtXaM2IsJzf9mOsShHLTiWFHUKFqTCT42vg2eB+Q7
         8PSsg1gghWwbdHmqGZMVPntXTFyG6yoY0N90EQ36+PBbZeMfTxZcpRTKLZfl6//wrAK4
         SDvVd5e0150rwYewbq+DsFK3frIYOG5SX6HN9BaLhVvd3vwCmrAnC3PoxI2sD4j4uNqX
         5EMYKvnnMmd95YfKhE1dM44Fzwap2ygjtdKBzCLirgKWHiGYnKemGVp9hq6IsL59iU2V
         X3UZlVy2HJxDiz7/YrvBkRz77XWOLJ77jsf2S8FQ0anVH2r26eX84KzTevp62JW/eRmX
         komA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vi9HOqhVGYAs7GQ1RGU6Au5JJxjAyVHZ1t3+UITLDWM=;
        b=gggNVhoZRntkPfezt61Dg1TNtppSzpY8ioGb/eOzRKZ3f9/rAsHNhfrXrLQ8Ji3FkM
         2Px8S5XGMgx0H7ZsWK6YO+kKeHeaD3gdVoldWxwPnV+P5d1u8YqlCbdoWtLSEoS6PKQ6
         +MpkHJiFqw1fMBZVZXcWKaZ/r51303xxDAOvOTyEd/i3Krbqk6a+rMbPVSlza3tVYvEv
         LkjHVMm4vgH3DojJhr3jgV32XnAC3RXDGMJw+WptyumFxT4TLmwUnjzhOBl39Ug6toJU
         7K9bBJYdpj0MCiWuE4Z8yFIpH6dwSkR/pCKKMyHesfAmcNcQ9xTHH8eHE20mA0k3mO2B
         dJuQ==
X-Gm-Message-State: APjAAAWAosnIkHTaoAUOAQMS+z4JJhPrTbAxcsZOcWpbYmi6ambNc+4Q
        vrpX7AF13ZIcKxKtOi6xVHTEAM4D4aOzKVu/mZzknQ==
X-Google-Smtp-Source: APXvYqwU93ybihiYA9qI1ZfNbjRei7zFHARUnTO+Rc8QUH+8TNozlwasI5X3wqGb0bv42HyvcYj6+f7tryRZXmfjnTI=
X-Received: by 2002:a63:306:: with SMTP id 6mr24242533pgd.263.1560538563050;
 Fri, 14 Jun 2019 11:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
 <CAMavQKLFSqb7nW1UsxutbGMQ9AM_ZXTVhrdzPsN3rJXLTnyGkQ@mail.gmail.com>
In-Reply-To: <CAMavQKLFSqb7nW1UsxutbGMQ9AM_ZXTVhrdzPsN3rJXLTnyGkQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 14 Jun 2019 11:55:52 -0700
Message-ID: <CAKwvOdkcYfeKSwvGHRmvj4xUT1vJ=vU5ubxrqrkPC1STNuOz5w@mail.gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To:     Sean Paul <sean@poorly.run>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Dave Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno@lists.freedesktop.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 13, 2019 at 1:50 PM Sean Paul <sean@poorly.run> wrote:
>
> On Thu, Jun 13, 2019 at 4:13 PM Nathan Huckleberry <nhuck@google.com> wrote:
> >
> > Hey all,
> >
> > I'm looking into cleaning up ignored warnings in the kernel so we can
> > remove compiler flags to ignore warnings.
> >
> > There are several unused variables in dpu_formats.c
> > ('dpu_format_map_tile', 'dpu_format_map_p010',
> > 'dpu_format_map_p010_ubwc', 'dpu_format_map_tp10_ubwc').
> > They look like modifiers that were never implemented. I'd like to
> > remove these variables if there are no plans moving forward to
> > implement them. Otherwise I'll just leave them.
>
> We can probably remove them for now and if someone wants to add
> support, they can dredge them back up.

Yep, this has been the feedback for other patches for this warning
when the code was dead or not obviously some kind of
bug/typo/copy-pasta.

Nathan, please submit a patch removing the dead code; it may be
reverted later when it's actually wired up.  Nothing is truly lost w/
git*.
-- 
Thanks,
~Nick Desaulniers
