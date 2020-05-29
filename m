Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16ABD1E7361
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 05:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391771AbgE2DEe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 23:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391625AbgE2DE3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 23:04:29 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9B35C08C5C8
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:04:28 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id v2so503405pfv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 20:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8xnwP1t+ruZe8UGntoayP591FrI5aOKGvpZTh6b1Dng=;
        b=ANaOKVpaw8RWIIAw5Nn3+RqlSqr6B8oVeRIq0P+LTuE0FNvsqfcDpUFey2010Vq3yE
         mCOXuxqeM/n5TzC+12GOMRyNFQjt5nvnUYhVlus6r+QzEQGmuacQglvGarT+Hd95Yjv3
         UP7O8pjss0XJgmlzcolQfiKOLxm2fYnQLY1KAejwYqtIYSpkBLdLmpSpu+pLTODC/Zcn
         4O1SODT2WTZmV/421ddTsx75YT48MCh+4KltWj7iwO+77xKTNLMLxbEakm/FcNUZo+5S
         ikSqjnpo712GUb7kT2+PdUFV4xP/wtB2SZYwPkndingoRY8iy7fm5OiBMfbTkugNazsm
         YpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8xnwP1t+ruZe8UGntoayP591FrI5aOKGvpZTh6b1Dng=;
        b=e78tBhWdTHrbMhk4gdThtmdlEUe74jkfNlhH8JBe8j4QWidQr2n6Ilqy9D22Ckos/B
         7amgvqqnhu+NBFQwTZHj8rsHxIoAh6wxnv/fek2PaCTPg8sYmFrgfEyA5+s4yn2UD/FA
         S4eD2JTxCPQLHP6AyDjmcMShFY79xp6NOYK2kcSeBbnX+BIgiQN7z6VXPKnyasrvzU2y
         w/gi0ZE9Ho+4uXTcb77HjLcyT+t2wUec6oXl59XlxZC25ecbNjHa8Jr2RAnvS8h6TqXc
         hacGcXpLtElmG3DfiFxVgo+UQ9y+lnr30kaxdub65bh5gF9heQhgK0YQZeyLqU4UDRma
         Q4hg==
X-Gm-Message-State: AOAM533kHWTih9VSurnlPr5Gp2AUQaNO/wU5xxtHsnhBPpQJkKkHLyt1
        EWzeQjcW4BkE51uwVhZvTG9O2ttidQc=
X-Google-Smtp-Source: ABdhPJxknV81iR00xuGsBkt0F52CBo4Lo6zw5LEjkwL9BGdkEQcdZ+OKSvGQOMa/+LcDpgDTItlhBQ==
X-Received: by 2002:a65:6902:: with SMTP id s2mr5598243pgq.199.1590721468219;
        Thu, 28 May 2020 20:04:28 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 62sm6030116pfc.204.2020.05.28.20.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 20:04:27 -0700 (PDT)
Date:   Thu, 28 May 2020 20:03:22 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: add sm8250 hdk dts
Message-ID: <20200529030322.GX279327@builder.lan>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-7-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200524023815.21789-7-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 23 May 19:38 PDT 2020, Jonathan Marek wrote:

> Add initial HDK865 dts, based on sm8250-mtp, with a few changes.
> Notably, regulator configs are changed a bit.
> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  arch/arm64/boot/dts/qcom/Makefile       |   1 +
>  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 ++++++++++++++++++++++++
>  2 files changed, 455 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index e5dbd8b63951..4649e8bc5034 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -24,6 +24,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> new file mode 100644
> index 000000000000..d35014bf4f81
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> @@ -0,0 +1,454 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "sm8250.dtsi"
> +#include "pm8150.dtsi"
> +#include "pm8150b.dtsi"
> +#include "pm8150l.dtsi"
> +
> +/ {
> +	model = "Qualcomm Technologies, Inc. SM8250 HDK";
> +	compatible = "qcom,sm8250-hdk";

	compatible = "qcom,sm8250-hdk", "qcom,sm8250";

Apart from that this looks good!

Thanks,
Bjorn
