Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96329121821
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 19:41:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbfLPSk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 13:40:58 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37614 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbfLPSBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 13:01:47 -0500
Received: by mail-ot1-f66.google.com with SMTP id k14so10208430otn.4;
        Mon, 16 Dec 2019 10:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Qc/5271R27TyFXwcNXdVrUFfe556FVCOMsvivSqHqAg=;
        b=sIwN8SOCYrh/nxbAhf8Efrb51CrNXPhpY0l734Vh8OBL2ugyGrFZoXa1fVkEy1N9y9
         l4+u6mgPpgypD5sBZxzPfomKiMroYUFWQ/MLIOocvrbxti62uPdguucj2nD1pmAp/BpP
         cj9cTTTM9GJ5N1rbke8NAleASRSEeQMfGqkz22+OCoD+VKNGf3V/m8WF30hDCGdz/oLe
         9oQj2f50n4OdZmWavP7BpCiZqoM85CtFB7M522/grz4FoffX5giBIkBBFbu4I7Mhjne/
         JurKoQM6MGt70bF/Sd0uTqO+m/lPT/QzH9HRlZyCtltdxoBn4fL4sMh8DmyrVc2AtMQ3
         Ax6g==
X-Gm-Message-State: APjAAAU9BOJC9Lz7fKxcUfCynfTRxTPf6mYvoK9y4wpGGqQKh1sEdh1O
        DebqEB+gRPZSHOEV3vOdjw==
X-Google-Smtp-Source: APXvYqyDjtM59oNy+jnz+ALXTiAza8mNWXii6SfQ0a6fPk4PXCtGHdQapdtyKbKz29Lrhv+sKtPD2Q==
X-Received: by 2002:a9d:1b4e:: with SMTP id l72mr33875485otl.345.1576519306408;
        Mon, 16 Dec 2019 10:01:46 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d59sm7084094otb.50.2019.12.16.10.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2019 10:01:45 -0800 (PST)
Date:   Mon, 16 Dec 2019 12:01:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Taniya Das <tdas@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette =?iso-8859-1?Q?=A0?= 
        <mturquette@baylibre.com>, David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
Message-ID: <20191216180144.GA27463@bogus>
References: <1575447687-9296-1-git-send-email-tdas@codeaurora.org>
 <0101016ed0006092-b6693b0f-f8c6-428a-9b64-f6e1f4606844-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0101016ed0006092-b6693b0f-f8c6-428a-9b64-f6e1f4606844-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 04, 2019 at 08:21:56AM +0000, Taniya Das wrote:
> The MSS clock provider have a bunch of generic properties that
> are needed in a device tree. Add a YAML schemas for those.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  .../devicetree/bindings/clock/qcom,mss.yaml        | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,mss.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mss.yaml b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> new file mode 100644
> index 0000000..4494a6b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,mss.yaml
> @@ -0,0 +1,40 @@
> +# SPDX-License-Identifier: GPL-2.0-only

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Modem Clock Controller Binding
> +
> +maintainers:
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description: |
> +  Qualcomm modem clock control module which supports the clocks.
> +
> +properties:
> +  compatible :
> +    enum:
> +       - qcom,mss-sc7180

Normal order is 'qcom,sc7180-mss'.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'

Add:

additionalItems: false

> +
> +examples:
> +  # Example of MSS with clock nodes properties for SC7180:
> +  - |
> +    clock-controller@41aa000 {
> +      compatible = "qcom,sc7180-mss";
> +      reg = <0x041aa000 0x100>;
> +      reg-names = "cc";

Not documented, nor necessary.

> +      #clock-cells = <1>;
> +    };
> +...
> --
> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
> of the Code Aurora Forum, hosted by the  Linux Foundation.
> 
