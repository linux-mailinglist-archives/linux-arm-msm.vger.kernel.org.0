Return-Path: <linux-arm-msm+bounces-65720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0588B0AC93
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 01:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 825AB3BCBF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 23:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04B291ACEDD;
	Fri, 18 Jul 2025 23:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J6ep6SsB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280EF17578;
	Fri, 18 Jul 2025 23:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752881528; cv=none; b=KNeJlqmQfsnOCeQV9viaKsVECTxPt/ZjHW5gox/sb/MUlNEkm0vJRXBn9JBkNVcFmSaW1xq9lDQVZgiZTt22yLAdq3ru++/7JL+K+eOuL+to+pPdVyla4VVgdN30nr20aJ2+wryB9HbwWx/8iIDgzH4lBq6ZvWQXI6CD7aPGf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752881528; c=relaxed/simple;
	bh=9limy8ekR9R4k0Sxx+1VcEVXAQFGzvQbpdW1BNVRO6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qBzgX8xnilNxqElm4w8cQNHGGuu6TTkhYmM4iykYnyFc622IqM/hzhCVjEVgNvk7BoRj274yk4fsQmOQuanyz8Vz3kBcLM3N8oN/ATVCxXGI43pfbguUB6fCh5k7c0iyfSoCA9KFlR0ZAanZMEUqCIt9jQZYWnAoPjKGrffCjAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J6ep6SsB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56IGjkDu007207;
	Fri, 18 Jul 2025 23:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ww8fpLfyWcnsamcVTtSdxyPq6Z8+91Wd32Vlsm8k570=; b=J6ep6SsBspe1beRe
	VtrQKxEI//juyVR92MwggdiLxc/GNiGWA97Tm1Z5XS5ycF04r+Klu15KpvjSer54
	CTdjlQoU7zUwMOGHlYSDr1XcaRNpODsCNnVNSeXnIQt1Dwob/hXjU+0oXBsXKleC
	y3ckKFdLoHHaqH55TjMVWq3xsrkm31/1ZCF6r6eKD4q9vU/njcmi6TadI7gOs9EO
	Ym858OR7DgyJBNr1QSUwlPnL9fj8HhSvYardEQdvJW6SZoK3hAl2DWLC/LznYOcc
	C7ixO49KEqSkwBtT2Q2ISETXKzqT3F+cZszhHzOiYaMVFcy6r7zHJyZY1o/kPHsm
	HKqf2A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcaebxc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 23:32:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56INW4S6008832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Jul 2025 23:32:04 GMT
Received: from [10.253.13.179] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 18 Jul
 2025 16:32:03 -0700
Message-ID: <e7e700e4-e87c-4e2c-8df1-634870ba91b2@quicinc.com>
Date: Sat, 19 Jul 2025 07:32:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] driver: bluetooth: hci_qca: fix ssr fail when BT_EN
 is pulled up by hw
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <quic_bt@quicinc.com>
References: <20250715051618.724475-1-quic_shuaz@quicinc.com>
 <20250715051618.724475-2-quic_shuaz@quicinc.com>
 <ee84aeb0-728a-4642-9686-3abb9588bb24@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <ee84aeb0-728a-4642-9686-3abb9588bb24@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDE5NSBTYWx0ZWRfX3FV8jQQOISI4
 4sQ8pxcDcMheS4hstuZxrj6MoHAxtbGohx0Nzwuxc5lPlkriBcvvr8dVoZC7tvlcH01TfIRJ+jW
 h3FPIZCnO6J//cZ/T73WTyMTcX6fXZ6tukk6cdLgNDknfHpVMX74jBhGgVUv+i3ExAdbgG2IMlT
 XvqHuFrgpwYvsfRW9Qhwzv98rAPCmg1uqoUUigg85B2UyjGcy7QeNqu+g6d/don1peDmJ+41JPT
 SQLZQH/siQa633rAXD5xL/SLF9/UXUrn3LvL7pDKxZW7m3S3qVlp2wRJAwN8gYbsqFx8P2pQFE+
 YJtmeGIT+Th2PCM7Ej4GWCAmPceubC7gnFOCt7Fo++lyppQxqvufrarhUePdPLNG+HZjfccC5a8
 uNQmMBd4kABX2XEx0UYDofuRdrcJpJM1eQNB/Y1M09kwu9ADNwW9IIshofXmbL+B2KcvOD2L
X-Proofpoint-GUID: NT2f4TXPJVMHFLCk8hgiPDLD-ooXttFS
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687ad975 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=Oj2nRzj9iAJ_O5cg774A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NT2f4TXPJVMHFLCk8hgiPDLD-ooXttFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_05,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180195

Hi Konrad 

On 7/15/2025 5:11 PM, Konrad Dybcio wrote:
> On 7/15/25 7:16 AM, Shuai Zhang wrote:
>> the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>> This leads to reset command timeout.
> 
> This is a description of what goes wrong in terms of the code of
> this driver, and it doesn't explain why you gate the code addition
> with HCI_QUIRK_NON_PERSISTENT_SETUP, please share more details about
> what you're doing, and more importantly, why.
> 

The problem encountered is that when the host actively triggers ssr 
and collects the coredump data, the bt will send a reset command to 
the controller. However, due to the aforementioned flag not being set, 
the reset command times out.

I'm not clear whether you want to ask about the function of 
HCI_QUIRK_NON_PERSISTENT_SETUP or why the changes are placed 
under if(!HCI_QUIRK_NON_PERSISTENT_SETUP).

Regarding the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, 
you can refer to this commit. 740011cfe94859df8d05f5400d589a8693b095e7

As for why it's placed in if(!HCI_QUIRK_NON_PERSISTENT_SETUP), 
since HCI_QUIRK_NON_PERSISTENT_SETUP is related to BT_EN, it can be 
used to determine if BT_EN exists in the DTS.

>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 4e56782b0..791f8d472 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1653,6 +1653,18 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  		skb_queue_purge(&qca->rx_memdump_q);
>>  	}
>>  
>> +	/* If the SoC always enables the bt_en pin via hardware and the driver
>> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,
> 
> What is the "SoC" here? Bluetooth chip? MSM?

yes, Bluetooth chip on qcs9075-evk platform

> 
> What does "enabling the pin via hardware" refer to? Do we ever expect
> that a proper platform description skips the bt_en pin?
> 
> Also:
> 
> /*
>  * If the..
> 

Sorry, I’m not quite sure I follow—could you clarify what you meant?
Here is my understanding.

Enabling pins through hardware refers to "the pin is  pulled up by hardware".
qcs9075-evk platform use the m.2 connective card, the bt_en always pull up.


>> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>> +	 * This leads to a reset command timeout failure.
>> +	 * Also, add msleep delay to wait for controller to complete SSR.
> 
> Googling "bluetooth SSR" yields nothing, so it's fair for me to ask
> you to explain that acronym.. it's used a number of times across the
> driver, so perhaps a comment somewhere at the top in a separate commit
> would be good as well. I'm guessing "subsystem reset"?

Just to clarify, SSR is short for Subsystem Restart

> 
> Konrad
> 
>> +	 */
>> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +		msleep(50);
>> +	}
>> +
>>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>  }
>>  

Shuai


