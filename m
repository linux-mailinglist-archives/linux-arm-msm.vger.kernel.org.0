Return-Path: <linux-arm-msm+bounces-68971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3887EB24879
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:31:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E46DC1BC2308
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 11:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A664E2F1FE2;
	Wed, 13 Aug 2025 11:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HFKNlp9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B501A9F8D;
	Wed, 13 Aug 2025 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755084669; cv=none; b=AH7wf/DSBfmOdfpts+qj8lJjtnYgRpMCRP2YOEQx3IFqiFSXo9RS7Ym1glzIsBgpeRvTuMLg5dDZgif3uE0laDVQQzTy1/Fl1mft9wjy7T7io7A/dVB6Eh7DVbbDRWvy4X5bLXezQhEJIimKNS2/U4szg2b6gL6ERmT6m+AZLQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755084669; c=relaxed/simple;
	bh=dAKwghu7mGN+hJTQqDyTaD7FKOBJXL7ox7lyxlXYFGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Ch8MkY2wo8+pT1fH6fIh1ta7Da8bIFrBUjbG38GdggzxWWyMZkfbgbd+z8urTC9QAeI7JxauywlljjS9h7V5rSRQSmqf6qxCrFd0iISdqqiSLw9HBxAhj1BGS/aGrV+d7o5/Uim5KotIzoHMac7BvMzlHQv8kFSDgQIZUb9JHFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HFKNlp9L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLfnZ012272;
	Wed, 13 Aug 2025 11:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YxyXXH1oXBMkCfWBUVFgEKRALIUWZ66YvU9Esjh6eRQ=; b=HFKNlp9LyOdRg6jO
	f9St6XJ9mir1uFu6GPKuwncZnfVT3luaa+XCsGRK4oKty9SyhglRI9KVisTkJXO1
	T82MnplAN84Z7FT9mDRF8lVO4cMPkcQoHzAb+EjFd1reEyKsVlwPqsxxKntqexUJ
	r0fiB9SSHs+53w2tJ63bzD1ImiprKwBih1T3JfUjf/EIqTw00VoR1XgSXlRUfb+K
	4+/D/4d0Jwcyo9oykqGoE0e6GDaaPL6mb+OEs7EPRZ923M+B/Vl8SHUDQq5G+NF/
	ORtPWnS+/RTX2UqTfm397QAYeJd8BF0WjJcsp2dc9Q1dlaBRRO9AeO4DIW9k7cHk
	kasHaA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx9qy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:31:05 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57DBV41I024924
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 11:31:04 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 13 Aug
 2025 04:30:03 -0700
Message-ID: <a82fff82-2466-4049-87d5-1a99dca6de42@quicinc.com>
Date: Wed, 13 Aug 2025 19:30:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] driver: bluetooth: hci_qca: Multiple triggers of
 SSR only generate one coredump file
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <quic_bt@quicinc.com>
References: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
 <20250813033505.3868781-4-quic_shuaz@quicinc.com>
 <5c94849c-88af-4094-8967-c3b04d33c27b@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <5c94849c-88af-4094-8967-c3b04d33c27b@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX7DhQs+hXEOMO
 6ScxQX3UnF9kwrPoMK3QWtHeL4JJ7J6YUINPWucL6RU5PFwzUWtEGfTaTOiyQTWF4+sEUfmb4HD
 Tahd2apzvvBjALoZXdaH4gbj535GINt/NS7IwdzVRvHnKQHcfCXDSFjSb8sYCojxh619PQ4wZYh
 ZR+RH+cfgYKjfSR8z8i/ejLeuqeQuHEkduVxndxYzGqlWSoDECxmjvRyHL+E4XAmhOMmIeDLFrG
 EyqaRlD1j3uZSvO0rK4Si1SlJm/g3DhzRS6+71OECQ/LTcAqjjc3up/79ipsnCxQQXALFFsIeyo
 LULGGEXeL1Bp6lVTzSnV0VMJpwmIrmHiRXF4euy3cQNDjktJ9jc9uKAzn8ViEAeCTFDjD/EQQmA
 OIxA9uz4
X-Proofpoint-GUID: wuM82KKi7xaeHoYjf9QCp1Wlel_5UoIJ
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c7779 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKLreaUZOlokcSt4K6oA:9 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10
 a=xa8LZTUigIcA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: wuM82KKi7xaeHoYjf9QCp1Wlel_5UoIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

Hi,Konrad

On 8/13/2025 7:11 PM, Konrad Dybcio wrote:
> On 8/13/25 5:35 AM, Shuai Zhang wrote:
>> Multiple triggers of SSR only first generate coredump file,
>> duo to memcoredump_flag no clear.
>>
>> add clear coredump flag when ssr completed.
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
> 
> Please read
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> 
> and adjust your commit message accordingly.
> 
>>  drivers/bluetooth/hci_qca.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 50ec9b155..33c2dd7b8 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1662,11 +1662,14 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  	 *
>>  	 * Host will not download the firmware after SSR, controller to remain
>>  	 * in the IBS_WAKE state, and the host needs to synchronize with it
>> +	 *
>> +	 * clear memcoredump_flag to ensure next submission of coredump date.
> 
> "Since the bluetooth chip has been reset, clear the memdump state"
> 
> Konrad
> 

I will update.

>>  	 */
>>  	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>>  		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>>  		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>> +		qca->memdump_state = QCA_MEMDUMP_IDLE;
>>  		msleep(50);
>>  	}
>>  

BR,
Shuai


