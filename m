Return-Path: <linux-arm-msm+bounces-28521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 314C1951EF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 17:46:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6335F1C209C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 15:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBDD1B4C5E;
	Wed, 14 Aug 2024 15:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="E4qZd0i4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D01AE86B;
	Wed, 14 Aug 2024 15:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723650369; cv=none; b=HmhuHlZSZmy68waT/je33astMe2I3kAjXaGRVwire/m/ICDsM+PJT72f8rD92ivYTxsVRrisUAhSJm3wIFsvltWCvn07Au7k0FeUD4V3Zbz6kXedAxb/Fqd9blcDKuSFCRW7DUniMYttzj1dw18vTc1wEbyudihOeEOGe+lYN2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723650369; c=relaxed/simple;
	bh=a/P4EEbz2ehoguaI45KaTiIre9UBmIP+LFECXIhm+0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OcI/zulhs746Vo5vsnrLgIt0G2getFrAhInr/rYt/ypvI+lwv2Fylr4TSHP+tIvx/ty1YsYyA950H2pv2O3Hisod2S4XU8jBN0XZVO3tHyeRrXzlQZp66u2ZCFmNKgj9XQTf7zZoxv8jaOAJegHbrv1089mp5T5KmqH7gDRWTPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=E4qZd0i4; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EFESKh004021;
	Wed, 14 Aug 2024 17:45:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	c4nycFTtepKQ/5GU63XohyOZMjswcGmCuvNwmQDubaA=; b=E4qZd0i4Rcix6LZF
	V9CZaBHnLh2wdA/D24467jiK5KMz9nioFX70aOK/5h27peKocntOp5+fw7uOxl+p
	fA2N6eC9dnQK3G41cFfMUoARIfIOmjBJVAoFvC+rYIIwjIEy8/ZPdR/zT+ER4sy3
	7VAFbgLShAGq2ya0bb6jFLzTUeOVsySt1P9Y4L9KjcO98bMpyI3TAJVhmt7fEwDQ
	pEsuqCmL2Ih7cbyVdo0xhvfTlb1wan0hbJb/FeCte+hRzwLboGYiAxLWWfCrWzol
	Tm4yQbns9QHWD98Tjpkc5J+9ziYtzvoEXaKJGnIRRP3aBKKDL+2lTc+vNQ7oG1Zj
	lxgWAg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 410y2403cp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 17:45:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id EEC6540048;
	Wed, 14 Aug 2024 17:45:40 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9815427E296;
	Wed, 14 Aug 2024 17:44:49 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 14 Aug
 2024 17:44:48 +0200
Message-ID: <cd527a86-167c-495a-9bbd-0b37978bc842@foss.st.com>
Date: Wed, 14 Aug 2024 17:44:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] usb: dwc3: st: simplify with dev_err_probe
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
 <20240814-b4-cleanup-h-of-node-put-usb-v1-2-95481b9682bc@linaro.org>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240814-b4-cleanup-h-of-node-put-usb-v1-2-95481b9682bc@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_11,2024-08-13_02,2024-05-17_01



On 8/14/24 12:35, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to make the error paths a bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/usb/dwc3/dwc3-st.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-st.c b/drivers/usb/dwc3/dwc3-st.c
> index 98f43d7082d7..7a0b1821768a 100644
> --- a/drivers/usb/dwc3/dwc3-st.c
> +++ b/drivers/usb/dwc3/dwc3-st.c
> @@ -237,10 +237,9 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  
>  	dwc3_data->rstc_pwrdn =
>  		devm_reset_control_get_exclusive(dev, "powerdown");
> -	if (IS_ERR(dwc3_data->rstc_pwrdn)) {
> -		dev_err(&pdev->dev, "could not get power controller\n");
> -		return PTR_ERR(dwc3_data->rstc_pwrdn);
> -	}
> +	if (IS_ERR(dwc3_data->rstc_pwrdn))
> +		return dev_err_probe(dev, PTR_ERR(dwc3_data->rstc_pwrdn),
> +				     "could not get power controller\n");
>  
>  	/* Manage PowerDown */
>  	reset_control_deassert(dwc3_data->rstc_pwrdn);
> @@ -248,8 +247,8 @@ static int st_dwc3_probe(struct platform_device *pdev)
>  	dwc3_data->rstc_rst =
>  		devm_reset_control_get_shared(dev, "softreset");
>  	if (IS_ERR(dwc3_data->rstc_rst)) {
> -		dev_err(&pdev->dev, "could not get reset controller\n");
> -		ret = PTR_ERR(dwc3_data->rstc_rst);
> +		ret = dev_err_probe(dev, PTR_ERR(dwc3_data->rstc_rst),
> +				    "could not get reset controller\n");
>  		goto undo_powerdown;
>  	}
>  
> 


Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

