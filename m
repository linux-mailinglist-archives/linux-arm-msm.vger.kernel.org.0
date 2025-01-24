Return-Path: <linux-arm-msm+bounces-46059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 910CAA1B383
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:33:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96967188F64F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 10:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8457021A94D;
	Fri, 24 Jan 2025 10:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FV4mq1NF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CC621A420;
	Fri, 24 Jan 2025 10:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737714777; cv=none; b=uf6OAcmhpCddf/PB2V3K/wWG2praAeUqbcXc/pTooCO3LOMBwZd5UkxSWwhwnaRofdSxML3rGxbjoL7YGh7NQnVSi0Nm16F6xqFrpGX7iZHA8KIBg2nliEVDrSbwZdt5HN2bTMlzpFm+RhHp5R5ZRzXN3UTy26XLx7BAOoBkH/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737714777; c=relaxed/simple;
	bh=Gw+FW90wT+FsoLJfE8jnNyCkgWThgT5TWbnOkWe1Q9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nLpR2/dnFsgUBFGmGxCNFb3mzQ1IKCzsVg5CAcYh3t0lmU1LtQKYxfHW3vw0exf0E2+D5803OPaHU3sIk4npRMA0H7CaI6ZzXNPKgI0l1ZFMaVdnrz8Zecz8xhSIQZVVlueI0kXfyNogI60f9Ilt6DEBGU4IZUPZ+lo39XgmRgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FV4mq1NF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O3Ik67027148;
	Fri, 24 Jan 2025 10:32:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dTOgkyZXYBE54vu4c7T4yg6QzDntK7NZ+4SPmF5gxng=; b=FV4mq1NFlm5YgJMJ
	ChGVCO63xoa7+pAwZZWkfPpGDGpV23kaTz4SkdVOqmZ6WUBnGigVDWasm/xts/J/
	AeRGL6+BGotXa5xOt6r7Xuc/Fxqx2YhXqZ2o127mimDSN+tGkBHe5FNg6MvnVZZW
	P6Vj8hjFVscl7MxTJo9ZSlZXGtRje+4mKA83Be0+Ccy9eQJFwzJvBLHa4hqi4Mt8
	HonYrNhc6vGrsT4A5Bwz9hhhWKDbvFyw1eSaASEYbR49y7+DDhp8alnrcNddkAiY
	p+6lSSq/M0Fr4z9qceeIS2bdOUndHDJPJp3DZ1CVIChFFo7iXGQUNwY4OhexTh6s
	ZRE6hg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c2uj91d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:32:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OAWpZL029766
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 10:32:51 GMT
Received: from [10.217.217.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 24 Jan
 2025 02:32:47 -0800
Message-ID: <449b7943-4161-4e78-a591-f01345b4f207@quicinc.com>
Date: Fri, 24 Jan 2025 16:02:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: qcom: Add compatible for
 QCM6490 boards
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
 <20240816-qcm6490-lpass-reset-v1-1-a11f33cad3c5@quicinc.com>
 <ac4eca9d-8a2c-49a3-86d8-0201d5078dde@kernel.org>
 <3e1594f5-7134-4210-a232-2fb1595d2166@quicinc.com>
 <1dec532c-b6b3-4c69-8f8f-21b3c45fcf3a@kernel.org>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <1dec532c-b6b3-4c69-8f8f-21b3c45fcf3a@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oJwM4QBZFlH0fZMCXZMPc3vxj5ChydTy
X-Proofpoint-GUID: oJwM4QBZFlH0fZMCXZMPc3vxj5ChydTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_04,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240076



On 9/16/2024 2:10 PM, Krzysztof Kozlowski wrote:
> On 13/09/2024 07:18, Taniya Das wrote:
>>
>>
>> On 8/17/2024 2:51 PM, Krzysztof Kozlowski wrote:
>>> On 16/08/2024 10:32, Taniya Das wrote:
>>>> Add the new QCM6490 compatible to support the reset functionality for
>>>> Low Power Audio subsystem.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>
>>> Subject is odd - I do not see here anything related to boards.
>>>
>>> Anyway, this is incomplete. Look at the rest of the binding - you did
>>> not update any part related to proper clock constraints.
>>>
>>
>> Not sure if I understand the concern, but I was of the opinion that I
>> have added a new compatible for QCM6490 board , but no new clock
>> constraint added.
>>
>>
>> I see a patch from you
>> https://lore.kernel.org/all/20240817094605.27185-1-krzysztof.kozlowski@linaro.org/
>> and I guess it fixes the constraints.
>>
> 
> Look at entire file. This is incomplete.
> 

Please accept apologies for taking longer than expected to respond on 
this thread.

Yes I think you meant something as below to be taken care as 
constraints, which I have overlooked in my earlier patch.


@@ -26,6 +26,7 @@ properties:

    compatible:
      enum:
+      - qcom,qcm6490-lpassaudiocc
        - qcom,sc7280-lpassaoncc
        - qcom,sc7280-lpassaudiocc
        - qcom,sc7280-lpasscorecc
@@ -125,6 +126,18 @@ allOf:

          reg:
            maxItems: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,qcm6490-lpassaudiocc
+
+    then:
+      properties:
+        reg:
+          items:
+            - description: lpass core cc register
+            - description: lpass audio csr register

> Best regards,
> Krzysztof

-- 
Thanks & Regards,
Taniya Das.


