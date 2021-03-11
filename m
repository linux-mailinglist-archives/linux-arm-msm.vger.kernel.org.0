Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610393375E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 15:41:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhCKOlD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 09:41:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233684AbhCKOkf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 09:40:35 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A6EC061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 06:40:34 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id 184so2443356ljf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 06:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QUcPBtm4+ilX7IBeJadFRWzG939sRFv09Bop/EMXhUY=;
        b=yzKXuQ3/J/SngJyDaDCqNeri/gXS4XJWy9PGK29BknE5n8hlBYKVG2AP0tFbpzzRvh
         qRzIHKSH0+lp8gvcvpnZbSA2GOt/c9NTPj2P/cbQ2AGEePywpgOI/bMoqn103jP8nbcn
         tiNNT5LvfVqIyeSXi9XzYPQxqxdYx+XPsSHvtZyqjQuPQiEOnhSLJipei/VMmNbf+oea
         hj1BdmBVbF4aznJ3tcjLNy14oPzYudLFWS9UTWLdGRoGWJtzt1J+XZhdbKWIQBqpR1cu
         W8O2Iw5DyMb/Auca+F7iDUxVKfSrNoKa9GcjIHW0/fFf0WqjfbkVxSDytu+k1hErvF1r
         90zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QUcPBtm4+ilX7IBeJadFRWzG939sRFv09Bop/EMXhUY=;
        b=AYsNl/vql/zGtcdBT+iaIoDbTDZ8c1phSQH0tY/EB9buEfA7yaCXJ+baYNiDOgM1BH
         4qvUNTEn3+XwcYqcCwCD7rZDmT6g2FHylkVTcU4a0KDQzmrpRV9fNtRDiDAFxVUYYu5b
         kgtDGys995zb/Lz6L7fdT+QfhHgvMfGgewSwVszIWgbj9jsB2eK3Equ3gFKb0URIkU4d
         6ShXgzOrfV+JtGWBkzClPn5fkofy/axF0UQgL/IhYNrAMWjCNvSpIKvFaewLlIAjcxwE
         NwGhDHeYexcVl/xudIB0bHpasgZqYSXKlyLjK6L57W6t4hyfOroD4gN3MPlp7rwBf2oH
         8lhw==
X-Gm-Message-State: AOAM532Zp8WOIKOSd4zw6SOEZ3xeBuFxqH1UYFNOrrqZYyFWpcKJtjPU
        K6HeIC4E9UfaUUs1K1Hcaaqj03wATQibSnj2nJGIUg==
X-Google-Smtp-Source: ABdhPJz7z1I5EjMIdfchrJWVpNJGEAzcCu9hBl7SZv7vwujVov2KiUn6Gr/KhKzHePJwvP9MU8jwUqNOOVTmdmBQUeM=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr4833356ljj.467.1615473633384;
 Thu, 11 Mar 2021 06:40:33 -0800 (PST)
MIME-Version: 1.0
References: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org> <CAHp75VfJqXQM+L4NnoN8p_iLpdc1SWFkBwFZAq5sHengPKnwJw@mail.gmail.com>
In-Reply-To: <CAHp75VfJqXQM+L4NnoN8p_iLpdc1SWFkBwFZAq5sHengPKnwJw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 15:40:22 +0100
Message-ID: <CACRpkdYUvxQ+SoVKPCCiQk0aa4kYeRktw9vA3yt=rnJOCYZ0iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7280: Fix SDC_QDSD_PINGROUP and
 UFS_RESET offsets
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 11, 2021 at 11:41 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Mar 2, 2021 at 9:32 PM Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >
> > The offsets for SDC_QDSD_PINGROUP and UFS_RESET were off by 0x100000
> > due to an issue in the scripts generating the data.
>
> > Fixes: ecb454594c43: ("pinctrl: qcom: Add sc7280 pinctrl driver")
> >
> > Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> > Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>
> Should be no blank lines in the tag block.

Yeah I fixed it up when applying.

Just one of these maintainer perks I offer free of charge ;)

Yours,
Linus Walleij
