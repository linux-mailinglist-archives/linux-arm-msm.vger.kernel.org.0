Return-Path: <linux-arm-msm+bounces-21485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C35B8D83DC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 15:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0513E1F22DD1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 13:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F089712D745;
	Mon,  3 Jun 2024 13:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="W1Fq/MEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6077384D10;
	Mon,  3 Jun 2024 13:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717421194; cv=none; b=c6GWzoVA6kSFWkN/Qav/NWDdt5YQCCqGQYfbHRBbR5KCxYGGBGd4rq0ZXrJC3mT2kndtbjmNoQW0B1nd04xZTPp9eL//Q9brg34g1DbBfls+Mw1rbZ8RYu0jLCnbjoZbxilKq9PHZIXN+cxcE+natl6HDUzWBT2K7oVLCbLssDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717421194; c=relaxed/simple;
	bh=WGK8e6et2Jc1PekWJ5Q/87WxJ0aFOpzIdbL1g64OCrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KHUkd+PkQkKonYTnyUQtO/pynwOHu8nHFmtOoyS45CbKEg1EH/KQIK3u2+Z6/Vv9CVJhLMGKVBfo25XBa8dVzL58XHB7O05K3oG56jjmhRH5JKzfsZGWQUW8N7sN690MiJXPFCEmXWJXapy5SREQlNVPz2vADlywomxr+yzECpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=W1Fq/MEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453CbsnW000360;
	Mon, 3 Jun 2024 13:26:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxrD1PBB/smpCbgN2RLudDCE7GpM9cWp7s3S21m9/4M=; b=W1Fq/MEo6LPXKptZ
	MUyKS8bTM/0FEZlDMizmEYcX8LUayP847qHw99yHsHyYezBxhDdj0Dqktn51w6i4
	exr0F5GkhVa1LBc/4rCZMNbtyR70aDkUZvxME7WXs4Q+hiuwPoao1Hx2dhfb9m71
	7yzABhEIGDK4hK4wWNPh9pMnXk1u42/VcV8r1F80pYlShnrG6uLJoqOJA3mfX7fo
	OoNmfb1EK30PeRUy5gQCwXvgPdyHGEckQCoBUxpQ3zB7Fpfep2ZfNW53usWQrWx/
	w6eK67DLh9sBSUiAwBjF86s3o0lbWh1HB5JXmtCBi2cppQhaCw+2BUGLNRcQwQ0t
	7ycMZw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw4bc0ae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 13:26:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 453DQQsT023911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Jun 2024 13:26:26 GMT
Received: from [10.216.21.127] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 3 Jun 2024
 06:26:20 -0700
Message-ID: <88b683c8-56c8-493c-8f22-832cd6d13279@quicinc.com>
Date: Mon, 3 Jun 2024 18:56:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 6/8] dt-bindings: clock: qcom: Add SM8650 camera clock
 controller
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
	<quic_imrashai@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-7-quic_jkona@quicinc.com>
 <9fdf4c46-a07e-4dfc-9992-4dd94d8dab5f@linaro.org>
Content-Language: en-US
From: Jagadeesh Kona <quic_jkona@quicinc.com>
In-Reply-To: <9fdf4c46-a07e-4dfc-9992-4dd94d8dab5f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2xrUARPnkj9-HyJSV7Zvj3_-ILPl18ru
X-Proofpoint-GUID: 2xrUARPnkj9-HyJSV7Zvj3_-ILPl18ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_08,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=979 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406030110



On 6/2/2024 8:56 PM, Krzysztof Kozlowski wrote:
> On 02/06/2024 13:44, Jagadeesh Kona wrote:
>> Add device tree bindings for the camera clock controller on
>> Qualcomm SM8650 platform.
>>
>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Acked-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../bindings/clock/qcom,sm8450-camcc.yaml     |   3 +
>>   include/dt-bindings/clock/qcom,sm8650-camcc.h | 195 ++++++++++++++++++
>>   2 files changed, 198 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/qcom,sm8650-camcc.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> index 645080b848f0..f58edfc10f4c 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
>> @@ -8,6 +8,7 @@ title: Qualcomm Camera Clock & Reset Controller on SM8450
>>   
>>   maintainers:
>>     - Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> +  - Jagadeesh Kona <quic_jkona@quicinc.com>
>>   
>>   description: |
>>     Qualcomm camera clock control module provides the clocks, resets and power
>> @@ -17,6 +18,7 @@ description: |
>>       include/dt-bindings/clock/qcom,sc8280xp-camcc.h
>>       include/dt-bindings/clock/qcom,sm8450-camcc.h
>>       include/dt-bindings/clock/qcom,sm8550-camcc.h
>> +    include/dt-bindings/clock/qcom,sm8650-camcc.h
>>       include/dt-bindings/clock/qcom,x1e80100-camcc.h
> 
> Just squash the other patch here or drop it completely.
> 
> Best regards,
> Krzysztof
> 

Sure, will squash it to this patch in next series.

Thanks,
Jagadeesh

