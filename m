Return-Path: <linux-arm-msm+bounces-4666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9A78128D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 08:12:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69507281E7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 501E1D52B;
	Thu, 14 Dec 2023 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yfQBWOAG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53EC106
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:12:19 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d279bcce64so78131867b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 23:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702537939; x=1703142739; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BeQY4H3SvQ0wdp8LNZJHZHNl8zWKZa5eAoAO6u6SBqw=;
        b=yfQBWOAGBpJrLDiYeJiIU4q81B+ykK4WOAl4O+IlfvroT7Oz7u8Cj+lfvZ2LyMVggu
         bQHbGlY7Tl+0pq8js5jLCIgF9oSQvUTVltU3kWvTquUBzFl2Dsr3LdnBOYkVixZhPGC9
         pWFR0xJ4tSmxBavtrlJfhhNReGPBsJNLLxcr+hn98HmHKAYnHB/RYm54ya8beerh3I1B
         d4FuXkqXHCmazyu3+wTONk84c9AtBkvUxFxxNmwsSRLtNqE/XpkK1ZOQaz5Vvugtb+EM
         17J9TD/chFmOYqlpkAaf4nbPh9somuTTc9AXi8c3sGdfYO2cvB11Cq3VwGL1X1BPHzTD
         BnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702537939; x=1703142739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BeQY4H3SvQ0wdp8LNZJHZHNl8zWKZa5eAoAO6u6SBqw=;
        b=o/d6oZBgNrCsmG4xiomvbbv6qgjop5IX93VFgwvfYM/2lyqt+SP0Tnfs6VPtAo1ixg
         9ERSGyAfdwHpFEHkVkqt0PE+6RXOdC37Fvkx7FwR408mP/JQURtGO9uOlkisaL2fI1AE
         u6v+Czi5Wbr5qRjwI3QNIKD/yOmm4gmqTPIPlj12wW2NtaRVRcNafA4xFeNtoawL+rWL
         I15V6E6dE9rxobg8e4XOjUCaoAmwKNPkKLJ0kxjrwDf5sufNp9zOOcLyQRky6ndz7CZP
         JwW5LVFY/OTCqYn0I4yVp2lZaMJjbGdmYghsdB20l/FAQgiY75lCOyNsXtEsCa5ufz5q
         GHpA==
X-Gm-Message-State: AOJu0YwvSyFeUaWaJYYkeH0BvZv+FvF9dRXzaIV7dDOfUPBpdmDRoe0w
	XfMqIyXTvk4SFTRTnnK6tfx2KO0x8nVd/mynPaFdpA==
X-Google-Smtp-Source: AGHT+IH29F7oDPcW96XqPra5HyXoBDO1YudpygTc5FlbxagbsYbyzPBTWsjhToTqAubKvWeBHVd6Jk+uBDLmOzLIaqk=
X-Received: by 2002:a0d:ca84:0:b0:5e2:8d1d:e323 with SMTP id
 m126-20020a0dca84000000b005e28d1de323mr2294917ywd.41.1702537939001; Wed, 13
 Dec 2023 23:12:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214062847.2215542-1-quic_ipkumar@quicinc.com> <20231214062847.2215542-7-quic_ipkumar@quicinc.com>
In-Reply-To: <20231214062847.2215542-7-quic_ipkumar@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Dec 2023 09:12:08 +0200
Message-ID: <CAA8EJppSXeV9LSv8VAwYSP9nDzq+uHTvbiEzD4PebEHoOJySNg@mail.gmail.com>
Subject: Re: [PATCH 06/10] phy: qcom: ipq5332: Add support for g3x1 and g3x2
 PCIe PHYs
To: Praveenkumar I <quic_ipkumar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, bhelgaas@google.com, 
	lpieralisi@kernel.org, kw@linux.com, vkoul@kernel.org, kishon@kernel.org, 
	mani@kernel.org, quic_nsekar@quicinc.com, quic_srichara@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org, 
	quic_varada@quicinc.com, quic_devipriy@quicinc.com, quic_kathirav@quicinc.com, 
	quic_anusha@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Dec 2023 at 08:30, Praveenkumar I <quic_ipkumar@quicinc.com> wrote:
>
> Add support for single-lane and dual-lane PCIe UNIPHY found on
> Qualcomm IPQ5332 platform. This UNIPHY is similar to the one
> present in Qualcomm IPQ5018.
>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> ---
> This patch depends on the below series which adds PCIe support in
> Qualcomm IPQ5018
> https://lore.kernel.org/all/20231003120846.28626-1-quic_nsekar@quicinc.com/
>
>  .../phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
> index 9f9a03faf6fa..aa71b85eb50e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-uniphy-pcie-28lp.c
> @@ -34,6 +34,10 @@
>  #define SSCG_CTRL_REG_6                0xb0
>  #define PCS_INTERNAL_CONTROL_2 0x2d8
>
> +#define PHY_CFG_PLLCFG                         0x220
> +#define PHY_CFG_EIOS_DTCT_REG                  0x3e4
> +#define PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME                0x3e8
> +
>  #define PHY_MODE_FIXED         0x1
>
>  enum qcom_uniphy_pcie_type {
> @@ -112,6 +116,21 @@ static const struct uniphy_regs ipq5018_regs[] = {
>         },
>  };
>
> +static const struct uniphy_regs ipq5332_regs[] = {
> +       {
> +               .offset = PHY_CFG_PLLCFG,
> +               .val = 0x30,
> +       },
> +       {
> +               .offset = PHY_CFG_EIOS_DTCT_REG,
> +               .val = 0x53ef,
> +       },
> +       {
> +               .offset = PHY_CFG_GEN3_ALIGN_HOLDOFF_TIME,
> +               .val = 0xCf,
> +       },
> +};
> +
>  static const struct uniphy_pcie_data ipq5018_2x2_data = {
>         .lanes          = 2,
>         .lane_offset    = 0x800,
> @@ -121,6 +140,23 @@ static const struct uniphy_pcie_data ipq5018_2x2_data = {
>         .pipe_clk_rate  = 125000000,
>  };
>
> +static const struct uniphy_pcie_data ipq5332_x2_data = {
> +       .lanes          = 2,
> +       .lane_offset    = 0x800,
> +       .phy_type       = PHY_TYPE_PCIE_GEN3,
> +       .init_seq       = ipq5332_regs,
> +       .init_seq_num   = ARRAY_SIZE(ipq5332_regs),
> +       .pipe_clk_rate  = 250000000,
> +};
> +
> +static const struct uniphy_pcie_data ipq5332_x1_data = {
> +       .lanes          = 1,
> +       .phy_type       = PHY_TYPE_PCIE_GEN3,
> +       .init_seq       = ipq5332_regs,
> +       .init_seq_num   = ARRAY_SIZE(ipq5332_regs),
> +       .pipe_clk_rate  = 250000000,
> +};

Please keep structs sorted out.

> +
>  static void qcom_uniphy_pcie_init(struct qcom_uniphy_pcie *phy)
>  {
>         const struct uniphy_pcie_data *data = phy->data;
> @@ -270,6 +306,14 @@ static const struct of_device_id qcom_uniphy_pcie_id_table[] = {
>                 .compatible = "qcom,ipq5018-uniphy-pcie-gen2x2",
>                 .data = &ipq5018_2x2_data,
>         },
> +       {
> +               .compatible = "qcom,ipq5332-uniphy-pcie-gen3x2",
> +               .data = &ipq5332_x2_data,
> +       },
> +       {
> +               .compatible = "qcom,ipq5332-uniphy-pcie-gen3x1",
> +               .data = &ipq5332_x1_data,

The entries here should be sorted out.

> +       },
>         { /* Sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, qcom_uniphy_pcie_id_table);
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry

