Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21822214EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2020 21:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbgGOTOm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jul 2020 15:14:42 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34637 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgGOTOk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jul 2020 15:14:40 -0400
Received: by mail-io1-f67.google.com with SMTP id q74so3481687iod.1;
        Wed, 15 Jul 2020 12:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uAYhyJcJRVka9ydt6uo/YHKiTlbjPRvSn1YwW+mkzCw=;
        b=OlBgYq8k0O+iHOS7TQDylL0OsEDDRYkUWcXljhHrPtyCkT7RsLrXKHwoxDLm2RM2M9
         N/eNHv98NctvsVcIsNHYK5v0lD2AnGqwDzr9f+XBz10C0mvf4Ed9CaMsB00qpMb/Y9S7
         DOFFy1aPMTwRHBEuLMDvoBzXN+J7ltLpmnuLjh7Tq1jfKiI25VPshV5/Cz5CgikXs7YQ
         X0OLKUlWxVq1iK0SCRgRA6q+Kj4FjdXn5Ob5tTneXUykgw2o3Nxv9egtJ6MNa60WxD0/
         udKvd6TE+inPddSo7dX23jSpCMtD/vBfs3VvnmA8aa/1nku+c8sDP2IBCFMtAoFhitjz
         P8xg==
X-Gm-Message-State: AOAM532dTMGvaL2zXyDfv25luTlXk+ygw46uw1m33+uY61zo2AVB7x90
        XG3YDFfozO+kWMrwlJxFMg==
X-Google-Smtp-Source: ABdhPJxgvH2KybKM2cWCk8cIHsLk9UbkbEjCygxMcdbxSXzyladjhwGB4UwgszPdx59ugl221+sjgA==
X-Received: by 2002:a6b:6b18:: with SMTP id g24mr814518ioc.8.1594840479773;
        Wed, 15 Jul 2020 12:14:39 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id u3sm1530228iol.41.2020.07.15.12.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 12:14:38 -0700 (PDT)
Received: (nullmailer pid 661854 invoked by uid 1000);
        Wed, 15 Jul 2020 19:14:37 -0000
Date:   Wed, 15 Jul 2020 13:14:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        sivaprak@codeaurora.org
Subject: Re: [PATCH 1/6] dt-bindings: soc: qcom: add YAML schema for SMD-RPM
 driver
Message-ID: <20200715191437.GA656528@bogus>
References: <1592550307-11040-1-git-send-email-kathirav@codeaurora.org>
 <1592550307-11040-2-git-send-email-kathirav@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592550307-11040-2-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 19, 2020 at 12:35:02PM +0530, Kathiravan T wrote:
> Add YAML schema for the devitree properties used in the SMD-RPM driver.

This is converting, not adding...

> 
> Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  | 62 ---------------
>  .../devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 91 ++++++++++++++++++++++
>  2 files changed, 91 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml


> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> new file mode 100644
> index 00000000..5b33def
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,smd-rpm.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Resource Power Manager (RPM) over SMD
> +
> +description: |
> +  This driver is used to interface with the Resource Power Manager (RPM) found
> +  in various Qualcomm platforms. The RPM allows each component in the system
> +  to vote for state of the system resources, such as clocks, regulators and bus
> +  frequencies.
> +
> +  The SMD information for the RPM edge should be filled out.  See qcom,smd.txt
> +  for the required edge properties.  All SMD related properties will reside
> +  within the RPM node itself.
> +
> +  The RPM exposes resources to its subnodes.  The rpm_requests node must be
> +  present and this subnode may contain children that designate regulator
> +  resources.
> +
> +  Refer to Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
> +  for information on the regulator subnodes that can exist under the
> +  rpm_requests.
> +
> +maintainers:
> +  - Kathiravan T <kathirav@codeaurora.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,rpm-apq8084
> +      - qcom,rpm-msm8916
> +      - qcom,rpm-msm8974
> +      - qcom,rpm-msm8976
> +      - qcom,rpm-msm8996
> +      - qcom,rpm-msm8998
> +      - qcom,rpm-sdm660
> +      - qcom,rpm-qcs404
> +
> +  qcom,smd-channels:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description: Channel name used for the RPM communication
> +    items:
> +      - const: rpm_requests
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - qcom,rpm-apq8084
> +          - qcom,rpm-msm8916
> +          - qcom,rpm-msm8974
> +then:
> +  required:
> +    - qcom,smd-channels
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        apcs: syscon@f9011000 {
> +              compatible = "syscon";
> +              reg = <0xf9011000 0x1000>;
> +        };
> +    };

Drop this node. The use of 'syscon' alone is not valid and will now 
generate warnings with what I have queued for 5.9.

> +    smd {
> +        compatible = "qcom,smd";
> +
> +        rpm {
> +            interrupts = <0 168 1>;
> +            qcom,ipc = <&apcs 8 0>;
> +            qcom,smd-edge = <15>;
> +
> +                rpm_requests {
> +                        compatible = "qcom,rpm-msm8974";
> +                        qcom,smd-channels = "rpm_requests";
> +
> +                        /* Regulator nodes to follow */
> +                };
> +            };
> +     };
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
