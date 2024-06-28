Return-Path: <linux-arm-msm+bounces-24645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10691C138
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 16:39:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D85B287BF1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 14:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC7B11C0071;
	Fri, 28 Jun 2024 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iJ6VPt1t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806471E53A;
	Fri, 28 Jun 2024 14:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719585554; cv=none; b=u4YlkDS++upZP+CLlUrGLS8rrieRFt8vZngZOzdHsPl+k7tlR0UIRfkfVo51zCup8bp7mdmgKquiNXCAdHkUE1UOyBL8BAujH50bwzB76oeJGJg66o/noncGi+4tcm4/VKmD+Ls3j3FmrMuavkI8O+SSFhCBDY4Et26PSnUAhVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719585554; c=relaxed/simple;
	bh=fbKwqXlvo36CXSMeJryZJPdETSPPD5sl/c0WBnH8V4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BdYPu1yGHwHcDFWdfXoUgS6RefbocjsmeP4mgjhc8dhqM0JIpUzStIRy2IArRgfvmEK6CL9zCY7uwKKY1FDCLAKNUw61pIWcXlh/o1mawSk4d2XBpZ0fIDuD2e8YdVs6NeNZ1XzOSKbVqC3Kd+1v3/2xEtMyV4XqT2gKk5C8upk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iJ6VPt1t; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S8d61C012603;
	Fri, 28 Jun 2024 14:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vmsoo87nXpQIGp4+dpf035YqcbLL73mjN+51Tgx2Oh0=; b=iJ6VPt1toWRAphns
	KeLg7V6++K2120XDsnNO3gzxAy2lpfHZOOmTLf0jGdA8aHEgx179wDkIo38uRD6w
	Ol0Fx/eYsZTNPuWv0T4t1X9BTA5Sdhhelb94INMU2hn31qDiwYVUqml25fPJwneg
	XpbgDtCfXBCs3v9Ic4jTEGeMZQqkt3PKi4OZbPnnwx7kkkapswtSzUmSm0Xo1vHl
	UXfW30IO/4sDeQp1lO9/Q9ItwEFtacNykPWFDI59Nc8a2OOJ3pQckfsaqMdZeCtp
	2/fOcrmT5DYfTbQpEwXOyCHRSO0BORydFz4HeejmgA7d6VT99SSUeBE/gpP5RU/u
	UbQKMQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 401njr9tke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 14:38:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45SEcwfI027146
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 14:38:58 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 28 Jun
 2024 07:38:58 -0700
Message-ID: <cde35f69-4d6e-d46d-88ca-9c5d6d5e757f@quicinc.com>
Date: Fri, 28 Jun 2024 08:38:57 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v3 2/3] bus: mhi: host: Add name for mhi_controller
Content-Language: en-US
To: Slark Xiao <slark_xiao@163.com>, <manivannan.sadhasivam@linaro.org>,
        <loic.poulain@linaro.org>, <ryazanov.s.a@gmail.com>,
        <johannes@sipsolutions.net>
CC: <netdev@vger.kernel.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240628073626.1447288-1-slark_xiao@163.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <20240628073626.1447288-1-slark_xiao@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jEkA4FUUieoR8WaoPVsF-2cM8dNthUvb
X-Proofpoint-ORIG-GUID: jEkA4FUUieoR8WaoPVsF-2cM8dNthUvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_10,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 clxscore=1011 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406280109

On 6/28/2024 1:36 AM, Slark Xiao wrote:
>   For SDX72 MBIM mode, it starts data mux id from 112 instead of 0.
>   This would lead to device can't ping outside successfully.
>   Also MBIM side would report "bad packet session (112)".

Weird indentation

>   In oder to fix this issue, we decide to use the modem name

"order"

> to do a match in client driver side. Then client driver could
> set a corresponding mux_id value for this modem product.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>
> ---
>   drivers/bus/mhi/host/pci_generic.c | 1 +
>   include/linux/mhi.h                | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 1fb1c2f2fe12..14a11880bcea 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1086,6 +1086,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
>   	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
>   	mhi_cntrl->mru = info->mru_default;
> +	mhi_cntrl->name = info->name;
>   
>   	if (info->edl_trigger)
>   		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index b573f15762f8..86aa4f52842c 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -361,6 +361,7 @@ struct mhi_controller_config {
>    * @wake_set: Device wakeup set flag
>    * @irq_flags: irq flags passed to request_irq (optional)
>    * @mru: the default MRU for the MHI device
> + * @name: name of the modem

Why restrict this to modems?  There are plenty of other MHI devices

>    *
>    * Fields marked as (required) need to be populated by the controller driver
>    * before calling mhi_register_controller(). For the fields marked as (optional)
> @@ -445,6 +446,7 @@ struct mhi_controller {
>   	bool wake_set;
>   	unsigned long irq_flags;
>   	u32 mru;
> +	const char *name;

Please run pahole

>   };
>   
>   /**


