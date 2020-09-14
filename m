Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C9A26986F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Sep 2020 23:57:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbgINV5d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Sep 2020 17:57:33 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:43025 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725986AbgINV5d (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Sep 2020 17:57:33 -0400
Received: by mail-il1-f194.google.com with SMTP id a19so1037803ilq.10;
        Mon, 14 Sep 2020 14:57:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N49eBEf0OcBxq3YK+LLNsu/+jh0vCe22KQ35c/vRW6I=;
        b=mFeF1YP0l9VhbLwT2oBGiAnAwmNrHsyhX1HPF4zke3hy3sMSnz1Iz0ExIKScT1DIbz
         hbBct22s2nPJh/bQMrVdwGE9X0CdPmmJOJwRUN3TTMYNBn/cfph36gwY1r3DpWb316WC
         QDO3Za8WZjrKrmF4aM1ubnkORVVmDKkQmG1DU4FpiEgO0hwprrwRcz3k8pBGUx1u1R3f
         U8mLnDiXQSQJd5fqoGNmwMFI6aoIYsppQxyhJuFvDitzBFCEqcCTtplAJbg4azdNANNQ
         jAoAbpuQQFC1DIZOlV/l+UBedbsOp/DXx88+42p8mxE4q74AQsBtPLqFMXeAg0fdVzMM
         XWQw==
X-Gm-Message-State: AOAM530PbgSlnpSgaftxvzTRJYme0i+12k7hdggAjnhxt7AeH2VXssot
        JEDyuXZikhP4kuNRb1hnrw==
X-Google-Smtp-Source: ABdhPJzHimwcweTB6LyvH7oBdWTbwaHmSrJfZexpF0TO7ddG3+ZaHNRwfzMo34YjbqX1u/ueBO53OA==
X-Received: by 2002:a05:6e02:6d0:: with SMTP id p16mr5106632ils.64.1600120652133;
        Mon, 14 Sep 2020 14:57:32 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c12sm7429573ilm.17.2020.09.14.14.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 14:57:31 -0700 (PDT)
Received: (nullmailer pid 329540 invoked by uid 1000);
        Mon, 14 Sep 2020 21:57:28 -0000
Date:   Mon, 14 Sep 2020 15:57:28 -0600
From:   Rob Herring <robh@kernel.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, jackp@codeaurora.org,
        sergei.shtylyov@gmail.com
Subject: Re: [PATCH v9 2/4] dt-bindings: usb: Add Qualcomm PMIC type C
 controller dt-binding
Message-ID: <20200914215728.GA258460@bogus>
References: <20200904082223.25563-1-wcheng@codeaurora.org>
 <0101017458361303-16620b87-c433-4c00-a061-b1e688363539-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101017458361303-16620b87-c433-4c00-a061-b1e688363539-000000@us-west-2.amazonses.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Sep 04, 2020 at 08:22:53AM +0000, Wesley Cheng wrote:
> Introduce the dt-binding for enabling USB type C orientation and role
> detection using the PM8150B.  The driver will be responsible for receiving
> the interrupt at a state change on the CC lines, reading the
> orientation/role, and communicating this information to the remote
> clients, which can include a role switch node and a type C switch.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml

Please see this thread[1]. Looks like similar functions and hence the 
bindings should be similar. There's a lot of USB Type C binding changes 
in flight. I'm just going to reject them all if folks that know the 
h/w and USB Type C better than me can't work together.

> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 000000000000..8582ab6a3cc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,108 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm PMIC based USB type C Detection Driver
> +
> +maintainers:
> +  - Wesley Cheng <wcheng@codeaurora.org>
> +
> +description: |
> +  Qualcomm PMIC Type C Detect
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8150b-usb-typec
> +
> +  reg:
> +    maxItems: 1
> +    description: Type C base address
> +
> +  interrupts:
> +    maxItems: 1
> +    description: CC change interrupt from PMIC
> +
> +  connector:
> +    $ref: /connector/usb-connector.yaml#
> +    description: Connector type for remote endpoints
> +    type: object
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - usb-c-connector
> +
> +      power-role: true
> +      data-role: true
> +
> +      ports:
> +        description: Remote endpoint connections
> +        type: object
> +
> +        properties:
> +          port@1:
> +            description: Remote endpoints for the Super Speed path
> +            type: object
> +
> +            properties:
> +              endpoint@0:
> +                description: Connection to USB type C mux node
> +                type: object
> +
> +              endpoint@1:
> +                description: Connection to role switch node
> +                type: object

Not sure about this. The connector SS signals are routed to a mux and 
the above are the 2 choices?

Rob


[1] https://lore.kernel.org/linux-usb/TYBPR01MB53096D5A92B7AA149E5803D786260@TYBPR01MB5309.jpnprd01.prod.outlook.com/
