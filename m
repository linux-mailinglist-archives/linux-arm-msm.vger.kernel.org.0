Return-Path: <linux-arm-msm+bounces-33142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31280990A69
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 19:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 626261C21906
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 17:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E7C1DACBF;
	Fri,  4 Oct 2024 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hWeDJvA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4CB1DAC82;
	Fri,  4 Oct 2024 17:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728064260; cv=none; b=qGoGqhpuIZXYRlzP9J6JGZnCRhjLIQRNpErbqq991h2HvaNWQsRPtvlj88KXimCIadItkpCAUe3PKwQmdMj8M3CqIYbosB0oYCTD0hW0orBVGoKG95DnL0gk6wrnIyDUZ+Gtoi5pRPCck4hJV0RAuZ17EDOaCCe1KapDzUA0Jfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728064260; c=relaxed/simple;
	bh=J2pBFoWCNLu9OWwh6o18VBWp9Gc3BRt/DN6DOSxEcLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mSFBJNwQfTL/Nr5ADbCj3Rt6RDQBJVT5kntDQUUsuuTsF8Q7nyrSec2NtwWFKTUsbcDvHGF1FAak3VzR6p8B0A4IDYLqlf7mFzpOnqPyL+M5GfFyO8vrSDAd05N+yJyN4v3z8ma9lmddMpjuDNES6Dfbr1HEoIY4zsqGXWIq+z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hWeDJvA3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AjlSt011614;
	Fri, 4 Oct 2024 17:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Xjz4yd70wxUaQw4j4BLPipCerkHoWOnY6H3NukNKRrk=; b=hWeDJvA3WZyNRkul
	x1XQkL/iBfkhoKsISZqp47pCWYvopITU5Bn4X7HOYCLNcnqeoz88ZSkBC+iRAuBB
	h/c+42doePOXRk92mHOG4+8U+Nm4PpWuZxo6fvHE4RhtWTArden5fyxveHgSdWzE
	iwRNwQw+6s/N5NAIdk9EOp7nn8BL5zHzDvqRlCqlGqlYrrdSR80Kxcw8dRBe+HQ+
	PnZSq0rdjqiaS7tpmqh7PXcEPecL6taYaxRGm4iHvizGsMwAjHnVDVvk9Gr+Zwd9
	XXzCctp6VnSasywg4Qkk6l5O4Ceet/KZqsFsk3ooZbvzYaf/XO84/SfTX9vdjKOL
	6MWVHw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205kaugp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 17:50:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 494HovVk006293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 17:50:57 GMT
Received: from [10.110.70.43] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 10:50:56 -0700
Message-ID: <e30b4dc9-41bb-4f8b-992f-125001a60a54@quicinc.com>
Date: Fri, 4 Oct 2024 10:50:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Use pcim_iomap_region() to
 request and map MHI BAR
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Loic
 Poulain <loic.poulain@linaro.org>
References: <20241004023351.6946-1-manivannan.sadhasivam@linaro.org>
Content-Language: en-US
From: Mayank Rana <quic_mrana@quicinc.com>
In-Reply-To: <20241004023351.6946-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lj_3Y6bHMPu9nAoSC8QiW2qxgHXz80dT
X-Proofpoint-ORIG-GUID: lj_3Y6bHMPu9nAoSC8QiW2qxgHXz80dT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxlogscore=917 malwarescore=0 spamscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040123



On 10/3/2024 7:33 PM, Manivannan Sadhasivam wrote:
> Use of both pcim_iomap_regions() and pcim_iomap_table() APIs are
> deprecated. Hence, switch to pcim_iomap_region() API which handles both the
> request and map of the MHI BAR region.
> 
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> 
> Compile tested only.
> 
>   drivers/bus/mhi/host/pci_generic.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 9938bb034c1c..07645ce2119a 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -917,12 +917,12 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>   		return err;
>   	}
>   
> -	err = pcim_iomap_regions(pdev, 1 << bar_num, pci_name(pdev));
> -	if (err) {
> +	mhi_cntrl->regs = pcim_iomap_region(pdev, 1 << bar_num, pci_name(pdev));
> +	if (IS_ERR(mhi_cntrl->regs)) {
> +		err = PTR_ERR(mhi_cntrl->regs);
>   		dev_err(&pdev->dev, "failed to map pci region: %d\n", err);
>   		return err;
>   	}
> -	mhi_cntrl->regs = pcim_iomap_table(pdev)[bar_num];
>   	mhi_cntrl->reg_len = pci_resource_len(pdev, bar_num);
>   
>   	err = dma_set_mask_and_coherent(&pdev->dev, dma_mask);
Reviewed-by: Mayank Rana <quic_mrana@quicinc.com>

Regards,
Mayank

