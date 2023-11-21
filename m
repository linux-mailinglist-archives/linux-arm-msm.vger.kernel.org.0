Return-Path: <linux-arm-msm+bounces-1263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B50B7F2298
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 01:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 270B328118A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 00:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F244DEA1;
	Tue, 21 Nov 2023 00:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lV7Jcqam"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A7D91;
	Mon, 20 Nov 2023 16:54:26 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL0FEED002329;
	Tue, 21 Nov 2023 00:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9nD/IbZNJSxe5mq6BvwZGaIHYHAzxhHzD2ofqfRnC0s=;
 b=lV7JcqamyHonmkif4cIwV2oORR+sRHjvSBhe0NnR2K3coYTKIbuGwHwv+xZ4zAq+Eo5G
 Ka0IdQ/x9RHxe3vx6R3lAQNLhQjfL+v0o443KxvgXkYvZjcT+adPEYSjiu1O4pA0Gu8r
 rV4AwWkUVAzRNqre0SpqVA07hWa/+oVLUGtOg6v+RRvy6OxGz9qX5cjW219DgMx9TTgN
 PoxoUPZuLOcpujBUObwadbaEE56+5AKXAMUnzrvnd7OLZTi8B4pA+es1xRpYIW1WtHYM
 PR+UKCrMkHRndPmCUh1SMbCzKIJO2CcEPSflCC8vx7OqtEwLGvaBFUub2w6+wrEvnyM0 +g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug34u27b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:54:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL0sI4N022737
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:54:18 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 16:54:13 -0800
Message-ID: <e072236f-d74e-4527-9247-cc7163b60bdd@quicinc.com>
Date: Tue, 21 Nov 2023 08:54:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] arm64: dts: qcom: sm8550-aim300: add WCD9385
 audio-codec
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, <agross@kernel.org>,
        <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>
References: <20231117101817.4401-1-quic_tengfan@quicinc.com>
 <20231117101817.4401-9-quic_tengfan@quicinc.com>
 <3e013534-f6c6-48e9-9cfa-82055fe04f7a@linaro.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <3e013534-f6c6-48e9-9cfa-82055fe04f7a@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ff6S38F6s66loeB54FwIKDq1JeS3h8Zp
X-Proofpoint-GUID: Ff6S38F6s66loeB54FwIKDq1JeS3h8Zp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=414 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210002



在 11/17/2023 6:31 PM, Krzysztof Kozlowski 写道:
> On 17/11/2023 11:18, Tengfei Fan wrote:
>> Add Qualcomm Aqstic WCD9385 audio codec on two Soundwire interfaces: RX
>> and TX.
>>
>> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> 
> You just added this board. Does it mean you added incomplete and wrong DTS?
> 
> Best regards,
> Krzysztof
> 

Hi Krzysztof,
In next version patch series, I will do a board patch which contain all 
the functions which were splited in current patch series.

-- 
Thx and BRs,
Tengfei Fan

