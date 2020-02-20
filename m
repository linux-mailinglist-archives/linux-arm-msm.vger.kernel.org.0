Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09ECE16550F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2020 03:29:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbgBTC3n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 21:29:43 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44661 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727402AbgBTC3n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 21:29:43 -0500
Received: by mail-pg1-f193.google.com with SMTP id g3so1116159pgs.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Feb 2020 18:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=EEVYOjfi5PbSHH+WdgPROxvm0gDkTQzR92KMTQUcWvE=;
        b=HVdjzWqFiZCI8G1rH0pU2pp39Y7AS6KZZ/rK62HCDFZoE/pVrjKzbD1LJ0cd57Fe2m
         4gpf93cOUw7g3ErlADetf3lBMXp3jieq7XE3cW8gn0LeM/x/MgNoSSh3yJ/ZkXuhiQM+
         TUKWPSPk8ExLDq7fWpN6yNYwhj7nG+U1NqQY4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=EEVYOjfi5PbSHH+WdgPROxvm0gDkTQzR92KMTQUcWvE=;
        b=imZYcbSPq2jW1RT3+EJBY+8WhVbMoydlNzeghvTruddt3AXqTeDVq6BHDsgK0jSioM
         bwsSq20XodADz4QA8LLLMtY2A9hhtXhfh9XXJCJK9ZZgos0MRszldS/AWk32MV5vGDTP
         6XxsOnLqepLw8YJdS6aOSSijUHKJwrzdLxobqa2NDTfqJcmz9y9QZzNg5O5B2xLht8Mq
         auSmLH36Z9YPUISOwk9A+5hWgv35oa7E3I+dYX9V+GAHaqNupixd/FM+1sWg16irsuhy
         qhTunFNNFjjUDNoGGW/v3Zszm5UwrjpKCd0NknCDjJYovVmWRXJmmbZI/0w0DF/S64Pu
         IALA==
X-Gm-Message-State: APjAAAX+p++shcvcPfj9Ouq/JH2ybtnCXuqWxDpcdm9LsVA0vJW+fi1E
        cGZ4JHuyqbacTF6YEXXhssIpSsaLOwc=
X-Google-Smtp-Source: APXvYqyC9WwG78kMU3KSSI/fRicHSjd1baiiC4/yYeU0mSsTDEQzzD+lr9QkKMTXu3yunzvr7OmjIg==
X-Received: by 2002:a63:1a50:: with SMTP id a16mr30180925pgm.389.1582165782692;
        Wed, 19 Feb 2020 18:29:42 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id 76sm952903pfx.97.2020.02.19.18.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 18:29:42 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1581932974-21654-2-git-send-email-akashast@codeaurora.org>
References: <1581932974-21654-1-git-send-email-akashast@codeaurora.org> <1581932974-21654-2-git-send-email-akashast@codeaurora.org>
Subject: Re: [PATCH 1/2] dt-bindings: spi: Convert QSPI bindings to YAML
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        rojay@codeaurora.org, skakit@codeaurora.org,
        Akash Asthana <akashast@codeaurora.org>
To:     Akash Asthana <akashast@codeaurora.org>, agross@kernel.org,
        mark.rutland@arm.com, robh+dt@kernel.org
Date:   Wed, 19 Feb 2020 18:29:41 -0800
Message-ID: <158216578112.184098.9357700822184458798@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Akash Asthana (2020-02-17 01:49:33)
> diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yam=
l b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
> new file mode 100644
> index 0000000..977070a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/spi/qcom,spi-qcom-qspi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Quad Serial Peripheral Interface (QSPI)
> +
> +maintainers:
> + - Mukesh Savaliya <msavaliy@codeaurora.org>
> + - Akash Asthana <akashast@codeaurora.org>
> +
> +description: |

Drop the | because it doesn't look like any formatting needs to be
maintained in the text for the description.

> + The QSPI controller allows SPI protocol communication in single, dual, =
or quad
> + wire transmission modes for read/write access to slaves such as NOR fla=
sh.
> +
> +allOf:
> +  - $ref: /spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: qcom,sdm845-qspi
> +      - const: qcom,qspi-v1
> +
> +  reg:
> +    description: Base register location and length.

Drop description? It doesn't seem useful.

> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: core
> +
> +  clocks:
> +    items:
> +      - description: AHB clock
> +      - description: QSPI core clock.

Please drop the full-stop on core clock.

> +
> +  "#address-cells":
> +     const: 1
> +
> +  "#size-cells":
> +    const: 0

Aren't these two unnecessary because they're covered by the
spi-controller.yaml binding?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clock-names
> +  - clocks
> +  - "#address-cells"
> +  - "#size-cells"

These last two are also covered by spi-controller binding.

> +
> +

Why two newlines instead of one?

> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-sdm845.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc: soc@0 {

Remove this node from example please.

> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        qspi: spi@88df000 {
> +            compatible =3D "qcom,sdm845-qspi", "qcom,qspi-v1";
> +            reg =3D <0 0x88df000 0 0x600>;
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +            interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
> +            clock-names =3D "iface", "core";
> +            clocks =3D <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
> +                <&gcc GCC_QSPI_CORE_CLK>;

Weird tabbing here. Just use spaces and align it up.

> +
> +                flash@0 {
> +                    compatible =3D "jedec,spi-nor";
> +                    reg =3D <0>;
> +                    spi-max-frequency =3D <25000000>;
> +                    spi-tx-bus-width =3D <2>;
> +                    spi-rx-bus-width =3D <2>;
> +                };

Is this flash node necessary for the example?

> +        };
> +    };
> +

Nitpick: Why newline here?

> +...
