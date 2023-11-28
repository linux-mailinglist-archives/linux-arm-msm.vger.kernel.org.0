Return-Path: <linux-arm-msm+bounces-2234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD707FB582
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 10:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C07D2B215DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 09:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7987F3FE5E;
	Tue, 28 Nov 2023 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TvPV2e5O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9826E1;
	Tue, 28 Nov 2023 01:19:36 -0800 (PST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AS4BIhO006171;
	Tue, 28 Nov 2023 09:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=7BcvtQ0HZFKwS99/IcmgO/OjeLrfYs6tVrBivrmKnAM=;
 b=TvPV2e5Ob0GFkkITj4nOXUtsKoY7WZNCF/pIza+wqeAbN3qTLOddPdXSgvhI+KutdzhG
 8613h3mfo/+DM1dx87V1LPKVHA7L1dmxgEnizBViyv2RxONXNaWzRL9tYyl8CHawtKJb
 5b0AClm5+3gI7YxG3sx10eKlKJKjpRqthQ4QyV7BKvujg5V49YRGrIO3yZE/vMo6PP51
 ayKfywJ9X20Gwf57AIGeFpZ+R2Wr9SA1TkVEiorRfWA5DK4gTZOLsoTmVtiTqIK6Y1hb
 4aqJRuE01P3iHCwJ9Z6HaZV9yTrCpgwkxHywqG1MkLJdnt9gmN1OpVmf5oH5YmVGKWrH cg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3un04bhqy0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 09:19:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AS9JTKM020843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Nov 2023 09:19:29 GMT
Received: from [10.218.41.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 28 Nov
 2023 01:19:22 -0800
Message-ID: <24fae40a-453b-b14c-923f-88758a246aa7@quicinc.com>
Date: Tue, 28 Nov 2023 14:49:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,qmp: Add PCIe
 qcom,refclk-always-on property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        "Kishon Vijay
 Abraham I" <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_vbadigan@quicinc.com>, <quic_ramkri@quicinc.com>,
        <quic_nitegupt@quicinc.com>, <quic_skananth@quicinc.com>,
        <quic_vpernami@quicinc.com>, <quic_parass@quicinc.com>
References: <20231127-refclk_always_on-v3-0-26d969fa8f1d@quicinc.com>
 <20231127-refclk_always_on-v3-1-26d969fa8f1d@quicinc.com>
 <78815f1b-7390-40de-8afd-ac71806f4051@linaro.org>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <78815f1b-7390-40de-8afd-ac71806f4051@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u8tJCKhYA5lhUjkKFGoRTkfPNXg5OIOt
X-Proofpoint-GUID: u8tJCKhYA5lhUjkKFGoRTkfPNXg5OIOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_08,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 mlxlogscore=961 bulkscore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280073


On 11/28/2023 2:26 PM, Krzysztof Kozlowski wrote:
> On 27/11/2023 13:13, Krishna chaitanya chundru wrote:
>> Document qcom,refclk-always-on property which is needed in some platforms
>> to supply refclk even in PCIe low power states.
>>
>> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
>> ---
>>   .../devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml        | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>> index 2c3d6553a7ba..c747c9f35795 100644
>> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
>> @@ -93,6 +93,13 @@ properties:
>>     "#phy-cells":
>>       const: 0
>>   
>> +  qcom,refclk-always-on:
>> +    type: boolean
>> +    description: In some platform where PCIe switch is connected, pcie switch due to some design
> You received a comment to use proper wrapping: 80. Please implement it.
I will update this.
>> +      limitation fails to propage clkreq signal to the host and due to that host will not send
>> +      refclk, which  results in linkdown in L1.2 or L1.1 exit initiated by EP.
>> +      This property if set keeps refclk always on even in Low power states.
> The property name suggests that's the state of hardware - refclk is
> always on. Description suggests you want to instruct OS to do something.
>
> Again, third time (once from Bjorn, once from Dmitry), rephrase property
> name and description to describe the hardware issue. I see description
> improved, but not the property name. Again in the end of description you

Both bjorn and Dmitry gave comments to change the description only, and 
not the property name,

correct if I am wrong.

> say what Linux should do. Bindings do not describe Linux OS.

I will remove the last line in the next patch.

- Krishna Chaitanya.

>
> Best regards,
> Krzysztof

