Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6A93EF4F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 23:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhHQV3R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Aug 2021 17:29:17 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:44791 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235067AbhHQV3P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Aug 2021 17:29:15 -0400
Received: by mail-oi1-f178.google.com with SMTP id w6so1201732oiv.11;
        Tue, 17 Aug 2021 14:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/Mx0UVzNRYFUc4QkujNRHwvT1qaO2NYmFNn3GPRqcTo=;
        b=TZr5aRTwiuZbFEbtWAA4Pl0xqKpAfutDrErgcCDXeenlmuHybzLxudxtrqypon3MLB
         IWutsObm+alwvSaBZ35fMN7pwsDJYhIqWkWL5IKOmhRiKpdrcZve8iT2YiykVhzKyvQe
         UcSO9Ubn2TJ7HW/YCrFr7l6x6gwU/eqNWBOPza+rdZwhxflRty6qDSObDaMbEV4S6jjx
         1b4tb7Y8xWr28IZWo9GE5JFehzUqZzaOPLykD6tGesB5jsoNUuTnLzuPShc3HEpVa87Y
         qoxxzojG16zgG1thObG3wceA7a4F/tben9NPRscQIW58rAO1RgZtmW58F8NGs9yR/RpC
         N8gA==
X-Gm-Message-State: AOAM531aqLa3aiOgeRN35OKF80lW+EzAdpppcYtG4horfz2qgHDAGR3C
        g9oUdPnlfambnGdjxReFeQ==
X-Google-Smtp-Source: ABdhPJyWfwcgnxxPtv29RdxjJg7igDW3al5JiPwNMeYVLchoN80AjbsevgMXxmfUee03utS4tclsLQ==
X-Received: by 2002:a54:4008:: with SMTP id x8mr4029640oie.113.1629235721366;
        Tue, 17 Aug 2021 14:28:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x60sm612178ota.72.2021.08.17.14.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 14:28:40 -0700 (PDT)
Received: (nullmailer pid 872158 invoked by uid 1000);
        Tue, 17 Aug 2021 21:28:39 -0000
Date:   Tue, 17 Aug 2021 16:28:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: msm: Add QTI download mode support
 binding
Message-ID: <YRwqBx4hNsbsPYY0@robh.at.kernel.org>
References: <cover.1628757036.git.saiprakash.ranjan@codeaurora.org>
 <217c22d40e0a9db713e2a55623408eca88166897.1628757036.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <217c22d40e0a9db713e2a55623408eca88166897.1628757036.git.saiprakash.ranjan@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 12, 2021 at 02:47:41PM +0530, Sai Prakash Ranjan wrote:
> Add device tree binding for QTI download mode cookies
> region found in IMEM.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  .../bindings/arm/msm/qcom,dload-mode.yaml     | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml b/Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
> new file mode 100644
> index 000000000000..90b9b6a9b75e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/msm/qcom,dload-mode.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/msm/qcom,dload-mode.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Download Mode binding
> +
> +maintainers:
> +  - Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> +
> +description:
> +  Qualcomm download mode cookies memory region in IMEM is used by SDI
> +  (System Debug Image) firmware to determine whether to enter download
> +  mode or not to collect ramdump for post mortem debug.
> +
> +properties:
> +  compatible:
> +    const: qcom,dload-mode
> +
> +  reg:
> +    maxItems: 1
> +
> +  qcom,sdi-disable-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandle reference to a syscon representing TCSR followed by the
> +      offset and length for SDI disable register.
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    imem@146aa000 {
> +      compatible = "simple-mfd";

If this is just internal RAM, then we already have a binding for it and 
'simple-mfd' is not it.

> +      reg = <0x146aa000 0x2000>;
> +
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +
> +      ranges = <0 0x146aa000 0x2000>;
> +
> +      dload-mode@1c00 {
> +        compatible = "qcom,dload-mode";
> +        reg = <0x1c00 0x1000>;

0x1c00 + 0x1000 > 0x2000


> +        qcom,sdi-disable-regs = <&tcsr_regs 0x3a000 0x4>;
> +      };
> +    };
> +...
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
> 
