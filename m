Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEA0A2A151
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2019 00:32:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404394AbfEXWca (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 May 2019 18:32:30 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42998 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404233AbfEXWc3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 May 2019 18:32:29 -0400
Received: by mail-ed1-f68.google.com with SMTP id l25so16295824eda.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 May 2019 15:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oHWqURW4CUWaZnmeogCJ1KtdIdnFykBBroGmr7/yAPM=;
        b=nkQrhcQ3KCaOkVk631LAHTIBFTuuVDoFZ8BQ3W232OjjQLLQnxOdRESWdNbzUqe+Je
         Z+KZG5kPR9i1mXurmr0VjukqmHYOoNwa1qG8E0L3XP9oNE9pricJFuSsSEUAh3it7SFe
         nYOJuzhZNCT7hW6Xal09mR2zQ//J3YFue2lnrFbk5WKRzM0ee5qcEFEjOVQyzMsBi7v2
         uO6V4lYA9QU0HkaEn3y6Id+KTSmaKEcnWz/0rPgE6j+b4DqsjLJLqHAlpybjSNcw7iYA
         J/VVgY/nzawLgVjEzu6F3FOI5LHQ+Z7Rq4F51sieSeGAZtJ0rUhxNZ9axZGzNvhz5wZ3
         cHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oHWqURW4CUWaZnmeogCJ1KtdIdnFykBBroGmr7/yAPM=;
        b=eOo2QgEfmK2Id0lS+sq0/kQ48dOuEYgzaEKPl7/2GpAMlYEYkgGHh904jhx2bUdcAu
         uO6F0smWOHFnofH23H+KLAMDgoFWAHt0AZObYyuykpQJk8dNT/fKhSoqihnz1u6WCNIH
         dLV5plTUcHY9OLHQecugypwuUtSOvJCxFvm+wpgh2fOO0wyyvQusz0q3M5p19l8RQm6M
         Oe5XjLpT5cHxuRwoteZe6OtrKufLzzEOlWXLENuMeDp0or45trvkfD/o/XeWbZM8HVAY
         do6G1pXWDWhzWTvQIzJn4wzbkYqLd8Sed1393a6cc+su1EZt2CP8IgebSK92+o8rmsfu
         fgeQ==
X-Gm-Message-State: APjAAAXVRoYcIMibIvSMNXK1RCIloq5AgXr6dOFXOvApKrpspaOkDpPS
        9CKd7FQHdothhpbkcaWrc/mSY4n0P1OzPXN5KruYRKZH
X-Google-Smtp-Source: APXvYqzTMSStCHdV8ZpXiDPzAJeZD+lH4y5qDmv4argKbo3ap4ZpS6OgFnwwoBRIgbCx9iId20Ls5K9Ow7Mp9+FSnCs=
X-Received: by 2002:a17:906:32db:: with SMTP id k27mr810381ejk.258.1558737147932;
 Fri, 24 May 2019 15:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190524173231.5040-1-sean@poorly.run> <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
In-Reply-To: <5ce85778.1c69fb81.ccfd3.bac8@mx.google.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 24 May 2019 15:32:15 -0700
Message-ID: <CAF6AEGuZB897EBqdoam721-BHe-zu2cYPE0n_vSQKKBnjeidEA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: Use provided drm_minor to initialize debugfs
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 24, 2019 at 1:43 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Sean Paul (2019-05-24 10:32:18)
> > From: Sean Paul <seanpaul@chromium.org>
> >
> > Instead of reaching into dev->primary for debugfs_root, use the minor
> > passed into debugfs_init.
> >
> > This avoids creating the debug directory under /sys/kernel/debug/ and
> > instead creates the directory under the correct node in
> > /sys/kernel/debug/dri/<node>/
>
> So does this make it become /sys/kernel/debug/dri/<node>/debug?
>
> I wonder why it can't all be created under /sys/kernel/debug/dri/<node>
> and then avoid the extra "debug" directory that isn't adding any value?
>

From the looks of it, it will still create the 'debug' dir, but at
least under the correct <node>..

for the record, I'm all for getting rid of the extra 'debug'
directory, it saves me some extra typing ;-)

BR,
-R
