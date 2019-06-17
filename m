Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65A9D4856E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2019 16:30:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbfFQOaB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jun 2019 10:30:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:55038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726028AbfFQOaB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jun 2019 10:30:01 -0400
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A025821670;
        Mon, 17 Jun 2019 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560781800;
        bh=qDifSuqcxzKT2mPFaeywjNnbb7wpS1XjMQUY4VjP95s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ftWeEUcZLQyXIz69qGsxcV2k+8X5HWs0TvIl0HUP/iGfydDi7z72q5tq23j5gcIMU
         gBI4ri54fv5RFQCp50ZhqEflChHkcPdy3qDEZtZrLVD59ElSh6jFwgHv9QKP6e8Cbs
         g7a2mHo9VpiDU/ajh1Oe0Bhtk9F5EGJffhgeVVNY=
Received: by mail-qt1-f173.google.com with SMTP id p15so10932235qtl.3;
        Mon, 17 Jun 2019 07:30:00 -0700 (PDT)
X-Gm-Message-State: APjAAAVSOH3haT4LP6KGGmspmjCBbxAhttpMNF8G8JXnxBrE7g7j3JiW
        GCRaRfMTHSkX8WPaT9iC6x2rbaqCn+yhxOlnrw==
X-Google-Smtp-Source: APXvYqyASK26LQzwRomt6iiD2y9sCFeTHLV/m8OIpqVyW9ojtFBBNp5iBGmT/mAjUDht+/goKLmPF8B9/cU/9xrQDis=
X-Received: by 2002:a0c:acef:: with SMTP id n44mr22338717qvc.39.1560781799779;
 Mon, 17 Jun 2019 07:29:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190616132930.6942-1-masneyb@onstation.org> <20190616132930.6942-2-masneyb@onstation.org>
In-Reply-To: <20190616132930.6942-2-masneyb@onstation.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 17 Jun 2019 08:29:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ0y7_RPs-qK4thVen6nUVdFbikcwsmmun9tHsVSccQag@mail.gmail.com>
Message-ID: <CAL_JsqJ0y7_RPs-qK4thVen6nUVdFbikcwsmmun9tHsVSccQag@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
To:     Brian Masney <masneyb@onstation.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mark Rutland <mark.rutland@arm.com>,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 16, 2019 at 7:29 AM Brian Masney <masneyb@onstation.org> wrote:
>
> Add device tree bindings for the On Chip Memory (OCMEM) that is present
> on some Qualcomm Snapdragon SoCs.
>
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  .../bindings/soc/qcom/qcom,ocmem.yaml         | 66 +++++++++++++++++++

.../bindings/sram/

>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
>
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
> new file mode 100644
> index 000000000000..5e3ae6311a16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ocmem.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,ocmem.yaml#

schemas/sram/

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: On Chip Memory (OCMEM) that is present on some Qualcomm Snapdragon SoCs.
> +
> +maintainers:
> +  - Brian Masney <masneyb@onstation.org>
> +
> +description: |
> +  The On Chip Memory (OCMEM) allocator allows various clients to allocate memory

Is there something in the h/w that's an allocator? That's typically a
s/w thing that has nothing to do with h/w description.

> +  from OCMEM based on performance, latency and power requirements. This is
> +  typically used by the GPU, camera/video, and audio components on some
> +  Snapdragon SoCs.
> +
> +properties:
> +  compatible:
> +    const: qcom,ocmem-msm8974

What Bjorn said...

> +
> +  reg:
> +    items:
> +      - description: Control registers
> +      - description: OCMEM address range
> +
> +  reg-names:
> +    items:
> +      - const: ocmem_ctrl_physical
> +      - const: ocmem_physical

'ctrl' and 'mem' would be sufficient.

> +
> +  clocks:
> +    items:
> +      - description: Core clock
> +      - description: Interface clock
> +
> +  clock-names:
> +    items:
> +      - const: core
> +      - const: iface
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +      #include <dt-bindings/clock/qcom,rpmcc.h>
> +      #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
> +
> +      ocmem: ocmem@fdd00000 {
> +        compatible = "qcom,ocmem-msm8974";
> +
> +        reg = <0xfdd00000 0x2000>,
> +               <0xfec00000 0x180000>;
> +        reg-names = "ocmem_ctrl_physical",
> +                    "ocmem_physical";
> +
> +        clocks = <&rpmcc RPM_SMD_OCMEMGX_CLK>,
> +                  <&mmcc OCMEMCX_OCMEMNOC_CLK>;
> +        clock-names = "core",
> +                      "iface";
> +      };
> --
> 2.20.1
>
