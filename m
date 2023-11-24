Return-Path: <linux-arm-msm+bounces-1823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AF27F70FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 11:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4125AB20C07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 10:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF023182AC;
	Fri, 24 Nov 2023 10:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TeQWWyMf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AF1591;
	Fri, 24 Nov 2023 02:11:53 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AO6nseE009014;
	Fri, 24 Nov 2023 10:11:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=aLq/ovk4VH5cK5twhKpeS2jDdsQ5ce5PDq0X66lHvbQ=;
 b=TeQWWyMf+6OD8gDhKsPaVgDL4myFMK0Ze5ha7EB40//ta/mhh0xNcVpa/kLkqeyj15Ed
 PLBGi5g5uyEcU2JjVy6fkDnUhZNW4zDpXTPWZUTKsA/ZJxp1+7m9lGt4+wIKxf0GD10G
 pvkln5vpKEyYxreltMV7ES2cEq0LyaFgL9Zw+gIVRHFviy6izW8tCdeKR2QmATqL4XYk
 UpyDHzI0mH7cv9nYRPBJFfk/Iu6myQ3XaXUrXW9jaE76dqqoje38p0XTnYVbJyFI3oUn
 WuLNTE2+DpgOWb+lPuuvM2AHadxTMppLx87A3yxHj1mQq9fuvp7QBxcarn5uwdLkGKv4 xQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ujhh4ry1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 10:11:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AOABlNI026963
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 10:11:47 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 24 Nov
 2023 02:11:42 -0800
Message-ID: <e988d7ba-6fd5-46fd-a97e-ac5011b9f52b@quicinc.com>
Date: Fri, 24 Nov 2023 18:11:40 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/16] dt-bindings: arm: qcom: add SM8550 AIM300
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-2-quic_tengfan@quicinc.com>
 <519b89a2-550e-44a2-bff0-a6a86c50d073@linaro.org>
 <54b68923-f670-482b-b4a2-ff5f5c867a91@linaro.org>
 <7bf18b1e-463d-4030-99cd-4fcf2126fda2@quicinc.com>
 <4eb76d38-93b5-424b-adce-3cc296fa03fb@linaro.org>
 <6e399854-40a2-412b-8c41-4f9e6b17e38b@linaro.org>
 <35dba126-0a0c-4f27-8b49-39de4d2cb797@quicinc.com>
 <6221657b-0c01-44cf-817c-a54bd2cede07@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <6221657b-0c01-44cf-817c-a54bd2cede07@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: H-isuJjdGRioAkBfmeVBlV55Sb7r-d1H
X-Proofpoint-ORIG-GUID: H-isuJjdGRioAkBfmeVBlV55Sb7r-d1H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_15,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=548 priorityscore=1501 adultscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311240080



在 11/24/2023 3:47 PM, Krzysztof Kozlowski 写道:
> On 24/11/2023 03:31, Tengfei Fan wrote:
> 
>>>>> AIM (Artificial Intelligence Module). This hardware platform can be used
>>>>> to develop AI related software based on Qualcomm chipset. I also will
>>>>> update this message to patch commit message.
>>>>
>>>> Does "Module" means it is physical module?
>> Yes, AIM300 is a physical module.
>>
>>> Moreover, does it have anything specific that makes it different from
>>> a MTP/QRD/regular 8550 SoM?
>>> In general, you can develop AI software on any computer, there are no
>>> runtime checks for "AI" presence in the naming ;)
>>>
>>> Or is it perhaps like QRB5165N [1], a base soc with what seems to
>>> be a fat AI accelerator connected to it?
>>
>> AIM300 is something like C5165N SOM.
>> AIM300 Series is a highly optimized family of modules designed to
>> support AIoT applications, intergrated with qualcomm qcs8550 SOC inside.
>> The Module is mounted onto Qualcomm AIoT carrier board to support
>> verification, evaluation and development.
> 
> Then you send patches for wrong board. AIM is not a board.
Yes, I used AIM as board by mistake, AIM300 AIOT is board.
>>
>> In next patch series, AIM300 AIoT carrier board will be a DTS, AIM300
>> will be a DTSI, qcs8550 will be a DTSI.
> 
> 
> Best regards,
> Krzysztof
> 

-- 
Thx and BRs,
Tengfei Fan

