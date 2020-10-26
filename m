Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 242EB299848
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 21:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbgJZU4L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 16:56:11 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:45454 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728420AbgJZU4K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 16:56:10 -0400
Received: by mail-pg1-f195.google.com with SMTP id 15so33281pgd.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2020 13:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=5HeFLa89GKRfQ1XZepG1+Qq8mgTYnKfDuFsFx2t5hik=;
        b=ZnwvKThmJJRc7XtDD9S148ZbXLzkCKb13MMwlf6PpcbaAKGllxcAeTrBPlQWXgTyTt
         Cx9vp+bKlaRXdjdLVvrUhc0kkbtvE1ETmzQbN2aQjvswcZDdCrMC7UgjyuftV57g4WTy
         wSkVDm1l6tdzpNw8nxONLM/sGb/ogqbo+ymcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=5HeFLa89GKRfQ1XZepG1+Qq8mgTYnKfDuFsFx2t5hik=;
        b=Go6zzAbLtGCS/612+F/D3BK+CEzrr62Rag039rbYxN08ERIx1j89ZVEtNqFqSeRupC
         XuM8RrOTEB0k1Enb9QVpCNoSYOhfOZX/UaRoq6HzGQIeVq5CtWHg3qd7miozHVUQuGUa
         gEfgxqcgsB3cFDTuCUDetUC35DZbc9bD69ISyx5sP607wRdKPl68G4RLuygbZ4p3zZWU
         iALNvIoVleWY1LHqd7HQylN2hXNUOeQeyhv8vAtkDHTliZHclDPDYzfGIX0cYjZXgoTz
         h31F6Wp5q4CD0EdZsM1iChYa2MZKhmW/CUyd4iikmWDHvlir4aLs1S1oeE31me45Y7aI
         qdJA==
X-Gm-Message-State: AOAM530FIeZxso/E6H4kaAi9/dAzVqqFgyFsmXWeWkmUYjvC++BQGb2u
        TneGswQmtiCatihDw4dZxtgoOA==
X-Google-Smtp-Source: ABdhPJxi7nbZgFH7nWutnr3b3SCmGRv6cRm4tL4fle6uvBxMr2G6t7oz6Oswhe2y151V4jCatLqa3A==
X-Received: by 2002:a63:e705:: with SMTP id b5mr14922382pgi.230.1603745769694;
        Mon, 26 Oct 2020 13:56:09 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id n19sm12588831pfu.24.2020.10.26.13.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 13:56:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201026194110.3817470-3-arnd@kernel.org>
References: <20201026194110.3817470-1-arnd@kernel.org> <20201026194110.3817470-3-arnd@kernel.org>
Subject: Re: [PATCH 3/4] drm/msm: fix -Woverride-init warning
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Rob Clark <robdclark@chromium.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Shubhashree Dhar <dhar@codeaurora.org>,
        Raviteja Tamatam <travitej@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     Arnd Bergmann <arnd@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Marek <jonathan@marek.ca>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Date:   Mon, 26 Oct 2020 13:56:07 -0700
Message-ID: <160374576766.884498.794065087413944435@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Arnd Bergmann (2020-10-26 12:41:03)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> There is one harmless duplicate initialization that causes a warning
> with 'make W=3D1':
>=20
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: warning: initializ=
ed field overwritten [-Woverride-init]
>   122 |  .max_linewidth =3D 4096,
>       |                   ^~~~
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:122:19: note: (near initia=
lization for 'sm8250_dpu_caps.max_linewidth')
>=20
> Remove one of the two identical initializers to avoid the warning.
>=20
> Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
