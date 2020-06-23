Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D67A206864
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:29:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387840AbgFWX3w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387710AbgFWX3v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:29:51 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA13C061795
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:29:49 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k1so164251pls.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3lh416h2e2kRb2/LsSBkohB356M1N+qOaKq6eORI8us=;
        b=uXmuk7ehxvRGsVHcL8khoLVr4fOZ234FwxAOIKq0i00gIufVBnljLcwkTf71j03Sws
         w4Box+7A1mgbNGYRvSnGSba1SBoDmmxbvB8Wp3RQErSOjMHJHffkZhL93sViBBQGgOs/
         7pTWUApqFWxLZ+4pfw96IfZE0YWWR8Jf4ZXqXbYFrwk86ApHfQGr4xO5YG9gxiOAe0ph
         XJPFllehb17BKtehRI19Vl04GuPoibrzb02ok3K3eIgIgr+vv3wWpkFeIjeTUqzjtZFi
         2iZ3qwRQ9vUSbOPiAULPC47O+7DxsfFbnl82x0ePTdu8FJlGJyUs5x3qqooFhSiZYkXG
         WIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3lh416h2e2kRb2/LsSBkohB356M1N+qOaKq6eORI8us=;
        b=eGQZlZYq56lpa6RXrwYAxWTCRTYUXSh9Y2+WehjTkavEMejCQ7mLe0k7iykTma2gsg
         jkn27UZJ75uq/M6dHkbW9IxLNhWvRnOBULiJF9nyBc9zxfE80uqhdPHYLNrRx/hEnH0L
         CE8m1/4IIpsZbGeyM4PKhYqkMh3RrhWZUr+ZZzHkjZs751rZBvjZTEAn7e11fxWOOv/F
         al9jVnCCELN0TGsVbUfFBCExeLfjdM/Pl2vMMMrTd9tizJxCP+r/mrKYzDq6eftsfIG6
         WGCKEScfIzag0Mricnw6Vh5WdfOJkZw3IUnBok63ow/YrZhFxoP8j5K3sGCgJEZqj8Pk
         fSHw==
X-Gm-Message-State: AOAM533wZfgobfAcwzcolV1GVOnqBFJxbhAWYnD2tvQyyp8T10V9Ul2G
        FmU8x6JH0NpU3/8aGZZmpnuhqg==
X-Google-Smtp-Source: ABdhPJw3mIyTGvmU4iMJz6YtqydnFmB4TE6mvoU592WVL56jB50WHwDXCBzDiEAPcEzosMiKF6Yt8Q==
X-Received: by 2002:a17:90a:4a6:: with SMTP id g35mr25710525pjg.155.1592954988826;
        Tue, 23 Jun 2020 16:29:48 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m14sm15058323pgn.83.2020.06.23.16.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:29:48 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:27:05 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/12] arm64: dts: qcom: Add support for Sony Xperia
 Z5 (SoMC Sumire-RoW)
Message-ID: <20200623232705.GR128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-13-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-13-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
> new file mode 100644
> index 000000000000..e70d54ed7325
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
> @@ -0,0 +1,395 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2020, Konrad Dybcio
> + */
> +
> +/dts-v1/;
> +
> +#include "msm8994.dtsi"
> +#include "pm8994.dtsi"
> +#include "pmi8994.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/gpio-keys.h>
> +
> +/ {
> +	model = "Sony Xperia Z5";
> +	compatible = "somc,sumire-row", "qcom,msm8994";
> +	/* required for bootloader to select correct board */
> +	qcom,msm-id = <0xcf 0x20001>;
> +	qcom,pmic-id = <0x10009 0x1000a 0x00 0x00>;
> +	qcom,board-id = <8 0>;
> +
> +	/* Xperia Z5's firmware doesn't support PSCI */
> +	/delete-node/ psci;

This does worry me...

[..]
> +&pm8994_regulators {

Per earlier patches, please update the way regulators are described.

Regards,
Bjorn
