Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 862C714D2CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2020 23:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbgA2WBF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jan 2020 17:01:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:36466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726222AbgA2WBF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jan 2020 17:01:05 -0500
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F840206D5;
        Wed, 29 Jan 2020 22:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580335264;
        bh=KMqCZfR8OC4MTYilPgyK7YPT+Qf5ChcD5B7b36gZO+Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lLJRKTSsX/A9CVc3vR5U7iGVdFqQrxwzc2R1YVkFg12RKCfPCmWWY+vc2GFQQhmE1
         I56LmMycL2MQAjXJjFYLroayjXTmVyNtu1TEhnpAO/UunDuRstpV6ltRzm7IVgVTY6
         5KIvU2dfA2kASn3tW4hmVjNJKl2jqtJFQ9da4+iw=
Received: by mail-qk1-f179.google.com with SMTP id g195so866694qke.13;
        Wed, 29 Jan 2020 14:01:04 -0800 (PST)
X-Gm-Message-State: APjAAAVTWC640kevNcm1vUGZ90kxkDZK+FkdRZ6Vf3m4YxNs/Fm3cx/E
        R+Mf1aAJZXM2zFqsGDsMOGOkE/wA4Vvsk8B4+w==
X-Google-Smtp-Source: APXvYqya7/HyzAZ7As4piQq5rd9Qp3/xxmPf0EVs5MW2ZyCiSIU+hACzOqVQcX2Xwp3PGxxJxs0ezV8toTxQNue7DHo=
X-Received: by 2002:ae9:f205:: with SMTP id m5mr2130152qkg.152.1580335263500;
 Wed, 29 Jan 2020 14:01:03 -0800 (PST)
MIME-Version: 1.0
References: <20200129132313.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
In-Reply-To: <20200129132313.1.I4452dc951d7556ede422835268742b25a18b356b@changeid>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 29 Jan 2020 16:00:51 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJk1NZSDAXgqc-CS9a1UCmNYPhC-LwjPUZaX2oK=EtHzQ@mail.gmail.com>
Message-ID: <CAL_JsqJk1NZSDAXgqc-CS9a1UCmNYPhC-LwjPUZaX2oK=EtHzQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: qcom: Fix self-validation, split, and
 clean cruft
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Taniya Das <tdas@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Abhishek Sahu <absahu@codeaurora.org>, sivaprak@codeaurora.org,
        anusharao@codeaurora.org, Sricharan <sricharan@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 29, 2020 at 3:23 PM Douglas Anderson <dianders@chromium.org> wrote:
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

Note that using DT_SCHEMA_FILES may hide some errors in examples as
all other schemas (including the core ones) are not used for
validation. So just 'make dt_binding_check' needs to pass (ignoring
any other unrelated errors as it breaks frequently). Supposedly a
patch is coming explaining this in the documentation.

> Arbitrary decisions made (yell if you want changed):
> - Left all the older devices (where clocks / clock-names weren't
>   specified) in a single file.
> - Didn't make clocks "required" for msm8996/msm8998 but left them as
>   listed.  This seems a little weird but means I didn't need to open a
>   whole different can of worms.  It matches the old binding for
>   msm8996 and doesn't match the binding (but matches the dts) for
>   msm8998.
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

No requirement to fix dts file errors at this point.

> - Add "aud_ref_clk" to sm8150 bindings / dts even though I found a
>   reference to it in "gcc-sm8150.c".
> - Fix node name in actual ipq8074 to be "clock-controller" (it's gcc).
> - Since the example doesn't need phandes to exist, in msm8998 could
>   just make up places providing some of the clocks currently bogused
>   out with <0>.
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

Isn't that every instance? So drop.

Otherwise, assuming it all works:

Reviewed-by: Rob Herring <robh@kernel.org>
