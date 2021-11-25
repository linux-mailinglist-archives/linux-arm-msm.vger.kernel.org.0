Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E03645D89E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 12:01:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354664AbhKYLFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 06:05:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354870AbhKYLDI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 06:03:08 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B595C061784
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 02:58:58 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id y14-20020a17090a2b4e00b001a5824f4918so7489733pjc.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 02:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sCgAh/8By8wNIrpD9ZFYd1/D45MydwuRk8zcWPcXzGQ=;
        b=cLqXpIgXjTlGOz1+IBYb8VUFp+uxcoeg2qgpXuYboMkZ9nEN2PIueIvHrVwRREeLmb
         +MrF9p67VwUtwkCOKgMpKFHfMbgQKrRu3A4Ei5fZTDaW/5FP6BRBW4nGfIWSFpYZFNe8
         0HSKyJrAk7bR75zNpuXPOvX7m7hC7BeqhRGcMfOrHH6huXvQNL5Az0dD8t07sD1vp6fW
         DSs5Sa4z5eLSfVWXh6wJRcbwCy9qkbxFE/5DrfUZkwUbQAyBimFVikRyc2tPk4rfv6vB
         IVnUrMjl/5tVH3g09/AQOnibornKoF23XfqUGYJTThaJBEa6V998JrI4MIc7OGUol2aZ
         HDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sCgAh/8By8wNIrpD9ZFYd1/D45MydwuRk8zcWPcXzGQ=;
        b=yCv7oREk/vf4PTnwmpNmfICWP93lXfsuWXiWjT4LWV1iCCfcuSS6StuuOK4g1Z/a/m
         WRh0sB/SaMfSa+39SUpDsaVf9yQG5ZXSfIKgl/qYzI2MOT32x0ndC0VqatwOOnaQUG2R
         e9aTckXQYoQF27Cfk+wf7eI7NWPTYNEb1bZHzkFzlhN2ZBWS1y6bUILXolVD/tqHGhwr
         Rz07jr8a04DO8mi2YhJlUYXjBDpJHwOQsez2AZ5Jw6rHD3qlfAgVE4sWkM9c4phqYBAr
         EDfv2ziMZMY4296rVL5iv3AmyezfuDuNv9xxcBJU2vKTURpf4gsYI7L71QU/QvsOzXcB
         ft1g==
X-Gm-Message-State: AOAM531FVrCc9j8H95CfdQ8vc//JuToe/hqtk47UwxeV1kbrzqWhAo5X
        ysr4o/cuaREfUhVPziN13prNr2vsN0ytdcpyAw9NSg==
X-Google-Smtp-Source: ABdhPJzEuWLGFxkRno8JHC5jNEyjXKuuqBAtEaEU9SYXKzgCatvz+aOmCp4g+jj8lAIvVYTHHBWYGkqPHzjzHeAWsL4=
X-Received: by 2002:a17:90b:4a05:: with SMTP id kk5mr5895404pjb.232.1637837938076;
 Thu, 25 Nov 2021 02:58:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637781097.git.mchehab+huawei@kernel.org> <c33a6897f5a0803b3fde93fcf4ad652c0915db54.1637781097.git.mchehab+huawei@kernel.org>
In-Reply-To: <c33a6897f5a0803b3fde93fcf4ad652c0915db54.1637781097.git.mchehab+huawei@kernel.org>
From:   Robert Foss <robert.foss@linaro.org>
Date:   Thu, 25 Nov 2021 11:58:45 +0100
Message-ID: <CAG3jFyvHvNs93x29s9CoxwRJnpEo_VpyFvCcb6qOAOVpWUs+mA@mail.gmail.com>
Subject: Re: [PATCH 17/20] media: qcom: camss: mark read reg function as __maybe_unused
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Todor Tomov <todor.too@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for submitting this Mauro.

On Wed, 24 Nov 2021 at 20:13, Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Such function is currently unused, but could be needed in the
> future. So, keep it, marking it as __maybe_unused, in order to
> avoid a clang W=1 error.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/20] at: https://lore.kernel.org/all/cover.1637781097.git.mchehab+huawei@kernel.org/
>
>  drivers/media/platform/qcom/camss/camss-vfe-170.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-170.c b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> index 5c083d70d495..455ae1a819e6 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-170.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-170.c
> @@ -191,7 +191,7 @@ static u32 vfe_hw_version(struct vfe_device *vfe)
>         return hw_version;
>  }
>
> -static inline void vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
> +static inline void __maybe_unused vfe_reg_clr(struct vfe_device *vfe, u32 reg, u32 clr_bits)
>  {
>         u32 bits = readl_relaxed(vfe->base + reg);
>
> --
> 2.33.1
>

I've submitted a patch[1] for removing this function, with that patch
applied, this patch is no longer needed.

[1] https://lore.kernel.org/all/20211011121301.421410-1-robert.foss@linaro.org/
