Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28D6D14E078
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 19:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727877AbgA3SEG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 13:04:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:37226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727562AbgA3SEG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 13:04:06 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6771A2083E;
        Thu, 30 Jan 2020 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580407444;
        bh=5yHwrQFHCXUraRoBoPvM90g2hzTie2ri7LV0EmXvjHs=;
        h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
        b=NblkosR0aWZAMoy5Rk+3hxRNUHdZ1BP20Y56+j0OhnsFTQeefp4TuVkKE38/Yzc52
         KlzCDoC1ltnEUWv6OhLFwXKCojYC7iPYlPHgXK+r4/1rhOEDazG0CH62O/l+hJI1q8
         /ZDxGLXQuqXzCXlFhBy0OTXGrAH/+Gsz0FMWo4ZQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200129152458.v2.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
References: <20200129152458.v2.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
Subject: Re: [PATCH v2] dt-bindings: clk: qcom: Fix self-validation, split, and clean cruft
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     tdas@codeaurora.org, jhugo@codeaurora.org, absahu@codeaurora.org,
        sivaprak@codeaurora.org, anusharao@codeaurora.org,
        sricharan@codeaurora.org, Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
User-Agent: alot/0.8.1
Date:   Thu, 30 Jan 2020 10:04:03 -0800
Message-Id: <20200130180404.6771A2083E@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Douglas Anderson (2020-01-29 15:25:06)
> The 'qcom,gcc.yaml' file failed self-validation (dt_binding_check)
> because it required a property to be either (3 entries big),
> (3 entries big), or (7 entries big), but not more than one of those
> things.  That didn't make a ton of sense.
>=20
> This patch splits all of the exceptional device trees (AKA those that
> would have needed if/then/else rules) from qcom,gcc.yaml.  It also
> cleans up some cruft found while doing that.
>=20
> After this lands, this worked for me atop clk-next with just the known
> error about msm8998:
>   for f in \
>     Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-ipq8074.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-qcs404.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml \
>     Documentation/devicetree/bindings/clock/qcom,gcc.yaml; do \
>       ARCH=3Darm64 make dtbs_check DT_SCHEMA_FILES=3D$f; \
>   done
>=20
> I then picked this patch atop linux-next (next-20200129) and ran:
>   # Delete broken yaml:
>   rm Documentation/devicetree/bindings/pci/intel-gw-pcie.yaml
>   ARCH=3Darm64 make dt_binding_check | grep 'clock/qcom'
> ...and that didn't seem to indicate problems.
>=20
> Arbitrary decisions made (yell if you want changed):
> - Left all the older devices (where clocks / clock-names weren't
>   specified) in a single file.
> - Didn't make clocks "required" for msm8996 but left them as listed.
>   This seems a little weird but it matches the old binding.
>=20
> Misc cleanups as part of this patch:
> - sm8150 was claimed to be same set of clocks as sc7180, but driver
>   and dts appear to say that "bi_tcxo_ao" doesn't exist.  Fixed.

Someone will probably want to change this at some point.=20

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
>=20
> Noticed, but not done in this patch (volunteers needed):
> - Add "aud_ref_clk" to sm8150 bindings / dts even though I found a
>   reference to it in "gcc-sm8150.c".
> - Fix node name in actual ipq8074 to be "clock-controller" (it's gcc).
> - Since the example doesn't need phandes to exist, in msm8998 could
>   just make up places providing some of the clocks currently bogused
>   out with <0>.
> - On msm8998 clocks are listed as required but current dts doesn't
>   have them.
>=20
> Fixes: ab91f72e018a ("clk: qcom: gcc-msm8996: Fix parent for CLKREF clock=
s")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>=20
> Changes in v2:
> - Clocks are required for msm8998; note that current dts is broken.
> - Drop description for 'gcc-apq8064' nvmem-cell-names.
> - Commit message now describes running dt_binding_check differently.
> - Added Rob's review tag.
>=20
>  .../bindings/clock/qcom,gcc-apq8064.yaml      |  79 +++++++
>  .../bindings/clock/qcom,gcc-ipq8074.yaml      |  48 ++++
>  .../bindings/clock/qcom,gcc-msm8996.yaml      |  65 ++++++
>  .../bindings/clock/qcom,gcc-msm8998.yaml      |  90 ++++++++
>  .../bindings/clock/qcom,gcc-qcs404.yaml       |  48 ++++
>  .../bindings/clock/qcom,gcc-sc7180.yaml       |  72 ++++++
>  .../bindings/clock/qcom,gcc-sm8150.yaml       |  69 ++++++
>  .../devicetree/bindings/clock/qcom,gcc.yaml   | 212 ++----------------
>  8 files changed, 489 insertions(+), 194 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-apq8=
064.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-ipq8=
074.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8=
996.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8=
998.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-qcs4=
04.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sc71=
80.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm81=
50.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yam=
l b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> new file mode 100644
> index 000000000000..a386cfd27793
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
> @@ -0,0 +1,79 @@
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
> +  Qualcomm global clock control module which supports the clocks, resets=
 and
> +  power domains on APQ8064.

It would be great if this could also point to the
include/dt-bindings/clock/qcom,apq8064.h file here. If you don't resend
this patch then I will try to remember to make this addition to the
binding docs.

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
