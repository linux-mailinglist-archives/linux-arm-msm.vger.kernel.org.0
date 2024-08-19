Return-Path: <linux-arm-msm+bounces-29000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB3E95725B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 19:48:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7121C230C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 17:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6F118785E;
	Mon, 19 Aug 2024 17:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E3YHG1wQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3C4D531;
	Mon, 19 Aug 2024 17:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724089731; cv=none; b=apHsil36Vog4lZZV2iHtTAU4bfUZh93Vv9XmAwFWH4c/K9o9GmC1EY1zyVQRg2MQ0Y/egrCtdgcTwNqAZieI1VS0KaVL2gdkbD7FBIbtm6ZM3RriE5Q8GKMjqYeLtUTg4SStDWwN/Fzph5vAcuwwdK+uryGUifsXqHvIAI53r5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724089731; c=relaxed/simple;
	bh=ni4JnbQqKyxLORQSUYNl7oTbtxwxJwY0o1MFtkynE3Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZKgmGFNtWReYIvlLZRqmP0OQN5GtH4c0pzLoed4mLS9MZgbefJEosYsW0/Nnx6S8c/tWfahu78VvhCGKv9FU1ZSsxrgMAAeKKKOzcZsRWoTLdFWUn/H30ByrmqaG5h0rje8uqNJB1cSjCDo2swC56yWBegpgVPvLe9a8KxC5q+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E3YHG1wQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JCLLYQ000780;
	Mon, 19 Aug 2024 17:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xb2HwpmO4diMmk7P1CzPpwyPXC67SiGk+A0s9ybBsAI=; b=E3YHG1wQSq9Z7Thc
	HYCE9PMPpWOmZwFN9Lsh2hDQ2PpbsGxve1HKH+gycooteh9GglDQ3Ogzjoh/aMUm
	s+uoDgZGDxLz6uy5qiSW47aqG6eer/a/IBzbIRlaXDv/FquWg+UdGVMEDTrF6Fum
	0CHM7/JuYUn8HGh98umkKcLRM3fafqNUOa+xKnhCk3WDhxUdZtZ8ylfmCn2nVqz4
	gutuHLip0ldTUgCHKlTPH7g4XAbs0tAczKS6Gvntgbm5b7rzk1OXl9bdWyCMzBTN
	wl3V5D7wLTLQomuPS5qFc+ZwSBWNmxReX3pfcOwSgvz5xPw2Fj3r+Uz5AjAuNwy5
	nRClrA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4145yw8w0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 17:48:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47JHmSI7024113
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 17:48:28 GMT
Received: from [10.216.31.248] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 19 Aug
 2024 10:48:22 -0700
Message-ID: <eb0d4f62-5dde-4a63-8515-23081ec9962c@quicinc.com>
Date: Mon, 19 Aug 2024 23:18:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] usb: dwc3: core: Expose core driver as library
To: Bjorn Andersson <andersson@kernel.org>,
        Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, Wesley Cheng
	<quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Saravana Kannan
	<saravanak@google.com>,
        Felipe Balbi <balbi@kernel.org>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
 <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-4-91f370d61ad2@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Hb7xCsL2sC1qB3aglQtyQeMS9rTytYnX
X-Proofpoint-GUID: Hb7xCsL2sC1qB3aglQtyQeMS9rTytYnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408190120



On 8/12/2024 8:42 AM, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The DWC3 IP block is handled by three distinct device drivers: XHCI,
> DWC3 core and a platform specific (optional) DWC3 glue driver.
> 
> This has resulted in, at least in the case of the Qualcomm glue, the
> presence of a number of layering violations, where the glue code either
> can't handle, or has to work around, the fact that core might not probe
> deterministically.
> 
> An example of this is that the suspend path should operate slightly
> different depending on the device operating in host or peripheral mode,
> and the only way to determine the operating state is to peek into the
> core's drvdata.
> 
> The Qualcomm glue driver is expected to make updates in the qscratch
> register region (the "glue" region) during role switch events, but with
> the glue and core split using the driver model, there is no reasonable
> way to introduce listeners for mode changes.
> 
> Split the dwc3 core platform_driver callbacks and their implementation
> and export the implementation, to make it possible to deterministically
> instantiate the dwc3 core as part of the dwc3 glue drivers and to
> allow flattening of the DeviceTree representation.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

...

> -static int dwc3_probe(struct platform_device *pdev)
> +struct dwc3 *dwc3_probe(struct platform_device *pdev, struct resource *res,
> +			bool ignore_clocks_and_resets, void *glue)
>   {
>   	struct device		*dev = &pdev->dev;
> -	struct resource		*res, dwc_res;
> +	struct resource		dwc_res;
>   	unsigned int		hw_mode;
>   	void __iomem		*regs;
>   	struct dwc3		*dwc;
> @@ -2087,15 +2089,10 @@ static int dwc3_probe(struct platform_device *pdev)
>   
>   	dwc = devm_kzalloc(dev, sizeof(*dwc), GFP_KERNEL);
>   	if (!dwc)
> -		return -ENOMEM;
> +		return ERR_PTR(-ENOMEM);
>   
>   	dwc->dev = dev;
> -
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		dev_err(dev, "missing memory resource\n");
> -		return -ENODEV;
> -	}

...

> +static int dwc3_plat_probe(struct platform_device *pdev)
>   {
> -	struct dwc3	*dwc = platform_get_drvdata(pdev);
> +	struct resource *res;
> +	struct dwc3 *dwc;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "missing memory resource\n");
> +		return -ENODEV;
> +	}
>   
> -	pm_runtime_get_sync(&pdev->dev);
> +	dwc = dwc3_probe(pdev, res, false, NULL);
> +	if (IS_ERR(dwc))
> +		return PTR_ERR(dwc);
> +
> +	platform_set_drvdata(pdev, dwc);

This setting of platform drvdata is redundant I believe. We already do 
it in dwc3_probe.

> +
> +	return 0;
> +}
> +

