Return-Path: <linux-arm-msm+bounces-1250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891867F2225
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 01:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40EDD2827FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 00:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BBC1548E;
	Tue, 21 Nov 2023 00:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HsSkvAqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE4DB4;
	Mon, 20 Nov 2023 16:33:22 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKNat6k027776;
	Tue, 21 Nov 2023 00:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=23E6RSozGO5LHCmSwqsN3QvLbgG0v+0Mhqx8oP65KcA=;
 b=HsSkvAqDdTnjYKOYWdNJ9UBagBXq7k706WJjiTIhonDcQxwP3gg0iiDA7P/JIUHxrCiN
 ZuF7ehnGTU10SiZzgFcGcIJRds/C1tV+/FOHb2gBHZM8NxnbWRs0BxDqHpZuAk0GCzpD
 UAer/6I3mU7v9LFDV2nlbnfMsxpHeWHB/gpz+gKt17NzshMuqHdo6HrUFi9FmKjnb9F0
 yBhfCAOYQU1+1YfptaHsKG/3gIcQ70WU8ZuHeHwTrk1ztY9qLBgUaUjmGnakUYgMxGDT
 tFdhjiSwTYCxD9/82etOtJu8f5Nnf79oUCLvGYqLb+Js313m3reQODOnjm/qhUJbjS/J 9Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugge1852b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:33:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL0XF7I011022
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:33:15 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 16:33:13 -0800
Message-ID: <e020be7b-0ae3-402d-a2c7-85f98a98f946@quicinc.com>
Date: Tue, 21 Nov 2023 08:33:10 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/16] dt-bindings: interrupt-controller: qcom,pdc:
 document qcom,sm8550-pdc
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <-cc=kernel@quicinc.com>
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-3-quic_tengfan@quicinc.com>
 <4867e222-dd62-44cb-a642-0cb8e374d109@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <4867e222-dd62-44cb-a642-0cb8e374d109@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GZjV6b84yYEDBnKOYFcs0Ld-Zr-NpgOJ
X-Proofpoint-ORIG-GUID: GZjV6b84yYEDBnKOYFcs0Ld-Zr-NpgOJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=675 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210001



在 11/17/2023 6:23 PM, Krzysztof Kozlowski 写道:
> On 17/11/2023 11:18, Tengfei Fan wrote:
>> Add SM8550 PDC, already used in upstreamed DTS.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> Guys, stop sending the duplicates:
> 
> https://lore.kernel.org/lkml/20230127132558.1176730-1-abel.vesa@linaro.org/
> 
> 
> Best regards,
> Krzysztof
> 

Thanks Krzysztof remind kindly, I will check all the patches which may 
contain duplicates.

-- 
Thx and BRs,
Tengfei Fan

