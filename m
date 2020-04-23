Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22B4A1B53FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2020 07:11:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726665AbgDWFLi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Apr 2020 01:11:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725961AbgDWFLh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Apr 2020 01:11:37 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C395C03C1AB
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 22:11:37 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id z1so669068pfn.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2020 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Yc32X/aAdo81NM2Ng9MB4yytdXrsHIlLZZkusOtg3Cs=;
        b=HYR8W91YkdfQ9BEpxvoJ5lEIoU1HlVsx791SaNb8KhkRjX5eUuy9Pd2WX1d3OmH97O
         /vCcw8DQ4uN1FVcJ6eiXVfi0UcZuAF4vYq+rlKq6Lt1tg2PDkc4xoz1lPJBy/K3YUJ8I
         a6dAPtHj/hGnN1ZrsqZt1HIBFvuUFsXvGYRDmHIsGi6wTXnrxdCYiCRFRJk0I5F+mPLW
         jUpzwIhX7M+uqTdIp2OwsVghV6fP0stzWOvj8iwnAIuyGIsj07OwIvqab8w3P+bu8f4C
         jlNTqVVIB621Al0poCevGGza6pg7o5sEFwsFqSX3zXEO17HkSUm570gpQhGFS5A5HX2A
         8fZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Yc32X/aAdo81NM2Ng9MB4yytdXrsHIlLZZkusOtg3Cs=;
        b=bB+SgYWh+PTX4pAEJhcoyNH0vBzU8L+ENjXlK0UsCHQy2XvNTmOq57e0vZuPTP7WlB
         ee5w8w0Yp7Q+X4hzk7FXRDKJGjIq1OUrDxpqGELQzdN4M/22WEfx6JVX3oODNwPRcge6
         hP+PRXa3qLeiJzRjHOlcQ3b2O7mxH2lmrSgrV5XuylsuNKzLcq1r9O75GVOONh/5lqcc
         XcuMOgp/r1rGhMFxR2+uA012gpCnZ6wbdhn5mwqalUlQx69SPrvRhREJ1KpCMRLH6Bho
         tihkoTnruHgw3L8XAJXwsg/huzQgErQLxCqRUuTZ+ppRHtzaHFuxfpChPI4XCKOWGcfz
         8fUA==
X-Gm-Message-State: AGi0Pub7MchQoC/1eToH/QUeZlvM9NhFe8cMtQQY7vDSsdwEILh8sKYd
        16zCSv72V1RXvNRP3pHKMgreuw==
X-Google-Smtp-Source: APiQypLLlBRF6h5e5tqeCuF1xkPBkYwn9ONGOEDPFznQbi6y+fM664bxJYpObA+MQw707I67sCzrUA==
X-Received: by 2002:aa7:9d90:: with SMTP id f16mr2201897pfq.48.1587618697014;
        Wed, 22 Apr 2020 22:11:37 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r26sm1344769pfq.75.2020.04.22.22.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2020 22:11:36 -0700 (PDT)
Date:   Wed, 22 Apr 2020 22:12:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mike Leach <mike.leach@linaro.org>
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        coresight@lists.linaro.org, mathieu.poirier@linaro.org,
        suzuki.poulose@arm.com
Subject: Re: [PATCH] dt-bindings: qcom: Add CTI options for qcom msm8916
Message-ID: <20200423051203.GA2166963@builder.lan>
References: <20200415201230.15766-1-mike.leach@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415201230.15766-1-mike.leach@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 15 Apr 13:12 PDT 2020, Mike Leach wrote:

> Adds system and CPU bound CTI definitions for Qualcom msm8916 platform
> (Dragonboard DB410C).
> System CTIs 2-11 are omitted as no information available at present.
> 
> Tested on Linux 5.7-rc1.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Thanks Mike, I adjusted subject and have applied the patch towards 5.8.

Regards,
Bjorn

> ---
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 85 +++++++++++++++++++++++++--
>  1 file changed, 81 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index a88a15f2352b..194d5e45f4e5 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/reset/qcom,gcc-msm8916.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/thermal/thermal.h>
> +#include <dt-bindings/arm/coresight-cti-dt.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -1424,7 +1425,7 @@
>  			cpu = <&CPU3>;
>  		};
>  
> -		etm@85c000 {
> +		etm0: etm@85c000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85c000 0x1000>;
>  
> @@ -1443,7 +1444,7 @@
>  			};
>  		};
>  
> -		etm@85d000 {
> +		etm1: etm@85d000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85d000 0x1000>;
>  
> @@ -1462,7 +1463,7 @@
>  			};
>  		};
>  
> -		etm@85e000 {
> +		etm2: etm@85e000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85e000 0x1000>;
>  
> @@ -1481,7 +1482,7 @@
>  			};
>  		};
>  
> -		etm@85f000 {
> +		etm3: etm@85f000 {
>  			compatible = "arm,coresight-etm4x", "arm,primecell";
>  			reg = <0x85f000 0x1000>;
>  
> @@ -1500,6 +1501,82 @@
>  			};
>  		};
>  
> +		/* System CTIs */
> +		/* CTI 0 - TMC connections */
> +		cti@810000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x810000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		/* CTI 1 - TPIU connections */
> +		cti@811000 {
> +			compatible = "arm,coresight-cti", "arm,primecell";
> +			reg = <0x811000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		/* CTIs 2-11 - no information - not instantiated */
> +
> +		/* Core CTIs; CTIs 12-15 */
> +		/* CTI - CPU-0 */
> +		cti@858000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0x858000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU0>;
> +			arm,cs-dev-assoc = <&etm0>;
> +
> +		};
> +
> +		/* CTI - CPU-1 */
> +		cti@859000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0x859000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU1>;
> +			arm,cs-dev-assoc = <&etm1>;
> +		};
> +
> +		/* CTI - CPU-2 */
> +		cti@85a000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0x85a000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU2>;
> +			arm,cs-dev-assoc = <&etm2>;
> +		};
> +
> +		/* CTI - CPU-3 */
> +		cti@85b000 {
> +			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
> +				     "arm,primecell";
> +			reg = <0x85b000 0x1000>;
> +
> +			clocks = <&rpmcc RPM_QDSS_CLK>;
> +			clock-names = "apb_pclk";
> +
> +			cpu = <&CPU3>;
> +			arm,cs-dev-assoc = <&etm3>;
> +		};
> +
> +
>  		venus: video-codec@1d00000 {
>  			compatible = "qcom,msm8916-venus";
>  			reg = <0x01d00000 0xff000>;
> -- 
> 2.17.1
> 
