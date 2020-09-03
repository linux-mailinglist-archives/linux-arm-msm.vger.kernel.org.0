Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2D7925C663
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 18:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728885AbgICQNP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 12:13:15 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:38969 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728876AbgICQNL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 12:13:11 -0400
Received: by mail-io1-f65.google.com with SMTP id b6so3431874iof.6;
        Thu, 03 Sep 2020 09:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9gvvTNIPw9I6yRji5WhK7wdTzHtDJw07/YZwY1IVSsY=;
        b=SU6/sECIOlwCOJREGHuvbI4ls1nIxVAU3tXyaQ4mHKKPyNMlE5BubX3MNYPKVeMj+Z
         MID1s9yM5ojqvDrhmQ3uCi2zY4leoNUShOv1XdWdOKwE9nMBmvSiYbHsXH1h/XyglAYw
         +xtNwQDEqoNiDMloQsqf6PZmirbYAGOjdlP1sxdhzTfYoKZQ4Sz1nvSZFs7aw2w7gnOv
         BMEveH9ECyci8TxHWxwaTl1EqTBSdOM+TgY8h1F02o3d6FCBpQgddmoc6GzSqFSfg03U
         OtrWYOdqIi9b6svf3mjdEi0afxzgqg87l+ZO9esmfvGmDycODCXBFvZepoJlu/sR82OT
         CXWA==
X-Gm-Message-State: AOAM5312t2DLN7+MjY6iXWZ036WZk68Nm/zo2zEW723eDTciMgX2H0hz
        zhg2Y1afgLf/vna+iUYCiuFZv56sTuVh
X-Google-Smtp-Source: ABdhPJw1y8SasChHSTDfMyS2qjEcudm7/rU4rfBgpZ0EgRlXlwT3bdsqp3mySJSWfKAAvZeflDceyg==
X-Received: by 2002:a05:6602:2003:: with SMTP id y3mr3664419iod.203.1599149591009;
        Thu, 03 Sep 2020 09:13:11 -0700 (PDT)
Received: from xps15 ([64.188.179.249])
        by smtp.gmail.com with ESMTPSA id f141sm1664938ilh.65.2020.09.03.09.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 09:13:10 -0700 (PDT)
Received: (nullmailer pid 2874688 invoked by uid 1000);
        Thu, 03 Sep 2020 16:13:09 -0000
Date:   Thu, 3 Sep 2020 10:13:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: clock: add SM8250 QCOM video clock
 bindings
Message-ID: <20200903161309.GB2872956@bogus>
References: <20200902031359.6703-1-jonathan@marek.ca>
 <20200902031359.6703-4-jonathan@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200902031359.6703-4-jonathan@marek.ca>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 01, 2020 at 11:13:53PM -0400, Jonathan Marek wrote:
> Add device tree bindings for video clock controller for SM8250 SoCs.

WARNING: please, no space before tabs
#182: FILE: include/dt-bindings/clock/qcom,videocc-sm8250.h:37:
+#define MVS0C_GDSC ^I^I^I0$

WARNING: please, no space before tabs
#183: FILE: include/dt-bindings/clock/qcom,videocc-sm8250.h:38:
+#define MVS1C_GDSC ^I^I^I1$

WARNING: please, no space before tabs
#184: FILE: include/dt-bindings/clock/qcom,videocc-sm8250.h:39:
+#define MVS0_GDSC ^I^I^I2$

WARNING: please, no space before tabs
#185: FILE: include/dt-bindings/clock/qcom,videocc-sm8250.h:40:
+#define MVS1_GDSC ^I^I^I3$

total: 0 errors, 4 warnings, 73 lines checked


> 
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  .../bindings/clock/qcom,videocc.yaml          |  6 ++-
>  .../dt-bindings/clock/qcom,videocc-sm8250.h   | 42 +++++++++++++++++++
>  2 files changed, 47 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8250.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index d04f5bd28dde..757837e260a2 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -11,12 +11,13 @@ maintainers:
>  
>  description: |
>    Qualcomm video clock control module which supports the clocks, resets and
> -  power domains on SDM845/SC7180/SM8150.
> +  power domains on SDM845/SC7180/SM8150/SM8250.
>  
>    See also:
>      dt-bindings/clock/qcom,videocc-sdm845.h
>      dt-bindings/clock/qcom,videocc-sc7180.h
>      dt-bindings/clock/qcom,videocc-sm8150.h
> +    dt-bindings/clock/qcom,videocc-sm8250.h
>  
>  properties:
>    compatible:
> @@ -24,14 +25,17 @@ properties:
>        - qcom,sdm845-videocc
>        - qcom,sc7180-videocc
>        - qcom,sm8150-videocc
> +      - qcom,sm8250-videocc
>  
>    clocks:
>      items:
>        - description: Board XO source
> +      - description: Board XO source, always-on (required by sm8250 only)
>  
>    clock-names:
>      items:
>        - const: bi_tcxo
> +      - const: bi_tcxo_ao
>  
>    '#clock-cells':
>      const: 1
> diff --git a/include/dt-bindings/clock/qcom,videocc-sm8250.h b/include/dt-bindings/clock/qcom,videocc-sm8250.h
> new file mode 100644
> index 000000000000..4c44f9c468db
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,videocc-sm8250.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8250_H
> +#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8250_H
> +
> +/* VIDEO_CC clocks */
> +#define VIDEO_CC_AHB_CLK		0
> +#define VIDEO_CC_AHB_CLK_SRC		1
> +#define VIDEO_CC_MVS0_CLK		2
> +#define VIDEO_CC_MVS0_CLK_SRC		3
> +#define VIDEO_CC_MVS0_DIV_CLK_SRC	4
> +#define VIDEO_CC_MVS0C_CLK		5
> +#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC	6
> +#define VIDEO_CC_MVS1_CLK		7
> +#define VIDEO_CC_MVS1_CLK_SRC		8
> +#define VIDEO_CC_MVS1_DIV2_CLK		9
> +#define VIDEO_CC_MVS1_DIV_CLK_SRC	10
> +#define VIDEO_CC_MVS1C_CLK		11
> +#define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC	12
> +#define VIDEO_CC_XO_CLK			13
> +#define VIDEO_CC_XO_CLK_SRC		14
> +#define VIDEO_CC_PLL0			15
> +#define VIDEO_CC_PLL1			16
> +
> +/* VIDEO_CC resets */
> +#define VIDEO_CC_CVP_INTERFACE_BCR	0
> +#define VIDEO_CC_CVP_MVS0_BCR		1
> +#define VIDEO_CC_MVS0C_CLK_ARES		2
> +#define VIDEO_CC_CVP_MVS0C_BCR		3
> +#define VIDEO_CC_CVP_MVS1_BCR		4
> +#define VIDEO_CC_MVS1C_CLK_ARES		5
> +#define VIDEO_CC_CVP_MVS1C_BCR		6
> +
> +#define MVS0C_GDSC 			0
> +#define MVS1C_GDSC 			1
> +#define MVS0_GDSC 			2
> +#define MVS1_GDSC 			3
> +
> +#endif
> -- 
> 2.26.1
> 
