Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0982020292A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jun 2020 08:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729367AbgFUGpE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 Jun 2020 02:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729343AbgFUGpD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 Jun 2020 02:45:03 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F0AC061795
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2020 23:45:03 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e8so1381870pgc.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2020 23:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=osTb1fwq44iccUp7hotNVHhBAPFuB/3ogsSLu+R5RqU=;
        b=WP3cfbjwxKhNOAKg7Fg1MyP+00tJ6Lv3jB7fl2KRarxmTexkjlEpr1gZiebJNJyiZT
         dfxNHDIC/WSlUZxrICNo+0jME8zYdANfXsSl1m9+eTxiOJVUgvZePxoNaZnhjf0MEAEu
         bIaxUtwnGBXsQl1+0QDfDsHR12DVvkKaFO74hEfpx+UTC7lWagCAxR0jvn6kzopuR46g
         T06r83oD2NglatzJ/GySEnouPjfjr4lvwBGRg+lO7SrDTyBVbm45NS7pjP6iuJH1q14m
         8a5Jm1SB+IoedLolEwPYgtZXo6SVXlvpMAX+Pwk4wisZCqLeK5kMRC8Qrv0pUCw40FOO
         OI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=osTb1fwq44iccUp7hotNVHhBAPFuB/3ogsSLu+R5RqU=;
        b=cltBJriU8+7CgcOUsjKQtrXKj04RtFiNm4sNzvZP3ceSEkYXsBGPCIlbWKreXdMSr0
         OqoQLQxEWQtSLOvSQNlzVTZWX1Z1NGBWmece2WNN1d5oY0OE+ut+U3fna5YZk7O3LWmT
         NsCDUXNhrSE1aBOvl9OoMHLrnJlQUHFxSD/6g6PWH/A175ewOH4RUrcukoFNTRFGvjOe
         0/Q8RBKEiMLuSPTXb2wc3cnC8d6GnZL4xCMy8Wxr+0UToXkrz+SVBia7NilYfC6pxexF
         uujsF7F/iOaHGH4NvUVGvsxN0DTLJMv3OkYlv61QUMru37YRDcWIGj7p4FjqtzS+kWM6
         UIeQ==
X-Gm-Message-State: AOAM530lis/fUOwMTVMvT9Ycs+vu/9YRIetL/iyzMMFvma2vD03UooLz
        cChKt94VVLspPcQ37QPzanfRqQ==
X-Google-Smtp-Source: ABdhPJw9LN0E2pS43SPNSywYcib2HaTFIglDSk3ij155rFRLsVzVMkSdN1yLI9/ZsvXLTgdMUmyvNg==
X-Received: by 2002:a63:af50:: with SMTP id s16mr8905598pgo.365.1592721902798;
        Sat, 20 Jun 2020 23:45:02 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a7sm9849188pjd.2.2020.06.20.23.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 23:45:01 -0700 (PDT)
Date:   Sat, 20 Jun 2020 23:42:14 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 1/7] arm64: dts: qcom: pm8009: Add base dts file
Message-ID: <20200621064214.GA128451@builder.lan>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 03 Jun 17:43 PDT 2020, Dmitry Baryshkov wrote:

> Add base DTS file for pm8009 along with GPIOs and power-on nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8009.dtsi | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pm8009.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8009.dtsi b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> new file mode 100644
> index 000000000000..9f3e19b5bd00
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/pm8009.dtsi
> @@ -0,0 +1,40 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2019, Linaro Limited
> + */
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/spmi/spmi.h>
> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
> +
> +&spmi_bus {
> +	pmic@a {
> +		compatible = "qcom,pm8009", "qcom,spmi-pmic";
> +		reg = <0xa SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		power-on@800 {

Please name this "pon", just for consistency.

> +			compatible = "qcom,pm8916-pon";

Can you confirm that pm8009 is subtype 1, and hence the reboot reason
going into RB_SPARE should be shifted 2 steps, rather than 1 as in the
newer PMICs?

Would be nice if we had a generic compatible that read the subtype,
rather than having to add new compatibles for each pmic (or use the old
ones)...

Regards,
Bjorn

> +			reg = <0x0800>;
> +		};
> +
> +		pm8009_gpios: gpio@c000 {
> +			compatible = "qcom,pm8005-gpio";
> +			reg = <0xc000>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +
> +	pmic@b {
> +		compatible = "qcom,pm8009", "qcom,spmi-pmic";
> +		reg = <0xb SPMI_USID>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +	};
> +};
> -- 
> 2.26.2
> 
