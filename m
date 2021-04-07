Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2839D356779
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 11:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244220AbhDGJAn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 05:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349821AbhDGJAc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 05:00:32 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25018C06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 02:00:23 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id g24so13204016qts.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ku8OglXxTNGGbHHWxcDhFtMWBJ7gtdpe5IAmLvPb6lg=;
        b=kkQOW1FEjeAuK4pSRWDAdhG6BTn98oaYU5CXLmk5LoQRxwLgIFMtcfz+yNOUKcVezU
         wp5fJQIdGN4hXvwFGYOhgvrc5dNVPvNvgN1fNEnOZoQZwLIqWZ5UOfnnOHYkUeWkej++
         h+HuMRIFphgMWtV6QRs0aBrXTKqZCAPcEBXdxYmjPMruEDSC3P0K6D0eGjsHHmSmW5iT
         3eB0xKzkF0Iu7CWkfeuSj6Imeg9AdH5nW1g/6/voQLnt/FSWuit973ZZw9Q6Q9h9Uvg+
         pmiOFE5J6hAzTc2AguIoltt9XtP/o/ScTdlw9kCgacNjhDWxFf9gQVVgWLqTSPsa4Shb
         x5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ku8OglXxTNGGbHHWxcDhFtMWBJ7gtdpe5IAmLvPb6lg=;
        b=uio9sH2BvC+AhWg1d0m0+0VNcOD4lDi2832HH5wiEb9Ceop/UBI1Ut8rQ4yfMDcAzA
         ELSYTxRurk1Y28u6hPFmUQSuZrrjpnNnAeu7gSEyoMOWZ0l4BnsT8dfbM5Ukcsi46HEr
         +39Jtsj8LaW5eQ28Nv3hRyfsjMu8hiFyNWBNrdQXphCi6+7f6D4XNL3mpumjNkmKvwf3
         wuOjWd9LQAsWqJQqaeBeN2bzAKomOCczQ29Zft4Fg8s5DthSkGlWhOqeEZ5l8XV8it02
         E//8boJlDfSGBEnpirHPehizDq/PvABWvIF8aih9jhjshknR6wyjdpIxbLjT8k6oVvHh
         eHkw==
X-Gm-Message-State: AOAM532kEIF9YMiA883AnS9Y3OEn+HG0mVY32+/N59YFm44YPap32iTu
        4CL6VhxJxHcd0rxaQcN5VQ7XxXHM8zB8Y9MzVMn/t2Y92ntE8w==
X-Google-Smtp-Source: ABdhPJwpVpHl5AgfUWWZ7rFE+fTLLWSBLG47+bo0fY9bos4oOj4bPlOhokymeav3cksyRptLE/cPLlYDQRqm8B0+fp8=
X-Received: by 2002:a05:622a:1716:: with SMTP id h22mr1818569qtk.273.1617786022398;
 Wed, 07 Apr 2021 02:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 7 Apr 2021 12:00:11 +0300
Message-ID: <CAA8EJpr7MazgHfL0qQiqfXvRn8T+ExnGhn-QFa1Np-fBhXn53w@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Daniel Palmer <daniel@0x0f.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 7 Apr 2021 at 02:06, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.
>
> Reported-by: Rob Clark <robdclark@chromium.org>
> Cc: Daniel Palmer <daniel@0x0f.com>

Forgot:

Fixes: 0b9266d295ce ("clk: fixed: add devm helper for
clk_hw_register_fixed_factor()")


> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Stephen, this fix affects the DSI PHY rework. Do we have a chance of
> getting it into 5.12, otherwise there will be a cross-dependency between
> msm-next and clk-next.
>
> ---
>  drivers/clk/clk-fixed-factor.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>


-- 
With best wishes
Dmitry
