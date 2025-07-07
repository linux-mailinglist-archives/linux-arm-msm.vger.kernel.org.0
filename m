Return-Path: <linux-arm-msm+bounces-63892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384C7AFACFD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 09:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7EBE4179271
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 07:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FD227F006;
	Mon,  7 Jul 2025 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XS8CmHWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B1BDDA9;
	Mon,  7 Jul 2025 07:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751873012; cv=none; b=MFpvT+KMdudg7e6Bz86dw3fqMc3G2GngPdtjM32qmzNxmIskOY2jpgtJwj9LSHCXw/LCaRCKKO+/5pxOGEu1OW4mBCTuwqVwJ4Wb4Vih7oYH6leFNJd24JPD569EjagciAv5UA8r7NBobVDeNT7nfQYNrClYxpCOggmBdiVY9PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751873012; c=relaxed/simple;
	bh=HUd9AZpWY2Jj6Z4Jd0aPQ1dGx6feBUnZazqP6mKMXkQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=mwGW88umHV67shJZr6jnt6YeOqbmmiz8pjkUGnWpgD59JcyAE/2gTKOKvzFcObUcGUf8t/TfiXveGndyBdIB2VPh4U6XBpv9XBij6YhxXBrqNzhq+3kDRPy8QdFZWpPiveu0wPuAVCtvx82Jjev7p1RdOeUePaTyQFAfVxsCaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XS8CmHWf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566N0OmC007093;
	Mon, 7 Jul 2025 07:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wYoALE7Vpe4PiccMRf8rXtkjZRheXJho34K7gukBSxo=; b=XS8CmHWfGcfZqY23
	x4cKIoLyWe0GCsofrpSQr4EMGVtqqD72D9sum4McSGiXImuLBixNAJs3pBiIxOK7
	jA/3F/AY5EDOSk0Y9NbmbY4Nh2wrEq+Mh2B8x77ExzFaoFqKz7B2F7ISqlDqSUSO
	lyrmkchaXufrrrD6QX1WZ1jFjXsOEvUF+0vBi/fYYGc8aRMyLH4iGSpkbtt36pNp
	/qhOJN3hx3+yHCGs8etiR7L0pC3jMQnAFaJZqJZ6ZyRY/PJyB9SQqDx/H69pWw+2
	BKa4GvLF9LHrhD29TLe/BqEO1STKKbfT8zjvlFWLkO5pn/+nDi1ZmlsWVJIvWCv6
	K1aIuw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psrkau19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 07:23:30 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5677NTQ7015887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Jul 2025 07:23:29 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 7 Jul
 2025 00:23:28 -0700
Message-ID: <1d912f5c-6712-4d32-b299-a53759269104@quicinc.com>
Date: Mon, 7 Jul 2025 15:23:25 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] driver: bluetooth: hci_qca: fix ssr fail when BT_EN is
 pulled up by hw
From: Shuai Zhang <quic_shuaz@quicinc.com>
To: <linux-bluetooth@vger.kernel.org>
CC: <quic_bt@quicinc.com>, <linux-arm-msm@vger.kernel.org>
References: <20250627061707.3631422-1-quic_shuaz@quicinc.com>
 <71aa21d7-795d-4709-899f-4b1feec810b3@quicinc.com>
Content-Language: en-US
In-Reply-To: <71aa21d7-795d-4709-899f-4b1feec810b3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qLgG192GZcFi4o0ioo2ZvD5YqYZ1ZsbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDA0MSBTYWx0ZWRfX355ArjPn9NXM
 S8GsBvzNnvyyF0HS2Kbg+3//TmKQ+hmhcUopRkWgrJL53r7KvaKkP8WQGHxfM23g/xneaKBE5B4
 z6qMlW6vBYyyU3VLiFaS4cSwYVaybK4rueWN5fygMUcDuXbcEx1xsrbbgZrw5uf9KkCDFl8koP7
 UlKNkqBr5WiWapyd/Xl2CqYhxydIvPhs8eY+7wpNm0Fq9G7dgthEwCL5bLVqsm/Gxt3q1PgsXo0
 9hDyBIFrslwR1roA/MKzfCiRbcgcUxhkGeGJutREt4emA86I/CmTRfqdEA02l9ykXd6mp8klygd
 lVDTwsRMzuOCa5FiwdwMRyOeNSAr4eePSzDKXDEVFKlaeSOYsWyuv2gONeg5sGnTvocXfV1xU6g
 8cUoj0Z3P96uimmmX2+rJ3W51fDs6f+M8MHoPtuhccVhR9pKNzrP36hVB6KWXwiBE0Jg6peh
X-Proofpoint-GUID: qLgG192GZcFi4o0ioo2ZvD5YqYZ1ZsbK
X-Authority-Analysis: v=2.4 cv=GtBC+l1C c=1 sm=1 tr=0 ts=686b75f2 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=zbsBYyxTTkarEyjW37MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507070041

+++

On 2025/7/7 15:22, Shuai Zhang wrote:
> Dear all
> 
> On 2025/6/27 14:17, Shuai Zhang wrote:
>> Q1：
>> If the SoC always enables the bt_en pin via hardware and the driver
>> cannot control the bt_en pin of the SoC chip, then during SSR,
>> the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>> This leads to a reset command timeout failure.
>>
>> Fix1：
>> To address this, clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits
>> after the coredump collection is complete.
>> Also, add msleep delay to wait for controller to complete SSR.
>>
>> Q2:
>> When the SSR (Sub-System Restart) duration exceeds 2 seconds, it triggers
>> host tx_idle_timeout, which sets host TX state to sleep. due to the
>> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
>> As a result, the controller does not enter sleep mode. Consequently,
>> when the host sends a command afterward, it sends 0xFD to the controller,
>> but the controller does not respond, leading to a command timeout.
>>
>> Fix2:
>> Reset the tx_idle_timer after SSR (Sub-System Restart).
>>
>> Changes in v2:
>> - Modified the format.
>> - Add changes to fix tx_idle_timeout
>> - Link to v1: https://lore.kernel.org/all/20250609105553.3756688-1-quic_shuaz@quicinc.com/
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 20 +++++++++++++++++++-
>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 4e56782b0..d415a3f31 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1653,6 +1653,24 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  		skb_queue_purge(&qca->rx_memdump_q);
>>  	}
>>  
>> +	/* If the SoC always enables the bt_en pin via hardware and the driver
>> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,
>> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>> +	 * This leads to a reset command timeout failure.
>> +	 *
>> +	 * To address this, clear QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits
>> +	 * after the coredump collection is complete.
>> +	 * Also, add msleep delay to wait for controller to complete SSR.
>> +	 */
>> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +		mod_timer(&qca->tx_idle_timer, jiffies +
>> +			  msecs_to_jiffies(qca->tx_idle_delay));
>> +		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>> +		msleep(50);
>> +	}
>> +
>>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>  }
>>  
>> @@ -2478,7 +2496,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
>>  			return PTR_ERR(qcadev->susclk);
>>  		}
>>  	}
>> -	
>> +
>>  	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
>>  	if (err) {
>>  		BT_ERR("serdev registration failed");
> 
> Is there any update?
> 
> thanks,
> Shuai


