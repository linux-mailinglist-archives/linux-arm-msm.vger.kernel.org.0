Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C2B1E4E2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 21:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725320AbgE0TbM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 15:31:12 -0400
Received: from mail-il1-f193.google.com ([209.85.166.193]:46193 "EHLO
        mail-il1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgE0TbL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 15:31:11 -0400
Received: by mail-il1-f193.google.com with SMTP id h3so2750540ilh.13;
        Wed, 27 May 2020 12:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sAgRZEOkeo465WXLSSAxn5bIub6KkhXGVZu40dWUrNY=;
        b=YsdwlX1SRlOdBIcTFUinNLMlHsDSxLUyYko+1yxh2jWcnm6Rh5fxesKYY++SBUuXcn
         LyckZyBgPkdSFOE7IGQ+RXE2AXLj2Er1gWzGmudzdya6TTUXaiZfVBy7tOXCAmNSqn8l
         SyoF+v3W5/zC7H/PX0ZBgT1IW2VLvlFfoEXL/2p8M0h27zQprINOdjwIekjq0HQbDVJS
         PNja+8RUZYhP8rrTyRAWbDoOHpOIObuT7ja3ufzPJwoFQfL9Me6NJBgeYZt7OGnj2He/
         GJ6M4zDdwxn1LkFpgm8nicDhyTXcnDCPe5G/h8v3CbGYABb3vPKFC1wi8jkUAC8cfscr
         AxnA==
X-Gm-Message-State: AOAM531ylw7R0tqnr/cEHc9jmeOtmlIMMQiSWj+Rp38pajAd+GSETtTw
        m3YsgPYl+apy5y7CRFyc+w==
X-Google-Smtp-Source: ABdhPJx/5Sz7NHPGLgt5sw/lt8hHsq2px9eDP7QopDynfCqhw3zJ0ye1bD3gS7CWWHQCIoXwZYDsKg==
X-Received: by 2002:a92:8d03:: with SMTP id s3mr7285926ild.256.1590607870279;
        Wed, 27 May 2020 12:31:10 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id y11sm1976877ily.22.2020.05.27.12.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 12:31:09 -0700 (PDT)
Received: (nullmailer pid 2600923 invoked by uid 1000);
        Wed, 27 May 2020 19:31:08 -0000
Date:   Wed, 27 May 2020 13:31:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: hwlock: qcom: Migrate binding to YAML
Message-ID: <20200527193108.GA2597510@bogus>
References: <20200513005441.1102586-1-bjorn.andersson@linaro.org>
 <20200513005441.1102586-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513005441.1102586-2-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 12, 2020 at 05:54:38PM -0700, Bjorn Andersson wrote:
> Migrate the Qualcomm TCSR mutex binding to YAML to allow validation.

Where's the deletion of the old text file?

Looks fine if this is existing. Lots of comments if this is a new 
binding...

> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/hwlock/qcom-hwspinlock.yaml      | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
> 
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
