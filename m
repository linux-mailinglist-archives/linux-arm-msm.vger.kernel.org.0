Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEF99F3AB5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:47:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725924AbfKGVrb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:47:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:58136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfKGVrb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:47:31 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 781622084C;
        Thu,  7 Nov 2019 21:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573163250;
        bh=UJf9xtJt4ErRCjGEs/VzyrSvxL8IvoiVALLkwt3EoIw=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=qYOhjJdZcB4/JRtukN74Uw9E38AdmfQuqqBDxdrCxNZjEZLXH4WSm0PGkk5fXDK3k
         uE6YdEtstxMJAXbQr3uOnqGqTahQL8VFyK0wGk4QDHPJ9aVTgjfp7E8tR/BlAU1rSN
         OOmp8xJN2gYyUoDW4xwy36jslV/xjwZ73IlOy8gA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1569959718-5256-1-git-send-email-jhugo@codeaurora.org>
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org> <1569959718-5256-1-git-send-email-jhugo@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>, mturquette@baylibre.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v6 1/6] dt-bindings: clock: Document external clocks for MSM8998 gcc
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:47:29 -0800
Message-Id: <20191107214730.781622084C@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-10-01 12:55:18)
> The global clock controller on MSM8998 can consume a number of external
> clocks.  Document them.
>=20
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,gcc.txt | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc.txt b/Docum=
entation/devicetree/bindings/clock/qcom,gcc.txt
> index d14362ad4132..32d430718016 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc.txt
> @@ -29,6 +29,16 @@ Required properties :
>  - #clock-cells : shall contain 1
>  - #reset-cells : shall contain 1
> =20
> +For MSM8998 only:
> +       - clocks: a list of phandles and clock-specifier pairs,
> +                 one for each entry in clock-names.
> +       - clock-names: "xo" (required)
> +                      "usb3_pipe" (optional)
> +                      "ufs_rx_symbol0" (optional)
> +                      "ufs_rx_symbol1" (optional)
> +                      "ufs_tx_symbol0" (optional)
> +                      "pcie0_pipe" (optional)

This got wrecked by Taniya's changes to this file. Can you resend and
rebase it? Sorry for the troubles.

