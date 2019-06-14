Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 605E9467F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 20:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725889AbfFNS7r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 14:59:47 -0400
Received: from mail-pg1-f180.google.com ([209.85.215.180]:39392 "EHLO
        mail-pg1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbfFNS7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 14:59:47 -0400
Received: by mail-pg1-f180.google.com with SMTP id 196so2044932pgc.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OK2URELdO7RxY+uNF7Lnr7thgZnPbEJ6QBz1RSeWqB4=;
        b=v9fX7y6Et9gHVGLX5J5DVJ/e2cwXQKLP4ZiWPdKMtAzWG2+bTlmWHEfzNUxqF3oO6w
         Yf0m7UPWVy1QdoBtIl4sIcv7tXOFsigW8eZmUUtqn1PUz1yry+9GvwWTJFbRdcedECFL
         WnjU+wabR53xj69PzK/SDyBSgbDyhqgFZOJZEmLcnMqeiK0pjCPfzk9gSpL7PR/YXK0P
         iC9NxNHaOy9RGJHE2e0lBCDxc0fiq/RyRuXv62RiO8xrdayq99KbUQ+Ui12sbCphRIjf
         rRvb1+w4YbuRhU5WDSUtww1dA5WzZdqjRhg4Fd3M2OuKms1PlVEsaT+RFwSnlqG+UHPn
         A2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OK2URELdO7RxY+uNF7Lnr7thgZnPbEJ6QBz1RSeWqB4=;
        b=BqCdalNSDI9s9/IeonEafz9hxiZXAH0ch3h6sZepDYOOAKS5TLIDpnpLppj+aShs4D
         9T+HNYIAE2ZLXEXg8YOaFUo4YseJj0kxAssqUPD2j0lakulxjyNKn0ECIBU9FfUXNITa
         ElKSk6LkQrx9X0ZsRRclGG8+aQpdyOyyUOtd8WxV2tKUWsDJzeUmurcBO+1EShtouaiR
         BjF8CsegCPYdEd7bcuLHKyHwy6aaTdmD35tgm/UtuCSIP8xeCHBL+t3TnRQASn1Wm6Z9
         Tl7C3kfNes0JQ7ndb9wfVecyzaLhTCnTg1AiL7OW5oWh5PRZ1z++2Xo6HjoMCCv6mpqk
         y86w==
X-Gm-Message-State: APjAAAWsQntilwAWtkJ54ecXccB9zbOB53ABQwPImei1T+CZxUGDJsEO
        ZA32ZWS2/icG6Ndk3xKrj8DNDder2wHT1okhN6rU/g==
X-Google-Smtp-Source: APXvYqxqVeicjZxel9x1al9yGWZ6O6UvyQw1hBmdDdXXapS54ZMeer7SqOBYNyZjU1XbQM6Qwan5fL3eu8LSxsqMcsQ=
X-Received: by 2002:a63:52:: with SMTP id 79mr36867363pga.381.1560538786212;
 Fri, 14 Jun 2019 11:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAJkfWY50geqLZv=dnchNEGp4i1yy0QfmTSz30uL6DXJXAq3VuA@mail.gmail.com>
 <875zp8wlbv.fsf@intel.com>
In-Reply-To: <875zp8wlbv.fsf@intel.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 14 Jun 2019 11:59:34 -0700
Message-ID: <CAKwvOdmq2og84Ja6eNpiNdZd_ArxJ+=4a6_q_c2OgwX3Z+93NQ@mail.gmail.com>
Subject: Re: Cleanup of -Wunused-const-variable in drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Nathan Huckleberry <nhuck@google.com>, jsanka@codeaurora.org,
        robdclark@gmail.com, sean@poorly.run,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 14, 2019 at 2:43 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
> No opinion on the said variables above, but, FWIW, personally I think
> it's fine to add the cflags to supress warnings locally where needed in
> order to be able to achieve the greater goal of removing the cflags
> globally.

I think there's on the order of ~10 of these:
https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aissue+is%3Aopen+label%3A-Wunused-const-variable
Nathan's got a pretty good handle on just fixing them.

> In drivers/gpu/drm/i915/Makefile we actually go for much stricter
> warnings than the kernel defaults, and disable a more limited and
> tailored set of warnings.

I like this.

>
> You can do this both on a subdir and file level with subdir-ccflags-y
> and CFLAGS_filename.o, respectively.

That said, I have used this trick before, but I feel like the fewer
people that know about this trick, the less it can be [ab]used.
-- 
Thanks,
~Nick Desaulniers
