Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16032F3ACD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2019 22:55:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725945AbfKGVzH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 16:55:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:34248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725930AbfKGVzH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 16:55:07 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FBFA2084D;
        Thu,  7 Nov 2019 21:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573163706;
        bh=UUglqZzopIUiqGxVkt/4w1NwkQQo7FHZlTLjnRJ8lm4=;
        h=In-Reply-To:References:From:To:Cc:Subject:Date:From;
        b=KLE5nWe67i08olHh+IlmbQJLMFMAT2EaVEQ+74LXu2pix5Z0iHlwCZMqLXdcGeGLL
         1/HHbmbO8FHaDT16sngT4diCa2qDDJV7VJj7N5yEqhtvioEiiILzVxLvVvbKWkOr63
         YnRdqxeS54dwwc/IN719RKpYxsBEumG74c8KU3Eg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1569959842-8399-1-git-send-email-jhugo@codeaurora.org>
References: <1569959656-5202-1-git-send-email-jhugo@codeaurora.org> <1569959842-8399-1-git-send-email-jhugo@codeaurora.org>
From:   Stephen Boyd <sboyd@kernel.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        marc.w.gonzalez@free.fr, mturquette@baylibre.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v6 4/6] dt-bindings: clock: Add support for the MSM8998 mmcc
User-Agent: alot/0.8.1
Date:   Thu, 07 Nov 2019 13:55:05 -0800
Message-Id: <20191107215506.8FBFA2084D@mail.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Jeffrey Hugo (2019-10-01 12:57:22)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt b/Docu=
mentation/devicetree/bindings/clock/qcom,mmcc.txt
> index 8b0f7841af8d..a92f3cbc9736 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.txt
> @@ -10,11 +10,32 @@ Required properties :
>                         "qcom,mmcc-msm8960"
>                         "qcom,mmcc-msm8974"
>                         "qcom,mmcc-msm8996"
> +                       "qcom,mmcc-msm8998"

Can you convert this binding to YAML? Makes it easier to validate it
against the dts files.

> =20
>  - reg : shall contain base register location and length
>  - #clock-cells : shall contain 1
>  - #reset-cells : shall contain 1
> =20
> +For MSM8998 only:
> +       - clocks: a list of phandles and clock-specifier pairs,
> +                 one for each entry in clock-names.
> +       - clock-names: "xo" for the xo clock.
> +                      "gpll0" for the global pll 0 clock.
> +                      "dsi0dsi" for the dsi0 pll dsi clock (required if =
dsi is
> +                               enabled, optional otherwise).
> +                      "dsi0byte" for the dsi0 pll byte clock (required i=
f dsi
> +                               is enabled, optional otherwise).
> +                      "dsi1dsi" for the dsi1 pll dsi clock (required if =
dsi is
> +                               enabled, optional otherwise).
> +                      "dsi1byte" for the dsi1 pll byte clock (required i=
f dsi
> +                               is enabled, optional otherwise).
> +                      "hdmipll" for the hdmi pll clock (required if hdmi=
 is
> +                               enabled, optional otherwise).
> +                      "dpvco" for the displayport pll vco clock (require=
d if
> +                               dp is enabled, optional otherwise).
> +                      "dplink" for the displayport pll link clock (requi=
red if
> +                               dp is enabled, optional otherwise).

I'm not sure why it's optional. The hardware is "fixed" in the sense
that the dp phy is always there and connected to this hardware block.
From a driver perspective I agree it's optional to be used, but from a
DT perspective it's always there so it should be required.

