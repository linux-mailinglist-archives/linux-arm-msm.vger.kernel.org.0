Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56FAD3D7E6C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 21:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhG0TUc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 15:20:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:56802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230382AbhG0TUc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 15:20:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEB3D60F6E;
        Tue, 27 Jul 2021 19:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627413631;
        bh=hTGVaodY29yUtp6G87AgDwoDVfCcHApIoO+h2gZfE7s=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=lWnNbxuhxqlvJWwmUgNT+U1VRgjdgvRlZVnkQZfWChf5cxAK1zM/To0BDWDvFExmz
         RVb1IacBhl/4VLcTkfem1vSQsliOq8CMUiizwgzNvTFXLoXDduouOpHcIA38jau1XL
         xxX6JijHLHPbr1CLvtXuiyBuuR7x8ODio8xemD6vSvJJiHLmRqWj2qDBGro/RMFTDq
         5ATD8s1mBL+9fcvrmDBjtfLS917+3zwzDRD+fr+ml94WXj3q73z190XmJnhFZSTbRG
         DPzG0ASVM+q1/VffWXsbd5GEaoyLKT66dCnd8StKlshSp2kLXrZAXAmN89qZQoXZ6I
         EwAFc8iTwkS0A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1627306847-25308-3-git-send-email-rajpat@codeaurora.org>
References: <1627306847-25308-1-git-send-email-rajpat@codeaurora.org> <1627306847-25308-3-git-send-email-rajpat@codeaurora.org>
Subject: Re: [PATCH V4 2/4] arm64: dts: sc7280: Add QUPv3 wrapper_0 nodes
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, msavaliy@qti.qualcomm.com,
        skakit@codeaurora.org, Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rajesh Patil <rajpat@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajesh Patil <rajpat@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 27 Jul 2021 12:20:30 -0700
Message-ID: <162741363048.2368309.1689681966672627944@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rajesh Patil (2021-07-26 06:40:45)
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/q=
com/sc7280.dtsi
> index ca6e36b..455e58f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -520,6 +520,25 @@
> =20
>                 };
> =20
> +               qup_opp_table: qup-opp-table {

Surely this can live underneath a qup node parallel to the i2c and spi
devices?

> +                       compatible =3D "operating-points-v2";
> +
> +                       opp-75000000 {
> +                               opp-hz =3D /bits/ 64 <75000000>;
> +                               required-opps =3D <&rpmhpd_opp_low_svs>;
> +                       };
> +
> +                       opp-100000000 {
> +                               opp-hz =3D /bits/ 64 <100000000>;
> +                               required-opps =3D <&rpmhpd_opp_svs>;
> +                       };
> +
> +                       opp-128000000 {
> +                               opp-hz =3D /bits/ 64 <128000000>;
> +                               required-opps =3D <&rpmhpd_opp_nom>;
> +                       };
> +               };
> +
>                 qupv3_id_0: geniqup@9c0000 {
>                         compatible =3D "qcom,geni-se-qup";
>                         reg =3D <0 0x009c0000 0 0x2000>;
