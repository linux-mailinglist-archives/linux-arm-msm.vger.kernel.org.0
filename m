Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE8DB2DB00C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Dec 2020 16:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbgLOP2d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Dec 2020 10:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730046AbgLOP20 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Dec 2020 10:28:26 -0500
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367CEC0617A6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 07:27:43 -0800 (PST)
Received: by mail-ot1-x341.google.com with SMTP id f16so19680434otl.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Dec 2020 07:27:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ubj6GBiBWffrpQuRnjuSIK7sR8y1WNEeR6KmqeGc0/Y=;
        b=YHd2k42KNWO7u7OdCWlSkeRk4DOkEfVl4V01vBj8t/uOXoFSMjuB+OJxYtt6ErIjVH
         nPFXMhAAFPXKvjyHp6HarSa5M7uWfpLZeax2uxO+er1Ud6xNLYXiM/tJ/3BAKWYnRsb7
         ZYHh8E3yzxyOuQ53CLXHBV389Ch3u4vRXpKaTBzyjSGRcSouGI7OkcFxkMBI0ZAV30rb
         EhJKy0natDqjFkVSolIUjnyBaqmtctTKOHT2ZKPvLv9lEiL7EkEsrt8fOHnDbl8HOVhA
         2YSZdRgPBftDq/3Tl7PF9cyVOHZV13kMcA0oljfhTLf1+kRjM/0riD1pMnlQnTmxcC9X
         5dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ubj6GBiBWffrpQuRnjuSIK7sR8y1WNEeR6KmqeGc0/Y=;
        b=RxS+uKd4R/Y+PhueZjIRRzpHe/nYm8yQIO7pHm9CgaH2M7u/D6CWdBU0+wnnAt2Mzk
         2/ImNA4m5TcZJ3XXxUl5IAzKmwzD5I9epOXzwwdRv5ylsOpxvnfDyZdxbhKtPwJ5Tl2f
         9vIOrTLM3dwTpVyZGB9Y1RflgiZL9f2UVkpJAQj8IDAiM7lWEZXuX4y9T64fZ+TE1oJ5
         pyInysaZta+ETA8KVKPuaRimPiliT5JcFMBma7DP3e9DPdNAgagzVbdvE/1aeoqAmr0J
         pTH1TSpbIrgbgdbxfxlu0A48it4kATgSV8ZOvfY9I1lg52P4S9gGoYGio9Oh+m1u9gQc
         OrKQ==
X-Gm-Message-State: AOAM532zE5uYa6RDWGc8DsOWWgzfQqDKHDoxY2Aoi0u16F4zBFhgsE4R
        cGrzOcVmaNJRYgCa+2ivsVlgmg==
X-Google-Smtp-Source: ABdhPJzvvrIQivpab1olOGDXyCG3crfKnbQLP606OZxYPSqO9krT+cWip/YGPD1AoUU9kLbwKpQcTQ==
X-Received: by 2002:a9d:3b82:: with SMTP id k2mr23791989otc.294.1608046062508;
        Tue, 15 Dec 2020 07:27:42 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id f14sm5108995oib.40.2020.12.15.07.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 07:27:41 -0800 (PST)
Date:   Tue, 15 Dec 2020 09:27:40 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: soc: qcom: convert qcom,smem bindings to
 yaml
Message-ID: <X9jV7IFR4w7jC3KB@builder.lan>
References: <20201215104537.768914-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201215104537.768914-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Dec 04:45 CST 2020, Dmitry Baryshkov wrote:

> Convert soc/qcom/qcom,smem.txt bindings to YAML format.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,smem.txt           | 57 ---------------
>  .../bindings/soc/qcom/qcom,smem.yaml          | 72 +++++++++++++++++++
>  2 files changed, 72 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
> deleted file mode 100644
> index 9326cdf6e1b1..000000000000
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.txt
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Qualcomm Shared Memory Manager binding
> -
> -This binding describes the Qualcomm Shared Memory Manager, used to share data
> -between various subsystems and OSes in Qualcomm platforms.
> -
> -- compatible:
> -	Usage: required
> -	Value type: <stringlist>
> -	Definition: must be:
> -		    "qcom,smem"
> -
> -- memory-region:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: handle to memory reservation for main SMEM memory region.
> -
> -- qcom,rpm-msg-ram:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: handle to RPM message memory resource
> -
> -- hwlocks:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: reference to a hwspinlock used to protect allocations from
> -		    the shared memory
> -
> -= EXAMPLE
> -The following example shows the SMEM setup for MSM8974, with a main SMEM region
> -at 0xfa00000 and the RPM message ram at 0xfc428000:
> -
> -	reserved-memory {
> -		#address-cells = <1>;
> -		#size-cells = <1>;
> -		ranges;
> -
> -		smem_region: smem@fa00000 {
> -			reg = <0xfa00000 0x200000>;
> -			no-map;
> -		};
> -	};
> -
> -	smem@fa00000 {
> -		compatible = "qcom,smem";
> -
> -		memory-region = <&smem_region>;
> -		qcom,rpm-msg-ram = <&rpm_msg_ram>;
> -
> -		hwlocks = <&tcsr_mutex 3>;
> -	};
> -
> -	soc {
> -		rpm_msg_ram: memory@fc428000 {
> -			compatible = "qcom,rpm-msg-ram";
> -			reg = <0xfc428000 0x4000>;
> -		};
> -	};
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> new file mode 100644
> index 000000000000..f7e17713b3d8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smem.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,smem.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Shared Memory Manager binding
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description: |
> +  This binding describes the Qualcomm Shared Memory Manager, used to share data
> +  between various subsystems and OSes in Qualcomm platforms.
> +
> +properties:
> +  compatible:
> +    const: qcom,smem
> +
> +  memory-region:
> +    maxItems: 1
> +    description: handle to memory reservation for main SMEM memory region.
> +
> +  hwlocks:
> +    maxItems: 1
> +
> +  qcom,rpm-msg-ram:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: handle to RPM message memory resource
> +
> +required:
> +  - compatible
> +  - memory-region
> +  - hwlocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    reserved-memory {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        smem_region: smem@fa00000 {
> +            reg = <0xfa00000 0x200000>;
> +            no-map;
> +        };
> +    };
> +
> +    smem {
> +        compatible = "qcom,smem";
> +
> +        memory-region = <&smem_region>;
> +        qcom,rpm-msg-ram = <&rpm_msg_ram>;
> +
> +        hwlocks = <&tcsr_mutex 3>;
> +    };
> +
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges;
> +
> +        rpm_msg_ram: sram@fc428000 {
> +            compatible = "qcom,rpm-msg-ram";
> +            reg = <0xfc428000 0x4000>;
> +        };
> +    };
> +
> +...
> -- 
> 2.29.2
> 
