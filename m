Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 795048DA83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2019 19:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbfHNRSY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 13:18:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:42524 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730735AbfHNRSY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 13:18:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 839C4206C2;
        Wed, 14 Aug 2019 17:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565803103;
        bh=2xDhGvxEekeoQnWrd1RGsBcE82TmnMmVp4nQjv/gPvA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Mkrq41mufZhx6tAovMyKzqdPCv+OggwC2AuHo5ZshBfhoectAbjupJIN/QKDYDvpZ
         MH3Ae6+8EFELjQsGFB8pd6aywWD/8U+SeEW2SFDAXHmwhtgINwn4OfVEj/yu/L889k
         /EiPsWgi5YGqqF8998BZKiIf6eNX5gADTFD/qEN8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190814122958.4981-1-vkoul@kernel.org>
References: <20190814122958.4981-1-vkoul@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Document SM8150 rpmh-clock compatible
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Vinod Koul <vkoul@kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 14 Aug 2019 10:18:22 -0700
Message-Id: <20190814171823.839C4206C2@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Vinod Koul (2019-08-14 05:29:57)
> Document the SM8150 rpmh-clock compatible for rpmh clock controller
> found on SM8150 platforms.
>=20
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt b/=
Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> index 3c007653da31..82dee80cdbf3 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
> @@ -6,7 +6,9 @@ some Qualcomm Technologies Inc. SoCs. It accepts clock re=
quests from
>  other hardware subsystems via RSC to control clocks.
> =20
>  Required properties :
> -- compatible : shall contain "qcom,sdm845-rpmh-clk"
> +- compatible : must be one of:
> +              "qcom,sdm845-rpmh-clk"
> +              "qcom,sm8150-rpmh-clk"
> =20

Can it take a 'clocks' property to get the board clock?


