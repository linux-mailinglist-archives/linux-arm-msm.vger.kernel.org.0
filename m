Return-Path: <linux-arm-msm+bounces-32989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C7D98E97A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 07:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A21D1C2216E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 05:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2311C39ACC;
	Thu,  3 Oct 2024 05:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F+72/OsT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98055224D1;
	Thu,  3 Oct 2024 05:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727934186; cv=none; b=ru/RwYEFSu/r3RxFuAZQ50UX18OUaGeiMRsZpYd310zVTqCuE5ddAxSnN+oi+DeDR2zFgZOlaPlA/x4gda5MB/+DaE4UuKKlYH+OOiaMEDH7WxWPOQlE4VEucMIfGa3jbM2VQmcZyMsoY6fdpn2d7e3KDgafK9JeuX7b5p79FYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727934186; c=relaxed/simple;
	bh=ZCE6079VdX9SwKZFymEoBWG2+W8JPsI3cu/3+Om22Ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=iLwqJMF/VKhxxnXxbxhBayNeHQsiVILDCmnbjnqD3MBzAzJMtqWOf1F6HEAZ9YRrZWMIrEkTmj6M1vDLcNzPkhC5+dFpfZeQTzmjf7HIHXHNnHI2kf6Ok/U4qeBVLtBj/4oiBuc6zPz9jsRhc4OUxiEavkDjszMic00MhHbvVXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F+72/OsT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4934WWdJ005009;
	Thu, 3 Oct 2024 05:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yaaSc9jz11H/Rjz/v1hraUpE6Uw1TcydrYROs6X5dQw=; b=F+72/OsTXbxKO1rs
	kSZY6fKzm4GcMo9MfSbJ8O2yzHvLEfjHelR3wrLt3Hp20NzBba4BkcBzprJc3Fd5
	yA1OxWN2GP/vCD1Q34MKQ1fJgBt9vBDpmc4zcf8p/eFi6nUbe5malSVD1qrQ4hoE
	d5WtNtLQwoM9pF5U6piDbEwidQ/0gJguL91cs+0B2YSToPOsRLjQz9aItMgwyKMV
	/y43xwFazYMfVD6IHneQHaO8Dcbsiu261Ba9O2W9V7BL/qkCkF23JDgWIJ0Vcazc
	N+s7Dklm97QknkczYfEFiwSpr88qJExwNftCzAMRXyJqqlezC4wBKaf5/igHGaDJ
	fgL7bw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vudgm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 05:43:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4935gwM9027356
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Oct 2024 05:42:58 GMT
Received: from [10.214.67.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 2 Oct 2024
 22:42:54 -0700
Message-ID: <257c4518-0d5e-48db-9266-1c68320f7ed1@quicinc.com>
Date: Thu, 3 Oct 2024 11:12:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: qcom,cpucp-mbox: Add sc7280
 cpucp mailbox instance
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Ramakrishna Gottimukkula
	<quic_rgottimu@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-2-quic_kshivnan@quicinc.com>
 <e88e0ed0-9833-418c-b454-5d8ae798f4a1@kernel.org>
Content-Language: en-US
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
In-Reply-To: <e88e0ed0-9833-418c-b454-5d8ae798f4a1@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y1RQFGXqizMWyjJ_y7kNdintQvBtb2nN
X-Proofpoint-ORIG-GUID: y1RQFGXqizMWyjJ_y7kNdintQvBtb2nN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410030038

Thanks Krzysztof for reviewing the patch.


On 9/25/2024 7:53 PM, Krzysztof Kozlowski wrote:
> On 24/09/2024 07:09, Shivnandan Kumar wrote:
>> sc7280 has a cpucp mailbox. Document them.
>>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> ---
>>   .../devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml         | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
>> index f7342d04beec..4a7ea072a3c1 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
>> @@ -15,8 +15,9 @@ description:
>>
>>   properties:
>>     compatible:
>> -    items:
>> -      - const: qcom,x1e80100-cpucp-mbox
>> +    enum:
>> +      - qcom,x1e80100-cpucp-mbox
>> +      - qcom,sc7280-cpucp-mbox
> 
> Keep alphabetical order.

ACK

> 
> Best regards,
> Krzysztof
> 

