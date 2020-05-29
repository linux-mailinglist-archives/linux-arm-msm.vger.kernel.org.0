Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC3C1E738D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 05:26:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391802AbgE2DWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 23:22:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390134AbgE2DWm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 23:22:42 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED088C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:22:41 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ci21so541484pjb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=K/DiwubCb9d/lnQfGWk08d+XnhhmwJW076U44Z32Yrk=;
        b=ABQgg5cWNx5fOyrnNHa7xWkq+xdikDNnjS4W12kEoFKR0VqzBHbk+RuPPSWL9i8bwt
         ZwD3gL5sgjUhkh+nby7ylwBIBCyO77FrzukhHTu0t2aUfllV/R1dPI2jmJ7CMle0hcdQ
         u0lO41zkYplAFYqmnL7st5yTpnkF+5CHTx65BH8JoalBbztHytDqTIelPTfNujamChgd
         Zg96gzGlAGZk1vOTsrYguHhaT+l1DDf69Clk17df+Q90qPIVqU301j5yB9y3aqsT5R+V
         PZhBYF3QzBUT8Bj7EkSmyvcIx1oz7eaIFJqtxoddCABtafZeLYCYD1sBhjmV0Get/pAl
         j9SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=K/DiwubCb9d/lnQfGWk08d+XnhhmwJW076U44Z32Yrk=;
        b=CGoz15HxZJiXQFSRyaStgBiZG9mCTNvI6Tkz+ygWi3ZGyQXnV3HQCqiYan1KCitiOB
         cImUyDt2E5QeKpxBO0WnnPGJSDcBw/CwhSwPrn2Kc1tm23/kBy1aAZzrniIoeEajk3R0
         R3gUShNWCv5tWBZ+DPAOTIVnojwCW6igP1rftzcM7POnh3W10w+VIJo9hgPbi4MKO40E
         8+g8A1kQVx6uvDa/6kpzscqG/9R+r+m6f1vf9aZOeW+m1p5iXKEkwhNer8RH5XV6AY0S
         2DqwX/H4ysT2UmNAfZzU3i0Yse16JhIYvfJJyCxrV5nzeh6nFLOJdgKcpm3xvWpTdZMY
         PNNg==
X-Gm-Message-State: AOAM533aKOGdqATe9u1iou9K18gp/INOztWZgL1rj8v1QQ3vCdReoLrQ
        /WLJ7n5Y51S8Of7obHQDgHWdaw==
X-Google-Smtp-Source: ABdhPJw0N1bX+6HZCbn3cdREjjbeqIDm8jsbLadZCLHaapUxmWVB6jDz9tqyVh98y3II0S9GF6maIg==
X-Received: by 2002:a17:90a:642:: with SMTP id q2mr7488956pje.71.1590722561475;
        Thu, 28 May 2020 20:22:41 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m7sm6053822pfb.1.2020.05.28.20.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 20:22:40 -0700 (PDT)
Date:   Thu, 28 May 2020 20:21:35 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Olof Johansson <olof@lixom.net>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable SDM845 video clock controller
Message-ID: <20200529032135.GB279327@builder.lan>
References: <20200522102109.3607-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522102109.3607-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 22 May 03:21 PDT 2020, Stanimir Varbanov wrote:

> Enable the build of sdm845 video clock controller by default.
> 

Applied

Thanks,
Bjorn

> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 03d0189f7d68..4eb7e35d2d7d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -806,6 +806,7 @@ CONFIG_MSM_GCC_8998=y
>  CONFIG_QCS_GCC_404=y
>  CONFIG_SDM_GCC_845=y
>  CONFIG_SDM_GPUCC_845=y
> +CONFIG_SDM_VIDEOCC_845=y
>  CONFIG_SDM_DISPCC_845=y
>  CONFIG_SM_GCC_8150=y
>  CONFIG_QCOM_HFPLL=y
> -- 
> 2.17.1
> 
