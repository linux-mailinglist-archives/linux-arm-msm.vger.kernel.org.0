Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A3CB43E947
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Oct 2021 22:06:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbhJ1UIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Oct 2021 16:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhJ1UIj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Oct 2021 16:08:39 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F22C061570
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 13:06:11 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t4so9933134oie.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Oct 2021 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=j+n3Z00RZeyUuTf2yQrDjxEQteNahzIgUSKuRJvFIrY=;
        b=FQlvpdnP03yX9TXowo8zSJCVxkoPyA8sqCeROI8bf4UL7B/X1PgEgwY9+kNmpRR8K/
         AErudSBD7ufZ4GBo0Vh9bfm3wht8wLyOlhka2abVE1EOw/vyCO3jxOKKQdJ4EDDB2T61
         +raXnyIS6X8synin0S/QxtbE7zTy0jB/H6BsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=j+n3Z00RZeyUuTf2yQrDjxEQteNahzIgUSKuRJvFIrY=;
        b=Be2EOaOnnuu8OWYEVD7WraeSM6kgjLSkLg57a7N5FIWaf52bkx39dZQJy+temUyZ9F
         7UTAnlh42NhQ5bYbkHoolwo+pRm3DFdTBwKG0vQldNlCF/biD8vbV+kpxmfnPqAEk611
         XhSJ7dcoxw5jKW49vkE9KkN3Rm6SdsH8W/CxtQD8vglhLnoXRESHuqRkXI3VYHcFAXeQ
         5aH5Id9Bda3n/eG4NaqpusWVZXn+N6qA69w8RmIPgZFHm2T49oOBvPSa/ycGU3F9BDZr
         ePF/gGxS2fnKaOw4VYAxXcn5n5XZuvqkFMP24K0XNsF8h1TVAdyg6z3ey9psNhJ2pt7s
         Xw+w==
X-Gm-Message-State: AOAM532y0fIW6lz3DESEkGqAA+pmXFuEkfqRvqsAfX4FAzndtnOeJq6C
        LL9n8G6KcvB7OadgVitg7C0HfhAnTb+DtDDqrqEaHik1B5Q=
X-Google-Smtp-Source: ABdhPJyjQ83MgCyc98p/HJABAfUl3JxWic+DX3B/3ldPbnCAi8+WRXQ/MsLxKhXRAFxnWloR6RtTxQbhfsABcA6gIxM=
X-Received: by 2002:a05:6808:2128:: with SMTP id r40mr2999915oiw.164.1635451571022;
 Thu, 28 Oct 2021 13:06:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 28 Oct 2021 13:06:10 -0700
MIME-Version: 1.0
In-Reply-To: <1635434072-32055-2-git-send-email-quic_c_skakit@quicinc.com>
References: <1635434072-32055-1-git-send-email-quic_c_skakit@quicinc.com> <1635434072-32055-2-git-send-email-quic_c_skakit@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 28 Oct 2021 13:06:10 -0700
Message-ID: <CAE-0n53G4dwj6yLV6G3VehzzKLW-A5q8v=Ld6RFS7QXm5TjsOA@mail.gmail.com>
Subject: Re: [PATCH V3 1/4] regulator: dt-bindings: Add pm8008 regulator bindings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, collinsd@codeurora.org,
        subbaram@codeaurora.org, Das Srinagesh <gurus@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya (2021-10-28 08:14:29)
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
> new file mode 100644
> index 0000000..cc624d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/qcom,pm8008-regulator.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/qcom,pm8008-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. PM8008 Regulator bindings
> +
> +maintainers:
> +  - Satya Priya <skakit@codeaurora.org>
> +
> +description:
> +  Qualcomm Technologies, Inc. PM8008 is an I2C controlled PMIC
> +  containing 7 LDO regulators.
> +
> +properties:
> +  compatible:
> +    const: qcom,pm8008-regulator

Maybe qcom,pm8008-regulators because there's more than one?

> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  vdd_l1_l2-supply:
> +    description: Input supply phandle of ldo1 and ldo2 regulators.
> +
> +  vdd_l3_l4-supply:
> +    description: Input supply phandle of ldo3 and ldo4 regulators.
> +
> +  vdd_l5-supply:
> +    description: Input supply phandle of ldo5 regulator.
> +
> +  vdd_l6-supply:
> +    description: Input supply phandle of ldo6 regulator.
> +
> +  vdd_l7-supply:
> +    description: Input supply phandle of ldo7 regulator.
> +
> +patternProperties:
> +  "^l[1-7]@[0-9a-f]+$":
> +    type: object
> +
> +    $ref: "regulator.yaml#"
> +
> +    description: PM8008 regulator peripherals of PM8008 regulator device
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +        description: Base address of the regulator.
> +
> +      regulator-name: true
> +
> +      regulator-min-dropout-voltage-microvolt:

This needs to move to regulator.yaml in a separate patch.

> +        description:
> +          Specifies the minimum voltage in microvolts that the parent
> +          supply regulator must output, above the output of this
> +          regulator.
> +
