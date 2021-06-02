Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7E27399567
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 23:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbhFBV3V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 17:29:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:33394 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229467AbhFBV3U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 17:29:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16A2E613D2;
        Wed,  2 Jun 2021 21:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622669257;
        bh=lE85p69QGI6y7QaTePnues/2c+5McsZT084K1YrweNw=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=B8DV6wOh3MIm5mi1YrXGOznlrfUuCZOeXpQiKZ6Y4RGio/y0ayYK32131jJflfu2o
         7L6x9BIPlQ1HSWw84GBx2YkogJbaBC81Awr1gVz/gr+zmbrAPf7as0TWosv1VxAHq2
         2K4CBf/t8TIjcl8XMfpbfIfe/bX2VT8/rIArQu/jJvj90vt/sZApPTQZJj6KQa7g4a
         bygk9u92h8RhN+PfppdIqOtKIU8qjuGbYMWwnrACnzm/QNw5RJTcynYC9nA+Uo/jeB
         I+i9L28XGEauUq4h7HxmU3Pb96IyJinOVmYSdJUTUwnoXO4eV4fewHyxx1jvDEizAa
         Qnq/CagdimW8Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210519001802.1863-2-jonathan@marek.ca>
References: <20210519001802.1863-1-jonathan@marek.ca> <20210519001802.1863-2-jonathan@marek.ca>
Subject: Re: [PATCH v2 2/2] dt-bindings: clock: add QCOM SM8350 display clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Wed, 02 Jun 2021 14:27:35 -0700
Message-ID: <162266925581.4130789.10178141366818328902@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2021-05-18 17:18:02)
> Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
> bindings. Update the documentation with the new compatible.
>=20
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
>  include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +

>  2 files changed, 5 insertions(+), 2 deletions(-)
>  create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h

Why the symlink? Can we have the dt authors use the existing header file
instead?

>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.y=
aml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> index 0cdf53f41f84..8f414642445e 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
> @@ -4,24 +4,26 @@
>  $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM82=
50
> +title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM82=
50/SM8350

Maybe just "Binding for SM8x50 SoCs"

> =20
>  maintainers:
>    - Jonathan Marek <jonathan@marek.ca>
> =20
>  description: |
>    Qualcomm display clock control module which supports the clocks, reset=
s and
> -  power domains on SM8150 and SM8250.
> +  power domains on SM8150/SM8250/SM8350.

same 8x50 comment.

> =20
>    See also:
>      dt-bindings/clock/qcom,dispcc-sm8150.h
>      dt-bindings/clock/qcom,dispcc-sm8250.h
> +    dt-bindings/clock/qcom,dispcc-sm8350.h
> =20
>  properties:
>    compatible:
>      enum:
>        - qcom,sm8150-dispcc
>        - qcom,sm8250-dispcc
> +      - qcom,sm8350-dispcc
> =20
>    clocks:
>      items:
> diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-=
bindings/clock/qcom,dispcc-sm8350.h
> new file mode 120000
> index 000000000000..0312b4544acb
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
> @@ -0,0 +1 @@
> +qcom,dispcc-sm8250.h
> \ No newline at end of file
