Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82B3C417E1E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 01:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343829AbhIXXYv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 19:24:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343675AbhIXXYt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 19:24:49 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A520C061571
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 16:23:15 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id w206so16713440oiw.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Sep 2021 16:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I+3/OaDuhI5pjIMPop3s/uZ1XCPBr1j1NL0ouxoZ0gM=;
        b=S91I40xC00oQdUpaFG4GcBFUQyEUVCQHyAuv9yqrOusPXyyxN7+SgE3pw+PTWMV47S
         UvsrUT8r9g+fuvWcYxjERKY9b68GqYPAm4jrzbfZrQVLXKa0KSDfDA8fRpR3mFZTr0IH
         1lRR4pnjinWbUq2QUiqucVBQIoRkVztYIG5B3WkBWrV33eYSr8C4HRnpGX3+kefxhjNT
         yY/XPZYJXLhxJoBOciADz6DT1UVPgd5zb72+L+OOewv4rjXr7cu6lJn6Oe3d8CrBoiCT
         s0Yktyw3tyw6rP4D/tDREaRBjrztNF6o4gyQve2f3yjVUkA4b4nNr9g0ChThgseFXK1R
         fuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I+3/OaDuhI5pjIMPop3s/uZ1XCPBr1j1NL0ouxoZ0gM=;
        b=d/OTK9fwD6mPWym+8u92ZgX4khCZfjJDVKrWUMs19xHE+iOKClwlQeQdmsNPHhpoZP
         sMoR5WUTHq07cDNkNrtH8+z7NYDU64Ud346gb7vRf6l0JNpEsqnYQsYFoW3wgZ5/4+n9
         d271WtVc2xriEeYMyUquLLd41+PdNQBZo5jNV2dqNRZnEf1MkH5AF2FhEzA9OhJ8WgPH
         yXE97h/NFdRw9rrJ10c/Z4mAgrzDuf2kVjc1SwES8TCV2+Gq9TvsppSccbkqSKdH9mTD
         NKl7wc/K8PSTJyVd54yslOIUr6V6Mi46e9fxzNZfbMSTDtvKBJdOzUJlymCGM1w7BQfj
         8lNQ==
X-Gm-Message-State: AOAM532QNu+bGNMIJYKm27m1kXXREnuYqGChD2Qa3/jMef6dxpAP41SA
        PuOjAOSuM2NXwBHXBJFnmZr32purPVWFPA==
X-Google-Smtp-Source: ABdhPJylGhExA23SHB9J+GJqA01IVv93OAddQoG2deBurYRJPBnEjud1LmbKzO47llhrTZt1JFlGzw==
X-Received: by 2002:aca:abc7:: with SMTP id u190mr3459765oie.159.1632525794724;
        Fri, 24 Sep 2021 16:23:14 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k23sm2661698ook.45.2021.09.24.16.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 16:23:14 -0700 (PDT)
Date:   Fri, 24 Sep 2021 18:23:12 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, linux@roeck-us.net,
        rnayak@codeaurora.org, lsrao@codeaurora.org,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        devicetree@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: Re: [PATCH v9 1/5] dt-bindings: Introduce SoC sleep stats bindings
Message-ID: <YU5d4PhKRvF3wzGX@builder.lan>
References: <1630906083-32194-1-git-send-email-mkshah@codeaurora.org>
 <1630906083-32194-2-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1630906083-32194-2-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 06 Sep 00:27 CDT 2021, Maulik Shah wrote:

> From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> 
> Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> SoC sleep stats driver. The driver is used for displaying SoC sleep
> statistic maintained by Always On Processor or Resource Power Manager.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  .../bindings/soc/qcom/soc-sleep-stats.yaml         | 48 ++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> new file mode 100644
> index 0000000..4161156
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/soc-sleep-stats.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/soc-sleep-stats.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. (QTI) SoC sleep stats bindings
> +
> +maintainers:
> +  - Maulik Shah <mkshah@codeaurora.org>
> +  - Lina Iyer <ilina@codeaurora.org>

Lina's address is no longer valid.

> +
> +description:
> +  Always On Processor/Resource Power Manager maintains statistics of the SoC
> +  sleep modes involving powering down of the rails and oscillator clock.
> +
> +  Statistics includes SoC sleep mode type, number of times low power mode were
> +  entered, time of last entry, time of last exit and accumulated sleep duration.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,rpmh-sleep-stats
> +      - qcom,rpm-sleep-stats
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  # Example of rpmh sleep stats
> +  - |
> +    aop_msgram@c3f0048 {
> +      compatible = "qcom,rpmh-sleep-stats";
> +      reg = <0x0c3f0048 0x400>;

As I tested this series I did find it quite odd that the start address
of this block is $48 bytes into a page and still the length is an even
$400.

Is there any single platform where qcom,rpmh-sleep-stats doesn't start
at an offset of $48 from the beginning of its msgram? Could we move this
number to the driver?

Regards,
Bjorn

> +    };
> +  # Example of rpm sleep stats
> +  - |
> +    rpm_msgram@4690000 {
> +      compatible = "qcom,rpm-sleep-stats";
> +      reg = <0x04690000 0x400>;
> +    };
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
