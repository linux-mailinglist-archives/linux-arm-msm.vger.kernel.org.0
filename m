Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A603D494C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jul 2021 20:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhGXSQC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 14:16:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbhGXSQA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 14:16:00 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A13C061575;
        Sat, 24 Jul 2021 11:56:31 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id y8so5928500wrt.10;
        Sat, 24 Jul 2021 11:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=3cToLkhxue4mfM4vekP8IOnb/EcTEEpzWIpkfDq5mZM=;
        b=EfNz22WT9hsyfy4lxaHxbKtF6MxDQIbNejOE8jWoic7rWyv3ExSvGOnf6vhJVzi5Xp
         rbMSuUIfVVHzGterc8p6kt4cdHvCiBAlEX+7FP887lht2p1qXf/4U4//flTaqOsSHwyE
         s+j4CEQRpRdXClW5y9XOFl0ZascBuxysBWsKQ8F/ySdSklWZbQxZfYvwcMeSDNNKnhNS
         WvYHUA3SyKkDq81NuDi5h5U14oo8A4lK27iPLBze24hNSKkkMtGolBY6+6JLN6XJj88i
         rLx+OqfNq/GfTNm+dSxSB40K1Nao8hfB1IjUTY67kXxQa/nqYO7cM3j0l3eE9/0xs57A
         rQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=3cToLkhxue4mfM4vekP8IOnb/EcTEEpzWIpkfDq5mZM=;
        b=KiuWYldtbRPz477vDoTiq5Seibwd51LVbwA71yskwhhKLY9EyrZ6OtzcEZ9dqLmk0D
         3fLLDJHDMeK5JTmDbTeWoV3WIiAKxroB/XVvdEAoFIn4grxML7dnX2qLiVuAdVu8r4y4
         9wIYyvlIng+zPi6rFmdbexmGQa9YJWRhrQCs/B/JW4CJeJPywaDCypd7CGanTd8+AiMo
         x8DaY2gxT+q80qLuXpYNT6Wvine7qKXAr/mypwkGauEsw+ppLc/ToS1QTTXQ2Bif4Cb4
         Zet3p1+ejt7VIsgRGTddIdnsGG/8f9Z5W0Xjca204cfzAeLuVDlGCUpSOmzi1VRVv4G7
         EIdQ==
X-Gm-Message-State: AOAM530gk7+fLmYVhmwEkGtvCvnY7PAOw3oINpJRSo61CUChhtVdlbwJ
        BOMNfnscMiF/8gFp8Op9Vc9XbA3Y7593Ow==
X-Google-Smtp-Source: ABdhPJyoxa2Etz0mZamZmCmnNW/4T6kabG89+pvOzH2gvDfA9rerFkrQekw8xxiJIc3GXny7W0Lziw==
X-Received: by 2002:a05:6000:1b0c:: with SMTP id f12mr11053984wrz.225.1627152989926;
        Sat, 24 Jul 2021 11:56:29 -0700 (PDT)
Received: from pevik (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id c125sm9995059wme.36.2021.07.24.11.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 11:56:29 -0700 (PDT)
Date:   Sat, 24 Jul 2021 20:56:26 +0200
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/1] arm64: dts: qcom: msm8994-angler: Disable
 cont_splash_mem
Message-ID: <YPxiWvUasvLFjG8e@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20210622191019.23771-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210622191019.23771-1-petr.vorel@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

could you please queue also this fix? Angler needs it for booting.

Kind regards,
Petr

> As the default definition breaks booting angler:
> [    1.862561] printk: console [ttyMSM0] enabled
> [    1.872260] msm_serial: driver initialized
> D -     15524 - pm_driver_init, Delta

> cont_splash_mem was introduced in 74d6d0a145835, but the problem
> manifested after 86588296acbf ("fdt: Properly handle "no-map" field
> in the memory region").

> Disabling it because Angler's firmware does not report where the memory
> is allocated (dmesg from downstream kernel):
> [    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000000000000, size 16 MiB, limit 0x0000000000000000
> [    0.000000] cma: CMA: reserved 16 MiB at 0x0000000000000000 for cont_splash_mem

> Similar issue might be on Google Nexus 5X (lg-bullhead). Other MSM8992/4
> are known to report correct address.

> Fixes: 74d6d0a145835 ("arm64: dts: qcom: msm8994/8994-kitakami: Fix up
> the memory map")

> Suggested-by: Konrad Dybcio <konradybcio@gmail.com>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v3->v4:
> * add a comment in dts (asked by Konrad)

> Kind regards,
> Petr

>  arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 4 ++++
>  1 file changed, 4 insertions(+)

> diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> index ffe1a9bd8f70..c096b7758aa0 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
> @@ -1,12 +1,16 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /* Copyright (c) 2015, Huawei Inc. All rights reserved.
>   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
>   */

>  /dts-v1/;

>  #include "msm8994.dtsi"

> +/* Angler's firmware does not report where the memory is allocated */
> +/delete-node/ &cont_splash_mem;
> +
>  / {
>  	model = "Huawei Nexus 6P";
>  	compatible = "huawei,angler", "qcom,msm8994";
