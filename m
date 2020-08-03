Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 829F323AD66
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 21:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgHCTiK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 15:38:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:54650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727813AbgHCTiK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 15:38:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F274207DF;
        Mon,  3 Aug 2020 19:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596483489;
        bh=p+3byzfdILkweAsKrQ9Yt4O2JghYZujOzpv9UZtCJVY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=j25T+3N/REJyCpJq6+QYcqKXJz5UVtMco4cNO9YH2S+1M81RBwL7rY1xsdoHNv+xW
         fWHmfUSnoOJua0nFT6IX0KXaJjTjB/IY2q1ICKduYtSSGn2iPY8zMhnYLBiunnlZZU
         Su59NeWPklJqBRHSIRkhzU+VS+U2ezxB+u4KT7Vs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1596305615-5894-2-git-send-email-tdas@codeaurora.org>
References: <1596305615-5894-1-git-send-email-tdas@codeaurora.org> <1596305615-5894-2-git-send-email-tdas@codeaurora.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add LPASS clock controller nodes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Date:   Mon, 03 Aug 2020 12:38:08 -0700
Message-ID: <159648348836.1360974.18393181327075773516@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Taniya Das (2020-08-01 11:13:35)
> Update the clock controller nodes for Low power audio subsystem
> functionality.
>=20
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/q=
com/sc7180.dtsi
> index d46b383..7cf8bfe 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -8,6 +8,7 @@
>  #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7180.h>
>  #include <dt-bindings/clock/qcom,gpucc-sc7180.h>
> +#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,videocc-sc7180.h>
>  #include <dt-bindings/interconnect/qcom,osm-l3.h>
> @@ -3312,6 +3313,30 @@
>                         qcom,msa-fixed-perm;
>                         status =3D "disabled";
>                 };
> +
> +               lpasscc: clock-controller@62d00000 {
> +                       compatible =3D "qcom,sc7180-lpasscorecc";
> +                       reg =3D <0 0x62d00000 0 0x50000>,
> +                           <0 0x62780000 0 0x30000>;

Doesn't look aligned in my MUA, but who knows!

> +                       reg-names =3D "lpass_core_cc", "lpass_audio_cc";
> +                       clocks =3D <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> +                                <&rpmhcc RPMH_CXO_CLK>;
> +                       clock-names =3D "iface", "bi_tcxo";
> +                       power-domains =3D <&lpass_hm LPASS_CORE_HM_GDSCR>;
> +                       #clock-cells =3D <1>;
> +                       #power-domain-cells =3D <1>;
> +               };
> +
