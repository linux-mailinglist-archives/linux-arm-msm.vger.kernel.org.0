Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D14441A12D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Sep 2021 23:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237112AbhI0VLO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 17:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhI0VLO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 17:11:14 -0400
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com [IPv6:2607:f8b0:4864:20::c36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F3CC061604
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 14:09:36 -0700 (PDT)
Received: by mail-oo1-xc36.google.com with SMTP id p22-20020a4a8156000000b002a8c9ea1858so6441261oog.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Sep 2021 14:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=Dq29TxJ5zpM4XHFteYmjRFf+8vB0LPfL9SydtuPUex4=;
        b=QXoqixS9dSwgotQCR4tPOH2boVVWjkQ9G/7fRvVPwOODbCs72HTY16UDes5QZRApcH
         KpzoIV+7PFON62nO10VhOP3msaqlF2KOpIyzg8TyhBSU5ysGfhzrSAtrTmwwNlYPKVP7
         SXcSfXUWpQz0lHdH1A4JuyE2FlzoL4tlEyHcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=Dq29TxJ5zpM4XHFteYmjRFf+8vB0LPfL9SydtuPUex4=;
        b=J5E+PxgmFb0/jeBFqOpf6TP+Y/wIMFbNs7hb7cSGNwPwv7FJITQfIvfN7JsVTdOR+l
         SLvqgnue94zOIJJ9ZTF1ZQ7ESLga/M+Z6nnNA3o+P/4TsqJX2btdTYXzazYxxGVFVDRp
         qQaP9b0QSkfGx8MIqEEe8f6nUzx26KVNSX6cI8Z8ny12/WKVfDCH2CjP2o/5poowNyNc
         fnH1cFP4kfLLQQBO8KsQm/vEzq/q2LgCF3hkn4ZxVwOcsEK7YH3G4E3glM4b8Akx+rMt
         9026oOcv2YftXVRw9HCQS6oTvSOiynlt7gbcPQNznUjOU9CqXoUdLISC1aXo5hoHn5WH
         Mq7w==
X-Gm-Message-State: AOAM532SPsAatNO0VwK/j9hFAjBS8+oEWmQ5YXQk3muXDcf51J383iZD
        3MtBZov9pMrM/WnKhRDK9Ke+vvpARXUPpynGpt90Jw==
X-Google-Smtp-Source: ABdhPJwsE/D0A4gu7LK9Uo5aq776hYHg6zVFtNMjoHs4nXxtn9C+5PEy6DETLnx3RKhAzWNHPiAUZenoQ4MczmEq2U8=
X-Received: by 2002:a4a:c3c2:: with SMTP id e2mr1747622ooq.8.1632776975637;
 Mon, 27 Sep 2021 14:09:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Sep 2021 14:09:35 -0700
MIME-Version: 1.0
In-Reply-To: <20210927113632.3849987-1-arnd@kernel.org>
References: <20210927113632.3849987-1-arnd@kernel.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 27 Sep 2021 14:09:35 -0700
Message-ID: <CAE-0n52=yYW6SuMUPwGiv374K7D6DDpOZdJUudHdhMa7x2p1CA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/submit: fix overflow check on 64-bit architectures
To:     Arnd Bergmann <arnd@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Arnd Bergmann (2021-09-27 04:36:23)
> From: Arnd Bergmann <arnd@arndb.de>
>
> The overflow check does causes a warning from clang-14 when 'sz' is a type
> that is smaller than size_t:
>
> drivers/gpu/drm/msm/msm_gem_submit.c:217:10: error: result of comparison of constant 18446744073709551615 with expression of type 'unsigned int' is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                 if (sz == SIZE_MAX) {
>
> Change the type accordingly.
>
> Fixes: 20224d715a88 ("drm/msm/submit: Move copy_from_user ahead of locking bos")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
