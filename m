Return-Path: <linux-arm-msm+bounces-2698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 113307FEDA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 12:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF803281D82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 11:15:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A46F3C094;
	Thu, 30 Nov 2023 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hFy8T9d0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632E510D9;
	Thu, 30 Nov 2023 03:15:53 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AUAwMK5028247;
	Thu, 30 Nov 2023 11:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UCchgxk+aOjoKo5oPkKV27FHvQof4ATdkKGQOfFNAjI=;
 b=hFy8T9d0tztjQBefR7ESdWDIbznkOygVzWCl8TQ+bsGX59JHjDuWP0mjMxYmMQ+4FzA+
 3gkqs3KdlzdIzMdEFHHBf2917rBqOdzSsPuwIfhzE/Mqy/6bPsQg58CUvGt6udVKbWwM
 RFlZjELMWo4D5SCEVU93udOoPFqGoUKKGK/szTxgTi+G5l+QglB/BrUndjQw+OEWn/D4
 hanL0JOWIOitItUopKT7VDQJ/ysazJrBY+KTyh4mg4njdgQ0fwSaLzOclH+YWUSF5c/q
 9rwV3DfNXlwz2DROEQtnz5Z5VSJsbg8zyC0hZa90wct3KIgjtvpCaaEFSuQJV5nEVzea zQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3up5e8u557-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 11:15:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AUBFnhS020997
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 11:15:49 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 30 Nov
 2023 03:15:46 -0800
Message-ID: <591e1aca-20ca-4d42-809d-12cd12ddadb3@quicinc.com>
Date: Thu, 30 Nov 2023 19:15:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] arm64: dts: qcom: msm8996: Fix 'in-ports' is a
 required property
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>
References: <20231129143815.7892-1-quic_jinlmao@quicinc.com>
 <20231129143815.7892-2-quic_jinlmao@quicinc.com>
 <3527d540-3e3f-4edb-b5f2-6ac481132c06@linaro.org>
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <3527d540-3e3f-4edb-b5f2-6ac481132c06@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mqyFt7FAdP1NBfbr0X_ak4x6n_WbNSaP
X-Proofpoint-ORIG-GUID: mqyFt7FAdP1NBfbr0X_ak4x6n_WbNSaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_09,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 mlxlogscore=675 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300084



On 11/30/2023 4:55 PM, Krzysztof Kozlowski wrote:
> On 29/11/2023 15:38, Mao Jinlong wrote:
>> The inport of funnel@3023000 connects to a source which is not supported
>> in current linux kernel. Remove the device tree node of funnel@3023000
>> to fix the warning. It will be added once the driver support to the
>> source is added to linux kernel.
> 
> Thanks for the changes, but that's not correct reason to remove DTS
> code. What kernel supports or not, should be irrelevant for the DTS. DTS
> for example is used in other projects - did you check if they have the
> same issues? Anyway, DTS describes the hardware, so how current kernel
> support defines what is and what is not in the hardware?
> 
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

The funnel dt node must have in-ports node. It is to describe the input
connection of funnel HW. But there is no dt_binding doc to describe the
DT node of the HW connected to funnel@3023000. So remove the funnel to 
solve the warning as of now. The funnel will be added back once driver 
and dt_binding are added for the HW.

Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml

Thanks
Jinlong Mao
> 

