Return-Path: <linux-arm-msm+bounces-50390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2F3A509D8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 19:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EDD31887871
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 18:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECF42561AA;
	Wed,  5 Mar 2025 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yM7PyJ8X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D2C253F3C
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741198712; cv=none; b=lls13RtGSnwsqvilQuAd0ZQEpm4+cEUXHNImic80ZzZaO/s0vxSbN7qmCwT8CHu7SKKAeA56InBNQdXWg8G6RScPjhj4I0ax8YI2AMP2MUbTi+VjyWkznqG16wkvdHbNDnpK0CUvP0ztECCFQ0dE1tWd78H66xmPp7l32X4vlps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741198712; c=relaxed/simple;
	bh=CHVPeNV4aZlMVIMSYfYeSO8Ba+Yk0fM8VLR/eAjSu4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIz0O4M8O19D8+7i+8O8cAPmJHfJz6YJu4+FZCZ4E+8e7Zt3FxMNxASYMeeB2AHLvxXFR4tCBB9w4rHDq7LRHtlepJU9+iRcRaBCbQmZ9gGS5OWRqGYwowpcbNitXsi40UWYSZHt0cGg4GDgzWCY4Pw2NrD0rhgDk/ocBFyV1qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yM7PyJ8X; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22349dc31bcso128512625ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 10:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741198710; x=1741803510; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oqKBFVD7BmtZnDhxGEB2Az6asxUlkas0B0Pi0JaurnM=;
        b=yM7PyJ8X4kk63j4ccy9lJ0gMgtJ5teBQflWki6SSlA+gugv6ZOhbi+XXFQnSP3f1TJ
         Z6U+mpkx5qRk3MRLL/T0XZggZBuCa6Pobkf+NSrBNmiIkDbs6HH10CDpdor79mZdafrf
         SHw8QZHVtJt7ODMkHICpOHoBneG+dhYOCD9o/o2koj8poTkM9QegttakW7r7Q5uS8X+8
         vPULZJ+wCAD1j+yTbCg+0tEIlNNdtPsmDRFpR1uphrFUzVLgVgI02CU1fj62ltwrRYuF
         whdZeqfJOAmdV6DOr92JhLy6vz20mO099Zm+USL434UxpcOjTRiyIgxFwPhq+vcbHIwu
         fqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741198710; x=1741803510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oqKBFVD7BmtZnDhxGEB2Az6asxUlkas0B0Pi0JaurnM=;
        b=JcagnJKf+N0DbpdxRKCfVI7kBp7CyjLXmVmT+Iriyr2F7Yje9aG7keUhouCwlNghlm
         BVb5bq/hNMV3bP8xal4ovwcTzXBnsPQrEZdFW/GPaRLyen4Jy6NIa5X1J3HO3Gu2bmax
         J3JMNJ9sh93I5pgud66hMlBA4yl7jwRaRk4iFOad91WPCsS26CnMMlEsXsmyw3gscZJ9
         qDA7j0lcAg8funYSq+qZADmfULUZfKJQl/fAhwsIE1MHAa8ue9iXQud/83IktVq5y+bt
         UV/y7yDiwAi0sQHVQvy7HfrRlxZ0sqrOtEE0HVYuJ3+7TIW7JzARtWwrSvFmNfraPiZw
         sjmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8emhGT48kN0BhDDcEq46rrYzoiwv3pUeEG0CkvBFdwKRRFQKhN9EDz2ON5wHQQWc9CAWeRqe5t2hPTj+8@vger.kernel.org
X-Gm-Message-State: AOJu0Yym3WppnUTS5fK0Uuxl7UqAgFDRBlF2au+a1l3TtRhfCDQuoxeD
	7xBU7myVDzUHLkO5uUpp0V6DS+c53fMUyECNNVLcTGKD8ybI5m1HELa4Zf9gMQ==
X-Gm-Gg: ASbGncvVApBw/s1uBbXVY8lllM6vvVveTvZ+Lf+PU3BGCV3EJXZ8ndf3lzoGlfkhzsA
	0JvcOHnjpDEqSWlvf12Em8RrEqxgvusfbm7ZblkZqyMgGd1W3wPzOX6h+2R2TOKUveJ5X3ArH6Q
	hJZ4gFh1+MRs5xdCUbCbu4y6WX2QbrhDvfBb6eV2/exVwTDyGUa41RFxnJxNyDuIMGXJcL7bNoS
	9qipiFfBkV1sxd1ovTvf0KhQRZczFWk+HfszIeQQ5GC1rOotJvj+3l+mA/5/5zyv11wK7b/k99z
	KoFaRQz6tVz6eoMpamm8ydg0Le87ypc5El/FzX6lRO6agiHthkQnfnKQ
X-Google-Smtp-Source: AGHT+IHTeeIhNi/0pb7+gb1R76gjf4Wb38QT5wJFtMtan4n6WS8u6zPjBJy02e3tGW2OydQi15Tvtw==
X-Received: by 2002:a17:903:240a:b0:224:6a7:a5b0 with SMTP id d9443c01a7336-22406a7a82amr15559775ad.2.1741198710127;
        Wed, 05 Mar 2025 10:18:30 -0800 (PST)
Received: from thinkpad ([120.60.140.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22350514239sm116134605ad.219.2025.03.05.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:18:29 -0800 (PST)
Date: Wed, 5 Mar 2025 23:48:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: cros-qcom-dts-watchers@chromium.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
	quic_mrana@quicinc.com, quic_vpernami@quicinc.com,
	mmareddy@quicinc.com
Subject: Re: [PATCH v4 3/4] PCI: dwc: Reduce DT reads by allocating host
 bridge via DWC glue driver
Message-ID: <20250305181823.ltm54e4yxaj5etw5@thinkpad>
References: <20250207-ecam_v4-v4-0-94b5d5ec5017@oss.qualcomm.com>
 <20250207-ecam_v4-v4-3-94b5d5ec5017@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250207-ecam_v4-v4-3-94b5d5ec5017@oss.qualcomm.com>

On Fri, Feb 07, 2025 at 04:58:58AM +0530, Krishna Chaitanya Chundru wrote:
> dw_pcie_ecam_supported() needs to read bus-range to find the maximum
> bus range value. The devm_pci_alloc_host_bridge() is already reading
> bus range and storing it in host bridge.If devm_pci_alloc_host_bridge()
> moved to start of the controller probe, the dt reading can be avoided
> and use values stored in the host bridge.
> 
> Allow DWC glue drivers to allocate the host bridge, avoiding redundant
> device tree reads primarily in dw_pcie_ecam_supported().
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 826ff9338646..a18cb1e411e4 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -484,8 +484,8 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	struct device *dev = pci->dev;
>  	struct device_node *np = dev->of_node;
>  	struct platform_device *pdev = to_platform_device(dev);
> +	struct pci_host_bridge *bridge = pp->bridge;
>  	struct resource_entry *win;
> -	struct pci_host_bridge *bridge;
>  	struct resource *res;
>  	int ret;
>  
> @@ -527,7 +527,12 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  	if (!bridge)
>  		return -ENOMEM;
>  
> -	pp->bridge = bridge;
> +	if (!pp->bridge) {

'pp->bridge' is getting dereferenced above as I indicated in patch 1.

> +		bridge = devm_pci_alloc_host_bridge(dev, 0);
> +		if (!bridge)
> +			return -ENOMEM;
> +		pp->bridge = bridge;

There is already a previous devm_pci_alloc_host_bridge() call before this and
you are just duplicating the code here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

