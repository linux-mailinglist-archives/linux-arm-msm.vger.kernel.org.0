Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5542C28D7AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 02:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728716AbgJNAqm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 20:46:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:57762 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728661AbgJNAql (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 20:46:41 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CA1A208B3;
        Wed, 14 Oct 2020 00:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602636401;
        bh=bHegWhytBbBlLR9BgF+yyPu4sS7bcuWDg/pEYkwLJpM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=xr58USUJ9omM850KuRI+gCEXQ3GRqp1vWr+UjH6H1yCCUav4ZtLDHJaEaqvOAqmdb
         FNMnuysLGVD7TpZd6OS9vTS8UZn2mtAnBhLmpAU7KTIZSJXrk1zP4de0IX/Eh8YZlP
         t5o0ZpX4iAwFxTwtchgVrNOMInKJTKaDHEJJEwkI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201005225914.315852-2-dmitry.baryshkov@linaro.org>
References: <20201005225914.315852-1-dmitry.baryshkov@linaro.org> <20201005225914.315852-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v1 1/3] dt-bindings: clock: qcom,dispcc: document power domain bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Date:   Tue, 13 Oct 2020 17:46:39 -0700
Message-ID: <160263639992.310579.2985110685040776427@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2020-10-05 15:59:12)
> SM8250 requires special power domain for accessing MMDS_GDSC registers.

Heh, not sure it's special.

> Add bindings for the MMCX power domain.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/clock/qcom,sdm845-dispcc.yaml    | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.y=
aml b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
> index 4a3be733d042..ff0db55470ac 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-dispcc.yaml
> @@ -97,5 +108,22 @@ examples:
>        #clock-cells =3D <1>;
>        #reset-cells =3D <1>;
>        #power-domain-cells =3D <1>;
> +      /* this is a part of sm8250 setup the power domain example */
> +      power-domains =3D <&rpmhpd SDM845_CX>;
> +      power-domain-names =3D "mmcx";
> +      required-opps =3D <&rpmhpd_opp_low_svs>;
> +    };
> +    rpmhpd: power-controller {

Do we need this node in the example? I think it isn't required but I
guess it's OK.

> +      compatible =3D "qcom,sdm845-rpmhpd";
> +      #power-domain-cells =3D <1>;
> +      operating-points-v2 =3D <&rpmhpd_opp_table>;
> +
> +      rpmhpd_opp_table: opp-table {
> +        compatible =3D "operating-points-v2";
> +
> +        rpmhpd_opp_low_svs: opp3 {
