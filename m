Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33B893B880E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jun 2021 19:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbhF3RyO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Jun 2021 13:54:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232409AbhF3RyN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Jun 2021 13:54:13 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D464C0617AD
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 10:51:44 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id a133so3948378oib.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jun 2021 10:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/TpbbonyK5cx17STCT313YsMTZEN2Fa3252nyd5WAKY=;
        b=jZqjlYVOYTUdCBUwZYbUuN6kEGJHaE+01/l3M/0kh7APq5t1yDwuo+++hYoCABGFz0
         x9g5o3Rjpx8HY7ff7/QyNQLNZHhXOBBrSX0v+/uXUmUrzI4JO046LWlbpgwdq8pEOMqJ
         tHznXazHFvqaC2AaPQr5lZ+yZNbFgB+d5+Gus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/TpbbonyK5cx17STCT313YsMTZEN2Fa3252nyd5WAKY=;
        b=uTJUXeKqftfxM8uoGHCPDXAXmZUTLA8C682zaVB2cGYl3AB8MKoiLi9sVAAK4BaBf4
         OErZs3qNNwNj1cjIRgcsBy2lEqMfJsNDKRcD/K7fPyNRrThwGd/MK1fP68KGAcsRKfZP
         WlU9cKj01lJuldJimdAXvoj7beJ/iXzLnCw7ZfWYgfXN0JZj1sYs7Z42pQ7Yj/phwR3Z
         L/LbvVbGY4Y64YgMhkRHQwu6AMx1hJ3XPQs3+L0b8ghXhn972IqHux3GecRIJoERUsvy
         0Z2yMv6k6GyEOEj6zQEwgiG/5xX9BhD084sJ9ci4CbN+Il/dGd5z+2qZXCGbx/RHTe9O
         Qtbg==
X-Gm-Message-State: AOAM53199ugLKynH3tVclpqdoCVnx+ezvMfmYOfzTGYUpMNdD4VPlJsY
        ZH+0XdmclzI8yZAbzNaYOFkn/ofYii3IKOowpCFt7A==
X-Google-Smtp-Source: ABdhPJyt1BT0yyy26ZENhSRgNlnZIfJxRS8zE0C7/7zupBgcDtyelBnghwpsMShvQXBW5bgL8j5LBbgVPi78511rLKY=
X-Received: by 2002:aca:5390:: with SMTP id h138mr3968714oib.125.1625075503995;
 Wed, 30 Jun 2021 10:51:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Jun 2021 10:51:43 -0700
MIME-Version: 1.0
In-Reply-To: <YNYAuaBrGgdtToph@builder.lan>
References: <1622758940-13485-1-git-send-email-khsieh@codeaurora.org> <YNYAuaBrGgdtToph@builder.lan>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 30 Jun 2021 10:51:43 -0700
Message-ID: <CAE-0n500g=KuOsRgHe2vpL2JOuq+LRFEWEdEovMg8BJF4cKD1A@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7180: Add DisplayPort node
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org,
        agross@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        abhinavk@codeaurora.org, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-06-25 09:13:45)
> On Thu 03 Jun 17:22 CDT 2021, Kuogee Hsieh wrote:
> > +                                             dp_out: endpoint { };
> > +                                     };
> > +                             };
> > +
> > +                             dp_opp_table: dp-opp-table {
>
> I forgot that our discussion about the node name here was on the
> previous revision, _this_ is the patch I will drop the "dp-" from and
> apply.
>
> And as I've looked at this quite a bit now:
>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>

With that node name fixed

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
