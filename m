Return-Path: <linux-arm-msm+bounces-17655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E998A7CE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 09:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66F3C28260B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 07:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945A67BB19;
	Wed, 17 Apr 2024 07:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rTIfmRVv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E454F6A35A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 07:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713338058; cv=none; b=Wmo0WFNogZmIntbz6D+WTC71q0sCpbL9TH485fIc7SH7F2BcsXNKLqZ7CVwr788WCbcorV2PPKR9kR4jwewQWUNGJWaz+VxwXd+nO0ZZQG8g3KZgq8sBjsQMeeMETurw48NYgnVVBWzFp/5SDq9MJ6rPuSntDYXaDxN8cmBWZfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713338058; c=relaxed/simple;
	bh=Wg9bp/1KONUVlzT3UD7ChlmkEWpfB86YN/zEsuRAT8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E1YWeTHL+79qNYuBABkJ/khAlmCBp2pzX9PTl7N76tpQpqsOgt8rBd6jPhG5tCe4/Dk6KNa0u8NV+Yk20HVdJHeDVKL8phRFyic7TnAr+3wjrRfzBQyhaBQmb2Y9ETqzpp0sByeNEY+/nNyOoqyd9UnlnZnUGzSM/H/c8sFU8YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rTIfmRVv; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6ea26393116so4042637a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 00:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713338055; x=1713942855; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rds/vSPkCgLztEVJcMBchz0yVanaqr2q9MoqHxNAgzI=;
        b=rTIfmRVvzw7GHb80iifWSxFmg8JI2hSbMRbCejEm1be2oBphm1D/H+hLGi5Giardbh
         PlVKu4XnCvTrJ/OYV1r4w179767uIzYG+2hUkum6PaO4MZXWt0elVHc5cBPHWpPEfIlN
         PVfW3N0KMZp/+VTi2Uhw/jzQ3HhGnuM7Yi6aMUnHqYa5KCiSK/kGFAx/Ebk+9G9ZSsOT
         ptKhmtZRvkpb4qCbNnK6pmToGBvvk+aZUr/fNvgOJhOcIHirNHYS7kAhirJmNvb3h95M
         6BSNVaOT2DqfatW7rvJnvOBkZ7OofT+oi46l7zcO6fuZcJ7Vni1C3/t+yOQhFeGvi8fn
         MkZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713338055; x=1713942855;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rds/vSPkCgLztEVJcMBchz0yVanaqr2q9MoqHxNAgzI=;
        b=ATxw5ZfOy7dFB8+jUl0Deuktr1r09v0kWDbFIajRo50Ve5Puvw7h9XNljJwN9m8I57
         RXxwOjRtDe7vVLgoaO5/QSK3DlUP9gQz+WCk98Ph5rT5FFbVhX0VHnfcpFeSr0Kp8rU4
         M0W3IsFT5HrMYbI4S+YVq7XRiCdzk+vOqeHF0hHD5qpsxaeIxlYBN1DYZw8kYwJvNJ+o
         NVptQHF+hP62Rn9NroiUSUWx2SHxGIBXQ/CVshQ325eSUICajafOlA34IKRxBzX/Q5uX
         p/EjnTyI/FGZcQnX8cMjPhM7bSV7dNstD107ks0OBeTcx5GwuT+N3fCYwwaQl9JY1EYc
         l40w==
X-Forwarded-Encrypted: i=1; AJvYcCUSWUuHZHj7caLtlgM3ws5RwXVPuuJxjR5K0ooRZ3oGUgv/RMMzARZmWLLAdTQVx1vAqvwG+CaHkhuBJnWfKJAONmebgKXJ/QezvNloGg==
X-Gm-Message-State: AOJu0Yw3UpQUAOWXYWa6bCIiFair6eBUptJdp58NAmNheMNM9/4faFaU
	1EGnRrWi7a9JY4YXT0WMjiGV8G9uty5JWpRjMEz3XwBJQu2/S1KHtypLyxnbzw==
X-Google-Smtp-Source: AGHT+IHaHrm2pb+wT7KKfQkSKKuzy7HKCVhCIyuFy2rzef2uOrb0UaXT1cyILAlN1opmVB/oaR6cAg==
X-Received: by 2002:a05:6870:70a1:b0:22f:70da:1f26 with SMTP id v33-20020a05687070a100b0022f70da1f26mr19032069oae.27.1713338054787;
        Wed, 17 Apr 2024 00:14:14 -0700 (PDT)
Received: from thinkpad ([120.60.54.9])
        by smtp.gmail.com with ESMTPSA id z3-20020aa78883000000b006e5571be110sm9998837pfe.214.2024.04.17.00.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 00:14:14 -0700 (PDT)
Date: Wed, 17 Apr 2024 12:44:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/7] PCI: qcom: Add support for IPQ9574
Message-ID: <20240417071406.GC3894@thinkpad>
References: <20240415182052.374494-1-mr.nuke.me@gmail.com>
 <20240415182052.374494-5-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240415182052.374494-5-mr.nuke.me@gmail.com>

On Mon, Apr 15, 2024 at 01:20:49PM -0500, Alexandru Gagniuc wrote:
> Add support for the PCIe on IPQ9574. The main difference from ipq6018
> is that the "iface" clock is not necessarry. Add a special case in
> qcom_pcie_get_resources_2_9_0() to handle this.
> 

Could you add more information about the PCIe controller used in this SoC? Like
controller version, supported data rate, PCIe generation etc...

- Mani

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
>  	struct qcom_pcie_resources_2_9_0 *res = &pcie->res.v2_9_0;
>  	struct dw_pcie *pci = pcie->pci;
>  	struct device *dev = pci->dev;
> -	int ret;
> +	int ret, num_clks = ARRAY_SIZE(res->clks) - 1;
>  
> -	res->clks[0].id = "iface";
> +	res->clks[0].id = "rchng";
>  	res->clks[1].id = "axi_m";
>  	res->clks[2].id = "axi_s";
>  	res->clks[3].id = "axi_bridge";
> -	res->clks[4].id = "rchng";
>  
> -	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(res->clks), res->clks);
> +	if (!of_device_is_compatible(dev->of_node, "qcom,pcie-ipq9574")) {
> +		res->clks[4].id = "iface";
> +		num_clks++;
> +	}
> +
> +	ret = devm_clk_bulk_get(dev, num_clks, res->clks);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -1664,6 +1668,7 @@ static const struct of_device_id qcom_pcie_match[] = {
>  	{ .compatible = "qcom,pcie-ipq8064-v2", .data = &cfg_2_1_0 },
>  	{ .compatible = "qcom,pcie-ipq8074", .data = &cfg_2_3_3 },
>  	{ .compatible = "qcom,pcie-ipq8074-gen3", .data = &cfg_2_9_0 },
> +	{ .compatible = "qcom,pcie-ipq9574", .data = &cfg_2_9_0 },
>  	{ .compatible = "qcom,pcie-msm8996", .data = &cfg_2_3_2 },
>  	{ .compatible = "qcom,pcie-qcs404", .data = &cfg_2_4_0 },
>  	{ .compatible = "qcom,pcie-sa8540p", .data = &cfg_sc8280xp },
> -- 
> 2.40.1
> 

-- 
மணிவண்ணன் சதாசிவம்

