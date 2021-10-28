Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EA643F332
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 01:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhJ1Wx2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 18:53:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231258AbhJ1Wx2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 18:53:28 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EF9C061767
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:51:00 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so10888209ott.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 15:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/a38UkziW6xU8MUB4Zh4jIdzOp1bc89gSNsGzH9Z2Tk=;
        b=TotxgHnvcY9UiZ30kYV2PedVQZD/1y+jg5JJqzoE2ztjKh+06gOSThlbHEjymNEMGc
         U7C134gHuJMTcvngYVHWj6OiJywYsjiVkKkjcXkbcVgs6pEEnqBdzCW8QZ9akBfprh3O
         w9LitM6pMQKwAlCd1NFlXfjQ9kCEWMgeZHmWTMybu/5VUm8HZW1DMfz9WDnW+0WYl/Nk
         lB1bfTv3r1EOfJ1WtOnXsuXbMD3tHi6AjA9BKcnrvBT2t27sxa3UGBHvwS/0YO1HKA70
         SsH+sd8VjeXodCJqiZYgE+GNgHSnchP0r0Vef6H6HofIKNpl+CwK4qC4ATlUSTMWPWm0
         EOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/a38UkziW6xU8MUB4Zh4jIdzOp1bc89gSNsGzH9Z2Tk=;
        b=jFw10iqxE4OCIZeLkAeONa2d3xc8I7Dc+VlpmykrKt33+IckbTw7qKCGlIfpuVB3nD
         im6hB0g+RieloLBRfd2fe4UdEzLE3/d2dqFrnp7oI4itNNlo5tV8NZIKQ9wEVtXiaQBT
         k6MrBhQArVUG4wjcmESEv/jqjy73+5x+d/JFqXMM7469HVkFcaCoWhxG1pbqPBt9EsrF
         i0duaszZxxcuFBMyxWDohFSwBOlg8spNW8VaSb71N4qQSQ36JnQ9nRhjXq/C8Jt7Yc7c
         zzsJiBLYAF2dGg0uJMmTMzXisgNaG8UWn/FrvGXv6dJ79d2c4jASTe56ebmWBrutUmfd
         YnuA==
X-Gm-Message-State: AOAM5301Fxomdphalh+zhxrqwbq20V+op6hHaBB9A8WOw4jOl80vYjUn
        24suyH9qCoUh7U7hRczQoa/6lA==
X-Google-Smtp-Source: ABdhPJyIVYuOGJL3hh8Zk8sVph5pALkOmMenNW5rNEvCibWUcrIzLLEAPCZsQQTxRF3tmR4FHKsuMA==
X-Received: by 2002:a9d:58cc:: with SMTP id s12mr3526337oth.214.1635461458514;
        Thu, 28 Oct 2021 15:50:58 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r184sm1357371oia.38.2021.10.28.15.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 15:50:58 -0700 (PDT)
Date:   Thu, 28 Oct 2021 15:52:46 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jarrett Schultz <jaschultzms@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: Re: [PATCH 1/3] dt-bindings: platform: microsoft: Document surface
 xbl
Message-ID: <YXspvlVhvjSIuCxo@ripper>
References: <20211028211753.573480-1-jaschultzMS@gmail.com>
 <20211028211753.573480-2-jaschultzMS@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211028211753.573480-2-jaschultzMS@gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 28 Oct 14:17 PDT 2021, Jarrett Schultz wrote:

> Introduce yaml for surface xbl driver.
> 
> Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
> ---
>  .../platform/microsoft/surface-xbl.yaml       | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> new file mode 100644
> index 000000000000..3d2771322e72
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/platform/microsoft/surface-xbl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Surface Extensible Bootloader for Microsoft Surface Duo
> +
> +maintainers:
> +  - Jarrett Schultz <jaschultzMS@gmail.com>
> +
> +description: |
> +  Exposes device information to user space.
> +
> +allOf:
> +  - $ref: /schemas/platform/microsoft/surface-xbl.c#
> +
> +properties:
> +  compatible:
> +    const: microsoft,sm8150-surface-duo-xbl
> +
> +  reg:
> +    maxItems: 1
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    xbl@146bfa94 {
> +      compatible = "microsoft,sm8150-surface-duo-xbl";
> +      reg = <0x00 0x146bfa94 0x00 0x100>;

I believe this is in the middle of IMEM. If so it would be better to
describe the entire IMEM section in one block and then list this as one
of the pieces within.

Please see e.g. imem@146aa000 in sc7180.dtsi

Thanks,
Bjorn

> +    };
> -- 
> 2.25.1
> 
