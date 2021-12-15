Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3C947516D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 04:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239597AbhLODj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 22:39:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhLODjz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 22:39:55 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DDAC061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 19:39:55 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id n66so29887105oia.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Dec 2021 19:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NEe/B/3VLf2rpMckpG0khDxSTufzHtlKFX7zZvr7A4s=;
        b=ShAmEtRylPZNs4eNOR1gxnINvkpO7kDQyhrVIFKwAptqwLgpI3ZIlq4j7bccucN85t
         vUnziLyLxfiolsUpaSq9Zm5l9Ph8D5IoMPVihtGKxRCns1D79g9HTccrRRSlx4VXMg7s
         Lg1P67ZZzLCElKIgLkUv17JNhTd+ajQaHLYkw/rU37gv69umcGOB28y4lnsdQWlOimct
         DS2ISjeMxQHh6sn76t0F3jx7inEy9bWlsWNwIhdcVfMWzucnfqXYRnka/X32WEwGVbLO
         YNxgU0sc15zv/VqNNd+ArDjQoTnWu27lJTFmjP4SkzjoA2RoUymTmqWrQ4CWvpps/QV6
         /AlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NEe/B/3VLf2rpMckpG0khDxSTufzHtlKFX7zZvr7A4s=;
        b=FqKdSvKdrwXdJ7dZQrD1gnhC9GtGIrU561jaujFh0HbgnkRhrFPSzo3wYuFyFdGbT2
         ULY1HbFDy5k5lpBfIlZ0eo4xkWmT2rz2HkVjNFKxM92MNAQbrFQXfJNdzyfTDV1gPgcV
         C1rOWVhuz6BEuwiGAlH/fiKLiC6j+P2VMTMjbffAcvqYOZ9zWE/jOe/4+gfXAw1+4K1K
         T11/E/4Segcx9u/LI8ePKC6/8+cHRPfopXIVN1lGYDTKuoY8QP3fz9wHphCnDS4ZfYsR
         glUpEA4E8nicv9FrmZHraUq89suOWvs1mFgs0TRw1Nk9n0zQGcgxXQT+NrybSqZv4X67
         m89w==
X-Gm-Message-State: AOAM533r7FgWVZbkGxwfSoNeDj/OW3TMshGwkXlCV6gnu1uoJOrsRn9R
        7PqxnVUMokHBBkzbGMdMi/QkXQ==
X-Google-Smtp-Source: ABdhPJzOLgv1wlzmcl5qH1siiYzaJnoSEtsP2AjOWnAtuggmAuLVDyHNbgiWOdHJy3jI5j3OUrKofw==
X-Received: by 2002:a05:6808:2216:: with SMTP id bd22mr7216532oib.27.1639539594489;
        Tue, 14 Dec 2021 19:39:54 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j20sm156784oig.52.2021.12.14.19.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 19:39:54 -0800 (PST)
Date:   Tue, 14 Dec 2021 21:39:49 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, shawn.guo@linaro.org
Subject: Re: [PATCH v2 1/2] clk: qcom: Add display clock controller driver
 for QCM2290
Message-ID: <YbljhR2O9zkvvRZ1@builder.lan>
References: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1639058951-12660-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 09 Dec 08:09 CST 2021, Loic Poulain wrote:
[..]
> diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
[..]
> +static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
> +	.cmd_rcgr = 0x2074,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = disp_cc_parent_map_3,
> +	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "disp_cc_mdss_mdp_clk_src",
> +		.parent_data = disp_cc_parent_data_3,
> +		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_ops,

Clocks that are marked enable_safe_config = true downstream needs to be
parked onto a safe parent as they are being disabled.

This is taken care of upstream by using clk_rcg2_shared_ops.

> +	},
> +};
> +
[..]
> diff --git a/include/dt-bindings/clock/qcom,dispcc-qcm2290.h b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
> new file mode 100644
> index 00000000..ef50c17
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dispcc-qcm2290.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SCUBA_H
> +#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SCUBA_H

Please replace SCUBA here and can you please move the include file to
the DT binding patch instead?

Regards,
Bjorn
