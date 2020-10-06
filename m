Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA85D28522A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 21:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbgJFTNF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 15:13:05 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:38783 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgJFTNF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 15:13:05 -0400
Received: by mail-oi1-f193.google.com with SMTP id 26so13779044ois.5;
        Tue, 06 Oct 2020 12:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gQ2ktDJGEeFM3h8T9B6y0y8BdmKCksK+/sMYqWj0X2Q=;
        b=T6NET71QkVogpk2c/uwNt7XzqY88FShKTx7+/nTr1GpcQ9nYzn8yaBA3kaJIJuLYEq
         Yri6DMCQhXe1eAChDalxnEOPbdH/oeqtr15eVTmFAaIPjzEtoZieAE8VXGlZWexEDro6
         gk5K8kCrMGbNGLju9gOG67NXPcmoS+Gf+A9Grx1MhvzRO3uJu2N8k8OvDnSHq6ZJjDXJ
         FTagXlefgsh44LUV76WKA4iIlp/0uO5OEW356eg7JtRb192Nj5BaMH7X//oytBo9uE92
         p7kh7lclmOcALzushFZrNh9vKlTejvPrLfSkgof6HBUBlsqj5GqwOk90Vywd/OuPnXP8
         pKhQ==
X-Gm-Message-State: AOAM530XACZ8HiOmD51k/EKhmpoPP0AHz4fp63pWv42PaYD5x6jnX90i
        1bv3PKkRfELv10qvrifAOg==
X-Google-Smtp-Source: ABdhPJzS1sWkVbVnu4ENueybstx38Y7NDNmZgFYCtTD6rgOqGcMqCr+fGLnhC6bD5bXUcCMzLdyByQ==
X-Received: by 2002:aca:c40c:: with SMTP id u12mr3737079oif.158.1602011583784;
        Tue, 06 Oct 2020 12:13:03 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l3sm1480866oth.36.2020.10.06.12.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:13:02 -0700 (PDT)
Received: (nullmailer pid 2661432 invoked by uid 1000);
        Tue, 06 Oct 2020 19:13:02 -0000
Date:   Tue, 6 Oct 2020 14:13:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jun Nie <jun.nie@linaro.org>
Cc:     devicetree@vger.kernel.org, georgi.djakov@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, shawn.guo@linaro.org
Subject: Re: [PATCH 3/5] dt-bindings: interconnect: single yaml file for RPM
 interconnect drivers
Message-ID: <20201006191302.GA2659485@bogus>
References: <20200930081645.3434-1-jun.nie@linaro.org>
 <20200930081645.3434-4-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930081645.3434-4-jun.nie@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Sep 30, 2020 at 04:16:43PM +0800, Jun Nie wrote:
> MSM8916 and QCS404 bindings are almost identical, so combine them into one.
> This will make it easier to add interconnect bindings for more SoC with RPM.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  .../bindings/interconnect/qcom,qcs404.yaml    | 77 -------------------
>  .../{qcom,msm8916.yaml => qcom,rpm.yaml}      | 24 +++---
>  2 files changed, 14 insertions(+), 87 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interconnect/qcom,qcs404.yaml
>  rename Documentation/devicetree/bindings/interconnect/{qcom,msm8916.yaml => qcom,rpm.yaml} (76%)
> 
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.yaml b/Documentation/devicetree/bindings/interconnect/qcom,qcs404.yaml
> deleted file mode 100644
> index 3fbb8785fbc9..000000000000
> --- a/Documentation/devicetree/bindings/interconnect/qcom,qcs404.yaml
> +++ /dev/null
> @@ -1,77 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/interconnect/qcom,qcs404.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Qualcomm QCS404 Network-On-Chip interconnect
> -
> -maintainers:
> -  - Georgi Djakov <georgi.djakov@linaro.org>
> -
> -description: |
> -  The Qualcomm QCS404 interconnect providers support adjusting the
> -  bandwidth requirements between the various NoC fabrics.
> -
> -properties:
> -  reg:
> -    maxItems: 1
> -
> -  compatible:
> -    enum:
> -      - qcom,qcs404-bimc
> -      - qcom,qcs404-pcnoc
> -      - qcom,qcs404-snoc
> -
> -  '#interconnect-cells':
> -    const: 1
> -
> -  clock-names:
> -    items:
> -      - const: bus
> -      - const: bus_a
> -
> -  clocks:
> -    items:
> -      - description: Bus Clock
> -      - description: Bus A Clock
> -
> -required:
> -  - compatible
> -  - reg
> -  - '#interconnect-cells'
> -  - clock-names
> -  - clocks
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -      #include <dt-bindings/clock/qcom,rpmcc.h>
> -
> -      bimc: interconnect@400000 {
> -              reg = <0x00400000 0x80000>;
> -              compatible = "qcom,qcs404-bimc";
> -              #interconnect-cells = <1>;
> -              clock-names = "bus", "bus_a";
> -              clocks = <&rpmcc RPM_SMD_BIMC_CLK>,
> -                       <&rpmcc RPM_SMD_BIMC_A_CLK>;
> -      };
> -
> -      pnoc: interconnect@500000 {
> -             reg = <0x00500000 0x15080>;
> -             compatible = "qcom,qcs404-pcnoc";
> -             #interconnect-cells = <1>;
> -             clock-names = "bus", "bus_a";
> -             clocks = <&rpmcc RPM_SMD_PNOC_CLK>,
> -                      <&rpmcc RPM_SMD_PNOC_A_CLK>;
> -      };
> -
> -      snoc: interconnect@580000 {
> -            reg = <0x00580000 0x23080>;
> -            compatible = "qcom,qcs404-snoc";
> -            #interconnect-cells = <1>;
> -            clock-names = "bus", "bus_a";
> -            clocks = <&rpmcc RPM_SMD_SNOC_CLK>,
> -                     <&rpmcc RPM_SMD_SNOC_A_CLK>;
> -      };
> diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8916.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
> similarity index 76%
> rename from Documentation/devicetree/bindings/interconnect/qcom,msm8916.yaml
> rename to Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
> index e1009ae4e8f7..e9f856357822 100644
> --- a/Documentation/devicetree/bindings/interconnect/qcom,msm8916.yaml
> +++ b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
> @@ -1,28 +1,32 @@
>  # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/interconnect/qcom,msm8916.yaml#
> +$id: http://devicetree.org/schemas/interconnect/qcom,rpm.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm MSM8916 Network-On-Chip interconnect
> +title: Qualcomm RPM Network-On-Chip Interconnect
>  
>  maintainers:
>    - Georgi Djakov <georgi.djakov@linaro.org>
>  
>  description: |
> -  The Qualcomm MSM8916 interconnect providers support adjusting the
> -  bandwidth requirements between the various NoC fabrics.
> +   RPM interconnect providers support system bandwidth requirements through
> +   RPM processor. The provider is able to communicate with the RPM through
> +   the RPM shared memory device.
>  
>  properties:
> -  compatible:
> -    enum:
> -      - qcom,msm8916-bimc
> -      - qcom,msm8916-pcnoc
> -      - qcom,msm8916-snoc
> -
>    reg:
>      maxItems: 1
>  
> +  compatible:
> +        enum:

Wrong indentation...

With that fixed,

Reviewed-by: Rob Herring <robh@kernel.org>

> +          - qcom,msm8916-bimc
> +          - qcom,msm8916-pcnoc
> +          - qcom,msm8916-snoc
> +          - qcom,qcs404-bimc
> +          - qcom,qcs404-pcnoc
> +          - qcom,qcs404-snoc
> +
>    '#interconnect-cells':
>      const: 1
>  
> -- 
> 2.17.1
> 
