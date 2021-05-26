Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B481D3922C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 00:33:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234494AbhEZWfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 18:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234492AbhEZWfA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 18:35:00 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1013C06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 15:33:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x38so2910811lfa.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 15:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+q6KaFxTPrGNNLwCmGAKEAgGlUkRO/QzSCDrfx0DrSg=;
        b=wIL4RkZTimsFgGynXx75Vevi3OQSEWAGaZI61p/Zf5rRDcq0EC/ANeaHxDeVlYuon9
         SArWJYsVvQwA93vz0r5icREmsbQFG/9BvKQpw/7clyuRu8kNEA8ZbcKW+6vhEnRpXHR2
         4sNaTWjPv8oBoT3Gg6XtHnKGGZY5ALNo5n33JZIsLFqWT6XBg17FZrfnU/dYX2pNpRS2
         SKhM/BArPmQFvHRNHZ2kBmijBMGAL1Pf7hTeV+AT779ThunhLrPEEQL/TeXOGg507TtV
         h7Pk020KNFLt7jpA6agibScFz6G0tuR6BeONO4nBnqDV0qzvCfLy0qeO9LKRgUIG+Mw3
         FiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+q6KaFxTPrGNNLwCmGAKEAgGlUkRO/QzSCDrfx0DrSg=;
        b=h2oSW8LrVtPWmt9jrPPDp7AHfyOP41uTvsLOMwNMxZb2r1gw0+Z9CSvHuT1RV9IGFv
         rUNoEHPPsxmHP/Qm3cJsRbMvuIBpSQk20ClsMcHSFRGDw+KUw0ggfp+rIlIJ22gQEU3C
         coWzBFcjlCzZ/5uYiDGxrOonFVODX55QXc5KVpHPL60e45sQsFN4fiCHLLPZJxunDlbf
         LwLX/MRg6SExYq2et67TCHkaP1Pf+lopzGOJ/8rdbVUx+VCI8nt3dfu50si1MwzxRb8J
         lxVUtILgJFXoFYJGzLTDFQFnYJeOfkEVwP8bD6JZ7MxwAVxofCr76Ni6+NhIZuQvtX8b
         5HDA==
X-Gm-Message-State: AOAM5312w2ZR7xJroHXkxjY90Vw+61NpMkvB7bHLCliPnx+n8nzL0oiu
        KtChL4xjggiy5BL8jGHlLlTWtIc8DvRupJxbPo8wjA==
X-Google-Smtp-Source: ABdhPJwknJu0coBSwEXImOs1iWFs12E7H1AAxxtj3DzRAXFPL4IC5NQtTaeeFX3l9ZoJK3fa7b5MydykV+kcHntTlJA=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr212533lfn.465.1622068406233;
 Wed, 26 May 2021 15:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210526081038.544942-1-lee.jones@linaro.org> <20210526081038.544942-8-lee.jones@linaro.org>
In-Reply-To: <20210526081038.544942-8-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 27 May 2021 00:33:15 +0200
Message-ID: <CACRpkdYjx3DyKoKpcQetXyB5uU8dqNb-qjzUbzNOj9Zqy=CmsQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] bus: qcom-ebi2: Fix incorrect documentation for '{slow,fast}_cfg'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, May 26, 2021 at 10:10 AM Lee Jones <lee.jones@linaro.org> wrote:

> Fixes the following W=1 kernel build warning(s):
>
>  drivers/bus/qcom-ebi2.c:112: warning: Function parameter or member 'slow_cfg' not described in 'cs_data'
>  drivers/bus/qcom-ebi2.c:112: warning: Function parameter or member 'fast_cfg' not described in 'cs_data'
>
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org

Thanks Lee!

Yours,
Linus Walleij
