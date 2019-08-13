Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 144CC8BA9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 15:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729241AbfHMNnO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 09:43:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:59676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728095AbfHMNnN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 09:43:13 -0400
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A97772084D;
        Tue, 13 Aug 2019 13:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565703792;
        bh=tGhuTi6i8q70RtL03QHsvQiJD0U0K5cLD/inwbsXYcc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Uo4UavNgFwTPrkrDxoQzIeexZ8KSCrVWgqozcIOdUTQaQijufQfVB2ixWpk9DEuUn
         5e+wszlhwGOhVXV0p24BfuRUhhiNDlVRvQSFGwV/lc5gcy+idDp3GcQyqgmUm/gpDl
         I+N5Xl39XMXX1aqi9llnNWdLstFASs7Sp7tR3oY4=
Received: by mail-qk1-f174.google.com with SMTP id 201so79581358qkm.9;
        Tue, 13 Aug 2019 06:43:12 -0700 (PDT)
X-Gm-Message-State: APjAAAVCS/PKneNXjBJi7w6Mep/wDhudVlIcFnPmBwsZlJ6rtMDzYl8Z
        y3ofMYECfigLgBTkZmoan1hL2ixA742nKAEqaw==
X-Google-Smtp-Source: APXvYqyoMvVBG6NtFWAydUGiqe0lkRWftJ5OUD3LW861TSIDeNewDqAnlP+AxGAUPwMd7qokDO1L8NO/lTHTDeP0EKY=
X-Received: by 2002:a37:d8f:: with SMTP id 137mr27142458qkn.254.1565703791883;
 Tue, 13 Aug 2019 06:43:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190813130946.16448-1-govinds@codeaurora.org> <20190813130946.16448-2-govinds@codeaurora.org>
In-Reply-To: <20190813130946.16448-2-govinds@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 13 Aug 2019 07:43:00 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
Message-ID: <CAL_JsqK-GK8arfRu6sqP9UjNrwc0=aUWXymMRF5fQhg+M2TNng@mail.gmail.com>
Subject: Re: [v2 1/2] dt-bindings: clock: qcom: Add QCOM Q6SSTOP clock
 controller bindings
To:     Govind Singh <govinds@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 13, 2019 at 7:10 AM Govind Singh <govinds@codeaurora.org> wrote:
>
> Add devicetree binding for the Q6SSTOP clock controller found in QCS404.

You need to test this with 'make dt_binding_check' and fix the errors.

>
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  .../bindings/clock/qcom,q6sstopcc.yaml        | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> new file mode 100644
> index 000000000000..861e9ba97ca3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,q6sstopcc.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: BSD-2-Clause

GPL-2.0-only OR BSD-2-Clause

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#

needs updating

> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Q6SSTOP clock Controller
> +
> +maintainers:
> +  - Govind Singh <govinds@codeaurora.org>
> +
> +description:
> +   Q6SSTOP clock controller is used by WCSS remoteproc driver
> +   to bring WDSP out of reset.
> +
> +properties:
> +  compatible:
> +    const: "qcom,qcs404-q6sstopcc"
> +
> +  reg:
> +    maxItems: 2
> +    description: Q6SSTOP clocks register region
> +    description: Q6SSTOP_TCSR register region

Not valid json-schema

> +
> +  clocks:
> +    items:
> +      - description: ahb clock for the q6sstopCC

Single item just needs 'maxItems: 1'

> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - '#clock-cells'

Should have an 'additionalProperties: false' here.

> +
> +examples:
> +  - |
> +    q6sstopcc: clock-controller@7500000 {
> +      compatible = "qcom,qcs404-q6sstopcc";
> +      reg = <0x07500000 0x4e000>, <0x07550000 0x10000>;
> +      clocks = <&gcc GCC_WCSS_Q6_AHB_CLK>;
> +      #clock-cells = <1>;
> +    };
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
