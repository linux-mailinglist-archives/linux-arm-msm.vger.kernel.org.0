Return-Path: <linux-arm-msm+bounces-34693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A2C9A1A16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 07:19:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 155BC1F26CD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 05:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F8507580C;
	Thu, 17 Oct 2024 05:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fsGcO1wy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6E421E3C1;
	Thu, 17 Oct 2024 05:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729142341; cv=none; b=BRLE3TdlzK8H/GOQso02rfh0lgDzZOjGkpLco3vyezx2WTVnf4cMnEfm9Fz2lwMFztJbtwfGDB8Br426ku4W4yyj+ZjkEmOLSJ5X4v0l0QgW3jckQ7XxPT8UiZQOrDnylbjtIUcVBxF88/NqBn9wcGLQI7BkcuVcc4rjEOVrfVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729142341; c=relaxed/simple;
	bh=TuQRiqF9k/AH7Q8hFTYN4orBdMYxKFCqWIPeB9w8pSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=E5SKMbQGaDtQWOkvMYpfyiMhQNDqbY4FRBpjSAHYvg+b6GQFerYTChQ4h1tYRAI4aj4ehE14ty8e7WE15nkQAEQD2PROnUlvWBGV0IvHBOZa7eIPeXIw7zgrfmbXI/IpW2bCCsLBbrQ7soj+LAvs23Ar0OIz10JVd+r7pBqbxuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fsGcO1wy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GGhivx002349;
	Thu, 17 Oct 2024 05:18:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3UU2Q8AxXEd/LLE/ZWfsYFcgd4DEBPjdeTHrnLciEY4=; b=fsGcO1wyaLUr0rcA
	n3qL15vfocS7sec2iU2EwbX0T9BPLC2yvJnbZeN7XIdQpPGjSci3CClhhuKlbDIx
	dNn9w1/WMclmU6GB2dDTIi7CcCJ8ECIloIgCXndScbIVxy9SEQN8byCWjcx826f6
	Qu7iIfoANFuP1yJDsTnbZziwI40+M4xDEXzWfAyoR+ZHU3qAx3YxLwjyn3k2xVPa
	vvtgdWCOqPtnEopbrIkdDzJgHCZQOvCj77g/U6prQdf/J3bi3E7CnNQ07rlwWVve
	uEprZtWPNiOWOC6SPHFo/ozmxwTFbBrIUYOE9VuXQDxSJNr64gUfy/N9Seb/6mbx
	9btGdA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xykux4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 05:18:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H5Ink5030081
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 05:18:49 GMT
Received: from [10.214.67.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 22:18:46 -0700
Message-ID: <7bf56716-886d-4e2c-9a90-e31b0bfa4a89@quicinc.com>
Date: Thu, 17 Oct 2024 10:48:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mailbox: qcom,cpucp-mbox: Add sc7280
 cpucp mailbox instance
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Herring <robh@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>,
        "Jassi Brar" <jassisinghbrar@gmail.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Ramakrishna Gottimukkula"
	<quic_rgottimu@quicinc.com>
References: <20240924050941.1251485-1-quic_kshivnan@quicinc.com>
 <20240924050941.1251485-2-quic_kshivnan@quicinc.com>
 <20240924232526.GA563039-robh@kernel.org>
 <2d4e47fd-0aaf-4533-a96f-95ada853d9a0@quicinc.com>
 <kzlhhovfffvg227oxbpl3nv6q2lyn53pz2fyqis22brkd4bkkz@vqprudcdfunb>
Content-Language: en-US
From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
In-Reply-To: <kzlhhovfffvg227oxbpl3nv6q2lyn53pz2fyqis22brkd4bkkz@vqprudcdfunb>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AjP0Rs-BfMjWDqorJ5-ssnVIzvAZl_NY
X-Proofpoint-ORIG-GUID: AjP0Rs-BfMjWDqorJ5-ssnVIzvAZl_NY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170033

Thanks Dmitry for reviewing the patch

On 10/6/2024 10:41 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 03, 2024 at 11:13:02AM GMT, Shivnandan Kumar wrote:
>> thanks Rob for reviewing this patch.
>>
>>
>> On 9/25/2024 4:55 AM, Rob Herring wrote:
>>> On Tue, Sep 24, 2024 at 10:39:39AM +0530, Shivnandan Kumar wrote:
>>>> sc7280 has a cpucp mailbox. Document them.
>>>
>>> And is different from the existing device how?
>>
>> It is different with respect to the register placement.
> 
> Register placement in the global map or the internal register structure?

the register placement varies both internally and globally as well.

> 
>>
>> Thanks,
>> Shivnandan
>>
>>>
>>>>
>>>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>>> ---
>>>>    .../devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml         | 5 +++--
>>>>    1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
>>>> index f7342d04beec..4a7ea072a3c1 100644
>>>> --- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
>>>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
>>>> @@ -15,8 +15,9 @@ description:
>>>>
>>>>    properties:
>>>>      compatible:
>>>> -    items:
>>>> -      - const: qcom,x1e80100-cpucp-mbox
>>>> +    enum:
>>>> +      - qcom,x1e80100-cpucp-mbox
>>>> +      - qcom,sc7280-cpucp-mbox
>>>>
>>>>      reg:
>>>>        items:
>>>> --
>>>> 2.25.1
>>>>
> 

