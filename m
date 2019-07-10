Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F44164A6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2019 18:05:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbfGJQFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jul 2019 12:05:21 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:43050 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbfGJQFV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jul 2019 12:05:21 -0400
Received: by mail-ed1-f66.google.com with SMTP id e3so2692220edr.10;
        Wed, 10 Jul 2019 09:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v9lITRSzypmyFPUaKxrAh0HrfvCaK/Gn5vpP+ktrEf0=;
        b=muLQ2P0NXlrQVBmHx152XvttZNcGJ4KdJMjn6ZbfA2k1eiiB42Ec+DciKp8o5ThWA6
         lE1KpdW3J7fgvjMCtTW0L4R9LjOJ+TuP9iRx/kYzBewwHtoXQJyjUuwn9qZthgSHKJpW
         DKZmYvEjTSqZL+LB2jm3NZY9iug6FISRqlEFZ/kdDVz1SKIi6ZfM/f0X1kgFc6nStBJS
         tnUNL17aYmJ8O2triX5oesdpw+9yna9aeb+IwZrocnmeHuZwcFLCO10emMrTbEvZqYFt
         AtO0euTVSX6WhuEmXC1qnUXMt7XX5H6aSvd7Mdyby+JXFJ/f+V0AAK5XWZq5wydTwJ9g
         dStA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v9lITRSzypmyFPUaKxrAh0HrfvCaK/Gn5vpP+ktrEf0=;
        b=U5yivHUvunZSj/FPqqzok72+DuLPWp1dgnWw9DujRpqKSRGqiPwoz8zx6mz1HlP8a0
         0juv5qla+me5WRnRX0OYNjnkVqw//zxTt5SA9W7yMRnKDGQvy8wwPqpskh8Kv4bHNMxi
         XChPBVlnQy7WDX616XYOLSiSOwEEnRyAsokIoD82cuzPBXEhkCGJGFugffQKbtw2FBRe
         Yl4FAvt9DCor7VD7vzmbH/UlplV+nPlr4zIREdz0W2Co9NCZJVlvsry/MXu2kqRaStDW
         h7mb+pRXdeYr/dmJE0Hp6iGbF7XvA3KqZbvR6bzaqxFV0vljOsg8+VEfB3nRhuCimRcw
         kM0w==
X-Gm-Message-State: APjAAAXI4To+HgBWuVl0RjvokfSKeFIjodmMGRs9UEZPuB9hRe5zLRDg
        4D/QteTZYUjOE7RgGnOkBfgmxBqpphSVWEf9ArM=
X-Google-Smtp-Source: APXvYqxeO9GUyADWX05HW3k95+ygftQ/xTrvw3s+8plnEYpZJ6vNgAjgilhG3fsx/KHNX/LAVKNGJfr1+ZnrRxoPI98=
X-Received: by 2002:a50:9177:: with SMTP id f52mr31340174eda.294.1562774719928;
 Wed, 10 Jul 2019 09:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190703140055.26300-1-robdclark@gmail.com> <20190708181840.GD30636@minitux>
In-Reply-To: <20190708181840.GD30636@minitux>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 10 Jul 2019 09:05:08 -0700
Message-ID: <CAF6AEGsGbOOssmTB0WUJUPJRkhvhwLpe81fYVa0PSXLPKDSLZQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: add missing MODULE_FIRMWARE()
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 8, 2019 at 11:18 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 03 Jul 07:00 PDT 2019, Rob Clark wrote:
>
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For platforms that require the "zap shader" to take the GPU out of
> > secure mode at boot, we also need the zap fw to end up in the initrd.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>
> My upcoming pull request for this merge window includes the support for
> the mdt_loader to read unsplit firmware files. So how about running the
> firmware through [1] (pil-squasher a630_zap.mbn a630_zap.mdt) and
> pointing the driver to use the single .mbn file instead?
>

I wonder if it would just make sense to list both, at least until we
change the a6xx code to *require* zap fw if the zap node in dt isn't
removed (since the outcome of gpu driver assuming missing zap fw means
zap is not required is slightly brutal)

BR,
-R

>
> If not, you have my:
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> [1] https://github.com/andersson/pil-squasher
>
