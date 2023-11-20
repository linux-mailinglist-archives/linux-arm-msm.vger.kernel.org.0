Return-Path: <linux-arm-msm+bounces-1095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5C67F0BFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 07:45:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D32E1C20818
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 06:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101D11FC1;
	Mon, 20 Nov 2023 06:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NTK/jv9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61B1A93;
	Sun, 19 Nov 2023 22:44:52 -0800 (PST)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK5FlLq002236;
	Mon, 20 Nov 2023 06:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=52n3NShLWxPeK0wdfYL0+ML4Qtd/FQ8knQbC+fewv7U=;
 b=NTK/jv9mhUlMdimIqjT00UhFpsH8g5C6SMS7WSvhBWrCUhu9hws+FaSeaEXnSz8fi5IY
 ec/V98aCd3+NatiCg2nE1Xec8AI3ZriXAqqFixh6mQK4rOMdMBAeCSw1V+hlhVoT1Yhm
 E/UYy2y3xhMf8GCmQuoQTpWs+DEYzAH0QO3/bvdQl1yQmNkD1X1xnqMS6scRigK35Y/P
 uL08beBn4FKyB9MUaMPjC2lRM83nKFxLyo/lzQ0V4bmLPs1wDhbO6m5C6fGwPlztbR7i
 R90/4KZt59o8Bpz3kSMshzFYdKg8d2H/KxYSW8rBwju0kwtx/Co0VcOttaPa8JInE+Gg Gw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uejmuucgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 06:44:30 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AK6iT6j032762
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 06:44:29 GMT
Received: from [10.79.43.91] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 19 Nov
 2023 22:44:21 -0800
Message-ID: <b01eb441-7d9d-9de3-06aa-ddbdf9b69c26@quicinc.com>
Date: Mon, 20 Nov 2023 12:14:18 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V2 1/5] dt-bindings: arm: cpus: Add qcom,oryon compatible
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <catalin.marinas@arm.com>,
        <ulf.hansson@linaro.org>, <agross@kernel.org>, <conor+dt@kernel.org>,
        <ayan.kumar.halder@amd.com>, <j@jannau.net>,
        <dmitry.baryshkov@linaro.org>, <nfraprado@collabora.com>,
        <m.szyprowski@samsung.com>, <u-kumar1@ti.com>, <peng.fan@nxp.com>,
        <lpieralisi@kernel.org>, <quic_rjendra@quicinc.com>,
        <abel.vesa@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_tsoni@quicinc.com>,
        <neil.armstrong@linaro.org>
References: <20231117113931.26660-1-quic_sibis@quicinc.com>
 <20231117113931.26660-2-quic_sibis@quicinc.com>
 <20231119155935.GA260100-robh@kernel.org>
From: Sibi Sankar <quic_sibis@quicinc.com>
In-Reply-To: <20231119155935.GA260100-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: non__AD1kar49yFjdzCPTHKE_ztBXgrH
X-Proofpoint-ORIG-GUID: non__AD1kar49yFjdzCPTHKE_ztBXgrH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_04,2023-11-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200042

Hey Rob,

Thanks for taking time to review the series.

On 11/19/23 21:29, Rob Herring wrote:
> On Fri, Nov 17, 2023 at 05:09:27PM +0530, Sibi Sankar wrote:
>> From: Rajendra Nayak <quic_rjendra@quicinc.com>
>>
>> These are the CPU cores in Qualcomm's X1E80100 SoC.
>>
>> Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
>> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
>> ---
>>
>> v2:
>> * Update the part number from sc8380xp to x1e80100.
>>
>>   Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
>> index ffd526363fda..cc5a21b47e26 100644
>> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
>> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
>> @@ -198,6 +198,7 @@ properties:
>>         - qcom,kryo660
>>         - qcom,kryo685
>>         - qcom,kryo780
>> +      - qcom,oryon
> 
> Wasn't it previously said 'oryon' is not specific enough?
> 
> Also, please describe what oryon is in the commit msg.

ack. Will add more details in the next re-spin.

-Sibi

> 
> Rob

