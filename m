Return-Path: <linux-arm-msm+bounces-37990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE70B9CDC80
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 11:23:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A7A61F22880
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 10:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5E018F2DB;
	Fri, 15 Nov 2024 10:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pnN03tsB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD7013D52B;
	Fri, 15 Nov 2024 10:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731666220; cv=none; b=U6K1bNhX49S6/6ehv+foeixG33m7GupPALlTXc/HJQVI8rJcDmv6U2DEmgQMqZH2xVxcVtgCfqArcj3fF9a708FQgdXGDNzTCoU+jLwey3XYXH3rPX27F4VHWlUYHEdy2HDEivO6nyZk0PVGCpFduh6IBlpAXEUfXJvQeftP3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731666220; c=relaxed/simple;
	bh=Kn+dgYRSEhesLvnMLfFPReCn1g2YzacRgHl7Qvoitxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=MPrEfQ8wUYnSNcEed0sr7lo6mwTLQRKO19H2l0UR9JBlv1CyA/eEb9WBvfEEj6XihjEJhCWlXpQsPyc+hQJK+9UipUy2c39Xq7fJYDSm2ah9OMSo87j5n4LB2F0hKsaBz9tmF/Pg53nS0rI/pYa7AZfk2WDD3edmvGgmAsedgSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pnN03tsB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AF8b7SI021969;
	Fri, 15 Nov 2024 10:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d7391IPJwynSSH46H3KmmIrWzxKXLTxZvxCA67ilJsE=; b=pnN03tsBviajtGRk
	KQcn+KlUlFvBdQ72I9jqtT0RX2XaNPJzRu29VOwsZOvd07gJfFtwBKOzbIpPqh6R
	3avzEdAt3BJpFvCZWV5fc7f/QEOeaOIASanC+uXP6Pwq3H2UyQMhX5h+uoNGBBqp
	staoomIPz4AJHurzERYC83v+smWq7wg+ROKs+bAUieqaeIOAf3iDRVnsG3RIpfxu
	COnqHOtu5xpHwyT4CMzUCiRDWFR35EeaiFEh/4GIojVdxMuRYstI6ujte3OHb5Dq
	RerTp7bSjNaBzM9P6Jmxl+rHcdHlBqCIzxZHrZYm02L/WI6cpcXPqSUdEK9wT6Sg
	nVfBuw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsg586vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 10:23:35 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AFANZVB001366
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Nov 2024 10:23:35 GMT
Received: from [10.217.218.234] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 15 Nov
 2024 02:23:27 -0800
Message-ID: <10c90fee-ce7f-4034-9028-4252f19cb67f@quicinc.com>
Date: Fri, 15 Nov 2024 15:52:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1] mmc: sdhci-msm: Enable MMC_CAP_AGGRESSIVE_PM for
 qualcomm controllers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_pragalla@quicinc.com>,
        <quic_sayalil@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_sachgupt@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_narepall@quicinc.com>, <kernel@quicinc.com>
References: <20241104060722.10642-1-quic_sartgarg@quicinc.com>
 <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
Content-Language: en-US
From: Sarthak Garg <quic_sartgarg@quicinc.com>
In-Reply-To: <konkbi4hvd7qc4rhokwrymzqntroy7gijk3ndwv5rluswdrykp@xsafrtrjzmuq>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lBMIFjkGh2ZUriwFchqGuJ309Nr8Pl3U
X-Proofpoint-ORIG-GUID: lBMIFjkGh2ZUriwFchqGuJ309Nr8Pl3U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411150088



On 11/4/2024 4:19 PM, Dmitry Baryshkov wrote:
> On Mon, Nov 04, 2024 at 11:37:22AM +0530, Sarthak Garg wrote:
>> Enable MMC_CAP_AGGRESSIVE_PM for qualcomm controllers.
>> This enables runtime PM for eMMC/SD card.
> 
> Could you please mention, which platforms were tested with this patch?
> Note, upstream kernel supports a lot of platforms, including MSM8974, I
> think the oldest one, which uses SDHCI.
>

This was tested with qdu1000 platform.

>>
>> Signed-off-by: Sarthak Garg <quic_sartgarg@quicinc.com>
>> ---
>>   drivers/mmc/host/sdhci-msm.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
>> index e00208535bd1..6657f7db1b8e 100644
>> --- a/drivers/mmc/host/sdhci-msm.c
>> +++ b/drivers/mmc/host/sdhci-msm.c
>> @@ -2626,6 +2626,7 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>>   		goto clk_disable;
>>   	}
>>   
>> +	msm_host->mmc->caps |= MMC_CAP_AGGRESSIVE_PM;
>>   	msm_host->mmc->caps |= MMC_CAP_WAIT_WHILE_BUSY | MMC_CAP_NEED_RSP_BUSY;
>>   
>>   	/* Set the timeout value to max possible */
>> -- 
>> 2.17.1
>>
> 

