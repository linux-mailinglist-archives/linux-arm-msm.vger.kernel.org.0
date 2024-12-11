Return-Path: <linux-arm-msm+bounces-41457-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B629EC958
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 10:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56B151887C6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE471A841F;
	Wed, 11 Dec 2024 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XvHAG5d7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7171A83FE;
	Wed, 11 Dec 2024 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733910003; cv=none; b=adp/XAFTxl3/msGX9DCNUEREKpInU9A8Jgx3aOqYjvzvba0e0ekYWDAWHDaJAbGjR/G+SlIrlUyq/1secFSdSh7as3RNRTTIPSyHGQ2bHwhP0+PJtiUbDQrRFal4fbv3J3i6cJru2a4J08WEUd+j8fDvin/KiCfKdfzgs54iMKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733910003; c=relaxed/simple;
	bh=mHQ+ad39TvGwZRHDCEPD0kzUEV03xj3+IaU03Zrdm/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=UuXE9Vjl1dlPQ5MV685/0dyH/0CwBwvRBC/iTjVYjc31CqIZGU8PDZeKjSLcfI1iRLY4VTxYd/Hd1OwFpDm5ez4axAt8wREd6ydYcIHVECzp0zfI+Tvu8CvP4W0WxtIHhwJi825suN5DyZzMQOw/kPImSHcGpwjbgys8TXqgppQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XvHAG5d7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB42jbs029986;
	Wed, 11 Dec 2024 09:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Ka+weawCvsnlrfXVb4OAOsW+ZIREokDJZdciu4q1R8=; b=XvHAG5d7IO1Ste2N
	3CcCL3IQn75FQIkaZaZNPBfAu12L6rWkviwZy8ZggU0YzccYuO++1L5f9iqNMNVC
	sX/a6KJjYEM+FyQkMvMJTL9c3h8KyYV42qIiFUc4o+nfn0557l2DYFxteqx7hpAA
	Qdh8jrMpB+KmxlwIFbBefAXcKBehQqp8GtzNw//cC4PsTFWRomLMJHmYI4w0uY+/
	Ek6xbmi2yxcPF4vaLcjPb/VEyjzJ+tu6QUJTMUby3V1nygcew5uASpZlj86xJUAG
	R5Innn15mc5GormbsZWwSUkZOtJVtxJcSbyS+G/vDfjbw2Th0uFsmNHtfoAhRd6V
	KB3r4w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eqr32uh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:39:56 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB9dtFD013485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 09:39:55 GMT
Received: from [10.231.216.175] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 01:39:49 -0800
Message-ID: <62afbaea-67b1-4572-9e78-d1dbe5fae20a@quicinc.com>
Date: Wed, 11 Dec 2024 17:39:47 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] dt-bindings: net: bluetooth: qca: Expand
 firmware-name property
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>,
        <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_jiaymao@quicinc.com>, <quic_shuaz@quicinc.com>,
        <quic_zijuhu@quicinc.com>, <quic_mohamull@quicinc.com>
References: <20241210151636.2474809-1-quic_chejiang@quicinc.com>
 <20241210151636.2474809-2-quic_chejiang@quicinc.com>
 <vbwg7djb4me6i4ow2q74ltqjxvkxeulhzyq4n6ak7aifhtf36f@x66pjje2iu6u>
Content-Language: en-US
From: "Cheng Jiang (IOE)" <quic_chejiang@quicinc.com>
In-Reply-To: <vbwg7djb4me6i4ow2q74ltqjxvkxeulhzyq4n6ak7aifhtf36f@x66pjje2iu6u>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 52UO7AVT3UtDZNe9f-x84-hwdxQ55qum
X-Proofpoint-GUID: 52UO7AVT3UtDZNe9f-x84-hwdxQ55qum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 mlxscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110072

Hi Krzysztof,

On 12/11/2024 4:53 PM, Krzysztof Kozlowski wrote:
> On Tue, Dec 10, 2024 at 11:16:33PM +0800, Cheng Jiang wrote:
>> Expand the firmware-name property to specify the names of NVM and
>> rampatch firmware to load. This update will support loading specific
>> firmware (nvm and rampatch) for certain chips, like the QCA6698
>> Bluetooth chip, which shares the same IP core as the WCN6855 but has
>> different RF components and RAM sizes, requiring new firmware files.
>>
>> We might use different connectivity boards on the same platform. For
>> example, QCA6698-based boards can support either a two-antenna or
>> three-antenna solution, both of which work on the sa8775p-ride platform.
>> Due to differences in connectivity boards and variations in RF
>> performance from different foundries, different NVM configurations are
>> used based on the board ID.
>>
>> So In firmware-name, if the NVM file has an extension, the NVM file will
>> be used. Otherwise, the system will first try the .bNN (board ID) file,
>> and if that fails, it will fall back to the .bin file.
>>
>> Possible configurations:
>> firmware-name = "QCA6698/hpnv21.bin", "QCA6698/hpbtfw21.tlv";
>> firmware-name = "QCA6698/hpnv21", "QCA6698/hpbtfw21.tlv";
>> firmware-name = "QCA6698/hpnv21.bin";
>>
>> Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
>> ---
>>  .../bindings/net/bluetooth/qualcomm-bluetooth.yaml           | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> index 7bb68311c..2782d2325 100644
>> --- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> +++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
>> @@ -101,7 +101,10 @@ properties:
>>    max-speed: true
>>  
>>    firmware-name:
>> -    description: specify the name of nvm firmware to load
>> +    description:
>> +      If one item is present, specify the name of the NVM firmware to load.
>> +      If two items are present, the first item specifies the name of the NVM,
>> +      and the second specifies the name of the rampatch firmware to load.
> 
> Don't repeat constraints in free form text. Use proper constraints so
> you can validate your DTS. And then actually do validate your DTS...
> 
It seems unnecessary to add this description, so I will drop this change. Is that okay?

> Best regards,
> Krzysztof
> 


