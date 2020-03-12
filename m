Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0B9E182834
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 06:21:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgCLFVi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 01:21:38 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45141 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgCLFVh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 01:21:37 -0400
Received: by mail-vs1-f68.google.com with SMTP id x82so2884389vsc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 22:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rL0f1stvcai+881pBzgsoAh3qUJVmAXvCC/htsXh94=;
        b=wQ9KH1LqIfVUdGWfsDTAG+874YZgIwVtgGGlTea3dhDmu2xXr5bh2weH8pSA1cs83v
         LNFpEJqNoPoqs+FEeeoIZHDx0Gr5xJkhp0s+019VRA8mCVD43rqr+D50dcKYJUc5lH9I
         wKTLDyLEFgqgfReS4ykjcWppP0hwPyKfk69aHc6JLu6M80sjR0hC1S4Udb2ACOs+Y0by
         0cOCsM00sI3dUnZoKqNcupUFnORtwYBWWoOX+2PBDVM31fFx+K6JOC30cnvFcZdlrSN1
         xMt23dbDLuGi0ffPtdHN99su4OlLUarO+DVokGJtrYJxAff1NbPDWI0nzroqCjY9sXL0
         ASXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rL0f1stvcai+881pBzgsoAh3qUJVmAXvCC/htsXh94=;
        b=l6gTYpuGbgaEGJtBBK20JAUScGgQY6N7BJ1FeldmlqNJJ0qln6jJpyvS3Nl06hmRM+
         1W8gsIaK19hJIv5GkzUzX20/YYaJBxo2AxFuLJ2RHZLUf/J555a0CAY/j2FpBJPZVORx
         mDOkbCcuvwyPwVWaeWcqPG9ob6Jf8OOiBi/dme0pzSSAmOa9wDPDpFRpWHv7qUyp4EUy
         9ymzj3r3Oev2gw4h79nB/iQn5fWvFVk0BEZ+qK9cXOQTmOcqIL6laQKTyZeLTRATJ+AF
         BVBeD4gsQnXu0+Bexe8EGzqe0gDfLofy9H3mNYO4chSaMQYtMDAKf6BJAOeINZ7Dxhqx
         HbJQ==
X-Gm-Message-State: ANhLgQ2NC/tOrDmf56GSU5eXyObqV2MrpMaVYe4WBZag/ED7FABnV4gj
        g9Ef7eS2KOmOBxxHA8J2rxL8MmvEyjIIr5RRmceF1g==
X-Google-Smtp-Source: ADFU+vvcIQBsD6+Qf4EXhXxuhdx/RuDKXyEsnw/NEhzlaB7+WISf9/LVykqfs227GC7dL+5kSizWix/lKMiNIw74MX8=
X-Received: by 2002:a67:e99a:: with SMTP id b26mr4269737vso.27.1583990496623;
 Wed, 11 Mar 2020 22:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200311233039.928605-1-bjorn.andersson@linaro.org>
In-Reply-To: <20200311233039.928605-1-bjorn.andersson@linaro.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Thu, 12 Mar 2020 10:51:25 +0530
Message-ID: <CAHLCerMxf5HwcFqqyOuV+LjMqw_6PJdcsGLQzW2GDSSwt_Uz4w@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Truly NT35597 WQXGA panel
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Anson Huang <Anson.Huang@nxp.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 12, 2020 at 5:02 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The Truly NT35597 WQXGA panel is found on the Qualcomm SDM845 MTP,
> enable the driver for it.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index e8be14b93b40..07b57510394b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -573,6 +573,7 @@ CONFIG_DRM_TEGRA=m
>  CONFIG_DRM_PANEL_LVDS=m
>  CONFIG_DRM_PANEL_SIMPLE=m
>  CONFIG_DRM_DUMB_VGA_DAC=m
> +CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>  CONFIG_DRM_SII902X=m
>  CONFIG_DRM_THINE_THC63LVD1024=m
>  CONFIG_DRM_TI_SN65DSI86=m
> --
> 2.24.0
>
