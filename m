Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB8E3B361C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 20:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232582AbhFXSyV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 14:54:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232131AbhFXSyV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 14:54:21 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6AEC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 11:52:01 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so6493157pjs.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jun 2021 11:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8ln1A9UtqeatalTuFd5yr3Sv9uZ87THfHk+cp3HF9TU=;
        b=kk/hpXBE5BJz7ok6etMns0jGJT3f3jqTWfXAHsHthLBChYV8lxBhq/q1AF9In5F1fA
         E0TSiKV6hEkoy76XwuPOEPHt+tJQFyT6OeR4r8MdCJ1UOhPaubUrtZ3Qb5tRydKR0hJu
         kY0W/3NwZWXjYUSl3pW2qk78KHEP1UDyoVBdF8Lb2vX6fXYTFRCTZDRr/+nLzo+XNRak
         ghHpl9xm/8zNCAZZKe/5hfmYi4Kp+YikguOzBS6uA+ZWVXKaajbmX7aQIYynhu0Rf1dH
         3HMKS8/oHq0R7FHbcxwNcN2bBYoXkIhSfiBZrnn37MRU9Uswys+zToSaFAiFcvFfpWHE
         2AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ln1A9UtqeatalTuFd5yr3Sv9uZ87THfHk+cp3HF9TU=;
        b=o3BAUoZ0uV4dTPzVoZ3zacJCb+fDnI3A+At/xNL3TO+/9j2sfsMDFefKSEGKWWdRN4
         Dj0KdnrSUpAPK8RATMJN3u2dTSUyAW+Jq4ztx2ibNDbxE91pLQpXxj7jsbzj6wYiG+yF
         NuUuqmNm/vRFtOLg/bGigykJgQpvp7JcqIN73uhlPrl6L7opbKXYC4uk0YlY5YaPQ6cG
         drDuQt76PNmseabBhJoavq8w/ngR0b5VYMGpQjBqijPAyYD8dLH61zhnZFRyOPXhH5qf
         0LnvivFeQHgypdr/mMH2ajKnBNgQK2/UfLKqZL4h05gjurM4V341WkxEZzVTA8765EXu
         QwEQ==
X-Gm-Message-State: AOAM533JMUf0dfAtQeM7r9RUJ7W11gISKpndpDQue/mi/PpTKAJTNAOC
        LNm3p14a1vxs+s7YGeAJUuf/5oOOIrSsqGYSjB+k7A==
X-Google-Smtp-Source: ABdhPJy8O7GxYN+yty7XPvXAYcgzEL5eRFnt1MmDlKOjYsrxbsTHPID/Zq0mORGdAnbkU5m39EFLniFDGQSK/S6vSl4=
X-Received: by 2002:a17:90a:5106:: with SMTP id t6mr16975653pjh.231.1624560720882;
 Thu, 24 Jun 2021 11:52:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
 <20210621161616.77524-5-manivannan.sadhasivam@linaro.org> <YNSN6Yjk/P05ql8G@kroah.com>
 <CAMZdPi9=F0agD=5eSmVngmDRXNhb7TstQzgMSXFoJzkuRVFtjQ@mail.gmail.com> <YNS3T6Tp4oc66zFh@kroah.com>
In-Reply-To: <YNS3T6Tp4oc66zFh@kroah.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 24 Jun 2021 21:01:30 +0200
Message-ID: <CAMZdPi_T3MP_b9Sr8PWSNqO6SthJk4r_osJ6Jp=APcTXJEeWxQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] bus: mhi: Add inbound buffers allocation flag
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 24 Jun 2021 at 18:48, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 24, 2021 at 05:39:58PM +0200, Loic Poulain wrote:
> > Hi Greg,
> >
> > On Thu, 24 Jun 2021 at 15:51, Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Jun 21, 2021 at 09:46:12PM +0530, Manivannan Sadhasivam wrote:
> > > > From: Loic Poulain <loic.poulain@linaro.org>
> > > >
> > > > Currently, the MHI controller driver defines which channels should
> > > > have their inbound buffers allocated and queued. But ideally, this is
> > > > something that should be decided by the MHI device driver instead,
> > > > which actually deals with that buffers.
> > > >
> > > > Add a flag parameter to mhi_prepare_for_transfer allowing to specify
> > > > if buffers have to be allocated and queued by the MHI stack.
> > > >
> > > > Keep auto_queue flag for now, but should be removed at some point.
> > > >
> > > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > > Tested-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > > Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> > > > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > Acked-by: Jakub Kicinski <kuba@kernel.org>
> > > > Link: https://lore.kernel.org/r/1621603519-16773-1-git-send-email-loic.poulain@linaro.org
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > [...]
> > > > +/**
> > > > + * enum mhi_chan_flags - MHI channel flags
> > > > + * @MHI_CH_INBOUND_ALLOC_BUFS: Automatically allocate and queue inbound buffers
> > > > + */
> > > > +enum mhi_chan_flags {
> > > > +     MHI_CH_INBOUND_ALLOC_BUFS = BIT(0),
> > >
> > > Why is an enumerated type a bitfield?
> > >
> > > Please just use integers for enumerated types.
> >
> > This 'trick' for listing flags is used in other places like drm,
> > mac80211, etc...: grep -r "BIT(0)," ./include/
>
> An enum is a list of values that are unique.  Not values you can mush
> together into a single variable and look at the bit masks of.
>
> > I don't understand why it would not be right? should we simply use
> > a list of defines for this?
>
> What are you using this for?  If you are going to combine them, then
> yes, use #defines.

Yes, it's for combining, thanks for the clarification.
Loic
