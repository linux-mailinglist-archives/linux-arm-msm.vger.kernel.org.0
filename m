Return-Path: <linux-arm-msm+bounces-20067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBFA8C9D0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 14:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08505282568
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 12:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F3A353E1A;
	Mon, 20 May 2024 12:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DbXJFNB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783D452F74;
	Mon, 20 May 2024 12:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716207562; cv=none; b=LGiCQ8AJM9bA3OoRts4OC61SWXGCjusq7rqlVoNfv7vJ3/vd1G1eSy5exPwt6KIxDEFBEEIDXXEbXpAISBI5Ybj3un+P/kqZyANBmkuoPgdoAksSRJGo1Jx4qngoM/38R8T47SWdaZIcoYNC8feWrJQybI5/r+atqwp0HqLnzrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716207562; c=relaxed/simple;
	bh=D410+6pWdx9JqhyYG8MLNmeKDqTQGDaLv0VbhWAv/Kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=dn2efjXBzxEWr2EabcCzcCka28quwbahP3fDFycs/nPbYH8HFnxl5Nk/dQpFjlnOScnI2IO530XEOGtoDOxpSilOWlsqHawU58gQflfybeGWEf/2vVmuaXXTitowZ+ZjIngDtlas7SA6Aybw/FH7h1IKVni+uMlTgCahR063s5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DbXJFNB2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44K0v6ub007480;
	Mon, 20 May 2024 12:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5q3G3ghBpvp/fL41NIdzDrzlOBNV41F9L6d5JbyyIbI=; b=Db
	XJFNB20OFaw5Ka2dkSw7ki2cZap4xEQP7QfrqvCKq009gW0rAMvc5w98zKkBYXub
	FdxU7a2gmTmlq+2CKkGbZZmnW6Ds8sS8WjJUmaQoKAozTctWuBw32pe4kctciYSU
	C7jXqxi9hg6emkdxw2b0n5qf+u/tEsqu95pdJLG82vWQ8XqO54QkR99Rx1rl4j22
	u78j5e5XbE9Cl7XKbDvwh9sG3UrVk660eJxcraBzuu8O65bOyVEkRLCOPtzv2Eq8
	on85bl/tuGaBPTVzljiCOBqEDl2P/zm91RMjUWKIwm3/788slEe3U1c5V4uN/5f1
	FHN6Y/5/G++eNCPUwp2Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4gbatq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 12:19:13 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KCJBoT011344
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 12:19:11 GMT
Received: from [10.214.67.128] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 05:19:07 -0700
Message-ID: <4bd22d28-63d9-d700-2a0c-eb08ceb66a9c@quicinc.com>
Date: Mon, 20 May 2024 17:49:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] arm64: dts: qcom: qdu/qru1000-idp: Fix the voltage
 setting
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Melody Olvera <quic_molvera@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240514131038.28036-1-quic_kbajaj@quicinc.com>
 <45e0aee9-87d5-434f-8ffe-d3270def0f72@kernel.org>
 <1c214d8b-9c59-7266-4c80-4b548ad6c7f9@quicinc.com>
 <5c7409df-692c-4f22-aea6-56865e801a30@kernel.org>
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <5c7409df-692c-4f22-aea6-56865e801a30@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SrkH2OH6Woqmoyqe6ETTA8DW0o3WKso3
X-Proofpoint-ORIG-GUID: SrkH2OH6Woqmoyqe6ETTA8DW0o3WKso3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_05,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=903
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200102



On 5/17/2024 2:20 PM, Krzysztof Kozlowski wrote:
> On 16/05/2024 07:52, Komal Bajaj wrote:
>>
>>
>> On 5/14/2024 6:57 PM, Krzysztof Kozlowski wrote:
>>> On 14/05/2024 15:10, Komal Bajaj wrote:
>>>> Fixing the regulator voltages for qdu/qru1000 idp boards.
>>>> In particular -
>>>> - smps4 is 1.574V min and 2.04V max
>>>> - smps5 is 1.2V min and 1.4V max
>>>> - smps6 is 0.382V min and 1.12V max
>>>
>>> Wait, why? This looks, at least partially, you are changing from fixed
>>> voltage choice to full range, without clear explanation.
>>>
>>
>> When we started using one of these regulators for USB enablement as sent
>> in the patch series [1], we saw a sudden reboot.
>> After adding more debug logs, came to know the configuration for smps5
>> was incorrect.
>>
>> Therefore, cross verified the configurations for all the regulators and
>> got to know that these are incorrectly configured.
>> This fixes some manual errors introduced in the initial patch (mentioned
>> in fixes tag).
>>
>> [1]
>> https://lore.kernel.org/linux-arm-msm/20240502090326.21489-1-quic_kbajaj@quicinc.com/
> 
> All this should be explained in commit msg.

Got it. Will add all this info into the commit message of the next version.

Thanks
Komal

> 
> Best regards,
> Krzysztof
> 
> 

