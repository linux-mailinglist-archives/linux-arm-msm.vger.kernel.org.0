Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 586D12C2F0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Nov 2020 18:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403899AbgKXRnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Nov 2020 12:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403887AbgKXRnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Nov 2020 12:43:46 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645D4C0613D6
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:43:45 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id l2so21592703qkf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2020 09:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IlPh1lRjPNIWAoYTXgAgpaQnzX2qrOqt4PzLNzteUsc=;
        b=ff4erDuuZxHUo25qDyPnCe8AQM+wRSSv9P75WS3u42fdD3ZIn0BQHAPgUf9UQUHFbL
         g+oHoYmbrfrgeIrWpWZrgov5l74ZEEKpmSJaf/YZxa6uVGkgLuznzNIseXPJ5VHDj/PL
         NFC46jFQL6qp8dLqGv81ybhFBwrGjuinEkTdBGVQ9eNXVX9PZWvI7e7xKuKF27hL87+4
         Bcd/+rCMZ0Ofc8y8yDL5LF8LlbXuJXogniso9ug8LOgL8SxVm0A7CqW39CGhUXvEnX9f
         ByHwhQAbTLE7j8L3dprjqOGb7RhsFNm69SmnuBlrVkiGL9GFNOWeHzNKyZuUYLR6Lucm
         eUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IlPh1lRjPNIWAoYTXgAgpaQnzX2qrOqt4PzLNzteUsc=;
        b=kCoKiXx8KNYn4CXrm9c4Zuw1M3SVbXnCdLtWI3Fbxqw+RnNpxsnz00VahKr0EPlV7i
         iC8DwIeLypll6H7UjSVQ0HshctWeLfwC7xaHa80AOXEGC0+zX+bGyxFMiAuvz97bn6pg
         67/zPWsFZC/cel6i94CTlKLALO2xJ9MWm67BGyCqcvje5gDojjB20RMY31fNhN+xAPgk
         giDUTMBtLO7wO7MhJI5qi7kniJ6VQ1gcYj8JPRzGhLMJKY8tO0/40Fz/2EbAnLdgftFR
         fYUnjLp13vim6NXClDpcbuaA2nW4Zl5EgvAw5awNohFry0wGUCg4I6eUDOV9/PSgfSje
         DcjQ==
X-Gm-Message-State: AOAM530nmuqPDsZc3w3U9lMyIWJPuTTb/UONrCC/uKaiImRCKeMbZ2u+
        5FWyK986l8w0+FlSOqAyACXgjEj4R6IjZ0lnlbbxnQLFxIhyhg==
X-Google-Smtp-Source: ABdhPJxnVZWYH3kH8j83SpW2UoKMwEZ6B4y4J7qubRs5Bbg+n35lbVK0782XQQ/nldNFsvAfUNkgY7Et6NY0bFI51aU=
X-Received: by 2002:a25:d983:: with SMTP id q125mr9775018ybg.78.1606239824617;
 Tue, 24 Nov 2020 09:43:44 -0800 (PST)
MIME-Version: 1.0
References: <1606234711-20125-1-git-send-email-loic.poulain@linaro.org>
 <b66d5f09-7560-3b82-84a3-b7cf40c9532e@codeaurora.org> <CAMZdPi_n0h_S3f7R6H0kZO7PhpKiDLm0k6Cfxusg2+qfv1BerQ@mail.gmail.com>
 <a57f713e-db3e-c974-46b6-6e86f4882e46@codeaurora.org>
In-Reply-To: <a57f713e-db3e-c974-46b6-6e86f4882e46@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 24 Nov 2020 18:50:02 +0100
Message-ID: <CAMZdPi-EuT4ksMEDSsSz7kvto6vTpefaikDPnYo4UTBfmNL4fQ@mail.gmail.com>
Subject: Re: [PATCH v2] bus: mhi: core: Fix device hierarchy issue
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 24 Nov 2020 at 18:37, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>
> On 11/24/2020 9:57 AM, Loic Poulain wrote:
> > On Tue, 24 Nov 2020 at 17:36, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> >>
> >> On 11/24/2020 9:18 AM, Loic Poulain wrote:
> >>> A MHI client device should be child of the MHI controller device.
> >>> Today both MHI controller and its MHI clients are direct children
> >>> of the same bus device. This patch fixes the hierarchy.
> >>
> >> Why?
> >>
> >> I'm not particularly arguing for or against this change (I think it
> >> affects me slightly, but not in a breaking way), but this commit text
> >> seems pretty generic.  It doesn't really help me understand the
> >> relevance of this change.  It seems to be only describing what you are
> >> doing, but not the why.  How did you find this?  How does this affect
> >> the client drivers?  Does it make something the client drivers care
> >> about better?
> >>
> >> To put this another way, "should" is an opinion, and you've provided no
> >> facts to assert why your opinion is superior to others.
> >
> > That's right I've not elaborate too much, but it's mainly to respect
> > the hierarchy of devices, as it is done for other busses. The
> > hierarchy is especially important for things like power management
> > ordering (PM core must suspend devices before their controller, wakeup
> > the controller before its devices...). Moreover it will also be useful
> > for userspace (thanks to sysfs) to determine which devices are behind
> > which controllers (and so determine if e.g. QMI and IP channels are
> > part of the same device).
>
> This sounds like two relevant usecases which should be mentioned in the
> commit text.

Yes, thanks, going to reword the commit message.

Loic
