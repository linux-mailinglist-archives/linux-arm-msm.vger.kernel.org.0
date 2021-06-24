Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 859FC3B3880
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 23:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhFXVVI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 17:21:08 -0400
Received: from mail-io1-f53.google.com ([209.85.166.53]:35489 "EHLO
        mail-io1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhFXVVI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 17:21:08 -0400
Received: by mail-io1-f53.google.com with SMTP id d9so10058021ioo.2;
        Thu, 24 Jun 2021 14:18:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nZlEZYSKc3oO2sTQkZ0lk3b/QG+ychRfrA05xmk4U1A=;
        b=S9mO+Ie4ZueK+eIZmi9PHmzIHxq8FqgXyj5SRnnDbNCSfvF++yv3vvw9P9rvAFpBcZ
         4Oqld4Cgdt/D3eYWdP3DGl3IC8e6qCKd/2LBjKQrkXtwgZSw859HVA3wrMUMkmcSXAO5
         v2DuC27CMGInCkTb6YEHootw6tk16jizGUjXfqzV9yntHOXshwULrMgpLNzPvCuhBMnZ
         m30KpeupPGYUyW033UIsg92qcmSsIANWVNkXqu2SGWSSn0FZsxeSVFNxXs1yj4vMGTqw
         p+F0C2bjulLVd0Q93ji6OV0BV7dvYSi/USdhQkAZup33uiL3uI1gqlo7yUGZxx1zvC/t
         G7+g==
X-Gm-Message-State: AOAM532d52MBNnztglv7XsDTbuT2JLKJ1N9//AGINaNvVH5cP71OShqO
        VJGivUjrOPun3JHFqdyAFg==
X-Google-Smtp-Source: ABdhPJzWuI2kqqnHoUDw9mpmjIrbsr+DLFmdTJdQ/gieXMaJDSNkZftGMwMsNtLpUiOyjbx4P1WTTg==
X-Received: by 2002:a05:6602:2014:: with SMTP id y20mr5816080iod.166.1624569527549;
        Thu, 24 Jun 2021 14:18:47 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id w7sm2572890ilu.74.2021.06.24.14.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 14:18:46 -0700 (PDT)
Received: (nullmailer pid 2003352 invoked by uid 1000);
        Thu, 24 Jun 2021 21:18:44 -0000
Date:   Thu, 24 Jun 2021 15:18:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@linaro.org>
Subject: Re: [RFC v1 05/11] dt-bindings: clock: Add QCOM SM8350 display clock
 bindings
Message-ID: <20210624211844.GA1997615@robh.at.kernel.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
 <20210616141107.291430-6-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616141107.291430-6-robert.foss@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 16, 2021 at 04:11:01PM +0200, Robert Foss wrote:
> Add device tree bindings for display clock controller for
> Qualcomm Technology Inc's SM8350 SoC.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm8x50.yaml    |  6 +-
>  .../dt-bindings/clock/qcom,dispcc-sm8350.h    | 77 +++++++++++++++++++
>  2 files changed, 81 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8350.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> index 0cdf53f41f84..c10eefd024f6 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> @@ -4,24 +4,26 @@
>  $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
> +title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
>  
>  maintainers:
>    - Jonathan Marek <jonathan@marek.ca>
>  
>  description: |
>    Qualcomm display clock control module which supports the clocks, resets and
> -  power domains on SM8150 and SM8250.
> +  power domains on SM8150, SM8250 and SM8350.
>  
>    See also:
>      dt-bindings/clock/qcom,dispcc-sm8150.h
>      dt-bindings/clock/qcom,dispcc-sm8250.h
> +    dt-bindings/clock/qcom,dispcc-sm8350.h
>  
>  properties:
>    compatible:
>      enum:
>        - qcom,sm8150-dispcc
>        - qcom,sm8250-dispcc
> +      - qcom,sm8350-dispcc
>  
>    clocks:
>      items:
> diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
> new file mode 100644
> index 000000000000..361ef27de585
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
> @@ -0,0 +1,77 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

I'm tired of saying this for QCom bindings given it's been QCom I've 
gotten complaints on DT licensing, but dual license please. Spread the 
word.

I'm sure if someone audited licenses of headers and dts files they'd 
find a mess.

Rob
