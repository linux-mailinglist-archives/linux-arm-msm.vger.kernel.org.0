Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23FCC1B6C75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2020 06:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgDXEPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Apr 2020 00:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgDXEO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Apr 2020 00:14:59 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9260FC09B045
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 21:14:59 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id z17so10254926oto.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2020 21:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hNeKWP0wVVfHdvI2+GMr4lo7jLpNJp6SXOmf25ATHxg=;
        b=ISQ55rpHtbLZWNBGVYOXEiLHbR5pvj+D+zK8Y3PA2yQf4kJxoU6V2GjCj1e1UqHgIJ
         3962XuymntrbY9qOPUILjH6Dx/DkugOIU5QJNu85Krl0702HsDkr2HSlcIemnmF01jHJ
         WGTrcdZW3AwCbIuoO0eu9W+vrKY3pddkXjIlqN6RzcxDM7NhtFjjg7xgOzQe4aW6Ui9Q
         FRp3mttrtVpagGThU/dfrsG6mstBUrvmaWAM2Q95tgFnchoggwMBIL0DyE7vWkzPItKE
         9CXZF6Qo7jlgzgvMU8I8hRnh76itJeU/QF4mMvWKLWeVpKRqmVKYwVvmfW4k2KEOA8Z4
         g/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hNeKWP0wVVfHdvI2+GMr4lo7jLpNJp6SXOmf25ATHxg=;
        b=tP8Djd9WUO5vjNxYHbugf0z/NPQ/nI4Jig5aTaXVcuaZ5Bug/uKo2ScGHrWSKYDfNg
         1KUa5pMRYVnh5njXZG+ZYnLpna6fiJht+MTpG1gSdyA2wSoEvTIyNb/FbWIsmb3n8J4P
         8ks5Ikew+NctTybtKrHQNguKflEUODTOP53CUzYgj3XcVV3OYK5h8J4eMDldc04WwDeg
         bqgC4zM70GFR29lJza9wQhQIU5WPbW2IPVUJHlbh53YWYpN0Ld74mJ0bAEkV463LGjRB
         jEPuKphZnA0rWnvwpgfCyjnBZQ/DhUcVnayQVXuNDBi5p4tpSWoXGx0Hr0AZ2r0eJh3w
         8UUA==
X-Gm-Message-State: AGi0PuZ2FpEPGSbg119+NvVQrnzgW/GvnQTnZouqy2UntRxz9R6pcuyl
        frx+gbu+tPEdnKRE7QIgyBrTSEXPdPaNQRaUU6/V8Ebu
X-Google-Smtp-Source: APiQypJnPanMwbARQX4Hfircqy0s3DCPTIopnJmsul/liN7lTudNu6VrdEx/D3Q3Iw+xpQYXZpHdyV5PmViGWlGfRw0=
X-Received: by 2002:a54:4f02:: with SMTP id e2mr5867574oiy.10.1587701698779;
 Thu, 23 Apr 2020 21:14:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200421041815.1808-1-john.stultz@linaro.org> <CALAqxLUHLqoYAZRvF1HjHhOJPdztYh9oz=L0kEuYun7y6fBzGA@mail.gmail.com>
 <62be69b1-8349-aa16-b5d6-dcacbc4eb05c@ti.com>
In-Reply-To: <62be69b1-8349-aa16-b5d6-dcacbc4eb05c@ti.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 23 Apr 2020 21:14:48 -0700
Message-ID: <CALAqxLX4_gi6mo_HRhRUQvC0stXf4ya3aa1VOPqDdpV8_37iww@mail.gmail.com>
Subject: Re: [RESEND x2][PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy"
 compat string
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Doug Anderson <dianders@chromium.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 23, 2020 at 9:07 PM Kishon Vijay Abraham I <kishon@ti.com> wrote:
> On 4/24/2020 9:35 AM, John Stultz wrote:
> > On Mon, Apr 20, 2020 at 9:18 PM John Stultz <john.stultz@linaro.org> wrote:
> >>
> >> This patch fixes a regression in 5.7-rc1+
> >>
> >> In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> >> PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> >> as a generic compat string. However the change also removed
> >> the "qcom,sdm845-qusb2-phy" compat string, which is documented
> >> in the binding and already in use.
> >>
> >> This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> >> which allows the driver to continue to work with existing dts
> >> entries such as found on the db845c.
> >
> > I hate to be a bother on this, but I'd really like to see this
> > regression resolved.  This fix missed rc1 and rc2, and it would be a
> > shame to miss rc3 too.
> >
> > Do I have the right folks on the cc for this?
>
> Yes, I'll be merging this. Sorry for the delay.

Thanks so much, sorry to be a nag! I was just worried it was slipping through.

thanks again!
-john
