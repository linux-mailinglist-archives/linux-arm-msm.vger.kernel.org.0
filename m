Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4531A8ABB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 21:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504758AbgDNT26 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 15:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504752AbgDNT25 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 15:28:57 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 577C4C061A10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 12:28:57 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id g14so859688otg.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2020 12:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yXl5LngxcEox6tFkMcsHWj7/e31HOzYbZGvPkAeshzo=;
        b=ejCS7DL3ag6duTxMi2Ewpv00tGgVeaaEYl909NqixmQ15Qfq51ylCT9rHeFXSPUOk2
         vtyBZ6NZuEAQdkWQHdUA1JMWEZ5a6JIJb0+mJx2uExrZl2LAL3R0IkdFluJ5FE4QU0H3
         XAZImBwtrpZeU6j+JV+hS3nuxF3J2vNG6uk42/IVOlWQo4YYxfDSRoioISx/gckZPhmt
         CQ2i4dwZhU7B1CYMJik4ck7ILQHs9mpEkR5EF377I+1sComWBiqgdjX+IdeAa6W8E8KK
         a2DSXOfoToBilcypqD49C2OvoP8jMRnBBfFpAJyp0pwsff8FnqzSXoiUU7D68iQ4qpqO
         rdug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yXl5LngxcEox6tFkMcsHWj7/e31HOzYbZGvPkAeshzo=;
        b=HmEKBh+xXtrrov3eoRdkbvPU49NkNDpMe3XcB3hsCO7LySVaMJ/1g100WNpqBa+aQl
         ThtjqGDvzrWuCaYDJAoEYPdQkArZVfzkg+zbGV7ALEwmA+JOhY3Vq4Ol1c26q1gBwKph
         mGgchNp3KZu67zU/Na1zhaCAbeUZdOs5g5q+NHcFVdkVnv445OzXwCh2XUBveTo2vd31
         ImvAvlNIeiSV8YvAohjIsYiTvH5XnThUCRPUJHspw3yyd7WgHw8/dPsExpg0eDs1VK/p
         3f8bffIthi4zqC/2TBr6U+OmN8mAcXSVXjld0ROG/GJWMjlaCM/edkIrCdzCdmalfheV
         4bXg==
X-Gm-Message-State: AGi0PuaxqmYnLFTV5aoP8YSdUuJeofFETwOgfP56N+H4sbQBlCPUSLSx
        NpnUn6QNEbTyATj8WiwpJwkmlA6AgFx9oKvQVOX89w==
X-Google-Smtp-Source: APiQypLNgzWQIOmbMjbOIDPabi7ahVlW8rXca4fleUQzDSYq/+Zo4l7gzAwDGKt/X8yYn92PkHHYUl5oOnJLWGe/36A=
X-Received: by 2002:a4a:3006:: with SMTP id q6mr10846802oof.70.1586892536562;
 Tue, 14 Apr 2020 12:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200414185744.84581-1-john.stultz@linaro.org> <CAD=FV=XT_icz04g4M+iZHZRzjM1jnuHgkPBsaVmzc1wyoUe=7A@mail.gmail.com>
In-Reply-To: <CAD=FV=XT_icz04g4M+iZHZRzjM1jnuHgkPBsaVmzc1wyoUe=7A@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 14 Apr 2020 12:28:45 -0700
Message-ID: <CALAqxLWS7+wqARFVoDStVcf-B77sPc6GaHBKebfMh1gXyUP4HQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH v2] phy: qcom-qusb2: Re add "qcom,sdm845-qusb2-phy"
 compat string
To:     Doug Anderson <dianders@chromium.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 14, 2020 at 12:14 PM Doug Anderson <dianders@chromium.org> wrote:
> On Tue, Apr 14, 2020 at 11:57 AM John Stultz <john.stultz@linaro.org> wrote:
> >
> > This patch fixes a regression in 5.7-rc1.
> >
> > In commit 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2
> > PHY support"), the change was made to add "qcom,qusb2-v2-phy"
> > as a generic compat string. However the change also removed
> > the "qcom,sdm845-qusb2-phy" compat string, which is documented
> > in the binding and already in use.
> >
> > This patch re-adds the "qcom,sdm845-qusb2-phy" compat string
> > which allows the driver to continue to work with existing dts
> > entries such as found on the db845c.
> >
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Doug Anderson <dianders@chromium.org>
> > Cc: Manu Gautam <mgautam@codeaurora.org>
> > Cc: Sandeep Maheswaram <sanm@codeaurora.org>
> > Cc: Matthias Kaehlcke <mka@chromium.org>
> > Cc: Stephen Boyd <swboyd@chromium.org>
> > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Fixes: 8fe75cd4cddf ("phy: qcom-qusb2: Add generic QUSB2 V2 PHY support")
> > Reported-by: YongQin Liu <yongqin.liu@linaro.org>
> > Signed-off-by: John Stultz <john.stultz@linaro.org>
>
> Re-adding reviews from:
> https://lore.kernel.org/r/158631458374.216820.17829557619378130779@swboyd.mtv.corp.google.com
> https://lore.kernel.org/r/CAD=FV=Wh9_4a-cDGPdpMrXUi_HmJvS-a2Ubeyo5WG3sgwVWKKQ@mail.gmail.com
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Ah! Sorry, I thought I had added those to my git commit, but
apparently I didn't!

Many thanks!
-john
