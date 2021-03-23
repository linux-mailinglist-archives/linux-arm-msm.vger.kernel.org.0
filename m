Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E647346806
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Mar 2021 19:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbhCWSqo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Mar 2021 14:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231210AbhCWSqT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Mar 2021 14:46:19 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E0B3C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 11:46:19 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 31-20020a9d00220000b02901b64b9b50b1so20455774ota.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Mar 2021 11:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OkwzRy/s7yrT0we4Q3mwPVr1d0wQaKkj1i7ZWYj/Lq0=;
        b=zewx2vIc1zrcuV1VhEyquVDWr8bixtyLHdMZmDR5fuy7TWNG2BwJOyj4vJx74O7Ehe
         MeDLWcyWYiVXODP5hHsuUzIsA+Onmcd92agvdC2xPFAMYLl7QjeaWZz3Gh8j/+lx093m
         8MAUKWYDjsnnwXpS+f2noxZrdpHhyktUH9jH/rVQeIfqwKSMYKi2C0RTDfP0414Y3EZ5
         OaQDFJgAZIMXq9ms+deNu606Mz/YmKAGsjc7ulI+pOJi2ReRKCxWpqefjnrj0C8iM3m2
         sYeD7ep0bAZmJbSRKZQJG3CpZoMzSzLSjZScG28s6NRVFMGD0+16js/E2A4wxJlrzoo+
         QJsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OkwzRy/s7yrT0we4Q3mwPVr1d0wQaKkj1i7ZWYj/Lq0=;
        b=WvOrHc7U+p8acnkwaDGUbuZ+m7+ab9kB/xu1MW8palWKggcJ72N3hDe3avXN7qFML5
         KnF+PisZWjZL1E3bBE9TGxkMJsqri+hkiFLMf9UwdGR4L7vnG9sllwpXWD7Xk0choHaa
         vc3y6cmSDYIHHkpIzhlGR4l2bAJ2XOmQkGEOHVrqmyw4IhUPujuB9XY69Y8WOu9kFnvs
         qLod1aw4amj6BD56XON6lvyJG/1TsHMRAi1khJoZxtbVoKj7dXY4vgleTYW7LZxzg+fS
         q+QV0f0VaXfwO9J6ndg7oqTRjQqsxfZaJ76g73Q7U7hgqHr2aX3DwBp6sVzw+lZRAmIw
         xrGA==
X-Gm-Message-State: AOAM530zEwtW3rmodoPPy5o3QPZuKdepl0Iw0MeAjnojHeKdjERBCxIH
        +D+GpRyJMr6v/z1XpdaoekNnEw==
X-Google-Smtp-Source: ABdhPJwpa4JIy3UtHCbb3hgmxzTsFXaQbgfa8Zqz7b4OxFCkbd1T2747pmnZHzl5gboxKE/1sYGQyQ==
X-Received: by 2002:a05:6830:802:: with SMTP id r2mr5389337ots.110.1616525178788;
        Tue, 23 Mar 2021 11:46:18 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 24sm3956423oiq.11.2021.03.23.11.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 11:46:18 -0700 (PDT)
Date:   Tue, 23 Mar 2021 13:46:15 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 6/6] firmware: qcom_scm: Only compile legacy calls on ARM
Message-ID: <20210323184615.GI5254@yoga>
References: <20210223214539.1336155-1-swboyd@chromium.org>
 <20210223214539.1336155-7-swboyd@chromium.org>
 <b9174acc-9826-eb82-b399-ed95f7e83085@codeaurora.org>
 <161483844056.1478170.8701629037531614722@swboyd.mtv.corp.google.com>
 <5ac262bf-a70a-4ca3-01a8-d1432732d26f@codeaurora.org>
 <161501150705.1478170.3739297122787060750@swboyd.mtv.corp.google.com>
 <YEUQlY4X1e2PO8tl@builder.lan>
 <161647057967.3012082.16471020030801311825@swboyd.mtv.corp.google.com>
 <c0dbcf6c-9f6f-2103-68bd-3d06420f309a@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0dbcf6c-9f6f-2103-68bd-3d06420f309a@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Mar 13:27 CDT 2021, Elliot Berman wrote:

> On 3/22/2021 8:36 PM, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2021-03-07 09:42:45)
> > > On Sat 06 Mar 00:18 CST 2021, Stephen Boyd wrote:
> > > 
> > > > Quoting Elliot Berman (2021-03-05 10:18:09)
> > > > > On 3/3/2021 10:14 PM, Stephen Boyd wrote:
> > > > > > Quoting Elliot Berman (2021-03-03 19:35:08)
> > > > > 
> > > > >   > +    desc.args[0] = flags;
> > > > >   > +    desc.args[1] = virt_to_phys(entry);
> > > > >   > +
> > > > >   > +    return scm_legacy_call_atomic(NULL, &desc, NULL);
> > > > >   > +}
> > > > >   > +EXPORT_SYMBOL(qcom_scm_set_cold_boot_addr);
> > > > > 
> > > > > This should still be qcom_scm_call.
> > > > 
> > > > You mean s/scm_legacy_call_atomic/qcom_scm_call/ right?
> > > > 
> > > > I don't really want to resend the rest of the patches if this last one
> > > > is the only one that needs an update. This was a semi-RFC anyway so
> > > > maybe it's fine if the first 5 patches get merged and then I can resend
> > > > this one? Otherwise I will resend this again next week or so with less
> > > > diff for this patch.
> > > 
> > > I'm fine with merging the first 5, but was hoping that Elliot could
> > > provide either a "Reviewed-by" or at least an "Acked-by" on these.
> > > 
> > 
> > I'll take the silence as I should resend the whole series?
> > 
> 
> I thought Bjorn was accepting the first 5 already, my apologies.
> 
> Patches 1-5:
> Acked-by: Elliot Berman <eberman@codeaurora.org>

Thanks Elliot. I'll pick up the first 5, so please skip these in your
repost, Stephen.

Regards,
Bjorn
