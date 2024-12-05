Return-Path: <linux-arm-msm+bounces-40461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC009E50C8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 10:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99E1328A3FF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 09:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E051D6DA1;
	Thu,  5 Dec 2024 09:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bN72+Tyh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6E01D4612;
	Thu,  5 Dec 2024 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389636; cv=none; b=itt1IoVRTt0FFrXK09tM7Cl3QTWGobBdnJZP6hYlSw4DDR4nBHXNcp8Zcohh0Gx2jT05JTrvHMdEx9RuCxAFN2nX9g5kuV86Fz/1ke9bEjuHz9pz9rX9l/jWNWPQbmJSpfG0fzOKii+WoqP4qy/wxnWpPOXYty4BVHSmTz9JL6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389636; c=relaxed/simple;
	bh=nE77Wg4jQmbgH1FyqpDom/K68xAae7u3QqoGe9BgpdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Lu7mDnOArFMKbgSpMKtNDQ4T+GGwOvSvMmuT39bRHqn8WTXvQl8N4O9kCqfZhQkMjwyWknebvb7eySyMPM6jLex7MAK/hA3ingSjOBZUqZZb1GLEEVKjrtgdESgvMOtj7tjDIEsfWu91z2tW5btLLWjchrGFjHy/8ByoRda61AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bN72+Tyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B58QViG024061;
	Thu, 5 Dec 2024 09:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S4eKhCdjX3tF5z4iDGjjU2obSt2bCiCiSvJDlcwgsNg=; b=bN72+TyhEcZ5E50c
	jhNVOFRCdw6HYad4yiklgIHJCY4KIk7w8qFNjRwdp/cn2zBlQxPqEN7zK9RlHBii
	+ko/PjrRe3V+KiOF2vfLxhH6s0+Y3xyUQundzHa5FBPymF6YcZaBIGRgtNHlzcmH
	jtJkhIYAMec/lBK+425Ol/f1TR+BF7YV5aZ65rq9xwww0g71U8A6Qirdxvgtcg0H
	iiNgljVcpBVUaE87LY/XjDHXnQHKKJ+0PIDPuqCf/5aLNc0A63QDevyStV36uY51
	hsYidWfCha88njVZCSDXShu4fbMIlIhE1/aKwsKnJsg/t5sqBz2vDm7cwCG70QqC
	O3ajpw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnyxxh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Dec 2024 09:07:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B5978O8022729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Dec 2024 09:07:08 GMT
Received: from [10.50.18.22] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 5 Dec 2024
 01:07:06 -0800
Message-ID: <73312ce2-753d-4790-8b90-515d3c429c47@quicinc.com>
Date: Thu, 5 Dec 2024 14:37:03 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] mailbox: tmelite-qmp: Introduce QCOM TMEL QMP
 mailbox driver
To: Krzysztof Kozlowski <krzk@kernel.org>, <jassisinghbrar@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20241205080633.2623142-1-quic_srichara@quicinc.com>
 <20241205080633.2623142-3-quic_srichara@quicinc.com>
 <06b48a7f-de53-4b53-b3ac-be9efcee5558@kernel.org>
Content-Language: en-US
From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
In-Reply-To: <06b48a7f-de53-4b53-b3ac-be9efcee5558@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cEYYaBo0XnhmcPj-iucv4Srli1uY8WK7
X-Proofpoint-GUID: cEYYaBo0XnhmcPj-iucv4Srli1uY8WK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050064



On 12/5/2024 1:44 PM, Krzysztof Kozlowski wrote:
> On 05/12/2024 09:06, Sricharan R wrote:
>> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
>>
>> The QMP mailbox is the primary means of communication between TME-L SS
>> and other subsystem on the SoC. A dedicated pair of inbound and outbound
>> mailboxes is implemented for each subsystem/external execution environment
>> which needs to communicate with TME-L for security services. The inbound
>> mailboxes are used to send IPC requests to TME-L, which are then processed
>> by TME-L firmware and accordingly the responses are sent to the requestor
>> via outbound mailboxes.
>>
>> It is an IPC transport protocol which is light weight and supports
>> a subset of API's. It handles link initialization, negotiation,
>> establishment and communication across client(APPSS/BTSS/AUDIOSS)
>> and server(TME-L SS).
>>
>>     -----------------------------------------------       ---------------------------------------------------
>>    |                                              |       |                                                 |
>>    |                 SOC  CLIENT                  | SOC   |                TME-L  SS                        |
>>    |                                              | AHB   |                                                 |
>>    |     ----------    ---------   ---------      |       | ------    -------     --------    ------------  |
>>    |     |        |    |       |   |       |      | WO    | |     | R |     |     |      |    |SERVICES   | |
>>    |     | APPS   |<-->| TMEL  |<->|       |------------->| | IN  |-->|     |     | TMEL |    |--------   | |
>>    |     |        |    | COM   |   | QMP   |      | RO    | |     | W | QMP |<--->| COM  |<-->| a) ATTEST | |
>>    |     |        |    |       |   |       |<-------------| | OUT |<--|     |     |      |    | b) CRYPTO | |
>>    |     |        |    |       |   |       |      |       | |     |   |     |     |      |    | .. more   | |
>>    |     ---------     ---------   ---------      |       | ------    -------     -------     ------------  |
>>    |                                              |       |                                                 |
>>     -----------------------------------------------       --------------------------------------------------
> 
> 
> Hardware description is much more suitable for the binding, not to the
> driver. You wrote the same in cover letter and here... but not in actual
> hardware description - binding.
> 
ok, will fix and add to the binding doc.

>>
>> TME-L SS provides different kinds of services like secureboot, remote image authentication,
>> key management, crypto, OEM provisioning etc. This patch adds support for remote image
>> authentication. Support for rest of the services can be added.
> 
> 
> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
> 
ok will fix.

>>
>> Remote proc driver subscribes to this mailbox and uses the mbox_send_message to use
>> TME-L to securely authenticate/teardown the images.
>>
>> The intention of posting this is to get the design reviewed/corrected since there are also
>> other possible ways of having this SS support.
> 
> 
> If you do not Cc maintainers, don't expect much answer. Missing Qcom amd
> remoteproc maintainers.
> 
> 
ho ok, added all from get_maintainers.pl, but since its new file not
sure if everyone is listed. Will ensure to CC others as well.

Regards,
  Sricharan

