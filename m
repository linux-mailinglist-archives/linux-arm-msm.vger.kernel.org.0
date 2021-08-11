Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 634273E8931
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Aug 2021 06:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbhHKEWz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Aug 2021 00:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhHKEWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Aug 2021 00:22:54 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F46C0613D5
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 21:22:31 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id c23-20020a0568301af7b029050cd611fb72so1895211otd.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Aug 2021 21:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=M+Fy0eR1+iop2G2YtVgpRm77F8HTctO7zKKFznc4zBo=;
        b=Fo9g5LijgBrQLPT6MYDEQNxX6viodg54hr7z4FkxTTA21xFg3ZrnNnIuV5eOFU6HpM
         HeXLgv/LwnWd2M9n9fm3NUb6HDbfUx4E4CtwuAH2Q51QtqvgmaESGr+NmF0AXxHRXs5n
         ewFZnhcT5+bJ+kMcpEX9LWMIvBWWSLrSYEXws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=M+Fy0eR1+iop2G2YtVgpRm77F8HTctO7zKKFznc4zBo=;
        b=qOtDplTWFm7f+ekBJX7pF6u14ZkuH+/Fgt73NnyXZhkdPyAeM1gPbiVsrYTxXgJ7mr
         Z59SHLf9nR06UjYXR7gRvX5yvaggOxDjvgL6NrkHpKReHW7LUU9oTbd/9LZ1J5uMK7pY
         jSzdWb6WgTJheAGdqbw/Ksb+kD3OACJC5Sq/S27UDQlKd3SvtetxLp5rH4Pr8RLxx2ge
         DuD3Cm5y4J2MFziDs7zBsW8pF8PB+Oglc7uvztPOO2wQDrCNJjnvKDjgpM9V3op4dMYl
         SqvnJWDjTPQME45gxGTN24Y6pdENTk3lW4OVxXpxkZAFlMN79Q7AD3/Koc1p0LjKP4pE
         8XZQ==
X-Gm-Message-State: AOAM532Jk35MyMMSKBJ5RhM+rMBuvMwxgJuyziTd1BHj9G5yP90uBDaI
        uDlsBHkrJr/pXq4/Yub94wFNriPIxVb7WQm6ynENQA==
X-Google-Smtp-Source: ABdhPJwFN1LHRL2LcpvpMcDdnpPoGURPoblDU8DwG8F5DDcdYAcQghp0zgONfhmA3uMvE4qsiAJCUK817GUSoi+F0hI=
X-Received: by 2002:a05:6830:44a7:: with SMTP id r39mr23466057otv.25.1628655750208;
 Tue, 10 Aug 2021 21:22:30 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Aug 2021 21:22:29 -0700
MIME-Version: 1.0
In-Reply-To: <YRMXOlA5a98BwT3i@builder.lan>
References: <20210721175432.2119-1-mdtipton@codeaurora.org>
 <20210721175432.2119-5-mdtipton@codeaurora.org> <CAE-0n52iVgX0JjjnYi=NDg49xP961p=+W5R2bmO+2xwRceFhfA@mail.gmail.com>
 <YRMXOlA5a98BwT3i@builder.lan>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Tue, 10 Aug 2021 21:22:29 -0700
Message-ID: <CAE-0n53L_muNfpcunPmAWh-dG1h_y8xVqUG-es2CY8jdbnM8mg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] interconnect: qcom: icc-rpmh: Add BCMs to commit
 list in pre_aggregate
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mike Tipton <mdtipton@codeaurora.org>, djakov@kernel.org,
        agross@kernel.org, saravanak@google.com, okukatla@codeaurora.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Alex Elder <elder@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-08-10 17:18:02)
> On Tue 10 Aug 18:31 CDT 2021, Stephen Boyd wrote:
>
> > Quoting Mike Tipton (2021-07-21 10:54:32)
> > > We're only adding BCMs to the commit list in aggregate(), but there are
> > > cases where pre_aggregate() is called without subsequently calling
> > > aggregate(). In particular, in icc_sync_state() when a node with initial
> > > BW has zero requests. Since BCMs aren't added to the commit list in
> > > these cases, we don't actually send the zero BW request to HW. So the
> > > resources remain on unnecessarily.
> > >
> > > Add BCMs to the commit list in pre_aggregate() instead, which is always
> > > called even when there are no requests.
> > >
> > > Fixes: 976daac4a1c5 ("interconnect: qcom: Consolidate interconnect RPMh support")
> > > Signed-off-by: Mike Tipton <mdtipton@codeaurora.org>
> > > ---
> >
> > This patch breaks reboot for me on sc7180 Lazor
> >
>
> FWIW, it prevents at least SM8150 from booting (need to check my other
> boards as well), because its no longer okay to have the interconnect
> providers defined without having all client paths specified.

So maybe the best course of action is to revert this patch from Linus'
tree? It's not a super huge deal as "can't boot", but certainly makes
reboot annoying on sc7180.
