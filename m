Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 102EAF85B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 01:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbfKLA6F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Nov 2019 19:58:05 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37350 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfKLA6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Nov 2019 19:58:05 -0500
Received: by mail-oi1-f195.google.com with SMTP id y194so13286249oie.4;
        Mon, 11 Nov 2019 16:58:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=n8yCb64f2+vEBZV/9ixdkldO/XVsA4VOMgs6/Cgt0Vk=;
        b=N0xMbEE60TgmG8SdbElj6nwrSD0+KqQhdA8hy/l3zIPjnyzFijezvdZ8ldBCbKmkfa
         gq06s/reRMdvdkV3wrt3Nk0IriVIreVEodXtON78HaYvRF6LzAShx5GnJVuRMh2L9Lyi
         GurRBkAgyL3eavrX7knfod9bJg35uVmDchST9JAinQ7hJlp+O6IbwKPJFbyjeXRvvIdO
         SHwa/ncz9qMpRRvUbIouQ1F23JpkLxAbHwLFeI9GCDhErUSXLDkuVRHxyTAkwND7/Cft
         h6CI7YjCq32H0sr3HCIFCcOsblVDRHY+oEdGCDoDDhknoKjMDf3NhjS2uUoCpiBxS7EF
         S+Cw==
X-Gm-Message-State: APjAAAXYrFTGGiNV0Jgwg92AGcCSf53sfI5pbGc9RLKmAzW2SeBjy+j5
        86DgvvWngxFeYq0OHl428Q==
X-Google-Smtp-Source: APXvYqxnq2IwODcD/0epd41wU7Q53F63aVD5thvJ1yUI4eywxF0miSsq5IQCgQE/yJE0l4Ij8XergQ==
X-Received: by 2002:a05:6808:906:: with SMTP id w6mr1524677oih.122.1573520284294;
        Mon, 11 Nov 2019 16:58:04 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s133sm3953811oia.58.2019.11.11.16.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 16:58:03 -0800 (PST)
Date:   Mon, 11 Nov 2019 18:58:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v8 2/4] dt-bindings: clock: Convert qcom,mmcc to DT schema
Message-ID: <20191112005802.GA9638@bogus>
References: <1573254987-10241-1-git-send-email-jhugo@codeaurora.org>
 <1573255053-10351-1-git-send-email-jhugo@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1573255053-10351-1-git-send-email-jhugo@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Nov 08, 2019 at 04:17:33PM -0700, Jeffrey Hugo wrote:
> Convert the qcom,mmcc-X clock controller binding to DT schema.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mmcc.txt        | 28 ----------
>  .../devicetree/bindings/clock/qcom,mmcc.yaml       | 59 ++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 28 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
> deleted file mode 100644
> index 8b0f784..0000000
> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Qualcomm Multimedia Clock & Reset Controller Binding
> -----------------------------------------------------
> -
> -Required properties :
> -- compatible : shall contain only one of the following:
> -
> -			"qcom,mmcc-apq8064"
> -			"qcom,mmcc-apq8084"
> -			"qcom,mmcc-msm8660"
> -			"qcom,mmcc-msm8960"
> -			"qcom,mmcc-msm8974"
> -			"qcom,mmcc-msm8996"
> -
> -- reg : shall contain base register location and length
> -- #clock-cells : shall contain 1
> -- #reset-cells : shall contain 1
> -
> -Optional properties :
> -- #power-domain-cells : shall contain 1
> -
> -Example:
> -	clock-controller@4000000 {
> -		compatible = "qcom,mmcc-msm8960";
> -		reg = <0x4000000 0x1000>;
> -		#clock-cells = <1>;
> -		#reset-cells = <1>;
> -		#power-domain-cells = <1>;
> -	};
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> new file mode 100644
> index 0000000..61ed4a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mmcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Multimedia Clock & Reset Controller Binding
> +
> +maintainers:
> +  - Jeffrey Hugo <jhugo@codeaurora.org>
> +
> +description: |
> +  Qualcomm multimedia clock control module which supports the clocks, resets and
> +  power domains.
> +
> +properties:
> +  compatible :
> +    enum:
> +       - qcom,mmcc-apq8064
> +       - qcom,mmcc-apq8084
> +       - qcom,mmcc-msm8660
> +       - qcom,mmcc-msm8960
> +       - qcom,mmcc-msm8974
> +       - qcom,mmcc-msm8996
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +       Protected clock specifier list as per common clock binding

Wasn't documented before. Okay to add here, but mention it in the commit 
msg.

> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +examples:
> +  # Example for MMCC for MSM8960:
> +  - |
> +    clock-controller@4000000 {
> +      compatible = "qcom,mmcc-msm8960";
> +      reg = <0x4000000 0x1000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> -- 
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
> 
