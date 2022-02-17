Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C29D94BA76D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 18:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243857AbiBQRtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 12:49:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231926AbiBQRtG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 12:49:06 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DB7291FB8
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 09:48:51 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id k3-20020a1ca103000000b0037bdea84f9cso4619071wme.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 09:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eA6IIhqYEfrRDuKOGshN1p14BWrOpnI8vaNPig+Er3U=;
        b=Z7Lvy/Lu0PgnLPUDuFPsdG49Zyk4N0fWd92pQXI2BU3ytXBKNzd+AoncQRZWkjzXbZ
         oxp4AAYZ1qPDAOmTUD4Ti47DXQMMtwT4+Qd767pUOA99nTaU6PHtqDb3tcKd0CcuVBrl
         5KGTiHLLJEjsVcJvTXRSy49WeEQ04aBzlIPZDYzvzssbiOJ6QHjoZTgr1/mw/YibIEFp
         PpyGXZABs9l0LsrBr4WR/YZl5zmsdVWuUGuhPDk3w4W4WWlXz+7CGL2svqs5EE5uQ+U8
         FYSNfFI79gOtkhewdBFZLQqcYqZeFdew3rJTLJ6tDdqvqP7slTd1dNFLv2M//KNbcWct
         X25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eA6IIhqYEfrRDuKOGshN1p14BWrOpnI8vaNPig+Er3U=;
        b=jPAaP3F8mluJSutDSXV/8Y1WXTsQuF18GRz2XSw4j/F5aTsMjGoZyhiy3BESCWLZf6
         Va/UOiatLo65nTX5RUF7QW0Lom1yq8C4bdzAnHDmGhdZnxjblpImivwYlzg1wrunTyTi
         29bWCL3cE/Pl0SP1wjjEVpzdoSIYL1Yn63gvKS0l99wauwuQbuyccnoL63hkja9aszgE
         O4z1e3Y7bCOMndL2fDY7ux5cr4YUdITkSWfFKbhVxuPBvl+fz0YmCf5tzwC/YKVGQwGw
         dhjaBW2l8TTMgLqcQVzC/gRz1obT/0RUhqebkq6GVttaAYenXbnum0BI29xe5TTm9Du8
         MqtA==
X-Gm-Message-State: AOAM531nahumvk3BZXBQFI6E0T2gKWycPEueSLbSp1HujshSWb/i0p9a
        nOT2rKq38sByxhvBUTR/7wwWM9xJ6z1blxWOPtYLtA==
X-Google-Smtp-Source: ABdhPJwwa3LmENnFrJD5FLhvk02XJs/Qc9bfHqvayUmoxC5bFLZFN14JD0xFcO6PeEfXXckQgirXkhtlEZYLaYPTxoI=
X-Received: by 2002:a05:600c:1f05:b0:37b:d9aa:e210 with SMTP id
 bd5-20020a05600c1f0500b0037bd9aae210mr7242831wmb.63.1645120130134; Thu, 17
 Feb 2022 09:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20220209105706.18852-1-quic_jinlmao@quicinc.com> <20220209105706.18852-5-quic_jinlmao@quicinc.com>
In-Reply-To: <20220209105706.18852-5-quic_jinlmao@quicinc.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Thu, 17 Feb 2022 17:48:39 +0000
Message-ID: <CAJ9a7ViO2S_sUCNaZ711SNDz-jmYiWxCBcBYOc-gVGkoCG-VDA@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] dt-bindings: arm: Adds CoreSight TPDM hardware definitions
To:     Mao Jinlong <quic_jinlmao@quicinc.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Leo Yan <leo.yan@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Hao Zhang <quic_hazha@quicinc.com>,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, 9 Feb 2022 at 10:57, Mao Jinlong <quic_jinlmao@quicinc.com> wrote:
>
> Adds new coresight-tpdm.yaml file describing the bindings required
> to define tpdm in the device trees.
>
> Signed-off-by: Tao Zhang <quic_taozha@quicinc.com>
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/coresight-tpdm.yaml          | 81 +++++++++++++++++++
>  .../devicetree/bindings/arm/coresight.txt     |  7 ++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/coresight-tpdm.yaml
>
> diff --git a/Documentation/devicetree/bindings/arm/coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/coresight-tpdm.yaml
> new file mode 100644
> index 000000000000..7ebc1bf7abc2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/coresight-tpdm.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +# Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/coresight-tpdm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Trace, Profiling and Diagnostics Monitor - TPDM
> +
> +description: |
> +  The TPDM or Monitor serves as data collection component for various dataset
> +  types specified in the QPMDA spec. It covers Implementation defined ((ImplDef),
> +  Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (CMB), and Discrete
> +  Single Bit (DSB). It performs data collection in the data producing clock
> +  domain and transfers it to the data collection time domain, generally ATB
> +  clock domain.
> +
> +  The primary use case of the TPDM is to collect data from different data
> +  sources and send it to a TPDA for packetization, timestamping, and funneling.
> +
> +maintainers:
> +  - Suzuki K Poulose <suzuki.poulose@arm.com>
> +  - Mathieu Poirier <mathieu.poirier@linaro.org>
> +
> +properties:
> +  $nodename:
> +    pattern: "^tpdm(@[0-9a-f]+)$"
> +  compatible:
> +    items:
> +      - const: qcom,coresight-tpdm
> +      - const: arm,primecell
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +   items:
> +     - const: apb_pclk
> +
> +  out-ports:
> +    description: |
> +      Output connections from the TPDM to legacy CoreSight trace bus.
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port:
> +        description: Output connection from the TPDM to legacy CoreSight
> +          Trace bus.
> +        $ref: /schemas/graph.yaml#/properties/port
> +

As we discussed in patch 0/10 of this set - the TDPM actually sends
data to TDPA - not to coresight. These descriptions should match that.

> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  # minimum TPDM definition.
> +  - |
> +    tpdm@6980000 {
> +      compatible = "qcom,coresight-tpdm", "arm,primecell";
> +      reg = <0x6980000 0x1000>;
> +
> +      clocks = <&aoss_qmp>;
> +      clock-names = "apb_pclk";
> +
> +      out-ports {
> +        port {
> +          tpdm_turing_out_funnel_turing: endpoint {
> +            remote-endpoint =
> +              <&funnel_turing_in_tpdm_turing>;
> +          };
> +        };
> +      };
> +    };
> +

example looks OK, but I would like to see something of a _tdpa in the
nameing as that is the funnel / link the tdpm sends data to.

Regards

Mike

> +...
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index c68d93a35b6c..f7ce8af48574 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -52,6 +52,10 @@ its hardware characteristcs.
>                         "arm,coresight-cti", "arm,primecell";
>                         See coresight-cti.yaml for full CTI definitions.
>
> +               - Trace, Profiling and Diagnostics Monitor (TPDM):
> +                       "qcom,coresight-tpdm", "arm,primecell";
> +                       See coresight-tpdm.yaml for full TPDM definitions.
> +
>         * reg: physical base address and length of the register
>           set(s) of the component.
>
> @@ -82,6 +86,9 @@ its hardware characteristcs.
>  * Required properties for Coresight Cross Trigger Interface (CTI)
>         See coresight-cti.yaml for full CTI definitions.
>
> +* Required properties for Trace, Profiling and Diagnostics Monitor (TPDM)
> +       See coresight-tpdm.yaml for full TPDM definitions.
> +
>  * Required properties for devices that don't show up on the AMBA bus, such as
>    non-configurable replicators and non-configurable funnels:
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ea3e6c914384..434bbe98d22b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1906,6 +1906,7 @@ T:        git git://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git
>  F:     Documentation/ABI/testing/sysfs-bus-coresight-devices-*
>  F:     Documentation/devicetree/bindings/arm/coresight-cpu-debug.txt
>  F:     Documentation/devicetree/bindings/arm/coresight-cti.yaml
> +F:     Documentation/devicetree/bindings/arm/coresight-tpdm.yaml
>  F:     Documentation/devicetree/bindings/arm/coresight.txt
>  F:     Documentation/devicetree/bindings/arm/ete.yaml
>  F:     Documentation/devicetree/bindings/arm/trbe.yaml
> --
> 2.17.1
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
