Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65CAA1304BA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jan 2020 22:38:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726135AbgADViJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Jan 2020 16:38:09 -0500
Received: from mail-il1-f195.google.com ([209.85.166.195]:39534 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbgADViI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Jan 2020 16:38:08 -0500
Received: by mail-il1-f195.google.com with SMTP id x5so39388842ila.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jan 2020 13:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8pI5QObJXdfMTKTGYOW6wMFE3eyq81zBt90YlzThMeA=;
        b=oFaPQGQkA0A/Xb9GAPnM5DuFU2pBVrRrhMgqV3qa+yJ565M1h7qyj1BMGTwb26gwPG
         ruJxey9n/P7rSAa8zV3R57ZIORDSQDC5dReSWwcOp/3TywUmrZmB6s8y2sehi6sOs9/k
         etkdIoLCV20OpteGUqGDoWAF07lMOLRMH48qxUfaTZysRZRfUa8n+MLyA1mg7n7TR77S
         H37SgWYPLdEWQ8Cd4xtPh1jq9zL3jlNqfFIG6aRweJMKk+FYVEw9GtD0pMI29h0QuEpz
         2h4mjLP24nxlm8vXRP3KkNSiwgpJzjfm4bUgf4bCNFru68VuXOc7kFXo0TBaJWM9cDPx
         1RmQ==
X-Gm-Message-State: APjAAAV3i6Jr6W9No8ZfXFuGClaizPzYTYjAPKvm5NFsaEOeiTd5arPY
        0hD228PnRWPTYXYzSGhAJyLfWTM=
X-Google-Smtp-Source: APXvYqxkUhNGtladHbQV3x2SJfWpm7t30F0bF8dBvl7S6ZlAmMl3vnQGQh9iTmKNoD5QONQAgCQ4yg==
X-Received: by 2002:a92:cb11:: with SMTP id s17mr84621373ilo.114.1578173888023;
        Sat, 04 Jan 2020 13:38:08 -0800 (PST)
Received: from rob-hp-laptop ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id u80sm18878541ili.77.2020.01.04.13.38.06
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jan 2020 13:38:07 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219a3
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Sat, 04 Jan 2020 14:38:05 -0700
Date:   Sat, 4 Jan 2020 14:38:05 -0700
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info
 binding
Message-ID: <20200104213804.GA30385@bogus>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191227053215.423811-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Dec 26, 2019 at 09:32:08PM -0800, Bjorn Andersson wrote:
> Add a devicetree binding for the Qualcomm periperal image loader
> relocation info region found in the IMEM.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - New patch
> 
>  .../bindings/remoteproc/qcom,pil-info.yaml    | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> new file mode 100644
> index 000000000000..715945c683ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> @@ -0,0 +1,35 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm peripheral image loader relocation info binding
> +
> +description:
> +  This document defines the binding for describing the Qualcomm peripheral
> +  image loader relocation memory region, in IMEM, which is used for post mortem
> +  debugging of remoteprocs.
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +properties:
> +  compatible:
> +    const: qcom,pil-reloc-info
> +
> +  offset:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Offset in the register map for the memory region

Why not use 'reg' instead?

> +
> +examples:
> +  - |
> +    imem@146bf000 {
> +      compatible = "syscon", "simple-mfd";
> +      reg = <0 0x146bf000 0 0x1000>;
> +
> +      pil-reloc {
> +        compatible ="qcom,pil-reloc-info";
> +        offset = <0x94c>;
> +      };
> +    };
> -- 
> 2.24.0
> 
