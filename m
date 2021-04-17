Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350CB36319D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 19:49:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236796AbhDQRtp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Apr 2021 13:49:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236643AbhDQRtp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Apr 2021 13:49:45 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51623C061574;
        Sat, 17 Apr 2021 10:49:18 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e7so20775797wrs.11;
        Sat, 17 Apr 2021 10:49:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gMhNbNGvJIy0W54t2+jjd5JvuAH30UWhJb9UCM3Fxt0=;
        b=QNgw8v1ODQ3popOSFT98BMtFTy2lrtW8i48CVEVxG4v2bh5CEilJ1jDNmncMac5W0I
         Vi0+aA3LiEpkCxZ3o3Lj2x+PdJbDstXZofauACi85ffINBtEybopFOnmAWndkzQBqumP
         MYoKs2Ukz6kOE0m6VuFparSXUncmDhI2wAvt616JxLwJOmMRFns3Ok9u2D4bZepKfsML
         yVJs8tcVNwKaDBDT/JdzseNlahAlNVs4Mg+UJiQImi7fjlvVoOaKehazrnpfwXfBfl8V
         cQpkiYlCv77bl7rB8NtVwaoG8MPGftpq44WSgiaf/uyW+oGGNS2FzgDmIv0Z/O0xJEFJ
         4Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gMhNbNGvJIy0W54t2+jjd5JvuAH30UWhJb9UCM3Fxt0=;
        b=jXP1LqROayXCGIeAW9poAaskkLifU5xCLDV67LEeOdWNTqgfUy43HPEApA3B87XKvo
         ATDXf39kST8+93gtC4iVmlPGI0Eb89ui3SycW6LGR32xyiHzqCHC+QJukxN+r7BaNGBn
         LKg9A8itUCiEh8nl2xrIDHEgqrlP9sFbsRWFlb09rJZ3+ut29kQiMmG3RXrcr/4YxCZl
         k6x2TT8VWslX+wTmCbBJmxpXoL6aGEligQlsFjTfnvd8xWV4EgstjPtBz7DG1NJRo3AJ
         ZmZm4unDRSlBq+6e0fFavOMB6sAjLAyjkZlhD9zGbf+trU6NrxK8X2jEf0n43ieCOqKG
         Di9A==
X-Gm-Message-State: AOAM532TXs+0xoFqbesr6XI/nlrHWXWVc8jNU84B3DGk2097YQcDFLpY
        /UZC+MR1crI8X+gtpP5bIq2tU5BB+VcVHmMxw/gW/4AYCsD7CQ==
X-Google-Smtp-Source: ABdhPJzZ03PjLvSbr+EYaGObqqYd6gtKUzZhFhFFqRCVQqnl3bd+oCaXlHlIsjYz7jpf/2N8aX8WRprUkQrNrPegMV4=
X-Received: by 2002:a5d:4412:: with SMTP id z18mr5508193wrq.28.1618681757094;
 Sat, 17 Apr 2021 10:49:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210417161912.62811-1-caleb@connolly.tech>
In-Reply-To: <20210417161912.62811-1-caleb@connolly.tech>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 17 Apr 2021 10:52:49 -0700
Message-ID: <CAF6AEGv2701e+FMKX12+rHYwLpv06-kAo364Us7wEw6pAoC7Dg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: always parse interconnects
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyant@codeaurora.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Apr 17, 2021 at 9:21 AM Caleb Connolly <caleb@connolly.tech> wrote:
>
> The WARN_ON in dpu_runtime_resume() fires constantly on non-SC7180
> platforms. As SDM845 now has interconnects hooked up we should always
> try and parse them.
>
> Fixes: 627dc55c273d ("drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume")
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>

I believe this series in msm-next already solves this

https://patchwork.freedesktop.org/series/88644/

BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 85f2c3564c96..fb061e666faa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -933,8 +933,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>                 DPU_DEBUG("REG_DMA is not defined");
>         }
>
> -       if (of_device_is_compatible(dev->dev->of_node, "qcom,sc7180-mdss"))
> -               dpu_kms_parse_data_bus_icc_path(dpu_kms);
> +       dpu_kms_parse_data_bus_icc_path(dpu_kms);
>
>         pm_runtime_get_sync(&dpu_kms->pdev->dev);
>
> --
> 2.30.2
>
>
