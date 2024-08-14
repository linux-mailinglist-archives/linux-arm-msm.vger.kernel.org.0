Return-Path: <linux-arm-msm+bounces-28519-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1857951EEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:45:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E98A1F23B27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 251891B86CC;
	Wed, 14 Aug 2024 15:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KjfGOq4W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FE81B86C5;
	Wed, 14 Aug 2024 15:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650319; cv=none; b=JUI2DrEmxKKerxfHd0IACJ8cDoffuIsVY7SlGoi2kCvnVZ/cvK5euLOVxJR6bEgrJ4LoZH3AAV7v2E5wc4I3kakd7nag7b0mEHdtq4gKQPaS9lqMRx3eJvcOdUez5mEDGDgVDpqDU88Lb9qJrXhnuSc385uRIIcyF+RbCg2TeRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650319; c=relaxed/simple;
	bh=VOK51rQInaRB+8P56heJmMpjr/oOkpHVbtHNs07n7Vo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HKpxbEVjr/DHWQOEDlkOlgeEVOsqDRF7FERc4by2H1Jz1MzOs2jcBNNyDc8GVQAlNiOkpK1ULlwbFMkq9JeeIgoisC9753mfb7g3H605PDJlEHgZx7IkxhQZ/8qWbEFDVuWzqVeZkuJPwRerTEmMJ316m46ArwsvgQ5aLoW4fSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KjfGOq4W; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EDPrk8020431;
	Wed, 14 Aug 2024 17:44:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	qjfOVlwnl6c9puil2K/fu2bDwoc6uOtbnIO/ocPkwzo=; b=KjfGOq4WatLlU4BD
	H+YEdfM++/JpfcC3zpVH/esTjZ78ngfSRbdGRbFMCSIc9DAgv4F0T5hcJst5ctiA
	/j34KpULjvu9DnZ7VcjOkakNGvLAk0AHN+yQplXWW4Axe2HGSUoahj+JxJpAwess
	juCI4NYgGyABtXVE9zH4oXC1TsMIuPsgRHeyWr6SO9qdNqsYeJg2zjhhtk5sDLQJ
	PKTS4s4ZquGopr68j+urrc25DX79yC/tJAUZacNDOooDPVVPeuTMqAXgrq2jitNR
	HVIkZN3SyFPnIFXaFeNEzZbNcUByyvNHv2JC8fE/2cHQHBwSFF2OcEyPrM6MKVIj
	dimr7g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 40x18mqpxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 17:44:53 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E719340045;
	Wed, 14 Aug 2024 17:44:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5423627E282;
	Wed, 14 Aug 2024 17:43:55 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 14 Aug
 2024 17:43:54 +0200
Message-ID: <1ed80a6d-3453-43bc-a008-b4ad21d6d639@foss.st.com>
Date: Wed, 14 Aug 2024 17:43:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] usb: dwc3: st: use scoped device node handling to
 simplify error paths
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam
	<festevam@gmail.com>,
        Michal Simek <michal.simek@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
References: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
 <20240814-b4-cleanup-h-of-node-put-usb-v1-1-95481b9682bc@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-1-95481b9682bc@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_11,2024-08-13_02,2024-05-17_01



On 8/14/24 12:35, Krzysztof Kozlowski wrote:
> Obtain the device node reference with scoped/cleanup.h to reduce error
> handling and make the code a bit simpler.  Scoped/cleanup.h coding style
> expects variable declaration with initialization, so the
> of_get_compatible_child() call has to be moved earlier, before any goto
> jumps happen.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This depends on my earlier fix:
> https://lore.kernel.org/all/20240814093957.37940-2-krzysztof.kozlowski@linaro.org/
> ---
>  drivers/usb/dwc3/dwc3-st.c | 25 +++++++++++--------------
>  1 file changed, 11 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
> index c8c7cd0c1796..98f43d7082d7 100644
> --- a/drivers/usb/dwc3/dwc3-st.c
> +++ b/drivers/usb/dwc3/dwc3-st.c
> @@ -14,6 +14,7 @@
>   * Inspired by dwc3-omap.c and dwc3-exynos.c.
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -197,7 +198,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  	struct st_dwc3 *dwc3_data;
>  	struct resource *res;
>  	struct device *dev = &pdev->dev;
> -	struct device_node *node = dev->of_node, *child;
> +	struct device_node *node = dev->of_node;
>  	struct platform_device *child_pdev;
>  	struct regmap *regmap;
>  	int ret;
> @@ -227,6 +228,13 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  	dev_vdbg(&pdev->dev, "glue-logic addr 0x%pK, syscfg-reg offset 0x%x\n",
>  		 dwc3_data->glue_base, dwc3_data->syscfg_reg_off);
>  
> +	struct device_node *child __free(device_node) = of_get_compatible_child(node,
> +										"snps,dwc3");
> +	if (!child) {
> +		dev_err(&pdev->dev, "failed to find dwc3 core node\n");
> +		return -ENODEV;
> +	}
> +
>  	dwc3_data->rstc_pwrdn =
>  		devm_reset_control_get_exclusive(dev, "powerdown");
>  	if (IS_ERR(dwc3_data->rstc_pwrdn)) {
> @@ -248,18 +256,11 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  	/* Manage SoftReset */
>  	reset_control_deassert(dwc3_data->rstc_rst);
>  
> -	child = of_get_compatible_child(node, "snps,dwc3");
> -	if (!child) {
> -		dev_err(&pdev->dev, "failed to find dwc3 core node\n");
> -		ret = -ENODEV;
> -		goto err_node_put;
> -	}
> -
>  	/* Allocate and initialize the core */
>  	ret = of_platform_populate(node, NULL, NULL, dev);
>  	if (ret) {
>  		dev_err(dev, "failed to add dwc3 core\n");
> -		goto err_node_put;
> +		goto undo_softreset;
>  	}
>  
>  	child_pdev = of_find_device_by_node(child);
> @@ -270,7 +271,6 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  	}
>  
>  	dwc3_data->dr_mode = usb_get_dr_mode(&child_pdev->dev);
> -	of_node_put(child);
>  	platform_device_put(child_pdev);
>  
>  	/*
> @@ -282,8 +282,7 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  	ret = st_dwc3_drd_init(dwc3_data);
>  	if (ret) {
>  		dev_err(dev, "drd initialisation failed\n");
> -		of_platform_depopulate(dev);
> -		goto undo_softreset;
> +		goto depopulate;
>  	}
>  
>  	/* ST glue logic init */
> @@ -294,8 +293,6 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  
>  depopulate:
>  	of_platform_depopulate(dev);
> -err_node_put:
> -	of_node_put(child);
>  undo_softreset:
>  	reset_control_assert(dwc3_data->rstc_rst);
>  undo_powerdown:
> 


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

