Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9A7218AA24
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2020 02:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgCSBDN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 21:03:13 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:33575 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgCSBDN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 21:03:13 -0400
Received: by mail-pg1-f196.google.com with SMTP id m5so264102pgg.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 18:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=cxvWWdiLWhwcBWA6ADvkCOYt4fG2zyPQ2T9tIxIBDEQ=;
        b=lTy0INGyi6isNdz4BWtj2OHapIpXObN/A5Bw5xR2jUiAyFrM0ev10C0DXvExOlxwhc
         ImZia8GiXsiPGuNaM/4kS8ZVnHfFUYJ2HWiWCkHtxE2eL6fhgDfNjv8fDe5Y3TDI0/og
         7WX/Gjp9iTU9Hl6Uqs4FH6jOiVv/YankzE2fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=cxvWWdiLWhwcBWA6ADvkCOYt4fG2zyPQ2T9tIxIBDEQ=;
        b=jgZ0t3U6fKFrlVM2s3epdMnURv7EcfjMnHq+AwyH5xggA/2tUA+tzKH4hxLDifj4uS
         NvLVJZHjfPKhTyTp9MD8TNwqxP+MxI0IIpqN+SaC3kurvxYC/dbn+1NuUrRbS+n2zvnb
         k2Tjav9Cx6ok8j5bn4YE603nE8eO8C40ogVILuTzYBB4+ZiuykdAssvYLH7NMfQ4rLU0
         Go1CkFnaCJ4Gj8l2y7PrpuH1kxU0GAyWc/xl/eLChGkmHsZ6RnM3HoDbj8EbHOhIMfWu
         vmWir8d6JLZH1qVSILyKT8ZzQVknQUOI4XwKwthGoTK0RnjeDiOxbqfyYfAz1zj5i3NN
         CoRQ==
X-Gm-Message-State: ANhLgQ1vMNXbpbuoyIVNB7rWSUZIWnx4BncQFQ2aakjVnR/gVlJ1PjyU
        wZt7EN8hTIpSTNi/Wkhm2mbBm4+fnCw=
X-Google-Smtp-Source: ADFU+vvJQBekMCStovu5VWz10374hQ0R97C2UWDJEFdyIkEHKe7U2rbXhUVHYtmBV6EUNpQHMp4PHg==
X-Received: by 2002:a63:1404:: with SMTP id u4mr564252pgl.172.1584579790905;
        Wed, 18 Mar 2020 18:03:10 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u14sm250068pgg.67.2020.03.18.18.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2020 18:03:10 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1583928252-21246-2-git-send-email-sanm@codeaurora.org>
References: <1583928252-21246-1-git-send-email-sanm@codeaurora.org> <1583928252-21246-2-git-send-email-sanm@codeaurora.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: phy: qcom,qmp: Convert QMP PHY bindings to yaml
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>
Date:   Wed, 18 Mar 2020 18:03:09 -0700
Message-ID: <158457978900.152100.4898904631535195370@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sandeep Maheswaram (2020-03-11 05:04:09)
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml b/Do=
cumentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> new file mode 100644
> index 0000000..39ec3f24
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml
> @@ -0,0 +1,311 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qmp-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QMP PHY controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description:
> +  QMP phy controller supports physical layer functionality for a number =
of
> +  controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq8074-qmp-pcie-phy
> +      - qcom,msm8996-qmp-pcie-phy
> +      - qcom,msm8996-qmp-usb3-phy
> +      - qcom,msm8998-qmp-pcie-phy
> +      - qcom,msm8998-qmp-ufs-phy
> +      - qcom,msm8998-qmp-usb3-phy
> +      - qcom,sdm845-qhp-pcie-phy
> +      - qcom,sdm845-qmp-pcie-phy
> +      - qcom,sdm845-qmp-ufs-phy
> +      - qcom,sdm845-qmp-usb3-phy
> +      - qcom,sdm845-qmp-usb3-uni-phy

I was looking at the DP phy binding in another thread and I'm wondering
what qmp-usb3-uni-phy means. Is that a usb3 phy that doesn't have DP phy
combined with it? It looks like the DP phy binding needs to be merged
with this binding (and some of the driver part too), so I'm not sure
this binding is correct as it stands. Probably needs to be updated to
support DP too.

> +      - qcom,sm8150-qmp-ufs-phy
> +
> +  reg:
> +    minItems: 1
> +    items:
> +      - description: Address and length of PHY's common serdes block.
> +      - description: Address and length of the DP_COM control block.
> +
> +  reg-names:
> +    items:
> +      - const: reg-base
> +      - const: dp_com
> +
> +  "#clock-cells":
> +     enum: [ 1, 2 ]
> +
> +  "#address-cells":
> +    enum: [ 1, 2 ]
> +
> +  "#size-cells":
> +    enum: [ 1, 2 ]
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 4
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +  resets:
> +    minItems: 1
> +    maxItems: 3
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 3
> +
> +  vdda-phy-supply:
> +    description:
> +        Phandle to a regulator supply to PHY core block.
> +
> +  vdda-pll-supply:
> +    description:
> +        Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +  vddp-ref-clk-supply:
> +    description:
> +        Phandle to a regulator supply to any specific refclk
> +        pll block.
> +
> +#Required nodes:
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    type: object
> +    description:
> +      Each device node of QMP phy is required to have as many child node=
s as
> +      the number of lanes the PHY has.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#address-cells"
> +  - "#size-cells"
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - vdda-phy-supply
> +  - vdda-pll-supply
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sdm845-qmp-usb3-phy
> +              - qcom,sdm845-qmp-usb3-uni-phy
> +    then:

There's a lot of if-then nesting stuff. Maybe we could split the binding
into many files for the different compatibles so that it is more
readable.

> +      properties:
> +        clocks:
