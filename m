Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96E1D3C5EE9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 17:14:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235266AbhGLPRa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 11:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhGLPRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 11:17:30 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0C59C0613DD;
        Mon, 12 Jul 2021 08:14:41 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id y21-20020a7bc1950000b02902161fccabf1so11494175wmi.2;
        Mon, 12 Jul 2021 08:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FgrvlkTg9/uXAH5M62IC4z6ysDDDFyj/9SoWCRpN0t4=;
        b=UFFbUCIF/FxKZvWRNiFw0HpASNUk3LSbHPDZPrpVsnzb9ZU1Y0bWXON5z1JijtI8Ga
         2w7zH9GEaaQAhQhcall5R9DaJmSqUWfDM82D8Oqn50leIb4dm8wUhD6bIMCkJhAUHS+b
         8bSAP97sOCE6BjS24F0AUlPcSuLVyTouwB8B+SFdFlEsRkBWKsAckuq1UqDaKa7j6JpC
         H3caswdy4BRPEFL94TRjtnuTeAiU9puWl8ehw3PFm/7c01oNY4qNB9JxqfYFRudSSq4g
         kae80XVh09DBUo+vOVeaVOiIypQp/Ou/HnjN6Zqse7ttZxuVM5UmwkzKmASWzT9SCDWm
         7Pew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FgrvlkTg9/uXAH5M62IC4z6ysDDDFyj/9SoWCRpN0t4=;
        b=XO/OYDiTtLLfULwvcxbL/iw02ITQdIBL+iy9M0Q2PUxMngM/41wuGAggx4u5tTDgK7
         +H2Pf/wXKWHnvNFWtRWA+hpEdQ2ciSorokFK02obSd2gVlWDi4QnPzRixA8o9oN8clN9
         wR2UKJeP+64hoJwOiIySMDhSzuOVlyLIJTZiwI4Mhj2J6KKhoWCawgF6Xbg8aCvhGEQ+
         YKKXnKyERTVLvcGAwtswtgNB4KUSMAMbFE/HfR133c3/PsQXsL1C+Den1M5VUUnNaRXi
         VwjDkWBJvFKy88ADwnnTaCvL8T1Tw+0Di8tk3epfWZfJT4VguhKqanPbn/Es8sAMEv6U
         a9dQ==
X-Gm-Message-State: AOAM533ZC6x6dOSfGRT7qe6eqxq3XZf8VJ/P5oqeA9U8879koEhUmhXs
        IIZFPblTvjRhlZixQneSXap6+Xqtw2jDmkNBOhE=
X-Google-Smtp-Source: ABdhPJxkcUzuVWuWz5NTJOs2cfQ1UD5tPHkHAUqhXeP6vDvN6D/FVwPlYcp7y8metFR6XSVzBzOajDkm0UyChfHztys=
X-Received: by 2002:a1c:4e18:: with SMTP id g24mr8944778wmh.175.1626102880428;
 Mon, 12 Jul 2021 08:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210703151835.171313-1-david@ixit.cz>
In-Reply-To: <20210703151835.171313-1-david@ixit.cz>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 12 Jul 2021 08:18:46 -0700
Message-ID: <CAF6AEGsAjjUtj=kE2Q5WFmfXsWcEG2K2=tfopuUK1ud4Z-6fMA@mail.gmail.com>
Subject: Re: [PATCH] RFC: dt-bindings: drm/msm/gpu: convert to YAML
To:     David Heidelberg <david@ixit.cz>
Cc:     Sharat Masetty <smasetty@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jul 3, 2021 at 8:20 AM David Heidelberg <david@ixit.cz> wrote:
>
> This warning cannot be fixed by conversion, since this naming is already used.
> Documentation/devicetree/bindings/display/msm/gpu.example.dt.yaml: gpu@5000000: interconnect-names: ['gfx-mem'] is too short
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/msm/gpu.txt   | 157 -----------
>  .../devicetree/bindings/display/msm/gpu.yaml  | 256 ++++++++++++++++++
>  2 files changed, 256 insertions(+), 157 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/gpu.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/gpu.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.txt b/Documentation/devicetree/bindings/display/msm/gpu.txt
> deleted file mode 100644

[snip]

> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> new file mode 100644
> index 000000000000..4315482e0b12
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml

[snip]

> +  zap-shader:
> +    description: |
> +      For a5xx and a6xx devices this node contains a memory-region that
> +      points to reserved memory to store the zap shader that can be used to
> +      help bring the GPU out of secure mode.
> +

Side note, this node is optional now, we do have some a6xx devices out
there which do not use/require a zap shader (in particular, the
chromebooks).  Not sure if that effects how you want to document it in
the yaml.

Also, new dts for devices that use zap, they should specify a
"firmware-name", since the zap shader is usually signed with a board
specific signing key.

BR,
-R
