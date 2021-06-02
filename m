Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBF89398263
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 09:00:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhFBHCa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 03:02:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:45728 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230508AbhFBHCa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 03:02:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CE9161242;
        Wed,  2 Jun 2021 07:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622617247;
        bh=pvtPjJLgxgw9IwOsdcKq7Y1bBBRbsbMRUvzzCJ/A0Yc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=VwbOywpINCopatES7QktRNF5Z46jGcEDo846jt7TJ3PndWdaQ3vIHH+tySMtywHKB
         0otnJRYZqQVCqxEAkp+dmARVGWgu8g0sP6La91RmZOrneQecU93fj4mV5VF1lIJg0d
         OhxQAVA+1QkwszhJVSuzUp92bszLp+cYYd8ggM1dqh1wp/7gAollZrhZNUaaY/xIku
         TRYQsxrDdNHNI4tBNxPHoz/dHiKRpweLjw7L9Cy+032MYyV9nnXAUxChrqXZtCAMMy
         9i1LDtogQ4hH1bv1jN/gSQ2OAGyr59Lgs/V8hZmulZZma06pM41WJVOiOOjqE0wuaI
         mz5aNL6wvC6Hg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1619519590-3019-6-git-send-email-tdas@codeaurora.org>
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org> <1619519590-3019-6-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: Add SC7280 VideoCC clock binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 02 Jun 2021 00:00:46 -0700
Message-ID: <162261724640.4130789.5036589341643470112@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-04-27 03:33:09)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/=
Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> index 5672029..dc90d82 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
> @@ -11,10 +11,11 @@ maintainers:
> =20
>  description: |
>    Qualcomm video clock control module which supports the clocks, resets =
and
> -  power domains on SDM845/SC7180/SM8150/SM8250.
> +  power domains on SDM845/SC7180/SC7280/SM8150/SM8250.

Same noise comment.

> =20
>    See also:
>      dt-bindings/clock/qcom,videocc-sc7180.h
> +    dt-bindings/clock/qcom,videocc-sc7280.h
>      dt-bindings/clock/qcom,videocc-sdm845.h
>      dt-bindings/clock/qcom,videocc-sm8150.h
>      dt-bindings/clock/qcom,videocc-sm8250.h
> @@ -23,6 +24,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,sc7180-videocc
> +      - qcom,sc7280-videocc
>        - qcom,sdm845-videocc
>        - qcom,sm8150-videocc
>        - qcom,sm8250-videocc
