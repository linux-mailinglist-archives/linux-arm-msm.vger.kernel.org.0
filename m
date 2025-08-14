Return-Path: <linux-arm-msm+bounces-69211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C044B264BB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 13:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34CE4188A284
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 11:52:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FEA22FABFD;
	Thu, 14 Aug 2025 11:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YmKTzD7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B491474CC;
	Thu, 14 Aug 2025 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755172346; cv=none; b=eiWSdp38d92VG98uHXI/ksmktthd95Lvj2YowwtvPRGrbPMF9ZD2eiJolV/50HxMldiXaZhmw3rFWVUIJzh3NdNRgOESnliOXjoOdNDLf8sPcOXaWPJ7fCimFR39eRww1x576u00UWA8rSchSOMcGQxzd6bHmlbqFQDbibCBjJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755172346; c=relaxed/simple;
	bh=CBheB/aLjGoWvzhqUtYS+oM1yo/Zl1uusGWGJB+0uaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=WrQ38w18wi3qw5OoTWEivPXfWKLU73s39tfVuWB4rqcF8EsA1GlQUAnU6A6TuhgQBaW7xZdzmvOL9O6FvAfDs74+AjWc6XJdWei3v+wJyw31Bo56XrbPdap9MohfroB1CNZ6Nqmy0EFR09csVSYX1ruCQ3R4nD2vE4i9MKEgeP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YmKTzD7Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9KRvB024302;
	Thu, 14 Aug 2025 11:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AYnPwwgIYGOI4+CCBVGAbP+V25mbkyghAdhvgafCXY=; b=YmKTzD7QukulwKgl
	TYs/jEml2yCD/CpNyGs7Ys4Uq74/YLNZocA/pKJZJtexmSr6xQ4oypNRC5C/TY+A
	SGENOiXGNFjXiD6VxTQyL7LX6hLFLyhUIpFUr4Iyj66XdkTlwcOxJIGpdd1cyrqE
	694KVi97KwbS3tm3Rq9hgKbpGapyjMq6Hyc7TaiwYzL95SCEsY2kPO1I+wBaoDMw
	WJLKhx12WLlMQ+ZOHyuix4CWuhkYUbeZyt1gLr1vptL9CdRCZl5hHtNDrvMUms/b
	IXFsLeICV/V9KOwNXmMb9fq7+T8lyOODUEzfH9IURrqZmPkjg5D7AD/cK5wA4Dz6
	TW4fQQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rv6yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 11:52:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EBqNV5019206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 11:52:23 GMT
Received: from [10.239.96.215] (10.80.80.8) by nasanex01a.na.qualcomm.com
 (10.52.223.231) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 14 Aug
 2025 04:52:21 -0700
Message-ID: <4e4e4f7a-fe7e-4df3-baca-240ddaf2cd05@quicinc.com>
Date: Thu, 14 Aug 2025 19:52:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] driver: bluetooth: hci_qca: SSR(SubSystem
 Restart)process failed due to tx_idle_timer timeout
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <linux-bluetooth@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: <quic_bt@quicinc.com>
References: <20250813033505.3868781-1-quic_shuaz@quicinc.com>
 <20250813033505.3868781-5-quic_shuaz@quicinc.com>
 <55bad41f-b483-4609-a85a-3f89c49ddfb5@oss.qualcomm.com>
Content-Language: en-US
From: Shuai Zhang <quic_shuaz@quicinc.com>
In-Reply-To: <55bad41f-b483-4609-a85a-3f89c49ddfb5@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX+2qn1Ckag6Tu
 I0PaMnU+qw2NYErdbTKHspQ+afnUcCENRqO288EY/rYE0na7dj+a+PraFXxXwrhsqbReR91iIcO
 Tsg9qKHciHPGOntklo4RxzbKZO1oQEhdYQjia1LWD4ULb3ZuFAwO0syVu2yB1X8fjmH+pFoUyf4
 I8B9/NsvIFGcl25UM/iCl+Ax72pOtQTJFVUMXmStsd5W94BeJmUL+YaZJQP6w3Wf2Wvg6L/As/n
 Vo+GHt9DgUriJfQNaU0SIZubSpJTJldak3p2mUXkWjxUZmV7/OLxQVTM8pAA65VR730j1lH+e71
 +JHRTVswcBptJYOTYXBrcXjMQZWUgPhY760HRnbPWJt529ZDkDJRjEh0FFwmcpemfKbv7HX3bBS
 mbAFRZF5
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689dcdf7 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8
 a=gGFNk95UK-4IUhg4JRUA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GAFcXNe221hsksb-T34lMt5reK2QnJI1
X-Proofpoint-GUID: GAFcXNe221hsksb-T34lMt5reK2QnJI1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

Dear,Konrad

On 8/13/2025 7:13 PM, Konrad Dybcio wrote:
> On 8/13/25 5:35 AM, Shuai Zhang wrote:
>> When the SSR (SubSystem Restart) duration exceeds 2 seconds, it triggers
>> host tx_idle_timeout, which sets host TX state to sleep. due to the
> 
> Host? Looks like we're sending a command to the BT chip and that
> triggers the issue

Since the firmware is not downloaded after ssR, the controller does not enter
the ibs_sleep state. If the host enters ibs_sleep, it will send a wake-up 
command before sending any other commands. 

However, the controller only processes IBS wake-up commands when it is already
in ibs_sleep. As a result, it will not respond to the host's wake-up command,
which prevents host from send actual command and leads to a send command timeout.

Therefore, the host must not enter the ibs_sleep state.

> 
>> hardware pulling up bt_en, the firmware is not downloaded after the SSR.
>> As a result, the controller does not enter sleep mode. Consequently,
>> when the host sends a command afterward, it sends 0xFD to the controller,
>> but the controller does not respond, leading to a command timeout.
>>
>> So reset tx_idle_timer after SSR to prevent host enter TX IBS_Sloeep mode.
>>
>> Signed-off-by: Shuai Zhang <quic_shuaz@quicinc.com>
>> ---
>>  drivers/bluetooth/hci_qca.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
>> index 33c2dd7b8..1fb8eea09 100644
>> --- a/drivers/bluetooth/hci_qca.c
>> +++ b/drivers/bluetooth/hci_qca.c
>> @@ -1668,6 +1668,15 @@ static void qca_hw_error(struct hci_dev *hdev, u8 code)
>>  	if (!test_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks)) {
>>  		clear_bit(QCA_SSR_TRIGGERED, &qca->flags);
>>  		clear_bit(QCA_IBS_DISABLED, &qca->flags);
>> +		/*
>> +		 * When the SSR (Sub-System Restart) duration exceeds 2 seconds,
> 
> This comment will become out of date quickly, refer to 'tx_idle_delay' instead
> 

i will update.

> Konrad
> 
>> +		 * it triggers host tx_idle_timeout, which sets host TX state
>> +		 * to sleep. Reset tx_idle_timer after SSR to prevent
>> +		 * host enter TX IBS_Sloeep mode.
>> +		 */
>> +		mod_timer(&qca->tx_idle_timer, jiffies +
>> +			  msecs_to_jiffies(qca->tx_idle_delay));
>> +
>>  		qca->tx_ibs_state = HCI_IBS_TX_AWAKE;
>>  		qca->memdump_state = QCA_MEMDUMP_IDLE;
>>  		msleep(50);

BR,
Shuai


