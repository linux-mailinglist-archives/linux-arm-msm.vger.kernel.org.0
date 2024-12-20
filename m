Return-Path: <linux-arm-msm+bounces-43003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC4C9F985B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 18:42:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C213A7A12C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205482210C9;
	Fri, 20 Dec 2024 17:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TPJ66f/L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506452210F7;
	Fri, 20 Dec 2024 17:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714924; cv=none; b=JQFm6S3/PTTgD0FRpxBTYsFC+4CwuQt64fO22R61B6tmqjpeNetLM4V4sdkkW9MTYdgUvwZri6ygIte3HAhBm723l/CnVE/0rcj2rw2eQH+Zw5PZ6Prds+rut7a43GIXhFzx0mKuFM1WI9eRMZX095MkSSHg0EwCNFRmkAYeZug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714924; c=relaxed/simple;
	bh=7fJGIFD1GsTor71LYoIibpGcMiIRkHR0ji1VT0Xfzs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=pFzEo9EVO+y4Pcb2wp2R31Y62ac+g1fsBIH60ychgyZNPjB0oYj0Vg6zG/NeQ/3tB6E4TYe9FZMkxxoPuGf9KxCs7J/F9VjiMHLFYfsHm154t9r+T4dV9f6ddyfDnnLp6zTJj2Zw3s/8fSldRniXNa66Qa1yvELTtaTJYckx+bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TPJ66f/L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBufEt021470;
	Fri, 20 Dec 2024 17:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jL8wzg1WIwIc06XhdSbJ86n/ra6NV5dfqg+1tzKaYwc=; b=TPJ66f/LcFTXQO0L
	be9kt+j80PjKg0LauW+1TIBHn+Y+YUqiGlKyLg/n9y5k0X2gGk8oqlsMV6Ud+5a8
	WAieeWPq/CldfmP5H49xiU6M+hxY2ACdV/XIGPnj7qIz5XcByziELAHehDhKT6UA
	8ms/iiD9sgeqQ5ABuRJfrJzkoNAtZxqyZvfOGJs8ihA8yrcnCYeYw2q90uC8Ee01
	cgvpXNw3CmbQ8gmvfMID6NBN1F8e2B6e2O9yO8d+YEZm9JHoTG4F5YSZy3ID0aBe
	GIrRbchKX0lmFZfqRXUMggQH01TcYnRV/F2FmzH9f+ZePuRXRbj6FsicA9GAhpam
	AhufiQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n85d8uex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 17:15:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKHFD7r002329
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 17:15:13 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 09:15:12 -0800
Message-ID: <c24e081b-7e2a-4bb0-9445-458e21e964f3@quicinc.com>
Date: Fri, 20 Dec 2024 10:15:11 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 6/7] accel/qaic: Add config structs for supported cards
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <quic_carlv@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
        <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-7-quic_jhugo@quicinc.com>
 <cd442cee-a37d-7d3b-8acf-59a3b5138bf4@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <cd442cee-a37d-7d3b-8acf-59a3b5138bf4@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -44IGdAB1AHWsexn3k_gSIkcTuSGcU6m
X-Proofpoint-GUID: -44IGdAB1AHWsexn3k_gSIkcTuSGcU6m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=892 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412200138

On 12/13/2024 5:35 PM, Lizhi Hou wrote:
> 
> On 12/13/24 13:33, Jeffrey Hugo wrote:
>> -static struct qaic_device *create_qdev(struct pci_dev *pdev, const 
>> struct pci_device_id *id)
>> +static struct qaic_device *create_qdev(struct pci_dev *pdev,
>> +                       const struct qaic_device_config *config)
>>   {
>>       struct device *dev = &pdev->dev;
>>       struct qaic_drm_device *qddev;
>> @@ -365,12 +391,10 @@ static struct qaic_device *create_qdev(struct 
>> pci_dev *pdev, const struct pci_de
>>           return NULL;
>>       qdev->dev_state = QAIC_OFFLINE;
>> -    if (id->device == PCI_DEV_AIC080 || id->device == PCI_DEV_AIC100) {
>> -        qdev->num_dbc = 16;
>> -        qdev->dbc = devm_kcalloc(dev, qdev->num_dbc, 
>> sizeof(*qdev->dbc), GFP_KERNEL);
>> -        if (!qdev->dbc)
>> -            return NULL;
>> -    }
>> +    qdev->num_dbc = 16;
> 
> Is it better to put num_dbc in qaic_device_config?

I think there is no clear "right answer".  All known devices use 16. 
There may be a future device which has a different value, at which point 
I think this needs to be in qaic_device_config.  For this patch, I was 
conservative and only included items in qaic_device_config which do vary 
between the known devices.

I'll think in this a bit more.

> 
> Thanks,
> 
> Lizhi
> 

