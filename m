Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2516B3B9655
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jul 2021 21:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233265AbhGATFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jul 2021 15:05:49 -0400
Received: from mail-il1-f181.google.com ([209.85.166.181]:45713 "EHLO
        mail-il1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232333AbhGATFt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jul 2021 15:05:49 -0400
Received: by mail-il1-f181.google.com with SMTP id b5so7391405ilc.12;
        Thu, 01 Jul 2021 12:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LWY4s8A0KLKg5QP3rWCl+RCnoRueemN9kNr8PTZ7IoE=;
        b=czw1RUFRYjpFaYYdpqQBNTV5Jx7YDJ6GP6YKI4MyBbLNotKxK9KYOx8cq1RDflJuT5
         feddGR2uuM0eQGzbvR/Zre2+BBa2cAyELuzbAEBAKZ0vwjhvONihe6Bj4vLcMC/Ii4+n
         9ZwbzF75A4VW8G44BwQicb24fZq9TbvevinsfnLTJQJ9KIuCd/K4p/T9kwTpeAUM81gB
         Q8UXwP8EL6DZ5yckl4SsWoabklos4hbZ2UGRkXLLsxzyAiDPIVYQ0Dt1+X11cKNOwWW6
         +XV0hwIqmCkbzvSGVevD5v/RMD/0JV62W9RqGRs9FZ12sL2IrkKJyk2sCYi+jViXCHTu
         PAag==
X-Gm-Message-State: AOAM533ID24lGrA+1SFfak/U+IVMhVVngstL2aLm1EhZUZZmz/TBSiiR
        WzvVXlf08btyabow5PyysA==
X-Google-Smtp-Source: ABdhPJz7zlT9E22DNgmgpBILGkS738x5jxvTRU/WwhYoT3pXNyKBPznSWhlocuVEqYbr2FJLdm0HOA==
X-Received: by 2002:a92:d492:: with SMTP id p18mr627049ilg.226.1625166197645;
        Thu, 01 Jul 2021 12:03:17 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c10sm452090ild.72.2021.07.01.12.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 12:03:16 -0700 (PDT)
Received: (nullmailer pid 2741549 invoked by uid 1000);
        Thu, 01 Jul 2021 19:03:13 -0000
Date:   Thu, 1 Jul 2021 13:03:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi S <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom: aoss: Convert to YAML
Message-ID: <20210701190313.GA2736150@robh.at.kernel.org>
References: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
 <20210625234018.1324681-3-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210625234018.1324681-3-bjorn.andersson@linaro.org>
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
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> deleted file mode 100644
> index 3747032311a4..000000000000
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> +++ /dev/null
> @@ -1,90 +0,0 @@
> -Qualcomm Always-On Subsystem side channel binding
> -
> -This binding describes the hardware component responsible for side channel
> -requests to the always-on subsystem (AOSS), used for certain power management
> -requests that is not handled by the standard RPMh interface. Each client in the
> -SoC has it's own block of message RAM and IRQ for communication with the AOSS.
> -The protocol used to communicate in the message RAM is known as Qualcomm
> -Messaging Protocol (QMP)
> -
> -The AOSS side channel exposes control over a set of resources, used to control
> -a set of debug related clocks and to affect the low power state of resources
> -related to the secondary subsystems. These resources are exposed as a set of
> -power-domains.
> -
> -- compatible:
> -	Usage: required
> -	Value type: <string>
> -	Definition: must be one of:
> -		    "qcom,sc7180-aoss-qmp"
> -		    "qcom,sc7280-aoss-qmp"
> -		    "qcom,sc8180x-aoss-qmp"
> -		    "qcom,sdm845-aoss-qmp"
> -		    "qcom,sm8150-aoss-qmp"
> -		    "qcom,sm8250-aoss-qmp"
> -		    "qcom,sm8350-aoss-qmp"
> -		    and:
> -		    "qcom,aoss-qmp"
> -
> -- reg:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: the base address and size of the message RAM for this
> -		    client's communication with the AOSS
> -
> -- interrupts:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: should specify the AOSS message IRQ for this client
> -
> -- mboxes:
> -	Usage: required
> -	Value type: <prop-encoded-array>
> -	Definition: reference to the mailbox representing the outgoing doorbell
> -		    in APCS for this client, as described in mailbox/mailbox.txt
> -
> -- #clock-cells:
> -	Usage: optional
> -	Value type: <u32>
> -	Definition: must be 0
> -		    The single clock represents the QDSS clock.
> -
> -- #power-domain-cells:
> -	Usage: optional
> -	Value type: <u32>
> -	Definition: must be 1
> -		    The provided power-domains are:
> -		    CDSP state (0), LPASS state (1), modem state (2), SLPI
> -		    state (3), SPSS state (4) and Venus state (5).
> -
> -= SUBNODES
> -The AOSS side channel also provides the controls for three cooling devices,
> -these are expressed as subnodes of the QMP node. The name of the node is used
> -to identify the resource and must therefor be "cx", "mx" or "ebi".
> -
> -- #cooling-cells:
> -	Usage: optional
> -	Value type: <u32>
> -	Definition: must be 2
> -
> -= EXAMPLE
> -
> -The following example represents the AOSS side-channel message RAM and the
> -mechanism exposing the power-domains, as found in SDM845.
> -
> -  aoss_qmp: qmp@c300000 {
> -	  compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
> -	  reg = <0x0c300000 0x100000>;
> -	  interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
> -	  mboxes = <&apss_shared 0>;
> -
> -	  #power-domain-cells = <1>;
> -
> -	  cx_cdev: cx {
> -		#cooling-cells = <2>;
> -	  };
> -
> -	  mx_cdev: mx {
> -		#cooling-cells = <2>;
> -	  };
> -  };
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> new file mode 100644
> index 000000000000..1b9de8e49356
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> @@ -0,0 +1,115 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Always-On Subsystem side channel binding
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +description:
> +  This binding describes the hardware component responsible for side channel
> +  requests to the always-on subsystem (AOSS), used for certain power management
> +  requests that is not handled by the standard RPMh interface. Each client in the
> +  SoC has it's own block of message RAM and IRQ for communication with the AOSS.
> +  The protocol used to communicate in the message RAM is known as Qualcomm
> +  Messaging Protocol (QMP)
> +
> +  The AOSS side channel exposes control over a set of resources, used to control
> +  a set of debug related clocks and to affect the low power state of resources
> +  related to the secondary subsystems. These resources are exposed as a set of
> +  power-domains.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - "qcom,sc7180-aoss-qmp"
> +        - "qcom,sc7280-aoss-qmp"
> +        - "qcom,sc8180x-aoss-qmp"
> +        - "qcom,sdm845-aoss-qmp"
> +        - "qcom,sm8150-aoss-qmp"
> +        - "qcom,sm8250-aoss-qmp"
> +        - "qcom,sm8350-aoss-qmp"
> +      - const: "qcom,aoss-qmp"

Don't need quotes. With that and the indentation fixed:

Reviewed-by: Rob Herring <robh@kernel.org>
