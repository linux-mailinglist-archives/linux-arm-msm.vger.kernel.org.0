Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26C942FE05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 00:18:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238945AbhJOWTe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 18:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238926AbhJOWTd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 18:19:33 -0400
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B88C061762
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 15:17:26 -0700 (PDT)
Received: by mail-oo1-xc32.google.com with SMTP id r1-20020a4a9641000000b002b6b55007bfso3454217ooi.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 15:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=AVnP9kT2llz88Wp4v0MXGtk3g84ufRBvjbktN4qlzww=;
        b=BDfkHE65vuq0gO2kkkdX4+YmtrSGfkjC3peQ5lzDm7D2naQ06kVkwxvs0weU58kQxd
         vzV6Cb2p1BpDN9hcFBCazFNkg8ndWOlCdGLyrIzPqe29/3mbH0OUHfI3YXe5GO5JkePh
         +G7vebojCIdqZrX9x4lBMyZ81WrIGVQ4/Y33w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=AVnP9kT2llz88Wp4v0MXGtk3g84ufRBvjbktN4qlzww=;
        b=YZsrE7N+o9B+Ap7emxw8yU9nbLFfgVKuQ9OCa+L6nLd9gIc8/o7+xf5XD1UZSZ+7Uj
         6kN/kO+GOjpk33ekKapxDZK09wTor9L7ri6gTF7bWkyp2Nt2g2KNkcmb6i+wBSOEAgPp
         sOkQstaPwQ7yZtGocXrUkHNfBlBydYSdZGTTXdQLrt/3lyyKtv5KCmE6IGMM8ofzQwlv
         Oh4Ac677cjrqK+1oqJp4bOEwlbLNVsOt3/ma+dWH+IYhBHFu61IA4tvC9V1NjPBB+edy
         jxCni/doz12DcifGXdbLm6xQbLVTB5+4wQKjhgEdC27lQ1Mltvn9dbuk7LtfzTbV2ODa
         l7rQ==
X-Gm-Message-State: AOAM532TDsqVyqUKys28FI5palwf6rrMTt0ng1CoXW3nasoKuFSHtE7k
        5FxdLaN3k2V8tJ+qa4gBjhlatfQnrB9T9BR/qElugOmAIic=
X-Google-Smtp-Source: ABdhPJy13Q6wozbGar0qzjihVe+DqGljwC0YLYE/UrohRr6eMRjLf6Wt9ww3bAH4k9laFeWpErh1bmn4nj4LqLoQYFg=
X-Received: by 2002:a4a:c808:: with SMTP id s8mr2592875ooq.8.1634336246241;
 Fri, 15 Oct 2021 15:17:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 Oct 2021 17:17:25 -0500
MIME-Version: 1.0
In-Reply-To: <20211005033732.2284447-1-bjorn.andersson@linaro.org>
References: <20211005033732.2284447-1-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 15 Oct 2021 17:17:25 -0500
Message-ID: <CAE-0n51x2w-GhUbY_dbH74Eom3orOHHT7dT_CG3j0WR8fpoxsw@mail.gmail.com>
Subject: Re: [PATCH v3] soc: qcom: rpmhpd: Make power_on actually enable the domain
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-10-04 20:37:32)
> The general expectation is that powering on a power-domain should make
> the power domain deliver some power, and if a specific performance state
> is needed further requests has to be made.
>
> But in contrast with other power-domain implementations (e.g. rpmpd) the
> RPMh does not have an interface to enable the power, so the driver has
> to vote for a particular corner (performance level) in rpmh_power_on().
>
> But the corner is never initialized, so a typical request to simply
> enable the power domain would not actually turn on the hardware. Further
> more, when no more clients vote for a performance state (i.e. the
> aggregated vote is 0) the power domain would be turned off.
>
> Fix both of these issues by always voting for a corner with non-zero
> value, when the power domain is enabled.
>
> The tracking of the lowest non-zero corner is performed to handle the
> corner case if there's ever a domain with a non-zero lowest corner, in
> which case both rpmh_power_on() and rpmh_rpmhpd_set_performance_state()
> would be allowed to use this lowest corner.
>
> Fixes: 279b7e8a62cc ("soc: qcom: rpmhpd: Add RPMh power domain driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Looks ok to me.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
