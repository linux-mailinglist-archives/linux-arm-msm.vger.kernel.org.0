Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6296170774
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2019 19:37:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727247AbfGVRhg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jul 2019 13:37:36 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40546 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbfGVRhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jul 2019 13:37:36 -0400
Received: by mail-io1-f66.google.com with SMTP id h6so75735720iom.7;
        Mon, 22 Jul 2019 10:37:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VpXpDXWGUnEbnNjbvmDik4XWZT/z/T8Q2obmm5H0VtU=;
        b=Zyx0UwrPw5ryyafnjWJudh4SKCRFy3pu748W//qWeCkom/kSKXMr+st7nJjrJITYlW
         VbhZTn8d71g5Hwp0Ngr3w4WWa4z3FoYQ+FCnnhT4/3+OYmsMdEEQcLIIPO8EjKwXfdkv
         byAZmLZC2gV3OooAolZZqHvLtji7DzpP8Vzw9lg+fnTlSL30CwVXrIElz9CQM5Gt9Onv
         ENlBdpNl7n9JD326LGCVbykzNk2/rx29OcMeEnbmJO3tMqAk4fhUFQQDi3Ze+JJh5UKL
         qzUogJ8oRRyz63LFWg1lwr7VfmEIzOSVl5fzt/rYGE2QJ0e7/pIkg+kVIqzpKMVLJfl8
         psxg==
X-Gm-Message-State: APjAAAX4n9QOc8SM17NUKc8AicGvi8KqKfef8hWEZhLX2qUqLxEpc12c
        F8RtqzAX+MSu/XpjNI6yag==
X-Google-Smtp-Source: APXvYqwmek+vXZCcjsZgE1r3YOhwQ19LnhrG4EPPZJhMevq/DibD43eSIH25v+qNGRvRGiYaMF1ALA==
X-Received: by 2002:a02:340d:: with SMTP id x13mr74999304jae.125.1563817055355;
        Mon, 22 Jul 2019 10:37:35 -0700 (PDT)
Received: from localhost ([64.188.179.254])
        by smtp.gmail.com with ESMTPSA id x22sm28803813ioh.87.2019.07.22.10.37.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 10:37:34 -0700 (PDT)
Date:   Mon, 22 Jul 2019 11:37:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     agross@kernel.org, robdclark@gmail.com, sean@poorly.run,
        bjorn.andersson@linaro.org, airlied@linux.ie, daniel@ffwll.ch,
        mark.rutland@arm.com, jonathan@marek.ca,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, jcrouse@codeaurora.org
Subject: Re: [PATCH v3 2/6] dt-bindings: display: msm: gmu: add optional
 ocmem property
Message-ID: <20190722173734.GA20285@bogus>
References: <20190626022148.23712-1-masneyb@onstation.org>
 <20190626022148.23712-3-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626022148.23712-3-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 25, 2019 at 10:21:44PM -0400, Brian Masney wrote:
> Some A3xx and A4xx Adreno GPUs do not have GMEM inside the GPU core and
> must use the On Chip MEMory (OCMEM) in order to be functional. Add the
> optional ocmem property to the Adreno Graphics Management Unit bindings.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v2:
> - Add a3xx example with OCMEM
> 
> Changes since v1:
> - None
> 
>  .../devicetree/bindings/display/msm/gmu.txt   | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.txt b/Documentation/devicetree/bindings/display/msm/gmu.txt
> index 90af5b0a56a9..e5596994df7b 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.txt
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.txt
> @@ -31,6 +31,10 @@ Required properties:
>  - iommus: phandle to the adreno iommu
>  - operating-points-v2: phandle to the OPP operating points
>  
> +Optional properties:
> +- ocmem: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> +         SoCs. See Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml.

You missed my comment on v1 about using 'sram'...

> +
>  Example:
>  
>  / {
> @@ -63,3 +67,49 @@ Example:
>  		operating-points-v2 = <&gmu_opp_table>;
>  	};
>  };
> +
> +a3xx example with OCMEM support:
> +
> +/ {
> +	...
> +
> +	gpu: adreno@fdb00000 {
> +		compatible = "qcom,adreno-330.2",
> +		             "qcom,adreno";
> +		reg = <0xfdb00000 0x10000>;
> +		reg-names = "kgsl_3d0_reg_memory";
> +		interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "kgsl_3d0_irq";
> +		clock-names = "core",
> +		              "iface",
> +		              "mem_iface";
> +		clocks = <&mmcc OXILI_GFX3D_CLK>,
> +		         <&mmcc OXILICX_AHB_CLK>,
> +		         <&mmcc OXILICX_AXI_CLK>;
> +		ocmem = <&ocmem>;
> +		power-domains = <&mmcc OXILICX_GDSC>;
> +		operating-points-v2 = <&gpu_opp_table>;
> +		iommus = <&gpu_iommu 0>;
> +	};
> +
> +	ocmem: ocmem@fdd00000 {
> +		compatible = "qcom,msm8974-ocmem";
> +
> +		reg = <0xfdd00000 0x2000>,
> +		      <0xfec00000 0x180000>;
> +		reg-names = "ctrl",
> +		             "mem";
> +
> +		clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +		         <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +		clock-names = "core",
> +		              "iface";
> +
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +
> +		gmu-sram@0 {
> +			reg = <0x0 0x100000>;
> +		};
> +	};
> +};
> -- 
> 2.20.1
> 
