Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382B7F5B29
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 23:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731490AbfKHWlG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Nov 2019 17:41:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:47260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727798AbfKHWlG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Nov 2019 17:41:06 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F59B214DA;
        Fri,  8 Nov 2019 22:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573252865;
        bh=a9nVy2phSoE5sFWAzf2H7YhMHxPXWl13nZECJtbHasQ=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=prkr+6bZTRLk22YnArgvlMbQ+/M0g7QqglWnhVYLHd5MjGqnQP6/Lmoa1pY0uNxs1
         aaD3iRYw44uRZ+I+7Yl5nHLwnPxWLjRu/T7HJJYaBzkgkPWvqDNrDzCMEVi/+xpBqa
         iq7L1u7kNQ0DWe0fzMtZ0CyjLMfY7XsbPcpWNgjo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573247639-19991-1-git-send-email-jhugo@codeaurora.org>
References: <1573247450-19738-1-git-send-email-jhugo@codeaurora.org> <1573247639-19991-1-git-send-email-jhugo@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v7 3/6] dt-bindings: clock: Convert qcom,mmcc to DT schema
User-Agent: alot/0.8.1
Date:   Fri, 08 Nov 2019 14:41:04 -0800
Message-Id: <20191108224105.7F59B214DA@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-11-08 13:13:59)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Doc=
umentation/devicetree/bindings/clock/qcom,mmcc.yaml
> new file mode 100644
> index 000000000000..769b0869eb9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/bindings/clock/qcom,mmcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Multimedia Clock & Reset Controller Binding
> +
> +maintainers:
> +  - Stephen Boyd <sboyd@kernel.org>

I'm maintainer? :) I guess it's fine, but probably should be someone at
qcom instead like Taniya?

> +  - Jeffrey Hugo <jhugo@codeaurora.org>
> +
> +description: |
> +  Qualcomm multimedia clock control module which supports the clocks, re=
sets and
> +  power domains.
> +
> +properties:
> +  compatible :
> +    enum:
> +       - qcom,mmcc-apq8064
> +       - qcom,mmcc-apq8084
> +       - qcom,mmcc-msm8660
> +       - qcom,mmcc-msm8960
> +       - qcom,mmcc-msm8974
> +       - qcom,mmcc-msm8996
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
> +       Protected clock specifier list as per common clock binding
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - '#power-domain-cells'
> +
> +examples:
> +  # Example for GCC for MSM8960:

MMCC, not GCC right?

> +  - |
> +    clock-controller@4000000 {
> +      compatible =3D "qcom,mmcc-msm8960";
> +      reg =3D <0x4000000 0x1000>;
> +      #clock-cells =3D <1>;
> +      #reset-cells =3D <1>;
> +      #power-domain-cells =3D <1>;
> +    };
> +...
> --=20
> 2.17.1
>=20
