Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2003F44DD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 22:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbfFMUwT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 16:52:19 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35251 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfFMUwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 16:52:19 -0400
Received: by mail-ed1-f68.google.com with SMTP id p26so173755edr.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 13:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9JQooILMN62e6ZfE6O1gpMhnquF2sDNJUA9IUqndyEI=;
        b=broFdsXH6S+PdNpgtoULbYPp3SBEyZ2qlJYslXr0tJf39BLOF1yvLXuu1ylHEKdM8t
         ox1LmQx3DOdvi9lbUn0oC+nj8BIq4VHS/4EF87zE76bY5ChCoIQdXQLIGDFpvREqxLhq
         v9o0kya5Rj0Aobbdq9i2Le7OTQNOyyGes5jGnbgqOaP1Ybk2LqDPDx4fekDBLpj79aiy
         tGktJi6FVsZOiMOK528MLeRKL9Xy+0ok5qmNDHPnZZZlOqxzXt5K5n2pZST/3W+WzyFh
         fMqdCSrniOjNXNC2Jp0dD4G7+URfbl/pSJpMLOdUncuAqtsfUvJZfXfjsgk5m95EY8Jc
         xV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9JQooILMN62e6ZfE6O1gpMhnquF2sDNJUA9IUqndyEI=;
        b=LUpQkMW4B83rlkGI4V1xPtYtsjpBxRo+rqZC16RfPdbwHEKjWy4CCRDTqUifKPXvR5
         BcArWYiXrbkef5vFUm76gNHmbJjADglYq9oyDdzWPPoemMo0Fvgx1V6gOGsBkqoS2+o7
         0WVUXovDEHNjV+DSBD49kiIVPhW8Yl83V+vZco25Qp3YnUuTtNv9JivMNp07aqm6TBLb
         mvEOB9Ovjb6bJXRwekTHPTsuAIpBn6fslJT4sD3KG49leTc+PLMQlq/75apRMLWLGmkk
         ivqp3xEbWYODTvt1HeInbB72Ohy5Kd0Yaqwnk+1cGygo7e49eFn2XZAqt8osCBfu9V3L
         ocaQ==
X-Gm-Message-State: APjAAAWpiA6rZ3iHu5MaEnZJtFmjgn57+em27Zafljq5PEpS0qQTizyf
        z511xNktptd4bz1Bpv3RfoQQhLX/77IBlgOeL3M=
X-Google-Smtp-Source: APXvYqzbQdZRkovPhDsdiNleMXm5gNHLn+z5Wtm5IEkLA1jvTvsI7lrW3hycEFVSFILFs/VGZVISZAVQXT/VZlaFzB4=
X-Received: by 2002:a17:906:85d4:: with SMTP id i20mr64252469ejy.256.1560459137193;
 Thu, 13 Jun 2019 13:52:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
In-Reply-To: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 13 Jun 2019 13:52:02 -0700
Message-ID: <CAF6AEGt+f+cPFXLmS-y_73K+ecms5vqwZQog_3s9N6g+4kLr=Q@mail.gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

so, for dpu_format_map_tile, I'd like to define a fourcc modifier for
tiled formats (we currently have a workaround in userspace w/ a
private modifier in the gallium driver).. I think the problem is
defining the layout of the tiled format(s) (there are at least two per
generation and I can't guarantee they are the same across adreno
generations).  We've mostly avoided needing to know the exact layout
by using gpu blits to go from tiled<->linear so far.

For the others, those look like formats we haven't wired up yet.

I'd say they are all things we want to support eventually, although
not sure what the timeline will be..  but I'd ask if you remove them
then split into at least a separate patch for dpu_format_map_tile vs
others, so we can more easily revert/amend to bring them back.

BR,
-R

On Thu, Jun 13, 2019 at 1:13 PM Nathan Huckleberry <nhuck@google.com> wrote:
>
> Hey all,
>
> I'm looking into cleaning up ignored warnings in the kernel so we can
> remove compiler flags to ignore warnings.
>
> There are several unused variables in dpu_formats.c
> ('dpu_format_map_tile', 'dpu_format_map_p010',
> 'dpu_format_map_p010_ubwc', 'dpu_format_map_tp10_ubwc').
> They look like modifiers that were never implemented. I'd like to
> remove these variables if there are no plans moving forward to
> implement them. Otherwise I'll just leave them.
>
> https://github.com/ClangBuiltLinux/linux/issues/528
>
> Thanks,
> Nathan Huckleberry
