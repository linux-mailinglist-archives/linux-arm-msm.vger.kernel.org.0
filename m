Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE002A8BAF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 01:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732778AbgKFAzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 19:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732537AbgKFAzz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 19:55:55 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB86DC0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 16:55:54 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id m16so1843113vsl.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 16:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a+Dl+SEb66SVlQ1JtkmvUP4yTl27EfXWQdp54P0kogM=;
        b=J3BJh/dgNh47nsxmTosptucfY00YGUDD3+B6bCHjo95/J87zkdRZCCyVvgz1vRxUa9
         cD6cM3tV/tDXtuPzxpgQLfc44wHgPH3zfIRld9yxWmSlldoQ03WQXE/w5C+YJ2k+TS6a
         LIGFSlvuOHLkC/dNmWFONidRyvZ1er8U/zSV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a+Dl+SEb66SVlQ1JtkmvUP4yTl27EfXWQdp54P0kogM=;
        b=fO7NqpvIthplkIy4aK7H84tZwR1GLVLCy0olDsPyjr9a5hUBaQ+vjbFETqTZTKtKnm
         pVNvy/TVZpPEB2gMVErePQBg91nXLimnnA8q9HtCDK+qwR+zEeuqxLL9lPqIfv1HHhCl
         dGbmNL7qOSqyfNOqv4hiUlJN5DWFDj1xVkXLeV/W2rv6gDozRvFgqhnfGle7NtM6K36W
         skHq5FYWM6+aszdP3kQEEeAVScpTF/K1XXkQqWm6eA1ttUKoeIAhPP3BLBQ8NMAgeTVf
         L9e0yzF4K/E/ibEpjimNt+5Lh/V1OCISUkpXXgHmOjkrJn11+9d4vRrTlX0eatr3WgYL
         yznQ==
X-Gm-Message-State: AOAM530sEI/49QVVzhn6OuNlGarf3UDK6wVnWJx278kLcogYxn/Zl/BC
        4/1O5HdcqYxq0nGrzvahs5DoKW/F2AAMPA==
X-Google-Smtp-Source: ABdhPJxS5yV4n0rjDf8U4uXQbmi66bTesNymZjhNfzrX6EsuDN/+sQSJFLv9hUAYkftyxg0uKzIePA==
X-Received: by 2002:a67:f643:: with SMTP id u3mr3536620vso.48.1604624153641;
        Thu, 05 Nov 2020 16:55:53 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id m23sm504291vsl.0.2020.11.05.16.55.52
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 16:55:52 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id r14so1828083vsa.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 16:55:52 -0800 (PST)
X-Received: by 2002:a67:f142:: with SMTP id t2mr3332218vsm.34.1604624152298;
 Thu, 05 Nov 2020 16:55:52 -0800 (PST)
MIME-Version: 1.0
References: <20201105163724.v2.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
In-Reply-To: <20201105163724.v2.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 5 Nov 2020 16:55:40 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WVVjj1Su2Ta9wQebDEWXs=9dNs9EO9EvTH=EjT4Fr8jg@mail.gmail.com>
Message-ID: <CAD=FV=WVVjj1Su2Ta9wQebDEWXs=9dNs9EO9EvTH=EjT4Fr8jg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc7180: Add sc7180-lazor-r2
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Nov 5, 2020 at 4:37 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> One important delta with respect to rev1 is a switch of the power
> supply for the onboard USB hub from 'pp3300_l7c' to 'pp3300_a' + a
> load switch. The actual regulator switch is done by the patch 'arm64:
> dts: qcom: sc7180-trogdor: Make pp3300_a the default supply for
> pp3300_hub', since it affects the entire trogdor platform. Here we
> only add the .dts files for lazor rev2 and replace the generic
> compatible entries in the rev1 .dts files.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v2:
> - patch added to the series
>
>  arch/arm64/boot/dts/qcom/Makefile              |  3 +++
>  .../dts/qcom/sc7180-trogdor-lazor-r1-kb.dts    |  4 ++--
>  .../dts/qcom/sc7180-trogdor-lazor-r1-lte.dts   |  4 ++--
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts  |  4 ++--
>  .../dts/qcom/sc7180-trogdor-lazor-r2-kb.dts    | 17 +++++++++++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r2-lte.dts   | 18 ++++++++++++++++++
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r2.dts  | 15 +++++++++++++++
>  7 files changed, 59 insertions(+), 6 deletions(-)

So it's pretty unlikely that this change actually happened in "-rev2".
"-rev2" was a _very_ small batch of boards that I don't think made it
into too many people's hands.  You probably want "-rev3".


> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-kb.dts
> new file mode 100644
> index 000000000000..7c3a702ef209
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-kb.dts
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Lazor board device tree source
> + *
> + * Copyright 2020 Google LLC.
> + */
> +
> +#include "sc7180-trogdor-lazor-r1.dts"

Should have been updated to not point to '-r1', no?

===

If you want to compare, you can also look at my (abandoned) CL:
https://crrev.com/c/2481550

...that forked out a "-rev3" to tag the WiFi slightly differently, but
we ended up abandoning it because we found a better way to handle the
WiFi stuff.

-Doug
