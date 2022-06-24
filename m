Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 186A9559F4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 19:26:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232157AbiFXRZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 13:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbiFXRZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 13:25:25 -0400
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com [IPv6:2001:4860:4864:20::2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB73881C57
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:23:35 -0700 (PDT)
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-101d2e81bceso4731653fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XbZbGNfhjt2oAj/A489g96X9oJYW0QO+shnAI190mdI=;
        b=XoIJcUUWicQDBxKC3woD+J63DN5sxq7Pqr+oVtUxMqwMx4eXujTcPUx8CNYqNCYu4z
         dDO2aECNhRmjWFWSAI7wS0sEYxVrgt2Sw5IO0QSctJ/2n5Gt+nsqNTG9zOkVtD6uUcWH
         7r8vkr0bSYftg4ku9svIF35kcLp5hQcXGcpSqCvJBQQdJjbFlTtWtormkMZdDWM7TmEK
         CzPNcDgCe/4H477IST0MQS+NIl/FLMTNbALaC/rJwLI0bqb73LM4MvPU7ej9lPiIRdaF
         6ZzP3Fv9jRmVZOBhc62vbziQHm+Ot4gSyBwPzDp2JZmv+JZRyi9RdcgyN8GQQD/NV8Da
         obIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XbZbGNfhjt2oAj/A489g96X9oJYW0QO+shnAI190mdI=;
        b=K5Uj44Mnxy/8bWsLWsiDmS+NZvg82sIymzQ8/DQmoHZRvh7KAKzq1zTIHNnp4Bqe3z
         lZSaBk6FmHJR99Zffp1jriYOOXdlZxQ5uyzqYxa2SLr1LoPMCA8xK9Vao4/1ag+w1AJ5
         gc2PjhC2YHRrkkICEf0esq8ARpGalvXpNckYOEn+uJp45vmFq2pcOLbVDHiVw6Injvg7
         AxQBZ1ebP5fzRr+M9yG3K19XmyKMsycHIe3JKX4V2gM3hOuGwTMLwTiQXkyQsIzmYLmz
         ED6K/WsUkZuTWftyLX9C6WTOXmW3+HzfT+2ttWPcWL8uuB47mq2hRv5ojaprsaiq+a2+
         LtFg==
X-Gm-Message-State: AJIora/8pEqNeDpYycRerKfGPUUKpD4fLumiPq+jjVEhB6czEpDF7wEV
        Pfo7TrvXL/UvgY5LSbM1oxTMvA==
X-Google-Smtp-Source: AGRyM1sKhr3pirbcv0CxaXGtVfvWOuyImVuIFPfkXT9D9ljaDRYy+4WEVjyBnifzu6Uu+nZl+ETnGw==
X-Received: by 2002:a05:6870:4348:b0:f1:ec31:10e7 with SMTP id x8-20020a056870434800b000f1ec3110e7mr41315oah.156.1656091412759;
        Fri, 24 Jun 2022 10:23:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j79-20020acaeb52000000b0032f0eb4aad5sm1387143oih.46.2022.06.24.10.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:23:32 -0700 (PDT)
Date:   Fri, 24 Jun 2022 12:23:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 2/7] arm64: dts: qcom: sm8450: Add description of
 camera clock controller
Message-ID: <YrXzEqtfLi2vmTXE@builder.lan>
References: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
 <20220624115917.2524868-3-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624115917.2524868-3-vladimir.zapolskiy@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 24 Jun 06:59 CDT 2022, Vladimir Zapolskiy wrote:

> Add description of QCOM SM8450 camera clock controller.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v7 to v8:
> * rebased on top of v5.19-rc2,
> * minor improvement to the commit message.
> 
> Changes from v6 to v7:
> * rebased on top of v5.19-rc1.
> 
> Changes from v5 to v6:
> * rebased on top of linux-next.
> 
> Changes from v3 to v5:
> * none.
> 
> Changes from v2 to v3:
> * account a renamed header file.
> 
> Changes from v1 to v2:
> * disabled camcc device tree node by default.
> 
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 7d08fad76371..fad813a21df5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8450.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8450-camcc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> @@ -2288,6 +2289,25 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  			};
>  		};
>  
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sm8450-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			status = "disabled";

Please put the status last.

Regards,
Bjorn

> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			clock-names = "iface",
> +				      "bi_tcxo",
> +				      "bi_tcxo_ao",
> +				      "sleep_clk";
> +			power-domains = <&rpmhpd SM8450_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8450-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> -- 
> 2.33.0
> 
