Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF5B92E084F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Dec 2020 10:52:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgLVJwx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 04:52:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbgLVJww (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 04:52:52 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D7DC0613D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 01:52:12 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id e25so1580484wme.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Dec 2020 01:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=to:cc:references:from:subject:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=s8FlNBJc1tOTzj1/5kq2UR+5JabDHOpPzaLRtEUB/HU=;
        b=gvvTyEq3lOW77ADAiTItaTJnUGezfK5apmO7swllVcsQZSe06cTh2e4paz8ofAf3NO
         h/mXiSo7GQuyKJTRTuvXIJJ3dvlXHXGsOA3Urs1IRfx/8ebdhXfp3fNJs2a4+KmVygK+
         ROpDp4kq6Tqu2uv5FLLlRjd+RjubqcvcZZFfylmKIbCTCUoIrzacxiu6s2XD3Oow2y8V
         LQFKgGJxJJzJocKRxmlMHwV9fAHAYNWkl2N9d2JY5+leOndLXq0+tNCybHERqWg75RFR
         1/RWsCVpt8uxjA2DS4k7pfHkat8iJghci11Po6iEmFOmy+FThuqd/0wRFg5MNAo6Da/2
         CL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s8FlNBJc1tOTzj1/5kq2UR+5JabDHOpPzaLRtEUB/HU=;
        b=a+YwHNFUujNr8BcC70fYxtz4f44kHYxUb0k+sM13ne8KdJTs+JdjvStddBnpLoMdUd
         GvZO1NusRFJr+AJ8B2otx2i0M2lGUm3a3DVykRtT60ttJxs5+5j9N94+uPyAsvgyGEXv
         ta4EFZmdai2e4HNpX+56kBznFP1spcpXQnZepqQk4D9ELgUQWFFrUAluoMi0l5xYH/mb
         g9RFQ7GkZd6m3snyCbqIMoLXJp+Roh+YGiuymJx4pcH4ILXg5eCGFgGO3vmuwqUDd9vL
         L2FZSswls8fsyGVIa6tVDtBd+96iVuxOzGD+nDd0YXxqbjs99sxqkujZMLfHZbw3HzFE
         Ry5g==
X-Gm-Message-State: AOAM533t7rdmHxv/abiQ8JoogZKD3KLS4WkSLCf/PHxGaXLWldhDtQ0I
        UfeONF23biIU8rXMhUJfGV5DcasUE9qoKg==
X-Google-Smtp-Source: ABdhPJyfs5ZpTygXxaGZ5j8GtWYGKD6uk7BkURU0CRMiJrejb6fOEpzfcrY5OfLnYg+fJAPxGXnicQ==
X-Received: by 2002:a1c:5410:: with SMTP id i16mr21190404wmb.30.1608630730769;
        Tue, 22 Dec 2020 01:52:10 -0800 (PST)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id s20sm25149033wmj.46.2020.12.22.01.52.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Dec 2020 01:52:09 -0800 (PST)
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Li Yang <leoyang.li@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20201222043745.3420447-1-bjorn.andersson@linaro.org>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin
Message-ID: <41571e59-b9f4-3e59-e23b-d9fbda9bee18@linaro.org>
Date:   Tue, 22 Dec 2020 11:52:13 +0200
MIME-Version: 1.0
In-Reply-To: <20201222043745.3420447-1-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/22/20 06:37, Bjorn Andersson wrote:
> As of v5.11-rc1 the QUP nodes of SDM845 has got their interconnect
> properties specified, this means that the relevant interconnect provider
> needs to be builtin for the UART device to probe and the console to be
> registered before userspace needs to access it.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Georgi Djakov <georgi.djakov@linaro.org>

> ---
>   arch/arm64/configs/defconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 838301650a79..3848ae99501c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1078,7 +1078,7 @@ CONFIG_INTERCONNECT=y
>   CONFIG_INTERCONNECT_QCOM=y
>   CONFIG_INTERCONNECT_QCOM_MSM8916=m
>   CONFIG_INTERCONNECT_QCOM_OSM_L3=m
> -CONFIG_INTERCONNECT_QCOM_SDM845=m
> +CONFIG_INTERCONNECT_QCOM_SDM845=y
>   CONFIG_INTERCONNECT_QCOM_SM8150=m
>   CONFIG_INTERCONNECT_QCOM_SM8250=m
>   CONFIG_EXT2_FS=y
> 
