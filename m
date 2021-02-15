Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3F731B593
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Feb 2021 08:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhBOHXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Feb 2021 02:23:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhBOHXh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Feb 2021 02:23:37 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D358C061756
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Feb 2021 23:22:57 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id g3so4362420edb.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Feb 2021 23:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N+ImoYnqNe/cAfLCtL289x9kuPL7jb8ItlzmnFtPC+8=;
        b=Tq/fvF4ZqmiPp+d6WI8rvs7aBeIG0i/vHR6mXan4i0ldorHj5vXrxTir88YcT00d40
         x4geyEut8wg4H8Doq2BSE2JS06L8e3bie5lOz6U5UmnC7QMkwQbX22uttah9Cx4zEynm
         ElSBBxErJBCMGBYX7FhzGYchKhvwtuy/ULqXDM8FT7CYLjZQDJF/m+j28LhT9IIAnClb
         M4R4WNLTcsmNyDLAad1KYHknXE+UqZCvYFj/0krvL2j80dZiL8S8Z1d44oQwbhUT/Jmz
         pORrYHd1n8AvMZyNCo5HO63gpk+5yU4FCMclBl0mY7fPtmBRyPs1Db2RMCrGjrQTtx4k
         7a+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N+ImoYnqNe/cAfLCtL289x9kuPL7jb8ItlzmnFtPC+8=;
        b=r6o54P4qeKdTNeWRFDI4WhDFQx24xG3+eLzhJ1Ynpk/AAlrz0djNCIW0VDqAlxQ0il
         NnoR4Q+Q0SL05t+WT3Ym3TGJpkyC0szmga23rLANba5NEIOOkqBmRSn0merS3YuySLjx
         D+8MBvVeeuaJVnKTPK+unBHt5YTU3hNO6AKM0RyQmJfu5rMRynEpy7QjfgO/0cHvwkt6
         jjDVUVSweE7HI7Upuzd2moFVXvwju53PPDaRvZco4Ki75b8xAIK/yvWoyjmYJEPEEq5X
         lAPfpfEXvibhzhoCSrjjBmXqG01D9oG8JfT9W6zEKZTosMwTkmy5dm9DMoDhEyNG7XCw
         f48w==
X-Gm-Message-State: AOAM5316zNXFWOZNRFRFTi5mgnsNMrvP9fH01FfUEishmtwfZJLnScBa
        mG0si3soJimIDX3/fPsLnrhIM56LvWTB6dHI2jTZAw==
X-Google-Smtp-Source: ABdhPJxF+KA6Q0QNsygFn7voKrrijHIhA6qmrUQ04ZcdcsM83MNkW1/EvFfRP6I4zuoc5VYKDh3xs+RxAyEm5xIpVM0=
X-Received: by 2002:a05:6402:6cc:: with SMTP id n12mr14443624edy.69.1613373775869;
 Sun, 14 Feb 2021 23:22:55 -0800 (PST)
MIME-Version: 1.0
References: <1613071507-31489-1-git-send-email-loic.poulain@linaro.org> <fc43871e37761808e5c1e00406daef5e@codeaurora.org>
In-Reply-To: <fc43871e37761808e5c1e00406daef5e@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Mon, 15 Feb 2021 08:30:34 +0100
Message-ID: <CAMZdPi_rWc93B+e_P9cKvtx8v83AW18+r7HXYxn3fxALSp_1+Q@mail.gmail.com>
Subject: Re: [PATCH v3] mhi: pci_generic: Ensure device readiness before
 starting MHI
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Fri, 12 Feb 2021 at 02:41, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> Hi Loic,
>
> On 2021-02-11 11:25 AM, Loic Poulain wrote:
> > The PCI device may have not been bound from cold boot and be in
> > undefined state, or simply not yet ready for MHI operations. This
> > change ensures that the MHI layer is reset to initial state and
> > ready for MHI initialization and power up.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
[...]
> > +
> >       err = mhi_sync_power_up(mhi_cntrl);
> >       if (err) {
> >               dev_err(&pdev->dev, "failed to power up MHI controller\n");
>
> Can you share logs of what you're seeing as it is not clear why you
> would need
> this patch.
>
> We have a mechanism in place that Jeff added a while back [1], to check
> if device
> is in SYS_ERROR state and do the same: issue reset and later, wait for
> ready from
> within mhi_sync_power_up() API.
>
> Note that the MHI_IN_PBL() macro includes EDL and Pass Through modes as
> well and
> we do expect an MHI READY state move after Pass Through.

I think this is a mix of several issues, that could be fixed by latest
Jeffrey's patch and
this one: "mhi: core: Move to polling method to wait for MHI ready".

I assume it would be easier if you send this last one as standalone
fix, for review and merge.

Regards,
Loic
