Return-Path: <linux-arm-msm+bounces-70156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DA0B2F79F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E0D8417B8BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C5D2D3A9F;
	Thu, 21 Aug 2025 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lECsItpN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D216320D50B;
	Thu, 21 Aug 2025 12:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755778467; cv=none; b=sXoWA/C7uy1pGni/mKVeXcY7smU9sedt1dBk7y2ZRtiQ9FSu0ueyG9LKCA1TDRAeGvnZGV4tqhvcy7tr538i4do6yeQpZwuov5ZXz+LXvIayJG14H4fJzjLorqD0lhjVMnQlb5umpsU0aIBhZmvtCSCG3oSLmGLDDJoqeH3tcCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755778467; c=relaxed/simple;
	bh=IFJIoMFgHxgsWilRNXj86zoqCIBuD9qw2TZKXTuIQbc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nMNiTjBaP5iKPRtdGWw0wAQhlqoG0Z+QOqwBvrZpAUBlUrg4A6kGeAJU/q4llFB3rZeI9Z5Nlx0eYL7pP5hOVwlujxqunxEOp7tZ9MN+5+4UUQWSmC2IwAe9LVMivQT3QHswePgef2o3F6kPPF9m4PPs4x4Hn3z0Uub5VHph364=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lECsItpN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bCJt015666;
	Thu, 21 Aug 2025 12:14:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b+DredqzXE8Qi7ael+HlSgP82VJt5Hx6HZteKFnIotc=; b=lECsItpNIIfMqHi6
	z04DcCSmhUxPpHwCUnO2Dxg3UygObTo1QYFec9m0tdmMKvKKvtKwj/RzFN/qmm3R
	krXDe96BfLmrF5Dggj+Vpcf1BZW5jDJznUTxAqfkEmcxw81KFVEofUV+f7vjNeme
	qd0gIYwZda/B+prGFs7uMj+wMTlnDnE2mbQtsBHCNIEj4zA9F0a0/GekRifWX1hD
	FKPEQ53uXTHoWvz5dwf+ULpOfreXALoJyNd1pM2IBpUmAz7ex/ot/VG+Sb3Z6BDx
	GVr0fEJL5COrtHcgz/YoqjaB9KXQWk5wQ0Dps/+TPkgVwQMvYQGrFmBCLc6Lew8s
	a9YiEg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52959j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:14:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57LCENfu022880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 12:14:23 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 21 Aug
 2025 05:14:22 -0700
Message-ID: <3a81ec81-a03a-4006-8c5e-20110fd28aa9@quicinc.com>
Date: Thu, 21 Aug 2025 20:14:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] Bluetooth: Fix SSR (SubSystem Restart) fail when BT_EN
 is pulled up by hw
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bt@quicinc.com>
References: <20250821115001.2690706-1-quic_shuaz@quicinc.com>
 <5upyhx73s4cru2kw6k6yvhrmwkmmh5jf4y2ymbf3famabzxxlt@26sep775vbpu>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <5upyhx73s4cru2kw6k6yvhrmwkmmh5jf4y2ymbf3famabzxxlt@26sep775vbpu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a70da0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=El_LN6rTkaQ4Hq6paT0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8yQMh5Cn20enQ6cdDcXaU1IV1tj0u9zO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX0JLuj4GjkjWg
 rIcEXpuGtbAbznXf80OOrOXH/hadAxtVXKm93qJvUjzA03vKVgV7U9V7zzPwD0wbjPojwepO+EA
 UYnm2Oz4SY5KweUPFYXE0pcRrZGMgpXA6sjqVz3XK5RJ9zK4QrM+HmJC/smSCAgNwfhTgA3nAgI
 y1wptVLOJndDNsEBpf5mL33g/fOhUx/c2GQj4v54BwOxcf0MSDdhxCYtBWEhr/1+mD7R3ZPlhw9
 TjPsIckIk3njApZ3XtmfvJAMpxG2NXKgXOfzOw24bnHVCO7mykLSXjOcP0Bh3KhSewRVTFA/DXS
 4YLmMhMeKe3o7WeioUh24ntSQSjcJbq8PjSuMV3Gym2Eb929QstvXesUnnOaaMteeP6lnd3Ma/P
 fMIWjZqg0p7ggmrH7sf7arGI44rpjg==
X-Proofpoint-GUID: 8yQMh5Cn20enQ6cdDcXaU1IV1tj0u9zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013

Hi Dmitry

On 8/21/2025 8:07 PM, Dmitry Baryshkov wrote:
> On Thu, Aug 21, 2025 at 07:50:01PM +0800, Shuai Zhang wrote:
>> When the host actively triggers SSR and collects coredump data,
>> the Bluetooth stack sends a reset command to the controller. However, due
>> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
>> the reset command times out.
>>
>> To address this, this patch clears the QCA_SSR_TRIGGERED and
>> QCA_IBS_DISABLED flags and adds a 50ms delay after SSR, but only when
>> HCI_QUIRK_NON_PERSISTENT_SETUP is not set. This ensures the controller
>> completes the SSR process when BT_EN is always high due to hardware.
>>
>> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
>> the comment in `include/net/bluetooth/hci.h`.
>>
>> The HCI_QUIRK_NON_PERSISTENT_SETUP quirk is associated with BT_EN,
>> and its presence can be used to determine whether BT_EN is defined in DTS.
>>
>> After SSR, host will not download the firmware, causing
>> controller to remain in the IBS_WAKE state. Host needs
>> to synchronize with the controller to maintain proper operation.
>>
>> Multiple triggers of SSR only first generate coredump file,
>> due to memcoredump_flag no clear.
>>
>> add clear coredump flag when ssr completed.
>>
>> When the SSR duration exceeds 2 seconds, it triggers
>> host tx_idle_timeout, which sets host TX state to sleep. due to the
>> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
>> As a result, the controller does not enter sleep mode. Consequently,
>> when the host sends a command afterward, it sends 0xFD to the controller,
>> but the controller does not respond, leading to a command timeout.
>>
>> So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sleep mode.
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 33 +++++++++++++++++++++++++++++++++
>>  1 file changed, 33 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 4e56782b0..9dc59b002 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1653,6 +1653,39 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  		skb_queue_purge(&qca->rx_memdump_q);
>>  	}
>>  
>> +	/*
>> +	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
>> +	 * hardware and always stays high, driver cannot control the bt_en pin.
>> +	 * As a result, during SSR (SubSystem Restart), QCA_SSR_TRIGGERED and
>> +	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
>> +	 * command timeout.
>> +	 * Add an msleep delay to ensure controller completes the SSR process.
>> +	 *
>> +	 * Host will not download the firmware after SSR, controller to remain
>> +	 * in the IBS_WAKE state, and the host needs to synchronize with it
>> +	 *
>> +	 * Since the bluetooth chip has been reset, clear the memdump state.
>> +	 */
>> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
> 
> Why are you posting patches that don't even build? Which kernel version
> was used for developing this patch?

Sorry, due to my oversight, I used a newly created branch. 
I will cherry-pick the patch to the linux-next master branch.

> 
>> +		/*
>> +		 * When the SSR (SubSystem Restart) duration exceeds 2 seconds,
>> +		 * it triggers host tx_idle_delay, which sets host TX state
>> +		 * to sleep. Reset tx_idle_timer after SSR to prevent
>> +		 * host enter TX IBS_Sleep mode.
>> +		 */
>> +		mod_timer(&qca->tx_idle_timer, jiffies +
>> +				  msecs_to_jiffies(qca->tx_idle_delay));
>> +
>> +		/* Controller reset completion time is 50ms */
>> +		msleep(50);
>> +
>> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +
>> +		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>> +		qca->memdump_state = QCA_MEMDUMP_IDLE;
>> +	}
>> +
>>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>  }
>>  
>> -- 
>> 2.34.1
>>
> 
BR,
Shuai


