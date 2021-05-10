Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F99378111
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 May 2021 12:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhEJKRq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 06:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhEJKRa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 06:17:30 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9682BC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 03:16:23 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id w22so1449950oiw.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 May 2021 03:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+r+tNLFDppJOvmy8NbCdwzEyEYcJmtQue/FgZdoGhW8=;
        b=BvHGmvj/MU6iXnVTT9LHkgeyk3C8HUXAoFc8If+T1/AwB6RIXGCn4Jb/w5vi6ZTFK8
         hRntAuz5FqS7qCo7hiowicpuYyekhg1GnFfyorDccLysLhCUpHiUD4TqjAWP95Al4kZB
         dydoQ8CL8Bmz+eTs/3RLK9jqpZoPQKASJIPtZWLeQB0Vap+ehqm1S9au1NsjcGDmIgD6
         QTOEESSTGViGTRQlEq9g5AP0+5+VDYYA6IHyycKqgS9rcklHMoDkGCJKDzLuywRu/nKl
         DsmbQ+NOQFy+sR94KhF///pPcuU/VZ3RMyOE2rI8cjMmBcBLjEl7H3CbAPeZCFSWe+Go
         r2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+r+tNLFDppJOvmy8NbCdwzEyEYcJmtQue/FgZdoGhW8=;
        b=hSI37maCLDHILQAfO6ihVdJGF/yuA12AgBlazdQVr3WS6myd/2QssWbyZxCk8UO7YO
         ekW5cMImL0Yt1vDCdDTh0/3FuwZqTxC2Qr4QQiGuxwM3ji98qyPlzJDHDQtUYLrr0YLB
         Sr26tuAYpLUXH93EjH8hY6S/Y/XFRALuoiDFuj1xZFEcHTkZ9LMgSpktlcgYiongZuv6
         yP2VRP+sHrWprt3GhWR/yNehY9iRsWFzGapVsX2s5f2/WCqXOs8ydNMgKh1SVcRO7XkA
         LylKmXB0k8yLm3EccaVBZQmBeTX08fVCO9HD8iM94VY8rinWxH9yrHRQwSEUDw8PARuO
         yECQ==
X-Gm-Message-State: AOAM531PP6+gaCW36skigG735qcfJ+usCskORKK0biQcUZqhrGLnOosE
        rBh4nZy4+fILkCSOq0kdP4z/YKXyBmXeInkpsvXAtA==
X-Google-Smtp-Source: ABdhPJwSDBFbEcohkYa9kei2T3fY2p68vATjwelCr+U/fr3FIi747UjXJitCqcfZqU9z3egz+2iastrbVMo91DPQQGE=
X-Received: by 2002:a05:6808:f0b:: with SMTP id m11mr4145727oiw.12.1620641783048;
 Mon, 10 May 2021 03:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210510070725.3839459-1-vkoul@kernel.org>
In-Reply-To: <20210510070725.3839459-1-vkoul@kernel.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 10 May 2021 15:46:12 +0530
Message-ID: <CAH=2Ntzn8GTeADAtvzVQ_kEheKYvqAbH8rZJacPk_S6AQ98r7Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: qcom: enable interconnect for SM8350
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 10 May 2021 at 12:37, Vinod Koul <vkoul@kernel.org> wrote:
>
> Enable the interconnect for SM8350 as a module
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 08c6f769df9a..a382d85c9434 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1148,6 +1148,7 @@ CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>  CONFIG_INTERCONNECT_QCOM_SDM845=y
>  CONFIG_INTERCONNECT_QCOM_SM8150=m
>  CONFIG_INTERCONNECT_QCOM_SM8250=m
> +CONFIG_INTERCONNECT_QCOM_SM8350=m
>  CONFIG_EXT2_FS=y
>  CONFIG_EXT3_FS=y
>  CONFIG_EXT4_FS_POSIX_ACL=y
> --
> 2.26.3

LGTM, so:
Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Thanks.
