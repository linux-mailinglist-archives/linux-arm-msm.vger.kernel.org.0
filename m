Return-Path: <linux-arm-msm+bounces-17510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6A38A5C00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 22:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DC651C21CA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Apr 2024 20:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79A715686D;
	Mon, 15 Apr 2024 20:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uC4jN2nQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E7A15625E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 20:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713211507; cv=none; b=OX5feBsUk3K5e7hjiXB7pi4zFR9w4O56WQqe2aXHD6+Ik1+Rn+eL3fVk7bo16kzw4DbWUODxh4huy9BLy6T7IZ5OLOlch6jEpDPvF9XAkJEmwBaxEUji1/ZSDagx6rtvIDv7lxuKqwal2CtGuur8WHJA2pkMat9cV+74n+NEz2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713211507; c=relaxed/simple;
	bh=nV/5Zy5i9dFykq8+Srtuq9aQoYYGfbts8T748v9Xj+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2OPuSY9G5mCUecpgljfemDRTbKyce9VduRrwbZmAILX0pSU52p4T9ueR/cSUldZAE4w8M4cWcTd54sTlgf0hp1Dtuodxt7HuqW3YrxPjkfnip65Bb3U69sL+4MHhnem3jTVTG35tqSLsZbKX6+CHJphshvNC28UyA+tt4KUsJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uC4jN2nQ; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-ddda842c399so3852905276.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 13:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713211504; x=1713816304; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pVkD3jsw1msmtxQF4rlyHtOM/X3ToEYL670E+U4G0es=;
        b=uC4jN2nQ1hgGZSSPU6ZZQ5nvKsHXISZFT9X0mUHfKxj9AfKJcn5MnuULTFs8OSpzKx
         UYNfr8tPyhl8Y83NlrTMIZ6gviJKVQnac0eJuiLcI8xuwxPAk3+Yz7Iq4Uo7Tm3WQFLL
         QHbABbJoeu6Tqt/nwGEJNFYYCWM4WJGdK4IfHyZ5b0218BIKE9HIE8KOD0gv3vem52gk
         KxKd4vP14H7RyPdVf60yqSGrSdw3aJ7jFPbN6TxY2iWzQcVde0VL/HHurvh2rHgZGP1m
         njB/KZeppUj9WueUe/9M4SK0GY10t9aVOkHBS9yyIY7HdDxWp5JOzcWeS5L6h3EnSRFW
         4s2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713211504; x=1713816304;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVkD3jsw1msmtxQF4rlyHtOM/X3ToEYL670E+U4G0es=;
        b=Ftp3F+Nokc1qLAJgRPANYX448IFcEZJ3MCHpPYNMfIQZbAipa700BIK6g1Ax9ZbdkW
         Xo8QThhv16cfSkkM8xqKLGI8qBrbo1VAClHq/xUY+htBQ2P8GtZGDV4XtAG8EXjgn5fK
         jzPN2eXsTFlxh4plpjWsJm7dvUvBUhmr0RvBW5YupCnt3TKoZxjtnb7QdNNOIyt7/jfB
         G2dGQHTuoPJS7r4SfV8jvmkUpGFr4gMjSP/GA6ijrsNZgXTtHIVO1yV9qanrLLWNqXhf
         Py5hzu4iOgstE4J01ntlun2+TCFS7U/3UfKYfpf3nlVpr5CSNMeZ1hgOCx1XWbeRyTeA
         oBgw==
X-Forwarded-Encrypted: i=1; AJvYcCWdcpFuvJaxkgfYOzJYR+xGbJ4M7iu7d5CriCLYs0uGNOh5PdFEtL5fOk8j0k5wk/3B046w33YtUjKXWEQbh4RhTiXkB3mkGIPJeDxllA==
X-Gm-Message-State: AOJu0YwcfEEAgeEGoHNqFODCGE16LbwaHhfJC2KIM6EOWzvwHR7gLJN1
	ndLIkEBn56SlOr7UvMCVy/wbZhwPba0X+9bEhUqKY/QTNy4cprOIj3dW/Rgw5VONjSGhl7BPdkV
	nV8li75EOCjGs+o7Eevs5dtRoZ0cRqugq9MWrJQ==
X-Google-Smtp-Source: AGHT+IF3Mae4SNhDlErp9j9yGTNWys2//EJwilymG79SRLAHm+Fa1djrn4pEPWZZFliwe11Jn8vFW2dJFT9lgX1FVfM=
X-Received: by 2002:a25:1942:0:b0:dcf:bc86:1020 with SMTP id
 63-20020a251942000000b00dcfbc861020mr10239771ybz.53.1713211504061; Mon, 15
 Apr 2024 13:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415182052.374494-1-mr.nuke.me@gmail.com> <20240415182052.374494-5-mr.nuke.me@gmail.com>
In-Reply-To: <20240415182052.374494-5-mr.nuke.me@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 23:04:53 +0300
Message-ID: <CAA8EJpqKWJBqDUacE0xTLzxny32ZTStiRgXsd2LBD=Hou_CRBw@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] PCI: qcom: Add support for IPQ9574
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Apr 2024 at 21:22, Alexandru Gagniuc <mr.nuke.me@gmail.com> wrote:
>
> Add support for the PCIe on IPQ9574. The main difference from ipq6018
> is that the "iface" clock is not necessarry. Add a special case in
> qcom_pcie_get_resources_2_9_0() to handle this.
>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 14772edcf0d3..10560d6d6336 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1101,15 +1101,19 @@ static int qcom_pcie_get_resources_2_9_0(struct qcom_pcie *pcie)
>         struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
>         struct dw_pcie *pci = pcie->pci;
>         struct device *dev = pci->dev;
> -       int ret;
> +       int ret, num_clks = ARRAY_SIZE(res->clks) - 1;
>
> -       res->clks[0].id = "iface";
> +       res->clks[0].id = "rchng";
>         res->clks[1].id = "axi_m";
>         res->clks[2].id = "axi_s";
>         res->clks[3].id = "axi_bridge";
> -       res->clks[4].id = "rchng";
>
> -       ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
> +       if (!of_device_is_compatible(dev->of_node, "qcom,pcie-ipq9574")) {
> +               res->clks[4].id = "iface";
> +               num_clks++;
> +       }
> +
> +       ret = devm_clk_bulk_get(dev, num_clks, res->clks);

Just use devm_clk_bulk_get_optional() here.

>         if (ret < 0)
>                 return ret;
>
> @@ -1664,6 +1668,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>         { .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
>         { .compatible = "qcom,pcie-ipq8074", .data = &cfg_2_3_3 },
>         { .compatible = "qcom,pcie-ipq8074-gen3", .data = &cfg_2_9_0 },
> +       { .compatible = "qcom,pcie-ipq9574", .data = &cfg_2_9_0 },
>         { .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
>         { .compatible = "qcom,pcie-qcs404", .data = &cfg_2_4_0 },
>         { .compatible = "qcom,pcie-sa8540p", .data = &cfg_sc8280xp },
> --
> 2.40.1
>
>


-- 
With best wishes
Dmitry

