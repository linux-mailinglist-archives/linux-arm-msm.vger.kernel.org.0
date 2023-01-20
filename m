Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC512675FF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 23:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbjATWLn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 17:11:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjATWLn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 17:11:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D8C36441;
        Fri, 20 Jan 2023 14:11:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7C20FB82A8B;
        Fri, 20 Jan 2023 22:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C661C433EF;
        Fri, 20 Jan 2023 22:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674252699;
        bh=fY92xshQMLDdPXyG9FcNkhWbhYvRBMxZmEl2a/bUYwE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MKJQJ7VHJ4+NchxxWdA3fCaDWfPqCerxmUYk1gUrzKS67DP8o5pctztlqVEgHtm6d
         8bgfN3b8fHuVLRi484wMLag5HFsj7mzIa8Wh812VtIwITEVUmESHxAqptESbyoEJy6
         h4Wzr2bdstsWpQvXTmzdru9pb5TGTxv32gJX8lgjQMAoABLOSBpbaovgEDMxztrmLt
         IK0famR5YSsmL4mviMn3N+MjCCY0uuNxOiOw7KiV1W/z8WMxRp4X9JBQ02dDp52RK+
         8kLXSPrmmjL3rQ3QPFJP3DJbxodUm2zbD8BtQ/Vi+/YDS2hlXPtyAJxIgxpCS32LWp
         2kQXlgjwCHV2A==
Message-ID: <078c5a8254ac006b65fc5fa81dfbc515.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230120061417.2623751-5-dmitry.baryshkov@linaro.org>
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org> <20230120061417.2623751-5-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 4/8] clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Date:   Fri, 20 Jan 2023 14:11:35 -0800
User-Agent: alot/0.10
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2023-01-19 22:14:13)
> Turn CBF into the interconnect provider. Scale CBF frequency (bandwidth)
> according to CPU frequencies.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/clk-cbf-8996.c | 143 +++++++++++++++++++++++++++++++-
>  1 file changed, 142 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/qcom/clk-cbf-8996.c b/drivers/clk/qcom/clk-cbf-8=
996.c
> index 9cde0e660228..b049b4f7b270 100644
> --- a/drivers/clk/qcom/clk-cbf-8996.c
> +++ b/drivers/clk/qcom/clk-cbf-8996.c
> @@ -5,11 +5,14 @@
>  #include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> +#include <linux/interconnect-provider.h>
>  #include <linux/of.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> =20
> +#include <dt-bindings/interconnect/qcom,msm8996-cbf.h>
> +
>  #include "clk-alpha-pll.h"
>  #include "clk-regmap.h"
> =20
> @@ -225,6 +228,133 @@ static const struct regmap_config cbf_msm8996_regma=
p_config =3D {
>         .val_format_endian      =3D REGMAP_ENDIAN_LITTLE,
>  };
> =20
> +#ifdef CONFIG_INTERCONNECT

Can you move this driver to drivers/interconnect/ ?

> +struct qcom_msm8996_cbf_icc_provider {
> +       struct icc_provider provider;
> +       struct clk *clk;
> +};
> +
> +#define to_qcom_cbf_provider(_provider) \
> +       container_of(_provider, struct qcom_msm8996_cbf_icc_provider, pro=
vider)
> +
> +enum {
> +       CBF_MASTER_NODE =3D 2000,
[...]
> +static int qcom_msm8996_cbf_icc_remove(struct platform_device *pdev)
> +{
> +       struct icc_provider *provider =3D platform_get_drvdata(pdev);
> +
> +       icc_nodes_remove(provider);
> +       icc_provider_del(provider);
> +
> +       return 0;
> +}
> +#else
> +static int qcom_msm8996_cbf_icc_register(struct platform_device *pdev)
> +{
> +       dev_warn(&pdev->dev, "interconnects support is disabled, CBF cloc=
k is fixed\n");
> +
> +       return 0;
> +}
> +#define qcom_msm8996_cbf_icc_remove(pdev) (0)

It's like two drivers in one.

> +#endif
> +
>  static int qcom_msm8996_cbf_probe(struct platform_device *pdev)
>  {
>         void __iomem *base;
