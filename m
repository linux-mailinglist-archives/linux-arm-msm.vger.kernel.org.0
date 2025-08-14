Return-Path: <linux-arm-msm+bounces-69210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 084B9B26483
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 881EB5E0EDB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4AB2F5308;
	Thu, 14 Aug 2025 11:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jJzcYzbC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7012EA739;
	Thu, 14 Aug 2025 11:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755171671; cv=none; b=QIG4J1zTE2c3pu1Te3AbxbeM9NsaRT/kHDlRHizajsq5+fPKdCUM6cZxzGDgGLajnDv1XT3MiJUNNVepzlspyhmPRAzVEiUbloawjfcrlJIdBceYBpglCCANt0Hb/DjzlPmNa/kxv85ifp3CjTqmoV92wemrwp/a8wvns2QQcEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755171671; c=relaxed/simple;
	bh=Ufg1WKc+dmF9AdHhFS6D4H4z0vWQHVaNenERhmJ9xmc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BGGeXLvQ/40IMPlqr6n3mq9sb06UeZjir8sPIU/t8SryzQqAh1yGk8e6bal32Xq4Bqvwn+HpM5bGy0Pg/SovfrVvpReXGz1JBCpum6y0Y8VGNDsh38QniQ94QXjA92YvZ2RPrYnojb8WQd4bsBWhgRRY+ptsmCBOuedAoWkShl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jJzcYzbC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9l5t9029470;
	Thu, 14 Aug 2025 11:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsmCtfXdtX7e2NfyP8Fa+PFArPHl3+xW1GpK54QecKc=; b=jJzcYzbCUucLPDwd
	g1R7P0QTgQb0pb5INN1HgcxgH1AmjtIuhM4oJm8WRijv1SY3n7vUqfpt3ZFQ/HsF
	LfTe1Fy98O23EzDctXcv0PLf/qKnAyqwOq2MaSD6AuucBHaN1QDnBctSYQ6oVKLF
	ScovmZjl2q8DH+q8qx9yrcQ+Pb02pgh4SqjzoUukvFZ3z84oDa4FasLmCC5cM30c
	EdU5dW3GQPGVVsR1fukSyUGv/Jjrr/JDhjpGrxWscbwBdgp7phOpE8YwUStP6ze0
	LdZNKpsQEDc2sT3vUQAmtO9RKHM4G6nYemknyQjKx4+DdNZjDTti6/I9rssu5BY+
	wJxGtg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9xjr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 11:41:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EBf8x2003465
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 11:41:08 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 04:41:06 -0700
Message-ID: <4febb658-dc6b-49ee-ba73-f6a020aa6ed5@quicinc.com>
Date: Thu, 14 Aug 2025 19:41:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] driver: bluetooth: hci_qca: fix ssr fail when
 BT_EN is pulled up by hw
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <quic_bt@quicinc.com>
References: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
 <20250813033505.3868781-2-quic_shuaz@quicinc.com>
 <77881d50-c044-4aae-bd0a-5265e0db51cc@oss.qualcomm.com>
 <532d8aa9-34be-486b-b477-dd72389d8703@quicinc.com>
 <c2493fca-dd5f-4721-b2e6-17fdcd8ebe81@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <c2493fca-dd5f-4721-b2e6-17fdcd8ebe81@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689dcb54 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=mNendfHU3D0RdVuhPl8A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: -YF_7ON2YXb3eCErPC5Hr6zXDhGorqFb
X-Proofpoint-ORIG-GUID: -YF_7ON2YXb3eCErPC5Hr6zXDhGorqFb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfX2KBCekByVd5A
 pEWCtqHvk3RQbu/DUySYCucgMTFUgl4c7/banzzeF79nLqB1cx+gQIlUPGH+iviYipQ8tIe2cWo
 nvgnWuiuqMJS5HRKv8q8+BikZrqO6kb+h1HjaJcKaEFcQ9db1VKd95MToGP0FrLC56QAUu6guCK
 I2rFXGlXcoHLF57+XiziTccpMg/EfNGjUNclynYQ0wN5GSrSJcK3bOJgdGUuqSqTHi5LX9bbctV
 BYQEyWruZwWgctoVLi4+3k562vC7FoqqgSx+6sfRk/h5dXTZXdd0Nk0+9aDB0arE4I+UBO7sW+f
 ZvepJXD+yQVZq9CCqIjy2Zi8S4cuCYFrBMWrvKnO6V5yHHjvkaH19Laz/Jb6HmO8NS0QuDg26if
 t5z/zbSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164



On 8/13/2025 7:32 PM, Konrad Dybcio wrote:
> On 8/13/25 1:28 PM, Shuai Zhang wrote:
>> Hi, Konrad
>>
>> On 8/13/2025 7:05 PM, Konrad Dybcio wrote:
>>> On 8/13/25 5:35 AM, Shuai Zhang wrote:
>>>> When the host actively triggers SSR and collects coredump data,
>>>> the Bluetooth stack sends a reset command to the controller. However,due
>>>> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
>>>> the reset command times out.
>>>>
>>>> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
>>>> commit: 740011cfe94859df8d05f5400d589a8693b095e7.
>>>>
>>>> The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
>>>> because this quirk is associated with BT_EN, and can be used to
>>>> determine whether BT_EN is present in the device tree (DTS).
>>>>
>>>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>>>> ---
>>>>  drivers/bluetooth/hci_qca.c | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>>>> index 4e56782b0..14b2d1bee 100644
>>>> --- a/drivers/bluetooth/hci_qca.c
>>>> +++ b/drivers/bluetooth/hci_qca.c
>>>> @@ -1653,6 +1653,19 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>>>  		skb_queue_purge(&qca->rx_memdump_q);
>>>>  	}
>>>>  
>>>> +	/* If the BT chip's bt_en pin is always pulled high by a dedicated 3.3V
>>>> +	 * power supply via hardware the driver
>>>
>>> weird line break
>>>
>>>> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,
>>>
>>> "System on a Chip chip"
>>
>> I will modify.
>>
>>>
>>>> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>>>> +	 * This leads to a reset command timeout failure.
>>>> +	 * Also, add msleep delay to wait for controller to complete SSR.
>>>
>>> 50 is a random value, I also see 300, 100 across the driver.. where does it
>>> come from?
>>>
>> The controller requires 50ms to stabilize after power-on,
>> so we wait 50ms after the coredump completes
> 
> Is that common for all controllers supported by this driver?
> 
> Please #define this value somewhere

Not all controllers require a stabilization period after power-on.
However, if it is needed, 50ms is sufficient.

> 
> Konrad


