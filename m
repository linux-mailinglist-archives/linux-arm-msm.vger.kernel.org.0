Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9450B3C2849
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhGIRbp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:31:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhGIRbo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:31:44 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400C1C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 10:29:00 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso10166338otu.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 10:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b9a9GBhzP0HS74EZRlotP1XS8wz3lqQjmU5aN6EE/kE=;
        b=E4UsDh022GB3OmPnBDg0m4K/M0tEXSypF6vo27XD4aikK9LiADWRtKSmLYbDG4IcgR
         Fuw/+2+xblg3NNEPNn8Tpa+zekiVCoLW1+cyAPOHy5A+OLeojAH0qloREwMobpnQvJe9
         2CLR+2eT5TzomBVpBATvEhSQftNZy7KRp7yBNL5UNrpjff+uhsFYXDPPrMdBqZEzuNnf
         KPZ71UDdbNzWypPw/MT8WR6+Dn1bcf7oxMM+e0O+MjaE97VRnP/SWNwUJyCDpkydJnJ+
         mQGi4c0UlMSbbsa8o191Papq895E6iVdBJXWQY7jB1id2Bnv+g3Ivqg+n4/ULNkRrP61
         ec/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b9a9GBhzP0HS74EZRlotP1XS8wz3lqQjmU5aN6EE/kE=;
        b=LLQ5Egfyy3qYY0Vq15GQsegp7GpOyeol7Ref4I0r5H0h1kAulQ/Q2hnOz37Ltfl5ip
         +lQVyxpo8tzlNpeK0ck9XqG4KVxNOycyDIps0mb+8GU1CxcvOgKeHNVUwoAiDLOk97Iy
         /SyZHyEhIlk+jGJLVQBN2SKsHki+ScelgJcDxvQ4iZpdu9UY6GXnDsbyYN4Zbzwg3eo7
         nQcLiyrvOywUxEK1IhKlZFFW/tjED7O1RaCT5Qx4Zxhx80m3A153W1RMtA6UqS9Z54Tw
         VvEVc4XC227D6OU2tKxF/8viwGJPULlwceXitVM817beaXP2gScvj8G/hiXF3C8DsMxf
         iVgQ==
X-Gm-Message-State: AOAM530D8X+nZA95tm4mCtHuDd3Vp1bdK3qLjvz0vZV1rH4ye3NYsLQY
        XOlPCltqIJIJjPDXDLM25rlafQ==
X-Google-Smtp-Source: ABdhPJws3+LFB9fqp9c8PbCxZzqrqQkBucb639UmIJ5lfjz8ths67oa2giidnlVG4/5SygUyEZEglg==
X-Received: by 2002:a9d:5f07:: with SMTP id f7mr29767852oti.183.1625851739481;
        Fri, 09 Jul 2021 10:28:59 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t10sm1111541oor.48.2021.07.09.10.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 10:28:58 -0700 (PDT)
Date:   Fri, 9 Jul 2021 10:27:32 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi S <sibis@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom: aoss: Convert to YAML
Message-ID: <YOiHBPH1+7dJN6rn@ripper>
References: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
 <20210625234018.1324681-3-bjorn.andersson@linaro.org>
 <20210701190313.GA2736150@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701190313.GA2736150@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 01 Jul 12:03 PDT 2021, Rob Herring wrote:

> On Fri, Jun 25, 2021 at 04:40:17PM -0700, Bjorn Andersson wrote:
> > Convert to YAML in order to allow validation.
> > 
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > ---
> > 
> > I'm aware that this conflicts with Sibi's removal of '#power-domain-cells', but
> > that's a trivial change regardless of which of the two patches gets in first.
> > 
> >  .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  90 --------------
> >  .../bindings/soc/qcom/qcom,aoss-qmp.yaml      | 115 ++++++++++++++++++
> >  2 files changed, 115 insertions(+), 90 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> > deleted file mode 100644
> > index 3747032311a4..000000000000
> > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> > +++ /dev/null
> > @@ -1,90 +0,0 @@
> > -Qualcomm Always-On Subsystem side channel binding
> > -
> > -This binding describes the hardware component responsible for side channel
> > -requests to the always-on subsystem (AOSS), used for certain power management
> > -requests that is not handled by the standard RPMh interface. Each client in the
> > -SoC has it's own block of message RAM and IRQ for communication with the AOSS.
> > -The protocol used to communicate in the message RAM is known as Qualcomm
> > -Messaging Protocol (QMP)
> > -
> > -The AOSS side channel exposes control over a set of resources, used to control
> > -a set of debug related clocks and to affect the low power state of resources
> > -related to the secondary subsystems. These resources are exposed as a set of
> > -power-domains.
> > -
> > -- compatible:
> > -	Usage: required
> > -	Value type: <string>
> > -	Definition: must be one of:
> > -		    "qcom,sc7180-aoss-qmp"
> > -		    "qcom,sc7280-aoss-qmp"
> > -		    "qcom,sc8180x-aoss-qmp"
> > -		    "qcom,sdm845-aoss-qmp"
> > -		    "qcom,sm8150-aoss-qmp"
> > -		    "qcom,sm8250-aoss-qmp"
> > -		    "qcom,sm8350-aoss-qmp"
> > -		    and:
> > -		    "qcom,aoss-qmp"
> > -
> > -- reg:
> > -	Usage: required
> > -	Value type: <prop-encoded-array>
> > -	Definition: the base address and size of the message RAM for this
> > -		    client's communication with the AOSS
> > -
> > -- interrupts:
> > -	Usage: required
> > -	Value type: <prop-encoded-array>
> > -	Definition: should specify the AOSS message IRQ for this client
> > -
> > -- mboxes:
> > -	Usage: required
> > -	Value type: <prop-encoded-array>
> > -	Definition: reference to the mailbox representing the outgoing doorbell
> > -		    in APCS for this client, as described in mailbox/mailbox.txt
> > -
> > -- #clock-cells:
> > -	Usage: optional
> > -	Value type: <u32>
> > -	Definition: must be 0
> > -		    The single clock represents the QDSS clock.
> > -
> > -- #power-domain-cells:
> > -	Usage: optional
> > -	Value type: <u32>
> > -	Definition: must be 1
> > -		    The provided power-domains are:
> > -		    CDSP state (0), LPASS state (1), modem state (2), SLPI
> > -		    state (3), SPSS state (4) and Venus state (5).
> > -
> > -= SUBNODES
> > -The AOSS side channel also provides the controls for three cooling devices,
> > -these are expressed as subnodes of the QMP node. The name of the node is used
> > -to identify the resource and must therefor be "cx", "mx" or "ebi".
> > -
> > -- #cooling-cells:
> > -	Usage: optional
> > -	Value type: <u32>
> > -	Definition: must be 2
> > -
> > -= EXAMPLE
> > -
> > -The following example represents the AOSS side-channel message RAM and the
> > -mechanism exposing the power-domains, as found in SDM845.
> > -
> > -  aoss_qmp: qmp@c300000 {
> > -	  compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
> > -	  reg = <0x0c300000 0x100000>;
> > -	  interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
> > -	  mboxes = <&apss_shared 0>;
> > -
> > -	  #power-domain-cells = <1>;
> > -
> > -	  cx_cdev: cx {
> > -		#cooling-cells = <2>;
> > -	  };
> > -
> > -	  mx_cdev: mx {
> > -		#cooling-cells = <2>;
> > -	  };
> > -  };
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> > new file mode 100644
> > index 000000000000..1b9de8e49356
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Always-On Subsystem side channel binding
> > +
> > +maintainers:
> > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > +
> > +description:
> > +  This binding describes the hardware component responsible for side channel
> > +  requests to the always-on subsystem (AOSS), used for certain power management
> > +  requests that is not handled by the standard RPMh interface. Each client in the
> > +  SoC has it's own block of message RAM and IRQ for communication with the AOSS.
> > +  The protocol used to communicate in the message RAM is known as Qualcomm
> > +  Messaging Protocol (QMP)
> > +
> > +  The AOSS side channel exposes control over a set of resources, used to control
> > +  a set of debug related clocks and to affect the low power state of resources
> > +  related to the secondary subsystems. These resources are exposed as a set of
> > +  power-domains.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - "qcom,sc7180-aoss-qmp"
> > +        - "qcom,sc7280-aoss-qmp"
> > +        - "qcom,sc8180x-aoss-qmp"
> > +        - "qcom,sdm845-aoss-qmp"
> > +        - "qcom,sm8150-aoss-qmp"
> > +        - "qcom,sm8250-aoss-qmp"
> > +        - "qcom,sm8350-aoss-qmp"
> > +      - const: "qcom,aoss-qmp"
> 
> Don't need quotes. With that and the indentation fixed:
> 

I've installed yamllint and fixed this for v2.

But can you please help me understand why the members of the enum should
have double indentation here? Is it just that the indentation counts
from the 'e' and not the '-'?

> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks,
Bjorn
