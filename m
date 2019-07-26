Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC57767AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2019 15:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfGZNjU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Jul 2019 09:39:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:45332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbfGZNjT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Jul 2019 09:39:19 -0400
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A726522BE8
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2019 13:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564148358;
        bh=oJrBFnXRYQDkNefhYi2mCPxF4BmcIHCJKvNESPKoXNY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EXdbLSoMI0MUSooaTZSEhpDJ3w4iuVWgQHpB/QelC+JzLU4b+MS44O4MUcumzPrPT
         mNS6im1H6i27FL14XUi9oLOPQVNZNlTMQ8KyjHVp3vzAZhqkBw6Pe6tEegFfYDXqas
         WmT11N3TR3etU6ZD7q4/rKnd2rxZFoqmFQkQ9Emw=
Received: by mail-qk1-f179.google.com with SMTP id g18so39025557qkl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jul 2019 06:39:18 -0700 (PDT)
X-Gm-Message-State: APjAAAVUTDUhyGEZ+Pr0FVfl81pFrRKrUOKhKiNXCKfkcDOkuWbQMPfB
        Antsi3zzy9HrTEe08e9IZ+v/V+TiRGpjfDFv3Q==
X-Google-Smtp-Source: APXvYqzhBza9pj3SowLzantGidYXQb0v3bHq3zBvGpW/aOSHvVcNfjjZmWPHJV99VCWEmtQzrTcG1eAC8aP1SNXctxY=
X-Received: by 2002:a37:a48e:: with SMTP id n136mr64196243qke.223.1564148357873;
 Fri, 26 Jul 2019 06:39:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190725035239.1192-1-zbestahu@gmail.com>
In-Reply-To: <20190725035239.1192-1-zbestahu@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 26 Jul 2019 07:39:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+5L_BGQskXDv+2Z-38Zd+BO9AfrsPcqbFcjTwE1qMOaA@mail.gmail.com>
Message-ID: <CAL_Jsq+5L_BGQskXDv+2Z-38Zd+BO9AfrsPcqbFcjTwE1qMOaA@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm: Switch to use DEVFREQ_GOV_SIMPLE_ONDEMAND constant
To:     Yue Hu <zbestahu@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>, huyue2@yulong.com,
        zhangwen@yulong.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 24, 2019 at 9:53 PM Yue Hu <zbestahu@gmail.com> wrote:
>
> From: Yue Hu <huyue2@yulong.com>
>
> Since governor name is defined by DEVFREQ framework internally, use the
> macro definition instead of using the name directly.
>
> Signed-off-by: Yue Hu <huyue2@yulong.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c               | 3 ++-
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

I've applied this to drm-misc-next.

Rob
