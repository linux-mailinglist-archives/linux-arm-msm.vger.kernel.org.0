Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 157022CF910
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Dec 2020 03:45:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgLECpG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Dec 2020 21:45:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgLECpF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Dec 2020 21:45:05 -0500
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FC8C061A4F
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Dec 2020 18:44:25 -0800 (PST)
Received: by mail-ej1-x641.google.com with SMTP id d17so11459698ejy.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 18:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IUPu2DUBMRAu12DXRp3pTRDt+ZwJx6w5SlC/8VGie84=;
        b=X+/2zN4Bmhn0nBYGcOfIC1rXbVGY00KmZn0QEb9HMuQX8po0pu/eEMHACi+xSLRuqo
         ZOsLL2CFmQlq41ARU5CRPgrW4QGNlnOHjnOqaKqVHKw5Qad+wFsDkQOHVsXNY3sdWl+U
         qX07t+jEzroLTKWy2AtVuycW561wYPO9dugHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IUPu2DUBMRAu12DXRp3pTRDt+ZwJx6w5SlC/8VGie84=;
        b=BFkjdQ/NxQ7Ol6xJAsGMvmn/TWW/YgHhpZ8nUrg8WG9n2lK4clIzA+KO336reOTy8c
         WlldXKznrwLQIrB8vgkL3UrHEqBpjQJs0TPVR05e2ZBaVOAQk29gYRLUiGyZf+uqn077
         1vEOMxRqfpNgj8VbidhXpA1f6r5q0/kdIJfRhv6nQ4xk9FbSHAR0qfqSR6iOaj7Vjms5
         CsWxzBckA0GJ+Z94K2sRcIuIDEC0XQyXAl27ayUqzfutR+AZLQCoCLGJtEwRb9T/6oTB
         3bZgGWpKM6cn9OxdvNXuWTgvjQFQbTCiVDIIAyUxAHDpOT/OJlxnOFO5ycYOPZ4Og/7a
         AKgg==
X-Gm-Message-State: AOAM532rbm4wGvp4M0FWSEipA84g2hmR+jLhgu0U6MEn72pPG+8ss6pr
        DzTMebApw+cFXn7hPUQ3GpEalFa59xrlmw==
X-Google-Smtp-Source: ABdhPJxluXavbnE33kqFVROeX6Tgzea/up29q9beS19TClXjFaWq79rRIK43kiii5KRG2d/xKvPviA==
X-Received: by 2002:a17:906:604e:: with SMTP id p14mr9914224ejj.543.1607136263783;
        Fri, 04 Dec 2020 18:44:23 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id b15sm4798497edv.85.2020.12.04.18.44.22
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Dec 2020 18:44:23 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id a12so298918wrv.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Dec 2020 18:44:22 -0800 (PST)
X-Received: by 2002:a5d:4388:: with SMTP id i8mr8217348wrq.262.1607136262520;
 Fri, 04 Dec 2020 18:44:22 -0800 (PST)
MIME-Version: 1.0
References: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201204100139.6216-1-stanimir.varbanov@linaro.org>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Fri, 4 Dec 2020 18:44:09 -0800
X-Gmail-Original-Message-ID: <CAMfZQbw1GjxHbCfY2XCCw=o410ziBZndCQizh6fX7LTkhOq-nw@mail.gmail.com>
Message-ID: <CAMfZQbw1GjxHbCfY2XCCw=o410ziBZndCQizh6fX7LTkhOq-nw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Venus encoder improvements
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Vikash Garodia <vgarodia@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 4, 2020 at 2:03 AM Stanimir Varbanov
<stanimir.varbanov@linaro.org> wrote:
>
> Hello,
>
> Changes since v1:
>   * 1/4 - fixed error handling in hfi_session_deinit (Alex)
>         - keep venc_set_properties invocation from start_streaming (Dikshita)
>   * 2/4 - keep original mutex_lock (Alex)
>   * 3/4 - move msg queue inside if statement (Fritz)
>         - move rx_req setting before triggering soft interrupt (Alex)
>   * Add one more patch 4/4 to address comments for hfi_session_init
>     EINVAL return error code (Alex)
>
> The v1 can be found at [1].
>
> regards,
> Stan
>
> [1] https://www.spinics.net/lists/linux-media/msg181634.html
>
> Stanimir Varbanov (3):
>   venus: venc: Init the session only once in queue_setup
>   venus: Limit HFI sessions to the maximum supported
>   venus: hfi: Correct session init return error
>
> Vikash Garodia (1):
>   media: venus: request for interrupt from venus
>
>  drivers/media/platform/qcom/venus/core.h      |  1 +
>  drivers/media/platform/qcom/venus/hfi.c       | 18 +++-
>  .../media/platform/qcom/venus/hfi_parser.c    |  3 +
>  drivers/media/platform/qcom/venus/hfi_venus.c | 77 ++++++++++-------
>  drivers/media/platform/qcom/venus/vdec.c      |  2 +-
>  drivers/media/platform/qcom/venus/venc.c      | 85 ++++++++++++++-----
>  6 files changed, 127 insertions(+), 59 deletions(-)
>
> --
> 2.17.1
>

I haven't had a chance to review the code yet, I'll leave that for
early next week.  In the meantime I have tested the patches and found
them to be working well.

Tested-by: Fritz Koenig <frkoenig@chromium.org>
