Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBB2154D6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 21:47:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728079AbgBFUpx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 15:45:53 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:53482 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728075AbgBFUpx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 15:45:53 -0500
Received: by mail-pj1-f65.google.com with SMTP id n96so493316pjc.3;
        Thu, 06 Feb 2020 12:45:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gkYCIC+GBi47yGE96tVbuGnhb1/5AqGy5/4xHMrpYMY=;
        b=OB4iqH3NJl4f6mgge4orsj/muqUVP2YwXqk8suFLw2TzPO786mFxNr5NfNUqA3XJvE
         /i80prVCHEW/1MxLZ5ETRuSn4t1FXxJnGNpNmpD2V06JepTjzDDMh0hctdpOIL8/hFGn
         BXMg/EQaUCQrhqgRk6TIxsb0nxixpjwt0UgcDHlQyh/dIDKTK6KixZk7bdeW75D/NtnO
         PlfIvjVyVUFIa+rGsOQazFADximcbeFiSFw/ips2I6N/ok0b23RwRxFUi/m/vQSKCBrA
         KeHrjYAU72KBnf6IenjgXX/rKbHMKlifTfuSZA2z7Zmss2DBfJTo8kUf9qfNDzufnGP3
         d8SA==
X-Gm-Message-State: APjAAAX2ABkmUqQzw/LFe7skuTdJ3z1ozv/EN+XfReLB85s4r9TpDSqk
        GTodYnOX/aIf/tgzbfbr0A==
X-Google-Smtp-Source: APXvYqyBHaVGW+K5L7iKRT6Okva0bvO6F4LkQe6ArBJwCjn3U3dfPcIf21o4O0K9cOYYDs4Zc1oDQA==
X-Received: by 2002:a17:90a:1697:: with SMTP id o23mr6913345pja.62.1581021950995;
        Thu, 06 Feb 2020 12:45:50 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id gc1sm165783pjb.20.2020.02.06.12.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 12:45:50 -0800 (PST)
Received: (nullmailer pid 7333 invoked by uid 1000);
        Thu, 06 Feb 2020 17:28:31 -0000
Date:   Thu, 6 Feb 2020 17:28:31 +0000
From:   Rob Herring <robh@kernel.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: phy: qcom,qusb2: Convert QUSB2 phy
 bindings to yaml
Message-ID: <20200206172831.GA32685@bogus>
References: <1580305919-30946-1-git-send-email-sanm@codeaurora.org>
 <1580305919-30946-2-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1580305919-30946-2-git-send-email-sanm@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 29, 2020 at 07:21:52PM +0530, Sandeep Maheswaram wrote:
> Convert QUSB2 phy  bindings to DT schema format using json-schema.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 142 +++++++++++++++++++++
>  .../devicetree/bindings/phy/qcom-qusb2-phy.txt     |  68 ----------
>  2 files changed, 142 insertions(+), 68 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> new file mode 100644
> index 0000000..90b3cc6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> @@ -0,0 +1,142 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm QUSB2 phy controller
> +
> +maintainers:
> +  - Manu Gautam <mgautam@codeaurora.org>
> +
> +description:
> +  QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,msm8996-qusb2-phy
> +      - qcom,msm8998-qusb2-phy
> +      - qcom,sdm845-qusb2-phy
> +  reg:
> +    maxItems: 1
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description: phy config clock
> +      - description: 19.2 MHz ref clk
> +      - description: phy interface clock (Optional)
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: cfg_ahb
> +      - const: ref
> +      - const: iface
> +
> +  vdda-pll-supply:
> +     description:
> +       Phandle to 1.8V regulator supply to PHY refclk pll block.
> +
> +  vdda-phy-dpdm-supply:
> +     description:
> +       Phandle to 3.1V regulator supply to Dp/Dm port signals.
> +
> +  resets:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    maxItems: 1
> +    description:
> +        Phandle to nvmem cell that contains 'HS Tx trim'
> +        tuning parameter value for qusb2 phy.
> +
> +  qcom,tcsr-syscon:
> +    description:
> +        Phandle to TCSR syscon register region.
> +    $ref: /schemas/types.yaml#/definitions/cell

s/cell/phandle/

With that,

Reviewed-by: Rob Herring <robh@kernel.org>
