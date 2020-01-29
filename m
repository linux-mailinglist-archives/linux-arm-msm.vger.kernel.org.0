Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7844E14D2B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 22:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgA2VrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 16:47:18 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:35293 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726222AbgA2VrS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 16:47:18 -0500
Received: by mail-io1-f67.google.com with SMTP id h8so1571183iob.2;
        Wed, 29 Jan 2020 13:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E2M7r01dHs2l3ooUJc4bl3SjtrZCUeWX0ey0xOZigqU=;
        b=QfQN7BmCpiVEpaA7QzbCBJtoyonjhgY4OdhNrRBBdsJd3lMgcVqDJDThj0w5xHv5lL
         PnDoDdUl7DnuLmc2LxLZLOKU8dxE/MhcyhggslxCPSR/iTck3GdIMr85EUD5ZNO2hgwE
         2QSoNTQgVRbnzAAQF+drXS24UTPEyjcgitKi9lxge/a2GQHWlJTiI9Y+AKmJQ086CUKm
         pNKwWrLZeEFdhqZolpycRIA/9mUkWG6dQApWgw+Djy9GEKltzblyk/y9oAlScDDUKPp3
         zDLbysoE2XDR9XgS/Y5hRxoYRg1+NKAi0otUMyJj1p1VHxQo+oXmZHtLJKeXv8Dt1Bek
         6aeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E2M7r01dHs2l3ooUJc4bl3SjtrZCUeWX0ey0xOZigqU=;
        b=DHTQZooWYHe2/gnj1YM5xkEKyF2c8OxIP0WNzFMg/vIbu4HEIzy0dvmHjMvbKCs/uy
         GQcAnOiFl1eapEVTPa0MysbF3rUMB7OY69i0QdvDGJuX4nbVJ8xlUuOGe8Nfqv1NieVU
         7CV91VytYLbM1BbHqKZ63pi02cR88LPHzdkhYyVPwWB01zA6NXK69f/IHLt+yiyLPl/L
         5oj53SSuNO4LV1Mjzdt/lzYAbhE770RqwI/M9Lx+YOdGs1Lpoa7/q9QLDxFUMu09eRby
         QIBRYD7MSpSNtpspB61eT+F8SpCEhIR5g3ZoAleG+SsfDrVqiUIw3W40WH9GagdU6vCi
         CTkA==
X-Gm-Message-State: APjAAAWuiWce1x8FP2tUaEUQUf5D0vFjNlsGLOD/AqZ+YCSCmvt0kC4I
        jaPPboI2i1EmtR+SzZstLKRcngyavJ82eQY+z8UQKg==
X-Google-Smtp-Source: APXvYqzlQoee8NhbgVKhdryqB8sTaJtu7EJk502pIjqq9FpGxBtzUKppSwBUS5yQQXAHLPAWuaL4KNl2G0buxmKbyrc=
X-Received: by 2002:a02:77d4:: with SMTP id g203mr1051379jac.19.1580334436592;
 Wed, 29 Jan 2020 13:47:16 -0800 (PST)
MIME-Version: 1.0
References: <20200129132313.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
In-Reply-To: <20200129132313.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 29 Jan 2020 14:47:05 -0700
Message-ID: <CAOCk7Nr7x+AbBmgcFdZbor0iAqxMCnH+YHD4A7uSyYpxG-5wcg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: qcom: Fix self-validation, split, and
 clean cruft
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>, absahu@codeaurora.org,
        sivaprak@codeaurora.org, anusharao@codeaurora.org,
        sricharan@codeaurora.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        DTML <devicetree@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 29, 2020 at 2:24 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
> because it required a property to be either (3 entries big),
> (3 entries big), or (7 entries big), but not more than one of those
> things.  That didn't make a ton of sense.
>
> This patch splits all of the exceptional device trees (AKA those that
> would have needed if/then/else rules) from qcom,gcc.yaml.  It also
> cleans up some cruft found while doing that.
>
> After this lands, this worked for me atop clk-next:
>   for f in \
>     Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
>       ARCH=arm64 make dt_binding_check DT_SCHEMA_FILES=$f; \
>       ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=$f; \
>   done
>
> Arbitrary decisions made (yell if you want changed):
> - Left all the older devices (where clocks / clock-names weren't
>   specified) in a single file.
> - Didn't make clocks "required" for msm8996/msm8998 but left them as
>   listed.  This seems a little weird but means I didn't need to open a
>   whole different can of worms.  It matches the old binding for
>   msm8996 and doesn't match the binding (but matches the dts) for
>   msm8998.

The clocks should be required for msm8998.  I know the current dts is
broken.  As soon as I can get some time to make more progress on it,
I'll push it forward toward being correct.

>
> Misc cleanups as part of this patch:
> - sm8150 was claimed to be same set of clocks as sc7180, but driver
>   and dts appear to say that "bi_tcxo_ao" doesn't exist.  Fixed.
> - In "apq8064", "#thermal-sensor-cells" was missing the "#".
> - Got rid of "|" at the end of top description since spacing doesn't
>   matter.
> - Changed indentation to consistently 2 spaces (it was 3 in some
>   places).
> - Added period at the end of protected-clocks description.
> - No space before ":".
> - Updated sc7180/sm8150 example to use the 'qcom,rpmh.h' include.
> - Updated sc7180/sm8150 example to use larger address/size cells as
>   per reality.
> - Updated sc7180/sm8150 example to point to the sleep_clk rather than
>   <0>.
> - Made it so that gcc-ipq8074 didn't require #power-domain-cells since
>   actual dts didn't have it and I got no hits from:
>     git grep _GDSC include/dt-bindings/clock/qcom,gcc-ipq8074.h
> - Made it so that gcc-qcs404 didn't require #power-domain-cells since
>   actual dts didn't have it and I got no hits from:
>     git grep _GDSC include/dt-bindings/clock/qcom,gcc-qcs404.h
>
> Noticed, but not done in this patch (volunteers needed):
> - Add "aud_ref_clk" to sm8150 bindings / dts even though I found a
>   reference to it in "gcc-sm8150.c".
> - Fix node name in actual ipq8074 to be "clock-controller" (it's gcc).
> - Since the example doesn't need phandes to exist, in msm8998 could
>   just make up places providing some of the clocks currently bogused
>   out with <0>.

Yeah, thats intentional since we don't have bindings for all of the
clocks that feed into the msm8998 gcc right now.

>
> Fixes: ab91f72e018a ("clk: qcom: gcc-msm8996: Fix parent for CLKREF clocks")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  .../bindings/clock/qcom,gcc-apq8064.yaml      |  81 +++++++
>  .../bindings/clock/qcom,gcc-ipq8074.yaml      |  48 ++++
>  .../bindings/clock/qcom,gcc-msm8996.yaml      |  65 ++++++
>  .../bindings/clock/qcom,gcc-msm8998.yaml      |  88 ++++++++
>  .../bindings/clock/qcom,gcc-qcs404.yaml       |  48 ++++
>  .../bindings/clock/qcom,gcc-sc7180.yaml       |  72 ++++++
>  .../bindings/clock/qcom,gcc-sm8150.yaml       |  69 ++++++
>  .../devicetree/bindings/clock/qcom,gcc.yaml   | 212 ++----------------
>  8 files changed, 489 insertions(+), 194 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> new file mode 100644
> index 000000000000..c09497881cd2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc-apq8064.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for APQ8064
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description:
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on APQ8064.
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-apq8064
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  nvmem-cells:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Qualcomm TSENS (thermal sensor device) on some devices can
> +      be part of GCC and hence the TSENS properties can also be part
> +      of the GCC/clock-controller node.
> +      For more details on the TSENS properties please refer
> +      Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> +
> +  nvmem-cell-names:
> +    minItems: 1
> +    maxItems: 2
> +    description:
> +      Names for each nvmem-cells specified.
> +    items:
> +      - const: calib
> +      - const: calib_backup
> +
> +  '#thermal-sensor-cells':
> +    const: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +  - nvmem-cells
> +  - nvmem-cell-names
> +  - '#thermal-sensor-cells'
> +
> +examples:
> +  - |
> +    clock-controller@900000 {
> +      compatible = "qcom,gcc-apq8064";
> +      reg = <0x00900000 0x4000>;
> +      nvmem-cells = <&tsens_calib>, <&tsens_backup>;
> +      nvmem-cell-names = "calib", "calib_backup";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +      #thermal-sensor-cells = <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> new file mode 100644
> index 000000000000..1c6461c52a47
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc-ipq8074.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Bindingfor IPQ8074
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description:
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on IPQ8074.
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-ipq8074
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +examples:
> +  - |
> +    clock-controller@1800000 {
> +      compatible = "qcom,gcc-ipq8074";
> +      reg = <0x01800000 0x80000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
> new file mode 100644
> index 000000000000..32782e648c7e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
> @@ -0,0 +1,65 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc-msm8996.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8996
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description:
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on MSM8996.
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-msm8996
> +
> +  clocks:
> +    items:
> +      - description: XO source
> +      - description: Second XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: cxo
> +      - const: cxo2
> +      - const: sleep_clk
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +examples:
> +  - |
> +    clock-controller@300000 {
> +      compatible = "qcom,gcc-msm8996";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +      reg = <0x300000 0x90000>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
> new file mode 100644
> index 000000000000..75c0ee208965
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc-msm8998.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8998
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description:
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on MSM8998.
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-msm8998
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source
> +      - description: USB 3.0 phy pipe clock
> +      - description: UFS phy rx symbol clock for pipe 0
> +      - description: UFS phy rx symbol clock for pipe 1
> +      - description: UFS phy tx symbol clock
> +      - description: PCIE phy pipe clock
> +
> +  clock-names:
> +    items:
> +      - const: xo
> +      - const: sleep_clk
> +      - const: usb3_pipe
> +      - const: ufs_rx_symbol0
> +      - const: ufs_rx_symbol1
> +      - const: ufs_tx_symbol0
> +      - const: pcie0_pipe
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmcc.h>
> +    clock-controller@100000 {
> +      compatible = "qcom,gcc-msm8998";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +      reg = <0x00100000 0xb0000>;
> +      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> +               <&sleep>,
> +               <0>,
> +               <0>,
> +               <0>,
> +               <0>,
> +               <0>;
> +      clock-names = "xo",
> +                    "sleep_clk",
> +                    "usb3_pipe",
> +                    "ufs_rx_symbol0",
> +                    "ufs_rx_symbol1",
> +                    "ufs_tx_symbol0",
> +                    "pcie0_pipe";
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
> new file mode 100644
> index 000000000000..f881cbeab594
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc-qcs404.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Bindingfor QCS404
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description:
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on QCS404.
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-qcs404
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +examples:
> +  - |
> +    clock-controller@1800000 {
> +      compatible = "qcom,gcc-qcs404";
> +      reg = <0x01800000 0x80000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
> new file mode 100644
> index 000000000000..b6a27da0c9b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc-sc7180.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SC7180
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description:
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SC7180.
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sc7180
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Board active XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: bi_tcxo_ao
> +      - const: sleep_clk
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +      compatible = "qcom,gcc-sc7180";
> +      reg = <0 0x00100000 0 0x1f0000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&rpmhcc RPMH_CXO_CLK_A>,
> +               <&sleep_clk>;
> +      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
> new file mode 100644
> index 000000000000..ca581b2e3286
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
> @@ -0,0 +1,69 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,gcc-sm8150.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Global Clock & Reset Controller Binding for SM8150
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>
> +  - Taniya Das <tdas@codeaurora.org>
> +
> +description:
> +  Qualcomm global clock control module which supports the clocks, resets and
> +  power domains on SM8150.
> +
> +properties:
> +  compatible:
> +    const: qcom,gcc-sm8150
> +
> +  clocks:
> +    items:
> +      - description: Board XO source
> +      - description: Sleep clock source
> +
> +  clock-names:
> +    items:
> +      - const: bi_tcxo
> +      - const: sleep_clk
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  '#reset-cells':
> +    const: 1
> +
> +  '#power-domain-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  protected-clocks:
> +    description:
> +      Protected clock specifier list as per common clock binding.
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,rpmh.h>
> +    clock-controller@100000 {
> +      compatible = "qcom,gcc-sm8150";
> +      reg = <0 0x00100000 0 0x1f0000>;
> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
> +               <&sleep_clk>;
> +      clock-names = "bi_tcxo", "sleep_clk";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +      #power-domain-cells = <1>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> index cac1150c9292..a891e5a37369 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.yaml
> @@ -10,81 +10,28 @@ maintainers:
>    - Stephen Boyd <sboyd@kernel.org>
>    - Taniya Das <tdas@codeaurora.org>
>
> -description: |
> +description:
>    Qualcomm global clock control module which supports the clocks, resets and
>    power domains.
>
>  properties:
> -  compatible :
> +  compatible:
>      enum:
> -       - qcom,gcc-apq8064
> -       - qcom,gcc-apq8084
> -       - qcom,gcc-ipq4019
> -       - qcom,gcc-ipq6018
> -       - qcom,gcc-ipq8064
> -       - qcom,gcc-ipq8074
> -       - qcom,gcc-msm8660
> -       - qcom,gcc-msm8916
> -       - qcom,gcc-msm8960
> -       - qcom,gcc-msm8974
> -       - qcom,gcc-msm8974pro
> -       - qcom,gcc-msm8974pro-ac
> -       - qcom,gcc-msm8994
> -       - qcom,gcc-msm8996
> -       - qcom,gcc-msm8998
> -       - qcom,gcc-mdm9615
> -       - qcom,gcc-qcs404
> -       - qcom,gcc-sc7180
> -       - qcom,gcc-sdm630
> -       - qcom,gcc-sdm660
> -       - qcom,gcc-sdm845
> -       - qcom,gcc-sm8150
> -
> -  clocks:
> -    oneOf:
> -      #qcom,gcc-sm8150
> -      #qcom,gcc-sc7180
> -      - items:
> -        - description: Board XO source
> -        - description: Board active XO source
> -        - description: Sleep clock source
> -      #qcom,gcc-msm8996
> -      - items:
> -        - description: XO source
> -        - description: Second XO source
> -        - description: Sleep clock source
> -      #qcom,gcc-msm8998
> -      - items:
> -        - description: Board XO source
> -        - description: Sleep clock source
> -        - description: USB 3.0 phy pipe clock
> -        - description: UFS phy rx symbol clock for pipe 0
> -        - description: UFS phy rx symbol clock for pipe 1
> -        - description: UFS phy tx symbol clock
> -        - description: PCIE phy pipe clock
> -
> -  clock-names:
> -    oneOf:
> -      #qcom,gcc-sm8150
> -      #qcom,gcc-sc7180
> -      - items:
> -        - const: bi_tcxo
> -        - const: bi_tcxo_ao
> -        - const: sleep_clk
> -      #qcom,gcc-msm8996
> -      - items:
> -        - const: cxo
> -        - const: cxo2
> -        - const: sleep_clk
> -      #qcom,gcc-msm8998
> -      - items:
> -        - const: xo
> -        - const: sleep_clk
> -        - const: usb3_pipe
> -        - const: ufs_rx_symbol0
> -        - const: ufs_rx_symbol1
> -        - const: ufs_tx_symbol0
> -        - const: pcie0_pipe
> +      - qcom,gcc-apq8084
> +      - qcom,gcc-ipq4019
> +      - qcom,gcc-ipq6018
> +      - qcom,gcc-ipq8064
> +      - qcom,gcc-msm8660
> +      - qcom,gcc-msm8916
> +      - qcom,gcc-msm8960
> +      - qcom,gcc-msm8974
> +      - qcom,gcc-msm8974pro
> +      - qcom,gcc-msm8974pro-ac
> +      - qcom,gcc-msm8994
> +      - qcom,gcc-mdm9615
> +      - qcom,gcc-sdm630
> +      - qcom,gcc-sdm660
> +      - qcom,gcc-sdm845
>
>    '#clock-cells':
>      const: 1
> @@ -98,31 +45,9 @@ properties:
>    reg:
>      maxItems: 1
>
> -  nvmem-cells:
> -    minItems: 1
> -    maxItems: 2
> -    description:
> -      Qualcomm TSENS (thermal sensor device) on some devices can
> -      be part of GCC and hence the TSENS properties can also be part
> -      of the GCC/clock-controller node.
> -      For more details on the TSENS properties please refer
> -      Documentation/devicetree/bindings/thermal/qcom-tsens.txt
> -
> -  nvmem-cell-names:
> -    minItems: 1
> -    maxItems: 2
> -    description:
> -      Names for each nvmem-cells specified.
> -    items:
> -      - const: calib
> -      - const: calib_backup
> -
> -  'thermal-sensor-cells':
> -    const: 1
> -
>    protected-clocks:
>      description:
> -       Protected clock specifier list as per common clock binding
> +      Protected clock specifier list as per common clock binding.
>
>  required:
>    - compatible
> @@ -131,33 +56,6 @@ required:
>    - '#reset-cells'
>    - '#power-domain-cells'
>
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        const: qcom,gcc-apq8064
> -
> -then:
> -  required:
> -    - nvmem-cells
> -    - nvmem-cell-names
> -    - '#thermal-sensor-cells'
> -
> -else:
> -  if:
> -    properties:
> -      compatible:
> -        contains:
> -          enum:
> -            - qcom,gcc-msm8998
> -            - qcom,gcc-sm8150
> -            - qcom,gcc-sc7180
> -  then:
> -    required:
> -       - clocks
> -       - clock-names
> -
> -
>  examples:
>    # Example for GCC for MSM8960:
>    - |
> @@ -168,78 +66,4 @@ examples:
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
>      };
> -
> -
> -  # Example of GCC with TSENS properties:
> -  - |
> -    clock-controller@900000 {
> -      compatible = "qcom,gcc-apq8064";
> -      reg = <0x00900000 0x4000>;
> -      nvmem-cells = <&tsens_calib>, <&tsens_backup>;
> -      nvmem-cell-names = "calib", "calib_backup";
> -      #clock-cells = <1>;
> -      #reset-cells = <1>;
> -      #power-domain-cells = <1>;
> -      #thermal-sensor-cells = <1>;
> -    };
> -
> -  # Example of GCC with protected-clocks properties:
> -  - |
> -    clock-controller@100000 {
> -      compatible = "qcom,gcc-sdm845";
> -      reg = <0x100000 0x1f0000>;
> -      protected-clocks = <187>, <188>, <189>, <190>, <191>;
> -      #clock-cells = <1>;
> -      #reset-cells = <1>;
> -      #power-domain-cells = <1>;
> -    };
> -
> -  # Example of GCC with clock node properties for SM8150:
> -  - |
> -    clock-controller@100000 {
> -      compatible = "qcom,gcc-sm8150";
> -      reg = <0x00100000 0x1f0000>;
> -      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <&sleep_clk>;
> -      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> -      #clock-cells = <1>;
> -      #reset-cells = <1>;
> -      #power-domain-cells = <1>;
> -     };
> -
> -  # Example of GCC with clock nodes properties for SC7180:
> -  - |
> -    clock-controller@100000 {
> -      compatible = "qcom,gcc-sc7180";
> -      reg = <0x100000 0x1f0000>;
> -      clocks = <&rpmhcc 0>, <&rpmhcc 1>, <0>;
> -      clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
> -      #clock-cells = <1>;
> -      #reset-cells = <1>;
> -      #power-domain-cells = <1>;
> -    };
> -
> -  # Example of MSM8998 GCC:
> -  - |
> -    #include <dt-bindings/clock/qcom,rpmcc.h>
> -    clock-controller@100000 {
> -      compatible = "qcom,gcc-msm8998";
> -      #clock-cells = <1>;
> -      #reset-cells = <1>;
> -      #power-domain-cells = <1>;
> -      reg = <0x00100000 0xb0000>;
> -      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
> -               <&sleep>,
> -               <0>,
> -               <0>,
> -               <0>,
> -               <0>,
> -               <0>;
> -      clock-names = "xo",
> -                    "sleep_clk",
> -                    "usb3_pipe",
> -                    "ufs_rx_symbol0",
> -                    "ufs_rx_symbol1",
> -                    "ufs_tx_symbol0",
> -                    "pcie0_pipe";
> -    };
>  ...
> --
> 2.25.0.341.g760bfbb309-goog
>
