Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A91629E7DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 14:27:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729166AbfH0M1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 08:27:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:45854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726140AbfH0M1c (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 08:27:32 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 34D0F2173E;
        Tue, 27 Aug 2019 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566908851;
        bh=KEZOiSjk7PbyOW007UkzcKlXvorSnb9b8gHt+bUXqxU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JWc2UldYJlZKvFV2o/yXoXO3Z+5q0wSv/AN+cqLxhgBZkrdCPa8xy9BmjUVFRHxhP
         120PqR7GIGBIBRcmksI514Ss5Y4blWB1M0yisbwb4I/Fs4tGVFRpHYM+1Hbew4jXoh
         EOppbCIvXMBHHaa1Pp84C/K5ORy5zlLGbPUSSZa8=
Received: by mail-qt1-f180.google.com with SMTP id u34so21072036qte.2;
        Tue, 27 Aug 2019 05:27:31 -0700 (PDT)
X-Gm-Message-State: APjAAAXIuBg9WSKKykFjQZkKLoxMqI9DwgPgeHzi8e0KMfYghfCEyQPs
        Ym/Adi91t7Gsug5x944s4dgUL5bGRcZGnVrdLg==
X-Google-Smtp-Source: APXvYqziuEABPDz+Q+b0gDObAhYaGeBNG81jZGFVKFUk13WjD9oEthjVKoLhxksnxH21FwwPjnU8fc9SHmn5TWzJFkk=
X-Received: by 2002:ac8:386f:: with SMTP id r44mr22959367qtb.300.1566908850382;
 Tue, 27 Aug 2019 05:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190823131401.4011-1-govinds@codeaurora.org> <20190823131401.4011-2-govinds@codeaurora.org>
In-Reply-To: <20190823131401.4011-2-govinds@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 27 Aug 2019 07:27:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLpVDJBh5qZwudncB8sggb85f3efqs1z9EA+zbVPWX++g@mail.gmail.com>
Message-ID: <CAL_JsqLpVDJBh5qZwudncB8sggb85f3efqs1z9EA+zbVPWX++g@mail.gmail.com>
Subject: Re: [PATCH_v3 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
To:     Govind Singh <govinds@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Aug 23, 2019 at 8:14 AM Govind Singh <govinds@codeaurora.org> wrote:
>
> Add devicetree binding for the Q6SSTOP clock controller found in QCS404.
>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/clock/qcom,q6sstopcc.yaml        | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> new file mode 100644
> index 000000000000..39621e2e2f4e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: BSD-2-Clause

Dual license please.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/qcom,q6sstopcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Q6SSTOP clock Controller
> +
> +maintainers:
> +  - Govind Singh <govinds@codeaurora.org>
> +
> +description:
> +   Q6SSTOP clock controller is used by WCSS remoteproc driver

What driver for some OS is not relevant to the binding.

> +   to bring WDSP out of reset.
> +
> +properties:
> +  compatible:
> +    const: "qcom,qcs404-q6sstopcc"
> +
> +  reg:
> +    items:
> +      - description: Q6SSTOP clocks register region
> +      - description: Q6SSTOP_TCSR register region
> +
> +  clocks:
> +    items:
> +      - description: ahb clock for the q6sstopCC
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    q6sstopcc: clock-controller@7500000 {
> +      compatible = "qcom,qcs404-q6sstopcc";
> +      reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
> +      clocks = <&gcc 141>;
> +      #clock-cells = <1>;
> +    };
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
