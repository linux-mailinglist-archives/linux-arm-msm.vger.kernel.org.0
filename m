Return-Path: <linux-arm-msm+bounces-92-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C477E3FB7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 14:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 722A0B20B18
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 13:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 867BB2DF9F;
	Tue,  7 Nov 2023 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LK8RdlK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A162DF93
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 13:08:56 +0000 (UTC)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2327E2D5E
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 05:08:54 -0800 (PST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5a877e0f0d8so56209277b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Nov 2023 05:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699362533; x=1699967333; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dbx/UynaS38IRg6RqSnz8/nqPOY3sS3Z4B+scjr8meY=;
        b=LK8RdlK423GlR5d0BTGiAE8B4nNIW6ouR/poIYvanbD3Iv9jr0lMBxoctpS6i4Bw1O
         z1qppQoekziHWvOlvOlBOAex5MfIyJY6LN6Wr1pmB/i5kerVYgVwhdl6CJx1wtAjH8Lj
         NKYVT4YH0vZYekiyCkll0LyqV1unmZ6pYVkjnXNg8oWzH4QsoeiuhLGMiSRf3dzQLp3X
         uomRfSY4dqYO5sdU69jb4OrsYQ58ZUMSqhIBgaK9lYd/VVQXzDd4T7MKdHyVrnPUZjlA
         MF//5Qz7EQqBCwONAzrzdbB4FqqEMdyYmIhYWivDlPqKKlEsptb2nACJ5y6GWzGSIERu
         dZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362533; x=1699967333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dbx/UynaS38IRg6RqSnz8/nqPOY3sS3Z4B+scjr8meY=;
        b=xCzqHOslAIYHhkbahRr9Goyo86GqHo+kpThX+gIU6m0oYzHkPKPUThNhSt7+7sGX7o
         6MUv7z2ZBFNfSviEvxSagiHQHX4mH1+amuBc9FDzpojhfbB6SXZ+WOiN1ys+IdKFkAf0
         p+uNBorBLHt3sBP1XF8w75Z2ZBMvLJf93mGbNcPBNyeKQKHNWGe+LgRdLyHScJXFv3D6
         tG0jOJtFpWJLaLnuYSajUmwItAXxZK2B8hv1bJK+MO62j8yUREv0eTB8vR019eJg1THM
         xNZ4tIdUa/pu/ixckboPej9z7y9FMwRB9ocfPls2tWbBwsXOzwy0gS3DfLmJof3u4i+T
         Bjnw==
X-Gm-Message-State: AOJu0Yw8OvBPmxEZMYRJc6wbZCVvFuB8ujAIV6XfKmB1ZHJuVsD0NKyY
	gjVfsvDG3Mmk9E7vvuPUbbeCUEZ3VaKcBB7IDqgUWw==
X-Google-Smtp-Source: AGHT+IELQi9sG90iFpA9loHvBjUJx0r9EJFbAMFv8Z46iVDiHRl4G0EmCSSc86dZtYBzCJ5XkBrXYS2Xo1C3aXEOwXs=
X-Received: by 2002:a81:9846:0:b0:5b3:4c7e:7473 with SMTP id
 p67-20020a819846000000b005b34c7e7473mr1656944ywg.17.1699362533189; Tue, 07
 Nov 2023 05:08:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231107-refclk_always_on-v2-0-de23962fc4b3@quicinc.com> <20231107-refclk_always_on-v2-3-de23962fc4b3@quicinc.com>
In-Reply-To: <20231107-refclk_always_on-v2-3-de23962fc4b3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 7 Nov 2023 15:08:41 +0200
Message-ID: <CAA8EJpp1ObZjmX65TctoPo7ywvFBguFND2LcmTq3Dhcj=3vstg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] phy: qcom-qmp-pcie: Add support for keeping refclk
 always on
To: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	quic_vbadigan@quicinc.com, quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com, 
	quic_skananth@quicinc.com, quic_vpernami@quicinc.com, quic_parass@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Nov 2023 at 14:26, Krishna chaitanya chundru
<quic_krichai@quicinc.com> wrote:
>
> In PCIe low power states like L1.1 or L1.2 the phy will stop
> supplying refclk to endpoint. If endpoint asserts clkreq to bring
> back link L0, then RC needs to provide refclk to endpoint.
>
> If there is some issues in platform with clkreq signal propagation

Nit: there are

I'd rephrase this in the following way:

Some platforms (e.g. ABC DEF) fail to drive the clkreq signal to the
host (because it is unconnected ?). Due to that...

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> to host and due to that host will not send refclk which results PCIe link
> down. For those platforms phy needs to provide refclk even in low power
> states.
>
> Add a flag to keep refclk always supplied to endpoint.
>
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index 74d03d217ff2..a8d6d69e3f74 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -43,6 +43,8 @@
>  /* QPHY_PCS_STATUS bit */
>  #define PHYSTATUS                              BIT(6)
>  #define PHYSTATUS_4_20                         BIT(7)
> +/* PCS_PCIE_ENDPOINT_REFCLK_CNTRL */
> +#define EPCLK_ALWAYS_ON_EN                     BIT(6)
>
>  #define PHY_INIT_COMPLETE_TIMEOUT              10000
>
> @@ -2264,6 +2266,8 @@ struct qmp_pcie {
>         struct phy *phy;
>         int mode;
>
> +       bool refclk_always_on;
> +
>         struct clk_fixed_rate pipe_clk_fixed;
>  };
>
> @@ -3179,6 +3183,10 @@ static void qmp_pcie_init_registers(struct qmp_pcie *qmp, const struct qmp_phy_c
>         qmp_pcie_configure(pcs, tbls->pcs, tbls->pcs_num);
>         qmp_pcie_configure(pcs_misc, tbls->pcs_misc, tbls->pcs_misc_num);
>
> +       if (qmp->refclk_always_on && cfg->regs[QPHY_PCS_ENDPOINT_REFCLK_CNTRL])
> +               qphy_setbits(pcs_misc, cfg->regs[QPHY_PCS_ENDPOINT_REFCLK_CNTRL],
> +                            EPCLK_ALWAYS_ON_EN);
> +
>         if (cfg->lanes >= 4 && qmp->tcsr_4ln_config) {
>                 qmp_pcie_configure(serdes, cfg->serdes_4ln_tbl, cfg->serdes_4ln_num);
>                 qmp_pcie_init_port_b(qmp, tbls);
> @@ -3701,6 +3709,12 @@ static int qmp_pcie_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_node_put;
>
> +       qmp->refclk_always_on = of_property_read_bool(dev->of_node, "qcom,refclk-always-on");
> +       if (qmp->refclk_always_on && !qmp->cfg->regs[QPHY_PCS_ENDPOINT_REFCLK_CNTRL]) {
> +               dev_err(dev, "refclk is always on is present but refclk cntrl offset is not present\n");
> +               goto err_node_put;
> +       }
> +
>         ret = phy_pipe_clk_register(qmp, np);
>         if (ret)
>                 goto err_node_put;
>
> --
> 2.42.0
>
>


-- 
With best wishes
Dmitry

