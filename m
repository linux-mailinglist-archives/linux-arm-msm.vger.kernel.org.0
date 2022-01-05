Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07445485C0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245280AbiAEXGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245276AbiAEXGq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:06:46 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C941C061201
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:06:46 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id w80so1183116oie.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=lU9azqMMeh6DbnZbcl2lSC5dKYwkqe50hupc+vf9d2A=;
        b=Z9FbV6j7G6xEZbBAvkwVyHKg5BQt5GXvM0+SeRVFiYv6O2H9oIk4aB0sqpDVrsPbiH
         ypCSlfEsuA1No8hWDK464tQClc9ZqdceuvmvlX6LwjBNeSHUhvWTknpTJyCoO1TTvOtN
         gAnMT1s1Pwz7ZjXMu+PARjQiTN0MHm17V1YjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=lU9azqMMeh6DbnZbcl2lSC5dKYwkqe50hupc+vf9d2A=;
        b=eezruFoeFBd971qXch8RZ6EFb0lslP1M5uizIAhwuYRVqqetCvRuKlDCWsh/UdSfGU
         3DOV73ILzmq9a5LmUqZ96xqPBhQFpB1f+R8veWPRyQGdIAeRMLRV0O0ujp8z01kLPirT
         zjsHmasL/g9qqeA7pYf1QdfUdAfjUKM6GGhQt+gytrWOu8uutlx7ihZzUCagyyRM9g+B
         AGTNct0Vdfe6PlOZQLUoxSIHG1eFb18/dxTNqrdtwjmuSwOl9KRZ9emBE8ICE7ivCeLZ
         77522w7Y9YSFMEvQTwxwf8Njh84GOVGLW6XD4CNWUiHGPtqFvedvIGYfvTmx6pNaDZvo
         hnjw==
X-Gm-Message-State: AOAM531O0CMe9jrWd1j6UStfgEZrGyuvKHjc8ZogmJZhDoyg2tIvqwPP
        U2EGIcrxEKgbXVo2zaOIHUahiHFn3Trc2uPQ3x+Lww==
X-Google-Smtp-Source: ABdhPJzAcJpvSF5lMXKo34QRJSTgW30u7+pLOgzDBuej/puQhjouq1bVASLz+ltH62MKR1xkor5WM7U9YV0dxZ5iFqU=
X-Received: by 2002:aca:a953:: with SMTP id s80mr4308576oie.164.1641424005319;
 Wed, 05 Jan 2022 15:06:45 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Jan 2022 15:06:44 -0800
MIME-Version: 1.0
In-Reply-To: <dc2d6f535379dd38a5e3f9ba502f1f2b3d1f56b7.1640201523.git.christophe.jaillet@wanadoo.fr>
References: <dc2d6f535379dd38a5e3f9ba502f1f2b3d1f56b7.1640201523.git.christophe.jaillet@wanadoo.fr>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Wed, 5 Jan 2022 15:06:44 -0800
Message-ID: <CAE-0n53Rcs+BGgwFy-yB2zT+s=WoK94cZJ6yHYE_od=6K6zbzg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Simplify dp_debug_init() and dp_debug_get()
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        quic_abhinavk@quicinc.com, robdclark@gmail.com, sean@poorly.run
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Christophe JAILLET (2021-12-22 11:33:47)
> dp_debug_init() always returns 0. So, make it a void function and simplify
> the only caller accordingly.
>
> While at it remove a useless 'rc' initialization in dp_debug_get()
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
