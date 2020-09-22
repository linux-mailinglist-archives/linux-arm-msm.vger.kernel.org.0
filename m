Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB2A8274883
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Sep 2020 20:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbgIVSrt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Sep 2020 14:47:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46656 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgIVSrt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Sep 2020 14:47:49 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0697820715;
        Tue, 22 Sep 2020 18:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600800469;
        bh=/efLb0r5vsuRu4nyUveOiMCLfFWKubugYzN8Nngo2OE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=g/yMrJizQWtDs/JH/1jK3LuesYKzhYMZXsHUuzMQ3JgwPPOSjRdlNabRLdlPIIZG3
         YWB7A7kxYPkyzWibL1e9cHKifqI6d6BbyvHtVYhMD+bGDj27pKTGWoIw5DLtoBEuwA
         F62rlGxbnpq3pBDaWUNUumA8Gq+Vpta8fLWWDTnE=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200904030958.13325-2-jonathan@marek.ca>
References: <20200904030958.13325-1-jonathan@marek.ca> <20200904030958.13325-2-jonathan@marek.ca>
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: combine qcom,sdm845-videocc and qcom,sc7180-videocc
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org
Date:   Tue, 22 Sep 2020 11:47:47 -0700
Message-ID: <160080046791.310579.14652913141627753753@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jonathan Marek (2020-09-03 20:09:50)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.=
yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> similarity index 76%
> rename from Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.y=
aml
> rename to Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index f7a0cf53d5f0..17666425476f 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -1,23 +1,27 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  %YAML 1.2
>  ---
> -$id: http://devicetree.org/schemas/clock/qcom,sdm845-videocc.yaml#
> +$id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Qualcomm Video Clock & Reset Controller Binding for SDM845
> +title: Qualcomm Video Clock & Reset Controller Binding
> =20
>  maintainers:
>    - Taniya Das <tdas@codeaurora.org>
> =20
>  description: |
>    Qualcomm video clock control module which supports the clocks, resets =
and
> -  power domains on SDM845.
> +  power domains on SDM845/SC7180.
> =20
> -  See also dt-bindings/clock/qcom,videocc-sdm845.h.
> +  See also:
> +    dt-bindings/clock/qcom,videocc-sdm845.h
> +    dt-bindings/clock/qcom,videocc-sc7180.h

Sort this alphabetically please.

> =20
>  properties:
>    compatible:
> -    const: qcom,sdm845-videocc
> +    enum:
> +      - qcom,sdm845-videocc
> +      - qcom,sc7180-videocc

Sort this alphabetically please.

> =20
>    clocks:
>      items:
> --=20
> 2.26.1
>
