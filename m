Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797F64234E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 02:22:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236953AbhJFAXu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 20:23:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236909AbhJFAXr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 20:23:47 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D83BC061753
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 17:21:56 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id w10so1505654ybt.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 17:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nexdehnj3A/Q4zSCMfs4Cp9vmGRF+EuUGSAwg+1xmZ4=;
        b=S0m/IHaElRUnXHQLukKv5K2F/NOiaHimmkJHw4Y6ljjMZCsOTMz/plMk0JEzsjD3Y7
         2gh5v+xfAv9Rx9E1m/QA2lQwPSJgRDlXosw6XMSwaJNybM9+/aL5w7JQ3jmxkwNVoIX+
         qr7Rn+JhdLL0c35GhOwHkXfH+PeIYVkxWFw7a0jcWt9KTPfZlTdq5R5yrXhY/JY3HrML
         VxL6sOw5pyKzYv/rs8dX2dnGiuYEx34mP1Dy1dwaOyV58riLliZfhILaL8jq6Vp6Nrc6
         wfToj27DsJDvYQg9dDRpdh21uy3fmiHWZVPdaPYxuDBLNlhIUWzzzDV1YkILGDjuzBk5
         WDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nexdehnj3A/Q4zSCMfs4Cp9vmGRF+EuUGSAwg+1xmZ4=;
        b=UiiF13WQdVzCt1JyZVVx7AAsOAvlspznTgXOoD1w0MGOLYJ9kfdM5mFVAgX/i2UqpX
         5ZYrVTrWJdHCvrKj9ziojdYstj4hsqSSkuz+dHPYpqQ/hqoK8v4vFA2HnTbv1jcxzg2o
         2+zMaDvNWefKi4pbW7zhBSC5wl0iqxch4DTBGlsEYqPD/Y3ae0p0+Ivj+3Tdvj5EBUzy
         7rv3KkLeoW8Wk8EjZrA8Yi4pNnneGO1zUxUfzKLTtcwPK76Jr2LS2yaGK+mPhbTbmL9W
         zZxlro27O8ObjH+YTW23xaBLybJyvib7p5fMuDj9i/RFJvecgKcq0D6fztDH45X5/N5P
         fsYw==
X-Gm-Message-State: AOAM533Q/wN1P8XCDb5kxWqfYQvkvGMX/khZB8qKTG4wpcBtzVUdgVgo
        Uzn9Ouw+KDX13u0D7dgI41LQ1Y4pWjvduEUV7hk9CA==
X-Google-Smtp-Source: ABdhPJyQbG+9/VI5LhOU/2D3mNx0S3Lh07wfACLKHor+iEK/YT/NP7MKSU5n4XUeiNfMOFR0CuIyDJMyrqXI2XZUX0k=
X-Received: by 2002:a25:db91:: with SMTP id g139mr23977947ybf.391.1633479715227;
 Tue, 05 Oct 2021 17:21:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210927204830.4018624-1-dmitry.baryshkov@linaro.org>
 <CAGETcx-3Y3rOSoXu3SbDa6BP_jcT8uSQA+MV55QCY4b0Oe7L-A@mail.gmail.com>
 <11fe1793-1455-ae44-b213-9afe47dfa370@linaro.org> <CAGETcx_HRmvDKuXQEJkMk7zBpedLGkQmvJ24tAWpCHFf4DPX_w@mail.gmail.com>
 <61ce03c1-1b31-bb56-8951-7b71ecdd66a9@linaro.org>
In-Reply-To: <61ce03c1-1b31-bb56-8951-7b71ecdd66a9@linaro.org>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 5 Oct 2021 17:21:19 -0700
Message-ID: <CAGETcx-vG1wnRoSppWC7Z6JN6NdEih9OMEYCb1OUvLgH99wNHA@mail.gmail.com>
Subject: Re: [PATCH] Revert "of: property: fw_devlink: Add support for remote-endpoint"
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 1, 2021 at 6:04 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 28/09/2021 04:13, Saravana Kannan wrote:
> > On Mon, Sep 27, 2021 at 5:56 PM Dmitry Baryshkov

<snip>

> >> After doing the analysis, I can confirm that I was too quick regarding
> >> the mdss links preventing it from being probed. Sorry about that.
> >>
> >> It all went up to the DP phy having a link with usb-c-connector. I was
> >> running the kernel 5.15-rc1, so your tcpm fix is already present.
> >> However my colleague has disabled the tcpm device (which I did not
> >> notice). So the driver did not call fw_devlink_purge_absent_suppliers().
> >> The devlink still exists:
> >
> > Let me take a closer look at this before the end of this week. Can you
> > point me to the exact DT changes that were made that's causing this
> > issue? It should help me debug the issue. I have a guess on what the
> > issue might be.
>
> Here is the kernel source:
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/log/?h=5.15-rc1-camss-v2
>
> The change that causes PHY driver to silently stop probing, causing an
> avalanche of devices not being probed:
>
> https://git.linaro.org/people/bryan.odonoghue/kernel.git/commit/?h=5.15-rc1-camss-v2&id=d0bf3fc47c132968c302965154eeb5c88007fa73

Sorry, I haven't had a chance to look into this yet, but I still have
a strong hunch that this is related to how of_device_is_available()
doesn't recurse up till the root to check if a node is disabled (if a
parent is disabled, the child should also be considered disabled). And
I think patch series should help your case due to a side effect (it
wasn't meant as a fix for your issue). Can you give it a shot?

https://lore.kernel.org/lkml/20210929000735.585237-1-saravanak@google.com/

-Saravana
