Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AB6E356B63
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 13:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347001AbhDGLhv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 07:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351859AbhDGLht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 07:37:49 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1825DC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Apr 2021 04:37:39 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id y5so18210441qkl.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Apr 2021 04:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IW3oRRx99M57CpJG31OJ6s9cRTtaL0D26Vt6HdVUzpk=;
        b=oopYu+YQ42DBdZzN3yOYVkLE34+WNijKBfVjcKw6QPwW/mRKOs2n2G4L1YfBrga8cx
         220R9uTBCCRVSD1cy6bDEd7gA1lnF9TD+T4FpdSH5e6pDE7WFLCti3vaDYFyC2SgaM9z
         dzLQKaRLpCgPt311J8OYBUcFJAbeRxPMkE31g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IW3oRRx99M57CpJG31OJ6s9cRTtaL0D26Vt6HdVUzpk=;
        b=SPRH+j9JXTEJDH1QPNVYpJSnBiRhZZNekQ6i5bU01IejZFnxJ2SPZ+x0sXefmLT2Zp
         ZKsU2HBnaTiAR5L3CJ6E+lXqXTR13AGpzd6HdFY3kHxrrdgncCFmMUgHh9YQOAi8oD++
         RSLT/9Xvv5piyqbGo4CsLIYFvjzpoxtEv+OTaJHOxE13c9gC4Y2rT27OuU/38RIPdLYY
         Y/aMy52kMO13jEpBHjcdrgHjwWMF4D0brQZ85ynXurOt0PKQMBYW520P0alvTxl+M54J
         Zpc4M6MptjQ2ps9Dtjz9tGKfSd0hQWhL3NyNVMAdr4S4Qc5injFtAtIZe3nooOPvEuNI
         LezQ==
X-Gm-Message-State: AOAM5301h51GnQ+zDUx1/EQHh+ugSN+4B9nYYuHfE9YrViFdPSsbp4K4
        qL+dWvefI5a6dXfDD/w/fPblGE7A9V2cVrsZn3dOm3qtBsU=
X-Google-Smtp-Source: ABdhPJyA5Hg5hcZK/lrBzsOg/7n5zpjnXNILiWuDcgO2g8kFHFN6fUKV9nWalWac9N9CBudJ/zH0+3dvbyRGFrd6m4Q=
X-Received: by 2002:ae9:f70a:: with SMTP id s10mr2714172qkg.468.1617795457907;
 Wed, 07 Apr 2021 04:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210406230606.3007138-1-dmitry.baryshkov@linaro.org>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Wed, 7 Apr 2021 20:38:56 +0900
Message-ID: <CAFr9PXm9oStJ4oKNaGCGi9sXBTc-6iDZJZTWvumWHiFwwcRPnQ@mail.gmail.com>
Subject: Re: [PATCH] clk: fixed: fix double free in resource managed
 fixed-factor clock
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org,
        linux-clk <linux-clk@vger.kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Wed, 7 Apr 2021 at 08:06, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> devm_clk_hw_register_fixed_factor_release(), the release function for
> the devm_clk_hw_register_fixed_factor(), calls
> clk_hw_unregister_fixed_factor(), which will kfree() the clock. However
> after that the devres functions will also kfree the allocated data,
> resulting in double free/memory corruption. Just call
> clk_hw_unregister() instead, leaving kfree() to devres code.

Doh.
Sorry for not spotting this when I wrote the patch.
Thank you for cleaning up after me.

Cheers,

Daniel
