Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB2D13BBD2C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 14:56:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbhGEM6o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jul 2021 08:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhGEM6o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jul 2021 08:58:44 -0400
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A18BC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jul 2021 05:56:07 -0700 (PDT)
Received: by mail-vk1-xa2a.google.com with SMTP id x20so2435438vkd.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jul 2021 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3Xao4IS6fmEIHar7eI8fRL7ZOP15I141AqimBPWe3Ks=;
        b=gL1uVragn99mMDi9QgwGEeSrfqzjqpdaGniriAUkqkaD4103qt1L96XugndqD+k49M
         qA3fnZWV+O61M5Ctfr8zyiUMOXPUc65+NI3iZTKE9Y+YXEo40zz5aIzHl2EZdfrnmsWU
         PrIev/XVIQ74w79Vz+HrqBNbOoB7RohmrWypAEAmJxJNSgXH/KYjDH0AtccaQYD/4cT3
         OtP6J2Lf/weOi/jyA4fRH2ouBQlgotKLGLzFBogub+/UgJp1gQruc6drjiZaig9fec2u
         uHWhITL0NDMZ5t8FErZUNH947PqX6bgy6avZBsiF28fiqMpcGr6UWPuL2rvVKCPxH43u
         83ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3Xao4IS6fmEIHar7eI8fRL7ZOP15I141AqimBPWe3Ks=;
        b=tlqagsdKqsYmHe86nE7jL04RG+qCJirlwa5gsUrl4sWvVJ5fm22dw+ds2g9AVVGLVV
         JaFFUnOgepIy1qMxFqjfd8DvOR5+o7bKgOMrMiTTT+XyyoPMM5KG2sdCDMiy3FUVmjVd
         90ucfTfMUmBleG4TyyyHtbYqalPQqwV6XoocMnQ/VvDcJd1KiKdzeQDKQd6z93Faj+xY
         zopVdCEdD2B9WxI3cE9DMQwT77H7c4u4i7ecNMukebWxJ4D9jDac5mnSlFPD2XxnLzlP
         oxwlHYrEYNYl3aTUQAvn3GpYQsO74dnD89KzoKX0TPa3rHF6aFz44Xq036yfrGY2g/5j
         ASjw==
X-Gm-Message-State: AOAM532oGPEd69aIsSmVGNj4/JJQvKJ4NUlNAWKlX5BlMGBzCmm5z+W+
        01CKGNWIGuxCSJ0i9czn6pV8oXpcRMNQ+l/IxSv6Jg==
X-Google-Smtp-Source: ABdhPJzRJt3wZmO5Rt140bjaSkbkB7L1nM34Eg6gaQmk1uNGaIlJMS0y8RiiGfdFZ3xf0CJCikYyAB6BI558vSbSkKY=
X-Received: by 2002:a1f:1d94:: with SMTP id d142mr8388714vkd.6.1625489766413;
 Mon, 05 Jul 2021 05:56:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210703005416.2668319-1-bjorn.andersson@linaro.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 5 Jul 2021 14:55:30 +0200
Message-ID: <CAPDyKFosGskXHv8P9WSEpWTBzMD8confq07nWs5fPyNVzUJ7jw@mail.gmail.com>
Subject: Re: [PATCH 0/2] soc: qcom: rpmhpd: Improve rpmhpd enable handling
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 3 Jul 2021 at 02:55, Bjorn Andersson <bjorn.andersson@linaro.org> wrote:
>
> During the discussion and investigation of [1] it became apparent that
> enabling a rpmhpd, without requesting a performance state is a nop. This
> results in a situation where drivers that normally would just describe
> their dependency on the power-domain and have the core implicitly enable
> that power domain also needs to make an explicit vote for a performance
> state - e.g. by a lone required-opp.
>
> [1] https://lore.kernel.org/linux-arm-msm/20210630133149.3204290-4-dmitry.baryshkov@linaro.org/
>
> Bjorn Andersson (2):
>   soc: qcom: rpmhpd: Use corner in power_off
>   soc: qcom: rpmhpd: Make power_on actually enable the domain
>
>  drivers/soc/qcom/rpmhpd.c | 19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
>

FWIW:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
