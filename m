Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF86390EC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 05:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhEZDS2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 23:18:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhEZDS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 23:18:28 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A3BC061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 20:16:57 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 80-20020a9d08560000b0290333e9d2b247so20130111oty.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 May 2021 20:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=U+llC3H9ewt+9+FjEtNR30CliD36RkVFaCzKamdgsHE=;
        b=oZyqgpzra5Ckjdy56z/B2oBIg1DMpJjRvej/zS6LPiLFap8rgrLXR/0gw6bfymYWol
         AWV3J+wa6g3K/WinXlapXF4Ha7c0dQOM5ZStvp0CyYkjJWyx88Otmmza2/mNX1PgEaof
         X2GuWyjfbQEbU90HSl90YkxmykcRPjy09U41u3FAEuYFcgnbnziuBUfnntwneqSziYCv
         UUbXh8OJWRAuGgMVey21NLxN+FRVCwRT28KH+dlhepH7lyVtclpIC7zGr7D2qr680ZwI
         DTw9rmu1iX5vQHgf4dSNmysq/NhFQspKLndBboaV4AuHsXfY901mlCSKxLGVjSVfhcHj
         P3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U+llC3H9ewt+9+FjEtNR30CliD36RkVFaCzKamdgsHE=;
        b=B/zzVrv2hoGlAUkdrE637kaIEOzVqkWaH5KKTYVcjtDW8NZvqLgou0lnBRPeCFMp4F
         IK8T/7BiLhyE0mG8SNVwoBWid+CsebWKCfSlJxrROPBiCBGbfXyrhiOchbPGCezW5Uy+
         h+89JBUv6QIzoDC4TPZLb9KoD8rvQ8hNM1054WuadyIe2oOfefwR1Opjkq2/dBpnzrIj
         R2bGcrDd4w6v2cuxGWH5kxCkooBOLZgvbTUAy7jCq9Qf+9i7zUTgPSQGB7ykCE4yIowF
         DYt39EI0BdjlIXNr5I3mHIr3N0IUNF9jFici7T5rhlf/6YkbUWKRf3e4EV+bxwa0Fenl
         Qvrg==
X-Gm-Message-State: AOAM532PcO9L4ncdtjkG6hnj48JI1bW2YBrb9/A9n7uF8hRo5SdU47/H
        Q44bOMtiX5zxNbg2hNTW7KjEWA==
X-Google-Smtp-Source: ABdhPJzzIKS4MG7rPptVAUfmlV/IhDv2LsPdyJshMWCSxkwB/+DSGnHfNbhS4TIV7uh0UwPQLm9YVA==
X-Received: by 2002:a9d:a14:: with SMTP id 20mr654007otg.86.1621999016401;
        Tue, 25 May 2021 20:16:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l11sm3742134ooq.44.2021.05.25.20.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 20:16:56 -0700 (PDT)
Date:   Tue, 25 May 2021 22:16:54 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: Add PMI8996 DTSI file
Message-ID: <YK29phlOthp1GdUh@builder.lan>
References: <20210525200246.118323-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210525200246.118323-1-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 25 May 15:02 CDT 2021, Konrad Dybcio wrote:

> PMI8996 is *almost* the same hardware as PMI8994, say for some annoyances:
> 
> - Boards equipped with PMI8996 now have to include pmic-id (which wasn't the case before)
> - Different qpnp-ibb-discharge-resistor value (will be addressed after LABIBB is introduced)
> - Different inhibit-derating-ua value (will be addressed after BCL is introduced)
> - Different ramp_up_step value (will be addressed after [if?] QPNP Flash LED is introduced)
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/pmi8996.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pmi8996.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmi8996.dtsi b/arch/arm64/boot/dts/qcom/pmi8996.dtsi
> new file mode 100644
> index 000000000000..31b47209e261
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pmi8996.dtsi
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: GPL-2.0

Can we have this with BSD license (as well)?

> +/*
> + * Copyright (c) 2021, Konrad Dybcio <konrad.dybcio@somainline.org>
> + */
> +
> + /*
> +  * PMI8996 is a slight modification of PMI8994 with
> +  * some notable changes, like being the first PMIC
> +  * whose the bootloader has to check to continue booting
> +  * and a change to a LABIBB parameter.
> +  */
> +
> +/ {
> +	qcom,pmic-id = <0x20009 0x10013 0 0>;
> +};

So I'm supposed to include this and the pmi8994? I was expecting an
include of pmi8994.dtsi from here and then some override of the
necessary properties.

Regards,
Bjorn

> -- 
> 2.31.1
> 
