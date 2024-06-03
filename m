Return-Path: <linux-arm-msm+bounces-21487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D034D8D83E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 15:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F1563B23B80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 13:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8843512D74F;
	Mon,  3 Jun 2024 13:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YCb1gYAd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AC284D10;
	Mon,  3 Jun 2024 13:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421296; cv=none; b=tp9CwMB25JcnGbaqG9YE/u0Wj8jr4C34y2caIzPipC4oNQJ5TGIo1t0evN4DAIFPaw9ttZ85Yfro48FlGFwnTrLVhWMNXqbSlSqiLIRZ8hXCadjWfgTZUmK40NM/ehbymAyFUz6u6Ikdfsu8BCnvgnZyI7i9xHqWRzS1sx2JBrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421296; c=relaxed/simple;
	bh=hopZaNW6THUU0kGzx+qv1yvKEgvk1fx9ohd7IHxwW0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=btEiY4Q4riJeEXmyaKTFt9ghxYh/n4+MZ2/h7K4MHQBg7CPY744xYmxeAI7AzZnQ9HkeiYsw2AhjUbYmYFsg0uuLZFdjz8Z/iOP54TKZMZODxY09QyjvM0K8iRsu3aeusk9vSkHfb+c5940RHE1I/RBCe71OxejWG5UkApfHm8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YCb1gYAd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4539GwXm012816;
	Mon, 3 Jun 2024 13:28:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mQsziMV95FDqh/CfexkEtSqS0hGhcJBOZ0S+C5CH98=; b=YCb1gYAdTixRSRdP
	vK3fLgfrGRB1nTEd7bN/ZEbDHIzBoNqiQFzfuWQFWZ7mubmnu+xRurpc0A0TC8WU
	FN8OI7Ji9JCxQiGR0JZhbw4WHsDTwPPEJSS6C2GaNe4Z+/rISeTNwA+Xyn/LhMdc
	T6FBreKEluG97PH0aUnbfjCRP4DnCaACE68g5Sww+RtjdH6YGibD9FAYpZbe9v4B
	2qf0SjU4bU6uYQ+fHhOyK4WhBOhLhI0aRWKQfaBIUAUOLfWobhldbs/R6QG+Nyv3
	F6Czv/4rwx8oLu/6NGlmV050XJlU2kTJv32UaL3dKgdezE25wBc1hCu09de6L7Vg
	sObZjw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw6v46wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 13:28:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453DS9TP022870
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 13:28:09 GMT
Received: from [10.216.21.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 06:28:02 -0700
Message-ID: <016e545d-058b-42f0-8f86-fbaaa8a580fa@quicinc.com>
Date: Mon, 3 Jun 2024 18:57:59 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 1/8] dt-bindings: clock: qcom: Update SM8450 videocc
 header file name
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-2-quic_jkona@quicinc.com>
 <bf9fe3c1-6d62-4b7f-84ac-51c9829ea01d@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <bf9fe3c1-6d62-4b7f-84ac-51c9829ea01d@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Bg0CMBAcJeJfgRden1Q9bwZVhBdUm0vg
X-Proofpoint-ORIG-GUID: Bg0CMBAcJeJfgRden1Q9bwZVhBdUm0vg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_09,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 mlxlogscore=991 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406030112



On 6/2/2024 8:52 PM, Krzysztof Kozlowski wrote:
> On 02/06/2024 13:44, Jagadeesh Kona wrote:
>> Correct the videocc header file name in SM8450 videocc bindings.
>>
>> Fixes: 1e910b2ba0ed ("dt-bindings: clock: qcom: Add SM8450 video clock controller")
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml          | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> index bad8f019a8d3..b135aa2e9f06 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>> @@ -13,7 +13,7 @@ description: |
>>     Qualcomm video clock control module provides the clocks, resets and power
>>     domains on SM8450.
>>   
>> -  See also:: include/dt-bindings/clock/qcom,videocc-sm8450.h
>> +  See also: include/dt-bindings/clock/qcom,sm8450-videocc.h
> 
> One patch like this for all files.
> 
> Best regards,
> Krzysztof
> 

Yes will check and post it as a separate patch outside of this series.

Thanks,
Jagadeesh

