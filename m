Return-Path: <linux-arm-msm+bounces-69646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9040B2B7AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 05:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A80FF7B67AA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F292F2905;
	Tue, 19 Aug 2025 03:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EHF+WEpn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA8D2E5D2A;
	Tue, 19 Aug 2025 03:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755574470; cv=none; b=DHVmB1foW4ctZR4hM6hiDgOjiyX+ZqSOLLWw0T6Sc0v2diLz47L99AeBvU88vcgGpr4eLD0a9uDVr9c72798BlYQ8cXC45lX6eA/qqbyPSyhE31nd1pnv6KxGF4NMfCgrnLbAnGl6rL1ncJ/Vw5vd7oRpnKj3RreuDBNl2j0wwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755574470; c=relaxed/simple;
	bh=c5QSO5WO64UIA0IxZVUYciOHLofYuP3Wts27m9qBa9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=TKSL/RPFgNUH8bpjn5Lxc5gCMeFFnOjiHcIP1x4XZNeQ9FafqT5DDncfKDG5je9vl/GNWBg/eG6EQU55O0Ps5nW2JWIUX2qGD1NGpncYl3NmxfRjhOj6G8BVI7tPJ2jH45RjGRPxZrEo4j/qfvW2Ff+et3VObbjBEIEF3yMpBmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EHF+WEpn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J0aFIt021032;
	Tue, 19 Aug 2025 03:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eBvtwnXagpGQILFN62syl6yl+1S901eIfbnxvXtvh50=; b=EHF+WEpnwil1aZAs
	OiWlqxJB25nXq+9qSdZjZWwRtbpYt/1zfug7MnD+z/Bzufce9Y15jdedDmEoC9QE
	YV2Y8WuV/k5KHYeycGZR4wUJ/hTC1m8t24yWmQAtvRd8zF8oxyHsqVjoUaXiSNH+
	4eDm6UHIv6GeqBFehOWMMR1Y3IdlH9uUqKwkO3u4pceRjdKjcVEmPTZSYswgMn6u
	yKl54oAp7PpYtlc2j/4Ln2/CqRtYxVjvLyAoOWSD+RIKitV52wxQ0JDYQ2T3ycmH
	FU76DVFqQEkrCBth7SsnPDV/9bSbRG155voQc1JfZ2icR/exlGYQKiTkjz8DCCIc
	C3enUQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99pygk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 03:34:27 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57J3YQn1010292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 03:34:27 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 Aug
 2025 20:34:25 -0700
Message-ID: <578387be-f86b-4e41-abaf-3ebf729b2ec9@quicinc.com>
Date: Tue, 19 Aug 2025 11:34:23 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] driver: bluetooth: hci_qca: fix ssr fail when
 BT_EN is pulled up by hw
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_bt@quicinc.com>
References: <20250814124704.2531811-1-quic_shuaz@quicinc.com>
 <20250814124704.2531811-2-quic_shuaz@quicinc.com>
 <lfo2phtbykl5dqiuiunxlzz3fybyqt7tcotihzhr27ivm7dk2l@l5q6ilkm5xrg>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <lfo2phtbykl5dqiuiunxlzz3fybyqt7tcotihzhr27ivm7dk2l@l5q6ilkm5xrg>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IrEERShrGxQ5yojdDCBOkasaUowylwpo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX80ciXw+dyOLw
 PbqgD79yUDXaOX8PQr4j6PFzzs8ngCErA1xPdovkzRvWe8DD6ODUytvZ+FNi0rDxSUVGUSiN1HP
 uVtUIYkXMLtPoAI0BFn/Fkl3ZRHLr9L/ijAltPl+mzZG0PyFUNyqlGVqPCcgfF4Oj0uUSBTRGLY
 H/hQYkWKs02nXB0X64N/pbeYS8EAiQ0ViuQBHwrnRweux6R69X2l4I6AOXdoHbxlQqm9yz3uGdj
 ZRYzdfK07+h9D2anF78HCxsLkcr7mQe8rh9rtHTbkJ5kJmsvOk69KfUjRgdQGOcqVWfhL18ADoC
 8l7ghE5EYWNvKIaTx3YFu8JPJ0gHg1+VQfTQI9fjKQysNVtOtEo/Pgqff9a3po6cgjwWQwd+ebU
 V3EDQE5M
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a3f0c3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=dh6ju27HM2cxErMqZ7cA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IrEERShrGxQ5yojdDCBOkasaUowylwpo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

Hi Dmitry 

On 8/16/2025 5:48 AM, Dmitry Baryshkov wrote:
> On Thu, Aug 14, 2025 at 08:47:01PM +0800, Shuai Zhang wrote:
> 
> I wonder what does it make to notice the part of the BT test report:
> 
> SubjectPrefix                 FAIL      0.66 seconds
> 
> and update log messages according to the custom of the BT subsystem?
> 
> Please use 'git log drivers/bluetooth/hci_qca.c' if you are unsure.
> 
>> When the host actively triggers SSR and collects coredump data,
>> the Bluetooth stack sends a reset command to the controller. However,due
>> to the inability to clear the QCA_SSR_TRIGGERED and QCA_IBS_DISABLED bits,
>> the reset command times out.
>>
>> For the purpose of HCI_QUIRK_NON_PERSISTENT_SETUP, please refer to
>> commit: 740011cfe94859df8d05f5400d589a8693b095e7.
> 
> commit 740011cfe948 ("Bluetooth: Add new quirk for non-persistent setup
> settings")
> 
>>
>> The change is placed under if (!HCI_QUIRK_NON_PERSISTENT_SETUP)
> 
> Which change? You've described the issue, but you didn't describe what
> is to be done.
> 
>> because this quirk is associated with BT_EN, and can be used to
>> determine whether BT_EN is present in the device tree (DTS).
> 
> What can be 'used to determine....' ?
> 
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 4e56782b0..91009c6a7 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1653,6 +1653,20 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  		skb_queue_purge(&qca->rx_memdump_q);
>>  	}
>>  
>> +	/*
>> +	 * If the BT chip's bt_en pin is connected to a 3.3V power supply via
>> +	 * hardware and always stays high, driver cannot control the bt_en pin.
>> +	 * As a result, during SSR(SubSystem Restart), QCA_SSR_TRIGGERED and
>> +	 * QCA_IBS_DISABLED flags cannot be cleared, which leads to a reset
>> +	 * command timeout.
>> +	 * Add an msleep delay to ensure controller completes the SSR process.
>> +	 */
>> +	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>> +		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>> +		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +		msleep(50);
> 
> It should be done other way around: first sleep, then clear bits.
> Otherwise userspace might start sending SKBs while the BT is still
> recovering.
> 
>> +	}
>> +
>>  	clear_bit(QCA_HW_ERROR_EVENT, &qca->flags);
>>  }

Thank you for your suggestion. I will update accordingly.

BR,
Shuai

