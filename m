Return-Path: <linux-arm-msm+bounces-68970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C15B24873
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 742765811CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B772BDC27;
	Wed, 13 Aug 2025 11:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pZX4sVCn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C14212547;
	Wed, 13 Aug 2025 11:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084522; cv=none; b=LuAf6iP2vQAJaZsy0IKEYsG5/nKc/39XNw75uKQ2fcsuNIVRG82wZdWu8iAk93npl2p9uYDi2EUeNYvSGWWMkmK5cT7vKvNmMFC1o5T/19hPfnqiJOKWhiIMorje/gtMogvWumVtZY4/LFhQ0Al+uXPYfpnsOUMQ6TrWYIsDfmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084522; c=relaxed/simple;
	bh=m432i5kkWc/hrDPv4X1H703TeNeoZM7JNjJHexMi9Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CljljKWipKthcJBEoertSuZKez6mu5rP3HbZxR4EaICLBUV2/V2Sv/uJyzS52viCRFlWtECEB+QcH7a9LGyfUSsaUnVewyyl9GKu9ZBNkiLfNgZWDcMx3JgrR0IQZRzlkNDW9t6PVBioEAXmFWw0XRyDkqw6RI38FABPFmpYH1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pZX4sVCn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBM2ej024302;
	Wed, 13 Aug 2025 11:28:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T6cPkUhPWf1uPf2W4V3gWd8aOvYdsQS8+f8Eg7/hB1g=; b=pZX4sVCnmGNhulWB
	Jj1M8TCc90RsreLvzBnmII6O7Fb+6jYDQW4pfg+KOtUasbL9hsrld7EqmNvxAKIY
	dFX/rgTWByvaKXx11mAKTjSqZ5JmoSkuCGTXr9LUNysGebxw4d4xRwZwGo68gCec
	F4/8mQHfDLKziG47hrgajZQ+J3/bG9p+aq/wDRp2y03dXufFVbQBYBktEwxVdr2X
	gbRtB9qU29Z4lDFQcuOfNnxJd9i2SrWa7FbajyBTWbSayUgyFy77hmRwjP97VGlQ
	I25UuRo3qgRlOvaMSC3qGAtirE5+N7lsK1YROrn6mGm9EAXq+F3X/TgbnYFLfdEY
	ZgPzwg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rr98e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:28:40 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DBSdub016913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:28:39 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 04:28:38 -0700
Message-ID: <532d8aa9-34be-486b-b477-dd72389d8703@quicinc.com>
Date: Wed, 13 Aug 2025 19:28:36 +0800
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
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <77881d50-c044-4aae-bd0a-5265e0db51cc@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX7oHLBfWjd2LW
 TYQXCSyDD5hoMvOgnsYDdautShYVr/fV4mLAzW9AYga51ZoYBGMH1uFoG5mPkvqTy3oFZx0mFK7
 rOp1dh4Bq8DH4Yi3QRicmU/FnwVJCZvAs+Wd7k0EnUG0s931Eas/KbZydH5UaNcyyDnRCu8keWW
 MJ6KQGi7YsXfk6SMqpcyFwx419UpB4J/9pzIaa/qTLLvN/uiYINDRBErZzyEJ2iFW9fdtFlZf38
 96h5M1Szvuv8ghWCDyI7fSB7hJxG+pjgBgnLJbFTjs+VBrhzp/7u/tdVIenldaAxI06P4+4uZp1
 6gamMH58zgSQErvYqdHT5ZvOqenCs8PaCI5k3dD0dAlPMSu4nPP6+0jGqYrq+8h+vcLo1441JrQ
 qc4flzB6
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689c76e8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=Q5fcaU1O6b02Iij5NjgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: tDfDIIr2C-L_NXQG8l_JJvqKlBEAlK-V
X-Proofpoint-GUID: tDfDIIr2C-L_NXQG8l_JJvqKlBEAlK-V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

Hi, Konrad

On 8/13/2025 7:05 PM, Konrad Dybcio wrote:
> On 8/13/25 5:35 AM, Shuai Zhang wrote:
>> When the host actively triggers SSR and collects coredump data,
>> the Bluetooth stack sends a reset command to the controller. However,due
>> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
>> the reset command times out.
>>
>> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
>> commit: 740011cfe94859df8d05f5400d589a8693b095e7.
>>
>> The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
>> because this quirk is associated with BT_EN, and can be used to
>> determine whether BT_EN is present in the device tree (DTS).
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 4e56782b0..14b2d1bee 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1653,6 +1653,19 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  		skb_queue_purge(&qca->rx_memdump_q);
>>  	}
>>  
>> +	/* If the BT chip's bt_en pin is always pulled high by a dedicated 3.3V
>> +	 * power supply via hardware the driver
> 
> weird line break
> 
>> +	 * cannot control the bt_en pin of the SoC chip, then during SSR,
> 
> "System on a Chip chip"

I will modify.

> 
>> +	 * the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits cannot be cleared.
>> +	 * This leads to a reset command timeout failure.
>> +	 * Also, add msleep delay to wait for controller to complete SSR.
> 
> 50 is a random value, I also see 300, 100 across the driver.. where does it
> come from?
> 
The controller requires 50ms to stabilize after power-on,
so we wait 50ms after the coredump completes

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

BR,
Shuai

