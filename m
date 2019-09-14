Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB86B2C02
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Sep 2019 17:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbfINPq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Sep 2019 11:46:27 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:42938 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbfINPq1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Sep 2019 11:46:27 -0400
Received: by mail-ed1-f66.google.com with SMTP id y91so29497452ede.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Sep 2019 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eFH4iXt2HpFd5wNrI5MRklz1IyY3NaeinHNqvFrBg0A=;
        b=hMysgWbVZ66tTxTEwvY1axECTH3W9Ts9APKz/N3+x6ZHvobtE/WwCPFZdTrIjEMXr/
         JOTSR1CLsc1n81XD4pn38hsP5UgwBjoFymxe1c9N9RTdrm7I00XgMd11gVDEmDHWZbAn
         86Noko/KhIcDQbatMnLtbdNsLtbd9WnheG7ef9AFFoZFK8Z9rx5wmu/YiLhbgZRvErHl
         e98HCyXcXA3PMQh2ldtoa9foS4uCeTXRLmu1AD54znhLswbfTxHu7oNHI5bMwgmrbiW9
         sA3EYyv0gn/Rfe8IDD0kDU4NcATykXpne3OgDbO7KYx34fyM1DbY6KAvFqC4I/HHDWf7
         9P5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eFH4iXt2HpFd5wNrI5MRklz1IyY3NaeinHNqvFrBg0A=;
        b=hcRJCHjeTbV1tfS89RQzFXQU/XleXXA+9jp2F8ed0IBOLRu+hhq7h3PE4FsnqX6pNL
         0RSbDAjBCEm6uE/PJG9Vt8FrzrzOBjAST59f2bHPHMDuuhyLbE672cP8GsiFna4ORtUx
         sf7TX3UF5kBx1ggT8htEfQMUMlS1Yryb32QDlA2HYGIzcNFa68hRdMIFVl9+2o/3W3+9
         uXqf/h0Js8wrrO6lk7l2nrxxfpIXi+0L5fiDJPTF7LkUcGod7EyrORbNsm7pV7ajd3Wt
         taqIMqL484MYEOZgqNnSef2K/SjDG3JqIcm1SlwE7Mtie6yf2qxgQqvo8e05XAdwNpfe
         u+XA==
X-Gm-Message-State: APjAAAUYBjMNt6pZuk6fMgfbxTG/xfvXK/IFgp8FHxQvbOuPg1C8+Bul
        6kuH72ofAASHWUvsH6ncbMjUDu8Awl/K0mEcmaU=
X-Google-Smtp-Source: APXvYqz6ZTPaISmDQzOlqWbnHI0Usa4b+3rwr+zz0z1E2QlhVKbTdnxvJhNdaxDHj5aMWtxe0O2mBJTma3+/sOLJLvY=
X-Received: by 2002:a50:935d:: with SMTP id n29mr53279003eda.294.1568475983791;
 Sat, 14 Sep 2019 08:46:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1568375189.git.jani.nikula@intel.com> <85a41fccdfca75ef47c9704761c959b5d53c0504.1568375189.git.jani.nikula@intel.com>
In-Reply-To: <85a41fccdfca75ef47c9704761c959b5d53c0504.1568375189.git.jani.nikula@intel.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 14 Sep 2019 08:46:13 -0700
Message-ID: <CAF6AEGuEuawA035_jMxu2EoFRrzpXqjGqSEsC_TVjzmB2xXgPg@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm/msm: use drm_debug_enabled() to check for debug categories
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 13, 2019 at 4:52 AM Jani Nikula <jani.nikula@intel.com> wrote:
>
> Allow better abstraction of the drm_debug global variable in the
> future. No functional changes.
>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Rob Clark <robdclark@gmail.com>

I don't think this should conflict w/ anything, so land via drm-misc?

BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 9e40f559c51f..00e3353f9aad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -29,7 +29,7 @@
>   */
>  #define DPU_DEBUG(fmt, ...)                                                \
>         do {                                                               \
> -               if (unlikely(drm_debug & DRM_UT_KMS))                      \
> +               if (unlikely(drm_debug_enabled(DRM_UT_KMS)))               \
>                         DRM_DEBUG(fmt, ##__VA_ARGS__); \
>                 else                                                       \
>                         pr_debug(fmt, ##__VA_ARGS__);                      \
> @@ -41,7 +41,7 @@
>   */
>  #define DPU_DEBUG_DRIVER(fmt, ...)                                         \
>         do {                                                               \
> -               if (unlikely(drm_debug & DRM_UT_DRIVER))                   \
> +               if (unlikely(drm_debug_enabled(DRM_UT_DRIVER)))            \
>                         DRM_ERROR(fmt, ##__VA_ARGS__); \
>                 else                                                       \
>                         pr_debug(fmt, ##__VA_ARGS__);                      \
> --
> 2.20.1
>
