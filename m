Return-Path: <linux-arm-msm+bounces-28522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CF7951EF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:47:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 674E428854D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928A41B86DB;
	Wed, 14 Aug 2024 15:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="loR8/7kD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90491B86D0;
	Wed, 14 Aug 2024 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650403; cv=none; b=YQT4yNaqootKs/G3K1cWMaALh1sFRww4n1qhzTqsvSMDbaT0xhXBVmwedTbMaQ7tFrQYpCicj8OJTV2YjA+jUfQwGX6524d/73oy0DWB7moTT1UIl+SyI5guMCBAm/uJifJZcYeh9Z2piqq5syOKToNjyG2cEolgl8UtOoOb4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650403; c=relaxed/simple;
	bh=jqE31C3BeVdTHSpaYsa7qHbPgF2YNyfpscbLFOLk09w=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=plRTP11i+fNnuKdwczvttgRh/j7UAxLcG30omYLX45NFS8O//7JyLeaU2bYRElJ53dRsxNeN8wyGfKmcZ2b1ivU8q90JRq2XG69e5FdJAkbobcdeMfzTqMcq2G6tkvIERUr2TkGYg6E72aUTXoxKjTEtH7uoBoKGJHG9OD5apCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=loR8/7kD; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EDc2If014466;
	Wed, 14 Aug 2024 17:46:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	DzRjIDlEMZsP+OJQhkq4KHyY6VBON3S4lF5b9KgVwFE=; b=loR8/7kDJZtP9T3t
	ytz5hjySXzfhdOItskfiGnZmNSjYQe+b6zvzHLLNq0lIIs1NhbLRcjDGDu/EGzng
	zWR4ti6WfK6CpVToneRkbFXtwRampwpRh3Ij40O+BcGooONlMe1t/sTvoZmWWI4m
	B2s9gfKmWC54PgdXeF1sa7DuxvGbpUODJ25n2HZTUh2D3AsBZYgvcLEVEhLTI797
	sFezVC4mm2UISWh4GIKqGCjjAPuYIch7UBJ48BoCbeSQK/mnpeYmnYIzcqnR6q4K
	KE09hN3T5mi1RdfFsGgehCKsiJ6wifGi+sTUrS770tGKFegxuIH+4xnUg4ydf62/
	U6ud1w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4109w9vmvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 17:46:04 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 54FED4002D;
	Wed, 14 Aug 2024 17:46:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A208727E293;
	Wed, 14 Aug 2024 17:45:07 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 14 Aug
 2024 17:45:06 +0200
Message-ID: <bd6e6650-ed9b-409a-b851-721a7c40d3dc@foss.st.com>
Date: Wed, 14 Aug 2024 17:45:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] usb: dwc3: st: simplify pdev->dev usage
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
 <20240814-b4-cleanup-h-of-node-put-usb-v1-3-95481b9682bc@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-3-95481b9682bc@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_11,2024-08-13_02,2024-05-17_01



On 8/14/24 12:35, Krzysztof Kozlowski wrote:
> The probe() function already stores '&pdev->dev' in local 'dev'
> variable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-st.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
> index 7a0b1821768a..2841021f3557 100644
> --- a/drivers/usb/dwc3/dwc3-st.c
> +++ b/drivers/usb/dwc3/dwc3-st.c
> @@ -225,13 +225,13 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  
>  	dwc3_data->syscfg_reg_off = res->start;
>  
> -	dev_vdbg(&pdev->dev, "glue-logic addr 0x%pK, syscfg-reg offset 0x%x\n",
> +	dev_vdbg(dev, "glue-logic addr 0x%pK, syscfg-reg offset 0x%x\n",
>  		 dwc3_data->glue_base, dwc3_data->syscfg_reg_off);
>  
>  	struct device_node *child __free(device_node) = of_get_compatible_child(node,
>  										"snps,dwc3");
>  	if (!child) {
> -		dev_err(&pdev->dev, "failed to find dwc3 core node\n");
> +		dev_err(dev, "failed to find dwc3 core node\n");
>  		return -ENODEV;
>  	}
>  
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

