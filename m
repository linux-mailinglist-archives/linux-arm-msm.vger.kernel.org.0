Return-Path: <linux-arm-msm+bounces-81221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E327FC4D368
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 11:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9F6B54FBE2C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 10:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7F8350D4E;
	Tue, 11 Nov 2025 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWOzvPIp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A689D350D47;
	Tue, 11 Nov 2025 10:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762858112; cv=none; b=DsWL2MBKc66TOrLTWuLMvYMNjO8UFnsX1b3PssLiObCTskg5ViH8ZnHvOml15P+aNkxdY95xFbjtJwhRUVwVRBIde30dDA9V/MKtEiD3X19/tNMauMcMVOJ0EZLDGLaIADAadJ/bCQ7TAK/8OssUEP37nCbdhji1qkDfWE41InI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762858112; c=relaxed/simple;
	bh=9zZ23vt9sZdhE1zPEplVoCY2Fk6S00sT6kxcoy/iW0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j54qNcynjxjCttACIb3QBr132+zetO6sewsjvYwlzEHKuGdqAwTjHIfObIbSMh/MYQhruF/U+/9fvrVrUhkFf9xjWlN+jB/wvvQaPIXH8KlEi04uEEFtzq6n2tome9mK8s16KCDvagHM5d3BmDBnJtUZloZGktjnYeZ2TWSp8L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWOzvPIp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A735AC116D0;
	Tue, 11 Nov 2025 10:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762858112;
	bh=9zZ23vt9sZdhE1zPEplVoCY2Fk6S00sT6kxcoy/iW0k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YWOzvPIpEXvj+Sq+tkuCqQ7wY8gF9t59GQorEA3Q0qbeqRdhKZ9QgJRXeFTfBdU4v
	 30ao4sUM/qVsiPKwerKMsIXivQdWEuJQf0R96k+q9wBcc4c6zBsPzP5InCPozjkqDS
	 L271g83K6CyKibXu0O46ATnj2NlXdYU+6fyDabdkIYRfrE98O8pTkEBFMUdRQ5sQev
	 TtmTD5f+XpNi5cv7jUz/ioq1FjTSmob2ArIGhLa+9h7cMIFS+WEouHckcb/0XMvOj4
	 aooILpos9YgvD7CYWTIKqWe2g676LJv8M22HR2b7jc/FIYI0gdt7Pzbtt7SiDzHE2t
	 qeGZrYYR8bkFA==
Message-ID: <c388696d-ecf6-4241-8c74-32cd32e12ea2@kernel.org>
Date: Tue, 11 Nov 2025 11:48:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add waveshare MIPI-DSI
 panels support
To: Sudarshan Shetty <tessolveupstream@gmail.com>, andersson@kernel.org,
 konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251111104245.3420041-1-tessolveupstream@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251111104245.3420041-1-tessolveupstream@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/2025 11:42, Sudarshan Shetty wrote:
> Device tree bindings for Waveshare MIPI-DSI panels
> of various sizes (5.0, 5.5, 7.0, 8.0, and 10.1).

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

> These panels require proper power sequencing via an external
> regulator and a backlight node for brightness control.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  .../display/panel/waveshare,dsi-panel.yaml    | 84 +++++++++++++++++++
>  ...waveshare,touchscreen-panel-regulator.yaml | 72 ++++++++++++++++

Do not mix up patches from different subsystems into one patchset.

>  2 files changed, 156 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml
> 
Please use subject prefixes matching the subsystem. You can get them for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters


> diff --git a/Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml b/Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
> new file mode 100644
> index 000000000000..a42ce065124f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/waveshare,dsi-panel.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/waveshare,dsi-panel.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Waveshare 10.1" DSI Touch Display Panel
> +
> +maintainers:
> +  - Sudarshan Shetty <tessolveupstream@gmail.com>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - waveshare,12.3-dsi-touch-a,4lane
> +      - waveshare,10.1-dsi-touch-a
> +      - waveshare,10.1-dsi-touch-a-4lane
> +      - waveshare,10.1-dsi-touch-b
> +      - waveshare,10.1-dsi-touch-b,4lane
> +      - waveshare,9.0-dsi-touch-b
> +      - waveshare,9.0-dsi-touch-b,4lane
> +      - waveshare,8.8-dsi-touch-a
> +      - waveshare,8.0-dsi-touch-a
> +      - waveshare,8.0-dsi-touch-a-4lane
> +      - waveshare,7.0-dsi-touch-a
> +      - waveshare,7.0-dsi-touch-b
> +      - waveshare,5.5-dsi-touch-a
> +      - waveshare,5.0-dsi-touch-a
> +      - waveshare,4.0-dsi-touch-c
> +      - waveshare,3.4-dsi-touch-c

None of these come with any reasonable model names? How so?

> +
> +  reg:
> +    description: DSI virtual channel
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Power supply regulator for the panel
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO to control panel reset
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO to control panel power enable
> +
> +required:
> +  - compatible
> +  - reg
> +  - vdd-supply
> +  - reset-gpios
> +  - enable-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi@ae94000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        panel@1 {
> +            compatible = "waveshare,10.1-dsi-touch-a";
> +            reg = <1>;
> +            vdd-supply = <&vreg_l11a>;
> +            reset-gpios = <&display_mcu 1 GPIO_ACTIVE_HIGH>;
> +            enable-gpios = <&display_mcu 2 GPIO_ACTIVE_HIGH>;
> +
> +            port {
> +                panel_in: endpoint {
> +                    remote-endpoint = <&mdss_dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +    mdss_dsi0_out: endpoint {
> +        remote-endpoint = <&panel_in>;
> +    };

Drop node, not relevant here.

> diff --git a/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml b/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml
> new file mode 100644
> index 000000000000..be81be5d2d74
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/waveshare,touchscreen-panel-regulator.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/waveshare,touchscreen-panel-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Waveshare Touchscreen Panel Regulator
> +
> +maintainers:
> +  - Sudarshan Shetty <tessolveupstream@gmail.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  Regulator driver for Waveshare touchscreen display units.

Driver as Linux driver?

> +  This regulator enables and disables panel power and provides
> +  backlight control over I2C.
> +
> +properties:
> +  compatible:
> +    const: waveshare,touchscreen-panel-regulator

That's way too generic. Description doesn't tell me much more what is
this hardware.

How is so that a device with specific programming model over I2C has no
name, no model, absolutely nothing which would identify that programming
model?

> +
> +  reg:
> +    maxItems: 1
> +    description: I2C address of the regulator device

Drop description, redundant.

> +
> +  vin-supply:
> +    description: Input supply regulator for the panel
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: GPIO to enable/disable regulator
> +
> +required:
> +  - compatible
> +  - reg
> +  - vin-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    /dts-v1/;
> +    /plugin/;
> +
> +    / {

Drop all this. Look at existing bindings first, how this is written.
There is no single file like that. Please do not come up with your own
style.

Best regards,
Krzysztof

