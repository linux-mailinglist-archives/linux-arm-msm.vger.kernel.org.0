Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3471B179B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 22:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgDTUzG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 16:55:06 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33866 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgDTUzF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 16:55:05 -0400
Received: by mail-ot1-f67.google.com with SMTP id 72so2960085otu.1;
        Mon, 20 Apr 2020 13:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SuLiy9O603fJsU9Y2oKFeKGMVODig0KjDhSjaCiHNa8=;
        b=WhCJ8pcABlLEKUNZk7E8YfATA7o+GYggiTycEZT4xlDgngsah3X7lTn/Uf6ZAyBvOB
         r4fJfcIbGur4j316IkkHwK5UuTt4hxFye160G74e69Fdmxa76/c/sh+74Jb9sAXMH/q3
         qsHa6V++xB9V1moKDH6pxK2gMQroFg3zqBpE/SaocuObsx60xn7E0A6V/wP+7umziqf1
         8gKk0Swz0a8p8AXdZJ038XuqvR3u+6JPKMizho4WppoMkQgJAc4t9G3WcFKO+/M7PJ9R
         rZKoLV/4O+kdiHIAl30HnUZv8mNAqUxoB9nC8p6ZkX+nt7yUXR+PgPUmHPOqt2mMMvia
         ReaQ==
X-Gm-Message-State: AGi0Pua3Mp+/3xb91BZ/KHggbVOUeGtIQMmlZSxWa76/DhUKRyCH8AhF
        LCCb1Cmvx3Sbp0dkhbRbJQ==
X-Google-Smtp-Source: APiQypKFw9XGmecKrAg/GYm6XBHSYat8kdqmIQFBqp92H0KedWfnamv/I/tFokx6VuauGuLaCQcpuw==
X-Received: by 2002:a05:6830:13d4:: with SMTP id e20mr2495510otq.66.1587416103049;
        Mon, 20 Apr 2020 13:55:03 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n38sm201485otn.26.2020.04.20.13.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 13:55:02 -0700 (PDT)
Received: (nullmailer pid 12892 invoked by uid 1000);
        Mon, 20 Apr 2020 20:55:01 -0000
Date:   Mon, 20 Apr 2020 15:55:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH 2/3] dt-bindings: regulator: Add document bindings for
 max77826
Message-ID: <20200420205501.GA6828@bogus>
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
 <20200413164440.1138178-3-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413164440.1138178-3-iskren.chernev@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 13, 2020 at 07:44:39PM +0300, Iskren Chernev wrote:
> Add device tree binding information for max77826 regulator driver.
> Example bindings for max77826 are added.
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>  .../bindings/regulator/maxim,max77826.yaml    | 70 +++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
> 
> diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
> new file mode 100644
> index 000000000000..3cd449a746b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/maxim,max77826.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Maxim Integrated MAX77826 PMIC
> +
> +maintainers:
> +  - Iskren Chernev <iskren.chernev@gmail.com>
> +
> +properties:
> +  $nodename:
> +    pattern: "pmic@[0-9a-f]{1,2}"
> +  compatible:
> +    enum:
> +      - maxim,max77826-regulator
> +
> +  reg:
> +    maxItems: 1
> +
> +  regulators:
> +    type: object
> +    allOf:
> +      - $ref: regulator.yaml#
> +    description: |
> +      list of regulators provided by this controller, must be named
> +      after their hardware counterparts LDO[1-15], BUCK and BUCKBOOST
> +
> +    patternProperties:
> +      "^LDO([1-9]|1[0-5])$":
> +        type: object
> +        allOf:
> +          - $ref: regulator.yaml#
> +
> +      "^BUCK|BUCKBOOST$":
> +        type: object
> +        allOf:
> +          - $ref: regulator.yaml#
> +
> +      additionalProperties: false

You are defining a property called 'additionalProperties'. This one 
should be dropped because additionalProperties doesn't work with a $ref.

> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - regulators
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@69 {
> +            compatible = "maxim,max77826-regulator";
> +            reg = <0x69>;
> +
> +            regulators {
> +                LDO2 {
> +                    regulator-name = "ldo2";
> +                    regulator-min-microvolt = <650000>;
> +                    regulator-max-microvolt = <3587500>;
> +                };
> +            };
> +       };
> +     };
> +...
> -- 
> 2.26.0
> 
