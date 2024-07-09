Return-Path: <linux-arm-msm+bounces-25543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0592AF51
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 07:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 686BE1F22013
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 05:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DDA312DD90;
	Tue,  9 Jul 2024 05:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xUdWgw4X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3604F12E1C4
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 05:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720501931; cv=none; b=ilWj2WMk3sqAPw2DpbFPjAub4IHhz7X4e0Pk/WMjhOhV39ZjSvkSEdQME6mNJoEKJu0Yu6xLQkQA7a01gP7N1AIGrzIauTQ/aKGccLRUB7LU/yHgAY+WZiZxpZfmVJyHKhtLI9V9+/wxKR7ES5SjuXZfzn9msMeFMEGxqJag7nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720501931; c=relaxed/simple;
	bh=hZrNby8Wqv1N1agmOmeRetovV+1eWf/UR5CpaOhm0R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kubxw18VnTASPjt78VXRBBy0jscnnL/QomboIVUDytkwXDJI+VxgxYn71wu0NynZZ6374uAxK5F0UP7o78YhAMZ+NcCu098j+dfY0G6300Lh7f5og63ZgZK7S6tiMrKfB8xdQvjy/ylBU8vwxoIK/7hZNnqv5uTwP5z1NzuRkcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xUdWgw4X; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fb222a8eaeso32956035ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jul 2024 22:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720501929; x=1721106729; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5dnB1YYKwyLNgKX3mrii2OWpX3QNNGe1qm9HISwK1nM=;
        b=xUdWgw4XANdVplxUzfgRvHB5QQfSFwktQUWWkfM0mnWvMTC3ffCAFX7gz3gHgPcIDe
         5+lIvNGuTmrJCk83lAL+zmKG/W1bDcX6nOQzVoW9Sq/OgkEQINXpjiSUx1j3y646mE7G
         BqtBFAGt9UQ4wYYZmxoBzM2p+l70HAJmuZjG58oxPeWcxMVBSU/H8kAgEB/zYvNGzx4o
         ruiiw+OKz4pmONm7uvBeQfzNdgTheIOzIVYz1ZWxTOUZdt9VYrrqTXXPm5uj6y7jz8Av
         8y2En0kyc/U8pESKWo2j4k2yVTGxKgWdkgG+JQVc7cruyTO5HuNrb7u+ZIejTE80YMH2
         c5mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720501929; x=1721106729;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dnB1YYKwyLNgKX3mrii2OWpX3QNNGe1qm9HISwK1nM=;
        b=d57erEuHkVK3Bl3EKpcdnwY0ll4PfbIdyQtOY1CeL8bOLhn4I0eRs+0BbPn+S6+gQ1
         dFV0GOnQjxp8r1sE2/++iUFlN6bCWU8igpp5QfP+OwCsNOYQKMPhBU5kCLLe8mcysqwi
         Q/UhvdbVeHltDz+sicpHJxSaMkL+qXl2/3PoODp9/RaOSjI3BEivkahLuYEtVPB7twqV
         3Hz8z0YZptw7MvegPQw0LZUJRNTP+REUKQcVmbiUtNOxRZidVRlMNoDDU1moXSmD6S+6
         oRXdAWmgsa+joTGydXd9c5C+tCRQdMr3pR8rjWaQ1GTmdHghnu0m6AaWLtgZAnlpLTVl
         SixA==
X-Forwarded-Encrypted: i=1; AJvYcCXxuzXxyUrp74XSn8bvH9dYmJwznVnLaPHDoHCogbnrG6e3xa++kDba3cIKKqiapArEFwHqKausV5Nj6Oq2x0uNOeAmz/Xb3NCvuryauw==
X-Gm-Message-State: AOJu0Yw9yH1ejxtPPre3f3gneQ3SITmBbP3znkCHm07BAEBQuGbpKqAs
	tdka836zq7noGwO8Z6cHI5xP4VATnEUhs3BSV/EApqPTAya2gmQuh+KnUOfKgQ==
X-Google-Smtp-Source: AGHT+IGUuK2UPKdJxtdpUL/3YL7x4TdstpPSjGT5aU1aDddxROeYmfS2zo6ROceQtZz5OxfKCLYnNQ==
X-Received: by 2002:a17:902:db03:b0:1fa:abda:cf7b with SMTP id d9443c01a7336-1fbb6cdac2cmr14557545ad.9.1720501928752;
        Mon, 08 Jul 2024 22:12:08 -0700 (PDT)
Received: from thinkpad ([117.193.209.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a2bedbsm7161425ad.101.2024.07.08.22.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 22:12:08 -0700 (PDT)
Date: Tue, 9 Jul 2024 10:41:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] PCI: qcom: Fix missing error code in
 qcom_pcie_probe()
Message-ID: <20240709051155.GG3820@thinkpad>
References: <20240708180539.1447307-1-dan.carpenter@linaro.org>
 <20240708180539.1447307-2-dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708180539.1447307-2-dan.carpenter@linaro.org>

On Mon, Jul 08, 2024 at 01:05:36PM -0500, Dan Carpenter wrote:
> Return a negative error code if dev_pm_opp_find_freq_floor() fails.
> Don't return success.
> 
> Fixes: 78b5f6f8855e ("PCI: qcom: Add OPP support to scale performance")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 26405fcfa499..1d36311f9adb 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1574,7 +1574,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>  	if (!ret) {
>  		opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
>  		if (IS_ERR(opp)) {
> -			dev_err_probe(pci->dev, PTR_ERR(opp),
> +			ret = PTR_ERR(opp);
> +			dev_err_probe(pci->dev, ret,
>  				      "Unable to find max freq OPP\n");
>  			goto err_pm_runtime_put;
>  		} else {
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

