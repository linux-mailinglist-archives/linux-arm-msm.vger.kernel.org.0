Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 424CD22834C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 17:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgGUPNk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 11:13:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:49926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729831AbgGUPNk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 11:13:40 -0400
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 813372073A;
        Tue, 21 Jul 2020 15:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595344419;
        bh=cJveZYxoa7dAdPqQanvrZZl4c8wbkUcvWDgkCaEe+Os=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=M34Xz+Pc5nQE/Ho21lGgohVu/PtpmhfIr6dhTZlnCUrQoHmKtmo1NkhpCjDpGTh0x
         2065SHB4LCKQdIDH8xIeOacFUdrI/qxpE8EdHWbydd9PFpDvMl+oACZkyT0cpWVOXK
         /lJOtx6+K9HNOzF9XLvLJ6cTh5/LUH7/vlhh/6SE=
Received: by mail-oi1-f171.google.com with SMTP id e4so17514498oib.1;
        Tue, 21 Jul 2020 08:13:39 -0700 (PDT)
X-Gm-Message-State: AOAM531dzzPPnkvAKg3IIPvMfNJrQj/zp9gbek7NBqcfVSViGixK4EZG
        VNILZp7cd3KJGd59ue65mkc9d+Tumew7tYAhAA==
X-Google-Smtp-Source: ABdhPJx5usOUbuBPfOhR/huG6DuDsg8mCHNfxMXgiZDEHvwhavGmrHIBAxM6qwppEevA9KhIyFvg6dUqdvZHyzegRBI=
X-Received: by 2002:aca:bb82:: with SMTP id l124mr3483290oif.106.1595344418842;
 Tue, 21 Jul 2020 08:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200622075956.171058-1-bjorn.andersson@linaro.org> <20200622075956.171058-2-bjorn.andersson@linaro.org>
In-Reply-To: <20200622075956.171058-2-bjorn.andersson@linaro.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 21 Jul 2020 09:13:22 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKW+R=rygii7N69o28h5780qx645RhPXGQZ4jw3kHadhw@mail.gmail.com>
Message-ID: <CAL_JsqKW+R=rygii7N69o28h5780qx645RhPXGQZ4jw3kHadhw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: hwlock: qcom: Migrate binding to YAML
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 22, 2020 at 1:59 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> Migrate the Qualcomm TCSR mutex binding to YAML to allow validation.
>
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v1:
> - Actually remove the old binding doc
>
>  .../bindings/hwlock/qcom-hwspinlock.txt       | 39 --------------
>  .../bindings/hwlock/qcom-hwspinlock.yaml      | 51 +++++++++++++++++++
>  2 files changed, 51 insertions(+), 39 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
>  create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml

[...]

> diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> new file mode 100644
> index 000000000000..71e63b52edd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Hardware Mutex Block
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  The hardware block provides mutexes utilized between different processors on
> +  the SoC as part of the communication protocol used by these processors.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sfpb-mutex
> +      - qcom,tcsr-mutex
> +
> +  '#hwlock-cells':
> +    const: 1
> +
> +  syscon:
> +    $ref: "/schemas/types.yaml#/definitions/phandle-array"
> +    description:
> +      Should be a triple of phandle referencing the TCSR mutex syscon, offset
> +      of first mutex within the syscon and stride between each mutex.
> +
> +required:
> +  - compatible
> +  - '#hwlock-cells'
> +  - syscon
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        tcsr_mutex_block: syscon@fd484000 {
> +                compatible = "syscon";

'syscon' alone now generates warnings. Can you drop this node or add a
specific compatible.

> +                reg = <0xfd484000 0x2000>;
> +        };
> +
> +        hwlock {
> +                compatible = "qcom,tcsr-mutex";
> +                syscon = <&tcsr_mutex_block 0 0x80>;
> +
> +                #hwlock-cells = <1>;
> +        };
> +...
> --
> 2.26.2
>
