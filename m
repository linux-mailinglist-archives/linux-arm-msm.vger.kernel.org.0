Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D1916659C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 18:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgBTR7O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 12:59:14 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:36604 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgBTR7O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 12:59:14 -0500
Received: by mail-pj1-f65.google.com with SMTP id gv17so1212185pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2020 09:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b39p1eGP3nlw0aRiq/EeenwuRZud+ndWD/CEPqlUtnE=;
        b=qwmkCUcoVIMXBx/AwEt9MPwRTrkz2uyhf0NcAxdivTQjwX1XtVFIVwvizt7PTnm2A4
         +/uy0TnaN37yTB6RrkMkpdIbONbwniMinlv2RHduA2AOzqu5/QmYAR1BtJ9tf7xh07L3
         f6pFWAHnngs5stFC70RIfUeyOOiWQ8YNY5qxr6NT9f5gqVxktjseLYAeD7rSXFVEOlfW
         mtpwnIwTcI8XLpaD76ZhgOYOoumzeO3sUAZM8OyeoRSqeLi6YnCD0RGuMnIcTuQAcgrS
         TdIzRXquWA8RjNDjLf8WwV8bug0AkUrm1r9xKRAlK9lVkIDp/yFSKRcmfE59ga8oXMbH
         yZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b39p1eGP3nlw0aRiq/EeenwuRZud+ndWD/CEPqlUtnE=;
        b=QEgXUmsCj7o3lxq6zG8vhYjSi0AlKRxcmc1Rf1vNEVoY4WPjKKMGPq3SMZAU/KK3Pb
         SL8Vu6LeZjSE7YTqVZeCRQG7Xj9KyVlM/EQA0XP4z6gxtMDy/uTiK/eILnCsP2BkbX+p
         oA4MeTMmApoEpj5J0+e6TYPCmNQcYh8GaphpoHg9uyT2cvuSnDD1H65B6tLCX3Nky7xB
         Zl7nyLADoahmemecrVlwgstitUAMMDje7U59fKrH+mEaEsdmsHnCbhrZfbTjyPoF+X56
         wQPhto3APlc7Lh+aFZi7rVfAeIIm5SpEF9B58/EJBvDiZo1Zun7M9/ljLB81aRE69/Fd
         yQdA==
X-Gm-Message-State: APjAAAUEv8RdDDFHiwzzMHx0l/NPcVCh9WhQI84oXaww1eKpg8dna/3a
        745YitiHBPK9AH9EI8WLS4zb5Q==
X-Google-Smtp-Source: APXvYqwD3zUPaAslcARdnI7JTUN/osi+pnuqbRLDxOFcEbVa3s64IJ6zWD8Jvh/qwLsyt7L2ySuVQQ==
X-Received: by 2002:a17:90b:14a:: with SMTP id em10mr5009154pjb.4.1582221554028;
        Thu, 20 Feb 2020 09:59:14 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id ev5sm112928pjb.4.2020.02.20.09.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 09:59:13 -0800 (PST)
Date:   Thu, 20 Feb 2020 10:59:11 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: Re: [PATCH v3 1/8] dt-bindings: remoteproc: Add Qualcomm PIL info
 binding
Message-ID: <20200220175911.GA19352@xps15>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
 <20200211005059.1377279-2-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200211005059.1377279-2-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 10, 2020 at 04:50:52PM -0800, Bjorn Andersson wrote:
> Add a devicetree binding for the Qualcomm periperal image loader

s/periperal/peripheral

> relocation info region found in the IMEM.

s/info/information

> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Replaced offset with reg to describe the region of IMEM used for the entries
> 
>  .../bindings/remoteproc/qcom,pil-info.yaml    | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> new file mode 100644
> index 000000000000..8386a4da6030
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm peripheral image loader relocation info binding
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This document defines the binding for describing the Qualcomm peripheral
> +  image loader relocation memory region, in IMEM, which is used for post mortem
> +  debugging of remoteprocs.
> +
> +properties:
> +  compatible:
> +    const: qcom,pil-reloc-info
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +examples:
> +  - |
> +    imem@146bf000 {
> +      compatible = "syscon", "simple-mfd";
> +      reg = <0 0x146bf000 0 0x1000>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      pil-reloc {
> +        compatible ="qcom,pil-reloc-info";

s/="/= "

> +        reg = <0x94c 200>;
> +      };
> +    };
> +...
> -- 
> 2.24.0
> 
