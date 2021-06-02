Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9ECD398259
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 09:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhFBHB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 03:01:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:45106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230014AbhFBHB4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 03:01:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 966B261376;
        Wed,  2 Jun 2021 07:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622617213;
        bh=IH3RnTCnggPqY+SoRepC+cDEuByGK59i8/whtW/hJLI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HQSOV/cDXR5tuF5lGYEC02IEHoj3m0iid2q9A8rXSifAoZPRK1IllWiQsAhoklPPf
         mTUEAU7sNDNhvWgG53lbLEu4QRMTo5AcsKoRDX80zKFFIXqucrsNLYq3E8teH0PmSw
         gkmggHmbnCx6wt257Wi2FLgsPw1Bzs+VyotwpPC8a0i4EjU6MnB98w7brvuMsIns3x
         +r/lzxlzzipW8IIpODNUZKYOLnJdOA5OIH8KojMyUc9TnhwENE86paMmgENXjP8kdI
         4QEbu95T6p0aanBY8GUeQN7+w0FJ4C3wgzWmx+HQp4g3Vn1k/9PwwT3/o+uoyNnVmK
         M2BT/Sph5V9sw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1619519590-3019-4-git-send-email-tdas@codeaurora.org>
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org> <1619519590-3019-4-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: Add SC7280 GPUCC clock binding
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Wed, 02 Jun 2021 00:00:12 -0700
Message-ID: <162261721239.4130789.8314129952052939804@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2021-04-27 03:33:07)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Do=
cumentation/devicetree/bindings/clock/qcom,gpucc.yaml
> index df943c4..7e3f9e7 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
> @@ -11,11 +11,12 @@ maintainers:
> =20
>  description: |
>    Qualcomm graphics clock control module which supports the clocks, rese=
ts and
> -  power domains on SDM845/SC7180/SM8150/SM8250.
> +  power domains on SDM845/SC7180/SC7280/SM8150/SM8250.

Can we stop updating this line? Just say "power domains on Qualcomm
SoCs"?

> =20
>    See also:
>      dt-bindings/clock/qcom,gpucc-sdm845.h
>      dt-bindings/clock/qcom,gpucc-sc7180.h
> +    dt-bindings/clock/qcom,gpucc-sc7280.h
>      dt-bindings/clock/qcom,gpucc-sm8150.h
>      dt-bindings/clock/qcom,gpucc-sm8250.h
> =20
> @@ -24,6 +25,7 @@ properties:
>      enum:
>        - qcom,sdm845-gpucc
>        - qcom,sc7180-gpucc
> +      - qcom,sc7280-gpucc
>        - qcom,sm8150-gpucc
>        - qcom,sm8250-gpucc
>
