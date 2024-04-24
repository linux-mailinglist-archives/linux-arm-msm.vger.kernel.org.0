Return-Path: <linux-arm-msm+bounces-18504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBC28B14DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 22:48:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92EDA284742
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 20:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C3F156977;
	Wed, 24 Apr 2024 20:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iUb7cQHR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D4915689A
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 20:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713991697; cv=none; b=Wb1mTnYB/gYzdwKGzhkZ/JUn8ciY+/XekyKtl8zUKs76QbCSs1Z8t2AbRn23hjPnHiCvwMGuZknlqe7SyTO2hekXfWFmebbSbdCa/TRBrot3afnqv9sCNLqg/eBhpE9MwbnR3NXCsmnEwFlsXaO3lcsD+AQVj2tpNgTgYyT+//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713991697; c=relaxed/simple;
	bh=APvvGfjt6M4RGHG68kcPHxSbyBNeXdPdp01IWBW2Xh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bh//XbDQhcTvwqLmWSV7jz0rBHSFUeGJOyzErnzmF1LSFMEBT97gnhPicOz0gGyTjkKMtQ/L6lmAQfbfXh6HOyVozOM8sORCKUhv0bFmJ7mB3z5OiuHqyW6uo0XO15P++Qr8dfOk9x1mdmQyZ+2Zu4IfuAHx5Ka9zV+BJTHO0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iUb7cQHR; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1304145276.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 13:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713991695; x=1714596495; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l1pZWiUWl1nMefgATaw3YsOhf+pqCV2nzomHBQjDgDo=;
        b=iUb7cQHRdPzSnLuOtQ10HQPxCXShHqlw84cVDllBYOK9PLxLXNpUcxPkGcxvBUu73J
         hUmjPh0vxM8sawc1ymMSsanW8e05vYq5DQYUDciIRe4XmvrQaH38QOyruo0CWffkX4En
         mZB0xm5MDcAx31d278omLoglYOBSzYO+dK1pSLTLH3AOtKqmDv9fIJ9Hh6yeLwA6jWxC
         QEyVY8wJ1E4VhNsls+RKbnKQEA1F8ElpoSn75M4+2nTj9K7MhfyuVpjDPncxY0ydFrZ8
         +eb1VbadOtXSSLQzh/s59jVAaQ9N5JNW2u5VFl8+ByPR3FPM26Am5gp3ADe0Vplq8JhC
         9W6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713991695; x=1714596495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l1pZWiUWl1nMefgATaw3YsOhf+pqCV2nzomHBQjDgDo=;
        b=LE7BOFK2z0XjaiM0ODteNhDmCRuLLjV9WIccRV9v/LEkUjGeRF6TTBYAlw2CVDphsY
         93iB4ajXP+vLjlatwv32z7pZiQT5EhWJHXZZZPYC8ZHzjmOq7GYRCNIp6ZRNmSSoegTZ
         NDkxv8jDLGRHUpfkuZvs/HRvxOoWFUxQlz5rJqV+ojMKld6T2eRvtBa9X9nt01MBijjW
         ocB0Q8rHTVoUPr7bXOHwezq+j+kvIpl3yIj1vm7dMb08EL/x7hrSPyDmfo5JapRU+cbx
         1mHPR7ONQZqsw8uTi3BjOTiKdKOEEV9Wi3yTiqa+a11cbGHODl8oC/E4WGPW8RHqbzhi
         rrQA==
X-Forwarded-Encrypted: i=1; AJvYcCXYtVziYvjkgkghaozrgXgM/U18dAlR+zIOJ0dN9FrQ3TyI8hoJN951KsM7tvw41MMpIBiLeS/aZqptSrjvgLFXv+6jh1S/t4J0PKfbRg==
X-Gm-Message-State: AOJu0Yzeb8BOeMfyx78wX4iDxXpimzAhG4KtyI8OE42UfvDs8zKly2C9
	AmOgD194WHJ+GehbSpYcXruzgPL63hA57V7Zd85o4m/MwlfXhjdi7iO+DGCsGoHsDD+raUuw5+r
	82xsMBRkQR212NyWse8TZFdfeEZsp3ZOWyXfGOQ==
X-Google-Smtp-Source: AGHT+IFoGSJUlBELzEJjb2GiElbJgSl6N/By/Nucv+WQf0ab/sVj/6V4J/pp7hLNpClrwGLOjUJdwEmao5p/n9i55u8=
X-Received: by 2002:a25:ae85:0:b0:dcc:623e:1b5d with SMTP id
 b5-20020a25ae85000000b00dcc623e1b5dmr621667ybj.31.1713991695065; Wed, 24 Apr
 2024 13:48:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240410124628.171783-1-brgl@bgdev.pl> <20240410124628.171783-2-brgl@bgdev.pl>
In-Reply-To: <20240410124628.171783-2-brgl@bgdev.pl>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 23:48:03 +0300
Message-ID: <CAA8EJpq81Z4YH1apTidntwcfpsL3YjgMM_y+G0=waaoPjRL-Cw@mail.gmail.com>
Subject: Re: [PATCH v7 01/16] regulator: dt-bindings: describe the PMU module
 of the QCA6390 package
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Valo <kvalo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Saravana Kannan <saravanak@google.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Arnd Bergmann <arnd@arndb.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Abel Vesa <abel.vesa@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>, Amit Pundir <amit.pundir@linaro.org>, 
	Xilin Wu <wuxilin123@gmail.com>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Apr 2024 at 15:46, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The QCA6390 package contains discreet modules for WLAN and Bluetooth. They
> are powered by the Power Management Unit (PMU) that takes inputs from the
> host and provides LDO outputs. This document describes this module.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/regulator/qcom,qca6390-pmu.yaml  | 151 ++++++++++++++++++
>  1 file changed, 151 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
>
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
> new file mode 100644
> index 000000000000..9d39ff9a75fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
> @@ -0,0 +1,151 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. QCA6390 PMU Regulators
> +
> +maintainers:
> +  - Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> +
> +description:
> +  The QCA6390 package contains discreet modules for WLAN and Bluetooth. They
> +  are powered by the Power Management Unit (PMU) that takes inputs from the
> +  host and provides LDO outputs. This document describes this module.
> +
> +properties:
> +  compatible:
> +    const: qcom,qca6390-pmu
> +
> +  vddaon-supply:
> +    description: VDD_AON supply regulator handle
> +
> +  vddpmu-supply:
> +    description: VDD_PMU supply regulator handle
> +
> +  vddrfa0p95-supply:
> +    description: VDD_RFA_0P95 supply regulator handle
> +
> +  vddrfa1p3-supply:
> +    description: VDD_RFA_1P3 supply regulator handle
> +
> +  vddrfa1p9-supply:
> +    description: VDD_RFA_1P9 supply regulator handle
> +
> +  vddpcie1p3-supply:
> +    description: VDD_PCIE_1P3 supply regulator handle<S-Del>
> +
> +  vddpcie1p9-supply:
> +    description: VDD_PCIE_1P9 supply regulator handle
> +
> +  vddio-supply:
> +    description: VDD_IO supply regulator handle
> +
> +  wlan-enable-gpios:
> +    maxItems: 1
> +    description: GPIO line enabling the ATH11K WLAN module supplied by the PMU
> +
> +  bt-enable-gpios:
> +    maxItems: 1
> +    description: GPIO line enabling the ATH11K Bluetooth module supplied by the PMU

As a side node, I think we should also steal swctrl pin from the
bluetooth device node. It represents the status of the PMU and as such
it is not BT-specific.

> +
> +  regulators:
> +    type: object
> +    description:
> +      LDO outputs of the PMU
> +
> +    patternProperties:
> +      "^ldo[0-9]$":
> +        $ref: regulator.yaml#
> +        type: object
> +        unevaluatedProperties: false
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - regulators
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,qca6390-pmu
> +    then:
> +      required:
> +        - vddaon-supply
> +        - vddpmu-supply
> +        - vddrfa0p95-supply
> +        - vddrfa1p3-supply
> +        - vddrfa1p9-supply
> +        - vddpcie1p3-supply
> +        - vddpcie1p9-supply
> +        - vddio-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    pmu {
> +        compatible = "qcom,qca6390-pmu";
> +
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
> +
> +        vddaon-supply = <&vreg_s6a_0p95>;
> +        vddpmu-supply = <&vreg_s2f_0p95>;
> +        vddrfa0p95-supply = <&vreg_s2f_0p95>;
> +        vddrfa1p3-supply = <&vreg_s8c_1p3>;
> +        vddrfa1p9-supply = <&vreg_s5a_1p9>;
> +        vddpcie1p3-supply = <&vreg_s8c_1p3>;
> +        vddpcie1p9-supply = <&vreg_s5a_1p9>;
> +        vddio-supply = <&vreg_s4a_1p8>;
> +
> +        wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
> +        bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
> +
> +        regulators {
> +            vreg_pmu_rfa_cmn: ldo0 {
> +                regulator-name = "vreg_pmu_rfa_cmn";
> +            };
> +
> +            vreg_pmu_aon_0p59: ldo1 {
> +                regulator-name = "vreg_pmu_aon_0p59";
> +            };
> +
> +            vreg_pmu_wlcx_0p8: ldo2 {
> +                regulator-name = "vreg_pmu_wlcx_0p8";
> +            };
> +
> +            vreg_pmu_wlmx_0p85: ldo3 {
> +                regulator-name = "vreg_pmu_wlmx_0p85";
> +            };
> +
> +            vreg_pmu_btcmx_0p85: ldo4 {
> +                regulator-name = "vreg_pmu_btcmx_0p85";
> +            };
> +
> +            vreg_pmu_rfa_0p8: ldo5 {
> +                regulator-name = "vreg_pmu_rfa_0p8";
> +            };
> +
> +            vreg_pmu_rfa_1p2: ldo6 {
> +                regulator-name = "vreg_pmu_rfa_1p2";
> +            };
> +
> +            vreg_pmu_rfa_1p7: ldo7 {
> +                regulator-name = "vreg_pmu_rfa_1p7";
> +            };
> +
> +            vreg_pmu_pcie_0p9: ldo8 {
> +                regulator-name = "vreg_pmu_pcie_0p9";
> +            };
> +
> +            vreg_pmu_pcie_1p8: ldo9 {
> +                regulator-name = "vreg_pmu_pcie_1p8";
> +            };
> +        };
> +    };
> --
> 2.40.1
>


-- 
With best wishes
Dmitry

