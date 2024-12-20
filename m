Return-Path: <linux-arm-msm+bounces-43005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 327EB9F98EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 19:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC1F189C8A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CFD22ACCA;
	Fri, 20 Dec 2024 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GEyww+8k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046DF22A81D;
	Fri, 20 Dec 2024 17:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715624; cv=none; b=hkGJqIpoPOc6HG3tPTkwofo59xxectrrk8U1mDjeJZa9mM2BYunWnk7Go2AtkcZjgbpufI8hK6zds6UcVZj0LjAqcxP8Mk91D1XurXhfSRTXGj/qLtq3NkcnBKK8ova61nQkGDRUOIERVoy6WgzpAsEc/ChtCBd57Y1EEATh+9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715624; c=relaxed/simple;
	bh=2MkXNeOHGySiI9Pay079HPQ0CkNDo3VbFwyaDLOgp2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WIcwXllzEtas0RXgJsrhWn9GEod3IZvDhYn+osVZM/4cTEffAqlxiIh4IDKAmxZ6PmDuJCBTp1of6IfE8Y5izISIrG9KVjdk3EKsLvuNobPnwnq8Pl9wezHAORvIODlTNOpbxoKAKTKf5iU8pq06xfUR98H+/Rqt483nmEBaa4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GEyww+8k; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBbmnm023350;
	Fri, 20 Dec 2024 17:26:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gr0b7oiHsjcKnwP5N2Hukrof0DmeQ92jyn071HIstGo=; b=GEyww+8kGM/PV/Cy
	chVpqClSQYaZJ6by8JkWeUYFWxBwpi5Tk92Tgv7M1CCdLJVa8j/YB8I3/QWFg7yB
	rkd06N6brsiZGf4/sFUZ4M1YoQJEYxd162Ov9gFqqBIUscyu8i4rilHJEE5GBLgm
	iGsc2iNLZ5UFzUnUxU5bDYP+5BXFpZ4fgyDJtDuXLuMkiJvN0UK3mNkD06kwwsN4
	xzkcBP7iw6cN4pMxiL3oX6JLXbZxJdChAHLOh3ohXH/V+dweY7stkiHJQq1iARAq
	fYSDX+2Akz7diZJ1Y7yO2IkFrdcCTPuSkIpbkjRKtsxlfiVKLCeKdlrctZc30293
	k5qQgA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n7vg0x5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 17:26:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKHQrt8001010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 17:26:54 GMT
Received: from [10.226.59.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 20 Dec
 2024 09:26:52 -0800
Message-ID: <dd83ba8c-0b37-7d1e-39a7-4b25ef7e5faf@quicinc.com>
Date: Fri, 20 Dec 2024 10:26:52 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 7/7] accel/qaic: Add AIC200 support
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, <quic_carlv@quicinc.com>,
        <manivannan.sadhasivam@linaro.org>, <quic_yabdulra@quicinc.com>,
        <quic_mattleun@quicinc.com>, <quic_thanson@quicinc.com>
CC: <ogabbay@kernel.org>, <jacek.lawrynowicz@linux.intel.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <mhi@lists.linux.dev>
References: <20241213213340.2551697-1-quic_jhugo@quicinc.com>
 <20241213213340.2551697-8-quic_jhugo@quicinc.com>
 <65a59247-f028-28f9-1a65-5e4dd62dadec@amd.com>
From: Jeffrey Hugo <quic_jhugo@quicinc.com>
In-Reply-To: <65a59247-f028-28f9-1a65-5e4dd62dadec@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fLMODdBmjhlL49QSP6eb-JqRz3YBV7ye
X-Proofpoint-ORIG-GUID: fLMODdBmjhlL49QSP6eb-JqRz3YBV7ye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200140

On 12/13/2024 5:49 PM, Lizhi Hou wrote:
> 
> On 12/13/24 13:33, Jeffrey Hugo wrote:
>> @@ -573,6 +898,13 @@ struct mhi_controller 
>> *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>>       mhi_cntrl->nr_irqs = 1;
>>       mhi_cntrl->irq = devm_kmalloc(&pci_dev->dev, 
>> sizeof(*mhi_cntrl->irq), GFP_KERNEL);
>> +    if (family == FAMILY_AIC200) {
>> +        mhi_cntrl->name = "AIC200";
>> +        mhi_cntrl->seg_len = SZ_512K;
>> +    } else {
>> +        mhi_cntrl->name = "AIC100";
>> +    }
>> +
> 
> Only AIC200 needs to set 'seg_len'? Maybe these hard coded settings can 
> also be in qaic_device_config?

Yes, seg_len is related to the BHIe loading, which is new from AIC100 to 
AIC200.

For the moment, I think I'd like to keep the MHI details "encapsulated" 
within this portion of the driver.  With the continuing development of 
AIC200, I'm expecting a bit of volitility here which I hope doesn't leak 
into the rest of the driver.

> It might be better to move after the following check at least.

I agree.

> 
>>       if (!mhi_cntrl->irq)
>>           return ERR_PTR(-ENOMEM);
>> @@ -581,11 +913,11 @@ struct mhi_controller 
>> *qaic_mhi_register_controller(struct pci_dev *pci_dev, voi
>>       if (shared_msi) /* MSI shared with data path, no IRQF_NO_SUSPEND */
>>           mhi_cntrl->irq_flags = IRQF_SHARED;
>> -    mhi_cntrl->fw_image = "qcom/aic100/sbl.bin";
>> +    mhi_cntrl->fw_image = fw_image_paths[family];
> Maybe fw_image path in qaic_device_config?
>>       /* use latest configured timeout */
>> -    aic100_config.timeout_ms = mhi_timeout_ms;
>> -    ret = mhi_register_controller(mhi_cntrl, &aic100_config);
>> +    mhi_config.timeout_ms = mhi_timeout_ms;
>> +    ret = mhi_register_controller(mhi_cntrl, &mhi_config);
>>       if (ret) {
>>           pci_err(pci_dev, "mhi_register_controller failed %d\n", ret);
>>           return ERR_PTR(ret);
>> diff --git a/drivers/accel/qaic/mhi_controller.h 
>> b/drivers/accel/qaic/mhi_controller.h
>> index 500e7f4af2af..8939f6ae185e 100644
>> --- a/drivers/accel/qaic/mhi_controller.h
>> +++ b/drivers/accel/qaic/mhi_controller.h
>> @@ -8,7 +8,7 @@
>>   #define MHICONTROLLERQAIC_H_
>>   struct mhi_controller *qaic_mhi_register_controller(struct pci_dev 
>> *pci_dev, void __iomem *mhi_bar,
>> -                            int mhi_irq, bool shared_msi);
>> +                            int mhi_irq, bool shared_msi, int family);
>>   void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool 
>> link_up);
>>   void qaic_mhi_start_reset(struct mhi_controller *mhi_cntrl);
>>   void qaic_mhi_reset_done(struct mhi_controller *mhi_cntrl);
>> diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
>> index cf97fd9a7e70..0dbb8e32e4b9 100644
>> --- a/drivers/accel/qaic/qaic.h
>> +++ b/drivers/accel/qaic/qaic.h
>> @@ -34,6 +34,7 @@
>>   enum aic_families {
>>       FAMILY_AIC100,
>> +    FAMILY_AIC200,
>>       FAMILY_MAX,
>>   };
>> diff --git a/drivers/accel/qaic/qaic_drv.c 
>> b/drivers/accel/qaic/qaic_drv.c
>> index 4e63e475b389..3b415e2c9431 100644
>> --- a/drivers/accel/qaic/qaic_drv.c
>> +++ b/drivers/accel/qaic/qaic_drv.c
>> @@ -36,6 +36,7 @@ MODULE_IMPORT_NS("DMA_BUF");
>>   #define PCI_DEVICE_ID_QCOM_AIC080    0xa080
>>   #define PCI_DEVICE_ID_QCOM_AIC100    0xa100
>> +#define PCI_DEVICE_ID_QCOM_AIC200    0xa110
>>   #define QAIC_NAME            "qaic"
>>   #define QAIC_DESC            "Qualcomm Cloud AI Accelerators"
>>   #define CNTL_MAJOR            5
>> @@ -66,6 +67,13 @@ static const struct qaic_device_config 
>> aic100_config = {
>>       .dbc_bar_idx = 2,
>>   };
>> +static const struct qaic_device_config aic200_config = {
>> +    .family = FAMILY_AIC200,
>> +    .bar_mask = BIT(0) | BIT(1) | BIT(2) | BIT(4),
> 
> Will this pass the BAR mask check in init_pci()?

Yes, BITs 0, 1, 2, 4 would be 0x17 and that value is & with 0x3f 
(masking off upper bits).  The result would be 0x17.

> 
> Thanks,
> 
> Lizhi
> 

