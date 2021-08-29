Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F32D3FAE38
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 21:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232615AbhH2Tv3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 15:51:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:34466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229451AbhH2Tv2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 15:51:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DEFA660C41;
        Sun, 29 Aug 2021 19:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630266636;
        bh=PYtw8mGYz1RPfE/Tx0vYhDXf3B8PdOYuQIRA2grz0N4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hHjy+V3WbLIHXbOMZt43SjNS4rKm+WP8gf37Nm97kBixjArIv9aQCXYnv+vLk1e1u
         QE0eXwE04SbDqRB02DjVx4kNL7xUZ0hCtFbvFwm6wjjXN4ttGSX19nLwEmIa8Yxbid
         w4CYOUqe6ZcFEqxsDw8j3VN1qzEjZn9WIB1HmaHF0qBD12lOhoYD5hBFEcx4FmesUH
         8kYTl3+TaRUy6dVmAOntac+6ofK3wUr8Qa690rVX8l7KdZhGNkK71t57bcIVavZIc/
         AYmzlHS0VuGz6+cqOvI3QmS4rbnI23R6EnzmS6qg4fIc7e5jzYgKVG8SWIJxizUog5
         u50wI7reYIVow==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210829193617.4105-9-konrad.dybcio@somainline.org>
References: <20210829193617.4105-1-konrad.dybcio@somainline.org> <20210829193617.4105-9-konrad.dybcio@somainline.org>
Subject: Re: [PATCH RESEND v2 9/9] clk: qcom: gcc-msm8994: Add a quirk for a different SDCC configuration
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Date:   Sun, 29 Aug 2021 12:50:33 -0700
Message-ID: <163026663369.2676726.3000078179170142966@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-08-29 12:36:16)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yam=
l b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> index b44a844d894c..4ba2f72d3cad 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
> @@ -49,6 +49,10 @@ properties:
>      description:
>        Protected clock specifier list as per common clock binding.
> =20
> +  qcom,sdcc2-clk-src-40mhz:
> +    description: SDCC2_APPS clock source runs at 40MHz.
> +    type: boolean
> +
>  required:
>    - compatible
>    - reg
> diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm899=
4.c
> index 72038e4c04df..55c0fd069640 100644
> --- a/drivers/clk/qcom/gcc-msm8994.c
> +++ b/drivers/clk/qcom/gcc-msm8994.c
> @@ -1012,6 +1012,19 @@ static struct clk_rcg2 sdcc1_apps_clk_src =3D {
>         },
>  };
> =20
> +static struct freq_tbl ftbl_sdcc2_40mhz_apps_clk_src[] =3D {
> +       F(144000, P_XO, 16, 3, 25),
> +       F(400000, P_XO, 12, 1, 4),
> +       F(20000000, P_GPLL0, 15, 1, 2),
> +       F(25000000, P_GPLL0, 12, 1, 2),
> +       F(40000000, P_GPLL0, 15, 0, 0),
> +       F(50000000, P_GPLL0, 12, 0, 0),
> +       F(80000000, P_GPLL0, 7.5, 0, 0),
> +       F(100000000, P_GPLL0, 6, 0, 0),
> +       F(200000000, P_GPLL0, 3, 0, 0),

It should work to add more frequencies to the existing table. The
consumer will need to pick the correct frequency. That can be achieved
with an OPP table if necessary, in the consumer node.

> +       { }
> +};
> +
>  static struct freq_tbl ftbl_sdcc2_4_apps_clk_src[] =3D {
>         F(144000, P_XO, 16, 3, 25),
>         F(400000, P_XO, 12, 1, 4),
