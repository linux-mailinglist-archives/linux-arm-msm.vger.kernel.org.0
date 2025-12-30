Return-Path: <linux-arm-msm+bounces-86894-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA9CE881A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 02:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5EDD3009438
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 01:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A1C25A645;
	Tue, 30 Dec 2025 01:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJz+Ym6g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D3B139D0A;
	Tue, 30 Dec 2025 01:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767059497; cv=none; b=A9tOZxBsXjIhfrIhizsU04at2FHlmjQzA25Q50PMraeHZ7xKRfVwtPD29DrtuLFe8oyjMvxancfUl0mPh10ERX8T1zsDvwMgu/qGL4qN5m7F+BYXFYyq9kllyyDNqsPh56PMemnZjLzzPzvPk2whqC53IViuSxsPVWZ7JtQ5pLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767059497; c=relaxed/simple;
	bh=OBturc9gnq7p1Z8WM2OtT8pLKo5/2hWGC55/0eg7aSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZkC1KBtKMzbw3Fu9kG9jaXRgtsBjc1rOJgl7SxYMSQGtFowkE72BS05ACatylsRMS64FAcX3MlDTld448IdiKlYuJ+3jvSEoY+bz6J4IZxhkNSBSUx2sPY1mQphEOAkPMqmnqKMJUcUrdMTfwC7cTyVw0hZKgyNh8Svy0VTOtgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJz+Ym6g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8D6C4CEF7;
	Tue, 30 Dec 2025 01:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767059496;
	bh=OBturc9gnq7p1Z8WM2OtT8pLKo5/2hWGC55/0eg7aSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VJz+Ym6glTYLUQoy5ymhQ18MC/d/L5HltQ+boUi2Jtx1jwuGkU25XLFwpu8AtabSM
	 4zBEs3l/rvABl1BVY+9DeTXfRj6TaYTGjYliH27VBcfS7N4xY9egB0Vnm2wuXQbYH8
	 kMdkGa9C52YyZ87g6XzUI64KGIChqPjbGV1I1zZ1N5wiYXxO9rZIYVURNKaay0nu4X
	 PmclJwuLxUAJv9NVPIW+q+8AuX6ScQgCKpVvxOrkW7YF1fAGBr1AYJnjwkvhgG1l4m
	 XHvXCI7KQQi3/M/5CT8dxZETzE08F6BzgLa3mOIuIGvmvBOV+sxQKdGQLvtMszXMEc
	 gbiNA/ZNK5AVQ==
Date: Mon, 29 Dec 2025 19:51:35 -0600
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Casey Connolly <casey.connolly@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Jami Kettunen <jami.kettunen@somainline.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 04/11] dt-bindings: display: panel: Describe Samsung
 SOFEF01-M DDIC
Message-ID: <20251230015135.GA3066456-robh@kernel.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-drm-panels-sony-v2-4-82a87465d163@somainline.org>

On Mon, Dec 22, 2025 at 12:32:10AM +0100, Marijn Suijten wrote:
> Document the Samsung SOFEF01-M Display-Driver-IC and 1080x2520@60Hz
> command-mode DSI panels found in many Sony phones:
> - Sony Xperia 5 (kumano bahamut): amb609tc01
> - Sony Xperia 10 II (seine pdx201): ams597ut01
> - Sony Xperia 10 III (lena pdx213): ams597ut04
> - Sony Xperia 10 IV (murray pdx225): ams597ut05
> - Sony Xperia 10 V (zambezi pdx235): ams605dk01
> - Sony Xperia 10 VI (columbia pdx246): ams605dk01
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,sofef01-m.yaml  | 120 +++++++++++++++++++++
>  MAINTAINERS                                        |   5 +
>  2 files changed, 125 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
> new file mode 100644
> index 000000000000..a8ff5223677c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,sofef01-m.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SOFEF01-M DDI for 1080x2520@60Hz 6.0"/6.1" OLED DSI panels
> +
> +maintainers:
> +  - Marijn Suijten <marijn.suijten@somainline.org>
> +
> +description: |
> +  Samsung SOFEF01-M Display-Driver-IC found in multiple Sony smartphones, paired with
> +  the following panel:
> +   - Sony Xperia 5 (kumano bahamut): amb609tc01
> +   - Sony Xperia 10 II (seine pdx201): ams597ut01
> +   - Sony Xperia 10 III (lena pdx213): ams597ut04
> +   - Sony Xperia 10 IV (murray pdx225): ams597ut05
> +   - Sony Xperia 10 V (zambezi pdx235): ams605dk01
> +   - Sony Xperia 10 VI (columbia pdx246): ams605dk01
> +
> +  The assembly features a Samsung touchscreen compatible with
> +  samsung,s6sy761.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: samsung,sofef01-m-amb609tc01
> +    then:
> +      properties:
> +        vci-supply:
> +          description: DisplayIC Operation supply (3.0V)

The error reported is on the wrong patch. Not sure why, but the problem 
is here. With 'additionalProperties: false', this property is not 
factored in and is considered unknown. That can be fixed using 
'unevaluatedProperties', but instead, move this to the top level 
'properties'.

> +
> +      required:
> +        - vci-supply
> +
> +    else:
> +      properties:
> +        vci-supply: false
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,sofef01-m-amb609tc01 # 6.1"
> +      - samsung,sofef01-m-ams597ut01 # 6.0"
> +      - samsung,sofef01-m-ams597ut04 # 6.0"
> +      - samsung,sofef01-m-ams597ut05 # 6.0"
> +      - samsung,sofef01-m-ams605dk01 # 6.1"
> +
> +  port: true
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  reset-gpios: true
> +
> +  vddio-supply:
> +    description: I/O voltage supply (1.8V)
> +
> +required:
> +  - compatible
> +  - port
> +  - reg
> +  - reset-gpios
> +  - vddio-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "samsung,sofef01-m-amb609tc01";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +
> +            vci-supply = <&vreg_l17a_3p0>;
> +            vddio-supply = <&vreg_l14a_1p8>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    dsi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        panel@0 {
> +            compatible = "samsung,sofef01-m-ams597ut01";
> +            reg = <0>;
> +
> +            reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
> +
> +            vddio-supply = <&pm6125_l12>;
> +
> +            port {
> +                endpoint {
> +                    remote-endpoint = <&dsi0_out>;
> +                };
> +            };
> +        };
> +    };

The first example is enough.

