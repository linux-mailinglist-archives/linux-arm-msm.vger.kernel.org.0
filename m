Return-Path: <linux-arm-msm+bounces-1836-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 965CC7F72EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 12:40:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 377DCB21416
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 11:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D531EB52;
	Fri, 24 Nov 2023 11:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ET9l9D+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3D41A2;
	Fri, 24 Nov 2023 03:40:15 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AOB7X0R022990;
	Fri, 24 Nov 2023 11:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tDHSeIF8klwS9UwzqRebuF+OKf98KYwg7r/Vh86pzKk=;
 b=ET9l9D+iljpGXhn9t0Umx3d8FRi1HmXdgtnd+/5qwTmCHh6UgBujmAvi1r+Yu954kl0/
 jGqGldIXSPNxFxXoEwOiNj4Cf7Bp9jSLEGD571XrvGIXdP1u/tPe43tC34/jUUZ7OrF1
 qJNi9wckmKNHUClJsFgxKnlfkcgVPk64qLaGjVwiNia6Tn2hogIsqLsGWbvXrUp+/qQy
 H/kVEZZkEsr7uaBU1zg1tpga9vHLgS9xBe9qIIkvmA0NcqsucvyV1ENu+W8nKHN5xkxA
 mKKT6Qw201rFzGvAH1gDrtfjACzao5X8k+dY66Y7xwSyAYRz7wXMvgi/swwHzfjEpqLS NA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uj4hwjqyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 11:39:50 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AOBdnr3020020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 11:39:49 GMT
Received: from [10.216.4.251] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 24 Nov
 2023 03:39:38 -0800
Message-ID: <735075ee-1145-471e-9dac-9968b02ad35a@quicinc.com>
Date: Fri, 24 Nov 2023 17:09:34 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: qcom,ethqos: add
 binding doc for fault IRQ for sa8775p
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vinod Koul
	<vkoul@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        "Eric
 Dumazet" <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Rob Herring
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu
	<joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
CC: <kernel@quicinc.com>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
 <ff458955a24c0cb4ba41158b8b53fbef00c8237d.1700737841.git.quic_jsuraj@quicinc.com>
 <7c9135e0-da6e-4e1a-b673-af6c73d8ee45@linaro.org>
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
In-Reply-To: <7c9135e0-da6e-4e1a-b673-af6c73d8ee45@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FZYAK8yh1-fNezYLdyWhoJUEJupZisCK
X-Proofpoint-ORIG-GUID: FZYAK8yh1-fNezYLdyWhoJUEJupZisCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=814
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240090

hi Krzysztof,
Sure . Will take care of dtbs_check warnings in the next patch .

Thanks
Suraj

On 11/24/2023 1:48 PM, Krzysztof Kozlowski wrote:
> On 23/11/2023 12:38, Suraj Jaiswal wrote:
>> Add binding doc for fault IRQ. The fault IRQ will be
>> trigger for ECC,DPP,FSM error.
>>
>> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> index 7bdb412a0185..e013cb51fb07 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> @@ -37,12 +37,14 @@ properties:
>>      items:
>>        - description: Combined signal for various interrupt events
>>        - description: The interrupt that occurs when Rx exits the LPI state
>> +      - description: The interrupt that occurs when HW fault occurs
> 
> Adding required items is breaking the ABI and introducing new dtbs_check
> warnings. I don't see rationale for this in the commit msg.
> 
> I don't see any fixes for the warnings, either. I am quite picky on this
> part, so to avoid wasting my time - are you 100% sure you do not
> introduce any new warning?
> 
> Best regards,
> Krzysztof
> 

