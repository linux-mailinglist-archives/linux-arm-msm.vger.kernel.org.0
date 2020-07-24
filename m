Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6282022CF6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 22:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgGXUbx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 16:31:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbgGXUbx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 16:31:53 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E55C0619E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:31:53 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id p25so5581835vsg.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bUE6iV1Nh/oJYrMV+RYxiuJMvZ3y8L6jKlZzmL+Z6UQ=;
        b=SHfnBisNh4+tugXYFj/mO4bsA5w3zj3n5+t/rJu6EjcqV7y6b12B5zmhYf5j3CL8/4
         YF0Yp7PtLzxF8IfKlWr+mdsQRWmjWzAqB0KXKvzJlTG/VhRp8exmCqXexUdykoJLaIeQ
         10SECNLVO19a/L+yaJ7meQTr+WGDBKH+6OID8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bUE6iV1Nh/oJYrMV+RYxiuJMvZ3y8L6jKlZzmL+Z6UQ=;
        b=huJNcJ/072Jm+ytJ+Nl9sQCRve1aFBUbrurDQZHehXzFh2UTkXAkgu0Bm30FjCn+8g
         XD382kati9Wq/gD3VyGkjzF6V3Mdib/qWGBK9CkNON/k5e4EM3KSuFfym+Y/WzbNsWzT
         g9cSasmmVj/m0mxAtAb5SV9+S4JtTawqIX3LcnvQUnVKrREWNG1mLazoDcRKL0QJUrBn
         PwBU3ycbXnf3wVcPPvdN26Bf9DvRiZg/8vDFM64HrX+3+KWw/c3l374HSLveaTUuGw0j
         XEy3k833N9vhIiBlW4QTfDeetFMT4wP+yVQ+YMYHw+es9Wbyr4HHTeLkgftt14qkahwT
         TUzg==
X-Gm-Message-State: AOAM53335S/BPbLI81sR2VBcJU1RsQtE10I3F1hmlnVRTgPRcfsQCuVN
        DCC63PMkSl2/9FB0wZ+4fuPyw+1I1iQ=
X-Google-Smtp-Source: ABdhPJysMzRgvwHt7N1ciE7FaL4ZotPtI8MTciZ/b6OUkb77WBhMpHuC9lVT1fzuWsfoJ2K/ZDqbmA==
X-Received: by 2002:a05:6102:21a4:: with SMTP id i4mr9254432vsb.24.1595622712407;
        Fri, 24 Jul 2020 13:31:52 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id c8sm1163uac.2.2020.07.24.13.31.51
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2020 13:31:51 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id n4so3357313uae.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 13:31:51 -0700 (PDT)
X-Received: by 2002:a9f:3dc6:: with SMTP id e6mr9953284uaj.104.1595622711118;
 Fri, 24 Jul 2020 13:31:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200723010137.3127584-1-swboyd@chromium.org> <CAD=FV=WtjyYY+bmocc17S9NbRs6inkAWjj7=c9qBsVf3LtG99Q@mail.gmail.com>
 <159561988523.3847286.14763422711224252201@swboyd.mtv.corp.google.com>
 <CAD=FV=WH1vKKe=MPVdtBJZWnSzxNLO0uyM02GFG6oCJfSEwehQ@mail.gmail.com>
 <159562087212.3847286.9484527206999948907@swboyd.mtv.corp.google.com>
 <CAD=FV=VUSwsP_xrHsufLjZqbWdn5V8rybtv2DWad2nBfU+VJ9w@mail.gmail.com> <159562244072.3847286.7905035931282026601@swboyd.mtv.corp.google.com>
In-Reply-To: <159562244072.3847286.7905035931282026601@swboyd.mtv.corp.google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jul 2020 13:31:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V2NduvgdrSNOs7Ufm+=Tk3+rtkSoJg8BH7cYtOdCHXcA@mail.gmail.com>
Message-ID: <CAD=FV=V2NduvgdrSNOs7Ufm+=Tk3+rtkSoJg8BH7cYtOdCHXcA@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: rpmh-rsc: Sleep waiting for tcs slots to be free
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 24, 2020 at 1:27 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2020-07-24 13:11:59)
> >
> > I wasn't suggesting adding a timeout.  I was just saying that if
> > claim_tcs_for_req() were to ever return an error code other than
> > -EBUSY that we'd need a check for it because otherwise we'd interpret
> > the result as a tcs_id.
> >
>
> Ok that sounds like you don't want a check for -EBUSY so I'll leave this
> as >= 0.

To clarify, I'd be OK with either of these (slight preference towards
#2, but not a strong one):

1. Your current code and a REALLY OBVIOUS comment in
claim_tcs_for_req() saying that we'd better not return any error codes
other than -EBUSY (because we'll just blindly retry on all of them).

- or -

2. Handling error codes other than -EBUSY, like this:

wait_event_lock_irq(drv->tcs_wait,
                    (tcs_id = claim_tcs_for_req(drv, tcs, msg)) != -EBUSY,
                    drv->lock);
if (tcs_id < 0)
  goto unlock;

-Doug
