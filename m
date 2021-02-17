Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7513F31D7D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 12:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhBQLDG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 06:03:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:34298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230444AbhBQLDA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 06:03:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B203164E63;
        Wed, 17 Feb 2021 11:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613559738;
        bh=VKyIbFRc2eRMDzPVwV+4rFtGgbGbQz+r8iYjbPVnKIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ll3On1PSyQwT2bKpok2cp2JLZucNXIEfjZsFQ/p3RgmB8VAIrRd70Y154Kai6KN5E
         KfElVRCno8frJh57FSjVIjCdReYHY10VvZsDRDoopIKO108qQm0Wm38K67JDCB+K+m
         xMTgZr6m6T4UlwC1o1Ly//RlT9yegVNskhlCo5qxG6c+Rn6YtnsZvLqGO8/CEi5obc
         34UVmZyPjVfM3tGD1u+BDfaaybGXKvmh3IyDyTqyf4qBihr/4KgqIx7UjIvdm1h8Mx
         VetisXY9V2rnnfBSEafQbCUpsGPYjjfoPNeY2mg3HaGkgdBO+kZDSSzeJOVo5OXzy1
         12KBVzC1ymoPw==
Date:   Wed, 17 Feb 2021 16:32:14 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Souradeep Chowdhury <schowdhu@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: Re: [PATCH V0 1/6] dt-bindings: Added the yaml bindings for DCC
Message-ID: <20210217110214.GR2774@vkoul-mobl.Dlink>
References: <cover.1613541226.git.schowdhu@codeaurora.org>
 <5da43657817066e0ffe1e24cfb17104138515452.1613541226.git.schowdhu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5da43657817066e0ffe1e24cfb17104138515452.1613541226.git.schowdhu@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-02-21, 12:18, Souradeep Chowdhury wrote:
> Documentation for Data Capture and Compare(DCC) device tree bindings
> in yaml format.
> 
> Signed-off-by: Souradeep Chowdhury <schowdhu@codeaurora.org>
> ---
>  .../devicetree/bindings/arm/msm/qcom,dcc.yaml      | 49 ++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> new file mode 100644
> index 0000000..8f09578
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,dcc.yaml
> @@ -0,0 +1,49 @@
> +# SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/msm/qcom,dcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Data Capture and Compare
> +
> +maintainers:
> +  - Souradeep Chowdhury <schowdhu@codeaurora.org>
> +
> +description: |
> +    DCC (Data Capture and Compare) is a DMA engine which is used to save
> +    configuration data or system memory contents during catastrophic failure
> +    or SW trigger.DCC is used to capture and store data for debugging purpose

space after .

> +
> +
> +properties:
> +  compatible:
> +    items:
> +    - enum:
> +      - qcom,sm8150-dcc
> +    - const: qcom,dcc
> +
> +  reg:
> +    items:
> +      - description: DCC base register region
> +      - description: DCC RAM base register region
> +
> +  reg-names:
> +    items:
> +      - const: dcc-base
> +      - const: dcc-ram-base

drop dcc from names

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    dcc@010a2000{
> +                compatible = "qcom,sm8150-dcc";

should this not be:
                compatible = "qcom,sm8150-dcc", "qcom,dcc";

> +                reg = <0 0x010a2000 0  0x1000>,
> +                      <0 0x010ae000 0  0x2000>;
> +                reg-names = "dcc-base", "dcc-ram-base";
> +    };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

-- 
~Vinod
