Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2018435202F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 21:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbhDAT4V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 15:56:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:47740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234956AbhDAT4L (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 15:56:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3DAE61041;
        Thu,  1 Apr 2021 19:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617306971;
        bh=ChFC7NycbeTj6zCwP3dNjOnoAHLUf/WuAPwnnC/LFV8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ozr0Ie6ieEYkXukXSwKYxaakNNL2BiwauH7/3xdXx4KIYUdp2wPYF/Jdxm/v76dNE
         TMVKpVj45DvMTWehDunaEisOD/KyvK8Qf/MN+bGCdEiPenAAjTqYKKghftKPGMCv0y
         hgs46ejoYVkap1tkQBG6MLnxAKGEwmrau7YBpBPYHezjXSA2Szut7CPAKh0Ehali5P
         nYU5fsHPASAOvU4VR7vzw/roeeAkAcHs5luixwIDjNoONh2GG6h7hSF/SdC5UDTVGi
         GEAQd1lUyFdWofNkHAPy7CE30RJkqqtxXrGsIrwc8mBTnmz/wEGrtrP4UbNF5jwq0v
         Vbd079jLClzYw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210313021919.435332-8-konrad.dybcio@somainline.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org> <20210313021919.435332-8-konrad.dybcio@somainline.org>
Subject: Re: [PATCH 8/9] clk: qcom: gcc-msm8994: Add proper msm8992 support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
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
Date:   Thu, 01 Apr 2021 12:56:10 -0700
Message-ID: <161730697046.2260335.17961769659321987524@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Konrad Dybcio (2021-03-12 18:19:17)
> diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm899=
4.c
> index fae784b4242f..a5b9db7678d1 100644
> --- a/drivers/clk/qcom/gcc-msm8994.c
> +++ b/drivers/clk/qcom/gcc-msm8994.c
> @@ -2718,13 +2742,57 @@ static const struct qcom_cc_desc gcc_msm8994_desc=
 =3D {
>  };
> =20
>  static const struct of_device_id gcc_msm8994_match_table[] =3D {
> -       { .compatible =3D "qcom,gcc-msm8994" },
> +       { .compatible =3D "qcom,gcc-msm8992" },
> +       { .compatible =3D "qcom,gcc-msm8994" }, /* V2 and V2.1 */
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, gcc_msm8994_match_table);
> =20
>  static int gcc_msm8994_probe(struct platform_device *pdev)
>  {
> +       struct device *dev =3D &pdev->dev;
> +       bool is_msm8992;
> +
> +       is_msm8992 =3D of_device_is_compatible(pdev->dev.of_node, "qcom,g=
cc-msm8992");
> +
> +       if (is_msm8992) {

Drop the bool please

	if (of_device_is_compatible(pdev->dev.of_node, "qcom,gcc-msm8992")) {

> +               /* MSM8992 features less clocks and some have different f=
req tables */
> +               gcc_msm8994_desc.clks[GCC_LPASS_Q6_AXI_CLK] =3D 0;

Use NULL please.

> +               gcc_msm8994_desc.clks[GCC_PCIE_1_AUX_CLK] =3D 0;
> +               gcc_msm8994_desc.clks[GCC_PCIE_1_CFG_AHB_CLK] =3D 0;
> +               gcc_msm8994_desc.clks[GCC_PCIE_1_MSTR_AXI_CLK] =3D 0;
