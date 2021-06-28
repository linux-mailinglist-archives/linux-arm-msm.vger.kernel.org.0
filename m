Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 112543B65D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 17:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbhF1PlF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 11:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238308AbhF1Pk2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 11:40:28 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBC82C014D9D
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 07:49:13 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id a127so14252051pfa.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 07:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZSj4RmI8yCcxPcjTe6tWYJqNEZi8NLpBHAPv+jccWGE=;
        b=czLA0L+OepY2RMRvJPJ1aroh0vH2O14KivrTKKmu5i1pAnrV6c3S55WP8h6B05D4WX
         E6pjWDifCvl4akBD9x4dHM2Vo1su2nyq01tttiwlKv4c6e7GmGu389sWyaXXkiwamGeg
         3wzfJ+HE+qAgxY6841XhFXVy7Z+AIIMt1MUC1AxqnEAyh9GgOYrZmptymgKyqsSTsaHc
         2tC/y/zpKtO8kw4mWv9sWsu+pqKGbQE1DZNZt/ZD+WUCgvuUTBIg3SEzNKh25vPUo3p4
         nRczpN7UtAASDR3WCrhNJEBB1KbRj7gYf2/UFRuzAHE6A0l8v/G7tfKt1KpTMzJXlKkG
         cGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZSj4RmI8yCcxPcjTe6tWYJqNEZi8NLpBHAPv+jccWGE=;
        b=BKxuWwwKIO97ML6lNX3sml39+UcmoyN9w+2NWyUg9C1uiLWRIQabM+n51EEoDzD1J6
         fDJzgS9nLkqUeb3kRMfw7hwZxTGHLygT9BnKkQUR992rty8x128zDT+Hrb9eAWOkGmoc
         zMnaXXP4xWv7y7e4Q+pPNDYZun2hNgwoG6FVe9VOEI+wMxKXX6fqEw5/zOyNnv+Ay0Yi
         odXKC2JRF+M5vsYV8V/H3+3VsvhdhZag72vLFsssZCCH/lgACgst0VCK3ZsndqFK7PWa
         9bx0thH3vQT+bC1jZj+H0PGY0nrF2/7jWYy9h1KIUw1z+Olg+inbMmpHmD3mwjaocCZj
         ZkXA==
X-Gm-Message-State: AOAM533vP3UtLo0yRbQjocIDNcFS6vnD2EILjmdVYOVSZjhcm3Hbt+4R
        G/jlzQFiYqQuKcD/OMBH6IbK
X-Google-Smtp-Source: ABdhPJyIdgCHYreL9ynww4hlIDfPkxPBnXApubL+5PLaIZmUXOXxvuyuqjadRqM97SkknpcXwJkS/A==
X-Received: by 2002:a63:5302:: with SMTP id h2mr14002169pgb.262.1624891753107;
        Mon, 28 Jun 2021 07:49:13 -0700 (PDT)
Received: from workstation ([120.138.13.225])
        by smtp.gmail.com with ESMTPSA id n33sm14670914pgm.55.2021.06.28.07.49.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 07:49:12 -0700 (PDT)
Date:   Mon, 28 Jun 2021 20:19:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Sibi S <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom: aoss: Convert to YAML
Message-ID: <20210628144908.GC4033@workstation>
References: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
 <20210625234018.1324681-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625234018.1324681-3-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 25, 2021 at 04:40:17PM -0700, Bjorn Andersson wrote:
> Convert to YAML in order to allow validation.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> I'm aware that this conflicts with Sibi's removal of '#power-domain-cells', but
> that's a trivial change regardless of which of the two patches gets in first.
> 
>  .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  90 --------------
>  .../bindings/soc/qcom/qcom,aoss-qmp.yaml      | 115 ++++++++++++++++++
>  2 files changed, 115 insertions(+), 90 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> 

[...]

> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - mboxes
> +  - "#clock-cells"

The old binding lists this property as optional but you're marking it
as required. And by looking at the driver it seems to be optional only.

> +  - "#power-domain-cells"

This one was marked optional as well but the driver registers the pd's
unconditionally, so I guess it is fine.

Thanks,
Mani

> +
> +additionalProperties: false
> +
> +patternProperties:
> +  "^(cx|mx|ebi)$":
> +    type: object
> +    description:
> +      The AOSS side channel also provides the controls for three cooling devices,
> +      these are expressed as subnodes of the QMP node. The name of the node is
> +      used to identify the resource and must therefor be "cx", "mx" or "ebi".
> +
> +    properties:
> +      "#cooling-cells":
> +        const: 2
> +
> +    required:
> +      - "#cooling-cells"
> +
> +    additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    aoss_qmp: qmp@c300000 {
> +      compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
> +      reg = <0x0c300000 0x100000>;
> +      interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
> +      mboxes = <&apss_shared 0>;
> +
> +      #clock-cells = <0>;
> +      #power-domain-cells = <1>;
> +
> +      cx_cdev: cx {
> +        #cooling-cells = <2>;
> +      };
> +
> +      mx_cdev: mx {
> +        #cooling-cells = <2>;
> +      };
> +    };
> +...
> -- 
> 2.29.2
> 
