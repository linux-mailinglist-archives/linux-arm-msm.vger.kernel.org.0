Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2DCD0574
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2019 04:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726490AbfJICVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 22:21:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:46210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726257AbfJICVc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 22:21:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 604B52070B;
        Wed,  9 Oct 2019 02:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570587691;
        bh=nMNSf4SkgYrb/+7JppaBIkcTEZnYKwpyA7Gyu248r6w=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=gtCZh39eBGlRFQ3ffq9ktD/1ZheW3g4mpVrLq3qaLhxsSe8w1xcOB5mAR7B/Oucq+
         tMPNHCg4Y6OG0SqTVoT9IzMYGSUQBRif2VQ3/8xkA7c6rcJ0RQ7GPNnE95w0wTxTdV
         4aqQGyh6WFOhf7OgIdPROgEg8bVHAzf5PELerJZw=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191007014509.25180-5-masneyb@onstation.org>
References: <20191007014509.25180-1-masneyb@onstation.org> <20191007014509.25180-5-masneyb@onstation.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Brian Masney <masneyb@onstation.org>, robdclark@gmail.com,
        sean@poorly.run
Cc:     bjorn.andersson@linaro.org, a.hajda@samsung.com,
        Laurent.pinchart@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, jonathan@marek.ca,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RFC v2 4/5] ARM: dts: qcom: msm8974: add HDMI nodes
User-Agent: alot/0.8.1
Date:   Tue, 08 Oct 2019 19:21:30 -0700
Message-Id: <20191009022131.604B52070B@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Brian Masney (2019-10-06 18:45:08)
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom=
-msm8974.dtsi
> index 7fc23e422cc5..af02eace14e2 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -1335,6 +1342,77 @@
>                                 clocks =3D <&mmcc MDSS_AHB_CLK>;
>                                 clock-names =3D "iface";
>                         };
> +
> +                       hdmi: hdmi-tx@fd922100 {
> +                               status =3D "disabled";
> +
> +                               compatible =3D "qcom,hdmi-tx-8974";
> +                               reg =3D <0xfd922100 0x35c>,
> +                                     <0xfc4b8000 0x60f0>;
> +                               reg-names =3D "core_physical",
> +                                           "qfprom_physical";

Is this the qfprom "uncorrected" physical address? If so, why can't this
node use an nvmem to read whatever it needs out of the qfprom?

> +
> +                               interrupt-parent =3D <&mdss>;
> +                               interrupts =3D <8 IRQ_TYPE_LEVEL_HIGH>;
> +
> +                               power-domains =3D <&mmcc MDSS_GDSC>;
> +
